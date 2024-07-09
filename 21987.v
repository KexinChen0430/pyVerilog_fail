module  sin_altfp_sincos_cordic_start_709
	(
	index,
	value) ;
	input   [3:0]  index;
	output   [33:0]  value;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [3:0]  index;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [33:0]   wire_mux1_result;
	wire  [35:0]  valuenode_0_w;
	wire  [35:0]  valuenode_10_w;
	wire  [35:0]  valuenode_11_w;
	wire  [35:0]  valuenode_12_w;
	wire  [35:0]  valuenode_13_w;
	wire  [35:0]  valuenode_14_w;
	wire  [35:0]  valuenode_15_w;
	wire  [35:0]  valuenode_1_w;
	wire  [35:0]  valuenode_2_w;
	wire  [35:0]  valuenode_3_w;
	wire  [35:0]  valuenode_4_w;
	wire  [35:0]  valuenode_5_w;
	wire  [35:0]  valuenode_6_w;
	wire  [35:0]  valuenode_7_w;
	wire  [35:0]  valuenode_8_w;
	wire  [35:0]  valuenode_9_w;
	lpm_mux   mux1
	(
	.data({valuenode_15_w[35:2], valuenode_14_w[35:2], valuenode_13_w[35:2], valuenode_12_w[35:2], valuenode_11_w[35:2], valuenode_10_w[35:2], valuenode_9_w[35:2], valuenode_8_w[35:2], valuenode_7_w[35:2], valuenode_6_w[35:2], valuenode_5_w[35:2], valuenode_4_w[35:2], valuenode_3_w[35:2], valuenode_2_w[35:2], valuenode_1_w[35:2], valuenode_0_w[35:2]}),
	.result(wire_mux1_result),
	.sel(index)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mux1.lpm_size = 16,
		mux1.lpm_width = 34,
		mux1.lpm_widths = 4,
		mux1.lpm_type = "lpm_mux";
	assign
		value = wire_mux1_result,
		valuenode_0_w = 36'b001001101101110100111011011010100001,
		valuenode_10_w = 36'b001111111111111111111101010101010101,
		valuenode_11_w = 36'b001111111111111111111111010101010101,
		valuenode_12_w = 36'b001111111111111111111111111101010101,
		valuenode_13_w = 36'b001111111111111111111111110101010101,
		valuenode_14_w = 36'b001111111111111111111111111111110101,
		valuenode_15_w = 36'b001111111111111111111111111111010101,
		valuenode_1_w = 36'b001101101111011001010110110001011010,
		valuenode_2_w = 36'b001111010111001100011101111111111011,
		valuenode_3_w = 36'b001111110101011101000011101100100100,
		valuenode_4_w = 36'b001111111101010101110100100001100000,
		valuenode_5_w = 36'b001111111111010101010111010010011001,
		valuenode_6_w = 36'b001111111111110101010101011101001010,
		valuenode_7_w = 36'b001111111111111101010101010101110101,
		valuenode_8_w = 36'b001111111111111111010101010101010111,
		valuenode_9_w = 36'b001111111111111111110101010101010101;
endmodule