module simplez_tb();
parameter ROMFILE = "prog.list";
parameter WAIT_DELAY = 20;
reg clk = 0;
wire [7:0] leds;
wire stop;
reg rstn = 0;
wire tx;
simplez #(.ROMFILE(ROMFILE), .WAIT_DELAY(WAIT_DELAY))
  dut(
    .clk(clk),
    .rstn_ini(rstn),
    .leds(leds),
    .stop(stop),
    .tx(tx)
  );
always #1 clk = ~clk;
initial begin
  $dumpfile("simplez_tb.vcd");
  $dumpvars(0, simplez_tb);
  #2 rstn <= 1;
  # 160 $display("FIN de la simulacion");
  $finish;
end
endmodule