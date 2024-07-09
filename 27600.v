module frac_rom (
	address,
	clock,
	q)/* synthesis synthesis_clearbox = 1 */;
	input	[3:0]  address;
	input	  clock;
	output	[7:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [7:0] sub_wire0;
	wire [7:0] q = sub_wire0[7:0];
	frac_rom_altsyncram	frac_rom_altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0));
endmodule