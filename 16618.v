module MainTest;
   wire [7:0] leds;
   initial begin
      $dumpfile("./projects/LedPattern/LedPattern.vcd");
      $dumpvars;
      #100 $finish;
   end
   LedPattern
   ledPattern(.leds(leds));
endmodule