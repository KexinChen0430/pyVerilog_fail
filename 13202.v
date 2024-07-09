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
    wire [`DST_WIDTH-1:0] dst [0:`NUM_PORT-1];
    wire [`NUM_FLIT_WDITH-1:0] flit_num [0:`NUM_PORT-1];
    wire [`PC_INDEX_WIDTH-1:0] num_flit_in;
    genvar j;
    generate
    for (j=0; j<`NUM_PORT; j=j+1) begin : split_field
    assign dst [j] = r_data [j][`DST_POS];
    assign flit_num[j] = r_data [j][`FLIT_NUM_POS];
    end
    assign num_flit_in = r_data[0][`VALID_POS] + r_data[1][`VALID_POS] + r_data[2][`VALID_POS] + r_data[3][`VALID_POS];
    endgenerate
    // Router computation
    genvar k;
    wire [`NUM_PORT-1:0] ppv [3:0];
    generate
    for (k=0; k<4; k=k+1) begin : RC
        rc rc(
        .dst                    (dst [k]),
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
    .in_0       (r_data[0]),
    .in_1       (r_data[1]),
    .in_2       (r_data[2]),
    .in_3       (r_data[3]),
    .in_4       (r_data[4]),
    .ppv_0      (ppv[0]),
    .ppv_1      (ppv[1]),
    .ppv_2      (ppv[2]),
    .ppv_3      (ppv[3]),
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
    .num_flit_o (num_flit)
    );
    wire [1:0] rank_dir [0:3];
    wire [`NUM_PORT-2:0] sorted_ppv [0:3];
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
    .rank0_dir  (rank_dir[0]),
    .rank1_dir  (rank_dir[1]),
    .rank2_dir  (rank_dir[2]),
    .rank3_dir  (rank_dir[3]),
    .rank0_ppv  (sorted_ppv[0]),
    .rank1_ppv  (sorted_ppv[1]),
    .rank2_ppv  (sorted_ppv[2]),
    .rank3_ppv  (sorted_ppv[3])
    );
    // ST1 pipeline buffer
    // buffer rank, ppv, data, num_flit, sorted_eject
    wire [`DATA_WIDTH-1:0] r_st1_data [3:0];
    wire [`NUM_PORT-2:0] r_st1_ppv [3:0];
    wire [1:0] r_st1_rank [3:0];
    wire [`PC_INDEX_WIDTH-1:0] r_st1_num_flit;
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
    wire [`NUM_PORT-2:0] allocPV [3:0];
    swAlloc swAlloc(
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
    .allocPV_0      (allocPV[0]),
    .allocPV_1      (allocPV[1]),
    .allocPV_2      (allocPV[2]),
    .allocPV_3      (allocPV[3]),
    .out_0          (xbar_out[0]),
    .out_1          (xbar_out[1]),
    .out_2          (xbar_out[2]),
    .out_3          (xbar_out[3])
    );
    dff_async_reset #(`DATA_WIDTH) st2_buf_data_0 (xbar_out[0], clk, n_rst, data_out_0);
    dff_async_reset #(`DATA_WIDTH) st2_buf_data_1 (xbar_out[1], clk, n_rst, data_out_1);
    dff_async_reset #(`DATA_WIDTH) st2_buf_data_2 (xbar_out[2], clk, n_rst, data_out_2);
    dff_async_reset #(`DATA_WIDTH) st2_buf_data_3 (xbar_out[3], clk, n_rst, data_out_3);
endmodule