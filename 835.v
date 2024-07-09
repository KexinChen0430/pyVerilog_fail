module jtag__jtagControl(TCK, TDI, TDIx, TMS, TRSTb, phi1_fb, phi2_fb, Cap,
      ExTest, SelBS, SelDR, Shft, TDOb, Upd, phi1, phi2);
  input TCK;
  input TDI;
  input TDIx;
  input TMS;
  input TRSTb;
  input phi1_fb;
  input phi2_fb;
  output Cap;
  output ExTest;
  output SelBS;
  output [12:0] SelDR;
  output Shft;
  output TDOb;
  output Upd;
  output phi1;
  output phi2;
  supply1 vdd;
  supply0 gnd;
  wire jtagScan_0_write, net_0, net_1, net_2, net_3, net_6, net_8, net_10;
  wire net_33, net_35, net_37, net_38, net_41, net_47, net_48, net_50, net_51;
  wire net_52, net_55, net_56, net_62, net_64, net_68, net_73, net_75, net_79;
  wire net_97, net_99, net_103, net_128, tapCtlJK_0_Idle, tapCtlJK_0_PauseDR;
  wire tapCtlJK_0_PauseIR, tapCtlJK_0_Reset, tapCtlJK_0_SelDR, tapCtlJK_0_SelIR;
  wire tapCtlJK_0_X1DR, tapCtlJK_0_X2DR, tapCtlJK_0_X2IR;
  wire [8:1] IR;
  wire [8:1] IRb;
  jtag__BR BR_0(.SDI(TDI), .phi1(net_68), .phi2(net_73), .read(net_99),
      .SDO(net_97));
  jtag__IR IR_0(.SDI(TDI), .phi1(net_79), .phi2(net_75), .read(net_55),
      .reset(net_56), .write(net_103), .IR(IR[8:1]), .IRb(IRb[8:1]),
      .SDO(net_128));
  jtag__IRdecode IRdecode_0(.IR(IR[4:1]), .IRb(IRb[4:1]), .Bypass(net_41),
      .ExTest(ExTest), .SamplePreload(net_47), .ScanPath(SelDR[12:0]));
  redFour__PMOSwk_X_0_222_Delay_100 PMOSwk_0(.g(gnd), .d(TDIx), .s(vdd));
  jtag__clockGen clockGen_0(.clk(TCK), .phi1_fb(phi1_fb), .phi2_fb(phi2_fb),
      .phi1_out(net_10), .phi2_out(net_8));
  not (strong0, strong1) #(100) inv_0 (net_0, net_3);
  not (strong0, strong1) #(100) inv_1 (SelBS, net_48);
  not (strong0, strong1) #(100) inv_2 (net_6, net_50);
  not (strong0, strong1) #(100) inv_3 (Cap, net_37);
  not (strong0, strong1) #(100) inv_4 (Shft, net_51);
  not (strong0, strong1) #(100) inv_5 (net_51, net_52);
  not (strong0, strong1) #(100) inv_6 (Upd, net_38);
  jtag__jtagIRControl jtagIRCo_0(.capture(net_62), .phi1_fb(net_79),
      .phi1_in(phi1), .phi2_fb(net_75), .phi2_in(phi2), .shift(net_2),
      .update(net_64), .phi1_out(net_79), .phi2_out(net_75), .read(net_55),
      .write(net_103));
  jtag__jtagScanControl jtagScan_0(.TDI(net_97), .capture(Cap),
      .phi1_fb(net_68), .phi1_in(phi1), .phi2_fb(net_73), .phi2_in(phi2),
      .sel(net_41), .shift(Shft), .update(gnd), .TDO(TDIx), .phi1_out(net_68),
      .phi2_out(net_73), .read(net_99), .write(jtagScan_0_write));
  jtag__mux2_phi2 mux2_phi_0(.Din0(TDIx), .Din1(net_128), .phi2(phi2),
      .sel(net_0), .Dout(net_50));
  nand (strong0, strong1) #(100) nand2_0 (net_37, IR[8], net_35);
  nand (strong0, strong1) #(100) nand2_1 (net_38, IR[7], net_33);
  nor (strong0, strong1) #(100) nor2_0 (net_3, net_1, net_2);
  nor (strong0, strong1) #(100) nor2_1 (net_48, net_47, ExTest);
  jtag__scanAmp1w1648 scanAmp1_0(.in(net_6), .out(TDOb));
  jtag__scanAmp1w1648 scanAmp1_1(.in(net_8), .out(phi2));
  jtag__scanAmp1w1648 scanAmp1_2(.in(net_10), .out(phi1));
  jtag__tapCtlJKL tapCtlJK_0(.TMS(TMS), .TRSTb(TRSTb), .phi1(phi1),
      .phi2(phi2), .CapDR(net_35), .CapIR(net_62), .Idle(tapCtlJK_0_Idle),
      .PauseDR(tapCtlJK_0_PauseDR), .PauseIR(tapCtlJK_0_PauseIR),
      .Reset(tapCtlJK_0_Reset), .Reset_s(net_56), .SelDR(tapCtlJK_0_SelDR),
      .SelIR(tapCtlJK_0_SelIR), .ShftDR(net_52), .ShftIR(net_2),
      .UpdDR(net_33), .UpdIR(net_64), .X1DR(tapCtlJK_0_X1DR), .X1IR(net_1),
      .X2DR(tapCtlJK_0_X2DR), .X2IR(tapCtlJK_0_X2IR));
endmodule