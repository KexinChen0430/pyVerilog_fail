module tti(input wire clk,
	input wire tti_clock,
	input wire rx,
	output wire [8:1] iob,
	output reg tti_active = 0,
	output reg tti_done = 0,
	output reg [8:1] tti = 0
);
	assign iob = tti;
	wire tti_shift = tti_4count_rise & ~tti_last_unit;
	reg tti_last_unit = 0;
	reg tti_active0;
	wire tti_4count;
	reg tti_4count0;
	wire tti_space = ~rx;
	wire tti_4count_rise = ~tti_4count0 & tti_4count;
	wire tti_set = ~tti_active0 & tti_active;
	div8 d(.clk(clk),
		.reset(tti_set),
		.enable(tti_clock & tti_active),
		.out(tti_4count));
	always @(posedge clk) begin
		tti_4count0 <= tti_4count;
		tti_active0 <= tti_active;
		if(tti_set) begin
			tti <= 8'o377;
			tti_last_unit <= 0;
		end
		if(tti_4count_rise & tti_last_unit)
			tti_active <= 0;
		if(tti_shift) begin
			tti <= { rx, tti[8:2] };
			if(~tti[1]) begin
				tti_last_unit <= 1;
				tti_done <= 1;
			end
			if(tti[1])
				tti_done <= 0;
			if(~tti_space & (& tti))
				tti_active <= 0;
		end
		if(tti_clock)
			if(~tti_active & tti_space)
				tti_active <= 1;
	end
endmodule