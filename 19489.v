module RotateLine (
	cb,
	feedout,
	feedin,
	rotate
);
	`include "definition/Definition.v"
	parameter stage = 0;								// stage is which in the sequence of Lepid modules this one is
	localparam HSTRING = 1<<((stage==0)?1:stage-1);		// the width of the string in this stage
	localparam SSTRING = stage==0 ? 1 : HSTRING;		// compiler-safe half string width
	output		reg		[WORD-1:0]								cb;
	output		reg		[WORD-1:0]								feedout;
	input				[WORD-1:0]								feedin;
	input				[WORD-1:0]								rotate;
				reg 	[WORD-1:0] thermo;
				reg 	[WORD-1:0] piezo;
	always @(*) begin
		cb <= feedout[(1<<stage)-1:0] ^ thermo[(1<<stage)-1:0] ;
		thermo <= {WORD{rotate[stage]}};
	end
	generate
		if(stage == 0) begin
			initial begin
				piezo <= 0;
				feedout <= 0;
			end
		end else begin
			always @(*) begin
				piezo <= {WORD{rotate[stage-1]}};
				feedout <= { feedin[SSTRING-1:0] | piezo[SSTRING-1:0] , feedin[SSTRING-1:0] & piezo[SSTRING-1:0] };
			end
		end
	endgenerate
endmodule