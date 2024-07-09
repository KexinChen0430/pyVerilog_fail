module MicrocodeRom (Phi, int_UpdateOutputs, U_RomOutputs,
                     RomOutputs,
                     XDest,
                     YDest );
input  Phi;
input  int_UpdateOutputs;
input [`RomWidthM1:0] U_RomOutputs;	// unbuffered output from ME_UROM
output [`RomWidthM1:0]	RomOutputs;	// latched version of U_RomOutputs
output [6:0] YDest;
output XDest;
ME_TIEOFF toff (, gnd);
	// This flip-flop is only used during scan operations (to allow
	// scan testing of the rom).  It will be connected by the
	// scan-stitcher when this block is routed.
ME_FD1 scanloadrom_ff (.cp(Phi), .d(gnd), .q(scanloadrom) );
ME_OR2 Uscanloadrom (int_UpdateOutputs, scanloadrom, UpdateOutputs);
// ROM :- ROM outputs latched             //
// Rom outputs are held while waiting, Aborting the instruction,
//                            Nullifiying and in exceptions.
// The FB and control bits are only held on abort and wait.
ME_FREGA_1_64 romor (Phi, UpdateOutputs, U_RomOutputs, RomOutputs);
ME_FD1E_B romor540 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc0], YDest[0],);
ME_FD1E_B romor551 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc1], YDest[1],);
ME_FD1E_B romor542 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc2], YDest[2],);
ME_FD1E_B romor553 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc0], YDest[3],);
ME_FD1E_B romor554 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc1], YDest[4],);
ME_FD1E_B romor555 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc2], YDest[5],);
ME_FD1E_B romor556 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc0], YDest[6],); // SQRT bit
ME_FD1E_B romor557 (Phi, UpdateOutputs, U_RomOutputs[`u_FracXbusFromDest2], XDest,); // Round bit
endmodule