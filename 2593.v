module FD1P3BX(input D, CK, SP, PD, output reg Q);
	parameter GSR = "DISABLED";
	initial Q = 1'b1;
	always @(posedge CK or posedge PD)
		if (PD)
			Q <= 1'b1;
		else if (SP)
			Q <= D;
	specify
		$setup(D, posedge CK, 0);
		$setup(SP, posedge CK, 212);
		$setup(PD, posedge CK, 224);
`ifndef YOSYS
		if (PD) (posedge CLK => (Q : 1)) = 0;
`else
		if (PD) (PD => Q) = 0; 	// Technically, this should be an edge sensitive path
								// but for facilitating a bypass box, let's pretend it's
								// a simple path
`endif
		if (!PD && SP) (posedge CK => (Q : D)) = 336;
	endspecify
endmodule