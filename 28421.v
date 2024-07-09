module spi_master
  #(parameter DATA_WIDTH=16,
    NUM_PORTS=1,
    CLK_DIVIDER_WIDTH=8
    )
  (input clk,
   input resetb,
   input CPOL,
   input CPHA,
   input half_cycle_n,
   input [CLK_DIVIDER_WIDTH-1:0] clk_divider,
   input go,
   input [(NUM_PORTS*DATA_WIDTH)-1:0] datai,
   output [(NUM_PORTS*DATA_WIDTH)-1:0] datao,
   output reg busy,
   output reg done,
   input [NUM_PORTS-1:0] dout,
   output [NUM_PORTS-1:0] din,
   output reg csb,
   output reg sclk
   );
   reg [NUM_PORTS-1:0] dout_s;
   reg  [CLK_DIVIDER_WIDTH-1:0]  clk_count;
   wire [CLK_DIVIDER_WIDTH-1:0]  next_clk_count = clk_count + 1;
   wire pulse = next_clk_count == (clk_divider >> 1);
   reg    state;
`ifdef verilator
   localparam LOG2_DATA_WIDTH = $clog2(DATA_WIDTH+1);
`else
   function integer log2;
      input integer value;
      integer       count;
      begin
         value = value-1;
         for (count=0; value>0; count=count+1)
           value = value>>1;
         log2=count;
      end
   endfunction
   localparam LOG2_DATA_WIDTH = log2(DATA_WIDTH+1);
`endif
   reg [LOG2_DATA_WIDTH:0] shift_count;
   wire start = shift_count == 0;
   /* verilator lint_off WIDTH */
   wire [31:0] stop_detect = ((half_cycle_n)+1)*DATA_WIDTH-1;
   wire stop  = shift_count >= stop_detect;
   /* verilator lint_on WIDTH */
   localparam IDLE_STATE = 0,
              RUN_STATE = 1;
   sro #(.DATA_WIDTH(DATA_WIDTH)) sro[NUM_PORTS-1:0]
     (.clk(clk),
      .resetb(resetb),
      .shift(pulse && !csb && (shift_count[0] == 0)),
      .dout(dout),
      .datao(datao));
   sri #(.DATA_WIDTH(DATA_WIDTH)) sri[NUM_PORTS-1:0]
     (.clk(clk),
      .resetb(resetb),
      .datai(half_cycle_n ? datai : {datai[DATA_WIDTH/2-1:0], {DATA_WIDTH/2{1'b0}}}),
      .sample(go && (state == IDLE_STATE)), // we condition on state so that if the user holds 'go' high, this will sample only at the start of the transfer
      .shift(pulse && !csb && (shift_count[0] == 1)),
      .din(din));
`ifdef SYNC_RESET
   always @(posedge clk) begin
`else
   always @(posedge clk or negedge resetb) begin
`endif
      if(!resetb) begin
         clk_count <= 0;
         shift_count <= 0;
         sclk  <= 1;
         csb   <= 1;
         state <= IDLE_STATE;
         busy  <= 0;
         done  <= 0;
      end else begin
         // generate the pulse train
         if(pulse) begin
            clk_count <= 0;
         end else begin
            clk_count <= next_clk_count;
         end
         // generate csb
         if(state == IDLE_STATE) begin
            csb  <= 1;
            shift_count <= 0;
            done <= 0;
            if(go && !busy) begin // the !busy condition here allows the user to hold go high and this will then run transactions back-to-back at maximum speed where busy drops at for at least one clock cycle but we stay in this idle state for two clock cycles. Staying in idle state for two cycles probably isn't a big deal since the serial clock is running slower anyway.
               state  <= RUN_STATE;
               busy   <= 1;
            end else begin
               busy   <= 0;
            end
         end else begin
            if(pulse) begin
               if(stop) begin
                  csb <= 1;
                  state <= IDLE_STATE;
                  done  <= 1;
               end else begin
                  csb <= 0;
                  if(!csb) begin
                     shift_count <= shift_count + 1;
                  end
               end
            end
         end
         // generate sclk
         if(pulse) begin
            if((CPHA==1 && state==RUN_STATE && !stop) ||
               (CPHA==0 && !csb)) begin
               sclk <= !sclk;
            end else begin
               sclk <= CPOL;
            end
         end
      end
   end
endmodule