module OAI33_X1 (A1, A2, A3, B1, B2, B3, ZN);
  input A1;
  input A2;
  input A3;
  input B1;
  input B2;
  input B3;
  output ZN;
  not(ZN, i_20);
  and(i_20, i_21, i_23);
  or(i_21, i_22, A3);
  or(i_22, A1, A2);
  or(i_23, i_24, B3);
  or(i_24, B1, B2);
  specify
    if((A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (B3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (B3 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (B3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (B3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (B3 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (B3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (B3 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (B3 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (B3 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b0) && (B2 == 1'b0) && (B3 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (A3 == 1'b0) && (B2 == 1'b0) && (B3 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (A3 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b0) && (B2 == 1'b0) && (B3 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b1) && (B1 == 1'b0) && (B3 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b0) && (B1 == 1'b0) && (B3 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b1) && (B1 == 1'b0) && (B3 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B3 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (A3 == 1'b1) && (B1 == 1'b0) && (B3 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b0) && (B1 == 1'b0) && (B3 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b1) && (B1 == 1'b0) && (B3 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (B3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0)) (B3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (B3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0)) (B3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (A3 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (B3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0)) (B3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (B3 => ZN) = (0.1, 0.1);
  endspecify
endmodule