module definition and body are reversed
						//**************************
input  Phi;
input
// 	notInitialSumZero, /
       InitialMulStep,
       InitialCarryBit,
       SumCarryLoadEn;
input [3:0]     Shift,
                Pos,
                Zero;
input  SumOut0,
       CarryOut0,
       CarryOut3;
input  [`FracMSB:1] Breg;
output [`FracMSB:0] SumIn, CarryIn;
output [1:0] SALSBs, SBLSBs, SCLSBs;
output       CALSB,  CBLSB,  CCLSB;
output [`FracMSB:1]SD; // original lines
output [`FracMSB:2]CD; // original lines
//output [`FracMSB:2]CD;
//output [`FracMSB:1]SD;
CSRegSlice csr       (Phi,
                      InitialMulStep,
// 		notInitialSumZero, /
                      InitialCarryBit,
                      SumCarryLoadEn,
                      {SD[`FracMSB:1], SumOut0},
                      {CD[`FracMSB:2], CarryOut3, CarryOut0},
                      Breg [`FracMSB:1],
                      SumIn[`FracMSB:0],
                      CarryIn[`FracMSB:0]);
CSArray csa   ( Shift,
                Pos,
                Zero,
                SumIn[`FracMSB:3],
                CarryIn[`FracMSB:3],
                Breg [`FracMSB:1],
                SALSBs, SBLSBs, SCLSBs,
                CALSB,  CBLSB,  CCLSB,
                SD[`FracMSB:1],
                CD[`FracMSB:2]);
endmodule