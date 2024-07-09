module mult_unit (
	dataa,
	datab,
	result);
	input	[35:0]  dataa;
	input	[35:0]  datab;
	output	[71:0]  result;
	wire [71:0] sub_wire0;
	wire [71:0] result = sub_wire0[71:0];
	lpm_mult	lpm_mult_component (
				.dataa (dataa),
				.datab (datab),
				.result (sub_wire0),
				.aclr (1'b0),
				.clken (1'b1),
				.clock (1'b0),
				.sum (1'b0));
	defparam
		lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=9",
		lpm_mult_component.lpm_representation = "UNSIGNED",
		lpm_mult_component.lpm_type = "LPM_MULT",
		lpm_mult_component.lpm_widtha = 36,
		lpm_mult_component.lpm_widthb = 36,
		lpm_mult_component.lpm_widthp = 72;
endmodule