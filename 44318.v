module tffe (t, clk, ena, clrn, prn,q );
    input t,clk,ena,clrn,prn;
    output q;
    wire q;
    tri1 prn, clrn, ena;
    prim_gtff inst (q, t, clk, ena, !clrn, !prn);
endmodule