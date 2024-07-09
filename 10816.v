module project_tb;
	reg wrEnable;
	reg [4:0] wrReg;
	reg [4:0] rdReg1;
	reg [4:0] rdReg2;
	reg clk;
	reg [3:0] opCode;
	reg [4:0] shiftAmt;
	wire signed [31:0] result;
	reg selCh;
	reg [31:0] selData;
	always begin #5 clk = ~clk; end
	initial begin
		$monitor ("Your result = %d", result);
		clk = 0; selCh = 0;
		#10 $display ("Register file's 1st register = 1."); wrEnable = 1; wrReg = 0; selData = 1;
		#10 $display ("Register file's 2nd register = 7."); wrReg = 1; selData = 7; #10 wrEnable = 0;
		#10 $display ("Choosing register file's 1st and 2nd registers as it's outputs, and adding both."); rdReg1 = 0; rdReg2 = 1; opCode = 0;
		#10 $display ("Subtracting both."); opCode = 1;
		#10 $display ("Changing 2nd register = 0 and subtrcating both again."); wrEnable = 1; selData = 0; #10 wrEnable = 0;
		#10 $display ("Putting both registers at the terminals of an AND gate."); opCode = 2;
		#10 $display ("Putting both registers at the terminals of an OR gate."); opCode = 3;
		#10 $display ("Shifting 1st register's binary value 3 digits to the left."); shiftAmt = 3; opCode = 4;
		#10 $display ("Register file's 1st register = last operation's answer, and shifting it's binary value 3 digits to the left."); wrEnable = 1; wrReg = 0; selCh = 1; #10 wrEnable = 0;
		#10 $display ("Shifting 1st register's binary value 2 digits to the right logicaly."); shiftAmt = 2; opCode = 5;
		#10 $display ("Changing 1st register = -9 and shifting it's binary value 2 digits to the right logicaly."); wrEnable = 1; wrReg = 0; selCh = 0; selData = -9; #10 wrEnable = 0; // It'll give an unrelated answer because of the negative number.
		#10 $display ("Shifting 1st register's binary value 1 digits to the right arithmeticaly."); shiftAmt = 1; opCode = 6;
		#10 $display ("Is 1st register's value greater than 2nd register's value?"); opCode = 7;
		#10 $display ("Is 1st register's value less than 2nd register's value?"); opCode = 8;
	end
	project p1 (wrEnable, wrReg, rdReg1, rdReg2, clk, opCode, shiftAmt, result, selCh, selData);
endmodule