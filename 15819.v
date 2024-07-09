module inv (
  output Q,
  input A,
);
  // The F-Frag
  F_FRAG f_frag (
  .F1(1'b1),
  .F2(1'b0),
  .FS(A),
  .FZ(Q)
  );
endmodule