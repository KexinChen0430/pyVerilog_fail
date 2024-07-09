module ADDSUBWIDE (
	add_sub,
	dataa,
	datab,
	result);
	input	  add_sub;
	input	[25:0]  dataa;
	input	[25:0]  datab;
	output	[25:0]  result;
	wire [25:0] sub_wire0;
	wire [25:0] result = sub_wire0[25:0];
	lpm_add_sub	LPM_ADD_SUB_component (
				.add_sub (add_sub),
				.dataa (dataa),
				.datab (datab),
				.result (sub_wire0)
				// synopsys translate_off
				,
				.aclr (),
				.cin (),
				.clken (),
				.clock (),
				.cout (),
				.overflow ()
				// synopsys translate_on
				);
	defparam
		LPM_ADD_SUB_component.lpm_direction = "UNUSED",
		LPM_ADD_SUB_component.lpm_hint = "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
		LPM_ADD_SUB_component.lpm_representation = "SIGNED",
		LPM_ADD_SUB_component.lpm_type = "LPM_ADD_SUB",
		LPM_ADD_SUB_component.lpm_width = 26;
endmodule