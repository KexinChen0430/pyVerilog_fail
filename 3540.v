module ClkGen (clk_i, clk_o, clk180_o);
   parameter   MUL = 25;
   parameter   DIV = 3;
   parameter   real IN_FREQ = 12.0;
   input       clk_i;
   output      clk_o;
   output      clk180_o;
   localparam  real CLK_PERIOD = 1000.0/IN_FREQ;
   DCM_SP
   #(
      .CLKDV_DIVIDE(2.0), // Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
                          //   7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
      .CLKFX_DIVIDE(DIV),   // Can be any integer from 1 to 32
      .CLKFX_MULTIPLY(MUL), // Can be any integer from 2 to 32
      .CLKIN_DIVIDE_BY_2("FALSE"), // TRUE/FALSE to enable CLKIN divide by two feature
      .CLKIN_PERIOD(CLK_PERIOD),  // Specify period of input clock
      .CLKOUT_PHASE_SHIFT("NONE"), // Specify phase shift of NONE, FIXED or VARIABLE
      .CLK_FEEDBACK("1X"),  // Specify clock feedback of NONE, 1X or 2X
      .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), // SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
                                            //   an integer from 0 to 15
      .DLL_FREQUENCY_MODE("LOW"),  // HIGH or LOW frequency mode for DLL
      .DUTY_CYCLE_CORRECTION("TRUE"), // Duty cycle correction, TRUE or FALSE
      .PHASE_SHIFT(0),     // Amount of fixed phase shift from -255 to 255
      .STARTUP_WAIT("FALSE")   // Delay configuration DONE until DCM LOCK, TRUE/FALSE
   )
   DCM_SP_inst
   (
      .CLKFX(clk_o),       // DCM CLK synthesis out (M/D)
      .CLKFX180(clk180_o), // 180 degree CLK synthesis out
      .CLKIN(clk_i),   // Clock input (from IBUFG, BUFG or DCM)
      .RST(1'b0)        // DCM asynchronous reset input
   );
endmodule