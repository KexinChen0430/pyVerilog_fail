module cpu #(parameter d_width = 32, reg_ct = 32,
		op_width = 3, ra_width = $clog2(reg_ct),
		ins_width = op_width + ra_width + ra_width + ra_width)
	(	input [ins_width-1:0]ins,
		input clk
	);
	localparam opc_end = ins_width - op_width;
	localparam ar_d_end = opc_end - ra_width;
	localparam ar1_end = ar_d_end - ra_width;
	localparam ar2_end = ar1_end - ra_width; /* must be zero */
	wire [op_width-1:0] alu_op;
	wire [op_width-1:0] opcode = ins[ins_width-1:opc_end];
	wire s_alu, shift_dir;
	wire [ra_width-1:0]
		ar1 = ins[ar_d_end-1:ar1_end],
		ar2 = ins[ar1_end-1:ar2_end],
		ar_dest = ins[opc_end-1:ar_d_end];
	wire [d_width-1:0] r1, r2;
	wire [d_width-1:0] shift_res, alu_res;
	wire [d_width-1:0] result;
	mux_out #(.d_width(d_width))
		muxo (.out(result), .a(alu_res), .b(shift_res), .sel(s_alu));
	control #(.ra_width(ra_width), .d_width(d_width), .reg_ct(reg_ct),
			.op_width(op_width))
		ctrl(.alu_op(alu_op), .select_alu(s_alu), .opcode(opcode),
			.shift_dir(shift_dir), .clk(clk));
	shifter #(.ra_width(ra_width), .d_width(d_width))
		sh(.res(shift_res), .rin(r1), .shift(ar2), .dir(shift_dir));
	alu #(.op_width(op_width), .d_width(d_width))
		alui(.res(alu_res), .ra(r1), .rb(r2), .aop(alu_op));
	reg_file #(.ra_width(ra_width), .d_width(d_width), .reg_ct(reg_ct))
		regs(.ra(r1), .rb(r2), .rd(result), .addr_a(ar1),
			.addr_b(ar2), .addr_d(ar_dest), .clk(clk));
endmodule