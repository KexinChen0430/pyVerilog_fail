module counterselect (
	data0x,
	data1x,
	data2x,
	data3x,
	sel,
	result);
	input	[20:0]  data0x;
	input	[20:0]  data1x;
	input	[20:0]  data2x;
	input	[20:0]  data3x;
	input	[1:0]  sel;
	output	[20:0]  result;
	wire [20:0] sub_wire5;
	wire [20:0] sub_wire4 = data3x[20:0];
	wire [20:0] sub_wire3 = data2x[20:0];
	wire [20:0] sub_wire2 = data1x[20:0];
	wire [20:0] sub_wire0 = data0x[20:0];
	wire [83:0] sub_wire1 = {sub_wire4, sub_wire3, sub_wire2, sub_wire0};
	wire [20:0] result = sub_wire5[20:0];
	lpm_mux	LPM_MUX_component (
				.data (sub_wire1),
				.sel (sel),
				.result (sub_wire5)
				// synopsys translate_off
				,
				.aclr (),
				.clken (),
				.clock ()
				// synopsys translate_on
				);
	defparam
		LPM_MUX_component.lpm_size = 4,
		LPM_MUX_component.lpm_type = "LPM_MUX",
		LPM_MUX_component.lpm_width = 21,
		LPM_MUX_component.lpm_widths = 2;
endmodule