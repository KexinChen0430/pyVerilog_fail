module mii_seq_tb();
wire c;
sim_clk #(125) clk_125(c);
reg start;
wire mdc, mdio;
mii_seq dut(.*);
fake_mii mii_inst(.*);
initial begin
  $dumpfile("mii_seq.lxt");
  $dumpvars();
  start = 0;
  #100;
  wait(~c);
  wait(c);
  start <= 1;
  wait(~c);
  wait(c);
  start <= 0;
  #1000000;
  $finish();
end
endmodule