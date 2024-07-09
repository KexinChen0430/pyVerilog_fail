module counter_bus_mux (
	data0x,
	data1x,
	sel,
	result);
	input	[3:0]  data0x;
	input	[3:0]  data1x;
	input	  sel;
	output	[3:0]  result;
	wire [3:0] sub_wire5;
	wire [3:0] sub_wire2 = data1x[3:0];
	wire [3:0] sub_wire0 = data0x[3:0];
	wire [7:0] sub_wire1 = {sub_wire2, sub_wire0};
	wire  sub_wire3 = sel;
	wire  sub_wire4 = sub_wire3;
	wire [3:0] result = sub_wire5[3:0];
	lpm_mux	LPM_MUX_component (
				.data (sub_wire1),
				.sel (sub_wire4),
				.result (sub_wire5)
				// synopsys translate_off
				,
				.aclr (),
				.clken (),
				.clock ()
				// synopsys translate_on
				);
	defparam
		LPM_MUX_component.lpm_size = 2,
		LPM_MUX_component.lpm_type = "LPM_MUX",
		LPM_MUX_component.lpm_width = 4,
		LPM_MUX_component.lpm_widths = 1;
endmodule