module is regenerated
    parameter       ENABLE_ALT_RECONFIG     = 1;
	wire [0:0] sub_wire0;
	wire [0:0] sub_wire1;
	wire [0:0] sub_wire2;
	wire [0:0] sub_wire3;
	wire [0:0] sub_wire4;
	wire [0:0] sub_wire5;
	wire [0:0] sub_wire6;
	wire [0:0] sub_wire7;
	wire  sub_wire8;
	wire [7:0] sub_wire9;
	wire [0:0] sub_wire10;
	wire [0:0] sub_wire11;
	wire [0:0] sub_wire12;
	wire [0:0] sub_wire13;
	wire [0:0] sub_wire14;
	wire [0:0] sub_wire15;
	wire [0:0] sub_wire16;
	wire [0:0] rx_patterndetect = sub_wire0[0:0];
	wire [0:0] pll_locked = sub_wire1[0:0];
	wire [0:0] reconfig_fromgxb = sub_wire2[0:0];
	wire [0:0] rx_freqlocked = sub_wire3[0:0];
	wire [0:0] rx_disperr = sub_wire4[0:0];
	wire [0:0] rx_recovclkout = sub_wire5[0:0];
	wire [0:0] rx_runningdisp = sub_wire6[0:0];
	wire [0:0] rx_syncstatus = sub_wire7[0:0];
	wire  rx_clkout = sub_wire8;
	wire [7:0] rx_dataout = sub_wire9[7:0];
	wire [0:0] rx_errdetect = sub_wire10[0:0];
	wire [0:0] rx_rmfifodatainserted = sub_wire11[0:0];
	wire [0:0] rx_rlv = sub_wire12[0:0];
	wire [0:0] rx_rmfifodatadeleted = sub_wire13[0:0];
	wire [0:0] tx_clkout = sub_wire14[0:0];
	wire [0:0] tx_dataout = sub_wire15[0:0];
	wire [0:0] rx_ctrldetect = sub_wire16[0:0];
	alt2gxb	alt2gxb_component (
				.pll_inclk (pll_inclk),
				.reconfig_togxb (reconfig_togxb),
				.cal_blk_clk (cal_blk_clk),
				.rx_datain (rx_datain),
				.rx_digitalreset (rx_digitalreset),
				.tx_datain (tx_datain),
				.tx_digitalreset (tx_digitalreset),
				.gxb_powerdown (gxb_powerdown),
				.rx_cruclk (rx_cruclk),
				.rx_seriallpbken (rx_seriallpbken),
				.reconfig_clk (reconfig_clk),
				.rx_analogreset (rx_analogreset),
				.tx_ctrlenable (tx_ctrlenable),
				.rx_patterndetect (sub_wire0),
				.pll_locked (sub_wire1),
				.reconfig_fromgxb (sub_wire2),
				.rx_freqlocked (sub_wire3),
				.rx_disperr (sub_wire4),
				.rx_recovclkout (sub_wire5),
				.rx_runningdisp (sub_wire6),
				.rx_syncstatus (sub_wire7),
				.rx_clkout (sub_wire8),
				.rx_dataout (sub_wire9),
				.rx_errdetect (sub_wire10),
				.rx_rmfifodatainserted (sub_wire11),
				.rx_rlv (sub_wire12),
				.rx_rmfifodatadeleted (sub_wire13),
				.tx_clkout (sub_wire14),
				.tx_dataout (sub_wire15),
				.rx_ctrldetect (sub_wire16)
				// synopsys translate_off
				,
				.aeq_fromgxb (),
				.aeq_togxb (),
				.cal_blk_calibrationstatus (),
				.cal_blk_powerdown (),
				.coreclkout (),
				.debug_rx_phase_comp_fifo_error (),
				.debug_tx_phase_comp_fifo_error (),
				.fixedclk (),
				.gxb_enable (),
				.pipe8b10binvpolarity (),
				.pipedatavalid (),
				.pipeelecidle (),
				.pipephydonestatus (),
				.pipestatus (),
				.pll_inclk_alt (),
				.pll_inclk_rx_cruclk (),
				.pll_locked_alt (),
				.powerdn (),
				.reconfig_fromgxb_oe (),
				.rx_a1a2size (),
				.rx_a1a2sizeout (),
				.rx_a1detect (),
				.rx_a2detect (),
				.rx_bistdone (),
				.rx_bisterr (),
				.rx_bitslip (),
				.rx_byteorderalignstatus (),
				.rx_channelaligned (),
				.rx_coreclk (),
				.rx_cruclk_alt (),
				.rx_dataoutfull (),
				.rx_enabyteord (),
				.rx_enapatternalign (),
				.rx_invpolarity (),
				.rx_k1detect (),
				.rx_k2detect (),
				.rx_locktodata (),
				.rx_locktorefclk (),
				.rx_phfifooverflow (),
				.rx_phfifordenable (),
				.rx_phfiforeset (),
				.rx_phfifounderflow (),
				.rx_phfifowrdisable (),
				.rx_pll_locked (),
				.rx_powerdown (),
				.rx_revbitorderwa (),
				.rx_revbyteorderwa (),
				.rx_rmfifoalmostempty (),
				.rx_rmfifoalmostfull (),
				.rx_rmfifoempty (),
				.rx_rmfifofull (),
				.rx_rmfifordena (),
				.rx_rmfiforeset (),
				.rx_rmfifowrena (),
				.rx_signaldetect (),
				.tx_coreclk (),
				.tx_datainfull (),
				.tx_detectrxloop (),
				.tx_dispval (),
				.tx_forcedisp (),
				.tx_forcedispcompliance (),
				.tx_forceelecidle (),
				.tx_invpolarity (),
				.tx_phfifooverflow (),
				.tx_phfiforeset (),
				.tx_phfifounderflow (),
				.tx_revparallellpbken ()
				// synopsys translate_on
				);
	defparam
		alt2gxb_component.starting_channel_number = starting_channel_number,
		alt2gxb_component.cmu_pll_inclock_period = 8000,
		alt2gxb_component.cmu_pll_loop_filter_resistor_control = 3,
		alt2gxb_component.digitalreset_port_width = 1,
		alt2gxb_component.en_local_clk_div_ctrl = "true",
		alt2gxb_component.equalizer_ctrl_a_setting = 0,
		alt2gxb_component.equalizer_ctrl_b_setting = 0,
		alt2gxb_component.equalizer_ctrl_c_setting = 0,
		alt2gxb_component.equalizer_ctrl_d_setting = 0,
		alt2gxb_component.equalizer_ctrl_v_setting = 0,
		alt2gxb_component.equalizer_dcgain_setting = 0,
		alt2gxb_component.gen_reconfig_pll = "false",
		alt2gxb_component.intended_device_family = "Stratix II GX",
		alt2gxb_component.loopback_mode = "slb",
		alt2gxb_component.lpm_type = "alt2gxb",
		alt2gxb_component.number_of_channels = 1,
		alt2gxb_component.operation_mode = "duplex",
		alt2gxb_component.pll_legal_multiplier_list = "disable_4_5_mult_above_3125",
		alt2gxb_component.preemphasis_ctrl_1stposttap_setting = 0,
		alt2gxb_component.preemphasis_ctrl_2ndposttap_inv_setting = "false",
		alt2gxb_component.preemphasis_ctrl_2ndposttap_setting = 0,
		alt2gxb_component.preemphasis_ctrl_pretap_inv_setting = "false",
		alt2gxb_component.preemphasis_ctrl_pretap_setting = 0,
		alt2gxb_component.protocol = "gige",
		alt2gxb_component.receiver_termination = "oct_100_ohms",
		alt2gxb_component.reconfig_dprio_mode = ENABLE_ALT_RECONFIG,
		alt2gxb_component.reverse_loopback_mode = "none",
		alt2gxb_component.rx_8b_10b_compatibility_mode = "true",
		alt2gxb_component.rx_8b_10b_mode = "normal",
		alt2gxb_component.rx_align_pattern = "0101111100",
		alt2gxb_component.rx_align_pattern_length = 10,
		alt2gxb_component.rx_allow_align_polarity_inversion = "false",
		alt2gxb_component.rx_allow_pipe_polarity_inversion = "false",
		alt2gxb_component.rx_bandwidth_mode = 1,
		alt2gxb_component.rx_bitslip_enable = "false",
		alt2gxb_component.rx_byte_ordering_mode = "none",
		alt2gxb_component.rx_channel_width = 8,
		alt2gxb_component.rx_common_mode = "0.9v",
		alt2gxb_component.rx_cru_inclock_period = 8000,
		alt2gxb_component.rx_cru_pre_divide_by = 1,
		alt2gxb_component.rx_datapath_protocol = "basic",
		alt2gxb_component.rx_data_rate = 1250,
		alt2gxb_component.rx_data_rate_remainder = 0,
		alt2gxb_component.rx_disable_auto_idle_insertion = "true",
		alt2gxb_component.rx_enable_bit_reversal = "false",
		alt2gxb_component.rx_enable_lock_to_data_sig = "false",
		alt2gxb_component.rx_enable_lock_to_refclk_sig = "false",
		alt2gxb_component.rx_enable_self_test_mode = "false",
		alt2gxb_component.rx_enable_true_complement_match_in_word_align = "false",
		alt2gxb_component.rx_force_signal_detect = "true",
		alt2gxb_component.rx_ppmselect = 32,
		alt2gxb_component.rx_rate_match_back_to_back = "true",
		alt2gxb_component.rx_rate_match_fifo_mode = "normal",
		alt2gxb_component.rx_rate_match_fifo_mode_manual_control = "none",
		alt2gxb_component.rx_rate_match_ordered_set_based = "true",
		alt2gxb_component.rx_rate_match_pattern1 = "10100010010101111100",
		alt2gxb_component.rx_rate_match_pattern2 = "10101011011010000011",
		alt2gxb_component.rx_rate_match_pattern_size = 20,
		alt2gxb_component.rx_rate_match_skip_set_based = "true",
		alt2gxb_component.rx_run_length = 5,
		alt2gxb_component.rx_run_length_enable = "true",
		alt2gxb_component.rx_signal_detect_threshold = 2,
		alt2gxb_component.rx_use_align_state_machine = "true",
		alt2gxb_component.rx_use_clkout = "true",
		alt2gxb_component.rx_use_coreclk = "false",
		alt2gxb_component.rx_use_cruclk = "true",
		alt2gxb_component.rx_use_deserializer_double_data_mode = "false",
		alt2gxb_component.rx_use_deskew_fifo = "false",
		alt2gxb_component.rx_use_double_data_mode = "false",
		alt2gxb_component.rx_use_rate_match_pattern1_only = "false",
		alt2gxb_component.transmitter_termination = "oct_100_ohms",
		alt2gxb_component.tx_8b_10b_compatibility_mode = "true",
		alt2gxb_component.tx_8b_10b_mode = "normal",
		alt2gxb_component.tx_allow_polarity_inversion = "false",
		alt2gxb_component.tx_analog_power = "1.5v",
		alt2gxb_component.tx_channel_width = 8,
		alt2gxb_component.tx_common_mode = "0.6v",
		alt2gxb_component.tx_data_rate = 1250,
		alt2gxb_component.tx_data_rate_remainder = 0,
		alt2gxb_component.tx_enable_bit_reversal = "false",
		alt2gxb_component.tx_enable_idle_selection = "true",
		alt2gxb_component.tx_enable_self_test_mode = "false",
		alt2gxb_component.tx_refclk_divide_by = 1,
		alt2gxb_component.tx_transmit_protocol = "basic",
		alt2gxb_component.tx_use_coreclk = "false",
		alt2gxb_component.tx_use_double_data_mode = "false",
		alt2gxb_component.tx_use_serializer_double_data_mode = "false",
		alt2gxb_component.use_calibration_block = "true",
		alt2gxb_component.vod_ctrl_setting = 3;
endmodule