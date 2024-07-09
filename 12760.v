module DecodeStatus (RomCtl[3:0], StatusControl[6:0]);
input  [3:0] RomCtl;
output [6:0] StatusControl;
// A-L are ouputs required            // Recoded into patterns
// A 010_0000                         // 1101
// B 110_0000                         // 1111
// C 000_0100                         // 1100
// D 100_0000                         // 1110
// E 000_1000                         // 1011
// F 100_1000                         // 1010
// G 001_0000                         // 1001
// H 101_0000                         // 1000
// I 010_0011                         // 0111
// J 000_0011                         // 0110
// K 000_0010                         // 0100
// L 000_0000                         // 0000
ME_INV_A i0 (RomCtl[3], notRomCtl3);
ME_INV_A i1 (RomCtl[2], notRomCtl2);
ME_INV_A i2 (RomCtl[1], notRomCtl1);
ME_INV_A i3 (RomCtl[0], notRomCtl0);
ME_AND3  b0 (notRomCtl3, RomCtl[2], RomCtl[1],             StatusControl[0]);
ME_AND2  b1 (notRomCtl3, RomCtl[2],                        StatusControl[1]);
ME_AND4  b2 (RomCtl[3], RomCtl[2], notRomCtl1, notRomCtl0, StatusControl[2]);
ME_AND3  b3 (RomCtl[3], notRomCtl2, RomCtl[1],             StatusControl[3]);
ME_AND3  b4 (RomCtl[3], notRomCtl2, notRomCtl1,            StatusControl[4]);
ME_NAND4 p0 (notRomCtl3, RomCtl[2], RomCtl[1], RomCtl[0],  t0);
ME_NAND3 p1 (RomCtl[3], RomCtl[2], RomCtl[0],              t1);
ME_NAND2 b5 (t0, t1,                                       StatusControl[5]);
ME_NAND3 p2 (RomCtl[3], RomCtl[2], RomCtl[1],              t2);
ME_NAND3 p3 (RomCtl[3], notRomCtl2, notRomCtl0,            t3);
ME_NAND2 b6 (t2, t3,                                       StatusControl[6]);
endmodule