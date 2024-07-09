module FSM_VGA(
	VGA_hsync,
	VGA_vsync,
	pixel_blank,
	screen_row,	screen_column,
	reset,
	clk
);
	`include "definition/Definition.v"
	output														VGA_hsync;
	output														VGA_vsync;
	output														pixel_blank;
	input														clk;
	input														reset;
			reg		[WORD-1:0]									pixel_row;
			reg		[WORD-1:0]									pixel_column;
	output	wire	[WORD-1:0]									screen_row;
	output	wire	[WORD-1:0]									screen_column;
			reg		[WORD-1:0]									state_vertical;
			reg		[WORD-1:0]									state_horizontal;
			wire												active_row;
			wire												active_column;
			wire	[WORD-1:0]									division;
	// these values are simply doubled because I don't care about proper clock domains if the screen will still work
	// some necessary constants for the 640 X 480 controller
	localparam	PIXEL_H				= SCREEN_WIDTH,
				PIXEL_V				= SCREEN_HEIGHT,
				FRONT_PORCH_H		= 16,
				FRONT_PORCH_V		= 10,
				PULSE_H				= 96,
				PULSE_V				= 2,
				BACK_PORCH_H		= 48,
				BACK_PORCH_V		= 29;
	localparam	SYNC_H				= (PIXEL_H + FRONT_PORCH_H + PULSE_H + BACK_PORCH_H),
				SYNC_V				= (PIXEL_V + FRONT_PORCH_V + PULSE_V + BACK_PORCH_V);
	localparam	MODE_0_H			=	0,
				MODE_0_V			=	0,
				MODE_1_H			=	MODE_0_H	+	PIXEL_H,
				MODE_1_V			=	MODE_0_V	+	PIXEL_V,
				MODE_2_H			=	MODE_1_H	+	FRONT_PORCH_H,
				MODE_2_V			=	MODE_1_V	+	FRONT_PORCH_V,
				MODE_3_H			=	MODE_2_H	+	PULSE_H,
				MODE_3_V			=	MODE_2_V	+	PULSE_V;
	localparam	STATE_PIXEL			= 0,
				STATE_FRONT_PORCH	= 1,
				STATE_PULSE			= 2,
				STATE_BACK_PORCH	= 3;
	assign pixel_blank		= !((state_horizontal == STATE_PIXEL) && (state_vertical == STATE_PIXEL));
	assign VGA_hsync		= !(state_horizontal==STATE_PULSE);
	assign VGA_vsync		= !(state_vertical	==STATE_PULSE);
	// the "real" position of the electron gun
	// these positions truly indicate what position is being displayed so long as pixel_blank is false
	// otherwise the positions are invalid
	always @(*) begin
		if(state_vertical == STATE_PIXEL)	pixel_row		<=	screen_row;
		else								pixel_row		<=	0;
		if(state_horizontal == STATE_PIXEL)	pixel_column	<=	screen_column;
		else								pixel_column	<=	0;
	end
	// VGA state-like classification machine
	// this has two pieces that take in counters (specifically radix counters) and pop out a state based on them
	always @(*) begin
				if(screen_column < MODE_1_H)	state_horizontal	<=	STATE_PIXEL;
		else	if(screen_column < MODE_2_H)	state_horizontal	<=	STATE_FRONT_PORCH;
		else	if(screen_column < MODE_3_H)	state_horizontal	<=	STATE_PULSE;
		else									state_horizontal	<=	STATE_BACK_PORCH;
				if(screen_row < MODE_1_V)		state_vertical		<=	STATE_PIXEL;
		else	if(screen_row < MODE_2_V)		state_vertical		<=	STATE_FRONT_PORCH;
		else	if(screen_row < MODE_3_V)		state_vertical		<=	STATE_PULSE;
		else									state_vertical		<=	STATE_BACK_PORCH;
	end
	wire	[4-1:0]	carry;
	assign carry[0] = 1;
	// chain of radix counters: screen_row <- screen column <- clock divide
	Radix_Counter #(SYNC_V)		counter_screen_row(
		.carry_in(carry[2]),
		.carry_out(carry[3]),
		.count(screen_row),
		.reset(reset),
		.clk(clk)
	);
	Radix_Counter #(SYNC_H)		counter_screen_column(
		.carry_in(carry[1]),
		.carry_out(carry[2]),
		.count(screen_column),
		.reset(reset),
		.clk(clk)
	);
	Radix_Counter #(VGA_SLOW)	counter_divide(
		.carry_in(carry[0]),
		.carry_out(carry[1]),
		.count(division),
		.reset(reset),
		.clk(clk)
	);
endmodule