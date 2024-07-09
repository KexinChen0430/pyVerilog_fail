module jtag__jtagScanControl(TDI, capture, phi1_fb, phi1_in, phi2_fb, phi2_in,
      sel, shift, update, TDO, phi1_out, phi2_out, read, write);
  input TDI;
  input capture;
  input phi1_fb;
  input phi1_in;
  input phi2_fb;
  input phi2_in;
  input sel;
  input shift;
  input update;
  output TDO;
  output phi1_out;
  output phi2_out;
  output read;
  output write;
  supply1 vdd;
  supply0 gnd;
  wire net_0, net_2;
  jtag__capture_ctl capture__0(.capture(capture), .phi2(phi2_in), .sel(sel),
      .out(read), .phi1(phi1_in));
  not (strong0, strong1) #(100) inv_0 (net_2, sel);
  not (strong0, strong1) #(100) inv_1 (net_0, TDI);
  jtag__shift_ctl shift_ct_0(.phi1_fb(phi1_fb), .phi2_fb(phi2_fb), .sel(sel),
      .shift(shift), .phi1_out(phi1_out), .phi2_out(phi2_out),
      .phi1_in(phi1_in), .phi2_in(phi2_in));
  jtag__tsinvBig tsinvBig_0(.Din(net_0), .en(sel), .enb(net_2), .Dout(TDO));
  jtag__update_ctl update_c_0(.sel(sel), .update(update), .out(write),
      .phi2(phi2_in));
endmodule