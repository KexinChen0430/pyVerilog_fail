module altpcie_reconfig_3cgx (
	offset_cancellation_reset,
	reconfig_clk,
	reconfig_fromgxb,
	busy,
	reconfig_togxb)/* synthesis synthesis_clearbox = 2 */;
	input	  offset_cancellation_reset;
	input	  reconfig_clk;
	input	[4:0]  reconfig_fromgxb;
	output	  busy;
	output	[3:0]  reconfig_togxb;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  offset_cancellation_reset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [3:0] sub_wire0;
	wire  sub_wire1;
	wire [3:0] reconfig_togxb = sub_wire0[3:0];
	wire  busy = sub_wire1;
	altpcie_reconfig_3cgx_alt_c3gxb_reconfig_ffp	altpcie_reconfig_3cgx_alt_c3gxb_reconfig_ffp_component (
				.reconfig_clk (reconfig_clk),
				.offset_cancellation_reset (offset_cancellation_reset),
				.reconfig_fromgxb (reconfig_fromgxb),
				.reconfig_togxb (sub_wire0),
				.busy (sub_wire1))/* synthesis synthesis_clearbox=2
	 clearbox_macroname = alt_c3gxb_reconfig
	 clearbox_defparam = "cbx_blackbox_list=-lpm_mux;intended_device_family=Cyclone IV GX;number_of_channels=4;number_of_reconfig_ports=1;enable_buf_cal=true;reconfig_fromgxb_width=5;reconfig_togxb_width=4;" */;
endmodule