module ShiftRight (Areg,
                 SRControl,
                 SROneMore,
                 SRToSticky,
		 TopBitsIn,
// outputs
                 S8_3_0,
                 S4_1_0,
                 S2_0,
                 S1_1_0,
                 notSRResult);
input [`FracMSB:0] Areg;
input [3:0] SRControl;
input            SROneMore,
                 SRToSticky;
input [8:0] TopBitsIn;
output [3:0] S8_3_0;
output [1:0] S4_1_0;
output	     S2_0;
output [1:0] S1_1_0;
output [`FracMSB:1] notSRResult;
wire [`FracMSB:0] S8, S4, S2, S1;
wire [`FracMSB:0] SE;
assign S8_3_0 = S8[3:0] ;
assign S4_1_0 = S4[1:0] ;
assign S2_0   = S2[0] ;
assign S1_1_0 = S1[1:0] ;
  ME_NMUX2B_B   g87 (SRControl[3],       // Buffer MSB seperately
                     Areg[`FracMSB],
                     TopBitsIn[8],
                     S8[`FracMSB]);     // False
  ME_NMUX_2B_57 g86 (SRControl[3],
                     Areg[`FracMSB-1:0],
                     {TopBitsIn[8], TopBitsIn[8:0], Areg[`FracMSB-3:8]},
                     S8[`FracMSB-1:0]);     // False
  ME_NMUX_2B_58 g21 (SRControl[2],
                     S8,
                     {S8[`FracMSB], S8[`FracMSB],S8[`FracMSB],S8[`FracMSB],
                      S8[`FracMSB:4]},
                     S4);           // True
  ME_NMUX_2B_58 g23 (SRControl[1],
                     S4,
                     {S4[`FracMSB], S4[`FracMSB],S4[`FracMSB:2]},
                     S2);           // False
  ME_NMUX_2B_58 g24 (SRControl[0],
                     S2,
                     {S2[`FracMSB],    S2[`FracMSB:1]},
                     S1);           // True
  ME_NMUX_2B_58 g25 (SROneMore,
                     S1,
                     {S1[`FracMSB],    S1[`FracMSB:1]},
                     SE);         // False
  ME_INV_B      g50 (SRToSticky, notSRToSticky);
  ME_INV_C      g51 (notSRToSticky, BSRToSticky);
  ME_OR2_B      h01 (BSRToSticky, SE[01], notSRResult[01]);
  ME_OR2_B      h02 (BSRToSticky, SE[02], notSRResult[02]);
  ME_OR2_B      h03 (BSRToSticky, SE[03], notSRResult[03]);
  ME_OR2_B      h04 (BSRToSticky, SE[04], notSRResult[04]);
  ME_OR2_B      h05 (BSRToSticky, SE[05], notSRResult[05]);
  ME_OR2_B      h06 (BSRToSticky, SE[06], notSRResult[06]);
  ME_OR2_B      h07 (BSRToSticky, SE[07], notSRResult[07]);
  ME_OR2_B      h08 (BSRToSticky, SE[08], notSRResult[08]);
  ME_OR2_B      h09 (BSRToSticky, SE[09], notSRResult[09]);
  ME_OR2_B      h10 (BSRToSticky, SE[10], notSRResult[10]);
  ME_OR2_B      h11 (BSRToSticky, SE[11], notSRResult[11]);
  ME_OR2_B      h12 (BSRToSticky, SE[12], notSRResult[12]);
  ME_OR2_B      h13 (BSRToSticky, SE[13], notSRResult[13]);
  ME_OR2_B      h14 (BSRToSticky, SE[14], notSRResult[14]);
  ME_OR2_B      h15 (BSRToSticky, SE[15], notSRResult[15]);
  ME_OR2_B      h16 (BSRToSticky, SE[16], notSRResult[16]);
  ME_OR2_B      h17 (BSRToSticky, SE[17], notSRResult[17]);
  ME_OR2_B      h18 (BSRToSticky, SE[18], notSRResult[18]);
  ME_OR2_B      h19 (BSRToSticky, SE[19], notSRResult[19]);
  ME_OR2_B      h20 (BSRToSticky, SE[20], notSRResult[20]);
  ME_OR2_B      h21 (BSRToSticky, SE[21], notSRResult[21]);
  ME_OR2_B      h22 (BSRToSticky, SE[22], notSRResult[22]);
  ME_OR2_B      h23 (BSRToSticky, SE[23], notSRResult[23]);
  ME_OR2_B      h24 (BSRToSticky, SE[24], notSRResult[24]);
  ME_OR2_B      h25 (BSRToSticky, SE[25], notSRResult[25]);
  ME_OR2_B      h26 (BSRToSticky, SE[26], notSRResult[26]);
  ME_OR2_B      h27 (BSRToSticky, SE[27], notSRResult[27]);
  ME_OR2_B      h28 (BSRToSticky, SE[28], notSRResult[28]);
  ME_OR2_B      h29 (BSRToSticky, SE[29], notSRResult[29]);
  ME_OR2_B      h30 (BSRToSticky, SE[30], notSRResult[30]);
  ME_OR2_B      h31 (BSRToSticky, SE[31], notSRResult[31]);
  ME_OR2_B      h32 (BSRToSticky, SE[32], notSRResult[32]);
  ME_OR2_B      h33 (BSRToSticky, SE[33], notSRResult[33]);
  ME_OR2_B      h34 (BSRToSticky, SE[34], notSRResult[34]);
  ME_OR2_B      h35 (BSRToSticky, SE[35], notSRResult[35]);
  ME_OR2_B      h36 (BSRToSticky, SE[36], notSRResult[36]);
  ME_OR2_B      h37 (BSRToSticky, SE[37], notSRResult[37]);
  ME_OR2_B      h38 (BSRToSticky, SE[38], notSRResult[38]);
  ME_OR2_B      h39 (BSRToSticky, SE[39], notSRResult[39]);
  ME_OR2_B      h40 (BSRToSticky, SE[40], notSRResult[40]);
  ME_OR2_B      h41 (BSRToSticky, SE[41], notSRResult[41]);
  ME_OR2_B      h42 (BSRToSticky, SE[42], notSRResult[42]);
  ME_OR2_B      h43 (BSRToSticky, SE[43], notSRResult[43]);
  ME_OR2_B      h44 (BSRToSticky, SE[44], notSRResult[44]);
  ME_OR2_B      h45 (BSRToSticky, SE[45], notSRResult[45]);
  ME_OR2_B      h46 (BSRToSticky, SE[46], notSRResult[46]);
  ME_OR2_B      h47 (BSRToSticky, SE[47], notSRResult[47]);
  ME_OR2_B      h48 (BSRToSticky, SE[48], notSRResult[48]);
  ME_OR2_B      h49 (BSRToSticky, SE[49], notSRResult[49]);
  ME_OR2_B      h50 (BSRToSticky, SE[50], notSRResult[50]);
  ME_OR2_B      h51 (BSRToSticky, SE[51], notSRResult[51]);
  ME_OR2_B      h52 (BSRToSticky, SE[52], notSRResult[52]);
  ME_OR2_B      h53 (BSRToSticky, SE[53], notSRResult[53]);
  ME_OR2_B      h54 (BSRToSticky, SE[54], notSRResult[54]);
  ME_OR2_B      h55 (BSRToSticky, SE[55], notSRResult[55]);
  ME_OR2_B      h56 (BSRToSticky, SE[56], notSRResult[56]);
  ME_OR2_B      h57 (BSRToSticky, SE[57], notSRResult[57]);
endmodule