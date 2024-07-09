module DecodeCmpAndNeg (
       Phi,
       FpInst2, FpInst3, FpInst6, FpInst7,
       FPOP2Map,
       CMPDecoded, CMPEDecoded, NegateOprSign);
input  Phi,
       FpInst2, FpInst3, FpInst6, FpInst7, FPOP2Map;
output CMPDecoded, CMPEDecoded;
output NegateOprSign;
ME_INVA dcep1 (FpInst2, notFpInst2);
ME_NAND2 dcep2 (FPOP2Map, notFpInst2, notCMP);
ME_NAND2 dcep3 (FPOP2Map, FpInst2, notCMPE);
ME_FD1 dcep4  (Phi, notCMP, , CMPDecoded);
ME_FD1 dcep5  (Phi, notCMPE, , CMPEDecoded);
ME_INVA dcep9 (FpInst3, notFpInst3);
ME_INVA dcep6 (FpInst7, notFpInst7);
ME_AND4 dcep7 (FpInst6, notFpInst7, FpInst2, notFpInst3, DyadicSub);
ME_NOR2 decep8 (FPOP2Map, DyadicSub, s_0);
ME_FD1 iggypop (Phi, s_0, , NegateOprSign);
endmodule