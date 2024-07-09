module YMuxCtl (RomYMuxCtl,
                YFunc,
                FracAregFPMSBP1,
                notFracAregFPMSBP1,
                FracBregSign,
                DivMultiple,
                AregLSBs,
                StickyForSR1,
                TregLSBs,
/* dhn--01/10/91	notFracYFromD1, notFracYFromD2, notFracYFromD3, */
		notFracYFromD1A, notFracYFromD2A, notFracYFromD3A,
                FracYLSBs);
input FracAregFPMSBP1, notFracAregFPMSBP1, FracBregSign;
input [`end_frac_ybus_field:`start_frac_ybus_field] RomYMuxCtl;
input [6:0] YFunc;
input [2:0] AregLSBs;
input StickyForSR1;
input [1:0] TregLSBs;
input [3:1] DivMultiple;
/* dhn--01/10/91  output notFracYFromD3, notFracYFromD2, notFracYFromD1; */
output notFracYFromD1A, notFracYFromD2A, notFracYFromD3A;
output [1:0] FracYLSBs;
ME_TIEOFF toff (vdd, gnd);
/* Function Coding on
Func1 Func0
0      0    ROM        Ybus From ROM
0      1    ROM SQRT   Ybus From ROM Note we dont do anything with the Ybus here
1      0    Round      Ybus from Areg or AregSR1 dependant on FracAregFPMSBP1
1      1    Div        Ybus From Div Multiple
*/
//YFunc[6] and RomYMuxCtl[`u_FracALUOpForDivOrSQRTStep] mean SQRT step
ME_AND3_B fs3 (YFunc[6], RomYMuxCtl[`u_FracALUOpForDivOrSQRTStep], FracBregSign, RomYFromSQRTBNeg);
/* *************************************************************
         YMux Drivers
//ME_INV_A ifp (FracAregFPMSBP1, notFracAregFPMSBP1);
/*ME_MUX4B_B ym0 (RomYMuxCtl[`u_FracYbusFromFunc0], RomYMuxCtl[`u_FracYbusFromFunc1],
              RomYMuxCtl[`u_FracYbusFromRomDest0],
              RomYMuxCtl[`u_FracYbusFromRomDest0],
              FracAregFPMSBP1,
              DivMultiple[0], FracYFromD0);
ME_MUX4B_B ym1 (RomYMuxCtl[`u_FracYbusFromFunc0], RomYMuxCtl[`u_FracYbusFromFunc1],
              RomYMuxCtl[`u_FracYbusFromRomDest1],
              RomYMuxCtl[`u_FracYbusFromRomDest1],
              notFracAregFPMSBP1,
              DivMultiple[1], FracYFromD1);*/
/*ME_MUX4B_B ym0 (YFunc[0], YFunc[1],
              RomYMuxCtl[`u_FracYbusFromRomDest0],
              RomYMuxCtl[`u_FracYbusFromRomDest0],
              FracAregFPMSBP1,
              DivMultiple[0], FracYFromD0);
ME_MUX4B_B ym1 (YFunc[2], YFunc[3],
              RomYMuxCtl[`u_FracYbusFromRomDest1],
              RomYMuxCtl[`u_FracYbusFromRomDest1],
              notFracAregFPMSBP1,
              DivMultiple[1], FracYFromD1);*/
/*** dhn--01/10/91
ME_A222OI_B ym1 (YFunc[0],
               RomYMuxCtl[`u_FracYbusFromAregSR1],
               YFunc[1],
               FracAregFPMSBP1,
               YFunc[2],
               DivMultiple[1],
               notFracYFromD1);
ME_A222OI_B ym2 (YFunc[3],
               RomYMuxCtl[`u_FracYbusFromAreg],
               YFunc[4],
               notFracAregFPMSBP1,
               YFunc[5],
               DivMultiple[2],
               notFracYFromD2);
ME_A222OI_B ym3 (RomYMuxCtl[`u_FracYbusFromFunc0],
               RomYMuxCtl[`u_FracYbusFromTreg],
               RomYMuxCtl[`u_FracYbusFromFunc1],
               gnd,
               RomYMuxCtl[`u_FracYbusFromFunc2],
               DivMultiple[3],
               notFracYFromD3);
ME_A222OI_B ym4 (YFunc[0],
               RomYMuxCtl[`u_FracYbusFromAregSR1],
               YFunc[1],
               FracAregFPMSBP1,
               YFunc[2],
               DivMultiple[1],
               notFracYFromD1A);
ME_A222OI_B ym5 (YFunc[3],
               RomYMuxCtl[`u_FracYbusFromAreg],
               YFunc[4],
               notFracAregFPMSBP1,
               YFunc[5],
               DivMultiple[2],
               notFracYFromD2A);
ME_A222OI_B ym6 (RomYMuxCtl[`u_FracYbusFromFunc0],
               RomYMuxCtl[`u_FracYbusFromTreg],
               RomYMuxCtl[`u_FracYbusFromFunc1],
               gnd,
               RomYMuxCtl[`u_FracYbusFromFunc2],
               DivMultiple[3],
               notFracYFromD3A);
/* ****************************************************************************
      Modify FracYbus LSBs for Negative SQRT step and Sticky
ME_INV_A ymlb1 (notFracYFromD1A, FracYFromD1); // Minimalist light load
ME_INV_A ymlb2 (notFracYFromD2A, FracYFromD2); // Minimalist light load
ME_INV_A ymlb3 (notFracYFromD3A, FracYFromD3); // Minimalist light load
/*ME_OR2   ymd0 (FracYFromD1, FracYFromD3, FracYFromD0C);
ME_OR2   ymd1 (FracYFromD2, FracYFromD3, FracYFromD1C);*/
// Do OR before MUX
wire [1:0] OR_AregLSBsSR1, OR_AregLSBs, OR_TregLSBs;
// Bit 0
ME_INVA i00 (RomYMuxCtl[`u_FracYbusOrSticky], notRomFracYbusOrSticky);
/*ME_OR2 i00 (StickyInForSR1, RomYMuxCtl[`u_FracYbusOrSticky], OR_AregLSBsSR1[0]);
ME_OR2 i01 (AregLSBs[0], RomYMuxCtl[`u_FracYbusOrSticky], OR_AregLSBs[0]);
ME_OR2 i02 (TregLSBs[0], RomYMuxCtl[`u_FracYbusOrSticky], OR_TregLSBs[0]);*/
// Bit 1
ME_INVA i10 (RomYFromSQRTBNeg, notRomYFromSQRTBNeg);
/*ME_OR2 i10 (AregLSBs[2], RomYFromSQRTBNeg, OR_AregLSBsSR1[1]);
ME_OR2 i11 (AregLSBs[1], RomYFromSQRTBNeg, OR_AregLSBs[1]);
ME_OR2 i12 (TregLSBs[1], RomYFromSQRTBNeg, OR_TregLSBs[1]);*/
// Use buffered inverse of mux controls
ME_NAND2 ymlsbs1 (FracYFromD1, StickyForSR1,   t0);
ME_NAND2 ymlsbs2 (FracYFromD2, AregLSBs[0],    t1);
ME_NAND2 ymlsbs3 (FracYFromD3, TregLSBs[0],    t2);
ME_NAND4 ymlsbs4 (t0, t1, t2, notRomFracYbusOrSticky, FracYLSBs[0]);
ME_NAND2 ymlsbs5 (FracYFromD1, AregLSBs[2],    t3);
ME_NAND2 ymlsbs6 (FracYFromD2, AregLSBs[1],    t4);
ME_NAND2 ymlsbs7 (FracYFromD3, TregLSBs[1],    t5);
ME_NAND4 ymlsbs8 (t3, t4, t5, notRomYFromSQRTBNeg, FracYLSBs[1]);
/*ME_MUX4B yb0 (FracYFromD0C, FracYFromD1C,
              RomYMuxCtl[`u_FracYbusOrSticky],
              OR_AregLSBsSR1[0],
              OR_AregLSBs[0],
              OR_TregLSBs[0],
              FracYLSBs[0]);
ME_MUX4B yb1 (FracYFromD0C, FracYFromD1C,
              RomYFromSQRTBNeg,
              OR_AregLSBsSR1[1],
              OR_AregLSBs[1],
              OR_TregLSBs[1],
              FracYLSBs[1]);*/
endmodule