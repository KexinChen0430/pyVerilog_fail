module stratixv_mac(
			accumulate,
			aclr,
			ax,
			ay,
			az,
			bx,
			by,
			chainin,
			cin,
			clk,
			coefsela,
			coefselb,
			complex,
			ena,
			loadconst,
			negate,
			scanin,
			sub,
			chainout,
			cout,
			dftout,
			resulta,
			resultb,
			scanout
		);
//PARAMETERS
parameter lpm_type = "stratixv_mac";
parameter ax_width = 16;
parameter ay_scan_in_width = 16;
parameter az_width = 1;
parameter bx_width = 16;
parameter by_width = 16;
parameter scan_out_width = 1;
parameter result_a_width = 33;
parameter result_b_width = 1;
parameter operation_mode = "m18x18_sumof2";
parameter mode_sub_location = 0;
parameter operand_source_max = "input";
parameter operand_source_may = "input";
parameter operand_source_mbx = "input";
parameter operand_source_mby = "input";
parameter preadder_subtract_a = "false";
parameter preadder_subtract_b = "false";
parameter signed_max = "false";
parameter signed_may = "false";
parameter signed_mbx = "false";
parameter signed_mby = "false";
parameter ay_use_scan_in = "false";
parameter by_use_scan_in = "false";
parameter delay_scan_out_ay = "false";
parameter delay_scan_out_by = "false";
parameter use_chainadder = "false";
parameter [5:0] load_const_value = 6'b0;
parameter signed [26:0] coef_a_0 = 0;
parameter signed [26:0] coef_a_1 = 0;
parameter signed [26:0] coef_a_2 = 0;
parameter signed [26:0] coef_a_3 = 0;
parameter signed [26:0] coef_a_4 = 0;
parameter signed [26:0] coef_a_5 = 0;
parameter signed [26:0] coef_a_6 = 0;
parameter signed [26:0] coef_a_7 = 0;
parameter signed [17:0] coef_b_0 = 0;
parameter signed [17:0] coef_b_1 = 0;
parameter signed [17:0] coef_b_2 = 0;
parameter signed [17:0] coef_b_3 = 0;
parameter signed [17:0] coef_b_4 = 0;
parameter signed [17:0] coef_b_5 = 0;
parameter signed [17:0] coef_b_6 = 0;
parameter signed [17:0] coef_b_7 = 0;
parameter ax_clock = "none";
parameter ay_scan_in_clock = "none";
parameter az_clock = "none";
parameter bx_clock = "none";
parameter by_clock = "none";
parameter coef_sel_a_clock = "none";
parameter coef_sel_b_clock = "none";
parameter sub_clock = "none";
parameter negate_clock = "none";
parameter accumulate_clock = "none";
parameter load_const_clock = "none";
parameter complex_clock = "none";
parameter output_clock = "none";
//INPUT PORTS
input	sub;
input	negate;
input	accumulate;
input	loadconst;
input	complex;
input 	cin;
input	[ax_width-1 : 0]	ax;
input	[ay_scan_in_width-1 : 0]	ay;
input	[ay_scan_in_width-1 : 0]	scanin;
input	[az_width-1 : 0]	az;
input	[bx_width-1 : 0]	bx;
input	[by_width-1 : 0]	by;
input	[2:0] coefsela;
input	[2:0] coefselb;
input	[2:0] clk;
input	[1:0] aclr;
input	[2:0] ena;
input	[63 : 0] chainin;
//OUTPUT PORTS
output	cout;
output	dftout;
output	[result_a_width-1 : 0] resulta;
output	[result_b_width-1 : 0] resultb;
output	[scan_out_width-1 : 0] scanout;
output	[63 : 0] chainout;
stratixv_mac_encrypted	mac_core0
(
	.sub(sub),
	.negate(negate),
	.accumulate(accumulate),
	.loadconst(loadconst),
	.complex(complex),
	.cin(cin),
	.ax(ax),
	.ay(ay),
	.az(az),
	.bx(bx),
	.by(by),
	.scanin(scanin),
	.coefsela(coefsela),
	.coefselb(coefselb),
	.clk(clk),
	.aclr(aclr),
	.ena(ena),
	.chainin(chainin),
	.dftout(dftout),
	.cout(cout),
	.resulta(resulta),
	.resultb(resultb),
	.scanout(scanout),
	.chainout(chainout)
);
defparam mac_core0.ax_width = ax_width;
defparam mac_core0.ay_scan_in_width = ay_scan_in_width;
defparam mac_core0.az_width = az_width;
defparam mac_core0.bx_width = bx_width;
defparam mac_core0.by_width = by_width;
defparam mac_core0.scan_out_width = scan_out_width;
defparam mac_core0.result_a_width = result_a_width;
defparam mac_core0.result_b_width = result_b_width;
defparam mac_core0.operation_mode = operation_mode;
defparam mac_core0.mode_sub_location = mode_sub_location;
defparam mac_core0.operand_source_max = operand_source_max;
defparam mac_core0.operand_source_may = operand_source_may;
defparam mac_core0.operand_source_mbx = operand_source_mbx;
defparam mac_core0.operand_source_mby = operand_source_mby;
defparam mac_core0.preadder_subtract_a = preadder_subtract_a;
defparam mac_core0.preadder_subtract_b = preadder_subtract_b;
defparam mac_core0.signed_max = signed_max;
defparam mac_core0.signed_may = signed_may;
defparam mac_core0.signed_mbx = signed_mbx;
defparam mac_core0.signed_mby = signed_mby;
defparam mac_core0.ay_use_scan_in = ay_use_scan_in;
defparam mac_core0.by_use_scan_in = by_use_scan_in;
defparam mac_core0.delay_scan_out_ay = delay_scan_out_ay;
defparam mac_core0.delay_scan_out_by = delay_scan_out_by;
defparam mac_core0.use_chainadder = use_chainadder;
defparam mac_core0.load_const_value = load_const_value;
defparam mac_core0.coef_a_0 = coef_a_0;
defparam mac_core0.coef_a_1 = coef_a_1;
defparam mac_core0.coef_a_2 = coef_a_2;
defparam mac_core0.coef_a_3 = coef_a_3;
defparam mac_core0.coef_a_4 = coef_a_4;
defparam mac_core0.coef_a_5 = coef_a_5;
defparam mac_core0.coef_a_6 = coef_a_6;
defparam mac_core0.coef_a_7 = coef_a_7;
defparam mac_core0.coef_b_0 = coef_b_0;
defparam mac_core0.coef_b_1 = coef_b_1;
defparam mac_core0.coef_b_2 = coef_b_2;
defparam mac_core0.coef_b_3 = coef_b_3;
defparam mac_core0.coef_b_4 = coef_b_4;
defparam mac_core0.coef_b_5 = coef_b_5;
defparam mac_core0.coef_b_6 = coef_b_6;
defparam mac_core0.coef_b_7 = coef_b_7;
defparam mac_core0.ax_clock = ax_clock;
defparam mac_core0.ay_scan_in_clock = ay_scan_in_clock;
defparam mac_core0.az_clock = az_clock;
defparam mac_core0.bx_clock = bx_clock;
defparam mac_core0.by_clock = by_clock;
defparam mac_core0.coef_sel_a_clock = coef_sel_a_clock;
defparam mac_core0.coef_sel_b_clock = coef_sel_b_clock;
defparam mac_core0.sub_clock = sub_clock;
defparam mac_core0.negate_clock = negate_clock;
defparam mac_core0.accumulate_clock = accumulate_clock;
defparam mac_core0.load_const_clock = load_const_clock;
defparam mac_core0.complex_clock = complex_clock;
defparam mac_core0.output_clock = output_clock;
endmodule