module redFour__nor2n_X_3_Delay_100_drive0_strong0_drive1_strong1(ina, inb,
      out);
  input ina;
  input inb;
  output out;
  supply1 vdd;
  supply0 gnd;
  nor (strong0, strong1) #(100) nor2_0 (out, ina, inb);
endmodule