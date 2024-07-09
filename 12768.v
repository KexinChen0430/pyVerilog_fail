module ExpShifter ( Phi,
                    notExpResult,
                    Rom_ShBy8,
                    Rom_ShiftForAl,
                    SRControl,
                    SROneMore,
                    SRToSticky,
                    notWaitForShifter);
input Phi;                      // master clock
input [12:0] notExpResult;       // fraction add result only use 5:0
input Rom_ShBy8,             // for either int or mul
      Rom_ShiftForAl;        // alignment
output [3:0] SRControl; // Shift right size ( 0 to 15 )
                                // Delay for this is
                                // MUX2B
output SROneMore,       // extra one to give shift of 16
       SRToSticky;      // Massive shift reduce to sticky
output notWaitForShifter;       // Need to generate this quickly
                                // delay is NOR4, NAND3, AND4
                                // Dont care unless ShiftforAl asserted
ME_TIEOFF toff (,gnd);
// generate correct shift right value. This may be either forced to 8
// for mul or INT stuff, or 0 to 16 for first step of align, or
// further shifts by 16 if required
// Generate wait if additional shift is required
// Note shift by 16 is a delayed shift wait except on first shift
// SRToSticky Being asserted means the rest of the shifter doesnt
// matter. Note since in the shifter the sticky is set to one this
// must NOT be applied to zero fraction parts.
// Wait is only valid while Rom_ShiftforAl is asserted
  ME_NAND3  g12 ( notExpResult[5], notExpResult[4], FS, notSmallShift );
  ME_NAND6_B gxz ( notExpResult[11], notExpResult[10], notExpResult[9], notExpResult[8], notExpResult[7], notExpResult[6], BigShift);
  ME_NMUX2B_B sm4 ( FS, gnd, BigShift, notSRToSticky);
  ME_INV_B   g19 ( notSRToSticky, SRToSticky );
  // Can align in 1 for BigShift or small shift 00xxxx or exact 010000
  ME_AND2   gr5  ( notSmallShift, notShiftCount1, bozoid );
  ME_NAND2  g15  ( notSRToSticky, bozoid, notWaitForShifter );
  // note shift by 8 is dominant so dont worry about FS on shift by 8
  ME_FD1    err ( Phi, Rom_ShiftForAl, , notPrevShift);
  ME_NAND2  g32 ( Rom_ShiftForAl, notPrevShift, notFS );
  ME_INVA   g33 ( notFS, FS );
  wire [5:4] ExpResult;
  // Decrement on notFS, OR ShBy16first
  ME_INV_A   g16 ( notExpResult[5], ExpResult[5] );
  ME_INV_A   g17 ( notExpResult[4], ExpResult[4] );
  ShiftDec  d  ( Phi, FS, notFS, ExpResult[5:4], notShiftCount1 );
  // Set correct shift value
  ME_NOR2    sby8 (Rom_ShBy8, Rom_ShiftForAl, notShiftBy8);
  ME_INV_A    sbfa (Rom_ShiftForAl, notRom_ShiftForAl);
  ME_NMUX2B_B  sm3 (FS, notShiftBy8,       notExpResult[3], SRControl[3]);
  ME_NMUX2B_B  sm2 (FS, notRom_ShiftForAl, notExpResult[2], SRControl[2]);
  ME_NMUX2B_B  sm1 (FS, notRom_ShiftForAl, notExpResult[1], SRControl[1]);
  ME_NMUX2B_B  sm0 (FS, notRom_ShiftForAl, notExpResult[0], SRControl[0]);
  ME_AND2_B  a90 (Rom_ShiftForAl, notFS, SROneMore);
endmodule