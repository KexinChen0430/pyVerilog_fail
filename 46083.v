module  altpcie_reconfig_3cgx_alt_c3gxb_reconfig_ffp
	(
	busy,
	offset_cancellation_reset,
	reconfig_clk,
	reconfig_fromgxb,
	reconfig_togxb) /* synthesis synthesis_clearbox=2 */;
	output   busy;
	input   offset_cancellation_reset;
	input   reconfig_clk;
	input   [4:0]  reconfig_fromgxb;
	output   [3:0]  reconfig_togxb;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   offset_cancellation_reset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  wire_calibration_c3gxb_busy;
	wire  [15:0]   wire_calibration_c3gxb_dprio_addr;
	wire  [15:0]   wire_calibration_c3gxb_dprio_dataout;
	wire  wire_calibration_c3gxb_dprio_rden;
	wire  wire_calibration_c3gxb_dprio_wren;
	wire  [8:0]   wire_calibration_c3gxb_quad_addr;
	wire  wire_calibration_c3gxb_retain_addr;
	wire  wire_dprio_busy;
	wire  [15:0]   wire_dprio_dataout;
	wire  wire_dprio_dpriodisable;
	wire  wire_dprio_dprioin;
	wire  wire_dprio_dprioload;
	(* ALTERA_ATTRIBUTE = {"PRESERVE_REGISTER=ON"} *)
	reg	[11:0]	address_pres_reg;
	wire  cal_busy;
	wire  [0:0]  cal_dprioout_wire;
	wire  [3:0]  cal_testbuses;
	wire  [2:0]  channel_address;
	wire  [15:0]  dprio_address;
	wire  [8:0]  quad_address;
	wire  reconfig_reset_all;
	alt_cal_c3gxb   calibration_c3gxb
	(
	.busy(wire_calibration_c3gxb_busy),
	.cal_error(),
	.clock(reconfig_clk),
	.dprio_addr(wire_calibration_c3gxb_dprio_addr),
	.dprio_busy(wire_dprio_busy),
	.dprio_datain(wire_dprio_dataout),
	.dprio_dataout(wire_calibration_c3gxb_dprio_dataout),
	.dprio_rden(wire_calibration_c3gxb_dprio_rden),
	.dprio_wren(wire_calibration_c3gxb_dprio_wren),
	.quad_addr(wire_calibration_c3gxb_quad_addr),
	.remap_addr(address_pres_reg),
	.reset((offset_cancellation_reset | reconfig_reset_all)),
	.retain_addr(wire_calibration_c3gxb_retain_addr),
	.testbuses(cal_testbuses)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.start(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		calibration_c3gxb.channel_address_width = 2,
		calibration_c3gxb.number_of_channels = 4,
		calibration_c3gxb.sim_model_mode = "FALSE",
		calibration_c3gxb.lpm_type = "alt_cal_c3gxb";
	altpcie_reconfig_3cgx_alt_dprio_v5k   dprio
	(
	.address(({16{wire_calibration_c3gxb_busy}} & dprio_address)),
	.busy(wire_dprio_busy),
	.datain(({16{wire_calibration_c3gxb_busy}} & wire_calibration_c3gxb_dprio_dataout)),
	.dataout(wire_dprio_dataout),
	.dpclk(reconfig_clk),
	.dpriodisable(wire_dprio_dpriodisable),
	.dprioin(wire_dprio_dprioin),
	.dprioload(wire_dprio_dprioload),
	.dprioout(cal_dprioout_wire),
	.quad_address(address_pres_reg[11:3]),
	.rden((wire_calibration_c3gxb_busy & wire_calibration_c3gxb_dprio_rden)),
	.reset(reconfig_reset_all),
	.wren((wire_calibration_c3gxb_busy & wire_calibration_c3gxb_dprio_wren)),
	.wren_data(wire_calibration_c3gxb_retain_addr));
	// synopsys translate_off
	initial
		address_pres_reg = 0;
	// synopsys translate_on
	always @ ( posedge reconfig_clk or  posedge reconfig_reset_all)
		if (reconfig_reset_all == 1'b1) address_pres_reg <= 12'b0;
		else  address_pres_reg <= {quad_address, channel_address};
	assign
		busy = cal_busy,
		cal_busy = wire_calibration_c3gxb_busy,
		cal_dprioout_wire = {reconfig_fromgxb[0]},
		cal_testbuses = {reconfig_fromgxb[4:1]},
		channel_address = wire_calibration_c3gxb_dprio_addr[14:12],
		dprio_address = {wire_calibration_c3gxb_dprio_addr[15], address_pres_reg[2:0], wire_calibration_c3gxb_dprio_addr[11:0]},
		quad_address = wire_calibration_c3gxb_quad_addr,
		reconfig_reset_all = 1'b0,
		reconfig_togxb = {wire_calibration_c3gxb_busy, wire_dprio_dprioload, wire_dprio_dpriodisable, wire_dprio_dprioin};
endmodule