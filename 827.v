module jtag__stateBit(next, phi1, phi2, rst, master, slave, slaveBar);
  input next;
  input phi1;
  input phi2;
  input rst;
  output master;
  output slave;
  output slaveBar;
  supply1 vdd;
  supply0 gnd;
  wire net_12, net_13, net_14, net_17;
  redFour__NMOS_X_1_667_Delay_100 NMOS_0(.g(rst), .d(net_12), .s(gnd));
  not (strong0, strong1) #(100) inv_0 (slave, slaveBar);
  not (strong0, strong1) #(100) inv_1 (slaveBar, net_17);
  not (strong0, strong1) #(100) inv_2 (master, net_13);
  scanChainFive__scanL scanL_0(.in(net_12), .out(net_13));
  scanChainFive__scanL scanL_1(.in(net_14), .out(net_17));
  scanChainFive__scanP scanP_0(.in(phi1), .src(next), .drn(net_12));
  scanChainFive__scanP scanP_1(.in(phi2), .src(net_13), .drn(net_14));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_750 wire180_0(.a(master));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_1000 wire180_1(.a(slave));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_500
      wire180_2(.a(slaveBar));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_100 wire180_3(.a(next));
endmodule