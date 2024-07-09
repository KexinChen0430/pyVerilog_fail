module AND_N (A, Z);
    parameter input_size = 2;
    input [input_size-1:0] A;
    output Z;
    and	(Z, A);			// plain AND gate
    specify
	(A => Z)=(4+input_size, 2+input_size);
    endspecify
endmodule