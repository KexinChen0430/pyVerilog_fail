module ImplementedCheck (Phi,
// input
                         ResetImp,
                         notReset,
                         FpOp,
                         EntryPoint,
                         FpInst,             // sparc FP inst field
// outputs
                         notDecodedUnImp,
                         notUnimpOrReset,
                         notAbortInst, ResetAbortInst,
                         FPOP2Map,
                         UnImpOut);
input Phi,
      ResetImp,  // Reset beore modification
      notReset,     // Reset After modification
      FpOp,
      EntryPoint;
input [9:4] FpInst;
output notDecodedUnImp;   // Go busy quickly
output notUnimpOrReset,
       notAbortInst,       // Aborting so remain busy for two extra cycles
       ResetAbortInst,
       FPOP2Map,
       UnImpOut;
// Imp Check                      //
ME_NAND2 idg0 (FpInst[4], FpInst[6], notFpInst4and6);
ME_OR2   idg1 (FpInst[7], notFpInst4and6, notFPOP2Map);
ME_INV_B idg2 (notFPOP2Map, FPOP2Map);
ME_XOR2  idg3 (FpInst[9], FPOP2Map, notEntryMap);
ME_OR2   idg4 (notEntryMap, FpInst[8], UnImpMap);
ME_INV_A rrr7 (notReset, Reset);
ME_OR2   ggh3 (FpOp, Reset, UnImpMapEn);
ME_FD1E  ggh1 (Phi, UnImpMapEn, UnImpMap, , ImpMap);
ME_FD1   rrr6 (Phi, FpOp, FpOpHeld, notFpOpHeld);
ME_INVA  ggh2 (ResetImp, notResetImp);
ME_NAND3 ggh4 (ImpMap, EntryPoint, notReset, notImpStart);
ME_NAND3 ddfd (notImpStart, notResetImp, FpOpHeld, notDecodedUnImp);
ME_NAND2   g_1  (notFpOpHeld, notReset, FpOpHeldOrReset);
ME_NAND2_B g_3  (FpOpHeldOrReset, notImpStart, notUnimpOrReset);
ME_OR2   icor (FpOpHeld, ResetImp, NewInsOrReset);
ME_FD1E  ni   (Phi, NewInsOrReset, notDecodedUnImp, , UnImpOut );
// Kill UnImp Inst         //
// KillUnImp is used to abort loading of MIptr
// In addition it is used to cause at least three busy cycles
// after which the FPU will accept new Insts
// The FPU is kept in reset until the last busy cycle
ME_FD1   ggh11 (Phi, notDecodedUnImp, notRemainBusy1, RemainBusy1);
ME_FD1   ggh12 (Phi, notRemainBusy1, notRemainBusy2, RemainBusy2);
ME_NAND2 ggh5  (notDecodedUnImp, notRemainBusy1,
                ResetAbortInst);
ME_AND2  ggh6  (notRemainBusy1, notRemainBusy2, notAbortInst);
endmodule