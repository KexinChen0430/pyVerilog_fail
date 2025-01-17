module  asmi_asmi_parallel_0
	(
	addr,
	busy,
	clkin,
	data_valid,
	dataout,
	rden,
	read,
	reset) /* synthesis synthesis_clearbox=1 */;
	input   [23:0]  addr;
	output   busy;
	input   clkin;
	output   data_valid;
	output   [7:0]  dataout;
	input   rden;
	input   read;
	input   reset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   read;
	tri0   reset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [2:0]   wire_addbyte_cntr_q;
	wire  [2:0]   wire_gen_cntr_q;
	wire  [1:0]   wire_stage_cntr_q;
	wire  wire_sd2_data1in;
	reg	add_msb_reg;
	wire	wire_add_msb_reg_ena;
	wire	[23:0]	wire_addr_reg_d;
	reg	[23:0]	addr_reg;
	wire	[23:0]	wire_addr_reg_ena;
	wire	[7:0]	wire_asmi_opcode_reg_d;
	reg	[7:0]	asmi_opcode_reg;
	wire	[7:0]	wire_asmi_opcode_reg_ena;
	reg	busy_det_reg;
	reg	clr_read_reg;
	reg	clr_read_reg2;
	reg	dffe3;
	reg	dvalid_reg;
	wire	wire_dvalid_reg_ena;
	wire	wire_dvalid_reg_sclr;
	reg	dvalid_reg2;
	reg	end1_cyc_reg;
	reg	end1_cyc_reg2;
	reg	end_op_hdlyreg;
	reg	end_op_reg;
	reg	end_rbyte_reg;
	wire	wire_end_rbyte_reg_ena;
	wire	wire_end_rbyte_reg_sclr;
	reg	end_read_reg;
	reg	ncs_reg;
	wire	wire_ncs_reg_sclr;
	wire	[7:0]	wire_read_data_reg_d;
	reg	[7:0]	read_data_reg;
	wire	[7:0]	wire_read_data_reg_ena;
	wire	[7:0]	wire_read_dout_reg_d;
	reg	[7:0]	read_dout_reg;
	wire	[7:0]	wire_read_dout_reg_ena;
	reg	read_reg;
	wire	wire_read_reg_ena;
	reg	shift_op_reg;
	reg	stage2_reg;
	reg	stage3_reg;
	reg	stage4_reg;
	wire	wire_mux211_dataout;
	wire  addr_overdie;
	wire  addr_overdie_pos;
	wire  [23:0]  addr_reg_overdie;
	wire  [7:0]  b4addr_opcode;
	wire  [7:0]  berase_opcode;
	wire  busy_wire;
	wire  clkin_wire;
	wire  clr_addmsb_wire;
	wire  clr_endrbyte_wire;
	wire  clr_read_wire;
	wire  clr_read_wire2;
	wire  clr_rstat_wire;
	wire  clr_sid_wire;
	wire  clr_write_wire2;
	wire  data0out_wire;
	wire  data_valid_wire;
	wire  [3:0]  dataoe_wire;
	wire  [3:0]  dataout_wire;
	wire  [7:0]  derase_opcode;
	wire  do_4baddr;
	wire  do_bulk_erase;
	wire  do_die_erase;
	wire  do_ex4baddr;
	wire  do_fast_read;
	wire  do_fread_epcq;
	wire  do_freadwrv_polling;
	wire  do_memadd;
	wire  do_polling;
	wire  do_read;
	wire  do_read_nonvolatile;
	wire  do_read_rdid;
	wire  do_read_sid;
	wire  do_read_stat;
	wire  do_read_volatile;
	wire  do_sec_erase;
	wire  do_sec_prot;
	wire  do_sprot_polling;
	wire  do_wait_dummyclk;
	wire  do_wren;
	wire  do_write;
	wire  do_write_polling;
	wire  do_write_volatile;
	wire  end1_cyc_gen_cntr_wire;
	wire  end1_cyc_normal_in_wire;
	wire  end1_cyc_reg_in_wire;
	wire  end_add_cycle;
	wire  end_add_cycle_mux_datab_wire;
	wire  end_fast_read;
	wire  end_one_cyc_pos;
	wire  end_one_cycle;
	wire  end_op_wire;
	wire  end_operation;
	wire  end_ophdly;
	wire  end_pgwr_data;
	wire  end_read;
	wire  end_read_byte;
	wire  [7:0]  exb4addr_opcode;
	wire  [7:0]  fast_read_opcode;
	wire  freadwrv_sdoin;
	wire  in_operation;
	wire  load_opcode;
	wire  memadd_sdoin;
	wire  ncs_reg_ena_wire;
	wire  not_busy;
	wire  oe_wire;
	wire  [0:0]  pagewr_buf_not_empty;
	wire  rden_wire;
	wire  [7:0]  rdid_opcode;
	wire  [7:0]  rdummyclk_opcode;
	wire  [7:0]  read_data_reg_in_wire;
	wire  [7:0]  read_opcode;
	wire  read_rdid_wire;
	wire  read_sid_wire;
	wire  read_wire;
	wire  [7:0]  rflagstat_opcode;
	wire  [7:0]  rnvdummyclk_opcode;
	wire  [7:0]  rsid_opcode;
	wire  rsid_sdoin;
	wire  [7:0]  rstat_opcode;
	wire  scein_wire;
	wire  sdoin_wire;
	wire  sec_protect_wire;
	wire  [7:0]  secprot_opcode;
	wire  secprot_sdoin;
	wire  [7:0]  serase_opcode;
	wire  shift_opcode;
	wire  shift_opdata;
	wire  shift_pgwr_data;
	wire  st_busy_wire;
	wire  stage2_wire;
	wire  stage3_wire;
	wire  stage4_wire;
	wire  start_frpoll;
	wire  start_poll;
	wire  start_sppoll;
	wire  start_wrpoll;
	wire  to_sdoin_wire;
	wire  [7:0]  wren_opcode;
	wire  wren_wire;
	wire  [7:0]  write_opcode;
	wire  write_prot_true;
	wire  write_sdoin;
	wire  [7:0]  wrvolatile_opcode;
	a_graycounter   addbyte_cntr
	(
	.aclr(reset),
	.clk_en((((((wire_stage_cntr_q[1] & wire_stage_cntr_q[0]) & end_one_cyc_pos) & (((((((do_read_sid | do_write) | do_sec_erase) | do_die_erase) | do_read_rdid) | do_read) | do_fast_read) | do_read_nonvolatile)) | addr_overdie) | end_operation)),
	.clock((~ clkin_wire)),
	.q(wire_addbyte_cntr_q),
	.qbin(),
	.sclr((end_operation | addr_overdie))
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.cnt_en(1'b1),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		addbyte_cntr.width = 3,
		addbyte_cntr.lpm_type = "a_graycounter";
	a_graycounter   gen_cntr
	(
	.aclr(reset),
	.clk_en((((((in_operation & (~ end_ophdly)) & (~ clr_rstat_wire)) & (~ clr_sid_wire)) | do_wait_dummyclk) | addr_overdie)),
	.clock(clkin_wire),
	.q(wire_gen_cntr_q),
	.qbin(),
	.sclr(((end1_cyc_reg_in_wire | addr_overdie) | do_wait_dummyclk))
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.cnt_en(1'b1),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		gen_cntr.width = 3,
		gen_cntr.lpm_type = "a_graycounter";
	a_graycounter   stage_cntr
	(
	.aclr(reset),
	.clk_en(((((((((((((((in_operation & end_one_cycle) & (~ (stage3_wire & (~ end_add_cycle)))) & (~ (stage4_wire & (~ end_read)))) & (~ (stage4_wire & (~ end_fast_read)))) & (~ ((((do_write | do_sec_erase) | do_die_erase) | do_bulk_erase) & write_prot_true))) & (~ (do_write & (~ pagewr_buf_not_empty[0])))) & (~ (stage3_wire & st_busy_wire))) & (~ ((do_write & shift_pgwr_data) & (~ end_pgwr_data)))) & (~ (stage2_wire & do_wren))) & (~ ((((stage3_wire & (do_sec_erase | do_die_erase)) & (~ do_wren)) & (~ do_read_stat)) & (~ do_read_rdid)))) & (~ (stage3_wire & ((do_write_volatile | do_read_volatile) | do_read_nonvolatile)))) | ((stage3_wire & do_fast_read) & do_wait_dummyclk)) | addr_overdie) | end_ophdly)),
	.clock(clkin_wire),
	.q(wire_stage_cntr_q),
	.qbin(),
	.sclr((end_operation | addr_overdie))
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.cnt_en(1'b1),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		stage_cntr.width = 2,
		stage_cntr.lpm_type = "a_graycounter";
	cyclonev_asmiblock   sd2
	(
	.data0in(),
	.data0oe(dataoe_wire[0]),
	.data0out(sdoin_wire),
	.data1in(wire_sd2_data1in),
	.data1oe(dataoe_wire[1]),
	.data2in(),
	.data2oe(dataoe_wire[2]),
	.data2out(1'b1),
	.data3in(),
	.data3oe(dataoe_wire[3]),
	.data3out(1'b1),
	.dclk(clkin_wire),
	.oe(oe_wire),
	.sce(scein_wire)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.data1out(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		sd2.enable_sim = "false",
		sd2.lpm_type = "cyclonev_asmiblock";
	// synopsys translate_off
	initial
		add_msb_reg = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) add_msb_reg <= 1'b0;
		else if  (wire_add_msb_reg_ena == 1'b1)
			if (clr_addmsb_wire == 1'b1) add_msb_reg <= 1'b0;
			else  add_msb_reg <= addr_reg[23];
	assign
		wire_add_msb_reg_ena = ((((((((do_read | do_fast_read) | do_write) | do_sec_erase) | do_die_erase) & (~ (((do_write | do_sec_erase) | do_die_erase) & (~ do_memadd)))) & wire_stage_cntr_q[1]) & wire_stage_cntr_q[0]) | clr_addmsb_wire);
	// synopsys translate_off
	initial
		addr_reg[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[0:0] <= 1'b0;
		else if  (wire_addr_reg_ena[0:0] == 1'b1)   addr_reg[0:0] <= wire_addr_reg_d[0:0];
	// synopsys translate_off
	initial
		addr_reg[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[1:1] <= 1'b0;
		else if  (wire_addr_reg_ena[1:1] == 1'b1)   addr_reg[1:1] <= wire_addr_reg_d[1:1];
	// synopsys translate_off
	initial
		addr_reg[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[2:2] <= 1'b0;
		else if  (wire_addr_reg_ena[2:2] == 1'b1)   addr_reg[2:2] <= wire_addr_reg_d[2:2];
	// synopsys translate_off
	initial
		addr_reg[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[3:3] <= 1'b0;
		else if  (wire_addr_reg_ena[3:3] == 1'b1)   addr_reg[3:3] <= wire_addr_reg_d[3:3];
	// synopsys translate_off
	initial
		addr_reg[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[4:4] <= 1'b0;
		else if  (wire_addr_reg_ena[4:4] == 1'b1)   addr_reg[4:4] <= wire_addr_reg_d[4:4];
	// synopsys translate_off
	initial
		addr_reg[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[5:5] <= 1'b0;
		else if  (wire_addr_reg_ena[5:5] == 1'b1)   addr_reg[5:5] <= wire_addr_reg_d[5:5];
	// synopsys translate_off
	initial
		addr_reg[6:6] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[6:6] <= 1'b0;
		else if  (wire_addr_reg_ena[6:6] == 1'b1)   addr_reg[6:6] <= wire_addr_reg_d[6:6];
	// synopsys translate_off
	initial
		addr_reg[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[7:7] <= 1'b0;
		else if  (wire_addr_reg_ena[7:7] == 1'b1)   addr_reg[7:7] <= wire_addr_reg_d[7:7];
	// synopsys translate_off
	initial
		addr_reg[8:8] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[8:8] <= 1'b0;
		else if  (wire_addr_reg_ena[8:8] == 1'b1)   addr_reg[8:8] <= wire_addr_reg_d[8:8];
	// synopsys translate_off
	initial
		addr_reg[9:9] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[9:9] <= 1'b0;
		else if  (wire_addr_reg_ena[9:9] == 1'b1)   addr_reg[9:9] <= wire_addr_reg_d[9:9];
	// synopsys translate_off
	initial
		addr_reg[10:10] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[10:10] <= 1'b0;
		else if  (wire_addr_reg_ena[10:10] == 1'b1)   addr_reg[10:10] <= wire_addr_reg_d[10:10];
	// synopsys translate_off
	initial
		addr_reg[11:11] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[11:11] <= 1'b0;
		else if  (wire_addr_reg_ena[11:11] == 1'b1)   addr_reg[11:11] <= wire_addr_reg_d[11:11];
	// synopsys translate_off
	initial
		addr_reg[12:12] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[12:12] <= 1'b0;
		else if  (wire_addr_reg_ena[12:12] == 1'b1)   addr_reg[12:12] <= wire_addr_reg_d[12:12];
	// synopsys translate_off
	initial
		addr_reg[13:13] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[13:13] <= 1'b0;
		else if  (wire_addr_reg_ena[13:13] == 1'b1)   addr_reg[13:13] <= wire_addr_reg_d[13:13];
	// synopsys translate_off
	initial
		addr_reg[14:14] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[14:14] <= 1'b0;
		else if  (wire_addr_reg_ena[14:14] == 1'b1)   addr_reg[14:14] <= wire_addr_reg_d[14:14];
	// synopsys translate_off
	initial
		addr_reg[15:15] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[15:15] <= 1'b0;
		else if  (wire_addr_reg_ena[15:15] == 1'b1)   addr_reg[15:15] <= wire_addr_reg_d[15:15];
	// synopsys translate_off
	initial
		addr_reg[16:16] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[16:16] <= 1'b0;
		else if  (wire_addr_reg_ena[16:16] == 1'b1)   addr_reg[16:16] <= wire_addr_reg_d[16:16];
	// synopsys translate_off
	initial
		addr_reg[17:17] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[17:17] <= 1'b0;
		else if  (wire_addr_reg_ena[17:17] == 1'b1)   addr_reg[17:17] <= wire_addr_reg_d[17:17];
	// synopsys translate_off
	initial
		addr_reg[18:18] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[18:18] <= 1'b0;
		else if  (wire_addr_reg_ena[18:18] == 1'b1)   addr_reg[18:18] <= wire_addr_reg_d[18:18];
	// synopsys translate_off
	initial
		addr_reg[19:19] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[19:19] <= 1'b0;
		else if  (wire_addr_reg_ena[19:19] == 1'b1)   addr_reg[19:19] <= wire_addr_reg_d[19:19];
	// synopsys translate_off
	initial
		addr_reg[20:20] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[20:20] <= 1'b0;
		else if  (wire_addr_reg_ena[20:20] == 1'b1)   addr_reg[20:20] <= wire_addr_reg_d[20:20];
	// synopsys translate_off
	initial
		addr_reg[21:21] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[21:21] <= 1'b0;
		else if  (wire_addr_reg_ena[21:21] == 1'b1)   addr_reg[21:21] <= wire_addr_reg_d[21:21];
	// synopsys translate_off
	initial
		addr_reg[22:22] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[22:22] <= 1'b0;
		else if  (wire_addr_reg_ena[22:22] == 1'b1)   addr_reg[22:22] <= wire_addr_reg_d[22:22];
	// synopsys translate_off
	initial
		addr_reg[23:23] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) addr_reg[23:23] <= 1'b0;
		else if  (wire_addr_reg_ena[23:23] == 1'b1)   addr_reg[23:23] <= wire_addr_reg_d[23:23];
	assign
		wire_addr_reg_d = {((({23{not_busy}} & addr[23:1]) | ({23{stage3_wire}} & addr_reg[22:0])) | ({23{addr_overdie}} & addr_reg_overdie[23:1])), ((not_busy & addr[0]) | (addr_overdie & addr_reg_overdie[0]))};
	assign
		wire_addr_reg_ena = {24{((((rden_wire | wren_wire) & not_busy) | (stage4_wire & addr_overdie)) | (stage3_wire & ((((do_write | do_sec_erase) | do_die_erase) & do_memadd) | (do_read | do_fast_read))))}};
	// synopsys translate_off
	initial
		asmi_opcode_reg[0:0] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) asmi_opcode_reg[0:0] <= 1'b0;
		else if  (wire_asmi_opcode_reg_ena[0:0] == 1'b1)   asmi_opcode_reg[0:0] <= wire_asmi_opcode_reg_d[0:0];
	// synopsys translate_off
	initial
		asmi_opcode_reg[1:1] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) asmi_opcode_reg[1:1] <= 1'b0;
		else if  (wire_asmi_opcode_reg_ena[1:1] == 1'b1)   asmi_opcode_reg[1:1] <= wire_asmi_opcode_reg_d[1:1];
	// synopsys translate_off
	initial
		asmi_opcode_reg[2:2] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) asmi_opcode_reg[2:2] <= 1'b0;
		else if  (wire_asmi_opcode_reg_ena[2:2] == 1'b1)   asmi_opcode_reg[2:2] <= wire_asmi_opcode_reg_d[2:2];
	// synopsys translate_off
	initial
		asmi_opcode_reg[3:3] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) asmi_opcode_reg[3:3] <= 1'b0;
		else if  (wire_asmi_opcode_reg_ena[3:3] == 1'b1)   asmi_opcode_reg[3:3] <= wire_asmi_opcode_reg_d[3:3];
	// synopsys translate_off
	initial
		asmi_opcode_reg[4:4] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) asmi_opcode_reg[4:4] <= 1'b0;
		else if  (wire_asmi_opcode_reg_ena[4:4] == 1'b1)   asmi_opcode_reg[4:4] <= wire_asmi_opcode_reg_d[4:4];
	// synopsys translate_off
	initial
		asmi_opcode_reg[5:5] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) asmi_opcode_reg[5:5] <= 1'b0;
		else if  (wire_asmi_opcode_reg_ena[5:5] == 1'b1)   asmi_opcode_reg[5:5] <= wire_asmi_opcode_reg_d[5:5];
	// synopsys translate_off
	initial
		asmi_opcode_reg[6:6] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) asmi_opcode_reg[6:6] <= 1'b0;
		else if  (wire_asmi_opcode_reg_ena[6:6] == 1'b1)   asmi_opcode_reg[6:6] <= wire_asmi_opcode_reg_d[6:6];
	// synopsys translate_off
	initial
		asmi_opcode_reg[7:7] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) asmi_opcode_reg[7:7] <= 1'b0;
		else if  (wire_asmi_opcode_reg_ena[7:7] == 1'b1)   asmi_opcode_reg[7:7] <= wire_asmi_opcode_reg_d[7:7];
	assign
		wire_asmi_opcode_reg_d = {(((((((((((((((((({7{(load_opcode & do_read_sid)}} & rsid_opcode[7:1]) | ({7{(load_opcode & do_read_rdid)}} & rdid_opcode[7:1])) | ({7{(((load_opcode & do_sec_prot) & (~ do_wren)) & (~ do_read_stat))}} & secprot_opcode[7:1])) | ({7{(load_opcode & do_read)}} & read_opcode[7:1])) | ({7{(load_opcode & do_fast_read)}} & fast_read_opcode[7:1])) | ({7{((((load_opcode & do_read_volatile) & (~ do_write_volatile)) & (~ do_wren)) & (~ do_read_stat))}} & rdummyclk_opcode[7:1])) | ({7{((((load_opcode & do_write_volatile) & (~ do_read_volatile)) & (~ do_wren)) & (~ do_read_stat))}} & wrvolatile_opcode[7:1])) | ({7{(load_opcode & do_read_nonvolatile)}} & rnvdummyclk_opcode[7:1])) | ({7{(load_opcode & ((do_write & (~ do_read_stat)) & (~ do_wren)))}} & write_opcode[7:1])) | ({7{((load_opcode & do_read_stat) & (~ do_polling))}} & rstat_opcode[7:1])) | ({7{((load_opcode & do_read_stat) & do_polling)}} & rflagstat_opcode[7:1])) | ({7{(((load_opcode & do_sec_erase) & (~ do_wren)) & (~ do_read_stat))}} & serase_opcode[7:1])) | ({7{(((load_opcode & do_die_erase) & (~ do_wren)) & (~ do_read_stat))}} & derase_opcode[7:1])) | ({7{(((load_opcode & do_bulk_erase) & (~ do_wren)) & (~ do_read_stat))}} & berase_opcode[7:1])) | ({7{(load_opcode & do_wren)}} & wren_opcode[7:1])) | ({7{(load_opcode & ((do_4baddr & (~ do_read_stat)) & (~ do_wren)))}} & b4addr_opcode[7:1])) | ({7{(load_opcode & ((do_ex4baddr & (~ do_read_stat)) & (~ do_wren)))}} & exb4addr_opcode[7:1])) | ({7{shift_opcode}} & asmi_opcode_reg[6:0])), ((((((((((((((((((load_opcode & do_read_sid) & rsid_opcode[0]) | ((load_opcode & do_read_rdid) & rdid_opcode[0])) | ((((load_opcode & do_sec_prot) & (~ do_wren)) & (~ do_read_stat)) & secprot_opcode[0])) | ((load_opcode & do_read) & read_opcode[0])) | ((load_opcode & do_fast_read) & fast_read_opcode[0])) | (((((load_opcode & do_read_volatile) & (~ do_write_volatile)) & (~ do_wren)) & (~ do_read_stat)) & rdummyclk_opcode[0])) | (((((load_opcode & do_write_volatile) & (~ do_read_volatile)) & (~ do_wren)) & (~ do_read_stat
)) & wrvolatile_opcode[0])) | ((load_opcode & do_read_nonvolatile) & rnvdummyclk_opcode[0])) | ((load_opcode & ((do_write & (~ do_read_stat)) & (~ do_wren))) & write_opcode[0])) | (((load_opcode & do_read_stat) & (~ do_polling)) & rstat_opcode[0])) | (((load_opcode & do_read_stat) & do_polling) & rflagstat_opcode[0])) | ((((load_opcode & do_sec_erase) & (~ do_wren)) & (~ do_read_stat)) & serase_opcode[0])) | ((((load_opcode & do_die_erase) & (~ do_wren)) & (~ do_read_stat)) & derase_opcode[0])) | ((((load_opcode & do_bulk_erase) & (~ do_wren)) & (~ do_read_stat)) & berase_opcode[0])) | ((load_opcode & do_wren) & wren_opcode[0])) | ((load_opcode & ((do_4baddr & (~ do_read_stat)) & (~ do_wren))) & b4addr_opcode[0])) | ((load_opcode & ((do_ex4baddr & (~ do_read_stat)) & (~ do_wren))) & exb4addr_opcode[0]))};
	assign
		wire_asmi_opcode_reg_ena = {8{(load_opcode | shift_opcode)}};
	// synopsys translate_off
	initial
		busy_det_reg = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) busy_det_reg <= 1'b0;
		else  busy_det_reg <= (~ busy_wire);
	// synopsys translate_off
	initial
		clr_read_reg = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) clr_read_reg <= 1'b0;
		else  clr_read_reg <= ((do_read_sid | do_sec_prot) | end_operation);
	// synopsys translate_off
	initial
		clr_read_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) clr_read_reg2 <= 1'b0;
		else  clr_read_reg2 <= clr_read_reg;
	// synopsys translate_off
	initial
		 dffe3 = 0;
	// synopsys translate_on
	// synopsys translate_off
	initial
		dvalid_reg = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) dvalid_reg <= 1'b0;
		else if  (wire_dvalid_reg_ena == 1'b1)
			if (wire_dvalid_reg_sclr == 1'b1) dvalid_reg <= 1'b0;
			else  dvalid_reg <= (end_read_byte & end_one_cyc_pos);
	assign
		wire_dvalid_reg_ena = (do_read | do_fast_read),
		wire_dvalid_reg_sclr = (end_op_wire | end_operation);
	// synopsys translate_off
	initial
		dvalid_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) dvalid_reg2 <= 1'b0;
		else  dvalid_reg2 <= dvalid_reg;
	// synopsys translate_off
	initial
		end1_cyc_reg = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) end1_cyc_reg <= 1'b0;
		else  end1_cyc_reg <= end1_cyc_reg_in_wire;
	// synopsys translate_off
	initial
		end1_cyc_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) end1_cyc_reg2 <= 1'b0;
		else  end1_cyc_reg2 <= end_one_cycle;
	// synopsys translate_off
	initial
		end_op_hdlyreg = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) end_op_hdlyreg <= 1'b0;
		else  end_op_hdlyreg <= end_operation;
	// synopsys translate_off
	initial
		end_op_reg = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) end_op_reg <= 1'b0;
		else  end_op_reg <= end_op_wire;
	// synopsys translate_off
	initial
		end_rbyte_reg = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) end_rbyte_reg <= 1'b0;
		else if  (wire_end_rbyte_reg_ena == 1'b1)
			if (wire_end_rbyte_reg_sclr == 1'b1) end_rbyte_reg <= 1'b0;
			else  end_rbyte_reg <= (((do_read | do_fast_read) & wire_stage_cntr_q[1]) & (~ wire_stage_cntr_q[0]));
	assign
		wire_end_rbyte_reg_ena = (((wire_gen_cntr_q[2] & (~ wire_gen_cntr_q[1])) & wire_gen_cntr_q[0]) | clr_endrbyte_wire),
		wire_end_rbyte_reg_sclr = (clr_endrbyte_wire | addr_overdie);
	// synopsys translate_off
	initial
		end_read_reg = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) end_read_reg <= 1'b0;
		else  end_read_reg <= ((((~ rden_wire) & (do_read | do_fast_read)) & data_valid_wire) & end_read_byte);
	// synopsys translate_off
	initial
		ncs_reg = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) ncs_reg <= 1'b0;
		else if  (ncs_reg_ena_wire == 1'b1)
			if (wire_ncs_reg_sclr == 1'b1) ncs_reg <= 1'b0;
			else  ncs_reg <= 1'b1;
	assign
		wire_ncs_reg_sclr = (end_operation | addr_overdie_pos);
	// synopsys translate_off
	initial
		read_data_reg[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_data_reg[0:0] <= 1'b0;
		else if  (wire_read_data_reg_ena[0:0] == 1'b1)   read_data_reg[0:0] <= wire_read_data_reg_d[0:0];
	// synopsys translate_off
	initial
		read_data_reg[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_data_reg[1:1] <= 1'b0;
		else if  (wire_read_data_reg_ena[1:1] == 1'b1)   read_data_reg[1:1] <= wire_read_data_reg_d[1:1];
	// synopsys translate_off
	initial
		read_data_reg[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_data_reg[2:2] <= 1'b0;
		else if  (wire_read_data_reg_ena[2:2] == 1'b1)   read_data_reg[2:2] <= wire_read_data_reg_d[2:2];
	// synopsys translate_off
	initial
		read_data_reg[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_data_reg[3:3] <= 1'b0;
		else if  (wire_read_data_reg_ena[3:3] == 1'b1)   read_data_reg[3:3] <= wire_read_data_reg_d[3:3];
	// synopsys translate_off
	initial
		read_data_reg[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_data_reg[4:4] <= 1'b0;
		else if  (wire_read_data_reg_ena[4:4] == 1'b1)   read_data_reg[4:4] <= wire_read_data_reg_d[4:4];
	// synopsys translate_off
	initial
		read_data_reg[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_data_reg[5:5] <= 1'b0;
		else if  (wire_read_data_reg_ena[5:5] == 1'b1)   read_data_reg[5:5] <= wire_read_data_reg_d[5:5];
	// synopsys translate_off
	initial
		read_data_reg[6:6] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_data_reg[6:6] <= 1'b0;
		else if  (wire_read_data_reg_ena[6:6] == 1'b1)   read_data_reg[6:6] <= wire_read_data_reg_d[6:6];
	// synopsys translate_off
	initial
		read_data_reg[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_data_reg[7:7] <= 1'b0;
		else if  (wire_read_data_reg_ena[7:7] == 1'b1)   read_data_reg[7:7] <= wire_read_data_reg_d[7:7];
	assign
		wire_read_data_reg_d = {read_data_reg_in_wire[7:0]};
	assign
		wire_read_data_reg_ena = {8{(((((do_read | do_fast_read) & wire_stage_cntr_q[1]) & (~ wire_stage_cntr_q[0])) & end_one_cyc_pos) & end_read_byte)}};
	// synopsys translate_off
	initial
		read_dout_reg[0:0] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_dout_reg[0:0] <= 1'b0;
		else if  (wire_read_dout_reg_ena[0:0] == 1'b1)   read_dout_reg[0:0] <= wire_read_dout_reg_d[0:0];
	// synopsys translate_off
	initial
		read_dout_reg[1:1] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_dout_reg[1:1] <= 1'b0;
		else if  (wire_read_dout_reg_ena[1:1] == 1'b1)   read_dout_reg[1:1] <= wire_read_dout_reg_d[1:1];
	// synopsys translate_off
	initial
		read_dout_reg[2:2] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_dout_reg[2:2] <= 1'b0;
		else if  (wire_read_dout_reg_ena[2:2] == 1'b1)   read_dout_reg[2:2] <= wire_read_dout_reg_d[2:2];
	// synopsys translate_off
	initial
		read_dout_reg[3:3] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_dout_reg[3:3] <= 1'b0;
		else if  (wire_read_dout_reg_ena[3:3] == 1'b1)   read_dout_reg[3:3] <= wire_read_dout_reg_d[3:3];
	// synopsys translate_off
	initial
		read_dout_reg[4:4] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_dout_reg[4:4] <= 1'b0;
		else if  (wire_read_dout_reg_ena[4:4] == 1'b1)   read_dout_reg[4:4] <= wire_read_dout_reg_d[4:4];
	// synopsys translate_off
	initial
		read_dout_reg[5:5] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_dout_reg[5:5] <= 1'b0;
		else if  (wire_read_dout_reg_ena[5:5] == 1'b1)   read_dout_reg[5:5] <= wire_read_dout_reg_d[5:5];
	// synopsys translate_off
	initial
		read_dout_reg[6:6] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_dout_reg[6:6] <= 1'b0;
		else if  (wire_read_dout_reg_ena[6:6] == 1'b1)   read_dout_reg[6:6] <= wire_read_dout_reg_d[6:6];
	// synopsys translate_off
	initial
		read_dout_reg[7:7] = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_dout_reg[7:7] <= 1'b0;
		else if  (wire_read_dout_reg_ena[7:7] == 1'b1)   read_dout_reg[7:7] <= wire_read_dout_reg_d[7:7];
	assign
		wire_read_dout_reg_d = {read_dout_reg[6:0], (data0out_wire | dataout_wire[1])};
	assign
		wire_read_dout_reg_ena = {8{((stage4_wire & ((do_read | do_fast_read) | do_read_sid)) | (stage3_wire & (((do_read_stat | do_read_rdid) | do_read_volatile) | do_read_nonvolatile)))}};
	// synopsys translate_off
	initial
		read_reg = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) read_reg <= 1'b0;
		else if  (wire_read_reg_ena == 1'b1)
			if (clr_read_wire == 1'b1) read_reg <= 1'b0;
			else  read_reg <= read;
	assign
		wire_read_reg_ena = (((~ busy_wire) & rden_wire) | clr_read_wire);
	// synopsys translate_off
	initial
		shift_op_reg = 0;
	// synopsys translate_on
	always @ ( posedge clkin_wire or  posedge reset)
		if (reset == 1'b1) shift_op_reg <= 1'b0;
		else  shift_op_reg <= ((~ wire_stage_cntr_q[1]) & wire_stage_cntr_q[0]);
	// synopsys translate_off
	initial
		stage2_reg = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) stage2_reg <= 1'b0;
		else  stage2_reg <= ((~ wire_stage_cntr_q[1]) & wire_stage_cntr_q[0]);
	// synopsys translate_off
	initial
		stage3_reg = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) stage3_reg <= 1'b0;
		else  stage3_reg <= (wire_stage_cntr_q[1] & wire_stage_cntr_q[0]);
	// synopsys translate_off
	initial
		stage4_reg = 0;
	// synopsys translate_on
	always @ ( negedge clkin_wire or  posedge reset)
		if (reset == 1'b1) stage4_reg <= 1'b0;
		else  stage4_reg <= (wire_stage_cntr_q[1] & (~ wire_stage_cntr_q[0]));
	assign		wire_mux211_dataout = (do_fast_read === 1'b1) ? end_add_cycle_mux_datab_wire : (wire_addbyte_cntr_q[1] & (~ wire_addbyte_cntr_q[0]));
	assign
		addr_overdie = 1'b0,
		addr_overdie_pos = 1'b0,
		addr_reg_overdie = {24{1'b0}},
		b4addr_opcode = {8{1'b0}},
		berase_opcode = {8{1'b0}},
		busy = busy_wire,
		busy_wire = ((((((((((((((do_read_rdid | do_read_sid) | do_read) | do_fast_read) | do_write) | do_sec_prot) | do_read_stat) | do_sec_erase) | do_bulk_erase) | do_die_erase) | do_4baddr) | do_read_volatile) | do_fread_epcq) | do_read_nonvolatile) | do_ex4baddr),
		clkin_wire = clkin,
		clr_addmsb_wire = (((((wire_stage_cntr_q[1] & (~ wire_stage_cntr_q[0])) & end_add_cycle) & end_one_cyc_pos) | (((~ do_read) & (~ do_fast_read)) & clr_write_wire2)) | ((((do_sec_erase | do_die_erase) & (~ do_wren)) & (~ do_read_stat)) & end_operation)),
		clr_endrbyte_wire = (((((do_read | do_fast_read) & (~ wire_gen_cntr_q[2])) & wire_gen_cntr_q[1]) & wire_gen_cntr_q[0]) | clr_read_wire2),
		clr_read_wire = clr_read_reg,
		clr_read_wire2 = clr_read_reg2,
		clr_rstat_wire = 1'b0,
		clr_sid_wire = 1'b0,
		clr_write_wire2 = 1'b0,
		data0out_wire = wire_sd2_data1in,
		data_valid = data_valid_wire,
		data_valid_wire = dvalid_reg2,
		dataoe_wire = {{2{1'b1}}, 1'b0, 1'b1},
		dataout = {read_data_reg[7:0]},
		dataout_wire = {{4{1'b0}}},
		derase_opcode = {8{1'b0}},
		do_4baddr = 1'b0,
		do_bulk_erase = 1'b0,
		do_die_erase = 1'b0,
		do_ex4baddr = 1'b0,
		do_fast_read = 1'b0,
		do_fread_epcq = 1'b0,
		do_freadwrv_polling = 1'b0,
		do_memadd = 1'b0,
		do_polling = ((do_write_polling | do_sprot_polling) | do_freadwrv_polling),
		do_read = ((((~ read_rdid_wire) & (~ read_sid_wire)) & (~ sec_protect_wire)) & read_wire),
		do_read_nonvolatile = 1'b0,
		do_read_rdid = 1'b0,
		do_read_sid = 1'b0,
		do_read_stat = 1'b0,
		do_read_volatile = 1'b0,
		do_sec_erase = 1'b0,
		do_sec_prot = 1'b0,
		do_sprot_polling = 1'b0,
		do_wait_dummyclk = 1'b0,
		do_wren = 1'b0,
		do_write = 1'b0,
		do_write_polling = 1'b0,
		do_write_volatile = 1'b0,
		end1_cyc_gen_cntr_wire = ((wire_gen_cntr_q[2] & (~ wire_gen_cntr_q[1])) & (~ wire_gen_cntr_q[0])),
		end1_cyc_normal_in_wire = ((((((((((((~ wire_stage_cntr_q[0]) & (~ wire_stage_cntr_q[1])) & (~ wire_gen_cntr_q[2])) & wire_gen_cntr_q[1]) & wire_gen_cntr_q[0]) | ((~ ((~ wire_stage_cntr_q[0]) & (~ wire_stage_cntr_q[1]))) & end1_cyc_gen_cntr_wire)) | (do_read & end_read)) | (do_fast_read & end_fast_read)) | ((((do_write | do_sec_erase) | do_bulk_erase) | do_die_erase) & write_prot_true)) | (do_write & (~ pagewr_buf_not_empty[0]))) | ((do_read_stat & start_poll) & (~ st_busy_wire))) | (do_read_rdid & end_op_wire)),
		end1_cyc_reg_in_wire = end1_cyc_normal_in_wire,
		end_add_cycle = wire_mux211_dataout,
		end_add_cycle_mux_datab_wire = (wire_addbyte_cntr_q[2] & wire_addbyte_cntr_q[1]),
		end_fast_read = end_read_reg,
		end_one_cyc_pos = end1_cyc_reg2,
		end_one_cycle = end1_cyc_reg,
		end_op_wire = ((((((((((((wire_stage_cntr_q[1] & (~ wire_stage_cntr_q[0])) & ((((((~ do_read) & (~ do_fast_read)) & (~ (do_write & shift_pgwr_data))) & end_one_cycle) | (do_read & end_read)) | (do_fast_read & end_fast_read))) | ((((wire_stage_cntr_q[1] & wire_stage_cntr_q[0]) & do_read_stat) & end_one_cycle) & (~ do_polling))) | ((((((do_read_rdid & end_one_cyc_pos) & wire_stage_cntr_q[1]) & wire_stage_cntr_q[0]) & wire_addbyte_cntr_q[2]) & wire_addbyte_cntr_q[1]) & (~ wire_addbyte_cntr_q[0]))) | (((start_poll & do_read_stat) & do_polling) & (~ st_busy_wire))) | ((((~ wire_stage_cntr_q[1]) & wire_stage_cntr_q[0]) & (do_wren | (do_4baddr | (do_ex4baddr | (do_bulk_erase & (~ do_read_stat)))))) & end_one_cycle)) | ((((do_write | do_sec_erase) | do_bulk_erase) | do_die_erase) & write_prot_true)) | ((do_write & shift_pgwr_data) & end_pgwr_data)) | (do_write & (~ pagewr_buf_not_empty[0]))) | (((((wire_stage_cntr_q[1] & wire_stage_cntr_q[0]) & do_sec_prot) & (~ do_wren)) & (~ do_read_stat)) & end_one_cycle)) | ((((((wire_stage_cntr_q[1] & wire_stage_cntr_q[0]) & (do_sec_erase | do_die_erase)) & (~ do_wren)) & (~ do_read_stat)) & end_add_cycle) & end_one_cycle)) | (((wire_stage_cntr_q[1] & wire_stage_cntr_q[0]) & end_one_cycle) & ((do_write_volatile | do_read_volatile) | (do_read_nonvolatile & wire_addbyte_cntr_q[1])))),
		end_operation = end_op_reg,
		end_ophdly = end_op_hdlyreg,
		end_pgwr_data = 1'b0,
		end_read = end_read_reg,
		end_read_byte = (end_rbyte_reg & (~ addr_overdie)),
		exb4addr_opcode = {8{1'b0}},
		fast_read_opcode = {8{1'b0}},
		freadwrv_sdoin = 1'b0,
		in_operation = busy_wire,
		load_opcode = (((((~ wire_stage_cntr_q[1]) & (~ wire_stage_cntr_q[0])) & (~ wire_gen_cntr_q[2])) & (~ wire_gen_cntr_q[1])) & wire_gen_cntr_q[0]),
		memadd_sdoin = add_msb_reg,
		ncs_reg_ena_wire = (((((~ wire_stage_cntr_q[1]) & wire_stage_cntr_q[0]) & end_one_cyc_pos) | addr_overdie_pos) | end_operation),
		not_busy = busy_det_reg,
		oe_wire = 1'b0,
		pagewr_buf_not_empty = {1'b1},
		rden_wire = rden,
		rdid_opcode = {8{1'b0}},
		rdummyclk_opcode = {8{1'b0}},
		read_data_reg_in_wire = {read_dout_reg[7:0]},
		read_opcode = 8'b00000011,
		read_rdid_wire = 1'b0,
		read_sid_wire = 1'b0,
		read_wire = read_reg,
		rflagstat_opcode = {8{1'b0}},
		rnvdummyclk_opcode = {8{1'b0}},
		rsid_opcode = {8{1'b0}},
		rsid_sdoin = 1'b0,
		rstat_opcode = {8{1'b0}},
		scein_wire = (~ ncs_reg),
		sdoin_wire = to_sdoin_wire,
		sec_protect_wire = 1'b0,
		secprot_opcode = {8{1'b0}},
		secprot_sdoin = 1'b0,
		serase_opcode = {8{1'b0}},
		shift_opcode = shift_op_reg,
		shift_opdata = stage2_wire,
		shift_pgwr_data = 1'b0,
		st_busy_wire = 1'b0,
		stage2_wire = stage2_reg,
		stage3_wire = stage3_reg,
		stage4_wire = stage4_reg,
		start_frpoll = 1'b0,
		start_poll = ((start_wrpoll | start_sppoll) | start_frpoll),
		start_sppoll = 1'b0,
		start_wrpoll = 1'b0,
		to_sdoin_wire = ((((((shift_opdata & asmi_opcode_reg[7]) | rsid_sdoin) | memadd_sdoin) | write_sdoin) | secprot_sdoin) | freadwrv_sdoin),
		wren_opcode = {8{1'b0}},
		wren_wire = 1'b1,
		write_opcode = {8{1'b0}},
		write_prot_true = 1'b0,
		write_sdoin = 1'b0,
		wrvolatile_opcode = {8{1'b0}};
endmodule