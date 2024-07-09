module InvButterfly (
	outword,
	inword,
	control
);
	`include "definition/Definition.v"
	output				[WORD-1:0]								outword;
	input				[WORD-1:0]								inword;
	input				[((WORD/2)*LOGWORD)-1:0]				control;
	Lepid #(.stage(LOGWORD-1), .child(0)) root (
		.outword(outword),
		.inword(inword),
		.control(control)
	);
endmodule