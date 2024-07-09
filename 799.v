module jtag__clockGen(clk, phi1_fb, phi2_fb, phi1_out, phi2_out);
  input clk;
  input phi1_fb;
  input phi2_fb;
  output phi1_out;
  output phi2_out;
  supply1 vdd;
  supply0 gnd;
  wire net_0, net_1, net_3, net_4, net_6;
  not (strong0, strong1) #(100) inv_0 (phi2_out, net_3);
  not (strong0, strong1) #(100) inv_1 (phi1_out, net_6);
  not (strong0, strong1) #(100) inv_2 (net_4, clk);
  not (strong0, strong1) #(100) invLT_0 (net_0, phi1_fb);
  not (strong0, strong1) #(100) invLT_1 (net_1, phi2_fb);
  nand (strong0, strong1) #(100) nand2_0 (net_3, net_0, net_4);
  nand (strong0, strong1) #(100) nand2_1 (net_6, net_1, clk);
endmodule