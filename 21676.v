module rcMC(
    dstList,
    outdir,       // target output
    preferPortVector
    );
    input [`DST_LIST_WIDTH-1:0] dstList;
    input [`PC_INDEX_WIDTH-2:0] outdir;
    output [`NUM_PORT-1:0] preferPortVector;
    wire [`NUM_PORT-1:0] ppv_n, ppv_e, ppv_s, ppv_w;
    assign ppv_n [0] = |(dstList & `N_MASK_N);
    assign ppv_n [1] = |(dstList & `N_MASK_E);
    assign ppv_n [2] = 1'b0;
    assign ppv_n [3] = |(dstList & `N_MASK_W);
    assign ppv_n [4] = |(dstList & `N_MASK_L);
    assign ppv_e [0] = |(dstList & `E_MASK_N);
    assign ppv_e [1] = |(dstList & `E_MASK_E);
    assign ppv_e [2] = |(dstList & `E_MASK_S);
    assign ppv_e [3] = 1'b0;
    assign ppv_e [4] = |(dstList & `E_MASK_L);
    assign ppv_s [0] = 1'b0;
    assign ppv_s [1] = |(dstList & `S_MASK_E);
    assign ppv_s [2] = |(dstList & `S_MASK_S);
    assign ppv_s [3] = |(dstList & `S_MASK_W);
    assign ppv_s [4] = |(dstList & `S_MASK_L);
    assign ppv_w [0] = |(dstList & `W_MASK_N);
    assign ppv_w [1] = 1'b0;
    assign ppv_w [2] = |(dstList & `W_MASK_S);
    assign ppv_w [3] = |(dstList & `W_MASK_W);
    assign ppv_w [4] = |(dstList & `W_MASK_L);
    assign preferPortVector = (outdir == 0) ? ppv_n :
                              (outdir == 1) ? ppv_e :
                              (outdir == 2) ? ppv_s :
                              (outdir == 3) ? ppv_w : `NUM_PORT'h0;
endmodule