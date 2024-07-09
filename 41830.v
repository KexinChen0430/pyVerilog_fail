module mult_21 (
	clken,
	clock,
	dataa,
	datab,
	result);
	input	  clken;
	input	  clock;
	input	[20:0]  dataa;
	input	[20:0]  datab;
	output	[41:0]  result;
	wire [41:0] sub_wire0;
	wire [41:0] result = sub_wire0[41:0];
	lpm_mult	lpm_mult_component (
				.clock (clock),
				.datab (datab),
				.clken (clken),
				.dataa (dataa),
				.result (sub_wire0),
				.aclr (1'b0),
				.sum (1'b0));
	defparam
		lpm_mult_component.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=1",
		lpm_mult_component.lpm_pipeline = 3,
		lpm_mult_component.lpm_representation = "SIGNED",
		lpm_mult_component.lpm_type = "LPM_MULT",
		lpm_mult_component.lpm_widtha = 21,
		lpm_mult_component.lpm_widthb = 21,
		lpm_mult_component.lpm_widthp = 42;
endmodule