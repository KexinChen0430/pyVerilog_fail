module SampledWaitCtl (
   RomShiftAlign, RomShiftForInt, RomLeftnotRight,
   notReset,
   notAbortNulExc,
   notWaitForShifter,
   notNO[1:0],
   notIdleLatched,
   UpdateOutputs,
   notSampledWait);
input  RomShiftAlign, RomShiftForInt, RomLeftnotRight;
input  notReset, notAbortNulExc;
input  notWaitForShifter;
input [1:0]  notNO;
input  notIdleLatched;
output  UpdateOutputs, notSampledWait;
// Cycle maybe nullifed ie AbortNulExc
ME_INVA swrb2 (RomLeftnotRight,    RightnotLeft);
ME_OR2_B n0 ( notNO[1], notNO[0], notWaitForNorm ) ;
ME_NMUX2B swrb3 (RomLeftnotRight, notWaitForShifter, notWaitForNorm, WaitQ);
ME_NOR2 swmzs (RomShiftForInt, RightnotLeft, RomWaitForNorm);
ME_OR2 swmis (RomShiftAlign, RomWaitForNorm, RomWaitForShifter);
ME_AND3 g1_0 (notReset, notAbortNulExc, RomWaitForShifter, notPreventWait);
// Add muxes
ME_NAND2_B sweb (WaitQ, notPreventWait, notSampledWait);
ME_AND2 wwpp2 (notSampledWait, notIdleLatched, UpdateOutputs);
endmodule