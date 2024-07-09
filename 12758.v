module CregLoadCtl (
// inputs
      RomCregCtl,
      QuoBits,
      notAbortWB,
      SNnotDB,
      CregSNBits,
// outputs
      InForCreg,
      InForCregDB,
      RomFracBSL2FromC,
      FracCregLoadCtl0,
      FracCregLoadEn);
input [`end_frac_creg_field:`start_frac_creg_field] RomCregCtl;
input [1:0] QuoBits;
input [1:0] CregSNBits;
input notAbortWB,
      SNnotDB;
output [1:0] InForCreg, InForCregDB;
output RomFracBSL2FromC;
output FracCregLoadCtl0,
       FracCregLoadEn;
wire [1:0] InForCregSN;
/* *********************************************************
   Control Logic For Creg
ME_INVA g100 (SNnotDB, DBnotSN);
ME_AND2 fg1s (QuoBits[1], RomCregCtl[`u_FracCregFromFunc0],
              InForCregSN[1]);
ME_AND2 fg0s (QuoBits[0], RomCregCtl[`u_FracCregFromFunc0],
              InForCregSN[0]);
ME_AND3 fg1d (QuoBits[1], DBnotSN, RomCregCtl[`u_FracCregFromFunc0],
              InForCregDB[1]);
ME_AND3 fg0d (QuoBits[0], DBnotSN, RomCregCtl[`u_FracCregFromFunc0],
              InForCregDB[0]);
ME_MUX2B fg1  (SNnotDB, CregSNBits[1], InForCregSN[1], InForCreg[1]);
ME_MUX2B fg0  (SNnotDB, CregSNBits[0], InForCregSN[0], InForCreg[0]);
ME_INVA fg9s (RomCregCtl[`u_FracCregFromFunc0], notResultOrQuoBits);
ME_AND2 icr9 (RomCregCtl[`u_FracCregFromFunc1], notResultOrQuoBits,
              RomFracBSL2FromC); // 1 0 ie SQRT
ME_INVA fgg  (notAbortWB, AbortWB);
ME_NOR2  icr (RomCregCtl[`u_FracCregFromFunc0],
              RomCregCtl[`u_FracCregFromFunc1],
              notEn);
ME_NOR2 rct (notEn,
             AbortWB,
             FracCregLoadEn);
/* Feedthroughs */
ME_BUFF g00 (RomCregCtl[`u_FracCregFromFunc1], FracCregLoadCtl0);
endmodule