module jtag__shift_ctl(phi1_fb, phi2_fb, sel, shift, phi1_out, phi2_out,
      phi1_in, phi2_in);
  input phi1_fb;
  input phi2_fb;
  input sel;
  input shift;
  output phi1_out;
  output phi2_out;
  input phi1_in;
  input phi2_in;
  supply1 vdd;
  supply0 gnd;
  wire net_1, net_2, net_3, net_4, net_7;
  jtag__clockGen clockGen_0(.clk(net_7), .phi1_fb(phi1_fb), .phi2_fb(phi2_fb),
      .phi1_out(phi1_out), .phi2_out(phi2_out));
  scanChainFive__scanL foo(.in(net_2), .out(net_3));
  not (strong0, strong1) #(100) inv_0 (net_7, net_4);
  not (strong0, strong1) #(100) inv_1 (net_1, shift);
  nand (strong0, strong1) #(100) nand3_0 (net_4, sel, net_3, phi1_in);
  scanChainFive__scanP scanP_0(.in(phi2_in), .src(net_1), .drn(net_2));
endmodule