module StackTB();
	initial begin
		$dumpfile("StackTB.vcd");
		$dumpvars;
		#100 $finish;
	end
	reg clk,rst;
	reg[1:0] stackCntrl;
	reg[11:0] pushData;
	wire[11:0] popData;
	//integer i;
	parameter delta = 5;
	initial begin clk = 0; forever #delta clk = ~clk; end
	Stack UUT(clk,rst,stackCntrl,pushData,popData);
	initial begin
		rst = 1'b1;
		stackCntrl = 2'b01;
		pushData = 12'd128;
		rst = 1'b0;
		#(delta) pushData=12'd100;
		#(delta) pushData=12'd101;
		#(delta) pushData=12'd102;
		#(delta) pushData=12'd103;
		stackCntrl = 2'b00;
		#(2*delta) stackCntrl=2'b10;
		#(5*delta) stackCntrl = 2'b00;
		rst=1'b1;
		#delta stackCntrl=2'b10;
	end
endmodule