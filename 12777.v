module MISelect (Phi,
                 notReset,
                 notBrTaken,
                 notDecodedUnimp,
                 MIFromInstN, MIFromInstB,
                 notAbortInst, notAbortNulExc,
                 notResetOrUnimp,
                 DyadicOprExc, notSampledWait,
                 FpOp,
                 notSingleCycInst,
// outputs
                 BTHeld,
                 Busy, notIdleHeld,
                 notInstAndNoExc,
                 MILoadEnable);
input Phi, notReset;
input    notBrTaken,
         notDecodedUnimp,
         MIFromInstN, MIFromInstB,
         notAbortInst, notAbortNulExc,
         notResetOrUnimp,
         DyadicOprExc, notSampledWait,
         FpOp,
         notSingleCycInst;    // Is single cycle
output   BTHeld;
output   Busy, notIdleHeld,
         notInstAndNoExc,
         MILoadEnable;
ME_TIEOFF toff (vdd, gnd);
ME_INVA iecepl (DyadicOprExc, notDyadicOprExc);
// Decide if next is new Inst      //
// MIFromInstN  Execute Inst if Br not taken
// MIFromInstB  Execute Inst Br taken
//                        Note delay cycle
ME_NAND3 g4_0 (MIFromInstN, notAbortNulExc, notSampledWait,
               notMIFromInstNExc);
ME_NAND2 g4_1 (MIFromInstN, notAbortNulExc, // notSampledWait, Shouldnt be a function of this
               notMIFromInstNExcNS);
ME_NAND2 g4_2 (MIFromInstB, notSampledWait, notMIFromInstBW);
ME_FD1   g4_3 (Phi, notMIFromInstBW, , MIFromInstBHeld);
ME_NAND2 g4_4 (BTHeld, MIFromInstBHeld, s_0);
ME_FD1   g4_5  (Phi, notResetOrUnimp, nots_1, );
ME_AND4  g4_6 (s_0, nots_1, notSingleCycInst, notIdleHeld, notZZTop);
ME_NAND2 g4_7 (notZZTop, notMIFromInstNExc, MIFromInst);
ME_NAND2 g4_8 (notZZTop, notMIFromInstNExcNS, MIFromInstNS);
// Are we going to be idle                //
ME_INVA   g5_0 (FpOp, notFpOp);
ME_NAND2  g5_1 (MIFromInst, notFpOp, notIdleIfNotBred);
ME_FD1    g5_3 (Phi, notIdleIfNotBred, notIIfNotBredHld, );
ME_NMUX2B g5_2 (notBTHeld, vdd, notIIfNotBredHld, IdleHeldNR);
ME_NAND2  g5_4 (IdleHeldNR, notReset, notIdleHeld);
// Select next MI for ROM to decode    //
// Combine Wait Exception and Br logic into ROM control
ME_BUF_B mie0 (notSampledWait, MILoadEnable); // Buff over 8 bits
ME_NAND3_B g0_0  (MIFromInstNS, notDyadicOprExc, notResetOrUnimp,
                  notInstAndNoExc);
// Started New Inst                //
// Requirement for testing for implemented entry points.
// These need to be qualified as being the first Inst
// since garbage code may jump through an entry point
// thus setting the implemented flag.
// Optimise
// Latch BT
ME_FD1 g2_1  (Phi, notBrTaken, notBTHeld, BTHeld);
// FPU Busy                               //
// Remain busy while aborting an Unimp
ME_AND4 ggh7   (notAbortInst, notDyadicOprExc,
                MIFromInst, notSampledWait,
                notMIsBusyBT0);
ME_AND2 ggh8   (notMIsBusyBT0, notDecodedUnimp, notBusyBT0);
ME_NMUX2B_B ggh9 (notBrTaken, gnd, notBusyBT0, Busy);
endmodule