module batpos(
	clk,
	up,
	down,
	reset,
	speed,
	value
	);
	input clk;
	input up, down;				// signal for counting up/down
	input [4:0] speed;			// # of px to increment bats by
	input reset;
	output [10:0] value;		// max value is 1024 (px), 11 bits wide
	reg [10:0] value;
	initial begin
		value <= `vc / 2;
	end
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			// go back to the middle
			value <= `vc / 2;
		end
		else begin
			if (up) begin
				// prevent bat from going beyond upper bound of the screen
				if ((value - speed) > `va) begin
					// move bat up the screen
					value <= value - speed;
				end
			end
			else if (down) begin
				// prevent bat from going beyond lower bound of the screen
				if ((value + speed) < (`vc - `batheight)) begin
					// move bat down the screen
					value <= value + speed;
				end
			end
		end
	end
endmodule