module onesch_sp (notNI[3:0], notsh1, notND[1:0]);
  input [3:0] notNI;
  output notsh1;
  output [1:0] notND ;
  ME_INV_A     i1 (notNI[1], NI1);
  ME_NAND2_B  i2 (NI1, notNI[2],   notBornotC);
  ME_NAND2_B  i3 (notNI[3], notBornotC, notsh1);
//  ME_INV_A  i1 (NI[2],             notNI2);
//  ME_O2A1I i2 (notNI[1], NI2, notNI[3], notsh1);
  ME_NAND2   r4 (notNI[0], notNI[1], notND[0] );
  ME_NAND2_B   r5 (notNI[2], notNI[3], notND[1] );
endmodule