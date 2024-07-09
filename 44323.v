module srff (s, r, clk, clrn, prn, q );
    input s,r,clk,clrn,prn;
    output q;
    wire q;
    tri1 prn, clrn;
    prim_gsrff inst (q, s, r, clk, 1'b1, !clrn, !prn);
endmodule