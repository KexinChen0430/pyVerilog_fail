module FD1P3IX(input D, CK, SP, CD, output reg Q);
	parameter GSR = "DISABLED";
	initial Q = 1'b0;
	always @(posedge CK)
		if (CD)
			Q <= 1'b0;
		else if (SP)
			Q <= D;
	specify
		$setup(D, posedge CK, 0);
		$setup(SP, posedge CK, 212);
		$setup(CD, posedge CK, 224);
		if (!CD && SP) (posedge CK => (Q : D)) = 336;
	endspecify
endmodule