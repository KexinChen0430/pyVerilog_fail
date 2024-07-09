module INV (A, Z);
  input A;
  output Z;
  not (Z, A);
  specify
    (A => Z)=(3, 3);	// rise and fall times
  endspecify
endmodule