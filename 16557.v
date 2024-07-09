module processor;
wire [31:0] mux4out,pcout,imemout,reg1out,reg2out,mux3out,signout,mux2out,xorout,arith1out,dmemout,mux6out,arith2out,shiftlout,arith3out,andout,orout,mux5out;
wire [4:0] mux1out;
reg reset;
clock clock1(clk);
programcounter PC(mux4out,clk,pcout,reset);
instructionmemory imem(imemout,pcout[6:0],clk);
registerfile regis(RegWrite,reg1out,reg2out,imemout[25:21],imemout[20:16],mux1out,mux3out,clk);
xor32bit xor1(xorout, mux2out, sub);
alunit arith1(arith1out,reg1out, xorout,sub,zero);
datamemory dmem(dmemout,mux6out[15:0],reg2out,MemWrite,MemRead,clk);
alucontroler acontrol(imemout[5:0],sub,select5,select6,AluOp);
alunit arith2(arith2out,32'b00000000000000000000000000000100, pcout,0,zero2);
shift2 shiftl(signout,shiftlout);
alunit arith3(arith3out,arith2out, shiftlout,0,zero3);
and32bit and1(andout, mux2out, reg1out);
or32bit or1(orout, mux2out, reg1out);
mux5bit mux1(imemout[20:16],imemout[15:11],mux1out,RegDst);
mux32bit mux2(reg2out,signout,mux2out,ALUSrc);
mux32bit mux3(dmemout,mux6out,mux3out,MemToReg);
mux32bit mux4(arith2out,arith3out,mux4out,andcout);
mux32bit mux5(andout,orout,mux5out,select5);
mux32bit mux6(mux5out, arith1out,mux6out,select6);
and(andcout,zero,branch);
signextend signextender(imemout[15:0],signout);
controlunit cntrlunit(imemout[31:26],branch,MemWrite,MemRead,ALUSrc,RegWrite,RegDst,AluOp,MemToReg);
initial
begin
	$monitor("PC=%b;INS=%b;data1=%b;data2=%b;ALU=%b;writeback=%b;clock=%b",pcout,imemout,reg1out,reg2out,mux6out,mux3out,clk);
	#2
	reset=1'b0;
	//#2
	reset=1'b1;
	//#2
	reset=1'b0;
	#70
	$finish();
end
endmodule