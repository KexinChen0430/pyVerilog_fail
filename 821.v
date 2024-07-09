module jtag__slaveBit(din, phi2, slave);
  input din;
  input phi2;
  output slave;
  supply1 vdd;
  supply0 gnd;
  wire net_6, net_7;
  not (strong0, strong1) #(100) inv_0 (slave, net_7);
  scanChainFive__scanL scanL_0(.in(net_6), .out(net_7));
  scanChainFive__scanP scanP_0(.in(phi2), .src(din), .drn(net_6));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_500 wire180_0(.a(slave));
endmodule