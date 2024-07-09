module MULT (
	dataa,
	result);
	input	[12:0]  dataa;
	output	[25:0]  result;
	wire [25:0] sub_wire0;
	wire [25:0] result = sub_wire0[25:0];
	altsquare	altsquare_component (
				.data (dataa),
				.result (sub_wire0),
				.aclr (1'b0),
				.clock (1'b1),
				.ena (1'b1));
	defparam
		altsquare_component.data_width = 13,
		altsquare_component.lpm_type = "ALTSQUARE",
		altsquare_component.pipeline = 0,
		altsquare_component.representation = "SIGNED",
		altsquare_component.result_width = 26;
endmodule