module scanChainFive__scanP(in, src, drn);
  input in;
  input src;
  output drn;
  supply1 vdd;
  supply0 gnd;
  wire net_1;
  redFour__NMOS_X_6_667_Delay_100 NMOS_0(.g(in), .d(drn), .s(src));
  redFour__PMOS_X_3_333_Delay_100 PMOS_0(.g(net_1), .d(drn), .s(src));
  not (strong0, strong1) #(0) inv_0 (net_1, in);
endmodule