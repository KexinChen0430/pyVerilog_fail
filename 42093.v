module Datapath(
	clock,
	reset,
	instrucao,
	outALU,
);
	input clock, reset;
	output reg [31:0] outALU,  instrucao;
	always @ (*) begin
		instrucao = instruction;
		outALU = aluOut;
	end
	wire [31:0] instruction,  outPC,  outDataMemory,  ioOut,  mux2Out,  muxRegisterBankOut,  data;
	wire signed [31:0] rsValue, rtValue, immediate22Extended, operand2, aluOut;
	wire signed [21:0] immediate22;
	wire [4:0] rsAddress, rtAddress, rdAddress, opcode, controlALU;
	wire [1:0] muxPC, muxData, ioOp;
	wire jump, branch, out, writeEnableRegs, writeEnable, readEnable;
	PC instance_PC (
		.clock(clock),
	    .reset(reset),
		.branch(branch),
		.jump(jump),
		.muxPC(muxPC),
		.outPC(outPC)
	);
	InstructionMemory instance_InstructionMemory(
		.PCAddress(outPC),
		.rsAddress(rsAddress),
    	.rtAddress(rtAddress),
    	.rdAddress(rdAddress),
		.immediate22(immediate22),
		.opcode(opcode),
		.outInstruction(instruction)
	);
	ControlUnit instance_ControlUnit(
		.clock(clock),
		.reset(reset),
		.muxPC(muxPC),
		.muxData(muxData),
		.muxOperand(muxOperand),
		.controALU(controlALU),
		.writeEnableRegs(writeEnableRegs),
		.writeEnable(writeEnable),
		.readEnable(readEnable),
		.opcode(opcode),
		.ioOp(ioOp)
	);
	RegisterBank instance_RegisterBank (
		.clock(clock),
    	.rsAddress(rsAddress),
    	.rtAddress(rtAddress),
    	.rdAddress(rdAddress),
    	.data(muxRegisterBankOut),
    	.registerWrite(writeEnable),//Controle UC
    	.outData1(rsValue),
    	.outData2(rtValue)
	);
	Extender instance_Extender (
		.in(immediate22),
		.out(immediate22Extended)
	);
	muxOperand2 instance_muxOperand2 (
		.mux(muxData), //Controle UC
		.rt(rtValue),
		.immediate22(immediate22Extended),
		.out(operand2)
	);
	ALU instance_ALU (
		.controlALU(controlALU), //Controle UC
	  	.rs(rsValue),
	  	.rt(operand2),
	  	.outALU(aluOut),
	  	.outBranch(branch)
	);
	muxRegisterBank instance_muxRegisterBank (
		.mux(muxData),
		.aluOut(aluOut),
		.memOut(memOut),
		.ioOut(ioOut),
		.out(muxRegisterBankOut)
	);
	DataMemory instance_DataMemory (
		.clock(clock),
		.writeEnable(writeEnable),//Controle UC
		.readEnable(readEnable),//Controle UC
		.data(operand2),
		.address(immediate22),
		.outRead(outDataMemory)
	);
	IO instance_IO (
		.ioOp(), //Controle UC
		.regValue(rsValue),
		.immediate22(immediate22),
		.in(rsValue),
		.ioOut(ioOut),
		.out(out)
	);
endmodule