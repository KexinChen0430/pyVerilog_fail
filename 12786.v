module onesch (NI[3:0], notsh1, notNR[1:0]);
  input [3:0] NI;
  output notsh1;
  output [1:0] notNR ;
  ME_INV_A i1 (NI[1],             notNI1);
  ME_NOR2 i2 (NI[2], notNI1,   notBornotC);
  ME_OR2  i3 (NI[3], notBornotC, notsh1);
//  ME_INV_A  i1 (NI[1],             notNI1);
//  ME_INV_A  i2 (NI[3],             notNI3);
//  ME_O2A1I i3 (notNI1, NI[2], notNI3, notsh1);
  ME_NOR2_B r4 (NI[0], NI[1], notNR[0] );
  ME_NOR2_B r5 (NI[2], NI[3], notNR[1] );
endmodule