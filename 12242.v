module FIFOL20(CLK,
               RST,
               ENQ,
               FULL_N,
               DEQ,
               EMPTY_N,
               CLR
               );
   input  RST;
   input  CLK;
   input  ENQ;
   input  CLR;
   input  DEQ;
   output FULL_N;
   output EMPTY_N;
   reg    empty_reg;
   reg    full_reg;
   assign FULL_N  = full_reg || DEQ;
   assign EMPTY_N = empty_reg ;
`ifdef BSV_NO_INITIAL_BLOCKS
`else // not BSV_NO_INITIAL_BLOCKS
   // synopsys translate_off
   initial
     begin
        empty_reg = 1'b0 ;
        full_reg  = 1'b1 ;
     end // initial begin
   // synopsys translate_on
`endif // BSV_NO_INITIAL_BLOCKS
   always@(posedge CLK `BSV_ARESET_EDGE_META)
     begin
        if (RST == `BSV_RESET_VALUE)
          begin
             empty_reg <= `BSV_ASSIGNMENT_DELAY 1'b0;
             full_reg  <= `BSV_ASSIGNMENT_DELAY 1'b1;
          end // if (RST == `BSV_RESET_VALUE)
        else
           begin
              if (CLR)
                begin
                   empty_reg <= `BSV_ASSIGNMENT_DELAY 1'b0;
                   full_reg  <= `BSV_ASSIGNMENT_DELAY 1'b1;
                end
              else if (ENQ && !DEQ)
                begin
                   empty_reg <= `BSV_ASSIGNMENT_DELAY 1'b1;
                   full_reg  <= `BSV_ASSIGNMENT_DELAY ! empty_reg;
                end
              else if (!ENQ && DEQ)
                begin
                   full_reg  <= `BSV_ASSIGNMENT_DELAY 1'b1;
                   empty_reg <= `BSV_ASSIGNMENT_DELAY ! full_reg;
                end // if (!ENQ && DEQ)
           end // else: !if(RST == `BSV_RESET_VALUE)
     end // always@ (posedge CLK or `BSV_RESET_EDGE RST)
   // synopsys translate_off
   always@(posedge CLK)
     begin: error_checks
        reg deqerror, enqerror ;
        deqerror =  0;
        enqerror = 0;
        if (RST == ! `BSV_RESET_VALUE)
          begin
             if ( ! empty_reg && DEQ )
               begin
                  deqerror = 1 ;
                  $display( "Warning: FIFO20: %m -- Dequeuing from empty fifo" ) ;
               end
             if ( ! full_reg && ENQ && !DEQ )
               begin
                  enqerror =  1 ;
                  $display( "Warning: FIFO20: %m -- Enqueuing to a full fifo" ) ;
               end
          end // if (RST == ! `BSV_RESET_VALUE)
     end
   // synopsys translate_on
endmodule