module sv_mult27 (
	clock0,
        ena0,
	dataa_0,
	datab_0,
	result);
  parameter REPRESENTATION = "UNSIGNED";
	input	  clock0;
        input     ena0;
	input	[26:0]  dataa_0;
	input	[26:0]  datab_0;
	output	[53:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock0;
	tri0	[26:0]  dataa_0;
	tri0	[26:0]  datab_0;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [53:0] sub_wire0;
	wire [53:0] result = sub_wire0[53:0];
	sv_mult27_mult_add_cfq3	sv_mult27_mult_add_cfq3_component (
				.clock0 (clock0),
        .ena0(ena0),
				.dataa (dataa_0),
				.datab (datab_0),
				.result (sub_wire0));
    defparam sv_mult27_mult_add_cfq3_component.REPRESENTATION = REPRESENTATION;
endmodule