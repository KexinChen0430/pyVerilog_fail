module SyncResetA (
                   IN_RST,
                   CLK,
                   OUT_RST
                   );
   parameter          RSTDELAY = 1  ; // Width of reset shift reg
   input              CLK ;
   input              IN_RST ;
   output             OUT_RST ;
   reg [RSTDELAY:0]   reset_hold ;
   wire [RSTDELAY+1:0] next_reset = {reset_hold, ~ `BSV_RESET_VALUE} ;
   assign  OUT_RST = reset_hold[RSTDELAY] ;
   always @( posedge CLK or `BSV_RESET_EDGE IN_RST )
     begin
        if (IN_RST == `BSV_RESET_VALUE)
           begin
              reset_hold <= `BSV_ASSIGNMENT_DELAY {RSTDELAY+1 {`BSV_RESET_VALUE}} ;
           end
        else
          begin
             reset_hold <= `BSV_ASSIGNMENT_DELAY next_reset[RSTDELAY:0];
          end
     end // always @ ( posedge CLK or  `BSV_RESET_EDGE IN_RST )
`ifdef BSV_NO_INITIAL_BLOCKS
`else // not BSV_NO_INITIAL_BLOCKS
   // synopsys translate_off
   initial
     begin
        #0 ;
        // initialize out of reset forcing the designer to do one
        reset_hold = {(RSTDELAY + 1) {~ `BSV_RESET_VALUE}} ;
     end
   // synopsys translate_on
`endif // BSV_NO_INITIAL_BLOCKS
endmodule