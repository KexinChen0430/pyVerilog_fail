module ballpos(
	clk,
	reset,
	speed,
	dir_x,		// 0 = LEFT, 1 = RIGHT
	dir_y,		// 0 = UP, 1 = DOWN
	value_x,
	value_y
	);
	input clk;
	input [4:0] speed;					// # of px to increment bat by
	input reset;
	input dir_x, dir_y;
	output [10:0] value_x, value_y;		// max value is 1024 (px), 11 bits wide
	reg [10:0] value_x, value_y;
	// the initial position of the ball is at the top of the screen, in the middle,
	initial begin
		value_x <= `hc / 2 - (`ballsize / 2);
		value_y <= `va + 7;
	end
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			value_x <= `hc / 2 - (`ballsize / 2);
			value_y <= `va + 7;
		end
		else begin
			// increment x
			if (dir_x) begin
				// right
				value_x <= value_x + speed;
			end
			else begin
				// left
				value_x <= value_x - speed;
			end
			// increment y
			if (dir_y) begin
				// down
				value_y <= value_y + speed;
			end
			else begin
				// up
				value_y <= value_y - speed;
			end
		end
	end
endmodule