module jtag__stateBitHI(next, phi1, phi2, rstb, master, slave, slaveBar);
  input next;
  input phi1;
  input phi2;
  input rstb;
  output master;
  output slave;
  output slaveBar;
  supply1 vdd;
  supply0 gnd;
  wire net_10, net_11, net_12, net_15;
  redFour__PMOS_X_1_5_Delay_100 PMOS_0(.g(rstb), .d(net_12), .s(vdd));
  not (strong0, strong1) #(100) inv_0 (slave, slaveBar);
  not (strong0, strong1) #(100) inv_1 (slaveBar, net_15);
  not (strong0, strong1) #(100) inv_2 (master, net_10);
  scanChainFive__scanL scanL_0(.in(net_12), .out(net_10));
  scanChainFive__scanL scanL_1(.in(net_11), .out(net_15));
  scanChainFive__scanP scanP_0(.in(phi1), .src(next), .drn(net_12));
  scanChainFive__scanP scanP_1(.in(phi2), .src(net_10), .drn(net_11));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_1000 wire180_0(.a(slave));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_500
      wire180_1(.a(slaveBar));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_100 wire180_2(.a(next));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_750 wire180_3(.a(master));
endmodule