module
    mulAddRecFNToRaw_preMul#(
        parameter expWidth = 3, parameter sigWidth = 3, parameter imulEn = 1
    ) (
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
`include "HardFloat_localFuncs.vi"
    input [(`floatControlWidth - 1):0] control;
    input [2:0] op;
    input [(expWidth + sigWidth):0] a;
    input [(expWidth + sigWidth):0] b;
    input [(expWidth + sigWidth):0] c;
    input [2:0] roundingMode;
    output [(sigWidth - 1):0] mulAddA;
    output [(sigWidth - 1):0] mulAddB;
    output [(sigWidth*2 - 1):0] mulAddC;
    output [5:0] intermed_compactState;
    output signed [(expWidth + 1):0] intermed_sExp;
    output [(clog2(sigWidth + 1) - 1):0] intermed_CDom_CAlignDist;
    output [(sigWidth + 1):0] intermed_highAlignedSigC;
    /*------------------------------------------------------------------------
    localparam prodWidth = sigWidth*2;
    localparam sigSumWidth = sigWidth + prodWidth + 3;
    /*------------------------------------------------------------------------
    wire isNaNA, isInfA, isZeroA, signA;
    wire signed [(expWidth + 1):0] sExpA;
    wire [sigWidth:0] sigA;
    recFNToRawFN#(expWidth, sigWidth)
        recFNToRawFN_a(a, isNaNA, isInfA, isZeroA, signA, sExpA, sigA);
    wire isSigNaNA;
    isSigNaNRecFN#(expWidth, sigWidth) isSigNaN_a(a, isSigNaNA);
    wire isNaNB, isInfB, isZeroB, signB;
    wire signed [(expWidth + 1):0] sExpB;
    wire [sigWidth:0] sigB;
    recFNToRawFN#(expWidth, sigWidth)
        recFNToRawFN_b(b, isNaNB, isInfB, isZeroB, signB, sExpB, sigB);
    wire isSigNaNB;
    isSigNaNRecFN#(expWidth, sigWidth) isSigNaN_b(b, isSigNaNB);
    wire isNaNC, isInfC, isZeroC, signC;
    wire signed [(expWidth + 1):0] sExpC;
    wire [sigWidth:0] sigC;
    recFNToRawFN#(expWidth, sigWidth)
        recFNToRawFN_c(c, isNaNC, isInfC, isZeroC, signC, sExpC, sigC);
    wire isSigNaNC;
    isSigNaNRecFN#(expWidth, sigWidth) isSigNaN_c(c, isSigNaNC);
    /*------------------------------------------------------------------------
    wire signProd = signA ^ signB ^ op[1];
    wire signed [(expWidth + 2):0] sExpAlignedProd =
        sExpA + sExpB + (-(1<<expWidth) + sigWidth + 3);
    wire doSubMags = signProd ^ signC ^ op[0];
    wire opSignC = signProd ^ doSubMags;
    wire roundingMode_min = (roundingMode == `round_min);
    /*------------------------------------------------------------------------
    wire signed [(expWidth + 2):0] sNatCAlignDist = sExpAlignedProd - sExpC;
    wire [(expWidth + 1):0] posNatCAlignDist =
        sNatCAlignDist[(expWidth + 1):0];
    wire isMinCAlign = isZeroA || isZeroB || (sNatCAlignDist < 0);
    wire CIsDominant =
        !isZeroC && (isMinCAlign || (posNatCAlignDist <= sigWidth));
    wire signed [(expWidth + 1):0] sExpSum =
        CIsDominant ? sExpC : sExpAlignedProd - sigWidth;
    wire [(clog2(sigSumWidth) - 1):0] CAlignDist =
        isMinCAlign ? 0
            : (posNatCAlignDist < sigSumWidth - 1)
                  ? posNatCAlignDist[(clog2(sigSumWidth) - 1):0]
                  : sigSumWidth - 1;
    wire signed [(sigSumWidth + 2):0] extComplSigC =
        {doSubMags ? ~sigC : sigC, {(sigSumWidth - sigWidth + 2){doSubMags}}};
    wire [(sigSumWidth + 1):0] mainAlignedSigC = extComplSigC>>>CAlignDist;
    localparam CGrainAlign = (sigSumWidth - sigWidth - 1) & 3;
    wire [(sigWidth + CGrainAlign):0] grainAlignedSigC = sigC<<CGrainAlign;
    wire [(sigWidth + CGrainAlign)/4:0] reduced4SigC;
    compressBy4#(sigWidth + 1 + CGrainAlign)
        compressBy4_sigC(grainAlignedSigC, reduced4SigC);
    localparam CExtraMaskHiBound = (sigSumWidth - 1)/4;
    localparam CExtraMaskLoBound = (sigSumWidth - sigWidth - 1)/4;
    wire [(CExtraMaskHiBound - CExtraMaskLoBound - 1):0] CExtraMask;
    lowMaskHiLo#(clog2(sigSumWidth) - 2, CExtraMaskHiBound, CExtraMaskLoBound)
        lowMask_CExtraMask(CAlignDist[(clog2(sigSumWidth) - 1):2], CExtraMask);
    wire reduced4CExtra = |(reduced4SigC & CExtraMask);
    wire [(sigSumWidth - 1):0] alignedSigC =
        {mainAlignedSigC>>3,
         doSubMags ? (&mainAlignedSigC[2:0]) && !reduced4CExtra
             : (|mainAlignedSigC[2:0]) || reduced4CExtra};
    /*------------------------------------------------------------------------
    wire isNaNAOrB = isNaNA || isNaNB;
    wire isNaNAny = isNaNAOrB || isNaNC;
    wire isInfAOrB = isInfA || isInfB;
    wire invalidProd = (isInfA && isZeroB) || (isZeroA && isInfB);
    wire notSigNaN_invalidExc =
        invalidProd || (!isNaNAOrB && isInfAOrB && isInfC && doSubMags);
    wire invalidExc =
        isSigNaNA || isSigNaNB || isSigNaNC || notSigNaN_invalidExc;
    wire notNaN_addZeros = (isZeroA || isZeroB) && isZeroC;
    wire specialCase = isNaNAny || isInfAOrB || isInfC || notNaN_addZeros;
    wire specialNotNaN_signOut =
        (isInfAOrB && signProd) || (isInfC && opSignC)
            || (notNaN_addZeros && !roundingMode_min && signProd && opSignC)
            || (notNaN_addZeros && roundingMode_min && (signProd || opSignC));
`ifdef HardFloat_propagateNaNPayloads
    wire signNaN;
    wire [(sigWidth - 2):0] fractNaN;
    propagateFloatNaN_mulAdd#(sigWidth)
        propagateNaN(
            control,
            op[1:0],
            isNaNA,
            signA,
            sigA[(sigWidth - 2):0],
            isNaNB,
            signB,
            sigB[(sigWidth - 2):0],
            invalidProd,
            isNaNC,
            signC,
            sigC[(sigWidth - 2):0],
            signNaN,
            fractNaN
        );
    wire isNaNOut = isNaNAny || notSigNaN_invalidExc;
    wire special_signOut =
        isNaNAny || notSigNaN_invalidExc ? signNaN : specialNotNaN_signOut;
`else
    wire special_signOut = specialNotNaN_signOut;
`endif
    /*------------------------------------------------------------------------
    if(imulEn) begin: fi1
        // This part has been modified so that we can support RISC-V integer multiply instruction MUL.
        // Please refer to the document for detailed implementation.
        assign mulAddA = op[2] ? a[sigWidth-1:0] : sigA;
        assign mulAddB = op[2] ? b[sigWidth-1:0] : sigB;
        // Generate modification bits
        wire [expWidth-1:0] aux_part = a[expWidth-1:0] * b[sigWidth+:expWidth] + a[sigWidth+:expWidth] * b[expWidth-1:0];
        assign mulAddC = op[2] ? {{(sigWidth - expWidth){1'b0}}, aux_part, {sigWidth{1'b0}}} : alignedSigC[prodWidth:1];
    end
    else begin: fi2
        assign mulAddA = sigA;
        assign mulAddB = sigB;
        assign mulAddC = alignedSigC[prodWidth:1];
    end
    assign intermed_compactState =
        {specialCase,
         invalidExc          || (!specialCase && signProd      ),
`ifdef HardFloat_propagateNaNPayloads
         isNaNOut            || (!specialCase && doSubMags     ),
`else
         isNaNAny            || (!specialCase && doSubMags     ),
`endif
         isInfAOrB || isInfC || (!specialCase && CIsDominant   ),
         notNaN_addZeros     || (!specialCase && alignedSigC[0]),
         special_signOut};
    assign intermed_sExp = sExpSum;
    assign intermed_CDom_CAlignDist = CAlignDist[(clog2(sigWidth + 1) - 1):0];
    assign intermed_highAlignedSigC =
`ifdef HardFloat_propagateNaNPayloads
         isNaNOut ? fractNaN :
`endif
          alignedSigC[(sigSumWidth - 1):(prodWidth + 1)];
endmodule