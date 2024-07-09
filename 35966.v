module divider (
	clock,
	denom,
	numer,
	quotient,
	remain);
	input	  clock;
	input	[4:0]  denom;
	input	[10:0]  numer;
	output	[10:0]  quotient;
	output	[4:0]  remain;
	wire [4:0] sub_wire0;
	wire [10:0] sub_wire1;
	wire [4:0] remain = sub_wire0[4:0];
	wire [10:0] quotient = sub_wire1[10:0];
	lpm_divide	LPM_DIVIDE_component (
				.clock (clock),
				.denom (denom),
				.numer (numer),
				.remain (sub_wire0),
				.quotient (sub_wire1),
				.aclr (1'b0),
				.clken (1'b1));
	defparam
		LPM_DIVIDE_component.lpm_drepresentation = "UNSIGNED",
		LPM_DIVIDE_component.lpm_hint = "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=FALSE",
		LPM_DIVIDE_component.lpm_nrepresentation = "SIGNED",
		LPM_DIVIDE_component.lpm_pipeline = 1,
		LPM_DIVIDE_component.lpm_type = "LPM_DIVIDE",
		LPM_DIVIDE_component.lpm_widthd = 5,
		LPM_DIVIDE_component.lpm_widthn = 11;
endmodule