module shift16 (
	data,
	direction,
	distance,
	result);
	input	[31:0]  data;
	input	  direction;
	input	[3:0]  distance;
	output	[31:0]  result;
	wire [31:0] sub_wire0;
	wire [31:0] result = sub_wire0[31:0];
	lpm_clshift	LPM_CLSHIFT_component (
				.data (data),
				.direction (direction),
				.distance (distance),
				.result (sub_wire0)
				// synopsys translate_off
				,
				.aclr (),
				.clken (),
				.clock (),
				.overflow (),
				.underflow ()
				// synopsys translate_on
				);
	defparam
		LPM_CLSHIFT_component.lpm_shifttype = "LOGICAL",
		LPM_CLSHIFT_component.lpm_type = "LPM_CLSHIFT",
		LPM_CLSHIFT_component.lpm_width = 32,
		LPM_CLSHIFT_component.lpm_widthdist = 4;
endmodule