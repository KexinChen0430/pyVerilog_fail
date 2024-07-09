module menc_sincos_tb();
wire c;
sim_clk #(125) clk_125(.clk(c));
reg [10:0] offset;
reg [10:0] menc;
wire [31:0] sin, cos;
menc_sincos dut(.*);
initial begin
  $dumpfile("menc_sincos.lxt");
  $dumpvars();
  offset = 11'h0;
  menc = 11'h50;
  $display("testing...");
  wait(c);
  wait(~c);
  #1000 $finish();
end
endmodule