module BregLoadCtl (RomFracBregLC,
                    RomBSL2InFromC,
                    LoadOprs,
                    notAbortWB,
                    PreventSwap,
         LoadFromMult,
         CregInSL2SQRT,
         FracBregLC, FracBregLoadEn,
         InFromCregOr0);
input [`end_frac_breg_field:`start_frac_breg_field] RomFracBregLC;
input LoadFromMult;
input LoadOprs;
input RomBSL2InFromC,
      notAbortWB, PreventSwap;
input [1:0] CregInSL2SQRT;
output [2:0] FracBregLC;
output       FracBregLoadEn;
output [1:0] InFromCregOr0;
ME_TIEOFF toff (vdd, gnd);
// SQRT Logic
ME_AND2 ssg81 (CregInSL2SQRT[1], RomBSL2InFromC, InFromCregOr0[1]);
ME_AND2 ssg80 (CregInSL2SQRT[0], RomBSL2InFromC, InFromCregOr0[0]);
// Breg Load Control
ME_INVA iopl (LoadOprs, notLoadOprs);
ME_AND2 alcn3 (LoadFromMult,                        notLoadOprs, FracBregLC[2]);
ME_AND2 alcn2 (RomFracBregLC[`u_FracBregFromFunc1], notLoadOprs, FracBregLC[1]);
ME_AND2 alcn1 (RomFracBregLC[`u_FracBregFromFunc0], notLoadOprs, FracBregLC[0]);
ME_OR4  alcne (RomFracBregLC[`u_FracBregFromFunc0],
               RomFracBregLC[`u_FracBregFromFunc1],
               LoadFromMult,
               LoadOprs,
               LoadEn);
//ME_AND3 brme (LoadEn, notAbortWB, notPreventSwap, FracBregLoadEn);
ME_AND2      alcni (LoadEn, notAbortWB, FracBregLoadEn_p);
ME_NMUX2B_B  alcn0 (FracBregLoadEn_p, vdd, PreventSwap, FracBregLoadEn);
endmodule