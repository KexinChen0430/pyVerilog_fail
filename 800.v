module jtag__capture_ctl(capture, phi2, sel, out, phi1);
  input capture;
  input phi2;
  input sel;
  output out;
  input phi1;
  supply1 vdd;
  supply0 gnd;
  wire net_1, net_2, net_3, net_4;
  scanChainFive__scanL foo(.in(net_2), .out(net_3));
  not (strong0, strong1) #(100) inv_0 (net_1, capture);
  not (strong0, strong1) #(100) inv_1 (out, net_4);
  nand (strong0, strong1) #(100) nand3_0 (net_4, sel, net_3, phi1);
  scanChainFive__scanP scanP_0(.in(phi2), .src(net_1), .drn(net_2));
endmodule