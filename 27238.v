module outputs)
   wire			bytercvd;		// From dut_rx of uartICE40.v
   wire [7:0]		q;			// From dut_rx of uartICE40.v
   wire [1:0]		rxst;			// From dut_rx of uartICE40.v
   wire			txbusy;			// From dut_tx of uartICE40.v
   wire			txpin;			// From dut_tx of uartICE40.v
   // End of automatics
   always # 20 base_clk = ~base_clk;
   initial begin
      $dumpfile(`TSTFILE);//"obj/tst.lxt"
      $dumpvars(0,tst);
      d <= 0;      tx_clk <= 0;    simtocy = SIMTOCY;   bitxce_rx_cnt <= 0;
      load <= 0;   rx_clk <= 0;    cyclecounter <= 0;   tx_cyclecounter <= 0;
      seenB <= 0;  base_clk <= 0;  bitxce_tx_cnt <= 0;
      check_rxst1 <= 0;            glitchline <= 0;
   end
   always @(posedge base_clk ) begin
      cyclecounter <= cyclecounter+1;
      if ( cyclecounter > SIMTOCY ) begin
         if ( simtocy == SIMTOCY )
           $display( "Simulation went off the rails" );
         else
           $display( "Success" );
         $finish;
      end
      tx_clk <= ~tx_clk;
      if ( cyclecounter > RXCLKSTART )
        rx_clk <= ~rx_clk;
   end
   always @(posedge tx_clk) begin
      tx_cyclecounter <= tx_cyclecounter + 1;
      load <= ( tx_cyclecounter == 100   ||
                tx_cyclecounter == 100 +   8*8*10*(1+`SUBDIV16) ||
                tx_cyclecounter == 100 + 3*8*8*10*(1+`SUBDIV16) )
        ? 1'b1 : 1'b0;
      if ( tx_cyclecounter == 99 ) begin
         d <= char1;
      end else if ( tx_cyclecounter == 150 ) begin
         d <= char2;
      end
      if ( ( tx_cyclecounter >= 100 + 2*8*8*10*(1+`SUBDIV16) &&
             tx_cyclecounter <= 103 + 2*8*8*10*(1+`SUBDIV16) )
           || ( tx_cyclecounter >= 100 + 4*8*8*10*(1+`SUBDIV16)
                - 64*(1+`SUBDIV16) &&
                tx_cyclecounter <= 100 + 4*8*8*10*(1+`SUBDIV16)
                + 64*(1+`SUBDIV16) + 2*64 ) )
        glitchline <= 1'b1;
      else
        glitchline <= 1'b0;
      if ( tx_cyclecounter == 100 + 2*8*8*10*(1+`SUBDIV16)
           + 4*8*(1+`SUBDIV16) ||
           tx_cyclecounter >= 100 + 4*8*8*10*(1+`SUBDIV16)
           + 64*(1+`SUBDIV16) + 2*64 )
        begin
           check_rxst1 <= 1;
           if ( rxst != 2'b00 ) // Encoding of HUNT is 2'b00.
             begin
                if (tx_cyclecounter == 100 + 2*8*8*10*(1+`SUBDIV16)
                    + 4*8*(1+`SUBDIV16))
                  $display( "False start bit not rejected" );
                else
                  $display( "Something wrong at frame error" );
                $finish;
             end
        end else begin
           check_rxst1 <= 0;
        end
   end
   always @(posedge rx_clk) begin
      bytercvd_dly1 <= bytercvd;
      if ( bytercvd_dly1 ) begin
         if ( seenB ) begin
            if ( q != char2 ) begin
               $display( "Something wrong2" );
               simtocy <= cyclecounter+400;
            end else begin
               simtocy <= simtocy-1;
            end
         end else begin
            if ( q != char1 ) begin
               $display( "Something is wrong" );
               simtocy <= cyclecounter+400;
            end else begin
               //$display("HERE");
               seenB <= 1;
            end
         end
      end
   end
   wire dummy_txpin, dummy_txbusy, dummy_bytercvd;
   wire bitxce_rx, bitxce_tx, dummy_rxpin;
   wire [1:0] dummy_rxst;
   wire [7:0] dummy_q;
   localparam adjsamplept = `BITLAX;
   assign dummy_rxpin = 0;
   uartICE40
     #( .SUBDIV16(subdiv16), .ADJUSTSAMPLEPOINT(adjsamplept))
   dut_tx
     (// Outputs
      .bytercvd(dummy_bytercvd),
      .rxst(dummy_rxst),
      .q                                (dummy_q[7:0]),
      // Inputs
      .rxpin                            (dummy_rxpin),
      .clk                              (tx_clk),
      .bitxce                           (bitxce_tx),
      /*AUTOINST*/
      // Outputs
      .txpin				(txpin),
      .txbusy				(txbusy),
      // Inputs
      .load				(load),
      .d				(d[7:0]));
   uartICE40
     #( .SUBDIV16(subdiv16), .ADJUSTSAMPLEPOINT(adjsamplept))
   dut_rx
     (// Outputs
      .txpin(    dummy_txpin    ),
      .txbusy(   dummy_txbusy   ),
      // Inputs
      .clk (rx_clk ),
      .bitxce(bitxce_rx),
      .load( 1'b0 ),
      .d (0),
      /*AUTOINST*/
      // Outputs
      .bytercvd				(bytercvd),
      .rxst				(rxst[1:0]),
      .q				(q[7:0]),
      // Inputs
      .rxpin				(rxpin));
   assign rxpin = ~txpin & ~glitchline;
   always @(posedge tx_clk)
     bitxce_tx_cnt <= bitxce_tx_cnt + 1;
   always @(posedge rx_clk)
     bitxce_rx_cnt <= bitxce_rx_cnt + 1;
   assign bitxce_tx = bitxce_tx_cnt == 0 || `BITLAX;
   assign bitxce_rx = bitxce_rx_cnt == 0 || `BITLAX;
endmodule