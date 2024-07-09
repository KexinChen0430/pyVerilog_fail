module or a submodule
  output  reg         o_wbs_int,
  //output              o_wbs_int
  //Write Side
  input               i_write_enable,
  input       [63:0]  i_write_addr,
  input               i_write_addr_inc,
  input               i_write_addr_dec,
  output              o_write_finished,
  input       [23:0]  i_write_count,
  input               i_write_flush,
  output      [1:0]   o_write_ready,
  input       [1:0]   i_write_activate,
  output      [23:0]  o_write_size,
  input               i_write_strobe,
  input       [31:0]  i_write_data,
  //Read Side
  input               i_read_enable,
  input       [63:0]  i_read_addr,
  input               i_read_addr_inc,
  input               i_read_addr_dec,
  output              o_read_busy,
  output              o_read_error,
  input       [23:0]  i_read_count,
  input               i_read_flush,
  output              o_read_ready,
  input               i_read_activate,
  output      [23:0]  o_read_size,
  output      [31:0]  o_read_data,
  input               i_read_strobe
);
//Local Parameters
localparam            SLEEP_COUNT = 4;
//Local Registers/Wires
wire                        w_bram_wea;
reg   [BUFFER_WIDTH - 1:0]  r_bram_addr;
reg   [31:0]                r_bram_din;
wire  [31:0]                w_bram_dout;
reg   [3:0]                 ram_sleep;
//Submodules
hs_demo #(
  .BUFFER_WIDTH       (BUFFER_WIDTH     ),
  .FIFO_WIDTH         (7                )
) demo (
  .clk                (clk              ),
  .rst                (rst              ),
  .o_idle             (hs_demo_idle     ),
  //DEMO CODE START
  .i_bram_wea         (w_bram_wea       ),
  .i_bram_addr        (r_bram_addr      ),
  .i_bram_din         (r_bram_din       ),
  .o_bram_dout        (w_bram_dout      ),
  //DEMO CODE END
  //Write Side
  .i_write_enable     (i_write_enable   ),
  .i_write_addr       (i_write_addr     ),
  .i_write_addr_inc   (i_write_addr_inc ),
  .i_write_addr_dec   (i_write_addr_dec ),
  .o_write_finished   (o_write_finished ),
  .i_write_count      (i_write_count    ),
  .i_write_flush      (i_write_flush    ),
  .o_write_ready      (o_write_ready    ),
  .i_write_activate   (i_write_activate ),
  .o_write_size       (o_write_size     ),
  .i_write_strobe     (i_write_strobe   ),
  .i_write_data       (i_write_data     ),
  //Read Side
  .i_read_enable      (i_read_enable    ),
  .i_read_addr        (i_read_addr      ),
  .i_read_addr_inc    (i_read_addr_inc  ),
  .i_read_addr_dec    (i_read_addr_dec  ),
  .o_read_busy        (o_read_busy      ),
  .o_read_error       (o_read_error     ),
  .i_read_count       (i_read_count     ),
  .i_read_flush       (i_read_flush     ),
  .o_read_ready       (o_read_ready     ),
  .i_read_activate    (i_read_activate  ),
  .o_read_size        (o_read_size      ),
  .o_read_data        (o_read_data      ),
  .i_read_strobe      (i_read_strobe    )
);
//Asynchronous Logic
assign  w_bram_wea      = i_wbs_we;
//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat       <= 32'h0;
    o_wbs_ack       <= 0;
    o_wbs_int       <= 0;
    //Ram Specific
    ram_sleep       <= 0;
    r_bram_addr     <= 0;
    r_bram_din      <= 0;
  end
  else begin
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack && ~i_wbs_stb)begin
      o_wbs_ack     <= 0;
      ram_sleep     <= 0;
    end
    if (i_wbs_stb && i_wbs_cyc) begin
      //master is requesting somethign
      r_bram_addr <= i_wbs_adr[BUFFER_WIDTH - 1:0];
      if (!o_wbs_ack) begin
        if (i_wbs_we) begin
          //write request
          r_bram_din <= i_wbs_dat;
        end
        else begin
          //read request
          o_wbs_dat <= w_bram_dout;
        end
        if (ram_sleep < SLEEP_COUNT) begin
          ram_sleep   <=  ram_sleep + 1;
        end
        else begin
          o_wbs_ack <= 1;
        end
      end
    end
  end
end
endmodule