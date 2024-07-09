module router(
    clk,
    n_rst,
    data_in_0,
    data_in_1,
    data_in_2,
    data_in_3,
    data_in_4,
    data_out_0,
    data_out_1,
    data_out_2,
    data_out_3,
    data_out_4
    );
    input clk, n_rst;
    input [`DATA_WIDTH-1:0] data_in_0, data_in_1, data_in_2, data_in_3, data_in_4;
    output [`DATA_WIDTH-1:0] data_out_0, data_out_1, data_out_2, data_out_3, data_out_4;
    //buffer the input
    wire [`DATA_WIDTH-1:0] r_data [0:`NUM_PORT-1];
    dff_async_reset #(`DATA_WIDTH) in_pc_0(data_in_0, clk, n_rst, r_data[0]);
    dff_async_reset #(`DATA_WIDTH) in_pc_1(data_in_1, clk, n_rst, r_data[1]);
    dff_async_reset #(`DATA_WIDTH) in_pc_2(data_in_2, clk, n_rst, r_data[2]);
    dff_async_reset #(`DATA_WIDTH) in_pc_3(data_in_3, clk, n_rst, r_data[3]);
    dff_async_reset #(`DATA_WIDTH) in_pc_4(data_in_4, clk, n_rst, r_data[4]);
    // seperate the field
    wire [`SRC_LIST_WIDTH-1:0] dst_src_list [0:`NUM_PORT-1];
    wire [`DST_WIDTH-1:0] dst [0:`NUM_PORT-1];
    wire mc [0:`NUM_PORT-1];
    wire hs [0:`NUM_PORT-1];
    wire [`NUM_FLIT_WDITH-1:0] flit_num [0:`NUM_PORT-1];
    wire [`PC_INDEX_WIDTH-1:0] num_flit_in;
    genvar j;
    generate
    for (j=0; j<`NUM_PORT; j=j+1) begin : split_field
    assign dst_src_list [j] = r_data [j][`SRC_LIST_POS];
    assign dst [j] = r_data [j][`DST_POS];
    assign mc [j] = r_data [j][`MC_POS];
    assign hs [j] = r_data [j][`HS_POS];
    assign flit_num[j] = r_data [j][`FLIT_NUM_POS];
    end
    assign num_flit_in = r_data[0][`VALID_POS] + r_data[1][`VALID_POS] + r_data[2][`VALID_POS] + r_data[3][`VALID_POS];
    endgenerate
    wire [`NUM_PORT-1:0] kill;
    wire [`SRC_LIST_WIDTH-1:0] srcList_new [0:4];
    merge merge(
    .hs_0           (hs[0]),
    .srcList_0      (dst_src_list[0]),
    .addr_0         (r_data [0][`MEM_ADDR_POS]),   //could be flowID
    .dst_0          (dst[0]),
    .flitID_0       (flit_num[0]),
    .hs_1           (hs[1]),
    .srcList_1      (dst_src_list[1]),
    .addr_1         (r_data [1][`MEM_ADDR_POS]),   //could be flowID
    .dst_1          (dst[1]),
    .flitID_1       (flit_num[1]),
    .hs_2           (hs[2]),
    .srcList_2      (dst_src_list[2]),
    .addr_2         (r_data[2][`MEM_ADDR_POS]),   //could be flowID
    .dst_2          (dst[2]),
    .flitID_2       (flit_num[2]),
    .hs_3           (hs[3]),
    .srcList_3      (dst_src_list[3]),
    .addr_3         (r_data[3][`MEM_ADDR_POS]),   //could be flowID
    .dst_3          (dst[3]),
    .flitID_3       (flit_num[3]),
    .hs_4           (hs[4]),
    .srcList_4      (dst_src_list[4]),
    .addr_4         (r_data[4][`MEM_ADDR_POS]),   //could be flowID
    .dst_4          (dst[4]),
    .flitID_4       (flit_num[4]),
    .kill           (kill),
    .srcList_new_0  (srcList_new[0]),
    .srcList_new_1  (srcList_new[1]),
    .srcList_new_2  (srcList_new[2]),
    .srcList_new_3  (srcList_new[3]),
    .srcList_new_4  (srcList_new[4])
    );
    // Router computation
    genvar k;
    wire [`NUM_PORT-1:0] ppv [3:0];
    generate
    for (k=0; k<4; k=k+1) begin : RC
        rc rc(
        .dst                    (dst [k]),
        .dstList                (dst_src_list [k]),
        .mc                     (mc [k]),
        .preferPortVector       (ppv[k])
        );
    end
    endgenerate
    wire [`DATA_WIDTH-1:0] w_data_local_out [0:`NUM_PORT-1];
    wire [`PC_INDEX_WIDTH-1:0] num_flit;
    wire [3:0] eject;
    wire [`NUM_PORT-2:0] w_ppv_local_out [0:3]; // give it to PA. Ranking is provided by PS;
    //The local flit may inherit the ranking of the killed flit;
    //Relax the constrain but shorten the critical path, as otherwise, PS must take place after PPV is updated in MEI.
    local local_inj_ej(
    .in_0       ({r_data[0][`DATA_WIDTH-1:128], srcList_new[0], r_data[0][63:0]}),
    .in_1       ({r_data[1][`DATA_WIDTH-1:128], srcList_new[1], r_data[1][63:0]}),
    .in_2       ({r_data[2][`DATA_WIDTH-1:128], srcList_new[2], r_data[2][63:0]}),
    .in_3       ({r_data[3][`DATA_WIDTH-1:128], srcList_new[3], r_data[3][63:0]}),
    .in_4       ({r_data[4][`DATA_WIDTH-1:128], srcList_new[4], r_data[4][63:0]}),
    .ppv_0      (ppv[0]),
    .ppv_1      (ppv[1]),
    .ppv_2      (ppv[2]),
    .ppv_3      (ppv[3]),
    .merge      (kill),
    .num_flit_i (num_flit_in),
    .out_0      (w_data_local_out[0]),
    .out_1      (w_data_local_out[1]),
    .out_2      (w_data_local_out[2]),
    .out_3      (w_data_local_out[3]),
    .out_4      (data_out_4), // local eject
    .ppv_out_0  (w_ppv_local_out[0]),
    .ppv_out_1  (w_ppv_local_out[1]),
    .ppv_out_2  (w_ppv_local_out[2]),
    .ppv_out_3  (w_ppv_local_out[3]),
    .num_flit_o (num_flit),
    .eject      (eject)
    );
    wire [1:0] rank_dir [0:3];
    wire [`NUM_PORT-2:0] sorted_ppv [0:3];
    wire [`NUM_PORT-2:0] sorted_eject, sorted_mc;
    // Permutation Sorting Network
    // the assoicated flit may be merged or ejected.
    // although it relaxes the priority, it did not implicate the correctness.
    permutationNetwork Sort(
    .time0      (w_data_local_out [0][`TIME_POS]),
    .time1      (w_data_local_out [1][`TIME_POS]),
    .time2      (w_data_local_out [2][`TIME_POS]),
    .time3      (w_data_local_out [3][`TIME_POS]),
    .ppv0       (w_ppv_local_out[0]),
    .ppv1       (w_ppv_local_out[1]),
    .ppv2       (w_ppv_local_out[2]),
    .ppv3       (w_ppv_local_out[3]),
    .eject      (eject),
    .v_mc       ({w_data_local_out [3][`MC_POS], w_data_local_out [2][`MC_POS], w_data_local_out [1][`MC_POS], w_data_local_out [0][`MC_POS]}),
    .rank0_dir  (rank_dir[0]),
    .rank1_dir  (rank_dir[1]),
    .rank2_dir  (rank_dir[2]),
    .rank3_dir  (rank_dir[3]),
    .rank0_ppv  (sorted_ppv[0]),
    .rank1_ppv  (sorted_ppv[1]),
    .rank2_ppv  (sorted_ppv[2]),
    .rank3_ppv  (sorted_ppv[3]),
    .sorted_eject(sorted_eject),
    .sorted_mc   (sorted_mc)
    );
    // ST1 pipeline buffer
    // buffer rank, ppv, data, num_flit, sorted_eject
    wire [`DATA_WIDTH-1:0] r_st1_data [3:0];
    wire [`NUM_PORT-2:0] r_st1_ppv [3:0];
    wire [1:0] r_st1_rank [3:0];
    wire [`PC_INDEX_WIDTH-1:0] r_st1_num_flit;
    wire [`NUM_PORT-2:0] r_st1_sorted_eject, r_st1_sorted_mc;
    // Total:
    genvar m;
    generate
        for (m=0; m<4; m=m+1) begin: ST1_BUF
            dff_async_reset #(`DATA_WIDTH) st1_buf_data (w_data_local_out[m], clk, n_rst, r_st1_data[m]);
            dff_async_reset #(`NUM_PORT-1) st1_buf_ppv (sorted_ppv[m], clk, n_rst, r_st1_ppv[m]);
            dff_async_reset #(2) st1_buf_rank (rank_dir[m], clk, n_rst, r_st1_rank[m]);
        end
    endgenerate
    dff_async_reset #(`PC_INDEX_WIDTH) st1_buf_numFlit (num_flit, clk, n_rst, r_st1_num_flit);
    dff_async_reset #(`NUM_PORT-1) st1_buf_eject (sorted_eject, clk, n_rst, r_st1_sorted_eject);
    dff_async_reset #(`NUM_PORT-1) st1_buf_mc (sorted_mc, clk, n_rst, r_st1_sorted_mc);
    wire [`NUM_PORT-2:0] allocPV [3:0];
    swAlloc swAlloc(
    .mc_0           (r_st1_sorted_mc[0]),
    .mc_1           (r_st1_sorted_mc[1]),
    .mc_2           (r_st1_sorted_mc[2]),
    .mc_3           (r_st1_sorted_mc[3]),
    .numFlit_in     (r_st1_num_flit),
    .ppv_0          (r_st1_ppv[0]),
    .ppv_1          (r_st1_ppv[1]),
    .ppv_2          (r_st1_ppv[2]),
    .ppv_3          (r_st1_ppv[3]),
    .allocPV_0      (allocPV[0]),
    .allocPV_1      (allocPV[1]),
    .allocPV_2      (allocPV[2]),
    .allocPV_3      (allocPV[3])
    );
    wire [`DATA_WIDTH_XBAR-1:0] xbar_out [0:3];
    wire [`NUM_PORT-1:0] apv_on_out [0:3];
    xbar xbar(
    .in_0           (r_st1_data[0]),
    .in_1           (r_st1_data[1]),
    .in_2           (r_st1_data[2]),
    .in_3           (r_st1_data[3]),
    .indir_rank0    (r_st1_rank[0]),
    .indir_rank1    (r_st1_rank[1]),
    .indir_rank2    (r_st1_rank[2]),
    .indir_rank3    (r_st1_rank[3]),
    .allocPV_0      ({r_st1_sorted_eject[0],allocPV[0]}),
    .allocPV_1      ({r_st1_sorted_eject[1],allocPV[1]}),
    .allocPV_2      ({r_st1_sorted_eject[2],allocPV[2]}),
    .allocPV_3      ({r_st1_sorted_eject[3],allocPV[3]}),
    .out_0          (xbar_out[0]),
    .out_1          (xbar_out[1]),
    .out_2          (xbar_out[2]),
    .out_3          (xbar_out[3]),
    .apv_on_out0    (apv_on_out[0]),
    .apv_on_out1    (apv_on_out[1]),
    .apv_on_out2    (apv_on_out[2]),
    .apv_on_out3    (apv_on_out[3])
    );
    genvar n;
    wire [`DST_LIST_WIDTH-1:0] updated_dst_list [0:3];
    wire [`DATA_WIDTH-1:0] data_out [0:3];
    generate
    for (n=0; n<4; n=n+1) begin: dst_mgmt
    dstMgmt # (n) dstMgmt(
    .allocPV        ({apv_on_out[n]}),
    .dstList_in     (xbar_out[n][`DST_LIST_POS]),
    .dstList_out    (updated_dst_list[n])
    );
    assign data_out [n] = xbar_out[n][`MC_POS] ?
            {xbar_out[n][`DATA_WIDTH-1:`DST_LIST_END+1], updated_dst_list[n], xbar_out[n][`LO_PAYLOAD_POS]} :
            xbar_out[n];
    end
    endgenerate
    dff_async_reset #(`DATA_WIDTH) st2_buf_data_0 (data_out[0], clk, n_rst, data_out_0);
    dff_async_reset #(`DATA_WIDTH) st2_buf_data_1 (data_out[1], clk, n_rst, data_out_1);
    dff_async_reset #(`DATA_WIDTH) st2_buf_data_2 (data_out[2], clk, n_rst, data_out_2);
    dff_async_reset #(`DATA_WIDTH) st2_buf_data_3 (data_out[3], clk, n_rst, data_out_3);
endmodule