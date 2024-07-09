module CPUTB();
	initial begin
		$dumpfile("CPUTB.vcd");
		$dumpvars;
	end
	//integer outfile,regFile;
	integer i,ramOut;
	reg clk,rst;
	parameter delta = 10;
	initial begin clk = 0; forever #delta clk = ~clk; end
	CPU UUT(clk,rst);
	initial begin
		ramOut = $fopen("ramModified.bin") | 1;
		//regFile = $fopen("regsOut.bin") | 1;
		rst=0;
		#1 rst=1;
		#(1+delta) rst=0;
		for(i=0;i<500;i=i+1)
			begin
				//#(2*delta) $fdisplay(regFile, "%8d,%8d,%8d,%8d,%8d,%8d,%8d,%8d,%4d",UUT.dp.RF.registers[0],UUT.dp.RF.registers[1],UUT.dp.RF.registers[2],UUT.dp.RF.registers[3],UUT.dp.RF.registers[4],UUT.dp.RF.registers[5],UUT.dp.RF.registers[6],UUT.dp.RF.registers[7],UUT.dp.Alu.Zero);
				#(2*delta) $display("%8d,%8d,%8d,%8d,%8d,%8d,%8d,%8d",UUT.dp.RF.registers[0],UUT.dp.RF.registers[1],UUT.dp.RF.registers[2],UUT.dp.RF.registers[3],UUT.dp.RF.registers[4],UUT.dp.RF.registers[5],UUT.dp.RF.registers[6],UUT.dp.RF.registers[7]);
			end
		for(i=0;i<256;i=i+1)
		begin
			$fdisplay(ramOut, "%8b", UUT.dp.Mem.data[i]);
		end
		$finish;
	end
endmodule