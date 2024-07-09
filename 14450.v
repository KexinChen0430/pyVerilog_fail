module cx4_mul (
	clock,
	dataa,
	datab,
	result);
	input	  clock;
	input	[23:0]  dataa;
	input	[23:0]  datab;
	output	[47:0]  result;
	wire [47:0] sub_wire0;
	wire [47:0] result = sub_wire0[47:0];
	lpm_mult	lpm_mult_component (
				.clock (clock),
				.dataa (dataa),
				.datab (datab),
				.result (sub_wire0),
				.aclr (1'b0),
				.clken (1'b1),
				.sclr (1'b0),
				.sum (1'b0));
	defparam
		lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=9",
		lpm_mult_component.lpm_pipeline = 2,
		lpm_mult_component.lpm_representation = "SIGNED",
		lpm_mult_component.lpm_type = "LPM_MULT",
		lpm_mult_component.lpm_widtha = 24,
		lpm_mult_component.lpm_widthb = 24,
		lpm_mult_component.lpm_widthp = 48;
endmodule