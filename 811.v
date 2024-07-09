module jtag__mux2_phi2(Din0, Din1, phi2, sel, Dout);
  input Din0;
  input Din1;
  input phi2;
  input sel;
  output Dout;
  supply1 vdd;
  supply0 gnd;
  wire net_1, net_2, net_3, net_5, net_6;
  not (strong0, strong1) #(100) inv_0 (net_5, sel);
  not (strong0, strong1) #(100) inv_1 (net_1, net_6);
  not (strong0, strong1) #(100) inv_2 (Dout, net_3);
  scanChainFive__scanL scanL_0(.in(net_2), .out(net_3));
  scanChainFive__scanP scanP_0(.in(phi2), .src(net_1), .drn(net_2));
  jtag__tsinv tsinv_0(.Din(Din0), .Dout(net_6), .en(net_5), .enb(sel));
  jtag__tsinv tsinv_1(.Din(Din1), .Dout(net_6), .en(sel), .enb(net_5));
endmodule