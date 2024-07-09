module reset_extender
    #(parameter C_RST_COUNT = 10)
    (input  CLK,
     input  RST_BUS,
     input  RST_LOGIC,
     output RST_OUT,
     output PENDING_RST);
 `include "functions.vh"
    localparam C_CLOG2_RST_COUNT = clog2s(C_RST_COUNT);
    localparam C_CEIL2_RST_COUNT = 1 << C_CLOG2_RST_COUNT;
    localparam C_RST_SHIFTREG_DEPTH = 4;
    wire [C_CLOG2_RST_COUNT:0] wRstCount;
    wire [C_RST_SHIFTREG_DEPTH:0] wRstShiftReg;
    assign PENDING_RST = wRstShiftReg != 0;
    assign RST_OUT = wRstShiftReg[C_RST_SHIFTREG_DEPTH];
    counter
        #(// Parameters
          .C_MAX_VALUE                  (C_CEIL2_RST_COUNT),
          .C_SAT_VALUE                  (C_CEIL2_RST_COUNT),
          .C_RST_VALUE                  (C_CEIL2_RST_COUNT - C_RST_COUNT)
          /*AUTOINSTPARAM*/)
    rst_counter
        (// Outputs
         .VALUE                         (wRstCount),
         // Inputs
         .ENABLE                        (1'b1),
         .RST_IN                        (RST_BUS | RST_LOGIC),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK));
    shiftreg
        #(// Parameters
          .C_DEPTH                      (C_RST_SHIFTREG_DEPTH),
          .C_WIDTH                      (1),
          .C_VALUE                      (0)
          /*AUTOINSTPARAM*/)
    rst_shiftreg
        (// Outputs
         .RD_DATA                       (wRstShiftReg),
         // Inputs
         .RST_IN                        (0),
         .WR_DATA                       (~wRstCount[C_CLOG2_RST_COUNT]),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK));
endmodule