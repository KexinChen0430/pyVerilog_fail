module xgmii_mux (
	clock,
	data0x,
	data1x,
	data2x,
	data3x,
	sel,
	result);
	input	  clock;
	input	[65:0]  data0x;
	input	[65:0]  data1x;
	input	[65:0]  data2x;
	input	[65:0]  data3x;
	input	[1:0]  sel;
	output	[65:0]  result;
	wire [65:0] sub_wire0;
	wire [65:0] sub_wire5 = data3x[65:0];
	wire [65:0] sub_wire4 = data2x[65:0];
	wire [65:0] sub_wire3 = data1x[65:0];
	wire [65:0] result = sub_wire0[65:0];
	wire [65:0] sub_wire1 = data0x[65:0];
	wire [263:0] sub_wire2 = {sub_wire5, sub_wire4, sub_wire3, sub_wire1};
	lpm_mux	LPM_MUX_component (
				.clock (clock),
				.data (sub_wire2),
				.sel (sel),
				.result (sub_wire0)
				// synopsys translate_off
				,
				.aclr (),
				.clken ()
				// synopsys translate_on
				);
	defparam
		LPM_MUX_component.lpm_pipeline = 1,
		LPM_MUX_component.lpm_size = 4,
		LPM_MUX_component.lpm_type = "LPM_MUX",
		LPM_MUX_component.lpm_width = 66,
		LPM_MUX_component.lpm_widths = 2;
endmodule