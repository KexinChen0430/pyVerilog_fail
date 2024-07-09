module test_risk_spm();
	reg rst;
	wire clk;
	parameter word_sz = 8;
	reg [8:0] k;
	clock_unit m1(clk);
	risc_spm m2(clk, rst);
	initial #2800 $finish;
	task load;
		input [7:0] addr;
		input [7:0] instr;
		begin
			m2.m2_mem.mem[addr] = instr;
		end
	endtask
	initial begin
		$dumpfile("risc_spm.vcd");
		$dumpvars(0, m2);
	end
	initial begin : flush_mem
		#2 rst = 0;
		for (k = 0; k <= 255; k = k + 1)
			load(k, 0);
		#10 rst = 1;
	end
	initial begin : load_prgm
		load(0,  8'b0000_00_00);
		load(1,  8'b0101_00_10);
		load(2,  130);
		load(3,  8'b0101_00_11);
		load(4,  131);
		load(5,  8'b0101_00_01);
		load(6,  128);
		load(7,  8'b0101_00_00);
		load(8,  129);
		load(9,  8'b0010_00_01);
		load(10, 8'b1000_00_00);
		load(11, 134);
		load(12, 8'b0001_10_11);
		load(13, 8'b0111_00_11);
		load(14, 140);
		load(128, 6);
		load(129, 1);
		load(130, 2);
		load(131, 0);
		load(134, 139);
		load(139, 8'b1111_00_00);
		load(140, 9);
	end
endmodule