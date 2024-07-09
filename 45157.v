module lpm_mult_4_hybr_ref_pre (
	clock,
	dataa,
	datab,
	result);
	input	  clock;
	input	[7:0]  dataa;
	input	[4:0]  datab;
	output	[8:0]  result;
	wire [8:0] sub_wire0;
	wire [8:0] result = sub_wire0[8:0];
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
		lpm_mult_component.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=9",
		lpm_mult_component.lpm_pipeline = 1,
		lpm_mult_component.lpm_representation = "UNSIGNED",
		lpm_mult_component.lpm_type = "LPM_MULT",
		lpm_mult_component.lpm_widtha = 8,
		lpm_mult_component.lpm_widthb = 5,
		lpm_mult_component.lpm_widthp = 9;
endmodule