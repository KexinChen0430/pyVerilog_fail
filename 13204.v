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
    // Assume data_in_* will maintain unchanged for 1 cycle.
    input [`DATA_WIDTH-1:0] data_in_0, data_in_1, data_in_2, data_in_3, data_in_4;
    output [`DATA_WIDTH-1:0] data_out_0, data_out_1, data_out_2, data_out_3, data_out_4;
    //buffer the input, except time
    reg [`DATA_WIDTH-1:0] r_data [0:`NUM_PORT-1];
    integer i;
    always @ (posedge clk) begin
        if (~n_rst) begin
            for (i=0; i<`NUM_PORT; i=i+1)
                r_data [i] <= 'h0;
        end
        else begin
            r_data [0] <= data_in_0;
            r_data [1] <= data_in_1;
            r_data [2] <= data_in_2;
            r_data [3] <= data_in_3;
            r_data [4] <= data_in_4;
        end
    end
     // seperate the field
     wire [`SRC_LIST_WIDTH-1:0] dst_src_list [0:`NUM_PORT-1];
     wire [`DST_WIDTH-1:0] dst [0:`NUM_PORT-1];
     wire mc [0:`NUM_PORT-1];
     wire hs [0:`NUM_PORT-1];
     wire [`NUM_PORT-1:0] ppv [0:`NUM_PORT-1];
     wire [`TIME_WIDTH-1:0] ad_time [0 : `NUM_PORT-1];
     wire [`NUM_FLIT_WDITH-1:0] flit_num [0:`NUM_PORT-1];
     wire [`PC_INDEX_WIDTH-1:0] num_flit_in;
     genvar j;
     generate
         for (j=0; j<`NUM_PORT; j=j+1) begin : split_field
             assign dst_src_list [j] = r_data [j][`SRC_LIST_POS];
             assign dst [j] = r_data [j][`DST_POS];
             assign mc [j] = r_data [j][`MC_POS];
             assign hs [j] = r_data [j][`HS_POS];
             assign ppv [j] = r_data [j][`PPV_POS];
             assign flit_num[j] = r_data [j][`FLIT_NUM_POS];
         end
         // time is an advanced signal, skip the first buf
          assign ad_time [0] = data_in_0[`TIME_POS];
          assign ad_time [1] = data_in_1[`TIME_POS];
          assign ad_time [2] = data_in_2[`TIME_POS];
          assign ad_time [3] = data_in_3[`TIME_POS];
          assign ad_time [4] = data_in_4[`TIME_POS];
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
    wire [`DATA_WIDTH-1:0] w_data_local_out [0:`NUM_PORT-1];
    wire [`PC_INDEX_WIDTH-1:0] num_flit;
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
    .num_flit_o (num_flit)
    );
    wire [1:0] rank_dir [0:3];
    // Permutation Sorting Network
    // the assoicated flit may be merged or ejected.
    // although it relaxes the priority, it did not implicate the correctness.
    permutationNetwork Sort(
    .time0      (ad_time [0]),
    .time1      (ad_time [1]) ,
    .time2      (ad_time [2]),
    .time3      (ad_time [3]),
    .dout0      (rank_dir[0]),
    .dout1      (rank_dir[1]),
    .dout2      (rank_dir[2]),
    .dout3      (rank_dir[3])
    );
    wire [`NUM_PORT-2:0] allocPV [3:0];
    wire [`NUM_PORT-2:0] unallocPV [3:0];
    swAlloc swAlloc(
    .mc_0           (w_data_local_out[0][`MC_POS]),
    .mc_1           (w_data_local_out[1][`MC_POS]),
    .mc_2           (w_data_local_out[2][`MC_POS]),
    .mc_3           (w_data_local_out[3][`MC_POS]),
    .numFlit_in     (num_flit),
    .ppv_0          (w_data_local_out[0][`NL_PPV_POS]),
    .ppv_1          (w_data_local_out[1][`NL_PPV_POS]),
    .ppv_2          (w_data_local_out[2][`NL_PPV_POS]),
    .ppv_3          (w_data_local_out[3][`NL_PPV_POS]),
    .allocPV_0      (allocPV[0][3:0]),
    .allocPV_1      (allocPV[1][3:0]),
    .allocPV_2      (allocPV[2][3:0]),
    .allocPV_3      (allocPV[3][3:0])
    );
    genvar k;
    wire [`NUM_PORT * 4 -1:0] nppv [3:0];
    // precompute the ppv of next node
    generate
    for (k=0; k<4; k=k+1) begin : RC
        nextRC precomp_ppv(
        .dst        (w_data_local_out[k][`DST_POS]),
        .dstList    (w_data_local_out[k][`DST_LIST_POS]),
        .mc         (w_data_local_out[k][`MC_POS]),
        .indir      (k),
        .nextPPV    (nppv[k])
        );
    end
    endgenerate
    // store in the stage 1 pipeline buffer
    // including allocPPV, unallocPPV, nppv, and flit itself
    reg [`DATA_WIDTH-1:0] r_data_st1 [0:3];
    reg [`NUM_PORT*4-1:0] r_nppv_st1 [0:3];
    reg [1:0] r_rank_dir [0:3];
    integer ii;
    always @ (posedge clk)
    for (ii=0; ii<4; ii=ii+1) begin
        r_data_st1[ii] <= {w_data_local_out[ii][`DATA_WIDTH-1:`PPV_END], allocPV[ii][3:0], w_data_local_out[ii][`PPV_START-1:0]};     // Internally, we use ppv filed as allocatedPPV.
        r_nppv_st1[ii] <= nppv[ii];
        r_rank_dir [ii] <= rank_dir[ii];
    end
    // stage 2
    wire [`DATA_WIDTH_XBAR-1:0] xbar_out [0:3];
    xbar xbar(
    .in_0           ({r_nppv_st1[0], r_data_st1[0]}),
    .in_1           ({r_nppv_st1[1], r_data_st1[1]}),
    .in_2           ({r_nppv_st1[2], r_data_st1[2]}),
    .in_3           ({r_nppv_st1[3], r_data_st1[3]}),
    .out_0          (xbar_out[0]),
    .out_1          (xbar_out[1]),
    .out_2          (xbar_out[2]),
    .out_3          (xbar_out[3]),
    .indir_rank0    (r_rank_dir[0]),
    .indir_rank1    (r_rank_dir[1]),
    .indir_rank2    (r_rank_dir[2]),
    .indir_rank3    (r_rank_dir[3])
    );
    genvar m;
    wire [`NUM_PORT-1:0] selected_nppv [0:3];
    wire [`DST_LIST_WIDTH-1:0] updated_dst_list [0:3];
    wire [`DATA_WIDTH-1:0] data_out [0:3];
    generate
    // select ppv
    for (m=0; m<4; m=m+1) begin: update_field
    selNextPPV selPPV(
    .pre_nppv    (xbar_out[m][`DATA_WIDTH_XBAR-1: `DATA_WIDTH_XBAR-20]),
    .outdir      (m),
    .nppv        (selected_nppv [m])
    );
    dstMgmt # (m) dstMgmt(
    .allocPV        (xbar_out[m][`PPV_POS]),
    .dstList_in     (xbar_out[m][`DST_LIST_POS]),
    .dstList_out    (updated_dst_list[m])
    );
    assign data_out [m] = xbar_out[m][`MC_POS] ?
            {xbar_out[m][`DATA_WIDTH-1:`PPV_END+1], selected_nppv[m], xbar_out[m][`PPV_START-1:128], updated_dst_list[m], xbar_out[m][`LO_PAYLOAD_POS]} :
            {xbar_out[m][`DATA_WIDTH-1:`PPV_END+1], selected_nppv[m], xbar_out[m][`PPV_START-1:0]};
    end
    endgenerate
    assign data_out_0 = data_out [0];
    assign data_out_1 = data_out [1];
    assign data_out_2 = data_out [2];
    assign data_out_3 = data_out [3];
endmodule