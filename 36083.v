module CPUTest();
	reg Clock;
	reg [1:0] StartAddress;
	reg End;
	reg [31:0] Number1, Number2;
	output [1:0] InstructionCode;
	output R1in, R1out,R2in,  R2out, Add,  Sub,  Mul,   Div, SelectY,  Yin, Zin,  Zout, reset;
	output [31:0] Register;
	CPU c1( R1in, R1out,R2in,  R2out, Add,  Sub,  Mul,   Div, SelectY,  Yin, Zin,  Zout, Register, InstructionCode, reset, Clock,StartAddress, End, Number1, Number2);
	initial
		begin
		$display($time, " %10s %4s %4s %4s %4s %4s %4s %4s %4s %4s %4s %4s %4s %5s -----%4s","Reg", "R1in", "R1ou", "R2in",  "R2ou", "Add",  "Sub",  "Mul",  "Div", "SelY",  "Yin", "Zin",  "Zout", "Reset", "Code");
		$monitor($time, " %10d %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %5b -----%4b",Register, R1in, R1out,R2in,  R2out, Add,  Sub,  Mul,   Div, SelectY,  Yin, Zin,  Zout, reset, InstructionCode);
		//$monitor($time, "%d %4b",Register, Clock);
		Clock = 1; StartAddress  = 2'b00; End   = 1;Number1 = 32'd5; Number2 = 32'd6; //'
		//#10    End = 1;
		#10    End = 0;
		#40    End = 1;Number1 = 32'd8; Number2 = 32'd3; //'
		#10    End = 0;
		#30   $finish;
	end
	always
		begin: CLOCKGEN
		#5 Clock = ~Clock;
	end
endmodule