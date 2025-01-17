module OpcodeBufferTest;
	`include "Framework.v"
	reg reset;
	reg clk;
	always #10 clk = ~clk;
	reg [31:0] addrA;
	wire [31:0] addrB;
	reg writeEnable = 0;
	reg [7:0] dataIn;
	reg requestA;
	wire requestB;
	wire [7:0] outA;
	wire [7:0] outB;
	wire busyA;
	wire busyB;
	wire [15:0] displayIn = 0;
	wire [31:0] displayAddr;
	wire displayWE;
	Display dsp(clk, displayIn);
	wire [31:0] mmioInB;
	wire [31:0] mmioAddrB;
	wire mmioWEB;
	SimpleMmu mmu(clk, reset, addrA, addrB, writeEnable, dataIn, requestA, requestB, outA, outB, busyA, busyB,
			displayIn,displayAddr,displayWE, mmioInB, mmioAddrB, mmioWEB);
	reg [31:0] ip;
	wire busy;
	wire [31:0] opcode;
	reg startLoading;
	OpcodeBuffer ob(clk, reset, ip, startLoading, outB, busyB, busy, opcode, addrB, requestB);
	initial begin
		$dumpfile("timing.vcd");
		$dumpvars(0,mmu,ob);
		reset = 1;
		clk = 0;
		#20 reset = 0;
		ip = 0;
		startLoading = 1;
		#300 @(negedge busy) $display("Got opcode: %h = %h", ip, opcode);
		#10 startLoading = 0;
		ip = 4;
		startLoading = 1;
		#300 @(negedge busy) $display("Got opcode: %h = %h", ip, opcode);
		ip = 8;
		startLoading = 1;
		#300 @(negedge busy) $display("Got opcode: %h = %h", ip, opcode);
		$finish;
	end
endmodule