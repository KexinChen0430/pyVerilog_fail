module INV(input A, output Z);
	assign Z = !A;
	specify
		(A => Z) = 10;
	endspecify
endmodule