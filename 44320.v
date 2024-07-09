module jkff (j, k, clk, clrn, prn, q );
    input j,k,clk,clrn,prn;
    output q;
    wire q;
    tri1 prn, clrn;
    prim_gjkff inst (q, j, k, clk, 1'b1, !clrn, !prn);
endmodule