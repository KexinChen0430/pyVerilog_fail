module m1_sim;
  wire sys_clk;
  sim_clk simClk(sys_clk);
  reg rstn;
  initial begin
    rstn = 0;
    #2 rstn = 1;
  end
  wire clk;
  clkdiv #(50) clkDiv(.rstn(rstn), .iclk(sys_clk), .oclk(clk));
  wire [3:0] leds0;
  wire [2:0] leds1;
  wire led3;
  m1 #(.width(4)) m1I(.clk(clk), .rstn(rstn), .leds(leds0));
  cnt #(.width(3)) cntUp(.clk(clk), .top(3), .rstn(rstn), .start(1), .freerun(1), .cnt(leds1), .it(led3));
  initial begin
    $dumpfile(`VCD_PATH);
    $dumpvars();
    // $monitor("T=%t, i=%0d", $time, clk);
    #2000 $finish;
  end
endmodule