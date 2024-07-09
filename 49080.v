module RAM4096x64_2RW (
	address_a,
	address_b,
	byteena_a,
	byteena_b,
	clock,
	data_a,
	data_b,
	wren_a,
	wren_b,
	q_a,
	q_b);
	input	[11:0]  address_a;
	input	[11:0]  address_b;
	input	[7:0]  byteena_a;
	input	[7:0]  byteena_b;
	input	  clock;
	input	[63:0]  data_a;
	input	[63:0]  data_b;
	input	  wren_a;
	input	  wren_b;
	output	[63:0]  q_a;
	output	[63:0]  q_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	[7:0]  byteena_a;
	tri1	[7:0]  byteena_b;
	tri1	  clock;
	tri0	  wren_a;
	tri0	  wren_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule