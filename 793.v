module scanChainFive__scanIRH(mclr, phi1, phi2, rd, sin, wr, dout, doutb,
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
  wire net_2, net_4, net_6, net_7;
  scanChainFive__scanL foo1(.in(net_6), .out(net_7));
  scanChainFive__scanL foo2(.in(net_2), .out(sout));
  scanChainFive__scanL foo3(.in(net_4), .out(doutb));
  not (strong0, strong1) #(100) invLT_0 (dout, doutb);
  scanChainFive__scanP scanP_0(.in(wr), .src(sout), .drn(net_4));
  scanChainFive__scanP scanP_1(.in(rd), .src(gnd), .drn(net_2));
  scanChainFive__scanP scanP_2(.in(mclr), .src(vdd), .drn(net_4));
  scanChainFive__scanP scanP_3(.in(phi1), .src(net_7), .drn(net_2));
  scanChainFive__scanP scanP_4(.in(phi2), .src(sin), .drn(net_6));
endmodule