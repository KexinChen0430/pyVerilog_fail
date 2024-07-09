module will
    // determine the memory option).
    scsdpram
        #(
          .C_WIDTH(C_WIDTH),
          .C_DEPTH(C_POW2_DEPTH)
          /*AUTOINSTPARAM*/)
    mem
        (
         .WR1_EN                        (wWrEn),
         .WR1_ADDR                      (rWrPtr[C_DEPTH_WIDTH-1:0]),
         .WR1_DATA                      (WR_DATA),
         .RD1_EN                        (wRdEn),
         .RD1_ADDR                      (rRdPtr[C_DEPTH_WIDTH-1:0]),
         .RD1_DATA                      (RD_DATA),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK));
    shiftreg
        #(
          // Parameters
          .C_DEPTH          (C_DELAY),
          .C_WIDTH          (1'b1)
          /*AUTOINSTPARAM*/)
    shiftreg_wr_delay_inst
        (
         // Outputs
         .RD_DATA                       (wDelayTaps),
         // Inputs
         .RST_IN                        (RST),
         .WR_DATA                       (wWrEn),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK));
endmodule