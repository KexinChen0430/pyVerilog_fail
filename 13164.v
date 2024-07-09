module protection_sim;
	reg RST, CLK, ENA;
	reg [7:0]RGA;
	reg [7:0]RGB;
	wire [7:0]RGZ;
	reg [1:0]KEY;
/********************************************************************
	initial
	begin
		$dumpfile("vcd");
		$dumpvars(0, prot);
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
		RGA = 3'b000;
		#10 RGA = 3'b111;
		#10 RGA = 3'b101;
		#10 RGA = 3'b110;
    	#10 RGA = 3'b010;
    	#10 RGA = 3'b011;
    	#10 RGA = 3'b100;
    	#10 RGA = 3'b010;
    	#10 RGA = 3'b000;
    	#10 RGA = 3'b111;
    	#10 RGA = 3'b100;
    	#10 RGA = 3'b010;
    	#10 RGA = 3'b001;
    	#10 RGA = 3'b010;
    	#10 RGA = 3'b101;
    	#10 RGA = 3'b011;
    	#10 RGA = 3'b100;
    	#10 RGA = 3'b010;
    	#10 RGA = 3'b111;
    	#10 RGA = 3'b011;
    	#10 RGA = 3'b000;
		$finish;
	end
/********************************************************************
	protection prot( RST, CLK, ENA, RGA, RGB, RGZ, KEY);
endmodule