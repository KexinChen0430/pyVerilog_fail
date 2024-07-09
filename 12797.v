module SignLogic (Phi, Reset,
                  RomSignLength,
                  Rom_Unimplemented,
                  Rom_StatusCCBit0, Rom_StatusCCBit1,
                  SignOpA, SignOpB,
                  NegateOprSign,
                  LoadOprs,
                  notAbortWB, PreventSwap,
                  U_RoundingMode0,
                  Unimplemented,
                  notSignAFromB, notSignBFromA,
                  AregSign, AregXORBreg,
                  U_CouldBeRI_0,
                  FpExc_Unimp,
                  ConditionCodes,
                  SignResult);
input  Phi, Reset;
input  [`u_SignAregFromResult:`u_SignResultFromFunction0]RomSignLength;
input  Rom_StatusCCBit0, Rom_StatusCCBit1, Rom_Unimplemented;
input  SignOpA, SignOpB,
       LoadOprs,
       notAbortWB,
       PreventSwap,
       U_RoundingMode0, // Unlatched rounding mode bit 0
       NegateOprSign;
input  Unimplemented;
input notSignAFromB,
      notSignBFromA;
output AregSign,
       AregXORBreg,
       U_CouldBeRI_0,   // Unlatched for next cycle
       SignResult;
output FpExc_Unimp;
output [1:0] ConditionCodes;
ME_TIEOFF toff (vdd, gnd);
// Sign function                          //
// Bits Function
// 0 0  Areg
// 0 1  Positive // Forced on reset
// 1 0  notAreg
// 1 1  AregXORBreg
ME_OR2 orr (Reset, RomSignLength[`u_SignResultFromFunction0],
         SignResCtl0);
ME_XOR2 xorabs (AregSign, BregSign, AregXORBreg);
ME_MUX4B msc0 (SignResCtl0, RomSignLength[`u_SignResultFromFunction1],
               AregSign, gnd, notAregSign, AregXORBreg,
               SignResult);
// Sign Registers                         //
ME_XOR2 xorop (SignOpA, NegateOprSign, SignedSignOpA);
ME_INV_A salc (notSignAFromB, SignAFromB);
ME_OR4     ggdf (RomSignLength[`u_SignAregFromResult], Reset,
              SignAFromB, LoadOprs, PosAEn);
ME_NAND2   sae1   ( PosAEn, notAbortWB, notAregLoadEn_p);
//ME_OR2_B   sae2 ( notAregLoadEn_p, PreventSwap, notSignAregLoadEn);
ME_MUX2B  saop    ( RomSignLength[`u_SignAregFromResult], BregSign, SignResult, JSign);
ME_NMUX2B saxp    ( LoadOprs, JSign, SignedSignOpA, notSignAInput);
ME_MUX2B_B  asmp  ( notAregLoadEn_p, notSignAInput, notAregSign, notSignAInput_p );
ME_NMUX2B_B asm   ( notPreventSwap, notAregSign, notSignAInput_p, U_AregSign );
ME_FD1_B    asf   ( Phi, U_AregSign, AregSign, notAregSign );
// Added a bit of tack to see the rounding mode earlier
ME_XNOR2_B u0_v1  ( U_RoundingMode0, notSignAInput_p, U_RM0_notSAI);
ME_XNOR2_B u0_v2  ( U_RoundingMode0, notAregSign, U_RM0_notSA);
ME_NMUX2B_B asmv  ( PreventSwap, U_RM0_notSAI, U_RM0_notSA, U_CouldBeRI_0 );
ME_INV_A sblc     ( notSignBFromA, SignBFromA);
ME_OR2  gbdf      ( SignBFromA, LoadOprs, PosBEn);
ME_INV_A sbe2     ( PreventSwap, notPreventSwap);
ME_NAND3 sbe      ( PosBEn, notAbortWB, notPreventSwap, notSignBregLoadEn);
ME_NMUX2B sbxp    ( LoadOprs, AregSign, SignOpB, notSignBInput);
ME_NMUX2B bsm     ( notSignBregLoadEn, notSignBInput, notBregSign, U_BregSign );
ME_FD1    bsf     ( Phi, U_BregSign, BregSign, notBregSign );
// Exception and Condition Code           //
ME_OR2 codie (Unimplemented, Rom_Unimplemented, FpExc_Unimp);
ME_NOR2 stg7  (Rom_StatusCCBit0, Rom_StatusCCBit1,
           Equals);
ME_NOR2 stg8  (Rom_StatusCCBit0, BregSign,    notNegative);
ME_NOR2 stg9  (Rom_StatusCCBit0, notBregSign, notPositive);
ME_NOR2 stgA (Equals, notPositive, ConditionCodes[1]);
ME_NOR2 stgB (Equals, notNegative, ConditionCodes[0]);
endmodule