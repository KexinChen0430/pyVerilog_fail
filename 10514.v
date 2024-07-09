module altera_tse_pma_lvds_tx (
	pll_areset,
	tx_in,
	tx_inclock,
	tx_out);
	input	  pll_areset;
	input	[9:0]  tx_in;
	input	  tx_inclock;
	output	[0:0]  tx_out;
	wire [0:0] sub_wire0;
	wire [0:0] tx_out = sub_wire0[0:0];
	altlvds_tx	ALTLVDS_TX_component (
				.pll_areset (pll_areset),
				.tx_in (tx_in),
				.tx_inclock (tx_inclock),
				.tx_out (sub_wire0),
				.sync_inclock (1'b0),
				.tx_coreclock (),
				.tx_data_reset (1'b0),
				.tx_enable (1'b1),
				.tx_locked (),
				.tx_outclock (),
				.tx_pll_enable (1'b1),
				.tx_syncclock (1'b0));
	defparam
		ALTLVDS_TX_component.center_align_msb = "UNUSED",
		ALTLVDS_TX_component.common_rx_tx_pll = "ON",
		ALTLVDS_TX_component.coreclock_divide_by = 1,
		ALTLVDS_TX_component.data_rate = "1250.0 Mbps",
		ALTLVDS_TX_component.deserialization_factor = 10,
		ALTLVDS_TX_component.differential_drive = 0,
		ALTLVDS_TX_component.implement_in_les = "OFF",
		ALTLVDS_TX_component.inclock_boost = 0,
		ALTLVDS_TX_component.inclock_data_alignment = "EDGE_ALIGNED",
		ALTLVDS_TX_component.inclock_period = 8000,
		ALTLVDS_TX_component.inclock_phase_shift = 0,
		ALTLVDS_TX_component.intended_device_family = "Stratix III",
		ALTLVDS_TX_component.lpm_hint = "UNUSED",
		ALTLVDS_TX_component.lpm_type = "altlvds_tx",
		ALTLVDS_TX_component.multi_clock = "OFF",
		ALTLVDS_TX_component.number_of_channels = 1,
		ALTLVDS_TX_component.outclock_alignment = "EDGE_ALIGNED",
		ALTLVDS_TX_component.outclock_divide_by = 10,
		ALTLVDS_TX_component.outclock_duty_cycle = 50,
		ALTLVDS_TX_component.outclock_multiply_by = 1,
		ALTLVDS_TX_component.outclock_phase_shift = 0,
		ALTLVDS_TX_component.outclock_resource = "AUTO",
		ALTLVDS_TX_component.output_data_rate = 1250,
		ALTLVDS_TX_component.pll_self_reset_on_loss_lock = "OFF",
		ALTLVDS_TX_component.preemphasis_setting = 0,
		ALTLVDS_TX_component.refclk_frequency = "125.00 MHz",
		ALTLVDS_TX_component.registered_input = "TX_CLKIN",
		ALTLVDS_TX_component.use_external_pll = "OFF",
		ALTLVDS_TX_component.use_no_phase_shift = "ON",
		ALTLVDS_TX_component.vod_setting = 0,
		ALTLVDS_TX_component.clk_src_is_pll = "off";
endmodule