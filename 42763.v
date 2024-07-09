module squarer (
	dataa,
	result);
	input	[39:0]  dataa;
	output	[79:0]  result;
	wire [79:0] sub_wire0;
	wire [79:0] result = sub_wire0[79:0];
	altsquare	altsquare_component (
				.data (dataa),
				.result (sub_wire0),
				.aclr (1'b0),
				.clock (1'b1),
				.ena (1'b1));
	defparam
		altsquare_component.data_width = 40,
		altsquare_component.lpm_type = "ALTSQUARE",
		altsquare_component.pipeline = 0,
		altsquare_component.representation = "SIGNED",
		altsquare_component.result_width = 80;
endmodule