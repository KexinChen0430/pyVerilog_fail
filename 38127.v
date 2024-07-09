module COUNTER (
	aclr,
	clock,
	cnt_en,
	q);
	input	  aclr;
	input	  clock;
	input	  cnt_en;
	output	[13:0]  q;
	wire [13:0] sub_wire0;
	wire [13:0] q = sub_wire0[13:0];
	lpm_counter	LPM_COUNTER_component (
				.aclr (aclr),
				.clock (clock),
				.cnt_en (cnt_en),
				.q (sub_wire0),
				.aload (1'b0),
				.aset (1'b0),
				.cin (1'b1),
				.clk_en (1'b1),
				.cout (),
				.data ({14{1'b0}}),
				.eq (),
				.sclr (1'b0),
				.sload (1'b0),
				.sset (1'b0),
				.updown (1'b1));
	defparam
		LPM_COUNTER_component.lpm_direction = "UP",
		LPM_COUNTER_component.lpm_port_updown = "PORT_UNUSED",
		LPM_COUNTER_component.lpm_type = "LPM_COUNTER",
		LPM_COUNTER_component.lpm_width = 14;
endmodule