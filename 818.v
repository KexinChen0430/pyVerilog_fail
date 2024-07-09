module jtag__o2a(inAa, inAb, inOb, out);
  input inAa;
  input inAb;
  input inOb;
  output out;
  supply1 vdd;
  supply0 gnd;
  wire net_0;
  nor (strong0, strong1) #(100) nor2_0 (net_0, inAa, inAb);
  redFour__nor2n_X_1_25_Delay_100_drive0_strong0_drive1_strong1
      nor2n_0(.ina(inOb), .inb(net_0), .out(out));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_100 wire180_0(.a(net_0));
endmodule