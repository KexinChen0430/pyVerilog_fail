module block_Character_Screen (
	dout,
	din,
	address,
	size,
	read_write,
	enable,
	VGA_hsync,
	VGA_vsync,
	VGA_pixel,
	clk,
	reset
);
	`include "definition/Definition.v"
	output	wire		[WORD-1:0]								dout;
	input	wire		[WORD-1:0]								din;
	input	wire		[WORD-1:0]								address;
	input	wire		[LOGWORDBYTE-1:0]						size;
	input	wire												read_write;
	input	wire												enable;
	output	reg													VGA_hsync;
	output	reg													VGA_vsync;
	output	reg													VGA_pixel;
	input	wire												clk;
	input	wire												reset;
			reg			[WORD-1:0]								x						[0:0];
			reg			[WORD-1:0]								y						[0:0];
			reg			[0:0]									hsync					[1:0];
			reg			[0:0]									vsync					[1:0];
			reg			[0:0]									blank					[1:0];
			wire												out_VGA_hsync;
			wire												out_VGA_vsync;
			wire												out_pixel_blank;
			wire		[WORD-1:0]								out_bit_row;
			wire		[WORD-1:0]								out_bit_column;
			wire		[WORD-1:0]								out_char_row;
			wire		[WORD-1:0]								out_char_column;
			wire		[WORD-1:0]								out_screen_row;
			wire		[WORD-1:0]								out_screen_column;
			wire		[WORD-1:0]								out_char_offset;
			wire												out_char_blank;
			wire		[WORD-1:0]								out_ascii;
			wire												out_pixel;
			reg													out_invert;
			wire		[WORD-1:0]								buffer_address_read;
	assign buffer_address_read	= out_char_offset + out_char_column;
	always @(posedge clk) begin
		if(reset) begin
			x[0]		<=	0;
			y[0]		<=	0;
			hsync[0]	<=	0;
			vsync[0]	<=	0;
			blank[0]	<=	0;
			hsync[1]	<=	0;
			vsync[1]	<=	0;
			blank[1]	<=	0;
			VGA_hsync	<=	0;
			VGA_vsync	<=	0;
			VGA_pixel	<=	0;
			out_invert	<=	0;
		end else begin
			x[0]		<=	out_bit_column;
			y[0]		<=	out_bit_row;
			hsync[0]	<=	out_VGA_hsync;
			vsync[0]	<=	out_VGA_vsync;
			blank[0]	<=	out_pixel_blank || out_char_blank;
			hsync[1]	<=	hsync[0];
			vsync[1]	<=	vsync[0];
			blank[1]	<=	blank[0];
			VGA_hsync	<=	hsync[1];
			VGA_vsync	<=	vsync[1];
			VGA_pixel	<=	blank[1] ? 0 : (out_invert^^out_pixel);
			out_invert	<=	out_ascii[ASCII_WIDTH];
		end
	end
	FSM_VGA fsm_vga(
		.VGA_hsync		(out_VGA_hsync		),
		.VGA_vsync		(out_VGA_vsync		),
		.pixel_blank	(out_pixel_blank	),
		.screen_row		(out_screen_row		),
		.screen_column	(out_screen_column	),
		.reset			(reset				),
		.clk			(clk				)
	);
	FSM_Character fsm_character(
		.bit_row		(out_bit_row		),	.bit_column		(out_bit_column		),
		.char_row		(out_char_row		),	.char_column	(out_char_column	),
		.screen_row		(out_screen_row		),	.screen_column	(out_screen_column	),
		.char_offset	(out_char_offset	),
		.char_blank		(out_char_blank		),
		.reset			(reset				),
		.clk			(clk				)
	);
	DualMemory #(
		.memfile	(BLANKFILE			),
		.LOGMEM		(CHARMEM_BITSIZE	)
	)
	character_buffer (
		// the one that talks on the bus
		.A_dout			(dout		),
		.A_din			(din		),
		.A_address		(address	),
		.A_size			(size		),
		.A_read_write	(read_write	),
		.A_enable		(enable		),
		// the one that sits in the character device pipeline
		.B_dout			(out_ascii				),
		.B_din			(0						),
		.B_address		(buffer_address_read	),
		.B_size			(0						),	// read (1<<0) bytes
		.B_read_write	(READ					),
		.B_enable		(ENABLE[0:0]			),	// down-convert the value to 1 bit
		.reset(reset),
		.clk(clk)
	);
	Character_Map
	mapping (
		.ascii	({1'b0,out_ascii[ASCII_WIDTH-1:0]}	),
		.bit_y	(y[0]								),
		.bit_x	(x[0]								),
		.pixel	(out_pixel							),
		.reset	(reset								),
		.clk	(clk								)
	);
endmodule