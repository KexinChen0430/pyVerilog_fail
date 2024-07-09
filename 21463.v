module AND2 (A1, A2, Z);
    input A1, A2;
    output Z;
    and	(Z, A1, A2);		// plain AND gate
    specify
       (A1 => Z)=(5, 3);	// rise and fall times
       (A2 => Z)=(5, 3);
    endspecify
endmodule