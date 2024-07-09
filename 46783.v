module syndrome_expand_method1 #(
	parameter [`BCH_PARAM_SZ-1:0] P = `BCH_SANE
) (
	input [`BCH_M(P)-1:0] in,
	output [`BCH_M(P)-1:0] out
);
	localparam M = `BCH_M(P);
	assign out = in;
endmodule