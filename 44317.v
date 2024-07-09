module tff (t, clk, clrn, prn, q );
    input t,clk,clrn,prn;
    output q;
    wire q;
    tri1 prn, clrn;
    prim_gtff inst (q, t, clk, 1'b1, !clrn, !prn);
endmodule