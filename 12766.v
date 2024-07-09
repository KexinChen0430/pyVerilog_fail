module ExpRegLoadCtl (RomExpBregLC,
                    LoadOprs,
                    notAbortWB,
                    PreventSwap,
                    notSignBFromA,
                    ExpBregLC0,
                    ExpBregLC1,
                    ExpBregLoadEn);
input  [`u_ExpBregFromFunc1:`u_ExpBregFromFunc0] RomExpBregLC;
input  notAbortWB,
       PreventSwap,
       LoadOprs;
output notSignBFromA;
output ExpBregLC0,
       ExpBregLC1,
       ExpBregLoadEn;
ME_TIEOFF toff (vdd, );
ME_INVA iopl (LoadOprs, notLoadOprs);
ME_AND2 alcn1 (RomExpBregLC[`u_ExpBregFromFunc1], notLoadOprs, ExpBregLC1);
ME_AND2 alcn2 (RomExpBregLC[`u_ExpBregFromFunc0], notLoadOprs, ExpBregLC0);
ME_OR3 alcne  (RomExpBregLC[`u_ExpBregFromFunc0],
            RomExpBregLC[`u_ExpBregFromFunc1],
            LoadOprs,
            LoadEn);
ME_NAND2 alc4 (RomExpBregLC[`u_ExpBregFromFunc0],
            RomExpBregLC[`u_ExpBregFromFunc1],
            notSignBFromA);
//ME_AND3 en (LoadEn, notAbortWB, notPreventSwap, ExpBregLoadEn);
ME_NAND2 en0 (LoadEn, notAbortWB, notExpBregLoadEn_p);
ME_NMUX2B en1 (notExpBregLoadEn_p, PreventSwap, vdd, ExpBregLoadEn);
endmodule