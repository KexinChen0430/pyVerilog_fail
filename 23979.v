module m0_sim;
  wire [7:0] leds;
  wire key;
  wire clk;
  wire rstn;
  sim_clk m0IClk(clk);
  m0 #(.width(8)) m0I(clk, key, rstn, leds);
  m0_mock #(.width(8)) m0_mockI(leds, key, rstn);
  initial begin
    $dumpfile(`VCD_PATH);
    $dumpvars();
    $monitor("T=%t, clk=%d key=%d rstn=%0d leds=%0d", $time, clk, key, rstn, leds);
    #70 $finish;
  end
endmodule