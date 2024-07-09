module testSyncFIFOLevel() ;
   parameter dsize = 8;
   parameter fifodepth = 32;
   parameter fifoidx = 5;
   wire      sCLK,  dCLK, dRST ;
   wire      sENQ, dDEQ;
   wire      sFULL_N, dEMPTY_N ;
   wire [dsize -1:0] sDIN, dDOUT ;
   reg [dsize -1:0]  sCNT, dCNT ;
   reg sRST ;
   wire [fifoidx:0] dItemCnt, sItemCnt ;
   wire             sCLR_RDY;
   wire             dCLR_RDY;
   wire             sCLR;
   wire             dCLR;
   reg [31:0]      count ;
   reg             started ;
   reg             ddeq ;
   ClockGen#(14,15,10)  sc( sCLK );
   ClockGen#(11,12,2600)  dc( dCLK ); // Pause the generation of the destination side clock
   initial
     begin
        sCNT = 0;
        dCNT = 0;
        sRST = `BSV_RESET_VALUE ;
        count = 0;
        started = 0;
        ddeq = 0;
        $display( "running test" ) ;
        $dumpfile("SyncFIFOLevel.vcd");
        $dumpvars(10,testSyncFIFOLevel) ;
        #1
        $dumpon ;
        #200 ;
        sRST = !`BSV_RESET_VALUE ;
        #50000 $finish ;
     end
   SyncFIFOLevel #(dsize,fifodepth,fifoidx)
     dut( sCLK, sRST, dCLK, sENQ, sDIN,
          sFULL_N, dDEQ, dDOUT, dEMPTY_N, dItemCnt, sItemCnt,
          sCLR, sCLR_RDY, dCLR, dCLR_RDY );
   assign sDIN = sCNT ;
   assign sENQ = sFULL_N ;
   assign     dCLR = ((count[7:0] == 8'b0010_0011) && dCLR_RDY);
   assign     sCLR = ((count[7:0] == 8'b0000_0001) && sCLR_RDY);
   always @(posedge sCLK)
     begin
        count <= count + 1 ;
        $display( "scount is %d", sItemCnt ) ;
        if (sENQ )
          begin
             sCNT <= `BSV_ASSIGNMENT_DELAY sCNT + 1;
             $display( "enqueuing is %d", sCNT ) ;
          end // if (sENQ )
      end // always @ (posedge sCLK)
   assign dDEQ = ddeq ;
   always @(dItemCnt or dEMPTY_N or started or count)
      begin
         ddeq = (count > 40) && dEMPTY_N && (started || dItemCnt > 4);
      end // always @ (dItemCnt or dEMPTY_N or started)
   always @(posedge dCLK)
     begin
        $display( "dcount is %d", dItemCnt ) ;
        if (ddeq)
          begin
             started <= 1;
             $display( "dequeing %d", dDOUT ) ;
           end // if (dDEQ )
        else
          begin
             started <= 0;
          end
     end // always @ (posedge dCLK)
endmodule