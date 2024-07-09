module test;
   wire clk1;
   wire clk2;
   wire [7:0] pb, pc, pd;   // dummy only;
   wire sum; // signal is connected 2 pin PA0 from both devices under test
   wire out1;
   wire out2;
   wire mirror1;
   wire mirror2;
   wire driver_enabled1;
   wire driver_enabled2;
   wire logic_level1;
   wire logic_level2;
   wire unused;
   defparam  avr1.progfile="vst.elf";
   defparam  avr2.progfile="vst.elf";
   ATmega32 avr1(clk1, { dummy, dummy, logic_level1, driver_enabled1, mirror1, sum, out1, sum}, pb, pc, pd);
   ATmega32 avr2(clk2, { dummy, dummy, logic_level2, driver_enabled2, mirror2, sum, out2, sum}, pb, pc, pd);
   // now lets get to clocks a bit shifted against each other
   reg clkr1=1;
   reg clkr2=1;
   assign clk1 = clkr1;
   assign clk2 = clkr2;
   always begin
       #10 clkr1 =~clkr1;
   end
   always begin
       #5 clkr2 = ~clkr2;
   end
   initial begin
       $display( "Core Number %d", avr1.core.handle );
       $display( "Core Number %d", avr2.core.handle );
   end
   initial begin
      //$avr_trace("avr.trace");
      $dumpfile("vst.vcd");
      $dumpvars(0, test);
      #100_000 $finish;
   end
endmodule