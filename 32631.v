module datapath(
		/* regular inputs */
		input wire		[ 7 : 0]		immediate,		/* instruction predicate */
		input wire		[ 7 : 0]		mdr_in,			/* memory data register input */
		/* toplevel signals */
		input wire						clk,			/* clock signal */
		input wire						res,			/* reset signal */
		/* control signals */
		input wire		[ 1 : 0]		ac_source,		/* accumulator source */
		input wire						write_ac,		/* write accumulator */
		input wire						mar_source,		/* memory address register source */
		input wire						write_mar,		/* write memory address register */
		input wire		[ 1 : 0]		mdr_source,		/* memory data register source */
		input wire						write_mdr,		/* write memory data register */
		input wire						write_flags,	/* write flags register */
		input wire		[ 1 : 0]		pc_source,		/* program counter source */
		input wire						write_pc,		/* write program counter */
		input wire		[ 2 : 0]		ALU_op_select,	/* ALU operand source */
		input wire		[`ALUCTLW - 1: 0]	ALUctl,		/* ALU control signal bus */
		/* output signals */
		output wire		[ 7 : 0]			mar_out,	/* memory address */
		output wire		[ 7 : 0]			mdr_out,	/* data */
		output wire		[ 7 : 0]			pc_out,		/* program counter */
		output wire		[`FWIDTH - 1 : 0]	flags		/* ALU flags */
    );
	/* internal signals */
	wire [ 7 : 0] ALU_feedback,						/* ALU output and feedback path */
			pc_next,								/* next program counter */
			ac_out,									/* accumulator data output */
			ac_in,									/* accumulator data input */
			alu_operand,							/* second ALU operand */
			mar_data,								/* memory address register data source */
			mdr_data;								/* memory data register data source */
	wire [`FWIDTH - 1 : 0] flags_out;				/* flags */
	/* program counter jump select
	 */
	mux4 #(.WIDTH(8)) pc_mux (
			.in0(pc_out + 8'b1),
			.in1(immediate),
			.in2(ac_out),
			.in3(pc_out + ac_out),
			.sel(pc_source),
			.mux_out(pc_next)
		);
	/* program counter register */
	ff_d #(.WIDTH(8)) pc (
			.D(pc_next),
			.en(write_pc),
			.clk(clk),
			.res(res),
			.Q(pc_out)
		);
	/* flags register
	 */
	ff_d #(.WIDTH(`FWIDTH)) flags_register (
			.D(flags_out),
			.en(write_flags),
			.clk(clk),
			.res(res),
			.Q(flags)
		);
	/* accumulator input select:
	 */
	mux4 #(.WIDTH(8)) ac_mux (
			.in0(mar_out),
			.in1(mdr_out),
			.in2(ALU_feedback),
			.in3(immediate),
			.sel(ac_source),
			.mux_out(ac_in)
		);
	/* accumulator register */
	ff_d #(.WIDTH(8)) ac (
			.D(ac_in),
			.en(write_ac),
			.clk(clk),
			.res(res),
			.Q(ac_out)
		);
	/* memory address register data source select
	 */
	assign mar_data = mar_source ? immediate : ac_out;
	/* memory address register */
	ff_d #(.WIDTH(8)) mar (
			.D(mar_data),
			.en(write_mar),
			.clk(clk),
			.res(res),
			.Q(mar_out)
		);
	/* memory data register data source select
	 */
	mux4 #(.WIDTH(8)) mdr_mux (
			.in0(8'b0),
			.in1(mdr_in),
			.in2(immediate),
			.in3(ac_out),
			.sel(mdr_source),
			.mux_out(mdr_data)
		);
	/* memory data register */
	ff_d #(.WIDTH(8)) mdr (
			.D(mdr_data),
			.en(write_mdr),
			.clk(clk),
			.res(res),
			.Q(mdr_out)
		);
	/* ALU operand source select
	 */
	mux8 #(.WIDTH(8)) ALU_op_mux (
			.in0(8'b0),
			.in1(8'b01),
			.in2(8'b10),
			.in3(8'hff),
			.in4(8'hfe),
			.in5(ac_out),
			.in6(immediate),
			.in7(mdr_out),
			.sel(ALU_op_select),
			.mux_out(alu_operand)
		);
	/* ALU */
	ALU alu0 (
			.op1(ac_out),
			.op2(alu_operand),
			.ctl(ALUctl),
			.flags_in(flags),
			.result(ALU_feedback),
			.flags_out(flags_out)
		);
endmodule