module gsu_mult (
	dataa,
	datab,
	result);
	input	[7:0]  dataa;
	input	[7:0]  datab;
	output	[15:0]  result;
	wire [15:0] sub_wire0;
	wire [15:0] result = sub_wire0[15:0];
	lpm_mult	lpm_mult_component (
				.dataa (dataa),
				.datab (datab),
				.result (sub_wire0),
				.aclr (1'b0),
				.clken (1'b1),
				.clock (1'b0),
				.sclr (1'b0),
				.sum (1'b0));
	defparam
		lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=5",
		lpm_mult_component.lpm_representation = "SIGNED",
		lpm_mult_component.lpm_type = "LPM_MULT",
		lpm_mult_component.lpm_widtha = 8,
		lpm_mult_component.lpm_widthb = 8,
		lpm_mult_component.lpm_widthp = 16;
endmodule