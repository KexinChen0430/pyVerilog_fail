module
	ballcollisions bcs (
		.clk(video_clock && start && ball_on),
		.reset(reset || newround),
		.p1_y(p1_y),
		.p2_y(p2_y),
		.ball_x(ball_x),
		.ball_y(ball_y),
		.dir_x(dir_x),
		.dir_y(dir_y),
		.oob(outofbounds)
		);
	// Module with counters that determining the ball position
	ballpos bp (
		.clk(video_clock && start && ball_on),
		.reset(reset || newround || (winner > 0)),
		.speed(`ballspeed),
		.dir_x(dir_x),
		.dir_y(dir_y),
		.value_x(ball_x),
		.value_y(ball_y)
		);
endmodule