module twosch (NI[7:0],sh1,sh2,notNO[1:0] );
input [7:0] NI ;
output sh1, sh2 ;
output [1:0] notNO ; // true OR value here
wire   [3:0] notNR ;
   onesch    m1 (NI[3:0], notsh1a, notNR[1:0]);
   onesch    m2 (NI[7:4], notsh1b, notNR[3:2]);
   notonesch m3 (notNR[3:0], sh2,  notNO[1:0]);
   // anything set on top then take s1 from top
   ME_NMUX2B    m4 (notNO[1], notsh1b, notsh1a, sh1 );
endmodule