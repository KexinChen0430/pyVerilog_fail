module SHIFTREGRAM (
	clken,
	clock,
	shiftin,
	shiftout,
	taps);
	input	  clken;
	input	  clock;
	input	[12:0]  shiftin;
	output	[12:0]  shiftout;
	output	[168:0]  taps;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clken;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [12:0] sub_wire0;
	wire [168:0] sub_wire1;
	wire [12:0] shiftout = sub_wire0[12:0];
	wire [168:0] taps = sub_wire1[168:0];
	altshift_taps	ALTSHIFT_TAPS_component (
				.clock (clock),
				.clken (clken),
				.shiftin (shiftin),
				.shiftout (sub_wire0),
				.taps (sub_wire1)
				// synopsys translate_off
				,
				.aclr ()
				// synopsys translate_on
				);
	defparam
		ALTSHIFT_TAPS_component.intended_device_family = "Cyclone II",
		ALTSHIFT_TAPS_component.lpm_hint = "RAM_BLOCK_TYPE=M4K",
		ALTSHIFT_TAPS_component.lpm_type = "altshift_taps",
		ALTSHIFT_TAPS_component.number_of_taps = 13,
		ALTSHIFT_TAPS_component.tap_distance = 5,
		ALTSHIFT_TAPS_component.width = 13;
endmodule