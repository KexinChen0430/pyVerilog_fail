module scanChainFive__scanL(in, out);
  input in;
  output out;
  supply1 vdd;
  supply0 gnd;
  wire net_4, net_7;
  redFour__NMOSwk_X_1_Delay_100 NMOSwk_0(.g(out), .d(in), .s(net_7));
  redFour__NMOSwk_X_1_Delay_100 NMOSwk_1(.g(out), .d(net_7), .s(gnd));
  redFour__PMOSwk_X_0_833_Delay_100 PMOSwk_0(.g(out), .d(net_4), .s(vdd));
  redFour__PMOSwk_X_0_833_Delay_100 PMOSwk_1(.g(out), .d(in), .s(net_4));
  not (strong0, strong1) #(100) invV_0 (out, in);
endmodule