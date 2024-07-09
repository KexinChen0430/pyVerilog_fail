module jtag__IRdecode(IR, IRb, Bypass, ExTest, SamplePreload, ScanPath);
  input [4:1] IR;
  input [4:1] IRb;
  output Bypass;
  output ExTest;
  output SamplePreload;
  output [12:0] ScanPath;
  supply1 vdd;
  supply0 gnd;
  wire H00, H01, H10, H11, L00, L01, L10, L11, net_19, net_21, net_23, net_25;
  wire net_26, net_27, net_28, net_29, net_30, net_31, net_32, net_33, net_34;
  wire net_35, net_36, net_37;
  not (strong0, strong1) #(100) inv_0 (Bypass, net_19);
  not (strong0, strong1) #(100) inv_1 (SamplePreload, net_21);
  not (strong0, strong1) #(100) inv_2 (ExTest, net_23);
  not (strong0, strong1) #(100) inv_3 (ScanPath[12], net_25);
  not (strong0, strong1) #(100) inv_4 (ScanPath[11], net_26);
  not (strong0, strong1) #(100) inv_5 (ScanPath[10], net_27);
  not (strong0, strong1) #(100) inv_6 (ScanPath[9], net_28);
  not (strong0, strong1) #(100) inv_7 (ScanPath[8], net_29);
  not (strong0, strong1) #(100) inv_8 (ScanPath[7], net_30);
  not (strong0, strong1) #(100) inv_9 (ScanPath[6], net_31);
  not (strong0, strong1) #(100) inv_10 (ScanPath[5], net_32);
  not (strong0, strong1) #(100) inv_11 (ScanPath[4], net_33);
  not (strong0, strong1) #(100) inv_12 (ScanPath[3], net_34);
  not (strong0, strong1) #(100) inv_13 (ScanPath[2], net_35);
  not (strong0, strong1) #(100) inv_14 (ScanPath[1], net_36);
  not (strong0, strong1) #(100) inv_15 (ScanPath[0], net_37);
  nand (strong0, strong1) #(100) nand2_0 (net_19, L11, H11);
  nand (strong0, strong1) #(100) nand2_1 (net_21, L10, H11);
  nand (strong0, strong1) #(100) nand2_2 (net_23, L01, H11);
  nand (strong0, strong1) #(100) nand2_3 (net_25, L00, H11);
  nand (strong0, strong1) #(100) nand2_4 (net_26, L11, H10);
  nand (strong0, strong1) #(100) nand2_5 (net_27, L10, H10);
  nand (strong0, strong1) #(100) nand2_6 (net_28, L01, H10);
  nand (strong0, strong1) #(100) nand2_7 (net_29, L00, H10);
  nand (strong0, strong1) #(100) nand2_8 (net_30, L11, H01);
  nand (strong0, strong1) #(100) nand2_9 (net_31, L10, H01);
  nand (strong0, strong1) #(100) nand2_10 (net_32, L01, H01);
  nand (strong0, strong1) #(100) nand2_11 (net_33, L00, H01);
  nand (strong0, strong1) #(100) nand2_12 (net_34, L11, H00);
  nand (strong0, strong1) #(100) nand2_13 (net_35, L10, H00);
  nand (strong0, strong1) #(100) nand2_14 (net_36, L01, H00);
  nand (strong0, strong1) #(100) nand2_15 (net_37, L00, H00);
  redFour__nor2n_X_3_Delay_100_drive0_strong0_drive1_strong1
      nor2n_0(.ina(IR[1]), .inb(IR[2]), .out(L00));
  redFour__nor2n_X_3_Delay_100_drive0_strong0_drive1_strong1
      nor2n_1(.ina(IRb[1]), .inb(IR[2]), .out(L01));
  redFour__nor2n_X_3_Delay_100_drive0_strong0_drive1_strong1
      nor2n_2(.ina(IR[1]), .inb(IRb[2]), .out(L10));
  redFour__nor2n_X_3_Delay_100_drive0_strong0_drive1_strong1
      nor2n_3(.ina(IRb[1]), .inb(IRb[2]), .out(L11));
  redFour__nor2n_X_3_Delay_100_drive0_strong0_drive1_strong1
      nor2n_4(.ina(IR[3]), .inb(IR[4]), .out(H00));
  redFour__nor2n_X_3_Delay_100_drive0_strong0_drive1_strong1
      nor2n_5(.ina(IRb[3]), .inb(IR[4]), .out(H01));
  redFour__nor2n_X_3_Delay_100_drive0_strong0_drive1_strong1
      nor2n_6(.ina(IR[3]), .inb(IRb[4]), .out(H10));
  redFour__nor2n_X_3_Delay_100_drive0_strong0_drive1_strong1
      nor2n_7(.ina(IRb[3]), .inb(IRb[4]), .out(H11));
endmodule