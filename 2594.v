module FD1P3DX(input D, CK, SP, CD, output reg Q);
	parameter GSR = "DISABLED";
	initial Q = 1'b0;
	always @(posedge CK or posedge CD)
		if (CD)
			Q <= 1'b0;
		else if (SP)
			Q <= D;
	specify
		$setup(D, posedge CK, 0);
		$setup(SP, posedge CK, 212);
		$setup(CD, posedge CK, 224);
`ifndef YOSYS
		if (CD) (posedge CLK => (Q : 0)) = 0;
`else
		if (CD) (CD => Q) = 0; 	// Technically, this should be an edge sensitive path
								// but for facilitating a bypass box, let's pretend it's
								// a simple path
`endif
		if (!CD && SP) (posedge CK => (Q : D)) = 336;
	endspecify
endmodule