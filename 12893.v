module  LVDS_AD_dffpipe
	(
	clock,
	d,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [7:0]  d;
	output   [7:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	reg	[7:0]	dffe17a;
	reg	[7:0]	dffe18a;
	reg	[7:0]	dffe19a;
	wire clrn;
	wire ena;
	wire prn;
	wire sclr;
	// synopsys translate_off
	initial
		dffe17a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe17a <= {8{1'b1}};
		else if (clrn == 1'b0) dffe17a <= 8'b0;
		else if  (ena == 1'b1)   dffe17a <= (d & {8{(~ sclr)}});
	// synopsys translate_off
	initial
		dffe18a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe18a <= {8{1'b1}};
		else if (clrn == 1'b0) dffe18a <= 8'b0;
		else if  (ena == 1'b1)   dffe18a <= (dffe17a & {8{(~ sclr)}});
	// synopsys translate_off
	initial
		dffe19a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe19a <= {8{1'b1}};
		else if (clrn == 1'b0) dffe19a <= 8'b0;
		else if  (ena == 1'b1)   dffe19a <= (dffe18a & {8{(~ sclr)}});
	assign
		clrn = 1'b1,
		ena = 1'b1,
		prn = 1'b1,
		q = dffe19a,
		sclr = 1'b0;
endmodule