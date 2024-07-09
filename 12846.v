module
    mulAddRecFNToRaw#(parameter expWidth = 3, parameter sigWidth = 3) (
        input [(`floatControlWidth - 1):0] control,
        input [1:0] op,
        input [(expWidth + sigWidth):0] a,
        input [(expWidth + sigWidth):0] b,
        input [(expWidth + sigWidth):0] c,
        input [2:0] roundingMode,
        output invalidExc,
        output out_isNaN,
        output out_isInf,
        output out_isZero,
        output out_sign,
        output signed [(expWidth + 1):0] out_sExp,
        output [(sigWidth + 2):0] out_sig
    );
`include "HardFloat_localFuncs.vi"
    wire [(sigWidth - 1):0] mulAddA, mulAddB;
    wire [(sigWidth*2 - 1):0] mulAddC;
    wire [5:0] intermed_compactState;
    wire signed [(expWidth + 1):0] intermed_sExp;
    wire [(clog2(sigWidth + 1) - 1):0] intermed_CDom_CAlignDist;
    wire [(sigWidth + 1):0] intermed_highAlignedSigC;
    mulAddRecFNToRaw_preMul#(expWidth, sigWidth)
        mulAddToRaw_preMul(
            control,
            op,
            a,
            b,
            c,
            roundingMode,
            mulAddA,
            mulAddB,
            mulAddC,
            intermed_compactState,
            intermed_sExp,
            intermed_CDom_CAlignDist,
            intermed_highAlignedSigC
        );
    wire [sigWidth*2:0] mulAddResult = mulAddA * mulAddB + mulAddC;
    mulAddRecFNToRaw_postMul#(expWidth, sigWidth)
        mulAddToRaw_postMul(
            intermed_compactState,
            intermed_sExp,
            intermed_CDom_CAlignDist,
            intermed_highAlignedSigC,
            mulAddResult,
            roundingMode,
            invalidExc,
            out_isNaN,
            out_isInf,
            out_isZero,
            out_sign,
            out_sExp,
            out_sig
        );
endmodule