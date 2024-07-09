module
FONT5_base FONT5_base_top (
    .clk357(clk357),
	 .clk40(clk40),
    .clk40_ibufg(clk40_ibufg),
    .ch1_data_in_del(ch1_data_in_del),
    .ch2_data_in_del(ch2_data_in_del),
    .ch3_data_in_del(ch3_data_in_del),
    .ch4_data_in_del(ch4_data_in_del),
    .ch5_data_in_del(ch5_data_in_del),
    .ch6_data_in_del(ch6_data_in_del),
    .ch7_data_in_del(ch7_data_in_del),
    .ch8_data_in_del(ch8_data_in_del),
    .ch9_data_in_del(ch9_data_in_del),
    .rs232_in(rs232_in),
	 //.amp_trig(amp_trig),
	 //.amp_trig2(amp_trig2),
    .adc_powerdown(adc_powerdown),
	 .iddr_ce(iddr_ce),
	 //.dcm200_rst(dcm200_rst), //output to xlnx
	 .dac1_out(dac1_out),
	 .dac1_clk(dac1_clk),
	 .dac2_out(dac2_out),
	 .dac2_clk(dac2_clk),
//	 .dac3_out(dac3_out),
//	 .dac3_clk(dac3_clk),
//	 .dac4_out(dac4_out),
//	 .dac4_clk(dac4_clk),
    .rs232_out(rs232_out),
    .led0_out(led0_out),
    .led1_out(led1_out),
    .led2_out(led2_out),
    .trim_cs_ld(trim_cs_ld),
    .trim_sck(trim_sck),
    .trim_sdi(trim_sdi),
    .diginput1A(diginput1A),
    .diginput1B(diginput1B),
    .diginput1(diginput1),
    .diginput2A(diginput2A),
    .diginput2B(diginput2B),
    .diginput2(diginput2),
    .auxOutA(auxOutA),
    .auxOutB(auxOutB),
	 //.diginput2_loopback(diginput2_loopback),
	 .dcm200_locked(dcm200_locked), //input to top
	 .clk_blk(clk40_blk), //output to xlnx
	 .idelayctrl_rdy(idelayctrl_rdy), //input to top
	 .clk357_idelay_ce(clk357_idelay_ce), //output to xlnx
	 .clk357_idelay_rst(clk357_idelay_rst), //output to xlnx
	 .idelay_rst(idelay_rst), //output to xlnx
	 `ifdef FASTCLK_INT
		 .dcm360_locked(dcm360_locked), //input to top
		 .fastClk_sel(fastClk_sel), //output to xlnx
	 `endif
	 `ifdef CLK357_PLL
	 	 .dcm200_rst(dcm200_rst), //output to xlnx
		 .pll_clk357_locked(pll_clk357_locked), //input to top
		 .clkPLL_sel_a(clkPLL_sel), // output to xlnx
	 `endif
	 .run(run), //output to xlnx
	 .delay_calc_strb1(delay_calc_strb1), //output to xlnx from ADC_block
	 .delay_calc_strb2(delay_calc_strb2), //output to xlnx from ADC_block
	 .delay_calc_strb3(delay_calc_strb3), //output to xlnx from ADC_block
	 .delay_trig1(delay_trig1), //output to xlnx from top (UART decoder)
	 .delay_trig2(delay_trig2), //output to xlnx from top (UART decoder)
	 .delay_trig3(delay_trig3), //output to xlnx from top (UART decoder)
	 .adc1_drdy_delay_ce(adc1_drdy_delay_ce), //output to xlnx from ADC_block
	 .adc2_drdy_delay_ce(adc2_drdy_delay_ce), //output to xlnx from ADC_block
	 .adc3_drdy_delay_ce(adc3_drdy_delay_ce), //output to xlnx from ADC_block
	 .adc1_clk_delay_ce(adc1_clk_delay_ce), //output to xlnx from ADC_block
	 .adc2_clk_delay_ce(adc2_clk_delay_ce), //output to xlnx from ADC_block
	 .adc3_clk_delay_ce(adc3_clk_delay_ce), //output to xlnx from ADC_block
	 .adc1_data_delay_ce(adc1_data_delay_ce), //output to xlnx from ADC_block
	 .adc2_data_delay_ce(adc2_data_delay_ce), //output to xlnx from ADC_block
	 .adc3_data_delay_ce(adc3_data_delay_ce), //output to xlnx from ADC_block
	 .IDDR1_Q1(IDDR1_Q1), //input to top (to Alignment monitors via ADC block)
	 .IDDR1_Q2(IDDR1_Q2), //input to top (to Alignment monitors via ADC block)
	 .IDDR2_Q1(IDDR2_Q1), //input to top (to Alignment monitors via ADC block)
	 .IDDR2_Q2(IDDR2_Q2), //input to top (to Alignment monitors via ADC block)
	 .IDDR3_Q1(IDDR3_Q1), //input to top (to Alignment monitors via ADC block)
	 .IDDR3_Q2(IDDR3_Q2), //input to top (to Alignment monitors via ADC block)
	 //.DirectIO1(DirectIO1)
	 .DirIOB(DirectIO2),
	 .auxInA(auxInA),
	 .auxOutC(auxOutC)
    );
endmodule