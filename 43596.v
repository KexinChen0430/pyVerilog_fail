module PriorityEncoder (
	active,
	activeN,
	tripline
);
	`include "definition/Definition.v"
	parameter OCODEWIDTH=LOGWORD;
	localparam TRIPWIDTH=1<<OCODEWIDTH;
	output	wire												active;
	output	wire		[OCODEWIDTH-1:0]						activeN;
	input	wire		[TRIPWIDTH-1:0]							tripline;
	PriorityChoice #(.OCODEWIDTH(OCODEWIDTH)) reducer (
		.out(active),
		.outN(activeN),
		.tripline(tripline)
	);
endmodule