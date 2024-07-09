module  altpcie_reconfig_3cgx_alt_dprio_v5k
	(
	address,
	busy,
	datain,
	dataout,
	dpclk,
	dpriodisable,
	dprioin,
	dprioload,
	dprioout,
	quad_address,
	rden,
	reset,
	wren,
	wren_data) /* synthesis synthesis_clearbox=2 */;
	input   [15:0]  address;
	output   busy;
	input   [15:0]  datain;
	output   [15:0]  dataout;
	input   dpclk;
	output   dpriodisable;
	output   dprioin;
	output   dprioload;
	input   dprioout;
	input   [8:0]  quad_address;
	input   rden;
	input   reset;
	input   wren;
	input   wren_data;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [15:0]  datain;
	tri0   rden;
	tri0   reset;
	tri0   wren;
	tri0   wren_data;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	(* ALTERA_ATTRIBUTE = {"PRESERVE_REGISTER=ON;POWER_UP_LEVEL=LOW"} *)
	reg	[31:0]	addr_shift_reg;
	(* ALTERA_ATTRIBUTE = {"PRESERVE_REGISTER=ON;POWER_UP_LEVEL=LOW"} *)
	reg	[15:0]	in_data_shift_reg;
	(* ALTERA_ATTRIBUTE = {"PRESERVE_REGISTER=ON;POWER_UP_LEVEL=LOW"} *)
	reg	[15:0]	rd_out_data_shift_reg;
	wire	[2:0]	wire_startup_cntr_d;
	(* ALTERA_ATTRIBUTE = {"PRESERVE_REGISTER=ON;POWER_UP_LEVEL=LOW"} *)
	reg	[2:0]	startup_cntr;
	wire	[2:0]	wire_startup_cntr_ena;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	[2:0]	state_mc_reg;
	(* ALTERA_ATTRIBUTE = {"PRESERVE_REGISTER=ON;POWER_UP_LEVEL=LOW"} *)
	reg	[31:0]	wr_out_data_shift_reg;
	wire  wire_pre_amble_cmpr_aeb;
	wire  wire_pre_amble_cmpr_agb;
	wire  wire_rd_data_output_cmpr_ageb;
	wire  wire_rd_data_output_cmpr_alb;
	wire  wire_state_mc_cmpr_aeb;
	wire  [5:0]   wire_state_mc_counter_q;
	wire  [7:0]   wire_state_mc_decode_eq;
	wire	wire_dprioin_mux_dataout;
	wire  busy_state;
	wire  idle_state;
	wire  rd_addr_done;
	wire  rd_addr_state;
	wire  rd_data_done;
	wire  rd_data_input_state;
	wire  rd_data_output_state;
	wire  rd_data_state;
	wire rdinc;
	wire  read_state;
	wire  s0_to_0;
	wire  s0_to_1;
	wire  s1_to_0;
	wire  s1_to_1;
	wire  s2_to_0;
	wire  s2_to_1;
	wire  startup_done;
	wire  startup_idle;
	wire  wr_addr_done;
	wire  wr_addr_state;
	wire  wr_data_done;
	wire  wr_data_state;
	wire  write_state;
	// synopsys translate_off
	initial
		addr_shift_reg = 0;
	// synopsys translate_on
	always @ ( posedge dpclk or  posedge reset)
		if (reset == 1'b1) addr_shift_reg <= 32'b0;
		else
			if (wire_pre_amble_cmpr_aeb == 1'b1) addr_shift_reg <= {{2{{2{1'b0}}}}, 1'b0, quad_address[8:0], 2'b10, address};
			else  addr_shift_reg <= {addr_shift_reg[30:0], 1'b0};
	// synopsys translate_off
	initial
		in_data_shift_reg = 0;
	// synopsys translate_on
	always @ ( posedge dpclk or  posedge reset)
		if (reset == 1'b1) in_data_shift_reg <= 16'b0;
		else if  (rd_data_input_state == 1'b1)   in_data_shift_reg <= {in_data_shift_reg[14:0], dprioout};
	// synopsys translate_off
	initial
		rd_out_data_shift_reg = 0;
	// synopsys translate_on
	always @ ( posedge dpclk or  posedge reset)
		if (reset == 1'b1) rd_out_data_shift_reg <= 16'b0;
		else
			if (wire_pre_amble_cmpr_aeb == 1'b1) rd_out_data_shift_reg <= {{2{1'b0}}, {2{1'b1}}, 1'b0, quad_address, 2'b10};
			else  rd_out_data_shift_reg <= {rd_out_data_shift_reg[14:0], 1'b0};
	// synopsys translate_off
	initial
		startup_cntr[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge dpclk)
		if (wire_startup_cntr_ena[0:0] == 1'b1)
			if (reset == 1'b1) startup_cntr[0:0] <= 1'b0;
			else  startup_cntr[0:0] <= wire_startup_cntr_d[0:0];
	// synopsys translate_off
	initial
		startup_cntr[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge dpclk)
		if (wire_startup_cntr_ena[1:1] == 1'b1)
			if (reset == 1'b1) startup_cntr[1:1] <= 1'b0;
			else  startup_cntr[1:1] <= wire_startup_cntr_d[1:1];
	// synopsys translate_off
	initial
		startup_cntr[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge dpclk)
		if (wire_startup_cntr_ena[2:2] == 1'b1)
			if (reset == 1'b1) startup_cntr[2:2] <= 1'b0;
			else  startup_cntr[2:2] <= wire_startup_cntr_d[2:2];
	assign
		wire_startup_cntr_d = {(startup_cntr[2] ^ (startup_cntr[1] & startup_cntr[0])), (startup_cntr[0] ^ startup_cntr[1]), (~ startup_cntr[0])};
	assign
		wire_startup_cntr_ena = {3{((((rden | wren) | rdinc) | (~ startup_idle)) & (~ startup_done))}};
	// synopsys translate_off
	initial
		state_mc_reg = 0;
	// synopsys translate_on
	always @ ( posedge dpclk or  posedge reset)
		if (reset == 1'b1) state_mc_reg <= 3'b0;
		else  state_mc_reg <= {(s2_to_1 | (((~ s2_to_0) & (~ s2_to_1)) & state_mc_reg[2])), (s1_to_1 | (((~ s1_to_0) & (~ s1_to_1)) & state_mc_reg[1])), (s0_to_1 | (((~ s0_to_0) & (~ s0_to_1)) & state_mc_reg[0]))};
	// synopsys translate_off
	initial
		wr_out_data_shift_reg = 0;
	// synopsys translate_on
	always @ ( posedge dpclk or  posedge reset)
		if (reset == 1'b1) wr_out_data_shift_reg <= 32'b0;
		else
			if (wire_pre_amble_cmpr_aeb == 1'b1) wr_out_data_shift_reg <= {{2{1'b0}}, 2'b01, 1'b0, quad_address[8:0], 2'b10, datain};
			else  wr_out_data_shift_reg <= {wr_out_data_shift_reg[30:0], 1'b0};
	lpm_compare   pre_amble_cmpr
	(
	.aeb(wire_pre_amble_cmpr_aeb),
	.agb(wire_pre_amble_cmpr_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(wire_state_mc_counter_q),
	.datab(6'b011111)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		pre_amble_cmpr.lpm_width = 6,
		pre_amble_cmpr.lpm_type = "lpm_compare";
	lpm_compare   rd_data_output_cmpr
	(
	.aeb(),
	.agb(),
	.ageb(wire_rd_data_output_cmpr_ageb),
	.alb(wire_rd_data_output_cmpr_alb),
	.aleb(),
	.aneb(),
	.dataa(wire_state_mc_counter_q),
	.datab(6'b110000)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		rd_data_output_cmpr.lpm_width = 6,
		rd_data_output_cmpr.lpm_type = "lpm_compare";
	lpm_compare   state_mc_cmpr
	(
	.aeb(wire_state_mc_cmpr_aeb),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(wire_state_mc_counter_q),
	.datab({6{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		state_mc_cmpr.lpm_width = 6,
		state_mc_cmpr.lpm_type = "lpm_compare";
	lpm_counter   state_mc_counter
	(
	.clock(dpclk),
	.cnt_en((write_state | read_state)),
	.cout(),
	.eq(),
	.q(wire_state_mc_counter_q),
	.sclr(reset)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.data({6{1'b0}}),
	.sload(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		state_mc_counter.lpm_port_updown = "PORT_UNUSED",
		state_mc_counter.lpm_width = 6,
		state_mc_counter.lpm_type = "lpm_counter";
	lpm_decode   state_mc_decode
	(
	.data(state_mc_reg),
	.eq(wire_state_mc_decode_eq)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0),
	.enable(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		state_mc_decode.lpm_decodes = 8,
		state_mc_decode.lpm_width = 3,
		state_mc_decode.lpm_type = "lpm_decode";
	or(wire_dprioin_mux_dataout, ((((((wr_addr_state | rd_addr_state) & addr_shift_reg[31]) & wire_pre_amble_cmpr_agb) | ((~ wire_pre_amble_cmpr_agb) & (wr_addr_state | rd_addr_state))) | (((wr_data_state & wr_out_data_shift_reg[31]) & wire_pre_amble_cmpr_agb) | ((~ wire_pre_amble_cmpr_agb) & wr_data_state))) | (((rd_data_output_state & rd_out_data_shift_reg[15]) & wire_pre_amble_cmpr_agb) | ((~ wire_pre_amble_cmpr_agb) & rd_data_output_state))), ~(((write_state | rd_addr_state) | rd_data_output_state)));
	assign
		busy = busy_state,
		busy_state = (write_state | read_state),
		dataout = in_data_shift_reg,
		dpriodisable = (~ (startup_cntr[2] & (startup_cntr[0] | startup_cntr[1]))),
		dprioin = wire_dprioin_mux_dataout,
		dprioload = (~ ((startup_cntr[0] ^ startup_cntr[1]) & (~ startup_cntr[2]))),
		idle_state = wire_state_mc_decode_eq[0],
		rd_addr_done = (rd_addr_state & wire_state_mc_cmpr_aeb),
		rd_addr_state = (wire_state_mc_decode_eq[5] & startup_done),
		rd_data_done = (rd_data_state & wire_state_mc_cmpr_aeb),
		rd_data_input_state = (wire_rd_data_output_cmpr_ageb & rd_data_state),
		rd_data_output_state = (wire_rd_data_output_cmpr_alb & rd_data_state),
		rd_data_state = (wire_state_mc_decode_eq[7] & startup_done),
		rdinc = 1'b0,
		read_state = (rd_addr_state | rd_data_state),
		s0_to_0 = ((wr_data_state & wr_data_done) | (rd_data_state & rd_data_done)),
		s0_to_1 = (((idle_state & (wren | ((~ wren) & ((rden | rdinc) | wren_data)))) | (wr_addr_state & wr_addr_done)) | (rd_addr_state & rd_addr_done)),
		s1_to_0 = (((wr_data_state & wr_data_done) | (rd_data_state & rd_data_done)) | (idle_state & (wren | (((~ wren) & (~ wren_data)) & rden)))),
		s1_to_1 = (((idle_state & ((~ wren) & (rdinc | wren_data))) | (wr_addr_state & wr_addr_done)) | (rd_addr_state & rd_addr_done)),
		s2_to_0 = ((((wr_addr_state & wr_addr_done) | (wr_data_state & wr_data_done)) | (rd_data_state & rd_data_done)) | (idle_state & (wren | wren_data))),
		s2_to_1 = ((idle_state & (((~ wren) & (~ wren_data)) & (rdinc | rden))) | (rd_addr_state & rd_addr_done)),
		startup_done = ((startup_cntr[2] & (~ startup_cntr[0])) & startup_cntr[1]),
		startup_idle = ((~ startup_cntr[0]) & (~ (startup_cntr[2] ^ startup_cntr[1]))),
		wr_addr_done = (wr_addr_state & wire_state_mc_cmpr_aeb),
		wr_addr_state = (wire_state_mc_decode_eq[1] & startup_done),
		wr_data_done = (wr_data_state & wire_state_mc_cmpr_aeb),
		wr_data_state = (wire_state_mc_decode_eq[3] & startup_done),
		write_state = (wr_addr_state | wr_data_state);
endmodule