module execute(	clk, reset, ALUOut, ALUOp,fromPlusOneMem, fromRFOut1, fromRFOut2, RASelectInput, CCRWrite, CCR_Write_from_wb,CCRWriteValue,
CCRWriteValue_from_wb, fromSImm6, ExMux1Select, ExMux2Select,
		RAOut, CCR,IR,SignalA,SignalB,SignalC,SignalG,SignalI,SignalJ,SignalK,SignalX,SignalY,
		mem_wb_op,mem_wb_regA,mem_wb_regB,mem_wb_regC,ex_mem_op,ex_mem_regA,ex_mem_regB,ex_mem_regC,
		regread_ex_op,regread_ex_regA,regread_ex_regB,regread_ex_regC,mem_wb_CCR_write,ex_mem_CCR_write,r7,rf);
parameter ADD = 6'b000000;
parameter NDU = 6'b001000;
parameter ADC = 6'b000010;
parameter ADZ = 6'b000001;
parameter ADI = 4'b0001;
parameter NDC = 6'b001010;
parameter NDZ = 6'b001001;
	output [15:0] RAOut, ALUOut;
	output [ 1:0] CCR;
	output r7,rf;
	output    reg    CCRWrite;//send to pipeline register
	output  [ 1:0] CCRWriteValue;//send to pipeline register
	input CCR_Write_from_wb;
	input  [15:0] fromPlusOneMem, fromRFOut1, fromRFOut2, fromSImm6;
	input [15:0] SignalA,SignalB,SignalC,SignalG,SignalI,SignalJ,SignalK;
	input [1:0] SignalX,SignalY;
	input [1:0] CCRWriteValue_from_wb;
	input         clk, reset, RASelectInput, ALUOp, ExMux1Select, ExMux2Select;
	input [15:0]IR;
	//inputs required for forwarding
	input [2:0] mem_wb_regA,mem_wb_regB,mem_wb_regC,ex_mem_regA,ex_mem_regB,ex_mem_regC,regread_ex_regA,regread_ex_regB,regread_ex_regC;
	input [5:0]mem_wb_op,ex_mem_op,regread_ex_op;
	input ex_mem_CCR_write;
	wire   [15:0] ALUIn1, ALUIn2, ExMux1Out, ExMux2Out;
	wire[1:0] CCRMux_out;//CCRMux_out[1] = zero, CCRMux_out[0] = carry
	wire[1:0] CCR_muxSelect;
	wire   [ 2:0] ExMux3Select, ExMux4Select;			// These come from the forwarding unit. Do this.
	wire          ALUZero, ALUCarry;
	wire [5:0]ALU_op;//to check whether we must write to CCR or not
	assign ALU_op = {IR[15:12],IR[1:0]};
	mux2x4 CCR_mux(.data0(CCR),.data1(SignalX),.data2(SignalY),.data3(2'b0),.selectInput(CCR_muxSelect),.out(CCRMux_out));
	mux16x2 RAMux(.data0(fromPlusOneMem), .data1(fromRFOut1), .selectInput(RASelectInput), .out(RAOut));
	mux16x2 ExMux1(.data0(fromRFOut1), .data1(fromSImm6), .selectInput(ExMux1Select), .out(ExMux1Out));//for input 1 of ALU
	mux16x2 ExMux2(.data0(fromRFOut2), .data1(fromSImm6), .selectInput(ExMux2Select), .out(ExMux2Out));//for input 2 of ALU
	mux16x8 ExMux3(.data0(ExMux1Out), .data1(SignalA), .data2(SignalB), .data3(SignalC), .data4(SignalG), .data5(SignalI), .data6(SignalJ), .data7(SignalK), .selectInput(ExMux3Select), .out(ALUIn1));
	mux16x8 ExMux4(.data0(ExMux2Out), .data1(SignalA), .data2(SignalB), .data3(SignalC), .data4(SignalG), .data5(SignalI), .data6(SignalJ), .data7(SignalK), .selectInput(ExMux4Select), .out(ALUIn2));
	register2 CCRReg(.clk(clk), .out(CCR), .in(CCRWriteValue_from_wb), .write(CCR_Write_from_wb), .reset(reset));
	alu me(.in1(ALUIn1), .in2(ALUIn2), .op(ALUOp), .out(ALUOut), .zero(ALUZero), .carry(ALUCarry));
	forward_ex_stage f_ex(.mem_wb_op(mem_wb_op),.mem_wb_regA(mem_wb_regA),.mem_wb_regB(mem_wb_regB),.mem_wb_regC(mem_wb_regC),.ex_mem_op(ex_mem_op),.ex_mem_regA(ex_mem_regA),.ex_mem_regB(ex_mem_regB),.ex_mem_regC(ex_mem_regC),.regread_ex_op(regread_ex_op),.regread_ex_regA(regread_ex_regA),.regread_ex_regB(regread_ex_regB),
.regread_ex_regC(regread_ex_regC),.F1(ExMux3Select),.F2(ExMux4Select),.FCCR(CCR_muxSelect),.mem_wb_CCR_write(CCR_Write_from_wb),.ex_mem_CCR_write(ex_mem_CCR_write).rf(rf),.r7(r7));
	assign CCRWriteValue = {ALUZero, ALUCarry};
	always @(*)
	begin
	if(ALU_op==ADD||ALU_op==ADI||ALU_op==NDU)
		CCRWrite=1'b0;
	else if((ALU_op==ADC||ALU_op==NDC)&&	(CCRMux_out[0]==1'b1))//previous carry set or not
		CCRWrite=1'b0;
	else if((ALU_op==ADZ||ALU_op==NDZ) &&(CCRMux_out[1]==1'b1)) //previous zero flag set or not
		CCRWrite=1'b0;
	else
		CCRWrite=1'b1;
	end
endmodule