module  small_fifo_test_cntr
	(
	aclr,
	clock,
	cnt_en,
	q,
	sclr,
	updown) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clock;
	input   cnt_en;
	output   [4:0]  q;
	input   sclr;
	input   updown;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   cnt_en;
	tri0   sclr;
	tri1   updown;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire  [0:0]   wire_counter_comb_bita_2cout;
	wire  [0:0]   wire_counter_comb_bita_3cout;
	wire  [0:0]   wire_counter_comb_bita_0sumout;
	wire  [0:0]   wire_counter_comb_bita_1sumout;
	wire  [0:0]   wire_counter_comb_bita_2sumout;
	wire  [0:0]   wire_counter_comb_bita_3sumout;
	wire  [0:0]   wire_counter_comb_bita_4sumout;
	wire  [4:0]   wire_counter_reg_bit1a_adatasdata;
	wire  [4:0]   wire_counter_reg_bit1a_regout;
	wire  aclr_actual;
	wire clk_en;
	wire [4:0]  data;
	wire  external_cin;
	wire  lsb_cin;
	wire  [4:0]  s_val;
	wire  [4:0]  safe_q;
	wire sload;
	wire sset;
	wire  updown_dir;
	wire  updown_lsb;
	wire  updown_other_bits;
	stratixii_lcell_comb   counter_comb_bita_0
	(
	.cin(lsb_cin),
	.combout(),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[0:0]),
	.dataf(updown_lsb),
	.shareout(),
	.sumout(wire_counter_comb_bita_0sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_0.extended_lut = "off",
		counter_comb_bita_0.lut_mask = 64'h000000000000FF00,
		counter_comb_bita_0.shared_arith = "off",
		counter_comb_bita_0.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_1
	(
	.cin(wire_counter_comb_bita_0cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_1cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[1:1]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_1sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_1.extended_lut = "off",
		counter_comb_bita_1.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_1.shared_arith = "off",
		counter_comb_bita_1.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_2
	(
	.cin(wire_counter_comb_bita_1cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_2cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[2:2]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_2sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_2.extended_lut = "off",
		counter_comb_bita_2.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_2.shared_arith = "off",
		counter_comb_bita_2.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_3
	(
	.cin(wire_counter_comb_bita_2cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_3cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[3:3]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_3sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_3.extended_lut = "off",
		counter_comb_bita_3.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_3.shared_arith = "off",
		counter_comb_bita_3.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_4
	(
	.cin(wire_counter_comb_bita_3cout[0:0]),
	.combout(),
	.cout(),
	.datad(wire_counter_reg_bit1a_regout[4:4]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_4sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_4.extended_lut = "off",
		counter_comb_bita_4.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_4.shared_arith = "off",
		counter_comb_bita_4.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_ff   counter_reg_bit1a_0
	(
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[0:0]),
	.clk(clock),
	.datain(wire_counter_comb_bita_0sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[0:0]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_1
	(
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[1:1]),
	.clk(clock),
	.datain(wire_counter_comb_bita_1sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[1:1]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_2
	(
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[2:2]),
	.clk(clock),
	.datain(wire_counter_comb_bita_2sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[2:2]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_3
	(
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[3:3]),
	.clk(clock),
	.datain(wire_counter_comb_bita_3sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[3:3]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_4
	(
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[4:4]),
	.clk(clock),
	.datain(wire_counter_comb_bita_4sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[4:4]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	assign
		wire_counter_reg_bit1a_adatasdata = (({5{sset}} & s_val) | ({5{(~ sset)}} & data));
	assign
		aclr_actual = aclr,
		clk_en = 1'b1,
		data = {5{1'b0}},
		external_cin = 1'b1,
		lsb_cin = 1'b0,
		q = safe_q,
		s_val = {5{1'b1}},
		safe_q = wire_counter_reg_bit1a_regout,
		sload = 1'b0,
		sset = 1'b0,
		updown_dir = updown,
		updown_lsb = updown_dir,
		updown_other_bits = ((~ external_cin) | updown_dir);
endmodule