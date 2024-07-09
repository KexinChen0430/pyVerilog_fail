module \$_MUX_ (A, B, S, Y);
  input A, B, S;
  output Y;
  generate
    if (`MIN_MUX_INPUTS == 2)
      \$__XILINX_SHIFTX  #(.A_SIGNED(0), .B_SIGNED(0), .A_WIDTH(2), .B_WIDTH(1), .Y_WIDTH(1)) _TECHMAP_REPLACE_ (.A({B,A}), .B(S), .Y(Y));
    else
      wire _TECHMAP_FAIL_ = 1;
  endgenerate
endmodule