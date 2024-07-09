module LengthLogic (Phi, Reset,
                    FpInst1,
                    FpLd,
                    FpOp,
                    RomToggleLength,
                    notAbortWB,
                    OprSNnotDB,
                    BuffSNnotDB,
                    U_SNnotDB,
                    DBnotSN,
                    MulLenSel);
input  Phi, Reset,
       FpInst1, FpLd, FpOp, RomToggleLength, notAbortWB;
output OprSNnotDB,
       U_SNnotDB,
       DBnotSN,
       BuffSNnotDB;
output [4:0]MulLenSel;
/* *************************************** */
/* Operand Length Logic                    */
/* *************************************** */
// MUX to FpInst if FpOp
//               else used FpInst from previous cycle  (original code)
// ME_FD1_B   crg1  (Phi, FpInst1, notOprSNnotDBL, );
// ME_MUX2B_B mlen  (FpOp, notOprSNnotDBL, FpInst1, notOprSNnotDB);
	// timing fix -- dhn 04/15/91 -- this will only work if FpLd is
	// always asserted 1 cycle after FpOp, never simultaneously
ME_FD1_B   crg1  (Phi, FpInst1, notOprSNnotDB, );
ME_INV_C   new0  (notOprSNnotDB, OprSNnotDB);
/* *************************************** */
/* Length Latch                            */
/* *************************************** */
ME_AND2    rmg3  (RomToggleLength, notAbortWB, LenFromnotLen);
ME_OR3     ell   (FpLd, LenFromnotLen, Reset, Enable);
ME_NOR2    cllr  (SNnotDB, Reset, notResetSNnotDB);
ME_NMUX2B  lm    (FpLd, notResetSNnotDB, OprSNnotDB, notMuxedLength);
ME_NMUX2B  llm   (Enable, DBnotSNb, notMuxedLength, U_SNnotDB);
ME_INVA    lli   (U_SNnotDB, U_DBnotSN);
ME_FD1_B   llf   (Phi, U_SNnotDB, SNnotDB, DBnotSNb);
ME_FD1_B   lif   (Phi, U_DBnotSN, DBnotSN, );
ME_FD1_B   lig   (Phi, U_DBnotSN, DBnotSNa, ); // goes only to
ME_INV_C   llb   (DBnotSNa, BuffSNnotDB);      // High drive version
ME_FD1_B   llf0  (Phi, U_SNnotDB, MulLenSel[0], );
ME_FD1_B   llf1  (Phi, U_SNnotDB, MulLenSel[1], );
ME_FD1_B   llf2  (Phi, U_SNnotDB, MulLenSel[2], );
ME_FD1_B   llf3  (Phi, U_SNnotDB, MulLenSel[3], );
ME_FD1_B   llf4  (Phi, U_SNnotDB, MulLenSel[4], );
endmodule