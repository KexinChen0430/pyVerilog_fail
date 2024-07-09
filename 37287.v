module Character_Map (
	ascii,
	bit_y,
	bit_x,
	pixel,
	reset,
	clk
);
	`include "definition/Definition.v"
	input				[BYTE-1:0]								ascii;
	input				[WORD-1:0]								bit_y;
	input				[WORD-1:0]								bit_x;
	output														pixel;
	input														reset;
	input														clk;
				reg		[WORD-1:0]								hold;
				reg		[WORD-1:0]								bit_x_hold;
	assign pixel = hold[bit_x_hold];
	wire read_bitmap =
		(ascii >= ASCII_START)	&& (ascii < ASCII_END)				&&	// verify that the ASCII requested is valid
		(bit_y >= 0)			&& (bit_y < BIT_PACK/*BIT_HEIGHT*/)	&&	// verify that the requested pixel is in the range of the character
		(bit_x >= 0)			&& (bit_x < BIT_WIDTH);					// verify that the requested pixel is in the range of the character
		// note that "bit_* < BIT_*-1" is not an error, the map only defines a 5X7 array but to space out the characters a little
		// interfaces will see a 6X8 interface and this will automatically space them out and still lead to a well-defined map
		// (that would be smaller if we were able to use SystemVerilog that allowed higher-dimensional arrays)
	always @(posedge clk) begin
		if(reset) 	bit_x_hold	<= 'b0;
		else		bit_x_hold	<= bit_x;
		if(reset) begin
			hold	<=	0;
		end else if(!read_bitmap) begin
			hold	<=	0;
		end else begin
			case( ((ascii-ASCII_START)<<3) | bit_y[2:0] )
				// easy to read character map data
				// (there is an XLSX file that these are defined in and is easier to view graphically)
				{32'd0,3'd0} : hold <= 'b00000;
				{32'd0,3'd1} : hold <= 'b00000;
				{32'd0,3'd2} : hold <= 'b00000;
				{32'd0,3'd3} : hold <= 'b00000;
				{32'd0,3'd4} : hold <= 'b00000;
				{32'd0,3'd5} : hold <= 'b00000;
				{32'd0,3'd6} : hold <= 'b00000;
				{32'd0,3'd7} : hold <= 'b00000;
				{32'd1,3'd0} : hold <= 'b00100;
				{32'd1,3'd1} : hold <= 'b00100;
				{32'd1,3'd2} : hold <= 'b00100;
				{32'd1,3'd3} : hold <= 'b00100;
				{32'd1,3'd4} : hold <= 'b00100;
				{32'd1,3'd5} : hold <= 'b00000;
				{32'd1,3'd6} : hold <= 'b00100;
				{32'd1,3'd7} : hold <= 'b00000;
				{32'd2,3'd0} : hold <= 'b01010;
				{32'd2,3'd1} : hold <= 'b01010;
				{32'd2,3'd2} : hold <= 'b01010;
				{32'd2,3'd3} : hold <= 'b00000;
				{32'd2,3'd4} : hold <= 'b00000;
				{32'd2,3'd5} : hold <= 'b00000;
				{32'd2,3'd6} : hold <= 'b00000;
				{32'd2,3'd7} : hold <= 'b00000;
				{32'd3,3'd0} : hold <= 'b01010;
				{32'd3,3'd1} : hold <= 'b01010;
				{32'd3,3'd2} : hold <= 'b11111;
				{32'd3,3'd3} : hold <= 'b01010;
				{32'd3,3'd4} : hold <= 'b11111;
				{32'd3,3'd5} : hold <= 'b01010;
				{32'd3,3'd6} : hold <= 'b01010;
				{32'd3,3'd7} : hold <= 'b00000;
				{32'd4,3'd0} : hold <= 'b00100;
				{32'd4,3'd1} : hold <= 'b01110;
				{32'd4,3'd2} : hold <= 'b00101;
				{32'd4,3'd3} : hold <= 'b01110;
				{32'd4,3'd4} : hold <= 'b10100;
				{32'd4,3'd5} : hold <= 'b01110;
				{32'd4,3'd6} : hold <= 'b00100;
				{32'd4,3'd7} : hold <= 'b00000;
				{32'd5,3'd0} : hold <= 'b10011;
				{32'd5,3'd1} : hold <= 'b10011;
				{32'd5,3'd2} : hold <= 'b01000;
				{32'd5,3'd3} : hold <= 'b00100;
				{32'd5,3'd4} : hold <= 'b00010;
				{32'd5,3'd5} : hold <= 'b11001;
				{32'd5,3'd6} : hold <= 'b11001;
				{32'd5,3'd7} : hold <= 'b00000;
				{32'd6,3'd0} : hold <= 'b00110;
				{32'd6,3'd1} : hold <= 'b01001;
				{32'd6,3'd2} : hold <= 'b00101;
				{32'd6,3'd3} : hold <= 'b00010;
				{32'd6,3'd4} : hold <= 'b10101;
				{32'd6,3'd5} : hold <= 'b01001;
				{32'd6,3'd6} : hold <= 'b10110;
				{32'd6,3'd7} : hold <= 'b00000;
				{32'd7,3'd0} : hold <= 'b00100;
				{32'd7,3'd1} : hold <= 'b00100;
				{32'd7,3'd2} : hold <= 'b00100;
				{32'd7,3'd3} : hold <= 'b00000;
				{32'd7,3'd4} : hold <= 'b00000;
				{32'd7,3'd5} : hold <= 'b00000;
				{32'd7,3'd6} : hold <= 'b00000;
				{32'd7,3'd7} : hold <= 'b00000;
				{32'd8,3'd0} : hold <= 'b01000;
				{32'd8,3'd1} : hold <= 'b00100;
				{32'd8,3'd2} : hold <= 'b00010;
				{32'd8,3'd3} : hold <= 'b00010;
				{32'd8,3'd4} : hold <= 'b00010;
				{32'd8,3'd5} : hold <= 'b00100;
				{32'd8,3'd6} : hold <= 'b01000;
				{32'd8,3'd7} : hold <= 'b00000;
				{32'd9,3'd0} : hold <= 'b00010;
				{32'd9,3'd1} : hold <= 'b00100;
				{32'd9,3'd2} : hold <= 'b01000;
				{32'd9,3'd3} : hold <= 'b01000;
				{32'd9,3'd4} : hold <= 'b01000;
				{32'd9,3'd5} : hold <= 'b00100;
				{32'd9,3'd6} : hold <= 'b00010;
				{32'd9,3'd7} : hold <= 'b00000;
				{32'd10,3'd0} : hold <= 'b00100;
				{32'd10,3'd1} : hold <= 'b10101;
				{32'd10,3'd2} : hold <= 'b01110;
				{32'd10,3'd3} : hold <= 'b10101;
				{32'd10,3'd4} : hold <= 'b00100;
				{32'd10,3'd5} : hold <= 'b00000;
				{32'd10,3'd6} : hold <= 'b00000;
				{32'd10,3'd7} : hold <= 'b00000;
				{32'd11,3'd0} : hold <= 'b00000;
				{32'd11,3'd1} : hold <= 'b00100;
				{32'd11,3'd2} : hold <= 'b00100;
				{32'd11,3'd3} : hold <= 'b11111;
				{32'd11,3'd4} : hold <= 'b00100;
				{32'd11,3'd5} : hold <= 'b00100;
				{32'd11,3'd6} : hold <= 'b00000;
				{32'd11,3'd7} : hold <= 'b00000;
				{32'd12,3'd0} : hold <= 'b00000;
				{32'd12,3'd1} : hold <= 'b00000;
				{32'd12,3'd2} : hold <= 'b00000;
				{32'd12,3'd3} : hold <= 'b00000;
				{32'd12,3'd4} : hold <= 'b00110;
				{32'd12,3'd5} : hold <= 'b00100;
				{32'd12,3'd6} : hold <= 'b00010;
				{32'd12,3'd7} : hold <= 'b00000;
				{32'd13,3'd0} : hold <= 'b00000;
				{32'd13,3'd1} : hold <= 'b00000;
				{32'd13,3'd2} : hold <= 'b00000;
				{32'd13,3'd3} : hold <= 'b11111;
				{32'd13,3'd4} : hold <= 'b00000;
				{32'd13,3'd5} : hold <= 'b00000;
				{32'd13,3'd6} : hold <= 'b00000;
				{32'd13,3'd7} : hold <= 'b00000;
				{32'd14,3'd0} : hold <= 'b00000;
				{32'd14,3'd1} : hold <= 'b00000;
				{32'd14,3'd2} : hold <= 'b00000;
				{32'd14,3'd3} : hold <= 'b00000;
				{32'd14,3'd4} : hold <= 'b00000;
				{32'd14,3'd5} : hold <= 'b00110;
				{32'd14,3'd6} : hold <= 'b00110;
				{32'd14,3'd7} : hold <= 'b00000;
				{32'd15,3'd0} : hold <= 'b10000;
				{32'd15,3'd1} : hold <= 'b10000;
				{32'd15,3'd2} : hold <= 'b01000;
				{32'd15,3'd3} : hold <= 'b00100;
				{32'd15,3'd4} : hold <= 'b00010;
				{32'd15,3'd5} : hold <= 'b00001;
				{32'd15,3'd6} : hold <= 'b00001;
				{32'd15,3'd7} : hold <= 'b00000;
				{32'd16,3'd0} : hold <= 'b01110;
				{32'd16,3'd1} : hold <= 'b10001;
				{32'd16,3'd2} : hold <= 'b11001;
				{32'd16,3'd3} : hold <= 'b10101;
				{32'd16,3'd4} : hold <= 'b10011;
				{32'd16,3'd5} : hold <= 'b10001;
				{32'd16,3'd6} : hold <= 'b01110;
				{32'd16,3'd7} : hold <= 'b00000;
				{32'd17,3'd0} : hold <= 'b00100;
				{32'd17,3'd1} : hold <= 'b00110;
				{32'd17,3'd2} : hold <= 'b00100;
				{32'd17,3'd3} : hold <= 'b00100;
				{32'd17,3'd4} : hold <= 'b00100;
				{32'd17,3'd5} : hold <= 'b00100;
				{32'd17,3'd6} : hold <= 'b01110;
				{32'd17,3'd7} : hold <= 'b00000;
				{32'd18,3'd0} : hold <= 'b01110;
				{32'd18,3'd1} : hold <= 'b10001;
				{32'd18,3'd2} : hold <= 'b10000;
				{32'd18,3'd3} : hold <= 'b01000;
				{32'd18,3'd4} : hold <= 'b00100;
				{32'd18,3'd5} : hold <= 'b00010;
				{32'd18,3'd6} : hold <= 'b11111;
				{32'd18,3'd7} : hold <= 'b00000;
				{32'd19,3'd0} : hold <= 'b01110;
				{32'd19,3'd1} : hold <= 'b10001;
				{32'd19,3'd2} : hold <= 'b10000;
				{32'd19,3'd3} : hold <= 'b01100;
				{32'd19,3'd4} : hold <= 'b10000;
				{32'd19,3'd5} : hold <= 'b10001;
				{32'd19,3'd6} : hold <= 'b01110;
				{32'd19,3'd7} : hold <= 'b00000;
				{32'd20,3'd0} : hold <= 'b01001;
				{32'd20,3'd1} : hold <= 'b01001;
				{32'd20,3'd2} : hold <= 'b01001;
				{32'd20,3'd3} : hold <= 'b11111;
				{32'd20,3'd4} : hold <= 'b01000;
				{32'd20,3'd5} : hold <= 'b01000;
				{32'd20,3'd6} : hold <= 'b01000;
				{32'd20,3'd7} : hold <= 'b00000;
				{32'd21,3'd0} : hold <= 'b11111;
				{32'd21,3'd1} : hold <= 'b00001;
				{32'd21,3'd2} : hold <= 'b01111;
				{32'd21,3'd3} : hold <= 'b10001;
				{32'd21,3'd4} : hold <= 'b10000;
				{32'd21,3'd5} : hold <= 'b10001;
				{32'd21,3'd6} : hold <= 'b01110;
				{32'd21,3'd7} : hold <= 'b00000;
				{32'd22,3'd0} : hold <= 'b01110;
				{32'd22,3'd1} : hold <= 'b10001;
				{32'd22,3'd2} : hold <= 'b00001;
				{32'd22,3'd3} : hold <= 'b01111;
				{32'd22,3'd4} : hold <= 'b10001;
				{32'd22,3'd5} : hold <= 'b10001;
				{32'd22,3'd6} : hold <= 'b01110;
				{32'd22,3'd7} : hold <= 'b00000;
				{32'd23,3'd0} : hold <= 'b11111;
				{32'd23,3'd1} : hold <= 'b10000;
				{32'd23,3'd2} : hold <= 'b01000;
				{32'd23,3'd3} : hold <= 'b00100;
				{32'd23,3'd4} : hold <= 'b00100;
				{32'd23,3'd5} : hold <= 'b00100;
				{32'd23,3'd6} : hold <= 'b00100;
				{32'd23,3'd7} : hold <= 'b00000;
				{32'd24,3'd0} : hold <= 'b01110;
				{32'd24,3'd1} : hold <= 'b10001;
				{32'd24,3'd2} : hold <= 'b10001;
				{32'd24,3'd3} : hold <= 'b01110;
				{32'd24,3'd4} : hold <= 'b10001;
				{32'd24,3'd5} : hold <= 'b10001;
				{32'd24,3'd6} : hold <= 'b01110;
				{32'd24,3'd7} : hold <= 'b00000;
				{32'd25,3'd0} : hold <= 'b01110;
				{32'd25,3'd1} : hold <= 'b10001;
				{32'd25,3'd2} : hold <= 'b10001;
				{32'd25,3'd3} : hold <= 'b11110;
				{32'd25,3'd4} : hold <= 'b10000;
				{32'd25,3'd5} : hold <= 'b10001;
				{32'd25,3'd6} : hold <= 'b01110;
				{32'd25,3'd7} : hold <= 'b00000;
				{32'd26,3'd0} : hold <= 'b00000;
				{32'd26,3'd1} : hold <= 'b00110;
				{32'd26,3'd2} : hold <= 'b00110;
				{32'd26,3'd3} : hold <= 'b00000;
				{32'd26,3'd4} : hold <= 'b00110;
				{32'd26,3'd5} : hold <= 'b00110;
				{32'd26,3'd6} : hold <= 'b00000;
				{32'd26,3'd7} : hold <= 'b00000;
				{32'd27,3'd0} : hold <= 'b00000;
				{32'd27,3'd1} : hold <= 'b00110;
				{32'd27,3'd2} : hold <= 'b00110;
				{32'd27,3'd3} : hold <= 'b00000;
				{32'd27,3'd4} : hold <= 'b00110;
				{32'd27,3'd5} : hold <= 'b00100;
				{32'd27,3'd6} : hold <= 'b00010;
				{32'd27,3'd7} : hold <= 'b00000;
				{32'd28,3'd0} : hold <= 'b01000;
				{32'd28,3'd1} : hold <= 'b00100;
				{32'd28,3'd2} : hold <= 'b00010;
				{32'd28,3'd3} : hold <= 'b00001;
				{32'd28,3'd4} : hold <= 'b00010;
				{32'd28,3'd5} : hold <= 'b00100;
				{32'd28,3'd6} : hold <= 'b01000;
				{32'd28,3'd7} : hold <= 'b00000;
				{32'd29,3'd0} : hold <= 'b00000;
				{32'd29,3'd1} : hold <= 'b00000;
				{32'd29,3'd2} : hold <= 'b11111;
				{32'd29,3'd3} : hold <= 'b00000;
				{32'd29,3'd4} : hold <= 'b11111;
				{32'd29,3'd5} : hold <= 'b00000;
				{32'd29,3'd6} : hold <= 'b00000;
				{32'd29,3'd7} : hold <= 'b00000;
				{32'd30,3'd0} : hold <= 'b00010;
				{32'd30,3'd1} : hold <= 'b00100;
				{32'd30,3'd2} : hold <= 'b01000;
				{32'd30,3'd3} : hold <= 'b10000;
				{32'd30,3'd4} : hold <= 'b01000;
				{32'd30,3'd5} : hold <= 'b00100;
				{32'd30,3'd6} : hold <= 'b00010;
				{32'd30,3'd7} : hold <= 'b00000;
				{32'd31,3'd0} : hold <= 'b01110;
				{32'd31,3'd1} : hold <= 'b10001;
				{32'd31,3'd2} : hold <= 'b10000;
				{32'd31,3'd3} : hold <= 'b01000;
				{32'd31,3'd4} : hold <= 'b00100;
				{32'd31,3'd5} : hold <= 'b00000;
				{32'd31,3'd6} : hold <= 'b00100;
				{32'd31,3'd7} : hold <= 'b00000;
				{32'd32,3'd0} : hold <= 'b01110;
				{32'd32,3'd1} : hold <= 'b10001;
				{32'd32,3'd2} : hold <= 'b10000;
				{32'd32,3'd3} : hold <= 'b10110;
				{32'd32,3'd4} : hold <= 'b10101;
				{32'd32,3'd5} : hold <= 'b10101;
				{32'd32,3'd6} : hold <= 'b01110;
				{32'd32,3'd7} : hold <= 'b00000;
				{32'd33,3'd0} : hold <= 'b01110;
				{32'd33,3'd1} : hold <= 'b10001;
				{32'd33,3'd2} : hold <= 'b10001;
				{32'd33,3'd3} : hold <= 'b11111;
				{32'd33,3'd4} : hold <= 'b10001;
				{32'd33,3'd5} : hold <= 'b10001;
				{32'd33,3'd6} : hold <= 'b10001;
				{32'd33,3'd7} : hold <= 'b00000;
				{32'd34,3'd0} : hold <= 'b01111;
				{32'd34,3'd1} : hold <= 'b10001;
				{32'd34,3'd2} : hold <= 'b10001;
				{32'd34,3'd3} : hold <= 'b01111;
				{32'd34,3'd4} : hold <= 'b10001;
				{32'd34,3'd5} : hold <= 'b10001;
				{32'd34,3'd6} : hold <= 'b01111;
				{32'd34,3'd7} : hold <= 'b00000;
				{32'd35,3'd0} : hold <= 'b01110;
				{32'd35,3'd1} : hold <= 'b10001;
				{32'd35,3'd2} : hold <= 'b00001;
				{32'd35,3'd3} : hold <= 'b00001;
				{32'd35,3'd4} : hold <= 'b00001;
				{32'd35,3'd5} : hold <= 'b10001;
				{32'd35,3'd6} : hold <= 'b01110;
				{32'd35,3'd7} : hold <= 'b00000;
				{32'd36,3'd0} : hold <= 'b01111;
				{32'd36,3'd1} : hold <= 'b10001;
				{32'd36,3'd2} : hold <= 'b10001;
				{32'd36,3'd3} : hold <= 'b10001;
				{32'd36,3'd4} : hold <= 'b10001;
				{32'd36,3'd5} : hold <= 'b10001;
				{32'd36,3'd6} : hold <= 'b01111;
				{32'd36,3'd7} : hold <= 'b00000;
				{32'd37,3'd0} : hold <= 'b11111;
				{32'd37,3'd1} : hold <= 'b00001;
				{32'd37,3'd2} : hold <= 'b00001;
				{32'd37,3'd3} : hold <= 'b01111;
				{32'd37,3'd4} : hold <= 'b00001;
				{32'd37,3'd5} : hold <= 'b00001;
				{32'd37,3'd6} : hold <= 'b11111;
				{32'd37,3'd7} : hold <= 'b00000;
				{32'd38,3'd0} : hold <= 'b11111;
				{32'd38,3'd1} : hold <= 'b00001;
				{32'd38,3'd2} : hold <= 'b00001;
				{32'd38,3'd3} : hold <= 'b01111;
				{32'd38,3'd4} : hold <= 'b00001;
				{32'd38,3'd5} : hold <= 'b00001;
				{32'd38,3'd6} : hold <= 'b00001;
				{32'd38,3'd7} : hold <= 'b00000;
				{32'd39,3'd0} : hold <= 'b01110;
				{32'd39,3'd1} : hold <= 'b10001;
				{32'd39,3'd2} : hold <= 'b00001;
				{32'd39,3'd3} : hold <= 'b11101;
				{32'd39,3'd4} : hold <= 'b10001;
				{32'd39,3'd5} : hold <= 'b10001;
				{32'd39,3'd6} : hold <= 'b01110;
				{32'd39,3'd7} : hold <= 'b00000;
				{32'd40,3'd0} : hold <= 'b10001;
				{32'd40,3'd1} : hold <= 'b10001;
				{32'd40,3'd2} : hold <= 'b10001;
				{32'd40,3'd3} : hold <= 'b11111;
				{32'd40,3'd4} : hold <= 'b10001;
				{32'd40,3'd5} : hold <= 'b10001;
				{32'd40,3'd6} : hold <= 'b10001;
				{32'd40,3'd7} : hold <= 'b00000;
				{32'd41,3'd0} : hold <= 'b11111;
				{32'd41,3'd1} : hold <= 'b00100;
				{32'd41,3'd2} : hold <= 'b00100;
				{32'd41,3'd3} : hold <= 'b00100;
				{32'd41,3'd4} : hold <= 'b00100;
				{32'd41,3'd5} : hold <= 'b00100;
				{32'd41,3'd6} : hold <= 'b11111;
				{32'd41,3'd7} : hold <= 'b00000;
				{32'd42,3'd0} : hold <= 'b11110;
				{32'd42,3'd1} : hold <= 'b01000;
				{32'd42,3'd2} : hold <= 'b01000;
				{32'd42,3'd3} : hold <= 'b01000;
				{32'd42,3'd4} : hold <= 'b01000;
				{32'd42,3'd5} : hold <= 'b01001;
				{32'd42,3'd6} : hold <= 'b00110;
				{32'd42,3'd7} : hold <= 'b00000;
				{32'd43,3'd0} : hold <= 'b10001;
				{32'd43,3'd1} : hold <= 'b01001;
				{32'd43,3'd2} : hold <= 'b00101;
				{32'd43,3'd3} : hold <= 'b00011;
				{32'd43,3'd4} : hold <= 'b00101;
				{32'd43,3'd5} : hold <= 'b01001;
				{32'd43,3'd6} : hold <= 'b10001;
				{32'd43,3'd7} : hold <= 'b00000;
				{32'd44,3'd0} : hold <= 'b00001;
				{32'd44,3'd1} : hold <= 'b00001;
				{32'd44,3'd2} : hold <= 'b00001;
				{32'd44,3'd3} : hold <= 'b00001;
				{32'd44,3'd4} : hold <= 'b00001;
				{32'd44,3'd5} : hold <= 'b00001;
				{32'd44,3'd6} : hold <= 'b11111;
				{32'd44,3'd7} : hold <= 'b00000;
				{32'd45,3'd0} : hold <= 'b10001;
				{32'd45,3'd1} : hold <= 'b10001;
				{32'd45,3'd2} : hold <= 'b11011;
				{32'd45,3'd3} : hold <= 'b10101;
				{32'd45,3'd4} : hold <= 'b10001;
				{32'd45,3'd5} : hold <= 'b10001;
				{32'd45,3'd6} : hold <= 'b10001;
				{32'd45,3'd7} : hold <= 'b00000;
				{32'd46,3'd0} : hold <= 'b10001;
				{32'd46,3'd1} : hold <= 'b10001;
				{32'd46,3'd2} : hold <= 'b10011;
				{32'd46,3'd3} : hold <= 'b10101;
				{32'd46,3'd4} : hold <= 'b11001;
				{32'd46,3'd5} : hold <= 'b10001;
				{32'd46,3'd6} : hold <= 'b10001;
				{32'd46,3'd7} : hold <= 'b00000;
				{32'd47,3'd0} : hold <= 'b01110;
				{32'd47,3'd1} : hold <= 'b10001;
				{32'd47,3'd2} : hold <= 'b10001;
				{32'd47,3'd3} : hold <= 'b10001;
				{32'd47,3'd4} : hold <= 'b10001;
				{32'd47,3'd5} : hold <= 'b10001;
				{32'd47,3'd6} : hold <= 'b01110;
				{32'd47,3'd7} : hold <= 'b00000;
				{32'd48,3'd0} : hold <= 'b01111;
				{32'd48,3'd1} : hold <= 'b10001;
				{32'd48,3'd2} : hold <= 'b10001;
				{32'd48,3'd3} : hold <= 'b01111;
				{32'd48,3'd4} : hold <= 'b00001;
				{32'd48,3'd5} : hold <= 'b00001;
				{32'd48,3'd6} : hold <= 'b00001;
				{32'd48,3'd7} : hold <= 'b00000;
				{32'd49,3'd0} : hold <= 'b01110;
				{32'd49,3'd1} : hold <= 'b10001;
				{32'd49,3'd2} : hold <= 'b10001;
				{32'd49,3'd3} : hold <= 'b10001;
				{32'd49,3'd4} : hold <= 'b10101;
				{32'd49,3'd5} : hold <= 'b01001;
				{32'd49,3'd6} : hold <= 'b10110;
				{32'd49,3'd7} : hold <= 'b00000;
				{32'd50,3'd0} : hold <= 'b01111;
				{32'd50,3'd1} : hold <= 'b10001;
				{32'd50,3'd2} : hold <= 'b10001;
				{32'd50,3'd3} : hold <= 'b01111;
				{32'd50,3'd4} : hold <= 'b00101;
				{32'd50,3'd5} : hold <= 'b01001;
				{32'd50,3'd6} : hold <= 'b10001;
				{32'd50,3'd7} : hold <= 'b00000;
				{32'd51,3'd0} : hold <= 'b01110;
				{32'd51,3'd1} : hold <= 'b10001;
				{32'd51,3'd2} : hold <= 'b00001;
				{32'd51,3'd3} : hold <= 'b01110;
				{32'd51,3'd4} : hold <= 'b10000;
				{32'd51,3'd5} : hold <= 'b10001;
				{32'd51,3'd6} : hold <= 'b01110;
				{32'd51,3'd7} : hold <= 'b00000;
				{32'd52,3'd0} : hold <= 'b11111;
				{32'd52,3'd1} : hold <= 'b00100;
				{32'd52,3'd2} : hold <= 'b00100;
				{32'd52,3'd3} : hold <= 'b00100;
				{32'd52,3'd4} : hold <= 'b00100;
				{32'd52,3'd5} : hold <= 'b00100;
				{32'd52,3'd6} : hold <= 'b00100;
				{32'd52,3'd7} : hold <= 'b00000;
				{32'd53,3'd0} : hold <= 'b10001;
				{32'd53,3'd1} : hold <= 'b10001;
				{32'd53,3'd2} : hold <= 'b10001;
				{32'd53,3'd3} : hold <= 'b10001;
				{32'd53,3'd4} : hold <= 'b10001;
				{32'd53,3'd5} : hold <= 'b10001;
				{32'd53,3'd6} : hold <= 'b01110;
				{32'd53,3'd7} : hold <= 'b00000;
				{32'd54,3'd0} : hold <= 'b10001;
				{32'd54,3'd1} : hold <= 'b10001;
				{32'd54,3'd2} : hold <= 'b10001;
				{32'd54,3'd3} : hold <= 'b10001;
				{32'd54,3'd4} : hold <= 'b10001;
				{32'd54,3'd5} : hold <= 'b01010;
				{32'd54,3'd6} : hold <= 'b00100;
				{32'd54,3'd7} : hold <= 'b00000;
				{32'd55,3'd0} : hold <= 'b10001;
				{32'd55,3'd1} : hold <= 'b10001;
				{32'd55,3'd2} : hold <= 'b10001;
				{32'd55,3'd3} : hold <= 'b10101;
				{32'd55,3'd4} : hold <= 'b11011;
				{32'd55,3'd5} : hold <= 'b10001;
				{32'd55,3'd6} : hold <= 'b10001;
				{32'd55,3'd7} : hold <= 'b00000;
				{32'd56,3'd0} : hold <= 'b10001;
				{32'd56,3'd1} : hold <= 'b10001;
				{32'd56,3'd2} : hold <= 'b01010;
				{32'd56,3'd3} : hold <= 'b00100;
				{32'd56,3'd4} : hold <= 'b01010;
				{32'd56,3'd5} : hold <= 'b10001;
				{32'd56,3'd6} : hold <= 'b10001;
				{32'd56,3'd7} : hold <= 'b00000;
				{32'd57,3'd0} : hold <= 'b10001;
				{32'd57,3'd1} : hold <= 'b10001;
				{32'd57,3'd2} : hold <= 'b01010;
				{32'd57,3'd3} : hold <= 'b00100;
				{32'd57,3'd4} : hold <= 'b00100;
				{32'd57,3'd5} : hold <= 'b00100;
				{32'd57,3'd6} : hold <= 'b00100;
				{32'd57,3'd7} : hold <= 'b00000;
				{32'd58,3'd0} : hold <= 'b11111;
				{32'd58,3'd1} : hold <= 'b10000;
				{32'd58,3'd2} : hold <= 'b01000;
				{32'd58,3'd3} : hold <= 'b00100;
				{32'd58,3'd4} : hold <= 'b00010;
				{32'd58,3'd5} : hold <= 'b00001;
				{32'd58,3'd6} : hold <= 'b11111;
				{32'd58,3'd7} : hold <= 'b00000;
				{32'd59,3'd0} : hold <= 'b01110;
				{32'd59,3'd1} : hold <= 'b00010;
				{32'd59,3'd2} : hold <= 'b00010;
				{32'd59,3'd3} : hold <= 'b00010;
				{32'd59,3'd4} : hold <= 'b00010;
				{32'd59,3'd5} : hold <= 'b00010;
				{32'd59,3'd6} : hold <= 'b01110;
				{32'd59,3'd7} : hold <= 'b00000;
				{32'd60,3'd0} : hold <= 'b00001;
				{32'd60,3'd1} : hold <= 'b00001;
				{32'd60,3'd2} : hold <= 'b00010;
				{32'd60,3'd3} : hold <= 'b00100;
				{32'd60,3'd4} : hold <= 'b01000;
				{32'd60,3'd5} : hold <= 'b10000;
				{32'd60,3'd6} : hold <= 'b10000;
				{32'd60,3'd7} : hold <= 'b00000;
				{32'd61,3'd0} : hold <= 'b01110;
				{32'd61,3'd1} : hold <= 'b01000;
				{32'd61,3'd2} : hold <= 'b01000;
				{32'd61,3'd3} : hold <= 'b01000;
				{32'd61,3'd4} : hold <= 'b01000;
				{32'd61,3'd5} : hold <= 'b01000;
				{32'd61,3'd6} : hold <= 'b01110;
				{32'd61,3'd7} : hold <= 'b00000;
				{32'd62,3'd0} : hold <= 'b00100;
				{32'd62,3'd1} : hold <= 'b01010;
				{32'd62,3'd2} : hold <= 'b10001;
				{32'd62,3'd3} : hold <= 'b00000;
				{32'd62,3'd4} : hold <= 'b00000;
				{32'd62,3'd5} : hold <= 'b00000;
				{32'd62,3'd6} : hold <= 'b00000;
				{32'd62,3'd7} : hold <= 'b00000;
				{32'd63,3'd0} : hold <= 'b00000;
				{32'd63,3'd1} : hold <= 'b00000;
				{32'd63,3'd2} : hold <= 'b00000;
				{32'd63,3'd3} : hold <= 'b00000;
				{32'd63,3'd4} : hold <= 'b00000;
				{32'd63,3'd5} : hold <= 'b00000;
				{32'd63,3'd6} : hold <= 'b11111;
				{32'd63,3'd7} : hold <= 'b00000;
				{32'd64,3'd0} : hold <= 'b00010;
				{32'd64,3'd1} : hold <= 'b00100;
				{32'd64,3'd2} : hold <= 'b00000;
				{32'd64,3'd3} : hold <= 'b00000;
				{32'd64,3'd4} : hold <= 'b00000;
				{32'd64,3'd5} : hold <= 'b00000;
				{32'd64,3'd6} : hold <= 'b00000;
				{32'd64,3'd7} : hold <= 'b00000;
				{32'd65,3'd0} : hold <= 'b00000;
				{32'd65,3'd1} : hold <= 'b00000;
				{32'd65,3'd2} : hold <= 'b01100;
				{32'd65,3'd3} : hold <= 'b10000;
				{32'd65,3'd4} : hold <= 'b11100;
				{32'd65,3'd5} : hold <= 'b10010;
				{32'd65,3'd6} : hold <= 'b11100;
				{32'd65,3'd7} : hold <= 'b00000;
				{32'd66,3'd0} : hold <= 'b00010;
				{32'd66,3'd1} : hold <= 'b00010;
				{32'd66,3'd2} : hold <= 'b00010;
				{32'd66,3'd3} : hold <= 'b01110;
				{32'd66,3'd4} : hold <= 'b10010;
				{32'd66,3'd5} : hold <= 'b10010;
				{32'd66,3'd6} : hold <= 'b01110;
				{32'd66,3'd7} : hold <= 'b00000;
				{32'd67,3'd0} : hold <= 'b00000;
				{32'd67,3'd1} : hold <= 'b00000;
				{32'd67,3'd2} : hold <= 'b01100;
				{32'd67,3'd3} : hold <= 'b00010;
				{32'd67,3'd4} : hold <= 'b00010;
				{32'd67,3'd5} : hold <= 'b00010;
				{32'd67,3'd6} : hold <= 'b01100;
				{32'd67,3'd7} : hold <= 'b00000;
				{32'd68,3'd0} : hold <= 'b01000;
				{32'd68,3'd1} : hold <= 'b01000;
				{32'd68,3'd2} : hold <= 'b01000;
				{32'd68,3'd3} : hold <= 'b01110;
				{32'd68,3'd4} : hold <= 'b01001;
				{32'd68,3'd5} : hold <= 'b01001;
				{32'd68,3'd6} : hold <= 'b01110;
				{32'd68,3'd7} : hold <= 'b00000;
				{32'd69,3'd0} : hold <= 'b00000;
				{32'd69,3'd1} : hold <= 'b00000;
				{32'd69,3'd2} : hold <= 'b01100;
				{32'd69,3'd3} : hold <= 'b10010;
				{32'd69,3'd4} : hold <= 'b11110;
				{32'd69,3'd5} : hold <= 'b00010;
				{32'd69,3'd6} : hold <= 'b01100;
				{32'd69,3'd7} : hold <= 'b00000;
				{32'd70,3'd0} : hold <= 'b01100;
				{32'd70,3'd1} : hold <= 'b10010;
				{32'd70,3'd2} : hold <= 'b00010;
				{32'd70,3'd3} : hold <= 'b00111;
				{32'd70,3'd4} : hold <= 'b00010;
				{32'd70,3'd5} : hold <= 'b00010;
				{32'd70,3'd6} : hold <= 'b00010;
				{32'd70,3'd7} : hold <= 'b00000;
				{32'd71,3'd0} : hold <= 'b00000;
				{32'd71,3'd1} : hold <= 'b01110;
				{32'd71,3'd2} : hold <= 'b01001;
				{32'd71,3'd3} : hold <= 'b01001;
				{32'd71,3'd4} : hold <= 'b01110;
				{32'd71,3'd5} : hold <= 'b01000;
				{32'd71,3'd6} : hold <= 'b00110;
				{32'd71,3'd7} : hold <= 'b00000;
				{32'd72,3'd0} : hold <= 'b00010;
				{32'd72,3'd1} : hold <= 'b00010;
				{32'd72,3'd2} : hold <= 'b00010;
				{32'd72,3'd3} : hold <= 'b01110;
				{32'd72,3'd4} : hold <= 'b10010;
				{32'd72,3'd5} : hold <= 'b10010;
				{32'd72,3'd6} : hold <= 'b10010;
				{32'd72,3'd7} : hold <= 'b00000;
				{32'd73,3'd0} : hold <= 'b00000;
				{32'd73,3'd1} : hold <= 'b00100;
				{32'd73,3'd2} : hold <= 'b00000;
				{32'd73,3'd3} : hold <= 'b00100;
				{32'd73,3'd4} : hold <= 'b00100;
				{32'd73,3'd5} : hold <= 'b00100;
				{32'd73,3'd6} : hold <= 'b00100;
				{32'd73,3'd7} : hold <= 'b00000;
				{32'd74,3'd0} : hold <= 'b00000;
				{32'd74,3'd1} : hold <= 'b00100;
				{32'd74,3'd2} : hold <= 'b00000;
				{32'd74,3'd3} : hold <= 'b00100;
				{32'd74,3'd4} : hold <= 'b00100;
				{32'd74,3'd5} : hold <= 'b00101;
				{32'd74,3'd6} : hold <= 'b00010;
				{32'd74,3'd7} : hold <= 'b00000;
				{32'd75,3'd0} : hold <= 'b00010;
				{32'd75,3'd1} : hold <= 'b00010;
				{32'd75,3'd2} : hold <= 'b10010;
				{32'd75,3'd3} : hold <= 'b01010;
				{32'd75,3'd4} : hold <= 'b00110;
				{32'd75,3'd5} : hold <= 'b01010;
				{32'd75,3'd6} : hold <= 'b10010;
				{32'd75,3'd7} : hold <= 'b00000;
				{32'd76,3'd0} : hold <= 'b00110;
				{32'd76,3'd1} : hold <= 'b00100;
				{32'd76,3'd2} : hold <= 'b00100;
				{32'd76,3'd3} : hold <= 'b00100;
				{32'd76,3'd4} : hold <= 'b00100;
				{32'd76,3'd5} : hold <= 'b00100;
				{32'd76,3'd6} : hold <= 'b01000;
				{32'd76,3'd7} : hold <= 'b00000;
				{32'd77,3'd0} : hold <= 'b00000;
				{32'd77,3'd1} : hold <= 'b00000;
				{32'd77,3'd2} : hold <= 'b01011;
				{32'd77,3'd3} : hold <= 'b10101;
				{32'd77,3'd4} : hold <= 'b10101;
				{32'd77,3'd5} : hold <= 'b10101;
				{32'd77,3'd6} : hold <= 'b10101;
				{32'd77,3'd7} : hold <= 'b00000;
				{32'd78,3'd0} : hold <= 'b00000;
				{32'd78,3'd1} : hold <= 'b00000;
				{32'd78,3'd2} : hold <= 'b01110;
				{32'd78,3'd3} : hold <= 'b10010;
				{32'd78,3'd4} : hold <= 'b10010;
				{32'd78,3'd5} : hold <= 'b10010;
				{32'd78,3'd6} : hold <= 'b10010;
				{32'd78,3'd7} : hold <= 'b00000;
				{32'd79,3'd0} : hold <= 'b00000;
				{32'd79,3'd1} : hold <= 'b00000;
				{32'd79,3'd2} : hold <= 'b01110;
				{32'd79,3'd3} : hold <= 'b10001;
				{32'd79,3'd4} : hold <= 'b10001;
				{32'd79,3'd5} : hold <= 'b10001;
				{32'd79,3'd6} : hold <= 'b01110;
				{32'd79,3'd7} : hold <= 'b00000;
				{32'd80,3'd0} : hold <= 'b00000;
				{32'd80,3'd1} : hold <= 'b01110;
				{32'd80,3'd2} : hold <= 'b10010;
				{32'd80,3'd3} : hold <= 'b01110;
				{32'd80,3'd4} : hold <= 'b00010;
				{32'd80,3'd5} : hold <= 'b00010;
				{32'd80,3'd6} : hold <= 'b00010;
				{32'd80,3'd7} : hold <= 'b00000;
				{32'd81,3'd0} : hold <= 'b00000;
				{32'd81,3'd1} : hold <= 'b01110;
				{32'd81,3'd2} : hold <= 'b01001;
				{32'd81,3'd3} : hold <= 'b01110;
				{32'd81,3'd4} : hold <= 'b01000;
				{32'd81,3'd5} : hold <= 'b01000;
				{32'd81,3'd6} : hold <= 'b11000;
				{32'd81,3'd7} : hold <= 'b00000;
				{32'd82,3'd0} : hold <= 'b00000;
				{32'd82,3'd1} : hold <= 'b00000;
				{32'd82,3'd2} : hold <= 'b01110;
				{32'd82,3'd3} : hold <= 'b10010;
				{32'd82,3'd4} : hold <= 'b00010;
				{32'd82,3'd5} : hold <= 'b00010;
				{32'd82,3'd6} : hold <= 'b00010;
				{32'd82,3'd7} : hold <= 'b00000;
				{32'd83,3'd0} : hold <= 'b00000;
				{32'd83,3'd1} : hold <= 'b00000;
				{32'd83,3'd2} : hold <= 'b11100;
				{32'd83,3'd3} : hold <= 'b00010;
				{32'd83,3'd4} : hold <= 'b01100;
				{32'd83,3'd5} : hold <= 'b10000;
				{32'd83,3'd6} : hold <= 'b01110;
				{32'd83,3'd7} : hold <= 'b00000;
				{32'd84,3'd0} : hold <= 'b00000;
				{32'd84,3'd1} : hold <= 'b00100;
				{32'd84,3'd2} : hold <= 'b01110;
				{32'd84,3'd3} : hold <= 'b00100;
				{32'd84,3'd4} : hold <= 'b00100;
				{32'd84,3'd5} : hold <= 'b00100;
				{32'd84,3'd6} : hold <= 'b01000;
				{32'd84,3'd7} : hold <= 'b00000;
				{32'd85,3'd0} : hold <= 'b00000;
				{32'd85,3'd1} : hold <= 'b00000;
				{32'd85,3'd2} : hold <= 'b00000;
				{32'd85,3'd3} : hold <= 'b01001;
				{32'd85,3'd4} : hold <= 'b01001;
				{32'd85,3'd5} : hold <= 'b01001;
				{32'd85,3'd6} : hold <= 'b01110;
				{32'd85,3'd7} : hold <= 'b00000;
				{32'd86,3'd0} : hold <= 'b00000;
				{32'd86,3'd1} : hold <= 'b00000;
				{32'd86,3'd2} : hold <= 'b00000;
				{32'd86,3'd3} : hold <= 'b10001;
				{32'd86,3'd4} : hold <= 'b10001;
				{32'd86,3'd5} : hold <= 'b01010;
				{32'd86,3'd6} : hold <= 'b00100;
				{32'd86,3'd7} : hold <= 'b00000;
				{32'd87,3'd0} : hold <= 'b00000;
				{32'd87,3'd1} : hold <= 'b00000;
				{32'd87,3'd2} : hold <= 'b00000;
				{32'd87,3'd3} : hold <= 'b10001;
				{32'd87,3'd4} : hold <= 'b10001;
				{32'd87,3'd5} : hold <= 'b10101;
				{32'd87,3'd6} : hold <= 'b01010;
				{32'd87,3'd7} : hold <= 'b00000;
				{32'd88,3'd0} : hold <= 'b00000;
				{32'd88,3'd1} : hold <= 'b00000;
				{32'd88,3'd2} : hold <= 'b10001;
				{32'd88,3'd3} : hold <= 'b01010;
				{32'd88,3'd4} : hold <= 'b00100;
				{32'd88,3'd5} : hold <= 'b01010;
				{32'd88,3'd6} : hold <= 'b10001;
				{32'd88,3'd7} : hold <= 'b00000;
				{32'd89,3'd0} : hold <= 'b00000;
				{32'd89,3'd1} : hold <= 'b00000;
				{32'd89,3'd2} : hold <= 'b10010;
				{32'd89,3'd3} : hold <= 'b10010;
				{32'd89,3'd4} : hold <= 'b10100;
				{32'd89,3'd5} : hold <= 'b01000;
				{32'd89,3'd6} : hold <= 'b00110;
				{32'd89,3'd7} : hold <= 'b00000;
				{32'd90,3'd0} : hold <= 'b00000;
				{32'd90,3'd1} : hold <= 'b00000;
				{32'd90,3'd2} : hold <= 'b11111;
				{32'd90,3'd3} : hold <= 'b01000;
				{32'd90,3'd4} : hold <= 'b00100;
				{32'd90,3'd5} : hold <= 'b00010;
				{32'd90,3'd6} : hold <= 'b11111;
				{32'd90,3'd7} : hold <= 'b00000;
				{32'd91,3'd0} : hold <= 'b01100;
				{32'd91,3'd1} : hold <= 'b00010;
				{32'd91,3'd2} : hold <= 'b00010;
				{32'd91,3'd3} : hold <= 'b00001;
				{32'd91,3'd4} : hold <= 'b00010;
				{32'd91,3'd5} : hold <= 'b00010;
				{32'd91,3'd6} : hold <= 'b01100;
				{32'd91,3'd7} : hold <= 'b00000;
				{32'd92,3'd0} : hold <= 'b00100;
				{32'd92,3'd1} : hold <= 'b00100;
				{32'd92,3'd2} : hold <= 'b00100;
				{32'd92,3'd3} : hold <= 'b00100;
				{32'd92,3'd4} : hold <= 'b00100;
				{32'd92,3'd5} : hold <= 'b00100;
				{32'd92,3'd6} : hold <= 'b00100;
				{32'd92,3'd7} : hold <= 'b00000;
				{32'd93,3'd0} : hold <= 'b00110;
				{32'd93,3'd1} : hold <= 'b01000;
				{32'd93,3'd2} : hold <= 'b01000;
				{32'd93,3'd3} : hold <= 'b10000;
				{32'd93,3'd4} : hold <= 'b01000;
				{32'd93,3'd5} : hold <= 'b01000;
				{32'd93,3'd6} : hold <= 'b00110;
				{32'd93,3'd7} : hold <= 'b00000;
				{32'd94,3'd0} : hold <= 'b00010;
				{32'd94,3'd1} : hold <= 'b10101;
				{32'd94,3'd2} : hold <= 'b01000;
				{32'd94,3'd3} : hold <= 'b00000;
				{32'd94,3'd4} : hold <= 'b00000;
				{32'd94,3'd5} : hold <= 'b00000;
				{32'd94,3'd6} : hold <= 'b00000;
				{32'd94,3'd7} : hold <= 'b00000;
				{32'd95,3'd0} : hold <= 'b00000;
				{32'd95,3'd1} : hold <= 'b00000;
				{32'd95,3'd2} : hold <= 'b00000;
				{32'd95,3'd3} : hold <= 'b00000;
				{32'd95,3'd4} : hold <= 'b00000;
				{32'd95,3'd5} : hold <= 'b00000;
				{32'd95,3'd6} : hold <= 'b00000;
				{32'd95,3'd7} : hold <= 'b00000;
				default:		hold <= 'b00000;
			endcase
		end
	end
endmodule