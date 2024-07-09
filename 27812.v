module testClockGen1() ;
   wire clkout ;
   ClockGen#(8,24,16,1'b1,1'b0)  u1( clkout );
   initial
     begin
        $dumpfile("ClockGen.dump");
        $dumpvars(5) ;
        $dumpon ;
        #10000 $finish ;
     end
endmodule