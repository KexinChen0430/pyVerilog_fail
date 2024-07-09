module INV_X16 (A, ZN);
  input A;
  output ZN;
  not(ZN, A);
  specify
    (A => ZN) = (0.1, 0.1);
  endspecify
endmodule