module Lepid (
	outword,
	inword,
	control
);
	`include "definition/Definition.v"
	parameter stage = 0;			// stage is which in the sequence of Lepid modules this one is
	parameter child = 0;			// which part of the branch is this child
	localparam PART = 1<<stage;		// short for partner/partition offset
	localparam OFFS = child*PART;	// the offset between partnered muxes
	output		reg		[2*PART-1:0]							outword;
	input				[2*PART-1:0]							inword;
	input				[(LOGWORD*WORD/2)-1:0]					control;	// total control array
				wire	[WORD/2-1:0]							control_a;	// level extracted control bits
				wire	[PART-1:0]								minget;		// output from maxchild
				wire	[PART-1:0]								maxget;		// output from minchild
	assign control_a = control[((stage+1)*(WORD/2))-1:(stage*(WORD/2))];	// extract a piece of the control array
	genvar i;
	generate
		if(stage==0) begin
			assign maxget = inword[1];
			assign minget = inword[0];
		end
		else begin
			Lepid #(.stage(stage-1), .child(2*child+0)) minchild(
				.outword(minget),
				.inword(inword[PART-1:0]),
				.control(control)
			);
			Lepid #(.stage(stage-1), .child(2*child+1)) maxchild(
				.outword(maxget),
				.inword(inword[2*PART-1:PART]),
				.control(control)
			);
		end
		for(i=0; i<PART; i=i+1) begin : GEN_OUTWORD
			always @(*) begin
				outword[i+0   ]	<= control_a[i+OFFS] ? maxget[i] : minget[i];
				outword[i+PART]	<= control_a[i+OFFS] ? minget[i] : maxget[i];
			end
		end
	endgenerate
endmodule