module NullExcepLogic (Phi, notReset,
                       RomNullifyOnBrOr,
                       RomOprExc,
                       BTLatched, notSampledWait,
                       FpLd,
                       notAInfNan, notAZeroDenorm,
                       notBInfNan, notBZeroDenorm,
                       ExMIptrLSBs,
                       AregOprExc,
                       DyadicOprExc,
                       notAbortNulExc,
                       notAbortWB);
input  Phi, notReset,          // System Clock Reset
       RomNullifyOnBrOr,  // Nullify if we Br
       RomOprExc,   // Check for Op Exception
       BTLatched,     // We have Bring
       notSampledWait,            // Don't nullify if waiting
       FpLd,                   // FpLd Force write back
       notAInfNan, notAZeroDenorm,
       notBInfNan, notBZeroDenorm;
output [2:0] ExMIptrLSBs;
output notAbortNulExc,
       AregOprExc,
       DyadicOprExc,
       notAbortWB;
// Nullification for Br               //
// An unwaited output is used to prevent locking in the NULL state
// NullEx is fedback to prevent locking
// ie only one NULL cycle will occur.
// The signal notNullifyOnBr is therefore 'If the Br is
// taken
ME_AND2 rb (RomNullifyOnBrOr, notNullEx, NullifyOnBr);
// ME_INVA  sx  (SampledWait, notSampledWait);
// Optimise
// ME_NAND3 re  (notSampledWait, BrTaken, NullifyOnBr, notND);
// These ROM outputs occur on Phi and then cause write back events
// themselves.
// ME_FD1 rf   (Phi, notND, notNullEx, NullEx);
ME_NAND2 re (notSampledWait, NullifyOnBr, notNDBTMiss);
ME_FD1 rf   (Phi, notNDBTMiss, , NullExBTMiss);
ME_NAND2 g_1 (BTLatched, NullExBTMiss, notNullEx);
ME_INVA g_0 (notNullEx, NullEx);
// NullEx is used to clear the Nullify
// This is used to generate the abort for the write back of
// the nullified cycle. It is combined with the ExcCycle
// and DyadicOprExc signals and to produce AbortWB
// Check Opr Exception                //
ME_NAND2 exg1 (notAInfNan, notAZeroDenorm, AregOprExc);
ME_NAND2 exg2 (notBInfNan, notBZeroDenorm, BregOprExc);
ME_OR2_B exg3   (AregOprExc, BregOprExc, OprExc);
// Operand Exception Address Generation   //
// quick
ME_AND2 eag1 (AregOprExc, BregOprExc, ExMIptrLSBs[2]);
ME_NAND2 eag2 (AregOprExc, notBInfNan, ExMIptrLSBs[1]);
ME_OR2 eag3  (AregOprExc, notBInfNan, notAnormandBin);
ME_NAND2 eag5 (notAnormandBin, notAInfNan, ExMIptrLSBs[0]);
// Control Operand Exception              //
// Ignore Exception if Nullified on previous
ME_AND4   ssss (RomOprExc, notNullEx, notReset, notExcCycle, OprExcEtc);
ME_AND2_B cko  (OprExc, OprExcEtc, DyadicOprExc);
ME_FD1 zrd (Phi, DyadicOprExc, ExcCycle, notExcCycle);
// Aborting                               //
// Exc and NullEx require next operation to be aborted.
// In addition Exception requires current operation to be aborted.
// Aborting is acheived by preventing results of this cycle to
// be written back.
ME_OR2     yyy (ExcCycle, NullEx, AbortNulExc);
ME_INVA    yyc (AbortNulExc, notAbortNulExc);
ME_OR2_B   yyb (DyadicOprExc, AbortNulExc, AbortWBNoLoad);
ME_NAND2_B yyd (AbortWBNoLoad, notFpLd, notAbortWB);		// Drives a few
ME_INVA    yye (FpLd, notFpLd);
endmodule