module vga_controller(	vga_clock, resetn, pixel_colour, memory_address,
		VGA_R, VGA_G, VGA_B,
		VGA_HS, VGA_VS, VGA_BLANK,
		VGA_SYNC, VGA_CLK);
	/* Screen resolution and colour depth parameters. */
	parameter BITS_PER_COLOUR_CHANNEL = 1;
	/* The number of bits per colour channel used to represent the colour of each pixel. A value
	 */
	parameter MONOCHROME = "FALSE";
	/* Set this parameter to "TRUE" if you only wish to use black and white colours. Doing so will reduce
	parameter RESOLUTION = "320x240";
	/* Set this parameter to "160x120" or "320x240". It will cause the VGA adapter to draw each dot on
	 */
	parameter USING_DE1 = "TRUE";
	/* If set to "TRUE" it adjust the offset of the drawing mechanism to account for the differences
	//--- Timing parameters.
	/* Recall that the VGA specification requires a few more rows and columns are drawn
	 */
	parameter C_VERT_NUM_PIXELS  = 11'd480;
	parameter C_VERT_SYNC_START  = 11'd493;
	parameter C_VERT_SYNC_END    = 11'd494; //(C_VERT_SYNC_START + 2 - 1);
	parameter C_VERT_TOTAL_COUNT = 11'd525;
	parameter C_HORZ_NUM_PIXELS  = 11'd640;
	parameter C_HORZ_SYNC_START  = 11'd659;
	parameter C_HORZ_SYNC_END    = 11'd754; //(C_HORZ_SYNC_START + 96 - 1);
	parameter C_HORZ_TOTAL_COUNT = 11'd800;
	/* Declare inputs and outputs.                                               */
	input vga_clock, resetn;
	input [((MONOCHROME == "TRUE") ? (0) : (BITS_PER_COLOUR_CHANNEL*3-1)):0] pixel_colour;
	output [((RESOLUTION == "320x240") ? (16) : (14)):0] memory_address;
	output reg [9:0] VGA_R;
	output reg [9:0] VGA_G;
	output reg [9:0] VGA_B;
	output reg VGA_HS;
	output reg VGA_VS;
	output reg VGA_BLANK;
	output VGA_SYNC, VGA_CLK;
	/* Local Signals.                                                            */
	reg VGA_HS1;
	reg VGA_VS1;
	reg VGA_BLANK1;
	reg [9:0] xCounter, yCounter;
	wire xCounter_clear;
	wire yCounter_clear;
	wire vcc;
	reg [((RESOLUTION == "320x240") ? (8) : (7)):0] x;
	reg [((RESOLUTION == "320x240") ? (7) : (6)):0] y;
	/* Inputs to the converter. */
	/* Controller implementation.                                                */
	assign vcc =1'b1;
	/* A counter to scan through a horizontal line. */
	always @(posedge vga_clock or negedge resetn)
	begin
		if (!resetn)
			xCounter <= 10'd0;
		else if (xCounter_clear)
			xCounter <= 10'd0;
		else
		begin
			xCounter <= xCounter + 1'b1;
		end
	end
	assign xCounter_clear = (xCounter == (C_HORZ_TOTAL_COUNT-1));
	/* A counter to scan vertically, indicating the row currently being drawn. */
	always @(posedge vga_clock or negedge resetn)
	begin
		if (!resetn)
			yCounter <= 10'd0;
		else if (xCounter_clear && yCounter_clear)
			yCounter <= 10'd0;
		else if (xCounter_clear)		//Increment when x counter resets
			yCounter <= yCounter + 1'b1;
	end
	assign yCounter_clear = (yCounter == (C_VERT_TOTAL_COUNT-1));
	/* Convert the xCounter/yCounter location from screen pixels (640x480) to our
	always @(*)
	begin
		if (RESOLUTION == "320x240")
		begin
			x = xCounter[9:1];
			y = yCounter[8:1];
		end
		else
		begin
			x = xCounter[9:2];
			y = yCounter[8:2];
		end
	end
	/* Change the (x,y) coordinate into a memory address. */
	vga_address_translator controller_translator(
					.x(x), .y(y), .mem_address(memory_address) );
		defparam controller_translator.RESOLUTION = RESOLUTION;
	/* Generate the vertical and horizontal synchronization pulses. */
	always @(posedge vga_clock)
	begin
		//- Sync Generator (ACTIVE LOW)
		if (USING_DE1 == "TRUE")
			VGA_HS1 <= ~((xCounter >= C_HORZ_SYNC_START-2) && (xCounter <= C_HORZ_SYNC_END-2));
		else
			VGA_HS1 <= ~((xCounter >= C_HORZ_SYNC_START) && (xCounter <= C_HORZ_SYNC_END));
		VGA_VS1 <= ~((yCounter >= C_VERT_SYNC_START) && (yCounter <= C_VERT_SYNC_END));
		//- Current X and Y is valid pixel range
		VGA_BLANK1 <= ((xCounter < C_HORZ_NUM_PIXELS) && (yCounter < C_VERT_NUM_PIXELS));
		//- Add 1 cycle delay
		VGA_HS <= VGA_HS1;
		VGA_VS <= VGA_VS1;
		VGA_BLANK <= VGA_BLANK1;
	end
	/* VGA sync should be 1 at all times. */
	assign VGA_SYNC = vcc;
	/* Generate the VGA clock signal. */
	assign VGA_CLK = vga_clock;
	/* Brighten the colour output. */
	// The colour input is first processed to brighten the image a little. Setting the top
	// bits to correspond to the R,G,B colour makes the image a bit dull. To brighten the image,
	// each bit of the colour is replicated through the 10 DAC colour input bits. For example,
	// when BITS_PER_COLOUR_CHANNEL is 2 and the red component is set to 2'b10, then the
	// VGA_R input to the DAC will be set to 10'b1010101010.
	integer index;
	integer sub_index;
	wire on_screen;
	assign on_screen = (USING_DE1 == "TRUE") ?
							(({1'b0, xCounter} >= 2) & ({1'b0, xCounter} < C_HORZ_NUM_PIXELS+2) & ({1'b0, yCounter} < C_VERT_NUM_PIXELS)) :
							(({1'b0, xCounter} >= 0) & ({1'b0, xCounter} < C_HORZ_NUM_PIXELS+2) & ({1'b0, yCounter} < C_VERT_NUM_PIXELS));
	always @(pixel_colour or on_screen)
	begin
		VGA_R <= 'b0;
		VGA_G <= 'b0;
		VGA_B <= 'b0;
		if (MONOCHROME == "FALSE")
		begin
			for (index = 10-BITS_PER_COLOUR_CHANNEL; index >= 0; index = index - BITS_PER_COLOUR_CHANNEL)
			begin
				for (sub_index = BITS_PER_COLOUR_CHANNEL - 1; sub_index >= 0; sub_index = sub_index - 1)
				begin
					VGA_R[sub_index+index] <= on_screen & pixel_colour[sub_index + BITS_PER_COLOUR_CHANNEL*2];
					VGA_G[sub_index+index] <= on_screen & pixel_colour[sub_index + BITS_PER_COLOUR_CHANNEL];
					VGA_B[sub_index+index] <= on_screen & pixel_colour[sub_index];
				end
			end
		end
		else
		begin
			for (index = 0; index < 10; index = index + 1)
			begin
				VGA_R[index] <= on_screen & pixel_colour[0:0];
				VGA_G[index] <= on_screen & pixel_colour[0:0];
				VGA_B[index] <= on_screen & pixel_colour[0:0];
			end
		end
	end
endmodule