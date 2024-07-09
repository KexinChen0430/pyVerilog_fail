module LPM_ADD (
	cin,
	dataa,
	datab,
	cout,
	overflow,
	result);
	input	  cin;
	input	[15:0]  dataa;
	input	[15:0]  datab;
	output	  cout;
	output	  overflow;
	output	[15:0]  result;
	wire  sub_wire0;
	wire  sub_wire1;
	wire [15:0] sub_wire2;
	wire  overflow = sub_wire0;
	wire  cout = sub_wire1;
	wire [15:0] result = sub_wire2[15:0];
	lpm_add_sub	LPM_ADD_SUB_component (
				.cin (cin),
				.datab (datab),
				.dataa (dataa),
				.overflow (sub_wire0),
				.cout (sub_wire1),
				.result (sub_wire2)
				// synopsys translate_off
				,
				.aclr (),
				.add_sub (),
				.clken (),
				.clock ()
				// synopsys translate_on
				);
	defparam
		LPM_ADD_SUB_component.lpm_direction = "ADD",
		LPM_ADD_SUB_component.lpm_hint = "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=YES",
		LPM_ADD_SUB_component.lpm_representation = "SIGNED",
		LPM_ADD_SUB_component.lpm_type = "LPM_ADD_SUB",
		LPM_ADD_SUB_component.lpm_width = 16;
endmodule