module MULT (
	dataa,
	datab,
	result);
	input	[16:0]  dataa;
	input	[16:0]  datab;
	output	[33:0]  result;
	wire [33:0] sub_wire0;
	wire [33:0] result = sub_wire0[33:0];
	lpm_mult	lpm_mult_component (
				.dataa (dataa),
				.datab (datab),
				.result (sub_wire0),
				.aclr (1'b0),
				.clken (1'b1),
				.clock (1'b0),
				.sum (1'b0));
	defparam
		lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=5",
		lpm_mult_component.lpm_representation = "SIGNED",
		lpm_mult_component.lpm_type = "LPM_MULT",
		lpm_mult_component.lpm_widtha = 17,
		lpm_mult_component.lpm_widthb = 17,
		lpm_mult_component.lpm_widthp = 34;
endmodule