module jkffe (j, k, clk, ena, clrn, prn,q );
    input j,k,clk,ena,clrn,prn;
    output q;
    wire q;
    tri1 prn, clrn, ena;
    prim_gjkff inst (q, j, k, clk, ena, !clrn, !prn);
endmodule