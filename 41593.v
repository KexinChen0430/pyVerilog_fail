module FSM_Character(
	bit_row,		bit_column,
	char_row,		char_column,
	screen_row,		screen_column,
	char_offset,	// the memory offset for this particular row
	char_blank,		// tells the screen to black out for non-characters
	clk,
	reset
);
	`include "definition/Definition.v"
	output			[WORD-1:0]		bit_row;
	output			[WORD-1:0]		bit_column;
	output			[WORD-1:0]		char_row;
	output			[WORD-1:0]		char_column;
	input			[WORD-1:0]		screen_row;
	input			[WORD-1:0]		screen_column;
	output							char_blank;
	output	reg		[WORD-1:0]		char_offset;
	input							clk;
	input							reset;
			wire	[6-1:0]			carry;
			wire	[WORD-1:0]		division;
	assign carry[0] = (screen_row < PIXACT_HEIGHT) && (screen_column < PIXACT_WIDTH);
	assign char_blank = !carry[0];
	// chain of radix counters char row <- bit row <- char column <- bit column <- clock divide
	Radix_Counter #(CHAR_HEIGHT)	counter_char_row(
		.carry_in(carry[4]),
		.carry_out(carry[5]),
		.count(char_row),
		.reset(reset),
		.clk(clk)
	);
	always @(posedge clk) begin
			 if(reset)															char_offset	<= 0;
		else if(carry[4] && (char_offset < CHARACTER_BUFFER_DIM-CHAR_WIDTH))	char_offset	<= char_offset + CHAR_WIDTH;
		else if(carry[4])														char_offset	<= 0;
		else																	char_offset	<= char_offset;
	end
	Radix_Counter #(BIT_HEIGHT)		counter_bit_row(
		.carry_in(carry[3]),
		.carry_out(carry[4]),
		.count(bit_row),
		.reset(reset),
		.clk(clk)
	);
	Radix_Counter #(CHAR_WIDTH)		counter_char_column(
		.carry_in(carry[2]),
		.carry_out(carry[3]),
		.count(char_column),
		.reset(reset),
		.clk(clk)
	);
	Radix_Counter #(BIT_WIDTH)		counter_bit_column(
		.carry_in(carry[1]),
		.carry_out(carry[2]),
		.count(bit_column),
		.reset(reset),
		.clk(clk)
	);
	Radix_Counter #(VGA_SLOW)		counter_divide(
		.carry_in(carry[0]),
		.carry_out(carry[1]),
		.count(division),
		.reset(reset),
		.clk(clk)
	);
endmodule