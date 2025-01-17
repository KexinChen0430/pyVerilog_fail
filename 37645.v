module fifo_2x_reducer_27 (
         input rst,
         input clk,
         input clkx2,
         input [29:0] data_in,
         output reg [14:0] data_out
       );
localparam DATA_IN_SIZE = 5'h1e;
wire [1-1:0] M_fifo_full;
wire [30-1:0] M_fifo_dout;
wire [1-1:0] M_fifo_empty;
reg [30-1:0] M_fifo_din;
reg [1-1:0] M_fifo_wput;
reg [1-1:0] M_fifo_rget;
async_fifo_39 fifo (
                .wclk(clk),
                .rclk(clkx2),
                .wrst(rst),
                .rrst(rst),
                .din(M_fifo_din),
                .wput(M_fifo_wput),
                .rget(M_fifo_rget),
                .full(M_fifo_full),
                .dout(M_fifo_dout),
                .empty(M_fifo_empty)
              );
reg M_flag_d, M_flag_q = 1'h0;
reg [29:0] M_word_d, M_word_q = 1'h0;
always @* begin
  M_flag_d = M_flag_q;
  M_word_d = M_word_q;
  M_fifo_din = data_in;
  M_fifo_wput = 1'h1;
  M_fifo_rget = 1'h0;
  if (!M_flag_q && !M_fifo_empty) begin
    M_fifo_rget = 1'h1;
    M_flag_d = 1'h1;
    M_word_d = M_fifo_dout;
  end
  if (M_flag_q) begin
    M_flag_d = 1'h0;
  end
  data_out = !M_flag_q ? M_word_q[15+14-:15] : M_word_q[0+14-:15];
end
always @(posedge clkx2) begin
  M_flag_q <= M_flag_d;
  M_word_q <= M_word_d;
end
endmodule