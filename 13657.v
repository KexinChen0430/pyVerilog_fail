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
	output [17:0] LEDR
);
// Ligacoes na placa
//{SW[17],SW[16],SW[15],SW[14],SW[13],SW[12],SW[11],SW[10],SW[9],SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2],SW[1],SW[0]}
//{DA[2], DA[1], DA[0], AA[2], AA[1], AA[0], BA[2], BA[1], BA[0],MB,   FS[3],FS[2],FS[1],FS[0],MD[2],RW,   D_in, CONST_in}
parameter WORD_WIDTH = 16;
wire [WORD_WIDTH-1:0] B2HEXA_in, B2HEXB_in;
// Conversores Binario->7 Segmentos Hexadecimal
Decoder_Binary2HexSevenSegments B2HEXA(HEX0, B2HEXA_in);
Decoder_Binary2HexSevenSegments B2HEXB(HEX1, B2HEXB_in);
// Leds da Placa ligados ao barramento para monitoramento da atividade
assign LEDR[7:0] = {B2HEXA_in, B2HEXB_in};
// Instancia do Datapath
Datapath DP(
	.FLAG_out(LEDR[17:13]),
	.A_bus(B2HEXA_in),
	.D_bus(B2HEXB_in),
	.D_in({WORD_WIDTH{SW[1]}}),
	.CNTRL_in(SW[17:2]),
	.CONST_in({{(WORD_WIDTH-3){1'b0}},SW[1:0]}),
	.CLK(KEY[3]),
);
defparam DP.WORD_WIDTH = WORD_WIDTH;
endmodule