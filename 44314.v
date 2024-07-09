module dffea (d, clk, ena, clrn, prn, aload, adata,q );
    input d,clk,ena,clrn,prn,aload,adata;
    output q;
    wire q;
    tri0 aload;
    tri1 prn, clrn, ena;
    reg stalled_adata;
    initial
    begin
        stalled_adata = adata;
    end
    always @(adata) begin
        #1 stalled_adata = adata;
    end
    prim_gdff inst (q, d, clk, ena, !clrn, !prn, aload, stalled_adata, 1'b0, 1'b0);
endmodule