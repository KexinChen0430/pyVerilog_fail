module my_ODELAY (input clk, input [1:0] din, output dout);
   parameter LOC = "";
   parameter CASCADE = "NONE";
   parameter DELAY_FORMAT = "TIME";
   parameter DELAY_TYPE = "FIXED";
   parameter DELAY_VALUE = 0;
   parameter IS_CLK_INVERTED = 1'b0;
   parameter IS_RST_INVERTED = 1'b0;
   parameter REFCLK_FREQUENCY = 300.0;
   parameter SIM_DEVICE = "ULTRASCALE_PLUS";
   parameter UPDATE_MODE = "ASYNC";
   (* KEEP, DONT_TOUCH, LOC=LOC *)
   ODELAYE3 #(
      .CASCADE(CASCADE),                    // Cascade setting (MASTER, NONE, SLAVE_END, SLAVE_MIDDLE)
      .DELAY_FORMAT(DELAY_FORMAT),          // Units of the DELAY_VALUE (COUNT, TIME)
      .DELAY_TYPE(DELAY_TYPE),              // Set the type of tap delay line (FIXED, VARIABLE, VAR_LOAD)
      .DELAY_VALUE(DELAY_VALUE),            // Input delay value setting
      .IS_CLK_INVERTED(IS_CLK_INVERTED),    // Optional inversion for CLK
      .IS_RST_INVERTED(IS_RST_INVERTED),    // Optional inversion for RST
      .REFCLK_FREQUENCY(REFCLK_FREQUENCY),  // IDELAYCTRL clock input frequency in MHz (200.0-2667.0)
      .SIM_DEVICE(SIM_DEVICE),              // Set the device version (ULTRASCALE, ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1,
                                            // ULTRASCALE_PLUS_ES2)
      .UPDATE_MODE(UPDATE_MODE)             // Determines when updates to the delay will take effect (ASYNC, MANUAL, SYNC)
   )
   ODELAYE3_inst (
      .CASC_OUT(),       // 1-bit output: Cascade delay output to ODELAY input cascade
      .CNTVALUEOUT(),    // 9-bit output: Counter value output
      .DATAOUT(dout),    // 1-bit output: Delayed data output
      .CASC_IN(),        // 1-bit input: Cascade delay input from slave ODELAY CASCADE_OUT
      .CASC_RETURN(),    // 1-bit input: Cascade delay returning from slave ODELAY DATAOUT
      .CE(1'b0),         // 1-bit input: Active high enable increment/decrement input
      .CLK(clk),         // 1-bit input: Clock input
      .CNTVALUEIN(),     // 9-bit input: Counter value input
      .EN_VTC(1'b1),     // 1-bit input: Keep delay constant over VT
      .INC(1'b0),        // 1-bit input: Increment / Decrement tap delay input
      .LOAD(1'b0),       // 1-bit input: Load DELAY_VALUE input
	   .ODATAIN(din[0]),  // 1-bit input: Data input
      .RST(din[1])       // 1-bit input: Asynchronous Reset to the DELAY_VALUE
   );
endmodule