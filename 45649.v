module Mod_Teste(
	input CLOCK_27,
	input CLOCK_50,
	input [3:0] KEY,
	input [17:0] SW,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7,
	output [8:0] LEDG,
	output [17:0]	LEDR,
	output			LCD_ON,		//	LCD Power ON/OFF
	output			LCD_BLON,	//	LCD Back Light ON/OFF
	output			LCD_RW,		//	LCD Read/Write Select, 0 = Write, 1 = Read
	output			LCD_EN,		//	LCD Enable
	output			LCD_RS,		//	LCD Command/Data Select, 0 = Command, 1 = Data
	inout  [7:0]	LCD_DATA,	//	LCD Data bus 8 bits
	inout  [35:0]	GPIO_0,		//	GPIO Connection 0
	inout  [35:0]	GPIO_1
);
assign	GPIO_1		=	36'hzzzzzzzzz;
assign	GPIO_0		=	36'hzzzzzzzzz;
//	LCD
assign	LCD_ON		=	1'b1;
assign	LCD_BLON	=	1'b1;
LCD_TEST LCD0	(
	//	Host Side
	.iCLK  	( CLOCK_50 ),
	.iRST_N	( KEY[0] ),
	// Data to display
	.d0(CONST_bus),		// 4 dígitos canto superior esquerdo
	.d1(),					// 4 dígitos superior meio
	.d2(CONST_bus),		// 4 dígitos canto superior direito
	.d3(ADDR_bus),			// 4 dígitos canto inferior esquerdo
	.d4(DATA_bus),			// 4 dígitos inferior meio
	.d5(D_bus_internal),	// 4 dígitos canto inferior direito
	//	LCD Side
	.LCD_DATA( LCD_DATA ),
	.LCD_RW( LCD_RW ),
	.LCD_EN( LCD_EN ),
	.LCD_RS( LCD_RS )
	);
parameter WORD_WIDTH = 16;
parameter DR_WIDTH = 3;
parameter OPCODE_WIDTH = 7;
parameter INSTR_WIDTH = WORD_WIDTH;
parameter CNTRL_WIDTH = 3*DR_WIDTH+11;
wire RST_key = KEY[0];
wire CLK_key = KEY[3];
//reg RST_key;
//reg CLK_key;
wire [WORD_WIDTH-1:0] ADDR_bus, DATA_bus, DATA_in_bus, CONST_bus, PC_out, INSTRM_out, D_bus_internal;
wire [CNTRL_WIDTH-1:0] CNTRL_bus;
wire [3:0] FLAG_bus;
assign DATA_in_bus = SW[17:3];
//assign LEDR = VIEWER_MUX_OUT[19:2];
//assign LEDG = VIEWER_MUX_OUT[1:0];
ControlUnit CU0(
	.CNTRL_out(CNTRL_bus),
	.CONST_out(CONST_bus),
	.PC_out(PC_out),
	.INSTRM_in(INSTRM_out),
	.JMPADDR_in(ADDR_bus),
	.FLAG_in(FLAG_bus),
	.RST_in(RST_key),
	.CLK_in(CLK_key)
	);
defparam CU0.WORD_WIDTH = WORD_WIDTH;
defparam CU0.DR_WIDTH = DR_WIDTH;
	InstructionMemory IM0(
	.INSTR_in(PC_out),
	.INSTR_out(INSTRM_out)
	);
defparam IM0.WORD_WIDTH = WORD_WIDTH;
defparam IM0.DR_WIDTH = DR_WIDTH;
Datapath DP0(
	.FLAG_out(FLAG_bus),
	.A_bus(ADDR_bus),
	.D_bus(DATA_bus),
	.D_bus_internal(D_bus_internal),
	.D_in(DATA_in_bus),
	.CNTRL_in(CNTRL_bus),
	.CONST_in(CONST_bus),
	.RST(RST_key),
	.CLK(CLK_key)
	);
defparam DP0.WORD_WIDTH = WORD_WIDTH;
defparam DP0.DR_WIDTH = DR_WIDTH;
/*
DataMemory DM0(
	.Data_out(DATA_in_bus),
	.Addr_in(ADDR_bus),
	.Data_in(DATA_bus),
	.CNTRL_in(CNTRL_bus)
	);
*/
/*
wire [3:0] VIEWER_MUX_OUT0;
wire [3:0] VIEWER_MUX_OUT1;
wire [3:0] VIEWER_MUX_OUT2;
wire [3:0] VIEWER_MUX_OUT3;
wire [3:0] VIEWER_MUX_OUT4;
reg [CNTRL_WIDTH-1:0] VIEWER_MUX_OUT;
assign VIEWER_MUX_OUT4 = VIEWER_MUX_OUT[19:16];
assign VIEWER_MUX_OUT3 = VIEWER_MUX_OUT[15:12];
assign VIEWER_MUX_OUT2 = VIEWER_MUX_OUT[11:8];
assign VIEWER_MUX_OUT1 = VIEWER_MUX_OUT[7:4];
assign VIEWER_MUX_OUT0 = VIEWER_MUX_OUT[3:0];
Decoder_Binary2HexSevenSegments B2H7S0(
	.out(HEX0),
	.in(VIEWER_MUX_OUT0)
	);
Decoder_Binary2HexSevenSegments B2H7S1(
	.out(HEX1),
	.in(VIEWER_MUX_OUT1)
	);
Decoder_Binary2HexSevenSegments B2H7S2(
	.out(HEX2),
	.in(VIEWER_MUX_OUT2)
	);
Decoder_Binary2HexSevenSegments B2H7S3(
	.out(HEX3),
	.in(VIEWER_MUX_OUT3)
	);
Decoder_Binary2HexSevenSegments B2H7S4(
	.out(HEX4),
	.in(VIEWER_MUX_OUT4)
	);
initial begin
	CLK_key <= 0;
	RST_key <= 1;
	repeat (50) begin
		#(5) CLK_key <= !CLK_key;
	end
end
initial begin
	#100 $finish;
end
always@(SW[2:0], DATA_in_bus, D_bus_internal, ADDR_bus, DATA_bus, CNTRL_bus, PC_out, INSTRM_out) begin
	case(SW[2:0])
		3'b000: VIEWER_MUX_OUT = DATA_in_bus;
		3'b001: VIEWER_MUX_OUT = D_bus_internal;
		3'b010: VIEWER_MUX_OUT = ADDR_bus;
		3'b011: VIEWER_MUX_OUT = DATA_bus;
		3'b100: VIEWER_MUX_OUT = CNTRL_bus;
		3'b101: VIEWER_MUX_OUT = PC_out;
		3'b110: VIEWER_MUX_OUT = INSTRM_out;
		//3'b111: VIEWER_MUX_OUT = INSTRM_out;
		default: VIEWER_MUX_OUT = D_bus_internal;
	endcase
end
*/
endmodule