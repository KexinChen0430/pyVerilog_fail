module  pll_hdmi_reconf_pllrcfg_hk11
	(
	busy,
	clock,
	counter_param,
	counter_type,
	data_in,
	data_out,
	pll_areset,
	pll_areset_in,
	pll_configupdate,
	pll_scanclk,
	pll_scanclkena,
	pll_scandata,
	pll_scandataout,
	pll_scandone,
	read_param,
	reconfig,
	reset,
	reset_rom_address,
	rom_address_out,
	rom_data_in,
	write_from_rom,
	write_param,
	write_rom_ena) /* synthesis synthesis_clearbox=2 */;
	output   busy;
	input   clock;
	input   [2:0]  counter_param;
	input   [3:0]  counter_type;
	input   [8:0]  data_in;
	output   [8:0]  data_out;
	output   pll_areset;
	input   pll_areset_in;
	output   pll_configupdate;
	output   pll_scanclk;
	output   pll_scanclkena;
	output   pll_scandata;
	input   pll_scandataout;
	input   pll_scandone;
	input   read_param;
	input   reconfig;
	input   reset;
	input   reset_rom_address;
	output   [7:0]  rom_address_out;
	input   rom_data_in;
	input   write_from_rom;
	input   write_param;
	output   write_rom_ena;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [2:0]  counter_param;
	tri0   [3:0]  counter_type;
	tri0   [8:0]  data_in;
	tri0   pll_areset_in;
	tri0   pll_scandataout;
	tri0   pll_scandone;
	tri0   read_param;
	tri0   reconfig;
	tri0   reset_rom_address;
	tri0   rom_data_in;
	tri0   write_from_rom;
	tri0   write_param;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [0:0]   wire_altsyncram4_q_a;
	wire  wire_le_comb10_combout;
	wire  wire_le_comb8_combout;
	wire  wire_le_comb9_combout;
	reg	[7:0]	addr_from_rom;
	reg	[7:0]	addr_from_rom2;
	reg	areset_init_state_1;
	reg	areset_state;
	reg	C0_data_state;
	reg	C0_ena_state;
	reg	C1_data_state;
	reg	C1_ena_state;
	reg	C2_data_state;
	reg	C2_ena_state;
	reg	C3_data_state;
	reg	C3_ena_state;
	reg	C4_data_state;
	reg	C4_ena_state;
	reg	configupdate2_state;
	reg	configupdate3_state;
	reg	configupdate_state;
	reg	[2:0]	counter_param_latch_reg;
	reg	[3:0]	counter_type_latch_reg;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	idle_state;
	reg	[0:0]	nominal_data0;
	reg	[0:0]	nominal_data1;
	reg	[0:0]	nominal_data2;
	reg	[0:0]	nominal_data3;
	reg	[0:0]	nominal_data4;
	reg	[0:0]	nominal_data5;
	reg	[0:0]	nominal_data6;
	reg	[0:0]	nominal_data7;
	reg	[0:0]	nominal_data8;
	reg	[0:0]	nominal_data9;
	reg	[0:0]	nominal_data10;
	reg	[0:0]	nominal_data11;
	reg	[0:0]	nominal_data12;
	reg	[0:0]	nominal_data13;
	reg	[0:0]	nominal_data14;
	reg	[0:0]	nominal_data15;
	reg	[0:0]	nominal_data16;
	reg	[0:0]	nominal_data17;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_data_nominal_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_data_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_first_nominal_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_first_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_init_nominal_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_init_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_last_nominal_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_last_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_counter_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_init_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_post_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_seq_data_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_seq_ena_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_wait_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=HIGH"} *)
	reg	reset_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_data_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_first_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_init_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_last_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_second_last_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_second_state;
	reg	[0:0]	shift_reg0;
	reg	[0:0]	shift_reg1;
	reg	[0:0]	shift_reg2;
	reg	[0:0]	shift_reg3;
	reg	[0:0]	shift_reg4;
	reg	[0:0]	shift_reg5;
	reg	[0:0]	shift_reg6;
	reg	[0:0]	shift_reg7;
	reg	[0:0]	shift_reg8;
	reg	[0:0]	shift_reg9;
	reg	[0:0]	shift_reg10;
	reg	[0:0]	shift_reg11;
	reg	[0:0]	shift_reg12;
	reg	[0:0]	shift_reg13;
	reg	[0:0]	shift_reg14;
	reg	[0:0]	shift_reg15;
	reg	[0:0]	shift_reg16;
	reg	[0:0]	shift_reg17;
	wire	[17:0]	wire_shift_reg_ena;
	reg	tmp_nominal_data_out_state;
	reg	tmp_seq_ena_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	write_data_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	write_init_nominal_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	write_init_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	write_nominal_state;
	wire  [8:0]   wire_add_sub5_result;
	wire  [7:0]   wire_add_sub6_result;
	wire  wire_cmpr7_aeb;
	wire  [7:0]   wire_cntr1_q;
	wire  [7:0]   wire_cntr12_q;
	wire  [5:0]   wire_cntr13_q;
	wire  [7:0]   wire_cntr14_q;
	wire  [4:0]   wire_cntr15_q;
	wire  [7:0]   wire_cntr16_q;
	wire  [7:0]   wire_cntr2_q;
	wire  [4:0]   wire_cntr3_q;
	wire  [4:0]   wire_decode11_eq;
	wire  addr_counter_enable;
	wire  [7:0]  addr_counter_out;
	wire  addr_counter_sload;
	wire  [7:0]  addr_counter_sload_value;
	wire  [7:0]  addr_decoder_out;
	wire  [7:0]  c0_wire;
	wire  [7:0]  c1_wire;
	wire  [7:0]  c2_wire;
	wire  [7:0]  c3_wire;
	wire  [7:0]  c4_wire;
	wire  [7:0]  const_scan_chain_size;
	wire  [2:0]  counter_param_latch;
	wire  [3:0]  counter_type_latch;
	wire  [2:0]  cuda_combout_wire;
	wire  dummy_scandataout;
	wire  [2:0]  encode_out;
	wire  input_latch_enable;
	wire  power_up;
	wire  read_addr_counter_done;
	wire  read_addr_counter_enable;
	wire  [7:0]  read_addr_counter_out;
	wire  read_addr_counter_sload;
	wire  [7:0]  read_addr_counter_sload_value;
	wire  [7:0]  read_addr_decoder_out;
	wire  read_nominal_out;
	wire  reconfig_addr_counter_enable;
	wire  [7:0]  reconfig_addr_counter_out;
	wire  reconfig_addr_counter_sload;
	wire  [7:0]  reconfig_addr_counter_sload_value;
	wire  reconfig_done;
	wire  reconfig_post_done;
	wire  reconfig_width_counter_done;
	wire  reconfig_width_counter_enable;
	wire  reconfig_width_counter_sload;
	wire  [5:0]  reconfig_width_counter_sload_value;
	wire  rom_width_counter_done;
	wire  rom_width_counter_enable;
	wire  rom_width_counter_sload;
	wire  [7:0]  rom_width_counter_sload_value;
	wire  rotate_addr_counter_enable;
	wire  [7:0]  rotate_addr_counter_out;
	wire  rotate_addr_counter_sload;
	wire  [7:0]  rotate_addr_counter_sload_value;
	wire  [4:0]  rotate_decoder_wires;
	wire  rotate_width_counter_done;
	wire  rotate_width_counter_enable;
	wire  rotate_width_counter_sload;
	wire  [4:0]  rotate_width_counter_sload_value;
	wire  [7:0]  scan_cache_address;
	wire  scan_cache_in;
	wire  scan_cache_out;
	wire  scan_cache_write_enable;
	wire  sel_param_bypass_LF_unused;
	wire  sel_param_c;
	wire  sel_param_high_i_postscale;
	wire  sel_param_low_r;
	wire  sel_param_nominal_count;
	wire  sel_param_odd_CP_unused;
	wire  sel_type_c0;
	wire  sel_type_c1;
	wire  sel_type_c2;
	wire  sel_type_c3;
	wire  sel_type_c4;
	wire  sel_type_cplf;
	wire  sel_type_m;
	wire  sel_type_n;
	wire  sel_type_vco;
	wire  [7:0]  seq_addr_wire;
	wire  [5:0]  seq_sload_value;
	wire  shift_reg_clear;
	wire  shift_reg_load_enable;
	wire  shift_reg_load_nominal_enable;
	wire  shift_reg_serial_in;
	wire  shift_reg_serial_out;
	wire  shift_reg_shift_enable;
	wire  shift_reg_shift_nominal_enable;
	wire  [7:0]  shift_reg_width_select;
	wire  w1565w;
	wire  w1592w;
	wire  w64w;
	wire  width_counter_done;
	wire  width_counter_enable;
	wire  width_counter_sload;
	wire  [4:0]  width_counter_sload_value;
	wire  [4:0]  width_decoder_out;
	wire  [7:0]  width_decoder_select;
	altsyncram   altsyncram4
	(
	.address_a(scan_cache_address),
	.clock0(clock),
	.data_a({scan_cache_in}),
	.eccstatus(),
	.q_a(wire_altsyncram4_q_a),
	.q_b(),
	.wren_a(scan_cache_write_enable)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr0(1'b0),
	.aclr1(1'b0),
	.address_b({1{1'b1}}),
	.addressstall_a(1'b0),
	.addressstall_b(1'b0),
	.byteena_a({1{1'b1}}),
	.byteena_b({1{1'b1}}),
	.clock1(1'b1),
	.clocken0(1'b1),
	.clocken1(1'b1),
	.clocken2(1'b1),
	.clocken3(1'b1),
	.data_b({1{1'b1}}),
	.rden_a(1'b1),
	.rden_b(1'b1),
	.wren_b(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		altsyncram4.numwords_a = 144,
		altsyncram4.operation_mode = "SINGLE_PORT",
		altsyncram4.width_a = 1,
		altsyncram4.width_byteena_a = 1,
		altsyncram4.widthad_a = 8,
		altsyncram4.intended_device_family = "Cyclone 10 LP",
		altsyncram4.lpm_type = "altsyncram";
	cyclone10lp_lcell_comb   le_comb10
	(
	.combout(wire_le_comb10_combout),
	.cout(),
	.dataa(encode_out[0]),
	.datab(encode_out[1]),
	.datac(encode_out[2]),
	.cin(1'b0),
	.datad(1'b0)
	);
	defparam
		le_comb10.dont_touch = "on",
		le_comb10.lut_mask = 16'hF0F0,
		le_comb10.sum_lutc_input = "datac",
		le_comb10.lpm_type = "cyclone10lp_lcell_comb";
	cyclone10lp_lcell_comb   le_comb8
	(
	.combout(wire_le_comb8_combout),
	.cout(),
	.dataa(encode_out[0]),
	.datab(encode_out[1]),
	.datac(encode_out[2]),
	.cin(1'b0),
	.datad(1'b0)
	);
	defparam
		le_comb8.dont_touch = "on",
		le_comb8.lut_mask = 16'hAAAA,
		le_comb8.sum_lutc_input = "datac",
		le_comb8.lpm_type = "cyclone10lp_lcell_comb";
	cyclone10lp_lcell_comb   le_comb9
	(
	.combout(wire_le_comb9_combout),
	.cout(),
	.dataa(encode_out[0]),
	.datab(encode_out[1]),
	.datac(encode_out[2]),
	.cin(1'b0),
	.datad(1'b0)
	);
	defparam
		le_comb9.dont_touch = "on",
		le_comb9.lut_mask = 16'hCCCC,
		le_comb9.sum_lutc_input = "datac",
		le_comb9.lpm_type = "cyclone10lp_lcell_comb";
	// synopsys translate_off
	initial
		addr_from_rom = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  addr_from_rom <= read_addr_counter_out;
	// synopsys translate_off
	initial
		addr_from_rom2 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  addr_from_rom2 <= addr_from_rom;
	// synopsys translate_off
	initial
		areset_init_state_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  areset_init_state_1 <= pll_scandone;
	// synopsys translate_off
	initial
		areset_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  areset_state <= (areset_init_state_1 & (~ reset));
	// synopsys translate_off
	initial
		C0_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C0_data_state <= (C0_ena_state | (C0_data_state & (~ rotate_width_counter_done)));
	// synopsys translate_off
	initial
		C0_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C0_ena_state <= (C1_data_state & rotate_width_counter_done);
	// synopsys translate_off
	initial
		C1_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C1_data_state <= (C1_ena_state | (C1_data_state & (~ rotate_width_counter_done)));
	// synopsys translate_off
	initial
		C1_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C1_ena_state <= (C2_data_state & rotate_width_counter_done);
	// synopsys translate_off
	initial
		C2_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C2_data_state <= (C2_ena_state | (C2_data_state & (~ rotate_width_counter_done)));
	// synopsys translate_off
	initial
		C2_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C2_ena_state <= (C3_data_state & rotate_width_counter_done);
	// synopsys translate_off
	initial
		C3_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C3_data_state <= (C3_ena_state | (C3_data_state & (~ rotate_width_counter_done)));
	// synopsys translate_off
	initial
		C3_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C3_ena_state <= (C4_data_state & rotate_width_counter_done);
	// synopsys translate_off
	initial
		C4_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C4_data_state <= (C4_ena_state | (C4_data_state & (~ rotate_width_counter_done)));
	// synopsys translate_off
	initial
		C4_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C4_ena_state <= reconfig_init_state;
	// synopsys translate_off
	initial
		configupdate2_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  configupdate2_state <= configupdate_state;
	// synopsys translate_off
	initial
		configupdate3_state = 0;
	// synopsys translate_on
	always @ ( negedge clock)
		  configupdate3_state <= configupdate2_state;
	// synopsys translate_off
	initial
		configupdate_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  configupdate_state <= reconfig_post_state;
	// synopsys translate_off
	initial
		counter_param_latch_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) counter_param_latch_reg <= 3'b0;
		else if  (input_latch_enable == 1'b1)   counter_param_latch_reg <= counter_param;
	// synopsys translate_off
	initial
		counter_type_latch_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) counter_type_latch_reg <= 4'b0;
		else if  (input_latch_enable == 1'b1)   counter_type_latch_reg <= counter_type;
	// synopsys translate_off
	initial
		idle_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) idle_state <= 1'b0;
		else  idle_state <= (((((((((((((idle_state & (~ read_param)) & (~ write_param)) & (~ reconfig)) & (~ write_from_rom)) | read_last_state) | (write_data_state & width_counter_done)) | (write_nominal_state & width_counter_done)) | read_last_nominal_state) | (reconfig_wait_state & reconfig_done)) | ((rom_data_state & rom_width_counter_done) & (~ reset_rom_address))) | (rom_second_last_state & (~ reset_rom_address))) | (rom_last_state & (~ reset_rom_address))) | reset_state);
	// synopsys translate_off
	initial
		nominal_data0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data0 <= 1'b0;
		else  nominal_data0 <= wire_add_sub6_result[0];
	// synopsys translate_off
	initial
		nominal_data1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data1 <= 1'b0;
		else  nominal_data1 <= wire_add_sub6_result[1];
	// synopsys translate_off
	initial
		nominal_data2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data2 <= 1'b0;
		else  nominal_data2 <= wire_add_sub6_result[2];
	// synopsys translate_off
	initial
		nominal_data3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data3 <= 1'b0;
		else  nominal_data3 <= wire_add_sub6_result[3];
	// synopsys translate_off
	initial
		nominal_data4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data4 <= 1'b0;
		else  nominal_data4 <= wire_add_sub6_result[4];
	// synopsys translate_off
	initial
		nominal_data5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data5 <= 1'b0;
		else  nominal_data5 <= wire_add_sub6_result[5];
	// synopsys translate_off
	initial
		nominal_data6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data6 <= 1'b0;
		else  nominal_data6 <= wire_add_sub6_result[6];
	// synopsys translate_off
	initial
		nominal_data7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data7 <= 1'b0;
		else  nominal_data7 <= wire_add_sub6_result[7];
	// synopsys translate_off
	initial
		nominal_data8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data8 <= 1'b0;
		else  nominal_data8 <= data_in[0];
	// synopsys translate_off
	initial
		nominal_data9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data9 <= 1'b0;
		else  nominal_data9 <= data_in[1];
	// synopsys translate_off
	initial
		nominal_data10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data10 <= 1'b0;
		else  nominal_data10 <= data_in[2];
	// synopsys translate_off
	initial
		nominal_data11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data11 <= 1'b0;
		else  nominal_data11 <= data_in[3];
	// synopsys translate_off
	initial
		nominal_data12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data12 <= 1'b0;
		else  nominal_data12 <= data_in[4];
	// synopsys translate_off
	initial
		nominal_data13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data13 <= 1'b0;
		else  nominal_data13 <= data_in[5];
	// synopsys translate_off
	initial
		nominal_data14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data14 <= 1'b0;
		else  nominal_data14 <= data_in[6];
	// synopsys translate_off
	initial
		nominal_data15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data15 <= 1'b0;
		else  nominal_data15 <= data_in[7];
	// synopsys translate_off
	initial
		nominal_data16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data16 <= 1'b0;
		else  nominal_data16 <= data_in[8];
	// synopsys translate_off
	initial
		nominal_data17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data17 <= 1'b0;
		else  nominal_data17 <= wire_cmpr7_aeb;
	// synopsys translate_off
	initial
		read_data_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_data_nominal_state <= 1'b0;
		else  read_data_nominal_state <= ((read_first_nominal_state & (~ width_counter_done)) | (read_data_nominal_state & (~ width_counter_done)));
	// synopsys translate_off
	initial
		read_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_data_state <= 1'b0;
		else  read_data_state <= ((read_first_state & (~ width_counter_done)) | (read_data_state & (~ width_counter_done)));
	// synopsys translate_off
	initial
		read_first_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_first_nominal_state <= 1'b0;
		else  read_first_nominal_state <= read_init_nominal_state;
	// synopsys translate_off
	initial
		read_first_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_first_state <= 1'b0;
		else  read_first_state <= read_init_state;
	// synopsys translate_off
	initial
		read_init_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_init_nominal_state <= 1'b0;
		else  read_init_nominal_state <= ((idle_state & read_param) & ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0]));
	// synopsys translate_off
	initial
		read_init_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_init_state <= 1'b0;
		else  read_init_state <= ((idle_state & read_param) & (~ ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0])));
	// synopsys translate_off
	initial
		read_last_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_last_nominal_state <= 1'b0;
		else  read_last_nominal_state <= ((read_first_nominal_state & width_counter_done) | (read_data_nominal_state & width_counter_done));
	// synopsys translate_off
	initial
		read_last_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_last_state <= 1'b0;
		else  read_last_state <= ((read_first_state & width_counter_done) | (read_data_state & width_counter_done));
	// synopsys translate_off
	initial
		reconfig_counter_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_counter_state <= 1'b0;
		else  reconfig_counter_state <= ((((((((((reconfig_init_state | C0_data_state) | C1_data_state) | C2_data_state) | C3_data_state) | C4_data_state) | C0_ena_state) | C1_ena_state) | C2_ena_state) | C3_ena_state) | C4_ena_state);
	// synopsys translate_off
	initial
		reconfig_init_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_init_state <= 1'b0;
		else  reconfig_init_state <= (idle_state & reconfig);
	// synopsys translate_off
	initial
		reconfig_post_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_post_state <= 1'b0;
		else  reconfig_post_state <= ((reconfig_seq_data_state & reconfig_width_counter_done) | (reconfig_post_state & (~ reconfig_post_done)));
	// synopsys translate_off
	initial
		reconfig_seq_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_seq_data_state <= 1'b0;
		else  reconfig_seq_data_state <= (reconfig_seq_ena_state | (reconfig_seq_data_state & (~ reconfig_width_counter_done)));
	// synopsys translate_off
	initial
		reconfig_seq_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_seq_ena_state <= 1'b0;
		else  reconfig_seq_ena_state <= tmp_seq_ena_state;
	// synopsys translate_off
	initial
		reconfig_wait_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_wait_state <= 1'b0;
		else  reconfig_wait_state <= ((reconfig_post_state & reconfig_post_done) | (reconfig_wait_state & (~ reconfig_done)));
	// synopsys translate_off
	initial
		reset_state = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reset_state <= {1{1'b1}};
		else  reset_state <= power_up;
	// synopsys translate_off
	initial
		rom_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_data_state <= 1'b0;
		else  rom_data_state <= (rom_second_state | ((rom_data_state & (~ read_addr_counter_done)) & (~ reset_rom_address)));
	// synopsys translate_off
	initial
		rom_first_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_first_state <= 1'b0;
		else  rom_first_state <= rom_init_state;
	// synopsys translate_off
	initial
		rom_init_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_init_state <= 1'b0;
		else  rom_init_state <= (((((idle_state & write_from_rom) | (rom_first_state & reset_rom_address)) | (rom_second_state & reset_rom_address)) | (rom_data_state & reset_rom_address)) | (rom_second_last_state & reset_rom_address));
	// synopsys translate_off
	initial
		rom_last_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_last_state <= 1'b0;
		else  rom_last_state <= (rom_second_last_state & (~ reset_rom_address));
	// synopsys translate_off
	initial
		rom_second_last_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_second_last_state <= 1'b0;
		else  rom_second_last_state <= ((rom_data_state & read_addr_counter_done) & (~ reset_rom_address));
	// synopsys translate_off
	initial
		rom_second_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_second_state <= 1'b0;
		else  rom_second_state <= (rom_first_state & (~ reset_rom_address));
	// synopsys translate_off
	initial
		shift_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg0 <= 1'b0;
		else if  (wire_shift_reg_ena[0:0] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg0 <= 1'b0;
			else  shift_reg0 <= ((((shift_reg_load_nominal_enable & nominal_data17[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg_serial_in)) | (shift_reg_shift_nominal_enable & shift_reg_serial_in));
	// synopsys translate_off
	initial
		shift_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg1 <= 1'b0;
		else if  (wire_shift_reg_ena[1:1] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg1 <= 1'b0;
			else  shift_reg1 <= ((((shift_reg_load_nominal_enable & nominal_data16[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg0[0:0])) | (shift_reg_shift_nominal_enable & shift_reg0[0:0]));
	// synopsys translate_off
	initial
		shift_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg2 <= 1'b0;
		else if  (wire_shift_reg_ena[2:2] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg2 <= 1'b0;
			else  shift_reg2 <= ((((shift_reg_load_nominal_enable & nominal_data15[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg1[0:0])) | (shift_reg_shift_nominal_enable & shift_reg1[0:0]));
	// synopsys translate_off
	initial
		shift_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg3 <= 1'b0;
		else if  (wire_shift_reg_ena[3:3] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg3 <= 1'b0;
			else  shift_reg3 <= ((((shift_reg_load_nominal_enable & nominal_data14[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg2[0:0])) | (shift_reg_shift_nominal_enable & shift_reg2[0:0]));
	// synopsys translate_off
	initial
		shift_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg4 <= 1'b0;
		else if  (wire_shift_reg_ena[4:4] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg4 <= 1'b0;
			else  shift_reg4 <= ((((shift_reg_load_nominal_enable & nominal_data13[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg3[0:0])) | (shift_reg_shift_nominal_enable & shift_reg3[0:0]));
	// synopsys translate_off
	initial
		shift_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg5 <= 1'b0;
		else if  (wire_shift_reg_ena[5:5] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg5 <= 1'b0;
			else  shift_reg5 <= ((((shift_reg_load_nominal_enable & nominal_data12[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg4[0:0])) | (shift_reg_shift_nominal_enable & shift_reg4[0:0]));
	// synopsys translate_off
	initial
		shift_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg6 <= 1'b0;
		else if  (wire_shift_reg_ena[6:6] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg6 <= 1'b0;
			else  shift_reg6 <= ((((shift_reg_load_nominal_enable & nominal_data11[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg5[0:0])) | (shift_reg_shift_nominal_enable & shift_reg5[0:0]));
	// synopsys translate_off
	initial
		shift_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg7 <= 1'b0;
		else if  (wire_shift_reg_ena[7:7] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg7 <= 1'b0;
			else  shift_reg7 <= ((((shift_reg_load_nominal_enable & nominal_data10[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg6[0:0])) | (shift_reg_shift_nominal_enable & shift_reg6[0:0]));
	// synopsys translate_off
	initial
		shift_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg8 <= 1'b0;
		else if  (wire_shift_reg_ena[8:8] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg8 <= 1'b0;
			else  shift_reg8 <= ((((shift_reg_load_nominal_enable & nominal_data9[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg7[0:0])) | (shift_reg_shift_nominal_enable & shift_reg7[0:0]));
	// synopsys translate_off
	initial
		shift_reg9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg9 <= 1'b0;
		else if  (wire_shift_reg_ena[9:9] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg9 <= 1'b0;
			else  shift_reg9 <= ((((shift_reg_load_nominal_enable & nominal_data8[0:0]) | (shift_reg_load_enable & data_in[8])) | (shift_reg_shift_enable & shift_reg8[0:0])) | (shift_reg_shift_nominal_enable & shift_reg8[0:0]));
	// synopsys translate_off
	initial
		shift_reg10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg10 <= 1'b0;
		else if  (wire_shift_reg_ena[10:10] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg10 <= 1'b0;
			else  shift_reg10 <= ((((shift_reg_load_nominal_enable & nominal_data7[0:0]) | (shift_reg_load_enable & data_in[7])) | (shift_reg_shift_enable & shift_reg9[0:0])) | (shift_reg_shift_nominal_enable & shift_reg9[0:0]));
	// synopsys translate_off
	initial
		shift_reg11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg11 <= 1'b0;
		else if  (wire_shift_reg_ena[11:11] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg11 <= 1'b0;
			else  shift_reg11 <= ((((shift_reg_load_nominal_enable & nominal_data6[0:0]) | (shift_reg_load_enable & data_in[6])) | (shift_reg_shift_enable & shift_reg10[0:0])) | (shift_reg_shift_nominal_enable & shift_reg10[0:0]));
	// synopsys translate_off
	initial
		shift_reg12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg12 <= 1'b0;
		else if  (wire_shift_reg_ena[12:12] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg12 <= 1'b0;
			else  shift_reg12 <= ((((shift_reg_load_nominal_enable & nominal_data5[0:0]) | (shift_reg_load_enable & data_in[5])) | (shift_reg_shift_enable & shift_reg11[0:0])) | (shift_reg_shift_nominal_enable & shift_reg11[0:0]));
	// synopsys translate_off
	initial
		shift_reg13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg13 <= 1'b0;
		else if  (wire_shift_reg_ena[13:13] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg13 <= 1'b0;
			else  shift_reg13 <= ((((shift_reg_load_nominal_enable & nominal_data4[0:0]) | (shift_reg_load_enable & data_in[4])) | (shift_reg_shift_enable & shift_reg12[0:0])) | (shift_reg_shift_nominal_enable & shift_reg12[0:0]));
	// synopsys translate_off
	initial
		shift_reg14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg14 <= 1'b0;
		else if  (wire_shift_reg_ena[14:14] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg14 <= 1'b0;
			else  shift_reg14 <= ((((shift_reg_load_nominal_enable & nominal_data3[0:0]) | (shift_reg_load_enable & data_in[3])) | (shift_reg_shift_enable & shift_reg13[0:0])) | (shift_reg_shift_nominal_enable & shift_reg13[0:0]));
	// synopsys translate_off
	initial
		shift_reg15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg15 <= 1'b0;
		else if  (wire_shift_reg_ena[15:15] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg15 <= 1'b0;
			else  shift_reg15 <= ((((shift_reg_load_nominal_enable & nominal_data2[0:0]) | (shift_reg_load_enable & data_in[2])) | (shift_reg_shift_enable & shift_reg14[0:0])) | (shift_reg_shift_nominal_enable & shift_reg14[0:0]));
	// synopsys translate_off
	initial
		shift_reg16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg16 <= 1'b0;
		else if  (wire_shift_reg_ena[16:16] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg16 <= 1'b0;
			else  shift_reg16 <= ((((shift_reg_load_nominal_enable & nominal_data1[0:0]) | (shift_reg_load_enable & data_in[1])) | (shift_reg_shift_enable & shift_reg15[0:0])) | (shift_reg_shift_nominal_enable & shift_reg15[0:0]));
	// synopsys translate_off
	initial
		shift_reg17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg17 <= 1'b0;
		else if  (wire_shift_reg_ena[17:17] == 1'b1)
			if (shift_reg_clear == 1'b1) shift_reg17 <= 1'b0;
			else  shift_reg17 <= ((((shift_reg_load_nominal_enable & nominal_data0[0:0]) | (shift_reg_load_enable & data_in[0])) | (shift_reg_shift_enable & shift_reg16[0:0])) | (shift_reg_shift_nominal_enable & shift_reg16[0:0]));
	assign
		wire_shift_reg_ena = {18{((((shift_reg_load_enable | shift_reg_shift_enable) | shift_reg_load_nominal_enable) | shift_reg_shift_nominal_enable) | shift_reg_clear)}};
	// synopsys translate_off
	initial
		tmp_nominal_data_out_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  tmp_nominal_data_out_state <= ((read_last_nominal_state & (~ idle_state)) | (tmp_nominal_data_out_state & idle_state));
	// synopsys translate_off
	initial
		tmp_seq_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  tmp_seq_ena_state <= (reconfig_counter_state & (C0_data_state & rotate_width_counter_done));
	// synopsys translate_off
	initial
		write_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) write_data_state <= 1'b0;
		else  write_data_state <= (write_init_state | (write_data_state & (~ width_counter_done)));
	// synopsys translate_off
	initial
		write_init_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) write_init_nominal_state <= 1'b0;
		else  write_init_nominal_state <= ((idle_state & write_param) & ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0]));
	// synopsys translate_off
	initial
		write_init_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) write_init_state <= 1'b0;
		else  write_init_state <= ((idle_state & write_param) & (~ ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0])));
	// synopsys translate_off
	initial
		write_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) write_nominal_state <= 1'b0;
		else  write_nominal_state <= (write_init_nominal_state | (write_nominal_state & (~ width_counter_done)));
	lpm_add_sub   add_sub5
	(
	.cin(1'b0),
	.cout(),
	.dataa({1'b0, shift_reg8[0:0], shift_reg7[0:0], shift_reg6[0:0], shift_reg5[0:0], shift_reg4[0:0], shift_reg3[0:0], shift_reg2[0:0], shift_reg1[0:0]}),
	.datab({1'b0, shift_reg17[0:0], shift_reg16[0:0], shift_reg15[0:0], shift_reg14[0:0], shift_reg13[0:0], shift_reg12[0:0], shift_reg11[0:0], shift_reg10[0:0]}),
	.overflow(),
	.result(wire_add_sub5_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub5.lpm_width = 9,
		add_sub5.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub6
	(
	.cin(data_in[0]),
	.cout(),
	.dataa({data_in[8:1]}),
	.overflow(),
	.result(wire_add_sub6_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0),
	.datab({8{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub6.lpm_width = 8,
		add_sub6.lpm_type = "lpm_add_sub";
	lpm_compare   cmpr7
	(
	.aeb(wire_cmpr7_aeb),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa({data_in[7:0]}),
	.datab(8'b00000001)
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
		cmpr7.lpm_width = 8,
		cmpr7.lpm_type = "lpm_compare";
	lpm_counter   cntr1
	(
	.clock(clock),
	.cnt_en(addr_counter_enable),
	.cout(),
	.data(addr_counter_sload_value),
	.eq(),
	.q(wire_cntr1_q),
	.sload(addr_counter_sload)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.sclr(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cntr1.lpm_direction = "DOWN",
		cntr1.lpm_modulus = 144,
		cntr1.lpm_port_updown = "PORT_UNUSED",
		cntr1.lpm_width = 8,
		cntr1.lpm_type = "lpm_counter";
	lpm_counter   cntr12
	(
	.clock(clock),
	.cnt_en(reconfig_addr_counter_enable),
	.cout(),
	.data(reconfig_addr_counter_sload_value),
	.eq(),
	.q(wire_cntr12_q),
	.sload(reconfig_addr_counter_sload)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.sclr(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cntr12.lpm_direction = "DOWN",
		cntr12.lpm_modulus = 144,
		cntr12.lpm_port_updown = "PORT_UNUSED",
		cntr12.lpm_width = 8,
		cntr12.lpm_type = "lpm_counter";
	lpm_counter   cntr13
	(
	.clock(clock),
	.cnt_en(reconfig_width_counter_enable),
	.cout(),
	.data(reconfig_width_counter_sload_value),
	.eq(),
	.q(wire_cntr13_q),
	.sload(reconfig_width_counter_sload)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.sclr(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cntr13.lpm_direction = "DOWN",
		cntr13.lpm_port_updown = "PORT_UNUSED",
		cntr13.lpm_width = 6,
		cntr13.lpm_type = "lpm_counter";
	lpm_counter   cntr14
	(
	.clock(clock),
	.cnt_en(rom_width_counter_enable),
	.cout(),
	.data(rom_width_counter_sload_value),
	.eq(),
	.q(wire_cntr14_q),
	.sload(rom_width_counter_sload)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.sclr(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cntr14.lpm_direction = "DOWN",
		cntr14.lpm_port_updown = "PORT_UNUSED",
		cntr14.lpm_width = 8,
		cntr14.lpm_type = "lpm_counter";
	lpm_counter   cntr15
	(
	.clock(clock),
	.cnt_en(rotate_width_counter_enable),
	.cout(),
	.data(rotate_width_counter_sload_value),
	.eq(),
	.q(wire_cntr15_q),
	.sload(rotate_width_counter_sload)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.sclr(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cntr15.lpm_direction = "DOWN",
		cntr15.lpm_port_updown = "PORT_UNUSED",
		cntr15.lpm_width = 5,
		cntr15.lpm_type = "lpm_counter";
	lpm_counter   cntr16
	(
	.clock(clock),
	.cnt_en(rotate_addr_counter_enable),
	.cout(),
	.data(rotate_addr_counter_sload_value),
	.eq(),
	.q(wire_cntr16_q),
	.sload(rotate_addr_counter_sload)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.sclr(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cntr16.lpm_direction = "DOWN",
		cntr16.lpm_modulus = 144,
		cntr16.lpm_port_updown = "PORT_UNUSED",
		cntr16.lpm_width = 8,
		cntr16.lpm_type = "lpm_counter";
	lpm_counter   cntr2
	(
	.clock(clock),
	.cnt_en(read_addr_counter_enable),
	.cout(),
	.data(read_addr_counter_sload_value),
	.eq(),
	.q(wire_cntr2_q),
	.sload(read_addr_counter_sload)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.sclr(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cntr2.lpm_direction = "UP",
		cntr2.lpm_port_updown = "PORT_UNUSED",
		cntr2.lpm_width = 8,
		cntr2.lpm_type = "lpm_counter";
	lpm_counter   cntr3
	(
	.clock(clock),
	.cnt_en(width_counter_enable),
	.cout(),
	.data(width_counter_sload_value),
	.eq(),
	.q(wire_cntr3_q),
	.sload(width_counter_sload)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.clk_en(1'b1),
	.sclr(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cntr3.lpm_direction = "DOWN",
		cntr3.lpm_port_updown = "PORT_UNUSED",
		cntr3.lpm_width = 5,
		cntr3.lpm_type = "lpm_counter";
	lpm_decode   decode11
	(
	.data(cuda_combout_wire),
	.eq(wire_decode11_eq)
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
		decode11.lpm_decodes = 5,
		decode11.lpm_width = 3,
		decode11.lpm_type = "lpm_decode";
	assign
		addr_counter_enable = (write_data_state | write_nominal_state),
		addr_counter_out = wire_cntr1_q,
		addr_counter_sload = (write_init_state | write_init_nominal_state),
		addr_counter_sload_value = (addr_decoder_out & {8{(write_init_state | write_init_nominal_state)}}),
		addr_decoder_out = ((((((((((((((((((((((((((((((((((({{7{1'b0}}, (sel_type_cplf & sel_param_bypass_LF_unused)} | {{6{1'b0}}, {2{(sel_type_cplf & sel_param_c)}}}) | {{4{1'b0}}, (sel_type_cplf & sel_param_low_r), {3{1'b0}}}) | {{4{1'b0}}, (sel_type_vco & sel_param_high_i_postscale), {2{1'b0}}, (sel_type_vco & sel_param_high_i_postscale)}) | {{4{1'b0}}, {3{(sel_type_cplf & sel_param_odd_CP_unused)}}, 1'b0}) | {{3{1'b0}}, (sel_type_cplf & sel_param_high_i_postscale), {3{1'b0}}, (sel_type_cplf & sel_param_high_i_postscale)}) | {{3{1'b0}}, (sel_type_n & sel_param_bypass_LF_unused), {2{1'b0}}, (sel_type_n & sel_param_bypass_LF_unused), 1'b0}) | {{3{1'b0}}, {2{(sel_type_n & sel_param_high_i_postscale)}}, 1'b0, (sel_type_n & sel_param_high_i_postscale), 1'b0}) | {{3{1'b0}}, {2{(sel_type_n & sel_param_odd_CP_unused)}}, 1'b0, {2{(sel_type_n & sel_param_odd_CP_unused)}}}) | {{2{1'b0}}, (sel_type_n & sel_param_low_r), {3{1'b0}}, {2{(sel_type_n & sel_param_low_r)}}}) | {{2{1'b0}}, (sel_type_n & sel_param_nominal_count), {3{1'b0}}, {2{(sel_type_n & sel_param_nominal_count)}}}) | {{2{1'b0}}, (sel_type_m & sel_param_bypass_LF_unused), {2{1'b0}}, (sel_type_m & sel_param_bypass_LF_unused), {2{1'b0}}}) | {{2{1'b0}}, (sel_type_m & sel_param_high_i_postscale), 1'b0, {2{(sel_type_m & sel_param_high_i_postscale)}}, {2{1'b0}}}) | {{2{1'b0}}, (sel_type_m & sel_param_odd_CP_unused), 1'b0, {2{(sel_type_m & sel_param_odd_CP_unused)}}, 1'b0, (sel_type_m & sel_param_odd_CP_unused)}) | {{2{1'b0}}, {2{(sel_type_m & sel_param_low_r)}}, 1'b0, (sel_type_m & sel_param_low_r), 1'b0, (sel_type_m & sel_param_low_r)}) | {{2{1'b0}}, {2{(sel_type_m & sel_param_nominal_count)}}, 1'b0, (sel_type_m & sel_param_nominal_count), 1'b0, (sel_type_m & sel_param_nominal_count)}) | {{2{1'b0}}, {2{(sel_type_c0 & sel_param_bypass_LF_unused)}}, 1'b0, {2{(sel_type_c0 & sel_param_bypass_LF_unused)}}, 1'b0}) | {{2{1'b0}}, {5{(sel_type_c0 & sel_param_high_i_postscale)}}, 1'b0}) | {{2{1'b0}}, {6{(sel_type_c0 & sel_param_odd_CP_unused)}}}) | {1'b0, (sel_type_c0 & sel_param_low_r
), {3{1'b0}}, {3{(sel_type_c0 & sel_param_low_r)}}}) | {1'b0, (sel_type_c1 & sel_param_bypass_LF_unused), {2{1'b0}}, (sel_type_c1 & sel_param_bypass_LF_unused), {3{1'b0}}}) | {1'b0, (sel_type_c1 & sel_param_high_i_postscale), 1'b0, (sel_type_c1 & sel_param_high_i_postscale), {4{1'b0}}}) | {1'b0, (sel_type_c1 & sel_param_odd_CP_unused), 1'b0, (sel_type_c1 & sel_param_odd_CP_unused), {3{1'b0}}, (sel_type_c1 & sel_param_odd_CP_unused)}) | {1'b0, (sel_type_c1 & sel_param_low_r), 1'b0, {2{(sel_type_c1 & sel_param_low_r)}}, {2{1'b0}}, (sel_type_c1 & sel_param_low_r)}) | {1'b0, (sel_type_c2 & sel_param_bypass_LF_unused), 1'b0, {2{(sel_type_c2 & sel_param_bypass_LF_unused)}}, 1'b0, (sel_type_c2 & sel_param_bypass_LF_unused), 1'b0}) | {1'b0, {2{(sel_type_c2 & sel_param_high_i_postscale)}}, {3{1'b0}}, (sel_type_c2 & sel_param_high_i_postscale), 1'b0}) | {1'b0, {2{(sel_type_c2 & sel_param_odd_CP_unused)}}, {3{1'b0}}, {2{(sel_type_c2 & sel_param_odd_CP_unused)}}}) | {1'b0, {2{(sel_type_c2 & sel_param_low_r)}}, 1'b0, (sel_type_c2 & sel_param_low_r), 1'b0, {2{(sel_type_c2 & sel_param_low_r)}}}) | {1'b0, {2{(sel_type_c3 & sel_param_bypass_LF_unused)}}, 1'b0, {2{(sel_type_c3 & sel_param_bypass_LF_unused)}}, {2{1'b0}}}) | {1'b0, {3{(sel_type_c3 & sel_param_high_i_postscale)}}, 1'b0, (sel_type_c3 & sel_param_high_i_postscale), {2{1'b0}}}) | {1'b0, {3{(sel_type_c3 & sel_param_odd_CP_unused)}}, 1'b0, (sel_type_c3 & sel_param_odd_CP_unused), 1'b0, (sel_type_c3 & sel_param_odd_CP_unused)}) | {1'b0, {5{(sel_type_c3 & sel_param_low_r)}}, 1'b0, (sel_type_c3 & sel_param_low_r)}) | {1'b0, {6{(sel_type_c4 & sel_param_bypass_LF_unused)}}, 1'b0}) | {(sel_type_c4 & sel_param_high_i_postscale), {4{1'b0}}, {2{(sel_type_c4 & sel_param_high_i_postscale)}}, 1'b0}) | {(sel_type_c4 & sel_param_odd_CP_unused), {4{1'b0}}, {3{(sel_type_c4 & sel_param_odd_CP_unused)}}}) | {(sel_type_c4 & sel_param_low_r), {3{1'b0}}, {4{(sel_type_c4 & sel_param_low_r)}}}),
		busy = ((~ idle_state) | areset_state),
		c0_wire = 8'b01000111,
		c1_wire = 8'b01011001,
		c2_wire = 8'b01101011,
		c3_wire = 8'b01111101,
		c4_wire = 8'b10001111,
		const_scan_chain_size = 8'b10001111,
		counter_param_latch = counter_param_latch_reg,
		counter_type_latch = counter_type_latch_reg,
		cuda_combout_wire = {wire_le_comb10_combout, wire_le_comb9_combout, wire_le_comb8_combout},
		data_out = {((shift_reg8[0:0] & (~ read_nominal_out)) | (wire_add_sub5_result[8] & read_nominal_out)), ((shift_reg7[0:0] & (~ read_nominal_out)) | (wire_add_sub5_result[7] & read_nominal_out)), ((shift_reg6[0:0] & (~ read_nominal_out)) | (wire_add_sub5_result[6] & read_nominal_out)), ((shift_reg5[0:0] & (~ read_nominal_out)) | (wire_add_sub5_result[5] & read_nominal_out)), ((shift_reg4[0:0] & (~ read_nominal_out)) | (wire_add_sub5_result[4] & read_nominal_out)), ((shift_reg3[0:0] & (~ read_nominal_out)) | (wire_add_sub5_result[3] & read_nominal_out)), ((shift_reg2[0:0] & (~ read_nominal_out)) | (wire_add_sub5_result[2] & read_nominal_out)), ((shift_reg1[0:0] & (~ read_nominal_out)) | (wire_add_sub5_result[1] & read_nominal_out)), ((shift_reg0[0:0] & (~ read_nominal_out)) | (wire_add_sub5_result[0] & read_nominal_out))},
		dummy_scandataout = pll_scandataout,
		encode_out = {C4_ena_state, (C2_ena_state | C3_ena_state), (C1_ena_state | C3_ena_state)},
		input_latch_enable = (idle_state & (write_param | read_param)),
		pll_areset = (pll_areset_in | (areset_state & reconfig_wait_state)),
		pll_configupdate = (configupdate_state & (~ configupdate3_state)),
		pll_scanclk = clock,
		pll_scanclkena = ((rotate_width_counter_enable & (~ rotate_width_counter_done)) | reconfig_seq_data_state),
		pll_scandata = (scan_cache_out & ((rotate_width_counter_enable | reconfig_seq_data_state) | reconfig_post_state)),
		power_up = ((((((((((((((((((((((((((~ reset_state) & (~ idle_state)) & (~ read_init_state)) & (~ read_first_state)) & (~ read_data_state)) & (~ read_last_state)) & (~ read_init_nominal_state)) & (~ read_first_nominal_state)) & (~ read_data_nominal_state)) & (~ read_last_nominal_state)) & (~ write_init_state)) & (~ write_data_state)) & (~ write_init_nominal_state)) & (~ write_nominal_state)) & (~ reconfig_init_state)) & (~ reconfig_counter_state)) & (~ reconfig_seq_ena_state)) & (~ reconfig_seq_data_state)) & (~ reconfig_post_state)) & (~ reconfig_wait_state)) & (~ rom_init_state)) & (~ rom_first_state)) & (~ rom_second_state)) & (~ rom_data_state)) & (~ rom_second_last_state)) & (~ rom_last_state)),
		read_addr_counter_done = (((((((wire_cntr2_q[0] & wire_cntr2_q[1]) & wire_cntr2_q[2]) & wire_cntr2_q[3]) & (~ wire_cntr2_q[4])) & (~ wire_cntr2_q[5])) & (~ wire_cntr2_q[6])) & wire_cntr2_q[7]),
		read_addr_counter_enable = ((((read_first_state | read_data_state) | read_first_nominal_state) | read_data_nominal_state) | ((rom_data_state | rom_first_state) | rom_second_state)),
		read_addr_counter_out = wire_cntr2_q,
		read_addr_counter_sload = ((read_init_state | read_init_nominal_state) | rom_init_state),
		read_addr_counter_sload_value = (read_addr_decoder_out & {8{(read_init_state | read_init_nominal_state)}}),
		read_addr_decoder_out = ((((((((((((((((((((((((((((((((((({8{1'b0}} | {{6{1'b0}}, (sel_type_cplf & sel_param_c), 1'b0}) | {{5{1'b0}}, (sel_type_cplf & sel_param_low_r), {2{1'b0}}}) | {{4{1'b0}}, (sel_type_vco & sel_param_high_i_postscale), {2{1'b0}}, (sel_type_vco & sel_param_high_i_postscale)}) | {{4{1'b0}}, (sel_type_cplf & sel_param_odd_CP_unused), 1'b0, (sel_type_cplf & sel_param_odd_CP_unused), 1'b0}) | {{4{1'b0}}, {4{(sel_type_cplf & sel_param_high_i_postscale)}}}) | {{3{1'b0}}, (sel_type_n & sel_param_bypass_LF_unused), {2{1'b0}}, (sel_type_n & sel_param_bypass_LF_unused), 1'b0}) | {{3{1'b0}}, (sel_type_n & sel_param_high_i_postscale), {2{1'b0}}, {2{(sel_type_n & sel_param_high_i_postscale)}}}) | {{3{1'b0}}, {2{(sel_type_n & sel_param_odd_CP_unused)}}, 1'b0, {2{(sel_type_n & sel_param_odd_CP_unused)}}}) | {{3{1'b0}}, {3{(sel_type_n & sel_param_low_r)}}, {2{1'b0}}}) | {{3{1'b0}}, (sel_type_n & sel_param_nominal_count), {2{1'b0}}, (sel_type_n & sel_param_nominal_count), 1'b0}) | {{2{1'b0}}, (sel_type_m & sel_param_bypass_LF_unused), {2{1'b0}}, (sel_type_m & sel_param_bypass_LF_unused), {2{1'b0}}}) | {{2{1'b0}}, (sel_type_m & sel_param_high_i_postscale), {2{1'b0}}, (sel_type_m & sel_param_high_i_postscale), 1'b0, (sel_type_m & sel_param_high_i_postscale)}) | {{2{1'b0}}, (sel_type_m & sel_param_odd_CP_unused), 1'b0, {2{(sel_type_m & sel_param_odd_CP_unused)}}, 1'b0, (sel_type_m & sel_param_odd_CP_unused)}) | {{2{1'b0}}, (sel_type_m & sel_param_low_r), 1'b0, {3{(sel_type_m & sel_param_low_r)}}, 1'b0}) | {{2{1'b0}}, (sel_type_m & sel_param_nominal_count), {2{1'b0}}, (sel_type_m & sel_param_nominal_count), {2{1'b0}}}) | {{2{1'b0}}, {2{(sel_type_c0 & sel_param_bypass_LF_unused)}}, 1'b0, {2{(sel_type_c0 & sel_param_bypass_LF_unused)}}, 1'b0}) | {{2{1'b0}}, {2{(sel_type_c0 & sel_param_high_i_postscale)}}, 1'b0, {3{(sel_type_c0 & sel_param_high_i_postscale)}}}) | {{2{1'b0}}, {6{(sel_type_c0 & sel_param_odd_CP_unused)}}}) | {1'b0, (sel_type_c0 & sel_param_low_r), {6{1'b0}}}) | {1'b0, (sel_type_c1 & sel_param_bypass_LF_unused
), {2{1'b0}}, (sel_type_c1 & sel_param_bypass_LF_unused), {3{1'b0}}}) | {1'b0, (sel_type_c1 & sel_param_high_i_postscale), {2{1'b0}}, (sel_type_c1 & sel_param_high_i_postscale), {2{1'b0}}, (sel_type_c1 & sel_param_high_i_postscale)}) | {1'b0, (sel_type_c1 & sel_param_odd_CP_unused), 1'b0, (sel_type_c1 & sel_param_odd_CP_unused), {3{1'b0}}, (sel_type_c1 & sel_param_odd_CP_unused)}) | {1'b0, (sel_type_c1 & sel_param_low_r), 1'b0, (sel_type_c1 & sel_param_low_r), {2{1'b0}}, (sel_type_c1 & sel_param_low_r), 1'b0}) | {1'b0, (sel_type_c2 & sel_param_bypass_LF_unused), 1'b0, {2{(sel_type_c2 & sel_param_bypass_LF_unused)}}, 1'b0, (sel_type_c2 & sel_param_bypass_LF_unused), 1'b0}) | {1'b0, (sel_type_c2 & sel_param_high_i_postscale), 1'b0, {2{(sel_type_c2 & sel_param_high_i_postscale)}}, 1'b0, {2{(sel_type_c2 & sel_param_high_i_postscale)}}}) | {1'b0, {2{(sel_type_c2 & sel_param_odd_CP_unused)}}, {3{1'b0}}, {2{(sel_type_c2 & sel_param_odd_CP_unused)}}}) | {1'b0, {2{(sel_type_c2 & sel_param_low_r)}}, {2{1'b0}}, (sel_type_c2 & sel_param_low_r), {2{1'b0}}}) | {1'b0, {2{(sel_type_c3 & sel_param_bypass_LF_unused)}}, 1'b0, {2{(sel_type_c3 & sel_param_bypass_LF_unused)}}, {2{1'b0}}}) | {1'b0, {2{(sel_type_c3 & sel_param_high_i_postscale)}}, 1'b0, {2{(sel_type_c3 & sel_param_high_i_postscale)}}, 1'b0, (sel_type_c3 & sel_param_high_i_postscale)}) | {1'b0, {3{(sel_type_c3 & sel_param_odd_CP_unused)}}, 1'b0, (sel_type_c3 & sel_param_odd_CP_unused), 1'b0, (sel_type_c3 & sel_param_odd_CP_unused)}) | {1'b0, {3{(sel_type_c3 & sel_param_low_r)}}, 1'b0, {2{(sel_type_c3 & sel_param_low_r)}}, 1'b0}) | {1'b0, {6{(sel_type_c4 & sel_param_bypass_LF_unused)}}, 1'b0}) | {1'b0, {7{(sel_type_c4 & sel_param_high_i_postscale)}}}) | {(sel_type_c4 & sel_param_odd_CP_unused), {4{1'b0}}, {3{(sel_type_c4 & sel_param_odd_CP_unused)}}}) | {(sel_type_c4 & sel_param_low_r), {3{1'b0}}, (sel_type_c4 & sel_param_low_r), {3{1'b0}}}),
		read_nominal_out = tmp_nominal_data_out_state,
		reconfig_addr_counter_enable = reconfig_seq_data_state,
		reconfig_addr_counter_out = wire_cntr12_q,
		reconfig_addr_counter_sload = reconfig_seq_ena_state,
		reconfig_addr_counter_sload_value = ({8{reconfig_seq_ena_state}} & seq_addr_wire),
		reconfig_done = ((~ pll_scandone) & (dummy_scandataout | (~ dummy_scandataout))),
		reconfig_post_done = pll_scandone,
		reconfig_width_counter_done = ((((((~ wire_cntr13_q[0]) & (~ wire_cntr13_q[1])) & (~ wire_cntr13_q[2])) & (~ wire_cntr13_q[3])) & (~ wire_cntr13_q[4])) & (~ wire_cntr13_q[5])),
		reconfig_width_counter_enable = reconfig_seq_data_state,
		reconfig_width_counter_sload = reconfig_seq_ena_state,
		reconfig_width_counter_sload_value = ({6{reconfig_seq_ena_state}} & seq_sload_value),
		rom_address_out = (read_addr_counter_out & {8{((rom_first_state | rom_second_state) | rom_data_state)}}),
		rom_width_counter_done = ((((((((~ wire_cntr14_q[0]) & (~ wire_cntr14_q[1])) & (~ wire_cntr14_q[2])) & (~ wire_cntr14_q[3])) & (~ wire_cntr14_q[4])) & (~ wire_cntr14_q[5])) & (~ wire_cntr14_q[6])) & (~ wire_cntr14_q[7])),
		rom_width_counter_enable = ((rom_data_state | rom_last_state) | rom_second_last_state),
		rom_width_counter_sload = rom_init_state,
		rom_width_counter_sload_value = const_scan_chain_size,
		rotate_addr_counter_enable = ((((C0_data_state | C1_data_state) | C2_data_state) | C3_data_state) | C4_data_state),
		rotate_addr_counter_out = wire_cntr16_q,
		rotate_addr_counter_sload = ((((C0_ena_state | C1_ena_state) | C2_ena_state) | C3_ena_state) | C4_ena_state),
		rotate_addr_counter_sload_value = (((((c0_wire & {8{rotate_decoder_wires[0]}}) | (c1_wire & {8{rotate_decoder_wires[1]}})) | (c2_wire & {8{rotate_decoder_wires[2]}})) | (c3_wire & {8{rotate_decoder_wires[3]}})) | (c4_wire & {8{rotate_decoder_wires[4]}})),
		rotate_decoder_wires = wire_decode11_eq,
		rotate_width_counter_done = (((((~ wire_cntr15_q[0]) & (~ wire_cntr15_q[1])) & (~ wire_cntr15_q[2])) & (~ wire_cntr15_q[3])) & (~ wire_cntr15_q[4])),
		rotate_width_counter_enable = ((((C0_data_state | C1_data_state) | C2_data_state) | C3_data_state) | C4_data_state),
		rotate_width_counter_sload = ((((C0_ena_state | C1_ena_state) | C2_ena_state) | C3_ena_state) | C4_ena_state),
		rotate_width_counter_sload_value = 5'b10010,
		scan_cache_address = (((((addr_counter_out & {8{addr_counter_enable}}) | (rotate_addr_counter_out & {8{rotate_addr_counter_enable}})) | (reconfig_addr_counter_out & {8{reconfig_addr_counter_enable}})) | ((read_addr_counter_out & {8{read_addr_counter_enable}}) & {8{(~ (rom_data_state | rom_first_state))}})) | ({8{(rom_width_counter_enable & ((rom_data_state | rom_second_last_state) | rom_last_state))}} & addr_from_rom2)),
		scan_cache_in = ((shift_reg_serial_out & (~ (((rom_first_state | rom_data_state) | rom_second_last_state) | rom_last_state))) | (rom_data_in & (((rom_first_state | rom_data_state) | rom_second_last_state) | rom_last_state))),
		scan_cache_out = wire_altsyncram4_q_a[0],
		scan_cache_write_enable = ((((write_data_state | write_nominal_state) | rom_data_state) | rom_second_last_state) | rom_last_state),
		sel_param_bypass_LF_unused = (((~ counter_param_latch[0]) & (~ counter_param_latch[1])) & counter_param_latch[2]),
		sel_param_c = (((~ counter_param_latch[0]) & counter_param_latch[1]) & (~ counter_param_latch[2])),
		sel_param_high_i_postscale = (((~ counter_param_latch[0]) & (~ counter_param_latch[1])) & (~ counter_param_latch[2])),
		sel_param_low_r = ((counter_param_latch[0] & (~ counter_param_latch[1])) & (~ counter_param_latch[2])),
		sel_param_nominal_count = ((counter_param_latch[0] & counter_param_latch[1]) & counter_param_latch[2]),
		sel_param_odd_CP_unused = ((counter_param_latch[0] & (~ counter_param_latch[1])) & counter_param_latch[2]),
		sel_type_c0 = ((((~ counter_type_latch[0]) & (~ counter_type_latch[1])) & counter_type_latch[2]) & (~ counter_type_latch[3])),
		sel_type_c1 = (((counter_type_latch[0] & (~ counter_type_latch[1])) & counter_type_latch[2]) & (~ counter_type_latch[3])),
		sel_type_c2 = ((((~ counter_type_latch[0]) & counter_type_latch[1]) & counter_type_latch[2]) & (~ counter_type_latch[3])),
		sel_type_c3 = (((counter_type_latch[0] & counter_type_latch[1]) & counter_type_latch[2]) & (~ counter_type_latch[3])),
		sel_type_c4 = ((((~ counter_type_latch[0]) & (~ counter_type_latch[1])) & (~ counter_type_latch[2])) & counter_type_latch[3]),
		sel_type_cplf = ((((~ counter_type_latch[0]) & counter_type_latch[1]) & (~ counter_type_latch[2])) & (~ counter_type_latch[3])),
		sel_type_m = (((counter_type_latch[0] & (~ counter_type_latch[1])) & (~ counter_type_latch[2])) & (~ counter_type_latch[3])),
		sel_type_n = ((((~ counter_type_latch[0]) & (~ counter_type_latch[1])) & (~ counter_type_latch[2])) & (~ counter_type_latch[3])),
		sel_type_vco = (((counter_type_latch[0] & counter_type_latch[1]) & (~ counter_type_latch[2])) & (~ counter_type_latch[3])),
		seq_addr_wire = 8'b00110101,
		seq_sload_value = 6'b110110,
		shift_reg_clear = (read_init_state | read_init_nominal_state),
		shift_reg_load_enable = ((idle_state & write_param) & (~ ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0]))),
		shift_reg_load_nominal_enable = ((idle_state & write_param) & ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0])),
		shift_reg_serial_in = scan_cache_out,
		shift_reg_serial_out = ((((((((shift_reg17[0:0] & shift_reg_width_select[0]) | (shift_reg17[0:0] & shift_reg_width_select[1])) | (shift_reg17[0:0] & shift_reg_width_select[2])) | (shift_reg17[0:0] & shift_reg_width_select[3])) | (shift_reg17[0:0] & shift_reg_width_select[4])) | (shift_reg17[0:0] & shift_reg_width_select[5])) | (shift_reg17[0:0] & shift_reg_width_select[6])) | (shift_reg17[0:0] & shift_reg_width_select[7])),
		shift_reg_shift_enable = ((read_data_state | read_last_state) | write_data_state),
		shift_reg_shift_nominal_enable = ((read_data_nominal_state | read_last_nominal_state) | write_nominal_state),
		shift_reg_width_select = width_decoder_select,
		w1565w = 1'b0,
		w1592w = 1'b0,
		w64w = 1'b0,
		width_counter_done = (((((~ wire_cntr3_q[0]) & (~ wire_cntr3_q[1])) & (~ wire_cntr3_q[2])) & (~ wire_cntr3_q[3])) & (~ wire_cntr3_q[4])),
		width_counter_enable = ((((read_first_state | read_data_state) | write_data_state) | read_data_nominal_state) | write_nominal_state),
		width_counter_sload = (((read_init_state | write_init_state) | read_init_nominal_state) | write_init_nominal_state),
		width_counter_sload_value = width_decoder_out,
		width_decoder_out = ((((({5{1'b0}} | {width_decoder_select[2], {3{1'b0}}, width_decoder_select[2]}) | {{4{1'b0}}, width_decoder_select[3]}) | {{2{1'b0}}, {3{width_decoder_select[5]}}}) | {{3{1'b0}}, width_decoder_select[6], 1'b0}) | {{2{1'b0}}, width_decoder_select[7], {2{1'b0}}}),
		width_decoder_select = {((sel_type_cplf & sel_param_low_r) | (sel_type_cplf & sel_param_odd_CP_unused)), (sel_type_cplf & sel_param_high_i_postscale), ((((((((((((((sel_type_n & sel_param_high_i_postscale) | (sel_type_n & sel_param_low_r)) | (sel_type_m & sel_param_high_i_postscale)) | (sel_type_m & sel_param_low_r)) | (sel_type_c0 & sel_param_high_i_postscale)) | (sel_type_c0 & sel_param_low_r)) | (sel_type_c1 & sel_param_high_i_postscale)) | (sel_type_c1 & sel_param_low_r)) | (sel_type_c2 & sel_param_high_i_postscale)) | (sel_type_c2 & sel_param_low_r)) | (sel_type_c3 & sel_param_high_i_postscale)) | (sel_type_c3 & sel_param_low_r)) | (sel_type_c4 & sel_param_high_i_postscale)) | (sel_type_c4 & sel_param_low_r)), w1592w, ((sel_type_cplf & sel_param_bypass_LF_unused) | (sel_type_cplf & sel_param_c)), ((sel_type_n & sel_param_nominal_count) | (sel_type_m & sel_param_nominal_count)), w1565w, (((((((((((((((sel_type_vco & sel_param_high_i_postscale) | (sel_type_n & sel_param_bypass_LF_unused)) | (sel_type_n & sel_param_odd_CP_unused)) | (sel_type_m & sel_param_bypass_LF_unused)) | (sel_type_m & sel_param_odd_CP_unused)) | (sel_type_c0 & sel_param_bypass_LF_unused)) | (sel_type_c0 & sel_param_odd_CP_unused)) | (sel_type_c1 & sel_param_bypass_LF_unused)) | (sel_type_c1 & sel_param_odd_CP_unused)) | (sel_type_c2 & sel_param_bypass_LF_unused)) | (sel_type_c2 & sel_param_odd_CP_unused)) | (sel_type_c3 & sel_param_bypass_LF_unused)) | (sel_type_c3 & sel_param_odd_CP_unused)) | (sel_type_c4 & sel_param_bypass_LF_unused)) | (sel_type_c4 & sel_param_odd_CP_unused))},
		write_rom_ena = ((rom_first_state | rom_second_state) | (rom_data_state & (~ rom_width_counter_done)));
endmodule