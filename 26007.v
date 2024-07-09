module
    divSqrtRecFN_small#(
        parameter expWidth = 3, parameter sigWidth = 3, parameter options = 0
    ) (
        /*--------------------------------------------------------------------
        input nReset,
        input clock,
        /*--------------------------------------------------------------------
        input [(`floatControlWidth - 1):0] control,
        /*--------------------------------------------------------------------
        output inReady,
        input inValid,
        input sqrtOp,
        input [(expWidth + sigWidth):0] a,
        input [(expWidth + sigWidth):0] b,
        input [2:0] roundingMode,
        /*--------------------------------------------------------------------
        output outValid,
        output sqrtOpOut,
        output [(expWidth + sigWidth):0] out,
        output [4:0] exceptionFlags
    );
    /*------------------------------------------------------------------------
    //wire sqrtOpOut;
    wire [2:0] roundingModeOut;
    wire invalidExc, infiniteExc, out_isNaN, out_isInf, out_isZero, out_sign;
    wire signed [(expWidth + 1):0] out_sExp;
    wire [(sigWidth + 2):0] out_sig;
    divSqrtRecFNToRaw_small#(expWidth, sigWidth, options)
        divSqrtRecFNToRaw(
            nReset,
            clock,
            control,
            inReady,
            inValid,
            sqrtOp,
            a,
            b,
            roundingMode,
            outValid,
            sqrtOpOut,
            roundingModeOut,
            invalidExc,
            infiniteExc,
            out_isNaN,
            out_isInf,
            out_isZero,
            out_sign,
            out_sExp,
            out_sig
        );
    /*------------------------------------------------------------------------
    roundRawFNToRecFN#(expWidth, sigWidth, 0)
        roundRawOut(
            control,
            invalidExc,
            infiniteExc,
            out_isNaN,
            out_isInf,
            out_isZero,
            out_sign,
            out_sExp,
            out_sig,
            roundingModeOut,
            out,
            exceptionFlags
        );
endmodule