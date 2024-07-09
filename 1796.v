module lpm_ff_v1 (
	clock,
	data,
	q);
	input	  clock;
	input	[63:0]  data;
	output	[63:0]  q;
	wire [63:0] sub_wire0;
	wire [63:0] q = sub_wire0[63:0];
	lpm_ff	lpm_ff_component (
				.clock (clock),
				.data (data),
				.q (sub_wire0)
				// synopsys translate_off
				,
				.aclr (),
				.aload (),
				.aset (),
				.enable (),
				.sclr (),
				.sload (),
				.sset ()
				// synopsys translate_on
				);
	defparam
		lpm_ff_component.lpm_fftype = "DFF",
		lpm_ff_component.lpm_type = "LPM_FF",
		lpm_ff_component.lpm_width = 64;
endmodule