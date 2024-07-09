module dpth_regfile (
  // Top level control signals
  input wire clk,
  // Input data
  input  wire [2:0]       rd_at,
  input  wire [2:0]       wr_at,
  input  wire             wr_en,
  input  wire [`REG_BITS] din,
  // Output data
  output wire [`REG_BITS] dout
);
  reg [`REG_BITS] data [2:0];
  always @(posedge clk)
  begin
    if (wr_en == 1'b1)
      data[wr_at] <= din;
  end
  assign dout = data[rd_at];
endmodule