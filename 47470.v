module chan_mux (
	data0x,
	data1x,
	data2x,
	sel,
	result);
	input	[21:0]  data0x;
	input	[21:0]  data1x;
	input	[21:0]  data2x;
	input	[1:0]  sel;
	output	[21:0]  result;
	wire [21:0] sub_wire0;
	wire [21:0] sub_wire4 = data2x[21:0];
	wire [21:0] sub_wire3 = data1x[21:0];
	wire [21:0] result = sub_wire0[21:0];
	wire [21:0] sub_wire1 = data0x[21:0];
	wire [65:0] sub_wire2 = {sub_wire4, sub_wire3, sub_wire1};
	lpm_mux	LPM_MUX_component (
				.data (sub_wire2),
				.sel (sel),
				.result (sub_wire0)
				// synopsys translate_off
				,
				.aclr (),
				.clken (),
				.clock ()
				// synopsys translate_on
				);
	defparam
		LPM_MUX_component.lpm_size = 3,
		LPM_MUX_component.lpm_type = "LPM_MUX",
		LPM_MUX_component.lpm_width = 22,
		LPM_MUX_component.lpm_widths = 2;
endmodule