module scorecopymux (
	data0x,
	data1x,
	data2x,
	data3x,
	sel,
	result);
	input	[3:0]  data0x;
	input	[3:0]  data1x;
	input	[3:0]  data2x;
	input	[3:0]  data3x;
	input	[1:0]  sel;
	output	[3:0]  result;
	wire [3:0] sub_wire0;
	wire [3:0] sub_wire5 = data3x[3:0];
	wire [3:0] sub_wire4 = data1x[3:0];
	wire [3:0] sub_wire3 = data0x[3:0];
	wire [3:0] result = sub_wire0[3:0];
	wire [3:0] sub_wire1 = data2x[3:0];
	wire [15:0] sub_wire2 = {sub_wire5, sub_wire1, sub_wire4, sub_wire3};
	lpm_mux	lpm_mux_component (
				.sel (sel),
				.data (sub_wire2),
				.result (sub_wire0)
				// synopsys translate_off
				,
				.clock (),
				.clken (),
				.aclr ()
				// synopsys translate_on
				);
	defparam
		lpm_mux_component.lpm_size = 4,
		lpm_mux_component.lpm_type = "LPM_MUX",
		lpm_mux_component.lpm_width = 4,
		lpm_mux_component.lpm_widths = 2;
endmodule