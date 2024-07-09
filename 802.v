module jtag__update_ctl(sel, update, out, phi2);
  input sel;
  input update;
  output out;
  input phi2;
  supply1 vdd;
  supply0 gnd;
  wire net_1;
  not (strong0, strong1) #(100) inv_0 (out, net_1);
  nand (strong0, strong1) #(100) nand3_0 (net_1, sel, update, phi2);
endmodule