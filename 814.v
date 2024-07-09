module redFour__nand2n_X_1_25_Delay_100_drive0_strong0_drive1_strong1(ina, inb,
      out);
  input ina;
  input inb;
  output out;
  supply1 vdd;
  supply0 gnd;
  nand (strong0, strong1) #(100) nand2_0 (out, ina, inb);
endmodule