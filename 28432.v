module tb_reg_alu();
	parameter word_sz = 8,
		addr_sz = 5;
	wire [word_sz:0] alu_out;
	reg [word_sz-1:0] di;
	reg [addr_sz-1:0] raddr_1, raddr_2, waddr;
	reg [2:0] opcode;
	reg c_in, wr_en, clk;
	alu_reg #(word_sz, addr_sz) dev(alu_out, di, raddr_1, raddr_2,
		waddr, opcode, c_in, wr_en, clk);
	initial begin
		#500 $finish();
	end
	initial begin
		clk = 0;
		forever clk = ~clk;
	end
	integer i;
	initial begin
		opcode = 0;
		di = 1;
		c_in = 0;
		wr_en = 1;
		waddr = 0;
		raddr_1 = 0;
		raddr_2 = 0;
		$dumpfile("p28_b.vcd");
		$dumpvars(0, tb_reg_alu);
		for( i = 0; i < addr_sz; i = i + 1) begin
			@(negedge clk) begin
				waddr <= waddr + 1;
				raddr_1 <= raddr_1 + 1;
				raddr_2 <= raddr_2 + 1;
			end
		end
		$finish();
	end
endmodule