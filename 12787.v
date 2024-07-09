module notonesch (notNI[3:0], sh1, notND[1:0]);
  input [3:0] notNI;
  output sh1;
  output [1:0] notND ;
  ME_INV_A     i1 (notNI[1], NI1);
  ME_NAND2_B  i2 (NI1, notNI[2],   notBornotC);
  ME_AND2_B   i3 (notNI[3], notBornotC, sh1);
//  ME_INV_A  i1 (notNI[1], NI1);
//  ME_INV_A  i2 (notNI[3], NI3);
//  ME_A2O1I i3 (NI1, notNI[2], NI3, sh1);
  ME_AND2_B    r4 (notNI[0], notNI[1], notND[0] );
  ME_AND2_B    r5 (notNI[2], notNI[3], notND[1] );
endmodule