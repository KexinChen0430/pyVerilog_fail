module  mg90f
	(
	data,
	result) /* synthesis synthesis_clearbox=1 */;
	input   [63:0]  data;
	output   [10:0]  result;
	wire  [10:0]   wire_mgl_prim1_result;
	parallel_add   mgl_prim1
	(
	.data(data),
	.result(wire_mgl_prim1_result));
	defparam
		mgl_prim1.msw_subtract = "NO",
		mgl_prim1.pipeline = 0,
		mgl_prim1.representation = "UNSIGNED",
		mgl_prim1.result_alignment = "LSB",
		mgl_prim1.shift = 0,
		mgl_prim1.size = 8,
		mgl_prim1.width = 8,
		mgl_prim1.widthr = 11;
	assign
		result = wire_mgl_prim1_result;
endmodule