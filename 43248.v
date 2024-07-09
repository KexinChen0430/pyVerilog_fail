module RAM16_s36_s36_altera (
	aclr_a,
	aclr_b,
	address_a,
	address_b,
	clock_a,
	clock_b,
	data_a,
	data_b,
	wren_a,
	wren_b,
	q_a,
	q_b)/* synthesis synthesis_clearbox = 1 */;
	input	  aclr_a;
	input	  aclr_b;
	input	[8:0]  address_a;
	input	[8:0]  address_b;
	input	  clock_a;
	input	  clock_b;
	input	[31:0]  data_a;
	input	[31:0]  data_b;
	input	  wren_a;
	input	  wren_b;
	output	[31:0]  q_a;
	output	[31:0]  q_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr_a;
	tri0	  aclr_b;
	tri1	  wren_a;
	tri1	  wren_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [31:0] sub_wire0;
	wire [31:0] sub_wire1;
	wire [31:0] q_a = sub_wire0[31:0];
	wire [31:0] q_b = sub_wire1[31:0];
	RAM16_s36_s36_altera_altsyncram	RAM16_s36_s36_altera_altsyncram_component (
				.wren_a (wren_a),
				.aclr0 (aclr_a),
				.clock0 (clock_a),
				.wren_b (wren_b),
				.aclr1 (aclr_b),
				.clock1 (clock_b),
				.address_a (address_a),
				.address_b (address_b),
				.data_a (data_a),
				.data_b (data_b),
				.q_a (sub_wire0),
				.q_b (sub_wire1));
endmodule