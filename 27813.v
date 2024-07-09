module mul (
	clock,
	dataa,
	datab,
	result);
	input	  clock;
	input	[9:0]  dataa;
	input	[17:0]  datab;
	output	[9:0]  result;
	wire [9:0] sub_wire0;
	wire [9:0] result = sub_wire0[9:0];
	lpm_mult	lpm_mult_component (
				.clock (clock),
				.dataa (dataa),
				.datab (datab),
				.result (sub_wire0),
				.aclr (1'b0),
				.clken (1'b1),
				.sum (1'b0));
	defparam
		lpm_mult_component.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
		lpm_mult_component.lpm_pipeline = 3,
		lpm_mult_component.lpm_representation = "SIGNED",
		lpm_mult_component.lpm_type = "LPM_MULT",
		lpm_mult_component.lpm_widtha = 10,
		lpm_mult_component.lpm_widthb = 18,
		lpm_mult_component.lpm_widthp = 10;
endmodule