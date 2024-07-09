module Control (Phi, ResetIn,
                notExpAgtB,
                notAInfNan, notAZeroDenorm, notBInfNan, notBZeroDenorm,
                notExpUnderflow, notExpOverflow, notExpException,
                notWaitForShifter, notNO,
                SubResultNorm,
                notPossibleOv,
                Conditionals_14_8, Conditionals_6_0,
                FpInst, FpOp, FpLd,
                PreventSwap,
                PreventSwapExp,
                RCondition,
		SelectedMIptr,
		U_RomOutputs,
                RomOutputs,
                YDest,
                XDest,
                CMPDecoded, CMPEDecoded,
                AregOprExc,
                notAbortWB, Reset,
                Busy, NegateOprSign,
                UnimpOut );
input Phi, ResetIn;
input notExpAgtB,
      notAInfNan, notAZeroDenorm,
      notBInfNan, notBZeroDenorm,
      notExpUnderflow, notExpOverflow, notExpException,
      notWaitForShifter;
input [1:0] notNO;
input SubResultNorm;
input notPossibleOv;
input [14:8] Conditionals_14_8;		// Conditional bits (input)
input [ 6:0] Conditionals_6_0;		// Conditional bits (input)
input [9:0] FpInst;			// FPOP field of instruction
input FpOp, FpLd;
input [`RomWidthM1:0] U_RomOutputs;
output PreventSwap, PreventSwapExp,
       RCondition;
output [`MIptrMSB:0] SelectedMIptr;
output [`RomWidthM1:0] RomOutputs;
output [6:0] YDest;
output XDest;
output CMPDecoded, CMPEDecoded;
output AregOprExc,
       notAbortWB, Reset,
       Busy, NegateOprSign,
       UnimpOut;
wire [2:0] ExMIptrLSBs;
wire AregOprExc, RCondition;
wire [15:0] Conditionals;
assign Conditionals = {RCondition, Conditionals_14_8, AregOprExc,
			Conditionals_6_0} ;
PreventSwapCtl psc (Conditionals[`u_Cond_FracResultNegative],
		    notExpAgtB, Conditionals[`u_Cond_ExpResultZero],
                    RomOutputs[`u_PreventSwapIfBgtA], FpLd,
                    PreventSwap,
                    PreventSwapExp);
SampleReset sr (Phi, ResetIn, ResetAbortInst,
                ResetImp, Reset, notReset);
NullExcepLogic nel (Phi, notReset,
                       RomOutputs[`u_NullifyOnBranchOr],
                       RomOutputs[`u_OprExc],
                       BTLatched,
                       notSampledWait,
                       FpLd,
                       notAInfNan, notAZeroDenorm,
                       notBInfNan, notBZeroDenorm,
                       ExMIptrLSBs,
                       AregOprExc,
                       DyadicOprExc,
                       notAbortNulExc,
                       notAbortWB);
wire [4:0] Feedback;
CaseGeneration cg (
           RomOutputs[`start_fb_field+4:`start_fb_field],
           RomOutputs[`start_condition_field+3:`start_condition_field],
           SubResultNorm,
           Conditionals[`u_Cond_SignsDiffer],
           notExpUnderflow, notExpOverflow, notExpException,
           notPossibleOv, Conditionals[`u_Cond_notFracResultZero],
           RCondition,
           Feedback[4:0]);
CondMux cm (Conditionals,
            RomOutputs[4+`start_condition_field:`start_condition_field],
            notReset,
            notAbortNulExc,
            DyadicOprExc,
            notBranchTakenMIS,
            notBranchTaken);
SampledWaitCtl swc (
           RomOutputs[`u_ShiftForAlign],
           RomOutputs[`u_ShiftForInt],
           RomOutputs[`u_LeftnotRight],
           notReset,
           notAbortNulExc,
           notWaitForShifter,
           notNO[1:0],
           notIdleLatched,
           UpdateOutputs,
           notSampledWait);
MISelect smi (Phi, notReset,
           notBranchTaken,
           notDecodedUnimp,
           RomOutputs[`u_MIptrFromInstructionN],
           RomOutputs[`u_MIptrFromInstructionB],
           notAbortInst, notAbortNulExc,
           notResetOrUnimp,
           DyadicOprExc, notSampledWait,
           FpOp,
           notSingleCycInst,
           BTLatched,
           Busy, notIdleLatched,
           notInstAndNoExc,
           MIptrLoadEnable);
// MIptr :- Micro Instruction Pointer     //
wire [`MIptrMSB:0] RomMIptr, notRomMIptr;
// unregistered version of RomMIptr	  //
wire [`MIptrMSB:0] SelectedMIptr;
wire [`RomWidthM1:0] U_RomOutputs;	// unbuffered output from ME_UROM
MIptr mip (Phi,
           ExMIptrLSBs,
           DyadicOprExc,
           notInstAndNoExc,
           notBranchTakenMIS,
           notResetOrUnimp,
           MIptrLoadEnable,
           {RomOutputs[`end_fb_field:`start_fb_field+5], Feedback[4:0]},
           FpInst[7:0],
	   SelectedMIptr,
           RomMIptr,
           notRomMIptr);
MicrocodeRom mrom (Phi,
                   UpdateOutputs,
		   U_RomOutputs,
                   RomOutputs,
                   XDest,
                   YDest );
EntryCheck ec (notRomMIptr, EntryPoint, notSingleCycInst);
ImplementedCheck ich (Phi, ResetImp, // Can't be Reset
           notReset,
           FpOp,
           EntryPoint, FpInst[9:4],
           notDecodedUnimp,
           notResetOrUnimp,
           notAbortInst, ResetAbortInst,
           FPOP2Map,
           UnimpOut);
DecodeCmpAndNeg dcs (Phi,
                    FpInst[2], FpInst[3], FpInst[6], FpInst[7],
                    FPOP2Map,
                    CMPDecoded, CMPEDecoded,
                    NegateOprSign);
endmodule