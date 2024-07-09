module carrysaveregslsb (Rom_ResetMul,
                  notMultip0,
                  notAbortWB,
                  SumCarryLoadEn,
                  InitialMulStep,
/* dhn--01/10/90	notInitialSumZero, */
                  InitialCarryBit);
input  Rom_ResetMul,
       notAbortWB,
       notMultip0;
output InitialCarryBit,
       SumCarryLoadEn,
       InitialMulStep;
/*** dhn--01/10/90	output notInitialSumZero ;
//wire notInitialSumZero = InitialCarryBit;
  con1 g0 (InitialCarryBit, notInitialSumZero);
  ME_BUFF  g00 (notAbortWB,      SumCarryLoadEn);
  ME_INV_B g01 (notMultip0,      InitialCarryBit);
  ME_BUFF  g02 (Rom_ResetMul,    InitialMulStep);
endmodule