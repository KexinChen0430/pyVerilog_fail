module MultiplierLSB (
// inputs
                      Rom_ResetMul,
                      notMultip,
                      notAbortWB,
                      SumInLSBs, CarryInLSBs,
                      SCLSBs, SBLSBs, SALSBs,
                      CCLSB, CBLSB, CALSB,
// outputs
                      Shift,
                      Pos,
                      Zero,
                      CarryOut0,
                      CarryOut3,
                      SumOut0,
                  SumCarryLoadEn,
                  InitialMulStep,
/* dhn--01/10/91	notInitialSumZero, */
                  InitialCarryBit);
input notAbortWB, Rom_ResetMul;
input [2:0] SumInLSBs, CarryInLSBs;
input [1:0] SCLSBs, SBLSBs, SALSBs;
input CCLSB, CBLSB, CALSB;
input [8:0] notMultip;
output [3:0] Shift, Pos, Zero;
output       CarryOut0,
             CarryOut3,
             SumOut0;
output            InitialCarryBit,
                  SumCarryLoadEn,
                  InitialMulStep;
/* dhn--01/10/91	notInitialSumZero; */
/* *************************************************
      Multipler Selection Decoding
MulSelCtl m13 (notMultip[8:6], Shift[3], Pos[3], Zero[3], CarryOut3);
MulSelCtl m12 (notMultip[6:4], Shift[2], Pos[2], Zero[2], CCIn);
MulSelCtl m11 (notMultip[4:2], Shift[1], Pos[1], Zero[1], CBIn);
MulSelCtl m10 (notMultip[2:0], Shift[0], Pos[0], Zero[0], CAIn);
/* *************************************************
      Full Add over LSBs and OR result
MulLSBlog lbg (SumInLSBs[2:1], CarryInLSBs[2:1],
            {SCLSBs, SBLSBs, SALSBs},
            {CCLSB, CCIn, CBLSB, CBIn, CALSB, CAIn},
            //ArraySStk,
            //ArrayCStk,
            CarryInLSBs[0], SumInLSBs[0],
           CarryOut0, SumOut0);
carrysaveregslsb csrl (Rom_ResetMul,
                  notMultip[0],
                  notAbortWB,
                  SumCarryLoadEn,
                  InitialMulStep,
/* dhn--01/10/91	notInitialSumZero, */
                  InitialCarryBit);
endmodule