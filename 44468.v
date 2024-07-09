module (outputs) based on major mode
wire [2:0] major_mode = conf_word[8:6];
// configuring the HF reader
wire [1:0] subcarrier_frequency = conf_word[5:4];
wire [3:0] minor_mode = conf_word[3:0];
// And then we instantiate the modules corresponding to each of the FPGA's
// major modes, and use muxes to connect the outputs of the active mode to
// the output pins.
// 000 - HF reader
hi_reader hr(
    ck_1356megb,
    hr_pwr_lo, hr_pwr_hi, hr_pwr_oe1, hr_pwr_oe2, hr_pwr_oe3, hr_pwr_oe4,
    adc_d, hr_adc_clk,
    hr_ssp_frame, hr_ssp_din, ssp_dout, hr_ssp_clk,
    hr_dbg,
    subcarrier_frequency, minor_mode
);
// 001 - HF simulated tag
hi_simulate hs(
    ck_1356meg,
    hs_pwr_lo, hs_pwr_hi, hs_pwr_oe1, hs_pwr_oe2, hs_pwr_oe3, hs_pwr_oe4,
    adc_d, hs_adc_clk,
    hs_ssp_frame, hs_ssp_din, ssp_dout, hs_ssp_clk,
    hs_dbg,
    minor_mode
);
// 011 - HF sniff
hi_sniffer he(
    ck_1356megb,
    he_pwr_lo, he_pwr_hi, he_pwr_oe1, he_pwr_oe2, he_pwr_oe3, he_pwr_oe4,
    adc_d, he_adc_clk,
    he_ssp_frame, he_ssp_din, he_ssp_clk
);
// 100 - HF ISO18092 FeliCa
hi_flite hfl(
    ck_1356megb,
    hfl_pwr_lo, hfl_pwr_hi, hfl_pwr_oe1, hfl_pwr_oe2, hfl_pwr_oe3, hfl_pwr_oe4,
    adc_d, hfl_adc_clk,
    hfl_ssp_frame, hfl_ssp_din, ssp_dout, hfl_ssp_clk,
    hfl_dbg,
    minor_mode
);
// 101 - HF get trace
hi_get_trace gt(
    ck_1356megb,
    adc_d, trace_enable, major_mode,
    gt_ssp_frame, gt_ssp_din, gt_ssp_clk
);
// Major modes:
//   000 --  HF reader; subcarrier frequency and modulation depth selectable
//   001 --  HF simulated tag
//   010 --  HF ISO14443-A - removed for space...
//   011 --  HF sniff
//   100 --  HF ISO18092 FeliCa
//   101 --  HF get trace
//   110 --  unused
//   111 --  FPGA_MAJOR_MODE_OFF
//                                         000           001           010     011           100            101           110   111
mux8 mux_ssp_clk   (major_mode, ssp_clk,   hr_ssp_clk,   hs_ssp_clk,   1'b0,   he_ssp_clk,   hfl_ssp_clk,   gt_ssp_clk,   1'b0, 1'b0);
mux8 mux_ssp_din   (major_mode, ssp_din,   hr_ssp_din,   hs_ssp_din,   1'b0,   he_ssp_din,   hfl_ssp_din,   gt_ssp_din,   1'b0, 1'b0);
mux8 mux_ssp_frame (major_mode, ssp_frame, hr_ssp_frame, hs_ssp_frame, 1'b0,   he_ssp_frame, hfl_ssp_frame, gt_ssp_frame, 1'b0, 1'b0);
mux8 mux_pwr_oe1   (major_mode, pwr_oe1,   hr_pwr_oe1,   hs_pwr_oe1,   1'b0,   he_pwr_oe1,   hfl_pwr_oe1,   1'b0,         1'b0, 1'b0);
mux8 mux_pwr_oe2   (major_mode, pwr_oe2,   hr_pwr_oe2,   hs_pwr_oe2,   1'b0,   he_pwr_oe2,   hfl_pwr_oe2,   1'b0,         1'b0, 1'b0);
mux8 mux_pwr_oe3   (major_mode, pwr_oe3,   hr_pwr_oe3,   hs_pwr_oe3,   1'b0,   he_pwr_oe3,   hfl_pwr_oe3,   1'b0,         1'b0, 1'b0);
mux8 mux_pwr_oe4   (major_mode, pwr_oe4,   hr_pwr_oe4,   hs_pwr_oe4,   1'b0,   he_pwr_oe4,   hfl_pwr_oe4,   1'b0,         1'b0, 1'b0);
mux8 mux_pwr_lo    (major_mode, pwr_lo,    hr_pwr_lo,    hs_pwr_lo,    1'b0,   he_pwr_lo,    hfl_pwr_lo,    1'b0,         1'b0, 1'b0);
mux8 mux_pwr_hi    (major_mode, pwr_hi,    hr_pwr_hi,    hs_pwr_hi,    1'b0,   he_pwr_hi,    hfl_pwr_hi,    1'b0,         1'b0, 1'b0);
mux8 mux_adc_clk   (major_mode, adc_clk,   hr_adc_clk,   hs_adc_clk,   1'b0,   he_adc_clk,   hfl_adc_clk,   1'b0,         1'b0, 1'b0);
mux8 mux_dbg       (major_mode, dbg,       hr_dbg,       hs_dbg,       1'b0,   he_dbg,       hfl_dbg,       1'b0,         1'b0, 1'b0);
// In all modes, let the ADC's outputs be enabled.
assign adc_noe = 1'b0;
endmodule