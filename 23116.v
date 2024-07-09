module div_tb();
reg [31:0] a, b;
wire [31:0] q;
reg start;
wire done;
wire c;
sim_clk #(125) clk_125(.clk(c));
div dut(.*);
initial begin
  $dumpfile("div.lxt");
  $dumpvars();
  start = 1'b0;
  a = 32'h3f80_0000; // 1.0
  b = 32'h3fcc_b55a; // 1.59928441047
  wait(~c);
  wait(c);
  start <= 1'b1;
  wait(~c);
  wait(c);
  start <= 1'b0;
  #10000;
  $finish();
end
endmodule