module  mgp3p
	(
	aclr,
	clken,
	clock,
	denom,
	numer,
	quotient,
	remain) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clken;
	input   clock;
	input   [24:0]  denom;
	input   [63:0]  numer;
	output   [63:0]  quotient;
	output   [24:0]  remain;
	wire  [63:0]   wire_mgl_prim1_quotient;
	wire  [24:0]   wire_mgl_prim1_remain;
	lpm_divide   mgl_prim1
	(
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.denom(denom),
	.numer(numer),
	.quotient(wire_mgl_prim1_quotient),
	.remain(wire_mgl_prim1_remain));
	defparam
		mgl_prim1.lpm_drepresentation = "UNSIGNED",
		mgl_prim1.lpm_nrepresentation = "UNSIGNED",
		mgl_prim1.lpm_pipeline = 5,
		mgl_prim1.lpm_type = "LPM_DIVIDE",
		mgl_prim1.lpm_widthd = 25,
		mgl_prim1.lpm_widthn = 64,
		mgl_prim1.lpm_hint = "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE";
	assign
		quotient = wire_mgl_prim1_quotient,
		remain = wire_mgl_prim1_remain;
endmodule