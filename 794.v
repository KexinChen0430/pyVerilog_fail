module scanChainFive__scanIRL(mclr, phi1, phi2, rd, sin, wr, dout, doutb,
      sout);
  input mclr;
  input phi1;
  input phi2;
  input rd;
  input sin;
  input wr;
  output dout;
  output doutb;
  output sout;
  supply1 vdd;
  supply0 gnd;
  wire net_2, net_3, net_4, net_6;
  scanChainFive__scanL foo1(.in(net_2), .out(net_3));
  scanChainFive__scanL foo2(.in(net_4), .out(sout));
  scanChainFive__scanL foo3(.in(net_6), .out(doutb));
  not (strong0, strong1) #(100) invLT_0 (dout, doutb);
  scanChainFive__scanP scanP_0(.in(rd), .src(vdd), .drn(net_4));
  scanChainFive__scanP scanP_1(.in(mclr), .src(vdd), .drn(net_6));
  scanChainFive__scanP scanP_2(.in(wr), .src(sout), .drn(net_6));
  scanChainFive__scanP scanP_3(.in(phi1), .src(net_3), .drn(net_4));
  scanChainFive__scanP scanP_4(.in(phi2), .src(sin), .drn(net_2));
endmodule