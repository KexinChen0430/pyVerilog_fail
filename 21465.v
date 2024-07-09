module OR2 (A1, A2, Z);
    input A1, A2;
    output Z;
    or	(Z, A1, A2);		// plain OR gate
    specify
       (A1 => Z)=(6, 4);	// rise and fall times
       (A2 => Z)=(6, 4);
    endspecify
endmodule