module FD1P3JX(input D, CK, SP, PD, output reg Q);
	parameter GSR = "DISABLED";
	initial Q = 1'b1;
	always @(posedge CK)
		if (PD)
			Q <= 1'b1;
		else if (SP)
			Q <= D;
	specify
		$setup(D, posedge CK, 0);
		$setup(SP, posedge CK, 212);
		$setup(PD, posedge CK, 224);
		if (!PD && SP) (posedge CK => (Q : D)) = 336;
	endspecify
endmodule