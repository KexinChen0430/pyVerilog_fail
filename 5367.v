module (outputs) based on major mode
wire [2:0] major_mode = conf_word[7:5];
// configuring the HF reader
wire [1:0] subcarrier_frequency = conf_word[4:3];
wire [2:0] minor_mode = conf_word[2:0];
// And then we instantiate the modules corresponding to each of the FPGA's
// major modes, and use muxes to connect the outputs of the active mode to
// the output pins.
hi_reader hr(
	ck_1356megb,
	hr_pwr_lo, hr_pwr_hi, hr_pwr_oe1, hr_pwr_oe2, hr_pwr_oe3, hr_pwr_oe4,
	adc_d, hr_adc_clk,
	hr_ssp_frame, hr_ssp_din, ssp_dout, hr_ssp_clk,
	hr_dbg,
	subcarrier_frequency, minor_mode
);
hi_simulate hs(
	ck_1356meg,
	hs_pwr_lo, hs_pwr_hi, hs_pwr_oe1, hs_pwr_oe2, hs_pwr_oe3, hs_pwr_oe4,
	adc_d, hs_adc_clk,
	hs_ssp_frame, hs_ssp_din, ssp_dout, hs_ssp_clk,
	hs_dbg,
	minor_mode
);
hi_iso14443a hisn(
	ck_1356meg,
	hisn_pwr_lo, hisn_pwr_hi, hisn_pwr_oe1, hisn_pwr_oe2, hisn_pwr_oe3, hisn_pwr_oe4,
	adc_d, hisn_adc_clk,
	hisn_ssp_frame, hisn_ssp_din, ssp_dout, hisn_ssp_clk,
	hisn_dbg,
	minor_mode
);
hi_sniffer he(
	ck_1356megb,
	he_pwr_lo, he_pwr_hi, he_pwr_oe1, he_pwr_oe2, he_pwr_oe3, he_pwr_oe4,
	adc_d, he_adc_clk,
	he_ssp_frame, he_ssp_din, he_ssp_clk
);
hi_get_trace gt(
	ck_1356megb,
	adc_d, trace_enable, major_mode,
	gt_ssp_frame, gt_ssp_din, gt_ssp_clk
);
// Major modes:
//   000 --  HF reader; subcarrier frequency and modulation depth selectable
//   001 --  HF simulated tag
//   010 --  HF ISO14443-A
//   011 --  HF Snoop
//   100 --  HF get trace
//   111 --  everything off
mux8 mux_ssp_clk        (major_mode, ssp_clk,   hr_ssp_clk,   hs_ssp_clk,   hisn_ssp_clk,   he_ssp_clk,   gt_ssp_clk,   1'b0, 1'b0, 1'b0);
mux8 mux_ssp_din        (major_mode, ssp_din,   hr_ssp_din,   hs_ssp_din,   hisn_ssp_din,   he_ssp_din,   gt_ssp_din,   1'b0, 1'b0, 1'b0);
mux8 mux_ssp_frame      (major_mode, ssp_frame, hr_ssp_frame, hs_ssp_frame, hisn_ssp_frame, he_ssp_frame, gt_ssp_frame, 1'b0, 1'b0, 1'b0);
mux8 mux_pwr_oe1        (major_mode, pwr_oe1,   hr_pwr_oe1,   hs_pwr_oe1,   hisn_pwr_oe1,   he_pwr_oe1,   1'b0,         1'b0, 1'b0, 1'b0);
mux8 mux_pwr_oe2        (major_mode, pwr_oe2,   hr_pwr_oe2,   hs_pwr_oe2,   hisn_pwr_oe2,   he_pwr_oe2,   1'b0,         1'b0, 1'b0, 1'b0);
mux8 mux_pwr_oe3        (major_mode, pwr_oe3,   hr_pwr_oe3,   hs_pwr_oe3,   hisn_pwr_oe3,   he_pwr_oe3,   1'b0,         1'b0, 1'b0, 1'b0);
mux8 mux_pwr_oe4        (major_mode, pwr_oe4,   hr_pwr_oe4,   hs_pwr_oe4,   hisn_pwr_oe4,   he_pwr_oe4,   1'b0,         1'b0, 1'b0, 1'b0);
mux8 mux_pwr_lo         (major_mode, pwr_lo,    hr_pwr_lo,    hs_pwr_lo,    hisn_pwr_lo,    he_pwr_lo,    1'b0,         1'b0, 1'b0, 1'b0);
mux8 mux_pwr_hi         (major_mode, pwr_hi,    hr_pwr_hi,    hs_pwr_hi,    hisn_pwr_hi,    he_pwr_hi,    1'b0,         1'b0, 1'b0, 1'b0);
mux8 mux_adc_clk        (major_mode, adc_clk,   hr_adc_clk,   hs_adc_clk,   hisn_adc_clk,   he_adc_clk,   1'b0,         1'b0, 1'b0, 1'b0);
mux8 mux_dbg            (major_mode, dbg,       hr_dbg,       hs_dbg,       hisn_dbg,       1'b0,         1'b0,         1'b0, 1'b0, 1'b0);
// In all modes, let the ADC's outputs be enabled.
assign adc_noe = 1'b0;
// not used
assign miso = 1'b0;
endmodule