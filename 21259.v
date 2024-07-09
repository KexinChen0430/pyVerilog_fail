module shiftreg_data (
	aclr,
	clken,
	clock,
	shiftin,
	shiftout,
	taps);
	input	  aclr;
	input	  clken;
	input	  clock;
	input	[63:0]  shiftin;
	output	[63:0]  shiftout;
	output	[63:0]  taps;
	wire [63:0] sub_wire0;
	wire [63:0] sub_wire1;
	wire [63:0] taps = sub_wire0[63:0];
	wire [63:0] shiftout = sub_wire1[63:0];
	altshift_taps	altshift_taps_component (
				.clken (clken),
				.aclr (aclr),
				.clock (clock),
				.shiftin (shiftin),
				.taps (sub_wire0),
				.shiftout (sub_wire1));
	defparam
		altshift_taps_component.lpm_hint = "RAM_BLOCK_TYPE=M512",
		altshift_taps_component.lpm_type = "altshift_taps",
		altshift_taps_component.number_of_taps = 1,
		altshift_taps_component.tap_distance = 7,
		altshift_taps_component.width = 64;
endmodule