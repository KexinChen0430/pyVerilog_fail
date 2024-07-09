module is ready to start another re-configuration
      .SRDY(),
      // These are the clock outputs from the PLL_ADV.
      .CLK0OUT(CLK_OUT1),
      .CLK1OUT(/*CLK_OUT2*/),
      .CLK2OUT(/*CLK_OUT3*/),
      .CLK3OUT(/*CLK_OUT4*/)
   );
  wire cpuclk_selected, cpuclk_3_2, cpuclk_1_0;
//  BUFGMUX speed_1_and_0 (  // 7MHz and 3.5MHz for CPU
//    .O(cpuclk_1_0),
//    .I0(CLK_OUT4),
//    .I1(CLK_OUT3),
//    .S(turbo_enable[0])
//    );
//  BUFGMUX cpuclk_selector (
//    .O(cpuclk_selected),
//    .I0(cpuclk_1_0),
//    .I1(/*cpuclk_3_2*/CLK_OUT2),
//    .S(turbo_enable[1])
//    );
//  BUFGMUX aplicar_contienda (
//        .O(cpuclk),
//        .I0(cpuclk_selected),     // when no contention, clock is this one
//        .I1(1'b1),       // during contention, clock is pulled up
//        .S(CPUContention)  // contention signal
//        );
  reg [2:0] clkdivider = 3'b000;
  always @(posedge CLK_OUT1)
    clkdivider <= clkdivider + 3'd1;
  BUFG bclkout2 (
   .O(CLK_OUT2),
   .I(clkdivider[0])
   );
  BUFG bclkout3 (
   .O(CLK_OUT3),
   .I(clkdivider[1])
   );
  BUFG bclkout4 (
   .O(CLK_OUT4),
   .I(clkdivider[2])
   );
//  BUFGMUX speed_3_and_2 (  // 28MHz and 14MHz for CPU
//    .O(cpuclk_3_2),
//    .I0(CLK_OUT2),
//    .I1(CLK_OUT1),
//    .S(turbo_enable[0])
//    );
  BUFGMUX speed_1_and_0 (  // 7MHz and 3.5MHz for CPU
    .O(cpuclk_1_0),
    .I0(CLK_OUT4),
    .I1(CLK_OUT3),
    .S(turbo_enable[0])
    );
  BUFGMUX cpuclk_selector (
    .O(cpuclk_selected),
    .I0(cpuclk_1_0),
    .I1(/*cpuclk_3_2*/CLK_OUT2),
    .S(turbo_enable[1])
    );
  BUFGMUX aplicar_contienda (
        .O(cpuclk),
        .I0(cpuclk_selected),     // when no contention, clock is this one
        .I1(1'b1),       // during contention, clock is pulled up
        .S(CPUContention)  // contention signal
        );
  assign cpuclkplain = cpuclk_selected;
endmodule