module
        PREEDGE <= `BSV_ASSIGNMENT_DELAY  (cntr == nexttick) ;
     end
   always@( posedge CLK_IN or negedge RST_N )
     begin
        // The use of blocking assignment within this block insures
        // that the clock generated from cntr[MSB] occurs before any
        // LHS of nonblocking assigments also from CLK_IN occur.
        // Basically, this insures that CLK_OUT and CLK_IN occur within
        // the same phase of the execution cycle,  before any state
        // updates occur. see
        // http://www.sunburst-design.com/papers/CummingsSNUG2002Boston_NBAwithDelays.pdf
        if ( RST_N == 0 )
          cntr = upper - offset ;
        else
          begin
             if ( cntr < upper_w )
               cntr = cntr + 1 ;
             else
               cntr = lower_w ;
          end // else: !if( RST_N == 0 )
     end // always@ ( posedge CLK_IN or negedge RST_N )
`ifdef BSV_NO_INITIAL_BLOCKS
`else // not BSV_NO_INITIAL_BLOCKS
  // synopsys translate_off
  initial
    begin
       #0 ;
       cntr = (upper - offset)  ;
       PREEDGE = 0 ;
    end // initial begin
  // synopsys translate_on
`endif // BSV_NO_INITIAL_BLOCKS
endmodule