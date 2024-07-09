module RegisterFileTB();
	initial begin
		$dumpfile("RegisterFileTB.vcd");
		$dumpvars;
		#30 $finish;
	end
	reg clk,wre;
	reg[2:0] rr1,rr2,wr;
	reg[7:0] wd;
	wire[7:0] rd1,rd2;
	parameter delta = 5;
	initial begin clk = 0; forever #delta clk = ~clk; end
	RegisterFile UUT(wre,clk,rr1,rr2,wr,wd,rd1,rd2);
	initial begin
		wre = 1'b1;
		wr = 3'b000;
		wd = {8{1'b1}};
		#delta
		wr = 3'b010;
		rr1 = 3'b010;
		rr2 = 3'b000;
		#delta
		wre = 1'b0;
		wr = 3'b011;
		rr1 = 3'b011;
		#delta
		wre = 1'b1;
	end
endmodule