module NormCalLog  (notSLFromNorm[3:0],
                    ShiftBy8,
                    ExpYCtl0, ExpYCtl1,
                    ExpYbus[3:0],
                    ExpYbusS[3:0],
                    SLControl);
input  [3:0] notSLFromNorm;
input  ShiftBy8;
input  ExpYCtl0, ExpYCtl1;
input  [3:0] ExpYbus;
output [3:0] ExpYbusS;
output [3:0]SLControl;
wire   [3:0] notExpYbus;
wire   [3:0] notSLControl ;
  ME_INVA  i0 (ExpYCtl1, notExpYCtl1);
  ME_INVA  i1 (ShiftBy8, notShiftBy8);
  ME_NAND3 n0 (ExpYCtl0, notExpYCtl1, notShiftBy8, notUseFastNorm);
  ME_INV_B    i2 (ExpYbus[0], notExpYbus[0]);
  ME_INV_B    i3 (ExpYbus[1], notExpYbus[1]);
  ME_INV_B    i4 (ExpYbus[2], notExpYbus[2]);
  ME_INV_B    i5 (ExpYbus[3], notExpYbus[3]);
  ME_NMUX2B_B i33 (notUseFastNorm, notSLFromNorm[3], notExpYbus[3], ExpYbusS[3]);
  ME_NMUX2B_B i32 (notUseFastNorm, notSLFromNorm[2], notExpYbus[2], ExpYbusS[2]);
  ME_NMUX2B_B i31 (notUseFastNorm, notSLFromNorm[1], notExpYbus[1], ExpYbusS[1]);
  ME_NMUX2B_B i30 (notUseFastNorm, notSLFromNorm[0], notExpYbus[0], ExpYbusS[0]);
  ME_INV_A    i6 (ExpYbusS[0], notSLControl[0]);
  ME_INV_A    i7 (ExpYbusS[1], notSLControl[1]);
  ME_INV_A    i8 (ExpYbusS[2], notSLControl[2]);
  ME_INV_A    i9 (ExpYbusS[3], notSLControl[3]);
  ME_INV_A    ia (notSLControl[0], SLControl[0]);
  ME_INV_A    ib (notSLControl[1], SLControl[1]);
  ME_INV_A    ic (notSLControl[2], SLControl[2]);
  ME_INV_A    id (notSLControl[3], SLControl[3]);
endmodule