module sqrt_43 (
	clk,
	ena,
	radical,
	q,
	remainder);
	input	  clk;
	input	  ena;
	input	[42:0]  radical;
	output	[21:0]  q;
	output	[22:0]  remainder;
	wire [21:0] sub_wire0;
	wire [22:0] sub_wire1;
	wire [21:0] q = sub_wire0[21:0];
	wire [22:0] remainder = sub_wire1[22:0];
	altsqrt	ALTSQRT_component (
				.clk (clk),
				.ena (ena),
				.radical (radical),
				.q (sub_wire0),
				.remainder (sub_wire1)
				// synopsys translate_off
				,
				.aclr ()
				// synopsys translate_on
				);
	defparam
		ALTSQRT_component.pipeline = 5,
		ALTSQRT_component.q_port_width = 22,
		ALTSQRT_component.r_port_width = 23,
		ALTSQRT_component.width = 43;
endmodule