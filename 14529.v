module
    recFNToFN#(parameter expWidth = 3, parameter sigWidth = 3) (
        input [(expWidth + sigWidth):0] in,
        output [(expWidth + sigWidth - 1):0] out
    );
`include "HardFloat_localFuncs.vi"
    /*------------------------------------------------------------------------
    localparam [expWidth:0] minNormExp = (1<<(expWidth - 1)) + 2;
    localparam normDistWidth = clog2(sigWidth);
    /*------------------------------------------------------------------------
    wire isNaN, isInf, isZero, sign;
    wire signed [(expWidth + 1):0] sExp;
    wire [sigWidth:0] sig;
    recFNToRawFN#(expWidth, sigWidth)
        recFNToRawFN(in, isNaN, isInf, isZero, sign, sExp, sig);
    // FIX provided by John Hauser.
    // if the input is recoded infinity with x in sig and exp fields,
    // isSubnormal also turns x, and fractOut becomes x.
    // wire isSubnormal = (sExp < minNormExp);
    wire isSubnormal =
        ((sExp>>(expWidth - 2) == 'b010) && (sExp[(expWidth - 3):0] <= 1))
            || (sExp>>(expWidth - 1) == 'b00);
    /*------------------------------------------------------------------------
    wire [(normDistWidth - 1):0] denormShiftDist = minNormExp - 1 - sExp;
    wire [(expWidth - 1):0] expOut =
        (isSubnormal ? 0 : sExp - minNormExp + 1)
            | (isNaN || isInf ? {expWidth{1'b1}} : 0);
    wire [(sigWidth - 2):0] fractOut =
        isSubnormal ? (sig>>1)>>denormShiftDist : isInf ? 0 : sig;
    assign out = {sign, expOut, fractOut};
endmodule