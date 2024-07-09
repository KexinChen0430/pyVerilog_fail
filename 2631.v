module protection_sim;
	reg [3:0] a, b;
	wire [7:0] c;
/********************************************************************
	initial
	begin
		$dumpfile("vcd");
		$dumpvars(0, tops);
		$monitor($time, " A=%d b=%d a*b=%d",a,b,c);
	end
/********************************************************************
	initial
	begin
		CLK  = 1'b1;
		forever #5 CLK = ~CLK;
	end
	initial
	begin
		RST = 1'b1;
		#5 RST = 1'b0;
	end
	initial
	begin
		a = 3'b000;
		#2 a = 3'b001;
		#2 a = 3'b010;
		#2 a = 3'b011;
		#2 a = 3'b100;
	end
	initial
	begin
		b = 3'b000;
		#2 b = 3'b010;
		#2 b = 3'b010;
		#2 b = 3'b010;
		#2 b = 3'b111;
		$finish;
	end
/********************************************************************
	top tops(a, b, c);
endmodule