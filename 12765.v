module ExpConstantCtl (SNnotDB, DBnotSN,
                       RomExpConCtl,
             Constantb, Constantc, Constantd, Constante,
             Constantf, Constantg, Constanth);
input SNnotDB, DBnotSN ;
input [`end_constant_field:`start_constant_field] RomExpConCtl;
output Constantb, Constantc, Constantd, Constante,
       Constantf, Constantg, Constanth;
/* ************************************************************
   Length Dependant Constant Selection
               a    b    c  d     e f g h     ROMbit f1 f0   SNnotBD
   DivLoopSN   0|00 00|0 00 0 |   0 1 1 0             0  1     1
   DivLoopDB   0|00 00|0 00 0 |   1 1 0 1             0  1     0
   BiasSN      0|00 00|0 11 1 |   1 1 1 1             1  1     1
   BiasDB      0|00 11|1 11 1 |   1 1 1 1             1  1     0
   1           0|00 00|0 00 0 |   0 0 0 1             0  0     ?
   IntToReal   0|00 00|0 00 1 |   1 1 1 1             1  0     ?
Constantb = Func1 & Func0 & DB;
Constantc = Func1 & Func0;
Constantd = Func1;
Constante = Func1 | (Func0 & DBnotSN);
Constantf = Func1 | Func0;
Constantg = Func1 | ~Constanth;
Constanth = ~(~Func1 & Func0 & SNnotDB); */
//ME_INVA   z90 (SNnotDB, DBnotSN );
ME_AND3_B z00 (RomExpConCtl[`u_ConstantFromFunc1],
             RomExpConCtl[`u_ConstantFromFunc0],
             DBnotSN, Constantb);
ME_AND2_B z01 (RomExpConCtl[`u_ConstantFromFunc1],
             RomExpConCtl[`u_ConstantFromFunc0],
             Constantc);
ME_AND2_B z02 (RomExpConCtl[`u_ConstantFromFunc0], DBnotSN, Func0andDB);
ME_OR2_B  z03 (RomExpConCtl[`u_ConstantFromFunc1], Func0andDB, Constante);
ME_OR2_B  z04 (RomExpConCtl[`u_ConstantFromFunc1],
            RomExpConCtl[`u_ConstantFromFunc0],
            Constantf);
ME_INVA   z05 (RomExpConCtl[`u_ConstantFromFunc1], notFunc1);
ME_NAND2_B  z07 (notFunc1, Constanth, Constantg);
ME_NAND3_B  z06 (notFunc1, RomExpConCtl[`u_ConstantFromFunc0], SNnotDB, Constanth);
//wire Constantd = RomExpConCtl[`u_ConstantFromFunc1];
con1 ep (RomExpConCtl[`u_ConstantFromFunc1], Constantd);
endmodule