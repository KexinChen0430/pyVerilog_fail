module RotateControl (
	emit,
	control,
	rotate
);
	`include "definition/Definition.v"
	output		wire	[WORD-1:0]								emit;
	output		wire	[((WORD/2)*LOGWORD)-1:0]				control;
	input				[WORD-1:0]								rotate;
				wire	[WORD-1:0]								control_a		[LOGWORD-1:0];
				wire	[WORD-1:0]								feedword		[LOGWORD+1:0];
	assign feedword[0] = 0;
	genvar i;
	generate
		for(i=0; i<LOGWORD; i=i+1) begin : GEN_CONTROL
			assign control[((i+1)*(WORD/2))-1:(i*(WORD/2))] = control_a[i];	// serialize the control array
		end
	endgenerate
	generate
		for(i=0; i<LOGWORD; i=i+1) begin : GEN_ROTATELINE
			RotateLine #(.stage(i)) unitLine (
				.cb(control_a[i]),
				.feedout(feedword[i+1]),
				.feedin(feedword[i]),
				.rotate(rotate)
			);
		end
	endgenerate
	RotateLine #(.stage(LOGWORD)) unitLine (
		.cb(emit),
		.feedout(feedword[LOGWORD+1]),
		.feedin(feedword[LOGWORD]),
		.rotate(rotate)
	);
endmodule