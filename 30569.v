module Example(outA, outB, outC, outD);
    parameter OUTPUT = "FOO";
    output wire [23:0] outA;
    output wire [23:0] outB;
    output reg outC, outD;
    function automatic [23:0] flip;
        input [23:0] inp;
        flip = ~inp;
    endfunction
    generate
        if (flip(OUTPUT) == flip("BAR"))
            assign outA = OUTPUT;
        else
            assign outA = 0;
        case (flip(OUTPUT))
            flip("FOO"): assign outB = OUTPUT;
            flip("BAR"): assign outB = 0;
            flip("BAZ"): assign outB = "HI";
        endcase
        genvar i;
        initial outC = 0;
        for (i = 0; i != flip(flip(OUTPUT[15:8])); i = i + 1)
            if (i + 1 == flip(flip("O")))
                initial outC = 1;
    endgenerate
    integer j;
    initial begin
        outD = 1;
        for (j = 0; j != flip(flip(OUTPUT[15:8])); j = j + 1)
            if (j + 1 == flip(flip("O")))
                outD = 0;
    end
endmodule