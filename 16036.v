module amm_master_qsys_with_pcie_pcie_ip_altgx_internal (
	cal_blk_clk,
	fixedclk,
	gxb_powerdown,
	pipe8b10binvpolarity,
	pll_areset,
	pll_inclk,
	powerdn,
	reconfig_clk,
	reconfig_togxb,
	rx_analogreset,
	rx_datain,
	rx_digitalreset,
	rx_elecidleinfersel,
	tx_ctrlenable,
	tx_datain,
	tx_detectrxloop,
	tx_digitalreset,
	tx_forcedispcompliance,
	tx_forceelecidle,
	hip_tx_clkout,
	pipedatavalid,
	pipeelecidle,
	pipephydonestatus,
	pipestatus,
	pll_locked,
	reconfig_fromgxb,
	rx_ctrldetect,
	rx_dataout,
	rx_freqlocked,
	rx_patterndetect,
	rx_syncstatus,
	tx_clkout,
	tx_dataout)/* synthesis synthesis_clearbox = 2 */;
	input	  cal_blk_clk;
	input	  fixedclk;
	input	[0:0]  gxb_powerdown;
	input	[0:0]  pipe8b10binvpolarity;
	input	[0:0]  pll_areset;
	input	[0:0]  pll_inclk;
	input	[1:0]  powerdn;
	input	  reconfig_clk;
	input	[3:0]  reconfig_togxb;
	input	[0:0]  rx_analogreset;
	input	[0:0]  rx_datain;
	input	[0:0]  rx_digitalreset;
	input	[2:0]  rx_elecidleinfersel;
	input	[0:0]  tx_ctrlenable;
	input	[7:0]  tx_datain;
	input	[0:0]  tx_detectrxloop;
	input	[0:0]  tx_digitalreset;
	input	[0:0]  tx_forcedispcompliance;
	input	[0:0]  tx_forceelecidle;
	output	[0:0]  hip_tx_clkout;
	output	[0:0]  pipedatavalid;
	output	[0:0]  pipeelecidle;
	output	[0:0]  pipephydonestatus;
	output	[2:0]  pipestatus;
	output	[0:0]  pll_locked;
	output	[4:0]  reconfig_fromgxb;
	output	[0:0]  rx_ctrldetect;
	output	[7:0]  rx_dataout;
	output	[0:0]  rx_freqlocked;
	output	[0:0]  rx_patterndetect;
	output	[0:0]  rx_syncstatus;
	output	[0:0]  tx_clkout;
	output	[0:0]  tx_dataout;
	parameter		starting_channel_number = 0;
	wire [0:0] sub_wire0;
	wire [0:0] sub_wire1;
	wire [0:0] sub_wire2;
	wire [0:0] sub_wire3;
	wire [2:0] sub_wire4;
	wire [0:0] sub_wire5;
	wire [4:0] sub_wire6;
	wire [0:0] sub_wire7;
	wire [7:0] sub_wire8;
	wire [0:0] sub_wire9;
	wire [0:0] sub_wire10;
	wire [0:0] sub_wire11;
	wire [0:0] sub_wire12;
	wire [0:0] sub_wire13;
	wire [0:0] hip_tx_clkout = sub_wire0[0:0];
	wire [0:0] pipedatavalid = sub_wire1[0:0];
	wire [0:0] pipeelecidle = sub_wire2[0:0];
	wire [0:0] pipephydonestatus = sub_wire3[0:0];
	wire [2:0] pipestatus = sub_wire4[2:0];
	wire [0:0] pll_locked = sub_wire5[0:0];
	wire [4:0] reconfig_fromgxb = sub_wire6[4:0];
	wire [0:0] rx_ctrldetect = sub_wire7[0:0];
	wire [7:0] rx_dataout = sub_wire8[7:0];
	wire [0:0] rx_freqlocked = sub_wire9[0:0];
	wire [0:0] rx_patterndetect = sub_wire10[0:0];
	wire [0:0] rx_syncstatus = sub_wire11[0:0];
	wire [0:0] tx_clkout = sub_wire12[0:0];
	wire [0:0] tx_dataout = sub_wire13[0:0];
	amm_master_qsys_with_pcie_pcie_ip_altgx_internal_alt_c3gxb_6ni8	amm_master_qsys_with_pcie_pcie_ip_altgx_internal_alt_c3gxb_6ni8_component (
				.cal_blk_clk (cal_blk_clk),
				.fixedclk (fixedclk),
				.gxb_powerdown (gxb_powerdown),
				.pipe8b10binvpolarity (pipe8b10binvpolarity),
				.pll_areset (pll_areset),
				.pll_inclk (pll_inclk),
				.powerdn (powerdn),
				.reconfig_clk (reconfig_clk),
				.reconfig_togxb (reconfig_togxb),
				.rx_analogreset (rx_analogreset),
				.rx_datain (rx_datain),
				.rx_digitalreset (rx_digitalreset),
				.rx_elecidleinfersel (rx_elecidleinfersel),
				.tx_ctrlenable (tx_ctrlenable),
				.tx_datain (tx_datain),
				.tx_detectrxloop (tx_detectrxloop),
				.tx_digitalreset (tx_digitalreset),
				.tx_forcedispcompliance (tx_forcedispcompliance),
				.tx_forceelecidle (tx_forceelecidle),
				.hip_tx_clkout (sub_wire0),
				.pipedatavalid (sub_wire1),
				.pipeelecidle (sub_wire2),
				.pipephydonestatus (sub_wire3),
				.pipestatus (sub_wire4),
				.pll_locked (sub_wire5),
				.reconfig_fromgxb (sub_wire6),
				.rx_ctrldetect (sub_wire7),
				.rx_dataout (sub_wire8),
				.rx_freqlocked (sub_wire9),
				.rx_patterndetect (sub_wire10),
				.rx_syncstatus (sub_wire11),
				.tx_clkout (sub_wire12),
				.tx_dataout (sub_wire13))/* synthesis synthesis_clearbox=2
	 clearbox_macroname = alt_c3gxb
	 clearbox_defparam = "effective_data_rate=2500 Mbps;enable_lc_tx_pll=false;enable_pll_inclk_alt_drive_rx_cru=true;enable_pll_inclk_drive_rx_cru=true;equalizer_dcgain_setting=1;gen_reconfig_pll=false;gx_channel_type=;input_clock_frequency=100.0 MHz;intended_device_family=Cyclone IV GX;intended_device_speed_grade=6;intended_device_variant=ANY;loopback_mode=none;lpm_type=alt_c3gxb;number_of_channels=1;operation_mode=duplex;pll_bandwidth_type=Auto;pll_control_width=1;pll_inclk_period=10000;pll_pfd_fb_mode=internal;preemphasis_ctrl_1stposttap_setting=1;protocol=pcie;receiver_termination=oct_100_ohms;reconfig_dprio_mode=0;rx_8b_10b_mode=normal;rx_align_pattern=0101111100;rx_align_pattern_length=10;rx_allow_align_polarity_inversion=false;rx_allow_pipe_polarity_inversion=true;rx_bitslip_enable=false;rx_byte_ordering_mode=NONE;rx_channel_bonding=indv;rx_channel_width=8;rx_common_mode=0.82v;rx_cru_inclock0_period=10000;rx_datapath_protocol=pipe;rx_data_rate=2500;rx_data_rate_remainder=0;rx_digitalreset_port_width=1;rx_enable_bit_reversal=false;rx_enable_lock_to_data_sig=false;rx_enable_lock_to_refclk_sig=false;rx_enable_self_test_mode=false;rx_force_signal_detect=false;rx_ppmselect=8;rx_rate_match_fifo_mode=normal;rx_rate_match_pattern1=11010000111010000011;rx_rate_match_pattern2=00101111000101111100;rx_rate_match_pattern_size=20;rx_run_length=40;rx_run_length_enable=true;rx_signal_detect_threshold=4;rx_use_align_state_machine=true;rx_use_clkout=false;rx_use_coreclk=false;
	                      rx_use_deserializer_double_data_mode=false;rx_use_deskew_fifo=false;rx_use_double_data_mode=false;rx_use_pipe8b10binvpolarity=true;rx_use_rate_match_pattern1_only=false;transmitter_termination=oct_100_ohms;tx_8b_10b_mode=normal;tx_allow_polarity_inversion=false;tx_channel_bonding=indv;tx_channel_width=8;tx_clkout_width=1;tx_common_mode=0.65v;tx_data_rate=2500;tx_data_rate_remainder=0;tx_digitalreset_port_width=1;tx_enable_bit_reversal=false;tx_enable_self_test_mode=false;tx_pll_bandwidth_type=Auto;tx_pll_inclk0_period=10000;tx_pll_type=CMU;tx_slew_rate=low;tx_transmit_protocol=pipe;tx_use_coreclk=false;tx_use_double_data_mode=false;tx_use_serializer_double_data_mode=false;use_calibration_block=true;vod_ctrl_setting=4;elec_idle_infer_enable=false;enable_0ppm=false;equalization_setting=5;gxb_powerdown_width=1;hip_enable=true;iqtxrxclk_allowed=;number_of_quads=1;pll_divide_by=2;pll_multiply_by=25;reconfig_calibration=true;reconfig_fromgxb_port_width=5;reconfig_pll_control_width=1;reconfig_togxb_port_width=4;rx_cdrctrl_enable=true;rx_deskew_pattern=0;rx_dwidth_factor=1;rx_enable_second_order_loop=false;rx_loop_1_digital_filter=8;rx_signal_detect_loss_threshold=3;rx_signal_detect_valid_threshold=14;rx_use_external_termination=false;rx_word_aligner_num_byte=1;top_module_name=amm_master_qsys_with_pcie_pcie_ip_altgx_internal;tx_bitslip_enable=FALSE;tx_dwidth_factor=1;tx_use_external_termination=false;" */;
	defparam
		amm_master_qsys_with_pcie_pcie_ip_altgx_internal_alt_c3gxb_6ni8_component.starting_channel_number = starting_channel_number;
endmodule