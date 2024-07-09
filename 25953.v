module DIV (
	aclr,
	clock,
	denom,
	numer,
	quotient,
	remain);
	input	  aclr;
	input	  clock;
	input	[3:0]  denom;
	input	[9:0]  numer;
	output	[9:0]  quotient;
	output	[3:0]  remain;
	wire [9:0] sub_wire0;
	wire [3:0] sub_wire1;
	wire [9:0] quotient = sub_wire0[9:0];
	wire [3:0] remain = sub_wire1[3:0];
	lpm_divide	lpm_divide_component (
				.denom (denom),
				.aclr (aclr),
				.clock (clock),
				.numer (numer),
				.quotient (sub_wire0),
				.remain (sub_wire1),
				.clken (1'b1));
	defparam
		lpm_divide_component.lpm_drepresentation = "UNSIGNED",
		lpm_divide_component.lpm_hint = "LPM_REMAINDERPOSITIVE=TRUE",
		lpm_divide_component.lpm_nrepresentation = "UNSIGNED",
		lpm_divide_component.lpm_pipeline = 1,
		lpm_divide_component.lpm_type = "LPM_DIVIDE",
		lpm_divide_component.lpm_widthd = 4,
		lpm_divide_component.lpm_widthn = 10;
endmodule