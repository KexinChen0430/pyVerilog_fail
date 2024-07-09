module mux2to1(datain0,datain1, dataout, select);
input [31:0] datain0, datain1;
input select;
output [31:0] dataout;
*/
initial
	forever #50 clock = ~clock;
initial
begin
	clock = 1;
	#5;
	four = 4;
	yesItAlwaysTure = 1;
	yesItAlwyasFalse = 0;
	clear = 1;
	EX_MEM_Signal[4] = 0;
	EX_MEM_Zero = 0;
	/* we may not connect clear to register file and memory because we don't want our initial data get cleared*/
	#10 clear = 0;
end
always @(negedge clock)
begin
	#10
	MEM_WB_MemReadData	=	DataMemResult;
	MEM_WB_Signal	=	EX_MEM_Signal[1:0];
	MEM_WB_ALU_Result	=	EX_MEM_ALU_Result;
	MEM_WB_RegWriteDst	=	EX_MEM_RegWriteDst;
	EX_MEM_Signal	=	ID_EX_Signal[4:0];
	EX_MEM_Zero		=	Zero;
	EX_MEM_AddedPC	=	AddToEX_MEM_AddedPC;
	EX_MEM_ReadData2	=	ID_EX_ReadData2;
	EX_MEM_ALU_Result	=	ALUOut;
	EX_MEM_RegWriteDst	=	MuxToRegDst;
	ID_EX_AddedPC	=	IF_ID_AddedPC;
	ID_EX_ReadData1	=	RegtoA;
	ID_EX_ReadData2	=	RegtoB;
	ID_EX_ExtendedAddr	=	ExtendToID_EX;
	ID_EX_Inst20_16	=	IF_ID_Inst[20:16];
	ID_EX_Inst15_11	=	IF_ID_Inst[15:11];
	ID_EX_Signal	=	{ALUOp[1:0],ALUSrc,RegDst,Branch,MemRead,MemWrite,RegWrite,MemtoReg};
	IF_ID_Inst 		= InstMemToIF_ID;
	IF_ID_AddedPC	= AddToIF_ID;
end
initial
#10000 $stop;
endmodule