module tes_pll (
	areset,
	inclk0,
	c0,
	c1,
	c2,
	c3,
	c4)/* synthesis synthesis_clearbox = 1 */;
	input	  areset;
	input	  inclk0;
	output	  c0;
	output	  c1;
	output	  c2;
	output	  c3;
	output	  c4;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  areset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [4:0] sub_wire0;
	wire [0:0] sub_wire8 = 1'h0;
	wire [4:4] sub_wire5 = sub_wire0[4:4];
	wire [3:3] sub_wire4 = sub_wire0[3:3];
	wire [2:2] sub_wire3 = sub_wire0[2:2];
	wire [1:1] sub_wire2 = sub_wire0[1:1];
	wire [0:0] sub_wire1 = sub_wire0[0:0];
	wire  c0 = sub_wire1;
	wire  c1 = sub_wire2;
	wire  c2 = sub_wire3;
	wire  c3 = sub_wire4;
	wire  c4 = sub_wire5;
	wire  sub_wire6 = inclk0;
	wire [1:0] sub_wire7 = {sub_wire8, sub_wire6};
	tes_pll_altpll	tes_pll_altpll_component (
				.areset (areset),
				.inclk (sub_wire7),
				.clk (sub_wire0));
endmodule