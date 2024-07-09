module alu(
	input p16_,
	input [0:15] a,
	input [0:15] ac,
	input saryt,
	input sd, sb,
	input scb, sab,
	input sca, saa,
	output [0:15] f,
	output j$,
	output carry,
	output zsum
);
	wor __NC;
	wire [3:0] g, p;
	wire [3:1] c_;
	wire [3:0] j$1;
	// most significant
	wire carry_;
	alu181 ALU_0_3(
		.a(a[0:3]),
		.b(ac[0:3]),
		.m(~saryt),
		.c_(c_[3]),
		.s({~sd, ~scb, ~sb, ~sab}),
		.f(f[0:3]),
		.g(g[3]),
		.p(p[3]),
		.co_(carry_),
		.eq(j$1[3])
	);
	alu181 ALU_4_7(
		.a(a[4:7]),
		.b(ac[4:7]),
		.m(~saryt),
		.c_(c_[2]),
		.s({~sd, ~scb, ~sb, ~sab}),
		.f(f[4:7]),
		.p(p[2]),
		.g(g[2]),
		.co_(__NC),
		.eq(j$1[2])
	);
	alu181 ALU_8_11(
		.a(a[8:11]),
		.b(ac[8:11]),
		.m(~saryt),
		.c_(c_[1]),
		.s({~sd, ~sca, ~sb, ~saa}),
		.f(f[8:11]),
		.p(p[1]),
		.g(g[1]),
		.co_(__NC),
		.eq(j$1[1])
	);
	// least significant
	alu181 ALU_12_15(
		.a(a[12:15]),
		.b(ac[12:15]),
		.m(~saryt),
		.c_(p16_),
		.s({~sd, ~sca, ~sb, ~saa}),
		.f(f[12:15]),
		.p(p[0]),
		.g(g[0]),
		.co_(__NC),
		.eq(j$1[0])
	);
	carry182 CARRY(
		.g(g),
		.p(p),
		.c_(p16_),
		.c1_(c_[1]),
		.c2_(c_[2]),
		.c3_(c_[3]),
		.op(__NC),
		.og(__NC)
	);
	assign carry = ~carry_;
	assign zsum = ~|f;
	assign j$ = &j$1;
endmodule