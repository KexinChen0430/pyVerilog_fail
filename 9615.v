module PositiveReset (
                  IN_RST,
                  CLK,
                  OUT_RST
                  );
   parameter          RSTDELAY = 1  ; // Width of reset shift reg
   input              CLK ;
   input              IN_RST ;
   output             OUT_RST ;
   //(* keep = "true" *)
   reg [RSTDELAY:0]   reset_hold ;
   wire [RSTDELAY+1:0] next_reset = {reset_hold, 1'b0} ;
   assign  OUT_RST = reset_hold[RSTDELAY] ;
   always @( posedge CLK )      // reset is read synchronous with clock
     begin
        if (IN_RST == `BSV_RESET_VALUE)
           begin
              reset_hold <= `BSV_ASSIGNMENT_DELAY -1 ;
           end
        else
          begin
             reset_hold <= `BSV_ASSIGNMENT_DELAY next_reset[RSTDELAY:0];
          end
     end // always @ ( posedge CLK )
`ifdef BSV_NO_INITIAL_BLOCKS
`else // not BSV_NO_INITIAL_BLOCKS
   // synopsys translate_off
   initial
     begin
        #0 ;
        // initialize out of reset forcing the designer to do one
        reset_hold = 0 ;
     end
   // synopsys translate_on
`endif // BSV_NO_INITIAL_BLOCKS
endmodule