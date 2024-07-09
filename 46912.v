module alu_test;
	reg [31:0] a, b;
	wire [15:0] r1, r2;
	reg [4:0] func;
	reg en;
	wire [15:0] flag;
	wire size;
	alu alu(a, b, r1, r2, size, func, flag, en);
	initial begin
		$monitor("%t: a = %x, b = %x, result = %x %x, flag = %b", $time, a, b, r2, r1, flag[3:0]);
		en = 1;
		a <= 32'h7FFF;
		b <= 32'h7FFF;
		func <= `ALU_ADD;
		#10
		func <= `ALU_SUB;
		#10
		a <= 32'hFFFF;
		b <= 32'hFFFF;
		func <= `ALU_ADD;
		#10
		func <= `ALU_SUB;
		#10
		a <= 32'hFFFF;
		b <= 32'hFFFF;
		func <= `ALU_MUL;
		#10 $finish();
	end
	always #5 begin
		en <= ~en;
	end
	assign size = 1;
endmodule