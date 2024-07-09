module secnotas_tb();
reg clk = 0;
wire ch_out;
secnotas #(.N0(2), .N1(3), .N2(4), .DUR(10))
  dut(
    .clk(clk),
    .ch_out(ch_out)
  );
always
  # 1 clk <= ~clk;
initial begin
  $dumpfile("secnotas_tb.vcd");
  $dumpvars(0, secnotas_tb);
  # 200 $display("FIN de la simulacion");
  $finish;
end
endmodule