module testSyncRegister() ;
   parameter dsize = 8;
   wire      sCLK, sRST_N, dCLK ;
   wire      sEN ;
   wire      sRDY ;
   reg [dsize -1:0]  sCNT ;
   wire [dsize -1:0] sDIN, dDOUT ;
   ClockGen#(20,9,10)  sc( sCLK );
   ClockGen#(11,12,26)  dc( dCLK );
   initial
     begin
        sCNT = 0;
        $dumpfile("SyncRegister.dump");
        $dumpvars(5) ;
        $dumpon ;
        #100000 $finish ;
     end
   SyncRegister #(dsize)
     dut( sCLK, sRST_N, dCLK,
          sEN, sRDY, sDIN,
          dDOUT ) ;
   assign sDIN = sCNT ;
   assign sEN = sRDY ;
   always @(posedge sCLK)
     begin
        if (sRDY )
          begin
             sCNT <= `BSV_ASSIGNMENT_DELAY sCNT + 1;
          end
      end // always @ (posedge sCLK)
endmodule