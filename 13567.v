module pcie_hip_s4gx_gen2_x4_128_serdes (
	cal_blk_clk,
	fixedclk,
	gxb_powerdown,
	pipe8b10binvpolarity,
	pll_inclk,
	pll_powerdown,
	powerdn,
	rateswitch,
	reconfig_clk,
	reconfig_togxb,
	rx_analogreset,
	rx_cruclk,
	rx_datain,
	rx_digitalreset,
	rx_elecidleinfersel,
	tx_ctrlenable,
	tx_datain,
	tx_detectrxloop,
	tx_digitalreset,
	tx_forcedispcompliance,
	tx_forceelecidle,
	tx_pipedeemph,
	tx_pipemargin,
	coreclkout,
	hip_tx_clkout,
	pipedatavalid,
	pipeelecidle,
	pipephydonestatus,
	pipestatus,
	pll_locked,
	rateswitchbaseclock,
	reconfig_fromgxb,
	rx_ctrldetect,
	rx_dataout,
	rx_freqlocked,
	rx_patterndetect,
	rx_pll_locked,
	rx_signaldetect,
	rx_syncstatus,
	tx_dataout)/* synthesis synthesis_clearbox = 2 */;
	input	  cal_blk_clk;
	input	  fixedclk;
	input	[0:0]  gxb_powerdown;
	input	[3:0]  pipe8b10binvpolarity;
	input	  pll_inclk;
	input	[0:0]  pll_powerdown;
	input	[7:0]  powerdn;
	input	[0:0]  rateswitch;
	input	  reconfig_clk;
	input	[3:0]  reconfig_togxb;
	input	[0:0]  rx_analogreset;
	input	[3:0]  rx_cruclk;
	input	[3:0]  rx_datain;
	input	[0:0]  rx_digitalreset;
	input	[11:0]  rx_elecidleinfersel;
	input	[3:0]  tx_ctrlenable;
	input	[31:0]  tx_datain;
	input	[3:0]  tx_detectrxloop;
	input	[0:0]  tx_digitalreset;
	input	[3:0]  tx_forcedispcompliance;
	input	[3:0]  tx_forceelecidle;
	input	[3:0]  tx_pipedeemph;
	input	[11:0]  tx_pipemargin;
	output	[0:0]  coreclkout;
	output	[3:0]  hip_tx_clkout;
	output	[3:0]  pipedatavalid;
	output	[3:0]  pipeelecidle;
	output	[3:0]  pipephydonestatus;
	output	[11:0]  pipestatus;
	output	[0:0]  pll_locked;
	output	[0:0]  rateswitchbaseclock;
	output	[16:0]  reconfig_fromgxb;
	output	[3:0]  rx_ctrldetect;
	output	[31:0]  rx_dataout;
	output	[3:0]  rx_freqlocked;
	output	[3:0]  rx_patterndetect;
	output	[3:0]  rx_pll_locked;
	output	[3:0]  rx_signaldetect;
	output	[3:0]  rx_syncstatus;
	output	[3:0]  tx_dataout;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	[3:0]  rx_cruclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	parameter		starting_channel_number = 0;
	wire [3:0] sub_wire0;
	wire [3:0] sub_wire1;
	wire [16:0] sub_wire2;
	wire [11:0] sub_wire3;
	wire [3:0] sub_wire4;
	wire [3:0] sub_wire5;
	wire [0:0] sub_wire6;
	wire [31:0] sub_wire7;
	wire [3:0] sub_wire8;
	wire [3:0] sub_wire9;
	wire [0:0] sub_wire10;
	wire [3:0] sub_wire11;
	wire [3:0] sub_wire12;
	wire [3:0] sub_wire13;
	wire [3:0] sub_wire14;
	wire [0:0] sub_wire15;
	wire [3:0] sub_wire16;
	wire [3:0] rx_patterndetect = sub_wire0[3:0];
	wire [3:0] rx_signaldetect = sub_wire1[3:0];
	wire [16:0] reconfig_fromgxb = sub_wire2[16:0];
	wire [11:0] pipestatus = sub_wire3[11:0];
	wire [3:0] rx_pll_locked = sub_wire4[3:0];
	wire [3:0] rx_syncstatus = sub_wire5[3:0];
	wire [0:0] coreclkout = sub_wire6[0:0];
	wire [31:0] rx_dataout = sub_wire7[31:0];
	wire [3:0] hip_tx_clkout = sub_wire8[3:0];
	wire [3:0] pipeelecidle = sub_wire9[3:0];
	wire [0:0] rateswitchbaseclock = sub_wire10[0:0];
	wire [3:0] tx_dataout = sub_wire11[3:0];
	wire [3:0] rx_ctrldetect = sub_wire12[3:0];
	wire [3:0] pipedatavalid = sub_wire13[3:0];
	wire [3:0] pipephydonestatus = sub_wire14[3:0];
	wire [0:0] pll_locked = sub_wire15[0:0];
	wire [3:0] rx_freqlocked = sub_wire16[3:0];
	pcie_hip_s4gx_gen2_x4_128_serdes_alt4gxb_svoa	pcie_hip_s4gx_gen2_x4_128_serdes_alt4gxb_svoa_component (
				.reconfig_togxb (reconfig_togxb),
				.cal_blk_clk (cal_blk_clk),
				.tx_forceelecidle (tx_forceelecidle),
				.fixedclk (fixedclk),
				.rx_datain (rx_datain),
				.rx_digitalreset (rx_digitalreset),
				.pipe8b10binvpolarity (pipe8b10binvpolarity),
				.pll_powerdown (pll_powerdown),
				.tx_datain (tx_datain),
				.tx_digitalreset (tx_digitalreset),
				.tx_pipedeemph (tx_pipedeemph),
				.gxb_powerdown (gxb_powerdown),
				.rx_cruclk (rx_cruclk),
				.tx_forcedispcompliance (tx_forcedispcompliance),
				.rateswitch (rateswitch),
				.reconfig_clk (reconfig_clk),
				.rx_analogreset (rx_analogreset),
				.powerdn (powerdn),
				.tx_ctrlenable (tx_ctrlenable),
				.tx_pipemargin (tx_pipemargin),
				.pll_inclk (pll_inclk),
				.rx_elecidleinfersel (rx_elecidleinfersel),
				.tx_detectrxloop (tx_detectrxloop),
				.rx_patterndetect (sub_wire0),
				.rx_signaldetect (sub_wire1),
				.reconfig_fromgxb (sub_wire2),
				.pipestatus (sub_wire3),
				.rx_pll_locked (sub_wire4),
				.rx_syncstatus (sub_wire5),
				.coreclkout (sub_wire6),
				.rx_dataout (sub_wire7),
				.hip_tx_clkout (sub_wire8),
				.pipeelecidle (sub_wire9),
				.rateswitchbaseclock (sub_wire10),
				.tx_dataout (sub_wire11),
				.rx_ctrldetect (sub_wire12),
				.pipedatavalid (sub_wire13),
				.pipephydonestatus (sub_wire14),
				.pll_locked (sub_wire15),
				.rx_freqlocked (sub_wire16))/* synthesis synthesis_clearbox=2
	 clearbox_macroname = alt4gxb
	 clearbox_defparam = "effective_data_rate=5000 Mbps;enable_lc_tx_pll=false;equalizer_ctrl_a_setting=0;equalizer_ctrl_b_setting=0;equalizer_ctrl_c_setting=0;equalizer_ctrl_d_setting=0;equalizer_ctrl_v_setting=0;equalizer_dcgain_setting=1;gen_reconfig_pll=false;gxb_analog_power=AUTO;gx_channel_type=AUTO;input_clock_frequency=100.0 MHz;intended_device_family=Stratix IV;intended_device_speed_grade=2;intended_device_variant=GX;loopback_mode=none;lpm_type=alt4gxb;number_of_channels=4;operation_mode=duplex;pll_control_width=1;pll_pfd_fb_mode=internal;preemphasis_ctrl_1stposttap_setting=0;protocol=pcie2;receiver_termination=oct_100_ohms;reconfig_dprio_mode=1;rx_8b_10b_mode=normal;rx_align_pattern=0101111100;rx_align_pattern_length=10;rx_allow_align_polarity_inversion=false;rx_allow_pipe_polarity_inversion=true;rx_bitslip_enable=false;rx_byte_ordering_mode=NONE;rx_channel_bonding=x4;rx_channel_width=8;rx_common_mode=0.82v;rx_cru_bandwidth_type=Auto;rx_cru_inclock0_period=10000;rx_datapath_protocol=pipe;rx_data_rate=5000;rx_data_rate_remainder=0;rx_digitalreset_port_width=1;rx_enable_bit_reversal=false;rx_enable_lock_to_data_sig=false;rx_enable_lock_to_refclk_sig=false;rx_enable_self_test_mode=false;rx_force_signal_detect=true;rx_ppmselect=32;rx_rate_match_fifo_mode=normal;rx_rate_match_pattern1=11010000111010000011;rx_rate_match_pattern2=00101111000101111100;rx_rate_match_pattern_size=20;rx_run_length=40;rx_run_length_enable=true;rx_signal_detect_threshold=4;rx_use_align_state_machine=true;
	                      rx_use_clkout=false;rx_use_coreclk=false;rx_use_cruclk=true;rx_use_deserializer_double_data_mode=false;rx_use_deskew_fifo=false;rx_use_double_data_mode=false;rx_use_pipe8b10binvpolarity=true;rx_use_rate_match_pattern1_only=false;transmitter_termination=oct_100_ohms;tx_8b_10b_mode=normal;tx_allow_polarity_inversion=false;tx_analog_power=AUTO;tx_channel_bonding=x4;tx_channel_width=8;tx_clkout_width=4;tx_common_mode=0.65v;tx_data_rate=5000;tx_data_rate_remainder=0;tx_digitalreset_port_width=1;tx_enable_bit_reversal=false;tx_enable_self_test_mode=false;tx_pll_bandwidth_type=High;tx_pll_inclk0_period=10000;tx_pll_type=CMU;tx_slew_rate=off;tx_transmit_protocol=pipe;tx_use_coreclk=false;tx_use_double_data_mode=false;tx_use_serializer_double_data_mode=false;use_calibration_block=true;vod_ctrl_setting=3;coreclkout_control_width=1;elec_idle_infer_enable=false;enable_0ppm=false;gxb_powerdown_width=1;hip_enable=true;number_of_quads=1;rateswitch_control_width=1;reconfig_calibration=true;reconfig_fromgxb_port_width=17;reconfig_togxb_port_width=4;rx_cdrctrl_enable=true;rx_cru_m_divider=0;rx_cru_n_divider=1;rx_cru_vco_post_scale_divider=1;rx_dwidth_factor=1;rx_signal_detect_loss_threshold=3;rx_signal_detect_valid_threshold=14;rx_use_external_termination=false;rx_word_aligner_num_byte=1;tx_dwidth_factor=1;tx_pll_clock_post_divider=1;tx_pll_m_divider=0;tx_pll_n_divider=1;tx_pll_vco_post_scale_divider=1;tx_use_external_termination=false;" */;
	defparam
		pcie_hip_s4gx_gen2_x4_128_serdes_alt4gxb_svoa_component.starting_channel_number = starting_channel_number;
endmodule