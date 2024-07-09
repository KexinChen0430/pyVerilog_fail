module srffe (s, r, clk, ena, clrn, prn,q );
    input s,r,clk,ena,clrn,prn;
    output q;
    wire q;
    tri1 prn, clrn, ena;
    prim_gsrff inst (q, s, r, clk, ena, !clrn, !prn);
endmodule