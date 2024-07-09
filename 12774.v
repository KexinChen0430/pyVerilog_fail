module MIptr (Phi,
              ExMIptrLSBs,
              DyadicExc,
              notInstAndNoExc,
              notBranchTakenMIS,
              notResetOrUnimp,
              MIptrLoadEnable,
              Feedback, FpInst,
	      SelectedMIptr,
              RomMIptr, notRomMIptr);
input [2:0] ExMIptrLSBs;
input [`MIptrMSB:0] Feedback;
input [7:0] FpInst;
input Phi;
input DyadicExc,
      notInstAndNoExc,
      notBranchTakenMIS,
      notResetOrUnimp,
      MIptrLoadEnable;
output [`MIptrMSB:0] SelectedMIptr, RomMIptr, notRomMIptr;
ME_TIEOFF toff (vdd, gnd);
/* ****************************************************** *
wire [`MIptrMSB:0] NextMIptr;
// Operand Exception Address Generation   //
ME_OR2 om2n6 (RomMIptr[2], notRomMIptr[6], MI2ornotMI6);
ME_NAND2 om16  (notRomMIptr[1], notRomMIptr[6], MI6orMI1);
MiptrIncrement mii (RomMIptr, NextMIptr);
MIptrMultiplexor mim
                 (Phi,
                  DyadicExc,
                  notInstAndNoExc,
                  notBranchTakenMIS,
                  notResetOrUnimp,
                  MIptrLoadEnable,
                  {FpInst[7], FpInst[3], FpInst[0], FpInst[1],
                   FpInst[6], FpInst[2], FpInst[4], FpInst[5]}, // RomEntry := SPARC code to ROM entry point mapping  //
                  NextMIptr,
                  {RomMIptr[1], MI2ornotMI6, RomMIptr[6], MI6orMI1, gnd, ExMIptrLSBs}, // ExMIptr
                  Feedback,
		  SelectedMIptr,
                  RomMIptr,
                  notRomMIptr);
endmodule