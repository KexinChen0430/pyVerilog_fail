module dffe (d, clk, ena, clrn, prn,q );
    input d,clk,ena,clrn,prn;
    output q;
    wire q;
    tri1 prn, clrn, ena;
    prim_gdff inst (q, d, clk, ena, !clrn, !prn, 1'b0, 1'b0, 1'b0, 1'b0);
endmodule