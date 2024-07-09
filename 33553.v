module  Datapath(
	output [3:0] FLAG_out,					// Flag Bus
	output [WORD_WIDTH-1:0] A_bus, 		// Address out Bus
	output [WORD_WIDTH-1:0] D_bus, 		// Data out Bus
	input [WORD_WIDTH-1:0] D_in,  		// Data in bus
	input [15:0] CNTRL_in, 					// Instruction Bus
	input [WORD_WIDTH-1:0] CONST_in,		// Constant In Bus
	input CLK
);
parameter WORD_WIDTH = 16;
Datapath_RegisterFile RF0 (
	.A_data(A_bus),
	.B_data(RF0_out_B),
	.D_data(BMD_out),
	.AA(CNTRL_in[9:7]),
	.BA(CNTRL_in[12:10]),
	.DA(CNTRL_in[15:13]),
	.RW(CNTRL_in[0]),
	.CLK(CLK)
	);
Datapath_BusMuxer BMB(
	.out(D_bus),
	.A_in(RF0_out_B),
	.B_in(CONST_in),
	.S(CNTRL_in[6])
	);
Datapath_BusMuxer BMD(
	.out(BMD_out),
	.A_in(FU0_out),
	.B_in(D_in),
	.S(CNTRL_in[1])
	);
Datapath_FunctionUnit FU0(
	.F(FU0_out),
	.V(FLAG_out[3]),
	.C(FLAG_out[2]),
	.N(FLAG_out[1]),
	.Z(FLAG_out[0]),
	.A(A_bus),
	.B(D_bus),
	.FS(FS)
	);
	defparam FU0.WORD_WIDTH = WORD_WIDTH;
	defparam BMD.WORD_WIDTH = WORD_WIDTH;
	defparam BMB.WORD_WIDTH = WORD_WIDTH;
	defparam RF0.WORD_WIDTH = WORD_WIDTH;
endmodule