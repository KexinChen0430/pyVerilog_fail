module CSRegSlice    (Phi,
                      InitialMulStep,
/* 		notInitialSumZero, */
		      InitialCarryBit,
                      SumCarryLoadEn,
                      SumOut, CarryOut,
                      BregIn,
                      SumIn, CarryIn);
input  Phi;
input  InitialMulStep,
/* 	notInitialSumZero, */
       InitialCarryBit,
       SumCarryLoadEn;
input  [`FracMSB:0] SumOut, CarryOut;
input  [`FracMSB:1] BregIn;
output [`FracMSB:0] SumIn, CarryIn;
wire   [`FracMSB:0] SumReg, CarryReg, InitialSum;
ME_TIEOFF toff (vdd, gnd);
ME_FREGA_1_58 sr (Phi, SumCarryLoadEn, SumOut, SumReg);
ME_FREGA_1_58 cr (Phi, SumCarryLoadEn, CarryOut, CarryReg);
/* 	ME_NMUX_2B_58 iz (notInitialSumZero, */
ME_NMUX_2B_58 iz (InitialCarryBit,
                  {vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd,
                   vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd,
                   vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd,
                   vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd,
                   vdd, vdd}, // 58'h3FF_FFFF_FFFF_FFFF
                  {BregIn, vdd},
                  InitialSum);
ME_MUX_2B_58 si  (InitialMulStep, SumReg, InitialSum, SumIn);
ME_MUX_2B_58 ci  (InitialMulStep,
                  CarryReg,
                  {gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                   gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                   gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                   gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, // 56'h0
                   InitialCarryBit, gnd},
                  CarryIn);
endmodule