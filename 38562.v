module Mod_Teste(
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7,
	output [8:0] LEDG,
	output [17:0] LEDR,
	output LCD_ON,
	output LCD_BLON,
	output LCD_RW,
	output LCD_EN,
	output LCD_RS,
	inout	[35:0] GPIO_0,
	inout	[35:0] GPIO_1,
	inout	[7:0]	LCD_DATA,
	input CLOCK_27,
	input CLOCK_50,
	input [3:0] KEY,
	input [17:0] SW
);
// GPIO
assign	GPIO_1		=	36'hzzzzzzzzz;
assign	GPIO_0		=	36'hzzzzzzzzz;
//	LCD
assign	LCD_ON	=	1'b1;
assign	LCD_BLON	=	1'b1;
assign LEDR[17:0] = CNTRL_bus[19:2];
assign LEDG[8:7] = CNTRL_bus[1:0];
assign LEDG[1:0] = {KEY[3],KEY[0]};
wire RST = KEY[0];
wire CLK = KEY[3];
parameter WORD_WIDTH = 16;
parameter DR_WIDTH = 3;
parameter SB_WIDTH = DR_WIDTH;
parameter SA_WIDTH = DR_WIDTH;
parameter OPCODE_WIDTH = 7;
parameter CNTRL_WIDTH = DR_WIDTH+SB_WIDTH+SA_WIDTH+11;
parameter COUNTER_WIDTH = 4;
parameter FLAG_WIDTH = 4;
Output_LiquidCyrstalDisplay_TestModule  LCD0 (
	.iCLK (CLOCK_50),
	.iRST_N (KEY[0]),
	.d0 (COUNTER_bus),
	.d1 (INSTR_bus),
	.d2 (CONST_bus),
	.d3 (ADDR_bus),
	.d4 (DATA_bus),
	.d5 (D_bus),
	.LCD_DATA (LCD_DATA),
	.LCD_RW (LCD_RW),
	.LCD_EN (LCD_EN),
	.LCD_RS (LCD_RS)
);
wire [CNTRL_WIDTH-1:0] CNTRL_bus;
Computer_ControlUnit_InstructionDecoder ID0 (
	.CNTRL_bus_out(CNTRL_bus),
	.INSTR_bus_in(INSTR_bus)
	);
defparam ID0.WORD_WIDTH = WORD_WIDTH;
defparam ID0.DR_WIDTH = DR_WIDTH;
defparam ID0.SB_WIDTH = DR_WIDTH;
defparam ID0.SA_WIDTH = DR_WIDTH;
defparam ID0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam ID0.CNTRL_WIDTH = CNTRL_WIDTH;
defparam ID0.COUNTER_WIDTH = COUNTER_WIDTH;
wire [WORD_WIDTH-1:0] INSTR_bus;
Computer_ControlUnit_InstructionMemory IM0 (
	.INSTR_out(INSTR_bus),
	.COUNTER_in(COUNTER_bus)
	);
defparam IM0.WORD_WIDTH = WORD_WIDTH;
defparam IM0.DR_WIDTH = DR_WIDTH;
defparam IM0.SB_WIDTH = DR_WIDTH;
defparam IM0.SA_WIDTH = DR_WIDTH;
defparam IM0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam IM0.CNTRL_WIDTH = CNTRL_WIDTH;
defparam IM0.COUNTER_WIDTH = COUNTER_WIDTH;
wire [WORD_WIDTH-1:0] COUNTER_bus;
Computer_ControlUnit_ProgramCounter PC0 (
	.COUNTER_out(COUNTER_bus),
	.JMPADDR_in(ADDR_bus),
	.CNTRL_bus_in(CNTRL_bus),
	.FLAG_bus_in(FLAG_bus),
	.SE_in(SE_bus),
	.CLK(CLK),
	.RST(RST)
	);
defparam PC0.WORD_WIDTH = WORD_WIDTH;
defparam PC0.DR_WIDTH = DR_WIDTH;
defparam PC0.SB_WIDTH = DR_WIDTH;
defparam PC0.SA_WIDTH = DR_WIDTH;
defparam PC0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam PC0.CNTRL_WIDTH = CNTRL_WIDTH;
defparam PC0.COUNTER_WIDTH = COUNTER_WIDTH;
wire [WORD_WIDTH-1:0] SE_bus;
Computer_ControlUnit_SignalExtensor SE0 (
	.SE_out(SE_bus),
	.INSTR_bus_in(INSTR_bus)
	);
defparam SE0.WORD_WIDTH = WORD_WIDTH;
defparam SE0.DR_WIDTH = DR_WIDTH;
defparam SE0.SB_WIDTH = DR_WIDTH;
defparam SE0.SA_WIDTH = DR_WIDTH;
defparam SE0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam SE0.CNTRL_WIDTH = CNTRL_WIDTH;
defparam SE0.COUNTER_WIDTH = COUNTER_WIDTH;
wire [WORD_WIDTH-1:0] CONST_bus;
Computer_ControlUnit_ZeroFiller ZF0 (
	.CONST_bus_out(CONST_bus),
	.INSTR_bus_in(INSTR_bus)
	);
defparam ZF0.WORD_WIDTH = WORD_WIDTH;
defparam ZF0.DR_WIDTH = DR_WIDTH;
defparam ZF0.SB_WIDTH = DR_WIDTH;
defparam ZF0.SA_WIDTH = DR_WIDTH;
defparam ZF0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam ZF0.CNTRL_WIDTH = CNTRL_WIDTH;
defparam ZF0.COUNTER_WIDTH = COUNTER_WIDTH;
wire [WORD_WIDTH-1:0] DMEM_out_bus = 16'b0;
/*
Computer_DataMemory DM0 (
	.DMEM_out(DMEM_out_bus),
	.ADDR_bus_in(ADDR_bus),
	.DATA_bus_in(DATA_bus),
	.CNTRL_bus_in(CNTRL_bus),
	.RST(RST)
	);
defparam DM0.WORD_WIDTH = WORD_WIDTH;
defparam DM0.DR_WIDTH = DR_WIDTH;
defparam DM0.SB_WIDTH = DR_WIDTH;
defparam DM0.SA_WIDTH = DR_WIDTH;
defparam DM0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam DM0.CNTRL_WIDTH = CNTRL_WIDTH;
defparam DM0.COUNTER_WIDTH = COUNTER_WIDTH;
*/
wire [WORD_WIDTH-1:0] DATA_bus;
Computer_Datapath_BusMuxer BM0 (
	.BUS_out(DATA_bus),
	.A_in(B_data_out_bus),
	.B_in(CONST_bus),
	.S(CNTRL_bus[10])
	);
defparam BM0.WORD_WIDTH = WORD_WIDTH;
defparam BM0.DR_WIDTH = DR_WIDTH;
defparam BM0.SB_WIDTH = DR_WIDTH;
defparam BM0.SA_WIDTH = DR_WIDTH;
defparam BM0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam BM0.CNTRL_WIDTH = CNTRL_WIDTH;
defparam BM0.COUNTER_WIDTH = COUNTER_WIDTH;
wire [WORD_WIDTH-1:0] D_bus;
Computer_Datapath_BusMuxer BM1 (
	.BUS_out(D_bus),
	.A_in(FU_out_bus),
	.B_in(DMEM_out_bus),
	.S(CNTRL_bus[5])
	);
defparam BM1.WORD_WIDTH = WORD_WIDTH;
defparam BM1.DR_WIDTH = DR_WIDTH;
defparam BM1.SB_WIDTH = DR_WIDTH;
defparam BM1.SA_WIDTH = DR_WIDTH;
defparam BM1.OPCODE_WIDTH = OPCODE_WIDTH;
defparam BM1.CNTRL_WIDTH = CNTRL_WIDTH;
defparam BM1.COUNTER_WIDTH = COUNTER_WIDTH;
wire [WORD_WIDTH-1:0] FU_out_bus;
wire [FLAG_WIDTH-1:0] FLAG_bus;
Computer_Datapath_FunctionUnit FU0 (
	.FU_out(FU_out_bus),
	.FLAG_bus_out(FLAG_bus),
	.ADDR_bus_in(ADDR_bus),
	.DATA_bus_in(DATA_bus),
	.CNTRL_bus_in(CNTRL_bus)
	);
defparam FU0.WORD_WIDTH = WORD_WIDTH;
defparam FU0.DR_WIDTH = DR_WIDTH;
defparam FU0.SB_WIDTH = DR_WIDTH;
defparam FU0.SA_WIDTH = DR_WIDTH;
defparam FU0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam FU0.CNTRL_WIDTH = CNTRL_WIDTH;
defparam FU0.COUNTER_WIDTH = COUNTER_WIDTH;
wire [WORD_WIDTH-1:0] ADDR_bus;
wire [WORD_WIDTH-1:0] B_data_out_bus;
Computer_Datapath_RegisterFile RF0 (
	.ADDR_bus_out(ADDR_bus),
	.B_data_out(B_data_out_bus),
	.CNTRL_bus_in(CNTRL_bus),
	.D_bus_in(D_bus),
	.CLK(CLK),
	.RST(RST)
	);
defparam RF0.WORD_WIDTH = WORD_WIDTH;
defparam RF0.DR_WIDTH = DR_WIDTH;
defparam RF0.SB_WIDTH = DR_WIDTH;
defparam RF0.SA_WIDTH = DR_WIDTH;
defparam RF0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam RF0.CNTRL_WIDTH = CNTRL_WIDTH;
defparam RF0.COUNTER_WIDTH = COUNTER_WIDTH;
endmodule