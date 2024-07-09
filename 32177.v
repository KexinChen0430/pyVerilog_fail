module project(
		CLOCK_50,
		KEY,
		SW,
		VGA_CLK,
		VGA_HS,
		VGA_VS,
		VGA_BLANK_N,
		VGA_SYNC_N,
		VGA_R,
		VGA_G,
		VGA_B,
		LEDR
	);
	input CLOCK_50;
	input [9:0] SW;
	input [3:0] KEY;
	output VGA_CLK;
	output VGA_HS;
	output VGA_VS;
	output VGA_BLANK_N;
	output VGA_SYNC_N;
	output [9:0] VGA_R;
	output [9:0] VGA_G;
	output [9:0] VGA_B;
	output [9:0] LEDR;
	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire resetn = KEY[0];
	//wire writeEn = ~KEY[1];
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(1),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "black.mif";
//    wire [319:0] new_array = 320'b00000000001000000000010000000001000000000010000000000000000010000000000000000001000000000000000100000000001100000000000000000100000000000000000100000000000000010000000000010000000000001000000000000000010000000000000000110000000000000000100000000000000000010000000000001100000000000011000000000000000001000000000000000011;
    wire [27:0] rate = 28'b0000001011011100011011000000;
//   wire [159:0] floor = 120'b0;
    wire [159:0] draw;
    wire start, move;
    control c(
	.clk(CLOCK_50),
	.go(~KEY[2]),
	.stop(~KEY[1]),
    .start(start),
	.resetn(resetn),
	.move(move)
	);
    // key 3 used as jump button
    datapath d(
	.clk(CLOCK_50),
	.start(start),
	.move(move),
	.jump(~KEY[3]),
	.rate(rate),
	.resetn(resetn),
	.draw(draw),
	.LEDR(LEDR[9:0])
	);
    display d0(
	.floor(draw),
	.clk(CLOCK_50),
	.resetn(resetn),
	.x(x),
	.y(y),
	.colour(colour)
	);
endmodule