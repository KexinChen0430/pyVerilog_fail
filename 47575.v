module  mgc6m
	(
	denom,
	numer,
	quotient,
	remain) /* synthesis synthesis_clearbox=1 */;
	input   [31:0]  denom;
	input   [63:0]  numer;
	output   [63:0]  quotient;
	output   [31:0]  remain;
	wire  [63:0]   wire_mgl_prim1_quotient;
	wire  [31:0]   wire_mgl_prim1_remain;
	lpm_divide   mgl_prim1
	(
	.denom(denom),
	.numer(numer),
	.quotient(wire_mgl_prim1_quotient),
	.remain(wire_mgl_prim1_remain));
	defparam
		mgl_prim1.lpm_drepresentation = "UNSIGNED",
		mgl_prim1.lpm_nrepresentation = "UNSIGNED",
		mgl_prim1.lpm_type = "LPM_DIVIDE",
		mgl_prim1.lpm_widthd = 32,
		mgl_prim1.lpm_widthn = 64,
		mgl_prim1.lpm_hint = "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE";
	assign
		quotient = wire_mgl_prim1_quotient,
		remain = wire_mgl_prim1_remain;
endmodule