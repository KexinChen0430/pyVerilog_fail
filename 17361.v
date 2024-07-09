module Line_Buffer (
	clken,
	clock,
	shiftin,
	shiftout,
	taps0x,
	taps1x);
	input	  clken;
	input	  clock;
	input	[11:0]  shiftin;
	output	[11:0]  shiftout;
	output	[11:0]  taps0x;
	output	[11:0]  taps1x;
	wire [23:0] sub_wire0;
	wire [11:0] sub_wire3;
	wire [23:12] sub_wire1 = sub_wire0[23:12];
	wire [11:0] sub_wire2 = sub_wire0[11:0];
	wire [11:0] taps1x = sub_wire1[23:12];
	wire [11:0] taps0x = sub_wire2[11:0];
	wire [11:0] shiftout = sub_wire3[11:0];
	altshift_taps	altshift_taps_component (
				.clken (clken),
				.clock (clock),
				.shiftin (shiftin),
				.taps (sub_wire0),
				.shiftout (sub_wire3));
	defparam
		altshift_taps_component.lpm_type = "altshift_taps",
		altshift_taps_component.number_of_taps = 2,
		altshift_taps_component.tap_distance = 1280,
		altshift_taps_component.width = 12;
endmodule