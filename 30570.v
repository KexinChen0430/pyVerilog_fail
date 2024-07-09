module top(out);
    wire [23:0] a1, a2, a3, a4;
    wire [23:0] b1, b2, b3, b4;
    wire        c1, c2, c3, c4;
    wire        d1, d2, d3, d4;
    Example          e1(a1, b1, c1, d1);
    Example #("FOO") e2(a2, b2, c2, d2);
    Example #("BAR") e3(a3, b3, c3, d3);
    Example #("BAZ") e4(a4, b4, c4, d4);
    output wire [24 * 8 - 1 + 4 :0] out;
    assign out = {
        a1, a2, a3, a4,
        b1, b2, b3, b4,
        c1, c2, c3, c4,
        d1, d2, d3, d4};
    function signed [31:0] negate;
        input integer inp;
        negate = ~inp;
    endfunction
    parameter W = 10;
    parameter X = 3;
    localparam signed Y = $floor(W / X);
    localparam signed Z = negate($floor(W / X));
// `define VERIFY
`ifdef VERIFY
    assert property (a1 == 0);
    assert property (a2 == 0);
    assert property (a3 == "BAR");
    assert property (a4 == 0);
    assert property (b1 == "FOO");
    assert property (b2 == "FOO");
    assert property (b3 == 0);
    assert property (b4 == "HI");
    assert property (c1 == 1);
    assert property (c2 == 1);
    assert property (c3 == 0);
    assert property (c4 == 0);
    assert property (d1 == 0);
    assert property (d2 == 0);
    assert property (d3 == 1);
    assert property (d4 == 1);
    assert property (Y == 3);
    assert property (Z == ~3);
`endif
endmodule