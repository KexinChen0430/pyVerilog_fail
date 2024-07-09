module SignDp ( Phi, Reset,
                RomSignLength,
                RomStatus,
                FracXFromRound,
                XDest,
                CMPDecoded, CMPEDecoded,
                SignOpA, SignOpB,
                notAbortWB, PreventSwap,
                FpLd, FpOp,
                NegateOprSign,
                notSignAFromB, notSignBFromA,
                OprRoundMode,
                FpInst1,
                Unimplemented,
                SignResult,
                AregSign, AregXORBreg,
                FpExc_Unimp,
                Status_6_2,
                ConditionCodes,
                OprSNnotDB, SNnotDB, DBnotSN,
                MulLenSel,
                RModeMinus,
                FracRoundOut );
input Phi, Reset;
input [`end_sign_field:`start_sign_field] RomSignLength;
input [`end_status_field:`start_status_field] RomStatus;
input FracXFromRound; // Optimised signal
input XDest;
input SignOpA, SignOpB,
      notAbortWB, PreventSwap,
      FpLd, FpOp, NegateOprSign;
input notSignAFromB,
      notSignBFromA,
      FpInst1,
      Unimplemented;
input [1:0] OprRoundMode;
input CMPDecoded, CMPEDecoded;
output SignResult, AregSign, AregXORBreg;
output FpExc_Unimp;
output [1:0] ConditionCodes;
output OprSNnotDB, SNnotDB, DBnotSN;
output [4:0]MulLenSel;
output RModeMinus;
output [4:0] FracRoundOut ;
output [6:2] Status_6_2;
wire notRN ;
wire [4:1] FracRound;
assign FracRoundOut = {FracRound[4:1], notRN} ;
wire [6:0] Status;
assign Status_6_2 = Status[6:2] ;
wire [1:0] U_RoundingMode;
SignLogic sl (Phi, Reset,
              RomSignLength [`u_SignAregFromResult:`u_SignResultFromFunction0],
              RomStatus[`u_Unimplemented],
              Status[0], Status[1],
              SignOpA, SignOpB,
              NegateOprSign,
              FpLd,
              notAbortWB, PreventSwap,
              U_RoundingMode[0],
              Unimplemented,
              notSignAFromB, notSignBFromA,
              AregSign, AregXORBreg,
              U_CouldBeRI_0,  // Bent place to do but needs a lot of sign stuff
              FpExc_Unimp,
              ConditionCodes,
              SignResult);
RoundModeLogic rml (Phi,
                  OprRoundMode,
                  FpLd,
                  notAbortWB,
                  CMPDecoded, CMPEDecoded,
                  RomSignLength [`u_SetRoundingModeToMinus],
                  RModeMinus,
                  U_RoundingMode);
LengthLogic ll (Phi, Reset,
                FpInst1,
                FpLd, FpOp,
                RomSignLength[`u_ToggleLength],
                notAbortWB,
                OprSNnotDB,
                SNnotDB,
                U_SNnotDB,
                DBnotSN,
                MulLenSel);
DecodeStatus ds (RomStatus[`u_status3:`u_status0],
                 Status);
/* For the Rounding cycles make some of controls faster */
ME_AND2    v2  (U_RoundingMode[1], U_CouldBeRI_0, U_CouldBeRI);
ME_FD1_B   x1  (Phi, U_CouldBeRI, CouldBeRI, );
ME_AND3_B  s2  (U_RoundingMode[1], U_CouldBeRI_0, U_SNnotDB, U_CouldBeRISN);
ME_FD1_B   x4  (Phi, U_CouldBeRISN, CouldBeRISN, );
ME_NOR2    v3  (U_RoundingMode[1], U_RoundingMode[0], U_CouldBeRN);
ME_FD1_B   x2  (Phi, U_CouldBeRN, CouldBeRN, );
ME_AND2_B  s1  (U_CouldBeRN, U_SNnotDB, U_CouldBeRNSN);
ME_FD1_B   x3  (Phi, U_CouldBeRNSN, CouldBeRNSN, );
// FracXbus comes from Breg or a constant
// want to constuct constant as fields
// ie
//   2  1       23        1        28        1  2
//  00  0 000_00..00_0000 0 0000_00..00_0000 0 00 Zero
//  00  1 000_00..00_0000 0 0000_00..00_0000 0 00 One
//  00  0 000_00..00_0000 1 1111_11..11_1111 1 11 RC SN 2
//  00  0 000_00..00_0000 0 1111_11..11_1111 1 11 RC SN 1
//  00  0 000_00..00_0000 0 0000_00..00_0000 1 11 RC DB 2
//  00  0 000_00..00_0000 0 0000_00..00_0000 0 11 RC DB 1
// Field Names
//  a   b c               d e                f g
// a == 0
// b == FracXbusFrom1
// c == 0
// d == RI & SN
// e == (RI | RN) & SN
// f == RI | (RN & SN)
// g == RI | RN
// 00 = Round Nearest
// 01 = Round Zero ( Truncate )
// 10 = Round positive infinity
// 11 = Round negative infinity
// Round Nearest
ME_NAND2 rg4   (CouldBeRN, FracXFromRound, notRN);
ME_NAND2 rzz1s (CouldBeRNSN, FracXFromRound, notRNSN);
// Round Infinities //
ME_NAND2 rv2   (CouldBeRI, FracXFromRound, notRI);
ME_NAND2 rv3   (CouldBeRISN, FracXFromRound, notRISN);
// Constant d
ME_INV_B rlokout (notRISN, FracRound[4]);
// Constant e
ME_AND2_B  s3  (U_RoundingMode[1], U_SNnotDB, U_RMode1SN);
ME_AND2_B  s4  (U_RMode1SN, U_CouldBeRI_0, U_CouldBeRISNa);
ME_OR2 rc0 (U_CouldBeRNSN, U_CouldBeRISNa, U_constante);
ME_FD1_B rc1 (Phi, U_constante, r_constante, );
ME_NAND2_B rv03 (r_constante, XDest, notConstante);
//ME_AND2_B  rvo3  (notRNSN, notRISN, notConstante);
ME_INV_D   rvo4  (notConstante, FracRound[3]); // Has fanout of 28
// Constant f
ME_NAND2_B rvo2  (notRNSN, notRI, FracRound[2]);
// Constant g
ME_NAND2_B rvo1  (notRI, notRN, FracRound[1]);
// FracRound[4:1] Constantd, Constante, Constantf, Constantg,
// FracRound[0] = notRN
endmodule