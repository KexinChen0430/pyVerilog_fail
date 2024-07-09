module dff (d, clk, clrn, prn, q );
    input d,clk,clrn,prn;
    output q;
    wire q;
    tri1 prn, clrn;
    prim_gdff inst (q, d, clk, 1'b1, !clrn, !prn, 1'b0, 1'b0, 1'b0, 1'b0);
endmodule