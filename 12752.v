module AregLoadCtl (ROM,
                    LoadOprs,
                    notAbortWB,
                    PreventSwap,
                    FracAregLC, FracAregLoadEn,
                    LoadFromMult,    // Export to Breg
                    SelInitRemBits);
input [`end_frac_areg_field:`start_frac_areg_field] ROM;
input  LoadOprs,
       notAbortWB,
       PreventSwap;
output [2:0] FracAregLC;
output FracAregLoadEn,
       LoadFromMult,
       SelInitRemBits;
ME_TIEOFF toff (vdd, gnd);
ME_INVA iopl (LoadOprs, notLoadOprs);
ME_AND2 alcn1 (ROM[`u_FracAregFromFunc2], notLoadOprs,
               FracAregLC[2]);
ME_AND2 alcn2 (ROM[`u_FracAregFromFunc1], notLoadOprs,
               FracAregLC[1]);
ME_AND2 alcn3 (ROM[`u_FracAregFromFunc0], notLoadOprs,
               FracAregLC[0]);
ME_OR4  alcne (ROM[`u_FracAregFromFunc0],
               ROM[`u_FracAregFromFunc1],
               ROM[`u_FracAregFromFunc2],
               LoadOprs,
               LoadEn);
//ME_AND3  alcni (LoadEn, notAbortWB, notPreventSwap, FracAregLoadEn);
ME_AND2    alcni (LoadEn, notAbortWB, FracAregLoadEn_p);
ME_NMUX2B_B  alcn0 (FracAregLoadEn_p, vdd, PreventSwap, FracAregLoadEn);
ME_AND3  alcnf (ROM[`u_FracAregFromFunc0],
                ROM[`u_FracAregFromFunc1],
                ROM[`u_FracAregFromFunc2],
                LoadFromMult);      // 1 1 1
ME_INVA   alcn7 (ROM[`u_FracAregFromFunc0], notFunc0);
ME_INVA   alcn8 (ROM[`u_FracAregFromFunc2], notFunc2);
ME_AND3_B alcnh (notFunc0,
                ROM[`u_FracAregFromFunc1],
                notFunc2,
                SelInitRemBits);    // 0 1 0 ie FracAregFromFracBreg
endmodule