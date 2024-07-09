module memory_test;
	reg clk;
	reg [1:0] rw;
	reg [15:0] addr;
	wire line;
	reg [31:0] wline;
	wire [47:0] rline;
	memory memory(clk, wline, rline, addr, rw);
	initial begin
		$monitor("%t: rw = %b, addr = %x, wline = %x, rline = %x", $time, rw, addr, wline, rline);
		clk <= 0;
		#10
		rw <= 2'b11;
		addr <= 0;
		wline <= 48'h123456789ABC;
		#10
		rw <= 2'b00;
		addr <= 0;
		#10
		rw <= 2'b10;
		addr <= 1;
		wline <= 48'hDEF012345678;
		#10
		rw <= 2'b00;
		addr <= 0;
		#10
		rw <= 2'b11;
		addr <= 3;
		wline <= 48'h9ABCDEF12345;
		#10
		rw <= 2'b00;
		addr <= 0;
		#10
		rw <= 2'b00;
		addr <= 2;
		#10 $finish;
	end
	always #10 begin
		clk <= ~clk;
	end
endmodule