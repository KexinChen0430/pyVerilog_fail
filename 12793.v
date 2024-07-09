module SampleReset (Phi, ResetIn, ResetAbortInst,
                    ResetImp, Reset, notReset);
input ResetIn, ResetAbortInst, Phi;
output ResetImp, Reset, notReset;
ME_FD1 rs  (Phi, ResetIn, ResetImp, );
ME_OR2 cva (ResetImp, ResetAbortInst, ResetInorAbort);
ME_FD1 rva (Phi, ResetInorAbort, Reset, notReset);
endmodule