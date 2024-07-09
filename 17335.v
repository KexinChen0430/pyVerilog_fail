module add (
	clock,
	dataa,
	datab,
	result);
	input	  clock;
	input	[8:0]  dataa;
	input	[8:0]  datab;
	output	[8:0]  result;
	wire [8:0] sub_wire0;
	wire [8:0] result = sub_wire0[8:0];
	lpm_add_sub	LPM_ADD_SUB_component (
				.clock (clock),
				.dataa (dataa),
				.datab (datab),
				.result (sub_wire0)
				// synopsys translate_off
				,
				.aclr (),
				.add_sub (),
				.cin (),
				.clken (),
				.cout (),
				.overflow ()
				// synopsys translate_on
				);
	defparam
		LPM_ADD_SUB_component.lpm_direction = "ADD",
		LPM_ADD_SUB_component.lpm_hint = "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
		LPM_ADD_SUB_component.lpm_pipeline = 1,
		LPM_ADD_SUB_component.lpm_representation = "SIGNED",
		LPM_ADD_SUB_component.lpm_type = "LPM_ADD_SUB",
		LPM_ADD_SUB_component.lpm_width = 9;
endmodule