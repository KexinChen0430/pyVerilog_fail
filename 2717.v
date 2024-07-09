module tto(input wire clk,
	input wire tto_clock,
	input wire [8:1] iob,
	input wire tty_data_clr,
	input wire tty_data_set,
	output wire tx,
	output reg tto_done = 0
);
	reg [8:1] tto;
	reg tto_out_line;
	reg tto_enable = 0;
	reg tto_active = 0;
	reg tto_active0;
	reg tto_div2 = 0;
	reg tto_div20;
	wire tto_4count;
	wire tto_shift = tto_div20 & ~tto_div2;
	count4 c(.clk(clk),
		.reset(tto_active0 & ~tto_active),
		.enable(tto_clock),
		.out(tto_4count));
	always @(posedge clk) begin
		tto_active0 <= tto_active;
		tto_div20 <= tto_div2;
		if(tty_data_clr) begin
			tto_done <= 0;
		end
		if(tty_data_set) begin
			tto <= iob;
			tto_enable <= 1;
		end
		if(tto_clock) begin
			if(tto_active)
				tto_div2 <= ~tto_div2;
			if(tto_4count & tto_enable)
				tto_active <= 1;
		end
		if(tto_shift) begin
			tto_enable <= 0;
			{ tto, tto_out_line } <= { tto_enable, tto };
			if(~tto_enable & tto[8:2] == 0) begin
				tto_active <= 0;
				tto_done <= 1;
			end
		end
		if(~tto_active)
			tto_out_line <= 1;
		else
			if(~tto_active0)
				tto_out_line <= 0;
	end
	assign tx = tto_out_line;
endmodule