module alu_tb;
	reg RST, CLK, ENA;
	reg [7:0]OPT;
	reg [7:0]RGA;
	reg [7:0]RGB;
	wire [7:0]RGZ;
	reg [1:0]KEY;
/********************************************************************
	initial
	begin
		$dumpfile("vcd");
		$dumpvars(0, alus);
		$monitor($time, " REG A = %b REG Z = %b", RGA, RGZ);
	end
/********************************************************************
	initial
	begin
		CLK  = 1'b1;
		forever #5 CLK = ~CLK;
	end
/********************************************************************
	initial
	begin
		RST = 1'b1;
		#5 RST = 1'b0;
	end
/********************************************************************
	initial
	begin
		RGA = 8'b00000000;
		#10 RGA = 8'b00000111;
		#10 RGA = 8'b00000101;
		#10 RGA = 8'b00000110;
    	#10 RGA = 8'b00000010;
    	#10 RGA = 8'b00000011;
    	#10 RGA = 8'b00000100;
    	#10 RGA = 8'b00000010;
    	#10 RGA = 8'b00000000;
    	#10 RGA = 8'b00000111;
    	#10 RGA = 8'b00000100;
    	#10 RGA = 8'b00000010;
    	#10 RGA = 8'b00000001;
    	#10 RGA = 8'b00000010;
    	#10 RGA = 8'b00000101;
    	#10 RGA = 8'b00000011;
    	#10 RGA = 8'b00000100;
    	#10 RGA = 8'b00000010;
    	#10 RGA = 8'b00000111;
    	#10 RGA = 8'b00000011;
    	#10 RGA = 8'b00000000;
		$finish;
	end
/********************************************************************
	initial
	begin
		OPT    = 8'b00000001;
		#5 OPT = 8'b00000011;
	end
	initial
	begin
		KEY = 1'b1;
		#5 KEY = 1'b1;
	end
	initial
	begin
		RGB = 1;
	end
/********************************************************************
	alu alus(RST, CLK, ENA, RGA, RGB, RGZ, KEY, OPT);
endmodule