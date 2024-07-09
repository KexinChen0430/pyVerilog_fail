module jtag__tapCtlJKL(TMS, TRSTb, phi1, phi2, CapDR, CapIR, Idle, PauseDR,
      PauseIR, Reset, Reset_s, SelDR, SelIR, ShftDR, ShftIR, UpdDR, UpdIR,
      X1DR, X1IR, X2DR, X2IR);
  input TMS;
  input TRSTb;
  input phi1;
  input phi2;
  output CapDR;
  output CapIR;
  output Idle;
  output PauseDR;
  output PauseIR;
  output Reset;
  output Reset_s;
  output SelDR;
  output SelIR;
  output ShftDR;
  output ShftIR;
  output UpdDR;
  output UpdIR;
  output X1DR;
  output X1IR;
  output X2DR;
  output X2IR;
  supply1 vdd;
  supply0 gnd;
  wire net_0, net_2, net_4, net_6, net_12, net_13, net_14, net_15, net_16;
  wire net_17, net_18, net_19, net_20, net_22, net_23, net_24, net_25, net_26;
  wire net_28, net_29, net_31, net_32, net_34, net_40, net_43, net_44, net_48;
  wire net_50, net_52, net_54, net_55, net_56, net_58, net_59, net_60, net_64;
  wire net_67, net_68, net_70, net_71, net_72, net_74, net_75, net_76, net_79;
  wire net_80, rst, stateBit_1_slave, stateBit_5_slaveBar, stateBit_6_slaveBar;
  wire stateBit_9_slaveBar, stateBit_10_slaveBar, stateBit_11_slave;
  wire stateBit_12_slave;
  not (strong0, strong1) #(100) inv_0 (rst, TRSTb);
  not (strong0, strong1) #(100) inv_1 (net_24, net_12);
  redFour__nand2n_X_3_5_Delay_100_drive0_strong0_drive1_strong1
      nand2n_0(.ina(net_13), .inb(net_14), .out(net_0));
  redFour__nand2n_X_1_25_Delay_100_drive0_strong0_drive1_strong1
      nand2n_1(.ina(net_15), .inb(net_16), .out(net_4));
  redFour__nand2n_X_1_25_Delay_100_drive0_strong0_drive1_strong1
      nand2n_2(.ina(net_17), .inb(net_18), .out(net_2));
  redFour__nand2n_X_1_25_Delay_100_drive0_strong0_drive1_strong1
      nand2n_3(.ina(net_19), .inb(net_20), .out(net_6));
  redFour__nor2n_X_1_25_Delay_100_drive0_strong0_drive1_strong1
      nor2n_0(.ina(net_12), .inb(net_23), .out(net_22));
  redFour__nor2n_X_1_25_Delay_100_drive0_strong0_drive1_strong1
      nor2n_1(.ina(net_24), .inb(net_26), .out(net_25));
  redFour__nor2n_X_1_25_Delay_100_drive0_strong0_drive1_strong1
      nor2n_2(.ina(net_24), .inb(net_29), .out(net_28));
  redFour__nor2n_X_1_25_Delay_100_drive0_strong0_drive1_strong1
      nor2n_3(.ina(net_24), .inb(net_32), .out(net_31));
  redFour__nor2n_X_1_25_Delay_100_drive0_strong0_drive1_strong1
      nor2n_4(.ina(net_12), .inb(net_26), .out(net_34));
  jtag__o2a o2a_0(.inAa(net_2), .inAb(net_43), .inOb(net_12), .out(net_40));
  jtag__o2a o2a_1(.inAa(net_6), .inAb(net_0), .inOb(net_12), .out(net_44));
  jtag__o2a o2a_2(.inAa(net_50), .inAb(net_0), .inOb(net_24), .out(net_48));
  jtag__o2a o2a_3(.inAa(net_54), .inAb(net_55), .inOb(net_12), .out(net_52));
  jtag__o2a o2a_4(.inAa(net_58), .inAb(net_59), .inOb(net_12), .out(net_56));
  jtag__o2a o2a_5(.inAa(net_58), .inAb(net_43), .inOb(net_24), .out(net_60));
  jtag__o2a o2a_6(.inAa(net_54), .inAb(net_67), .inOb(net_24), .out(net_64));
  jtag__o2a o2a_7(.inAa(net_70), .inAb(net_71), .inOb(net_24), .out(net_68));
  jtag__o2a o2a_8(.inAa(net_74), .inAb(net_75), .inOb(net_24), .out(net_72));
  jtag__o2a o2a_9(.inAa(Reset_s), .inAb(net_79), .inOb(net_24), .out(net_76));
  jtag__o2a o2a_10(.inAa(net_4), .inAb(net_67), .inOb(net_12), .out(net_80));
  jtag__slaveBit slaveBit_0(.din(TMS), .phi2(phi2), .slave(net_12));
  jtag__stateBit stateBit_0(.next(net_25), .phi1(phi1), .phi2(phi2), .rst(rst),
      .master(SelIR), .slave(net_79), .slaveBar(net_23));
  jtag__stateBit stateBit_1(.next(net_48), .phi1(phi1), .phi2(phi2), .rst(rst),
      .master(SelDR), .slave(stateBit_1_slave), .slaveBar(net_26));
  jtag__stateBit stateBit_2(.next(net_34), .phi1(phi1), .phi2(phi2), .rst(rst),
      .master(CapDR), .slave(net_75), .slaveBar(net_16));
  jtag__stateBit stateBit_3(.next(net_22), .phi1(phi1), .phi2(phi2), .rst(rst),
      .master(CapIR), .slave(net_71), .slaveBar(net_18));
  jtag__stateBit stateBit_4(.next(net_44), .phi1(phi1), .phi2(phi2), .rst(rst),
      .master(Idle), .slave(net_50), .slaveBar(net_20));
  jtag__stateBit stateBit_5(.next(net_68), .phi1(phi1), .phi2(phi2), .rst(rst),
      .master(X1IR), .slave(net_58), .slaveBar(stateBit_5_slaveBar));
  jtag__stateBit stateBit_6(.next(net_72), .phi1(phi1), .phi2(phi2), .rst(rst),
      .master(X1DR), .slave(net_54), .slaveBar(stateBit_6_slaveBar));
  jtag__stateBit stateBit_7(.next(net_80), .phi1(phi1), .phi2(phi2), .rst(rst),
      .master(ShftDR), .slave(net_74), .slaveBar(net_15));
  jtag__stateBit stateBit_8(.next(net_40), .phi1(phi1), .phi2(phi2), .rst(rst),
      .master(ShftIR), .slave(net_70), .slaveBar(net_17));
  jtag__stateBit stateBit_9(.next(net_28), .phi1(phi1), .phi2(phi2), .rst(rst),
      .master(X2IR), .slave(net_43), .slaveBar(stateBit_9_slaveBar));
  jtag__stateBit stateBit_10(.next(net_31), .phi1(phi1), .phi2(phi2),
      .rst(rst), .master(X2DR), .slave(net_67),
      .slaveBar(stateBit_10_slaveBar));
  jtag__stateBit stateBit_11(.next(net_64), .phi1(phi1), .phi2(phi2),
      .rst(rst), .master(UpdDR), .slave(stateBit_11_slave),
      .slaveBar(net_14));
  jtag__stateBit stateBit_12(.next(net_60), .phi1(phi1), .phi2(phi2),
      .rst(rst), .master(UpdIR), .slave(stateBit_12_slave),
      .slaveBar(net_13));
  jtag__stateBit stateBit_13(.next(net_56), .phi1(phi1), .phi2(phi2),
      .rst(rst), .master(PauseIR), .slave(net_59), .slaveBar(net_29));
  jtag__stateBit stateBit_14(.next(net_52), .phi1(phi1), .phi2(phi2),
      .rst(rst), .master(PauseDR), .slave(net_55), .slaveBar(net_32));
  jtag__stateBitHI stateBit_15(.next(net_76), .phi1(phi1), .phi2(phi2),
      .rstb(TRSTb), .master(Reset), .slave(Reset_s), .slaveBar(net_19));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_100 wire180_0(.a(net_4));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_100 wire180_1(.a(net_2));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_100 wire180_2(.a(net_6));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_675 wire180_3(.a(net_0));
  orangeTSMC180nm__wire180_width_3_layer_1_LEWIRE_1_1500 wire180_4(.a(rst));
endmodule