module ballcollisions(
	clk,
	reset,
	p1_y,
	p2_y,
	ball_x,
	ball_y,
	dir_x,
	dir_y,
	oob		// whether ball is out of bounds
	);
	input clk, reset;
	input [10:0] p1_y, p2_y, ball_x, ball_y;
	output dir_x, dir_y, oob;
	reg dir_x, dir_y, oob;
	initial begin
		dir_x <= 0;
		dir_y <= 1;
		oob <= 0;
	end
	always @ (posedge clk) begin
		if (reset) begin
			dir_x <= ~dir_x;	// alternate starting direction every round
			dir_y <= 1;
			oob <= 0;
		end
		else begin
			// out of bounds (i.e. one of the players missed the ball)
			if (ball_x <= 0 || ball_x >= `hc) begin
				oob = 1;
			end
			else begin
				oob = 0;
			end
			// collision with top & bottom walls
			if (ball_y <= `va + 5) begin
				dir_y = 1;
			end
			if (ball_y >= `vc - `ballsize) begin
				dir_y = 0;
			end
			// collision with P1 bat
			if (ball_x <= `batwidth && ball_y + `ballsize >= p1_y && ball_y <= p1_y + `batheight) begin
				dir_x = 1;	// reverse direction
				if (ball_y + `ballsize <= p1_y + (`batheight / 2)) begin
					// collision with top half of p1 bat, go up
					dir_y = 0;
				end
				else begin
					// collision with bottom half of p1 bat, go down
					dir_y = 1;
				end
			end
			// collision with P2 bat
			else if (ball_x >= `hc - `batwidth -`ballsize && ball_y + `ballsize <= p2_y + `batheight && ball_y >= p2_y) begin
				dir_x = 0;	// reverse direction
				if (ball_y + `ballsize <= p2_y + (`batheight / 2)) begin
					// collision with top half of p1 bat, go up
					dir_y = 0;
				end
				else begin
					// collision with bottom half of p1 bat, go down
					dir_y = 1;
				end
			end
		end
	end
endmodule