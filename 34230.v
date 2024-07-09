module xgmii_loopback (
	data0x,
	data1x,
	sel,
	result);
	input	[65:0]  data0x;
	input	[65:0]  data1x;
	input	  sel;
	output	[65:0]  result;
	wire [65:0] sub_wire0;
	wire [65:0] sub_wire3 = data1x[65:0];
	wire [65:0] result = sub_wire0[65:0];
	wire [65:0] sub_wire1 = data0x[65:0];
	wire [131:0] sub_wire2 = {sub_wire3, sub_wire1};
	wire  sub_wire4 = sel;
	wire  sub_wire5 = sub_wire4;
	lpm_mux	LPM_MUX_component (
				.data (sub_wire2),
				.sel (sub_wire5),
				.result (sub_wire0)
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
		LPM_MUX_component.lpm_width = 66,
		LPM_MUX_component.lpm_widths = 1;
endmodule