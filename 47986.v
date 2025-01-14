module outputs)
// End of automatics
wire  [13:0]      cpx_cpulo_inv_data ;
wire  [13:0]      cpx_cpuhi_inv_data ;
//wire  [`STB_PCX_WIDTH-1:0]  stb_pcx_pkt ;
//wire  [`STB_DFQ_WIDTH-1:0]  stb_dfq_pkt_data ;
wire  [`STB_DFQ_WIDTH-1:0]  stb_dfq_data_in ;
//wire  [`DFQ_WIDTH-1:0]  cpx_dfq_data ;
//wire  [`DFQ_WIDTH-1:0]  cpx_dfq_data_d1 ;
//wire  [`CPX_WIDTH-1:0]  cpx_data_cx_d1 ;
//wire        cpx_st_cmplt_d1 ;
wire  [`DFQ_WIDTH:0]  dfq_byp_mx_data ;
wire  [`DFQ_WIDTH-1:0]    dfq_byp_ff_data ;
//wire  [`STB_DFQ_WIDTH-1:0]  store_dfq_pkt ;
wire  [127:0]   st_dcfill_data ;
wire  [63:0]      dcache_wr_data ;
wire  [127:0]   ldinv_dcfill_data ;
//wire  [`LMQ_WIDTH-1:0]  lmq0_pcx_pkt, lmq1_pcx_pkt ;
//wire  [`LMQ_WIDTH-1:0]  lmq2_pcx_pkt, lmq3_pcx_pkt ;
wire  [127:0] lsu_dcfill_data ;
wire  [15:0]      dcache_wr_parity_mod ;
//wire  [3:0]     bist_rsel_way_e ;
wire  [107:0]     cpx_fwd_pkt_din ;
//wire [3:0]     bist_rsel_way_m ;
//wire [3:0]     lsu_bist_rsel_way_wb ;  // way select for read
wire  [1:0]  cpx_st_dcfill_wrway;
wire  [`STB_DFQ_VLD:0]   stb_dcfill_data_mx;
wire           clk;
wire  [13:0]            lsu_cpu_inv_data ;
assign  clk = rclk;
//=================================================================================================
//      STB Datapath
//=================================================================================================
// PCX PKT FORMATTING
// THREAD0
//assign stb_pcx_pkt[`STB_PCX_VLD] = lsu_stb_pcx_rvld_d1 ;    // Valid
// Support stores for now.
//assign stb_pcx_pkt[`STB_PCX_RQ_HI:`STB_PCX_RQ_LO] = stb_rdata_ramd[74:72] ; // Rq-type
//assign stb_pcx_pkt[`STB_PCX_NC] = stb_rdata_ramd[74] ;  // NC
// cpu-id will be inserted on way out of core.
//assign  stb_pcx_pkt[`STB_PCX_TH_HI:`STB_PCX_TH_LO] = lsu_stb_rd_tid[1:0] ;  // TID
// bf-id is not required.
//assign  stb_pcx_pkt[`STB_PCX_WY_HI:`STB_PCX_WY_LO] = stb_rdata_ramd[71:70] ;  // WAY
//assign  stb_pcx_pkt[`STB_PCX_SZ_HI:`STB_PCX_SZ_LO] =
//      stb_rdata_ramd[69:68];        // Size
//assign  stb_pcx_pkt[`STB_PCX_AD_HI:`STB_PCX_AD_LO] =
//      {stb_rdata_ramc[44:9],stb_rdata_ramd[67:64]} ;// Addr
//assign  stb_pcx_pkt[`STB_PCX_DA_HI:`STB_PCX_DA_LO] =
//      stb_rdata_ramd[63:0];         // Data
// STB to DFQ Data Formatting
// THREAD0
assign  stb_dfq_data_in[`STB_DFQ_WIDTH-1:0] =
  {lsu_stb_pcx_rvld_d1,                         // 82:82 vld  //stb_pcx_pkt[`STB_PCX_VLD],
  stb_rdata_ramd_b74_buf,                           // 81:81 ??   //stb_rdata_ramd[74],
  2'b00,                                        // 80:79 not used
  //stb_pcx_pkt[`STB_PCX_WY_HI:`STB_PCX_WY_LO],
  3'b000,                                       // 78:76 instead of stb_dfq_rd_id[2:0],
  stb_rdata_ramd_buf[69:68],                        // 75:74 size //stb_pcx_pkt[`STB_PCX_SZ_HI:`STB_PCX_SZ_LO],
  {stb_rdata_ramc_buf[14:9],stb_rdata_ramd_buf[67:64]}, // 73:64 Addr //stb_pcx_pkt[`STB_PCX_AD_LO+9:`STB_PCX_AD_LO],
  stb_rdata_ramd_buf[63:0]};                        // 63:0  data  //stb_pcx_pkt[`STB_PCX_DA_HI:`STB_PCX_DA_LO]};
// STB DATA BYPASS FLOP
// Data is read out on read for pcx. The data is then
// bypassed to the dfq when the st-ack is received.
//wire  [3:0]   pcx_rq_for_stb_d1;
wire  [3:0]   clk_stb_data;
wire  [`STB_DFQ_VLD:0]  stb_dfq_pkt_data0,
                        stb_dfq_pkt_data1,
                        stb_dfq_pkt_data2,
                        stb_dfq_pkt_data3;
// timing fix: 9/15/03 - reduce loading on pcx_rq_for_stb[3:0] to stb_clt[0-3]. it had FO2 (stb_ctl,qdp2 - cap=0.5-0.8)
//             move the flop from qdp2 to qctl1
//flop pcx rq to read stb data
//dff  #(4) pcx_rq_for_stb_ff (
//           .din  (pcx_rq_for_stb[3:0]),
//           .q    (pcx_rq_for_stb_d1[3:0]),
//           .clk  (clk),
//           .se   (1'b0),       .si (),          .so ());
//dffe  #(83) stb_dfq_byp_ff (
//        .din  (stb_dfq_data_in[`STB_DFQ_VLD:0]),
//  .q    (stb_dfq_pkt_data[`STB_DFQ_VLD:0]),
//        .en   (lsu_stb_dfq_rvld), .clk (clk),
//        .se     (1'b0),       .si (),          .so ()
//        );
//THREAD0
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf stb_dfq_byp0_clken(
          .clk(clk_stb_data[0]),
          .rclk(clk),
          .enb_l(~pcx_rq_for_stb_d1[0]),
          .tmb_l(~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(83) stb_dfq_byp0_ff (
           .din  (stb_dfq_data_in[`STB_DFQ_VLD:0]),
           .q    (stb_dfq_pkt_data0[`STB_DFQ_VLD:0]),
           .en (~(~pcx_rq_for_stb_d1[0])), .clk(clk),
           .se   (1'b0),       .si (),          .so ());
`else
dff_s  #(83) stb_dfq_byp0_ff (
           .din  (stb_dfq_data_in[`STB_DFQ_VLD:0]),
           .q    (stb_dfq_pkt_data0[`STB_DFQ_VLD:0]),
           .clk  (clk_stb_data[0]),
           .se   (1'b0),       .si (),          .so ());
`endif
//THREAD1
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf stb_dfq_byp1_clken(
          .clk(clk_stb_data[1]),
          .rclk(clk),
          .enb_l(~pcx_rq_for_stb_d1[1]),
          .tmb_l(~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(83) stb_dfq_byp1_ff (
           .din  (stb_dfq_data_in[`STB_DFQ_VLD:0]),
           .q    (stb_dfq_pkt_data1[`STB_DFQ_VLD:0]),
           .en (~(~pcx_rq_for_stb_d1[1])), .clk(clk),
           .se   (1'b0),       .si (),          .so ());
`else
dff_s  #(83) stb_dfq_byp1_ff (
           .din  (stb_dfq_data_in[`STB_DFQ_VLD:0]),
           .q    (stb_dfq_pkt_data1[`STB_DFQ_VLD:0]),
           .clk  (clk_stb_data[1]),
           .se   (1'b0),       .si (),          .so ());
`endif
//THREAD2
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf stb_dfq_byp2_clken(
          .clk(clk_stb_data[2]),
          .rclk(clk),
          .enb_l(~pcx_rq_for_stb_d1[2]),
          .tmb_l(~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(83) stb_dfq_byp2_ff (
           .din  (stb_dfq_data_in[`STB_DFQ_VLD:0]),
           .q    (stb_dfq_pkt_data2[`STB_DFQ_VLD:0]),
           .en (~(~pcx_rq_for_stb_d1[2])), .clk(clk),
           .se   (1'b0),       .si (),          .so ());
`else
dff_s  #(83) stb_dfq_byp2_ff (
           .din  (stb_dfq_data_in[`STB_DFQ_VLD:0]),
           .q    (stb_dfq_pkt_data2[`STB_DFQ_VLD:0]),
           .clk  (clk_stb_data[2]),
           .se   (1'b0),       .si (),          .so ());
`endif
//THREAD3
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf stb_dfq_byp3_clken(
          .clk(clk_stb_data[3]),
          .rclk(clk),
          .enb_l(~pcx_rq_for_stb_d1[3]),
          .tmb_l(~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(83) stb_dfq_byp3_ff (
           .din  (stb_dfq_data_in[`STB_DFQ_VLD:0]),
           .q    (stb_dfq_pkt_data3[`STB_DFQ_VLD:0]),
           .en (~(~pcx_rq_for_stb_d1[3])), .clk(clk),
           .se   (1'b0),       .si (),          .so ());
`else
dff_s  #(83) stb_dfq_byp3_ff (
           .din  (stb_dfq_data_in[`STB_DFQ_VLD:0]),
           .q    (stb_dfq_pkt_data3[`STB_DFQ_VLD:0]),
           .clk  (clk_stb_data[3]),
           .se   (1'b0),       .si (),          .so ());
`endif
// MUX the store data if cpx_pkt==st_ack w/ dcfill vld=1
mux4ds  #(`STB_DFQ_VLD+1) stb_data_mx (
  .in0  (stb_dfq_pkt_data0[`STB_DFQ_VLD:0]),
  .in1  (stb_dfq_pkt_data1[`STB_DFQ_VLD:0]),
  .in2  (stb_dfq_pkt_data2[`STB_DFQ_VLD:0]),
  .in3  (stb_dfq_pkt_data3[`STB_DFQ_VLD:0]),
  .sel0 (lsu_cpx_thrdid[0]),
  .sel1 (lsu_cpx_thrdid[1]),
  .sel2 (lsu_cpx_thrdid[2]),
  .sel3 (lsu_cpx_thrdid[3]),
  .dout (stb_dcfill_data_mx[`STB_DFQ_VLD:0])
);
//NOTE: mux this raw data w/ modified data to generate dfq input and feed into dfq_wdata
//=================================================================================================
//    FWD PKT - REQ/REPLY
//=================================================================================================
// Design Note !! - Bus can be decreased - do not have to keep tag.
// TAP ACCESS FORMAT
// BEGIN (OLD)
// Control bits :
// R/W,TID,BIST,MARGIN,DEFEATURE,PC (R=1,W=0)
// These 7b are mapped to bits 70:64 of the cpx pkt.
// (R/W is the highest order bit).
// Data bits :
// PC(48b),Margin(36b),Bist-Ctl(14b),Defeature(4b).
// The largest field of 48b is mapped to bits 47:0 of the cpx pkt.
// END (OLD)
// Control bits (mapped to data[127:96] of cpx packet):
// L1I data,L1D data,BIST,MARGIN,DEFEATURE,PC,TID[1:0]
// These 8b are mapped to bits 103:96 of the cpx pkt.
// Unused bits are zeros.
// (TID is the lowest order 2 bits).
// Address bits (mapped to data[95:64] of cpx packet):
// This is used to access the L1 cache arrays.  This field
// is a dont-care for the bist/margin/defeature/pc ASIs.
// Only the lower 32 address bits are specified here.
// The core (lsu) will pad zeros create a 64-bit address.
// Data bits (mapped to data[63:0] of cpx packet):
// PC(48b),Margin(36b),Bist-Ctl(14b),Defeature(4b).
// The largest field of 48b is mapped to bits 47:0 of the cpx pkt.
// Formatted to contain fwd req which is of largest size.
// Truncate address !!! 40b should not be required.
assign  cpx_fwd_pkt_din[107:0] =
  {
  cpx_spc_data_cx[`CPX_NC], // r/!w   (1b)
  cpx_spc_data_cx[133:131], // src/tar  (3b)
  cpx_spc_data_cx[103:0]    // 64b data + 40b addr (104b)
  } ;
// Contains cpx fwd reply or req
//dffe  #(108) fwdpkt_ff  (
//        .din  (cpx_fwd_pkt_din[107:0]),
//  .q    (lsu_pcx_fwd_pkt[107:0]),
//        .en   (cpx_fwd_pkt_en_cx),
//  .clk  (clk),
//        .se     (1'b0),       .si (),          .so ()
//        );
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf fwdpkt_clken(
          .clk(clk_cpx_fwd_pkt_en_cx),
          .rclk(clk),
          .enb_l(~cpx_fwd_pkt_en_cx),
          .tmb_l(~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(108) fwdpkt_ff  (
            .din  (cpx_fwd_pkt_din[107:0]),
            .q    (lsu_pcx_fwd_pkt[107:0]),
            .en (~(~cpx_fwd_pkt_en_cx)), .clk(clk),
            .se     (1'b0),       .si (),          .so ());
`else
dff_s  #(108) fwdpkt_ff  (
            .din  (cpx_fwd_pkt_din[107:0]),
            .q    (lsu_pcx_fwd_pkt[107:0]),
            .clk  (clk_cpx_fwd_pkt_en_cx),
            .se     (1'b0),       .si (),          .so ());
`endif
// New mapping for address bits given that tag is gone. (OBSOLETE)
// pkt[74:73] - Way
// pkt[72:65] - Set Index
// pkt[64] - Word
// New mapping - based on 0-in testing, alignment with PRM.
// pkt[76:75] - Way
// pkt[74:68] - Set Index
// pkt[67] -DWord
wire [7:0] dcache_iob_addr_e ;
assign	dcache_iob_addr_e[7:0] = lsu_pcx_fwd_pkt[74:67] ;
//wire [3:0] dcache_iob_wy_e ;
//assign	dcache_iob_wy_e[0] = ~lsu_pcx_fwd_pkt[76] & ~lsu_pcx_fwd_pkt[75] ;
//assign	dcache_iob_wy_e[1] = ~lsu_pcx_fwd_pkt[76] &  lsu_pcx_fwd_pkt[75] ;
//assign	dcache_iob_wy_e[2] =  lsu_pcx_fwd_pkt[76] & ~lsu_pcx_fwd_pkt[75] ;
//assign	dcache_iob_wy_e[3] =  lsu_pcx_fwd_pkt[76] &  lsu_pcx_fwd_pkt[75] ;
assign lsu_dcache_iob_way_e [1:0] =  {lsu_pcx_fwd_pkt[76],  lsu_pcx_fwd_pkt[75]};
wire [63:0] dcache_iob_data_e ;
assign	dcache_iob_data_e[63:0] = lsu_pcx_fwd_pkt[63:0] ;
assign  lsu_iobrdge_wr_data[43:0] = lsu_pcx_fwd_pkt[43:0] ;
assign  lsu_iobrdge_tap_rq_type[8:0] = {lsu_pcx_fwd_pkt[107],lsu_pcx_fwd_pkt[103:96]} ;
//=================================================================================================
//    DFQ PKT SELECTION
//=================================================================================================
// There are two sources :
// clear stale data in the stb and bypass flops to ensure TSO.
// to be written to dfq if bypass full else wr to byp mx.
//assign  dfq_wdata[`DFQ_WIDTH:0] =
//  {lsu_cpx_spc_inv_vld,lsu_cpxpkt_type_dcd_cx[5:0],cpx_spc_data_cx[`CPX_WIDTH-1:0]};
wire  [`DFQ_WIDTH:0]  dfq_st_data,dfq_cpx_raw_wdata;
wire  [1:0]           cpx_st_ack_addr_b54;
assign  dfq_cpx_raw_wdata[`DFQ_WIDTH:0] =
  {lsu_cpx_spc_inv_vld,lsu_cpxpkt_type_dcd_cx[5:0],cpx_spc_data_cx[`CPX_WIDTH-1:0]};
assign  dfq_st_data[`DFQ_WIDTH:0]  =
        {lsu_cpx_spc_inv_vld,lsu_cpxpkt_type_dcd_cx[5:0],
         cpx_spc_data_cx[`CPX_WIDTH-1:87],
         cpx_st_ack_addr_b54[1:0],             // 86:85
         cpx_st_dcfill_wrway[1:0],             // 84:83
         stb_dcfill_data_mx[`STB_DFQ_VLD:0]};  // 82:0
mux2ds  #(`DFQ_WIDTH+1) dfq_st_data_mx (
  .in0  (dfq_st_data[`DFQ_WIDTH:0]),
  .in1  (dfq_cpx_raw_wdata[`DFQ_WIDTH:0]),
  .sel0 (lsu_cpx_stack_dcfill_vld),
  .sel1 (~lsu_cpx_stack_dcfill_vld),
  .dout (dfq_wdata[`DFQ_WIDTH:0])
);
//timing fix: 05/31/03: decouple byp mux from lsu_cpx_stack_dcfill_vld
//            i.e. replace dfq_wdata w/ dfq_cpx_raw_wdata in byp mux
// select between dfq output and cpx bypass.
mux2ds  #(`DFQ_WIDTH+1) dfq_byp_mx (
  .in0  (dfq_rdata[`DFQ_WIDTH:0]),
  .in1  (dfq_cpx_raw_wdata[`DFQ_WIDTH:0]),
  .sel0 (dfq_rd_vld_d1),
  .sel1 (~dfq_rd_vld_d1),
  .dout (dfq_byp_mx_data[`DFQ_WIDTH:0])
);
assign  lsu_dfq_byp_cpx_inv     =   dfq_byp_mx_data[`DFQ_WIDTH];
assign  lsu_dfq_byp_tid[1:0]    =   dfq_byp_mx_data[`CPX_TH_HI:`CPX_TH_LO] ;
//assign  lsu_dfq_byp_cpuid[2:0]  =   dfq_byp_mx_data[`CPX_INV_CID_HI:`CPX_INV_CID_LO] ;
assign  lsu_dfq_byp_flush = 	dfq_byp_mx_data[`CPX_NC] ;
assign  lsu_dfq_byp_invwy_vld = dfq_byp_mx_data[`CPX_WYVLD] ;
//assign  lsu_dfq_byp_type[5:0]   =   dfq_byp_mx_data[`DFQ_WIDTH-1:`DFQ_WIDTH-6] ;
assign  lsu_dfq_byp_type[5:3]   =   dfq_byp_mx_data[`DFQ_WIDTH-1:`DFQ_WIDTH-3] ;
assign  lsu_dfq_byp_type[2]   =   dfq_byp_mx_data[`DFQ_WIDTH-4] & dfq_rd_vld_d1;
assign  lsu_dfq_byp_type[1:0]   =   dfq_byp_mx_data[`DFQ_WIDTH-5:`DFQ_WIDTH-6] ;
//assign  lsu_dfq_byp_stquad_pkt2 =   dfq_byp_mx_data[130] ;
assign  lsu_dfq_byp_binit_st =   dfq_byp_mx_data[125] ;
//assign  lsu_dfq_byp_perror_iinv    = dfq_byp_mx_data[`CPX_PERR_DINV+1] ;
//assign  lsu_dfq_byp_perror_dinv    = dfq_byp_mx_data[`CPX_PERR_DINV] ;
//assign  lsu_dfq_byp_stack_dcfill_vld =   dfq_byp_mx_data[87] ;
assign  lsu_dfq_byp_stack_adr_b54[1:0] =   dfq_byp_mx_data[86:85] ;
assign  lsu_dfq_byp_stack_wrway[1:0] =   dfq_byp_mx_data[84:83] ;
assign  lsu_ifill_pkt[`CPX_VLD-1:0] = dfq_byp_mx_data[`CPX_VLD-1:0] ;
//assign  lsu_ifill_pkt[`CPX_WIDTH-1:0] = {lsu_ifill_pkt_vld,dfq_byp_mx_data[`CPX_VLD-1:0]} ;
assign  lsu_dfq_byp_atm  = dfq_byp_mx_data[129] ;
// Decode in qctl !!!
//assign  dfq_byp_tid[1:0] = dfq_byp_mx_data[`CPX_TH_HI:`CPX_TH_LO] ;
//assign  dfq_byp_tid[1:0] = dfq_byp_mx_data[`DFQ_TH_HI:`DFQ_TH_LO] ;
// Stage dfq output
// In case of multiple inv or other such cases, pkt will be held in
// byp ff until pkt completely utilized.
//dffe  #(`DFQ_WIDTH) dfq_data_stg (
//        .din  (dfq_byp_mx_data[`DFQ_WIDTH-1:0]),
//  .q    (dfq_byp_ff_data[`DFQ_WIDTH-1:0]),
//        .en (dfq_byp_ff_en),  .clk  (clk),
//        .se     (1'b0),     .si (),          .so ()
//);
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf dfq_byp_ff_en_clken(
          .clk(clk_dfq_byp_ff_en),
          .rclk(clk),
          .enb_l(~dfq_byp_ff_en),
          .tmb_l(~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`DFQ_WIDTH) dfq_data_stg (
                  .din  (dfq_byp_mx_data[`DFQ_WIDTH-1:0]),
                  .q    (dfq_byp_ff_data[`DFQ_WIDTH-1:0]),
                  .en (~(~dfq_byp_ff_en)), .clk(clk),
                  .se   (1'b0),     .si (),          .so ());
`else
dff_s  #(`DFQ_WIDTH) dfq_data_stg (
                  .din  (dfq_byp_mx_data[`DFQ_WIDTH-1:0]),
                  .q    (dfq_byp_ff_data[`DFQ_WIDTH-1:0]),
                  .clk  (clk_dfq_byp_ff_en),
                  .se   (1'b0),     .si (),          .so ());
`endif
// To be decoded in qctl
//assign  lsu_st_cmplt_type = dfq_byp_ff_data[`DFQ_ST_CMPLT];
assign  dfq_tid[1:0] = dfq_byp_ff_data[`CPX_TH_HI:`CPX_TH_LO] ;
output    lsu_cpx_pkt_ifill_type;
output    lsu_cpx_pkt_atomic ;
// Should some of these be in-flight ?
//assign  lsu_cpx_pkt_rqtype[3:0]   = dfq_byp_ff_data[`CPX_RQ_HI:`CPX_RQ_LO] ;
assign  lsu_cpx_pkt_ifill_type    = dfq_byp_ff_data[`DFQ_WIDTH-2];
assign  lsu_cpx_pkt_tid[1:0]      = dfq_byp_ff_data[`CPX_TH_HI:`CPX_TH_LO] ;
assign  lsu_cpx_pkt_vld     = dfq_byp_ff_data[`CPX_VLD] ;
assign  lsu_cpx_pkt_atm_st_cmplt  = dfq_byp_ff_data[129] ;
assign  lsu_cpx_pkt_invwy[1:0]    = dfq_byp_ff_data[`CPX_WY_HI:`CPX_WY_LO] ;
// Upper 6bits are used to store decoded request type information.
assign  lsu_cpx_pkt_strm_ack   = dfq_byp_ff_data[`DFQ_WIDTH-5];
//assign  lsu_cpx_pkt_inv_pa[4:0]   = dfq_byp_ff_data[`CPX_INV_PA_HI-1:`CPX_INV_PA_LO];  //!!
assign  lsu_cpx_pkt_inv_pa[4:0]   = dfq_byp_ff_data[`CPX_INV_PA_HI:`CPX_INV_PA_LO];
assign  lsu_cpx_pkt_atomic    = dfq_byp_ff_data[129]  | //atomic st ack
            dfq_byp_ff_data[131]  ; //stquad pkt1
//assign  lsu_cpx_pkt_stquad_pkt2   = dfq_byp_ff_data[130] ;
assign  lsu_cpx_pkt_binit_st   = dfq_byp_ff_data[125] ;
assign  lsu_cpx_pkt_prefetch = dfq_byp_ff_data[128] ; // for qctl2
assign  lsu_cpx_pkt_prefetch2 = dfq_byp_ff_data[128] ;  // for dctl
//assign	lsu_spu_strm_st = dfq_byp_ff_data[134] ; // strm store ack (vs. ma)
assign  lsu_cpx_pkt_perror_iinv    = dfq_byp_ff_data[`CPX_PERR_DINV+1] ;
assign  lsu_cpx_pkt_perror_dinv    = dfq_byp_ff_data[`CPX_PERR_DINV] ;
assign  lsu_cpx_pkt_perror_set[1:0] =
	dfq_byp_ff_data[`CPX_PERR_DINV_AD5:`CPX_PERR_DINV_AD4] ;
assign  lsu_cpx_pkt_ld_err[1:0] = dfq_byp_ff_data[138:137] ;
assign  lsu_cpx_pkt_l2miss = dfq_byp_ff_data[139] ;
//=================================================================================================
//      DFQ OUTPUT - LOCAL PROCESSING
//=================================================================================================
mux4ds  #(14) invfld_lo_sel (
        .in0    ({dfq_byp_mx_data[`CPX_A11_C0_HI:`CPX_A11_C0_LO],
                  dfq_byp_mx_data[`CPX_A10_C0_HI:`CPX_A10_C0_LO],
                  dfq_byp_mx_data[`CPX_A01_C0_HI:`CPX_A01_C0_LO],
                  dfq_byp_mx_data[`CPX_A00_C0_HI:`CPX_A00_C0_LO]}),
        .in1    ({dfq_byp_mx_data[`CPX_A11_C1_HI:`CPX_A11_C1_LO],
                  dfq_byp_mx_data[`CPX_A10_C1_HI:`CPX_A10_C1_LO],
                  dfq_byp_mx_data[`CPX_A01_C1_HI:`CPX_A01_C1_LO],
                  dfq_byp_mx_data[`CPX_A00_C1_HI:`CPX_A00_C1_LO]}),
        .in2    ({dfq_byp_mx_data[`CPX_A11_C2_HI:`CPX_A11_C2_LO],
                  dfq_byp_mx_data[`CPX_A10_C2_HI:`CPX_A10_C2_LO],
                  dfq_byp_mx_data[`CPX_A01_C2_HI:`CPX_A01_C2_LO],
                  dfq_byp_mx_data[`CPX_A00_C2_HI:`CPX_A00_C2_LO]}),
        .in3    ({dfq_byp_mx_data[`CPX_A11_C3_HI:`CPX_A11_C3_LO],
                  dfq_byp_mx_data[`CPX_A10_C3_HI:`CPX_A10_C3_LO],
                  dfq_byp_mx_data[`CPX_A01_C3_HI:`CPX_A01_C3_LO],
                  dfq_byp_mx_data[`CPX_A00_C3_HI:`CPX_A00_C3_LO]}),
        .sel0   (lsu_cpu_dcd_sel[0]),
        .sel1   (lsu_cpu_dcd_sel[1]),
        .sel2   (lsu_cpu_dcd_sel[2]),
        .sel3   (lsu_cpu_dcd_sel[3]),
        .dout   (cpx_cpulo_inv_data[13:0])
);
mux4ds  #(14) invfld_hi_sel (
        .in0    ({dfq_byp_mx_data[`CPX_A11_C4_HI:`CPX_A11_C4_LO],
                  dfq_byp_mx_data[`CPX_A10_C4_HI:`CPX_A10_C4_LO],
                  dfq_byp_mx_data[`CPX_A01_C4_HI:`CPX_A01_C4_LO],
                  dfq_byp_mx_data[`CPX_A00_C4_HI:`CPX_A00_C4_LO]}),
        .in1    ({dfq_byp_mx_data[`CPX_A11_C5_HI:`CPX_A11_C5_LO],
                  dfq_byp_mx_data[`CPX_A10_C5_HI:`CPX_A10_C5_LO],
                  dfq_byp_mx_data[`CPX_A01_C5_HI:`CPX_A01_C5_LO],
                  dfq_byp_mx_data[`CPX_A00_C5_HI:`CPX_A00_C5_LO]}),
        .in2    ({dfq_byp_mx_data[`CPX_A11_C6_HI:`CPX_A11_C6_LO],
                  dfq_byp_mx_data[`CPX_A10_C6_HI:`CPX_A10_C6_LO],
                  dfq_byp_mx_data[`CPX_A01_C6_HI:`CPX_A01_C6_LO],
                  dfq_byp_mx_data[`CPX_A00_C6_HI:`CPX_A00_C6_LO]}),
        .in3    ({dfq_byp_mx_data[`CPX_A11_C7_HI:`CPX_A11_C7_LO],
                  dfq_byp_mx_data[`CPX_A10_C7_HI:`CPX_A10_C7_LO],
                  dfq_byp_mx_data[`CPX_A01_C7_HI:`CPX_A01_C7_LO],
                  dfq_byp_mx_data[`CPX_A00_C7_HI:`CPX_A00_C7_LO]}),
        .sel0   (lsu_cpu_dcd_sel[4]),
        .sel1   (lsu_cpu_dcd_sel[5]),
        .sel2   (lsu_cpu_dcd_sel[6]),
        .sel3   (lsu_cpu_dcd_sel[7]),
        .dout   (cpx_cpuhi_inv_data[13:0])
);
mux2ds  #(14) invfld_sel (
        .in0    (cpx_cpulo_inv_data[13:0]),
        .in1    (cpx_cpuhi_inv_data[13:0]),
        .sel0   (~lsu_cpu_uhlf_sel),
        .sel1   (lsu_cpu_uhlf_sel),
        .dout   (lsu_cpu_inv_data[13:0])
);
assign  lsu_cpu_inv_data_b13to9[13:9]  =  lsu_cpu_inv_data[13:9] ;
assign  lsu_cpu_inv_data_b7to2[7:2]  =  lsu_cpu_inv_data[7:2] ;
assign  lsu_cpu_inv_data_b0  =  lsu_cpu_inv_data[0] ;
// same structure as above for st data write way
wire  [13:0] cpx_cpulo_dcfill_wrway,
             cpx_cpuhi_dcfill_wrway,
             cpx_st_dcfill_wrway_sel;
mux4ds  #(14) st_dcfill_wrway_lo (
        .in0    ({cpx_spc_data_cx[`CPX_A11_C0_HI:`CPX_A11_C0_LO],
                  cpx_spc_data_cx[`CPX_A10_C0_HI:`CPX_A10_C0_LO],
                  cpx_spc_data_cx[`CPX_A01_C0_HI:`CPX_A01_C0_LO],
                  cpx_spc_data_cx[`CPX_A00_C0_HI:`CPX_A00_C0_LO]}),
        .in1    ({cpx_spc_data_cx[`CPX_A11_C1_HI:`CPX_A11_C1_LO],
                  cpx_spc_data_cx[`CPX_A10_C1_HI:`CPX_A10_C1_LO],
                  cpx_spc_data_cx[`CPX_A01_C1_HI:`CPX_A01_C1_LO],
                  cpx_spc_data_cx[`CPX_A00_C1_HI:`CPX_A00_C1_LO]}),
        .in2    ({cpx_spc_data_cx[`CPX_A11_C2_HI:`CPX_A11_C2_LO],
                  cpx_spc_data_cx[`CPX_A10_C2_HI:`CPX_A10_C2_LO],
                  cpx_spc_data_cx[`CPX_A01_C2_HI:`CPX_A01_C2_LO],
                  cpx_spc_data_cx[`CPX_A00_C2_HI:`CPX_A00_C2_LO]}),
        .in3    ({cpx_spc_data_cx[`CPX_A11_C3_HI:`CPX_A11_C3_LO],
                  cpx_spc_data_cx[`CPX_A10_C3_HI:`CPX_A10_C3_LO],
                  cpx_spc_data_cx[`CPX_A01_C3_HI:`CPX_A01_C3_LO],
                  cpx_spc_data_cx[`CPX_A00_C3_HI:`CPX_A00_C3_LO]}),
        .sel0   (lsu_cpu_dcd_sel[0]),
        .sel1   (lsu_cpu_dcd_sel[1]),
        .sel2   (lsu_cpu_dcd_sel[2]),
        .sel3   (lsu_cpu_dcd_sel[3]),
        .dout   (cpx_cpulo_dcfill_wrway[13:0])
);
mux4ds  #(14) st_dcfill_wrway_hi (
        .in0    ({cpx_spc_data_cx[`CPX_A11_C4_HI:`CPX_A11_C4_LO],
                  cpx_spc_data_cx[`CPX_A10_C4_HI:`CPX_A10_C4_LO],
                  cpx_spc_data_cx[`CPX_A01_C4_HI:`CPX_A01_C4_LO],
                  cpx_spc_data_cx[`CPX_A00_C4_HI:`CPX_A00_C4_LO]}),
        .in1    ({cpx_spc_data_cx[`CPX_A11_C5_HI:`CPX_A11_C5_LO],
                  cpx_spc_data_cx[`CPX_A10_C5_HI:`CPX_A10_C5_LO],
                  cpx_spc_data_cx[`CPX_A01_C5_HI:`CPX_A01_C5_LO],
                  cpx_spc_data_cx[`CPX_A00_C5_HI:`CPX_A00_C5_LO]}),
        .in2    ({cpx_spc_data_cx[`CPX_A11_C6_HI:`CPX_A11_C6_LO],
                  cpx_spc_data_cx[`CPX_A10_C6_HI:`CPX_A10_C6_LO],
                  cpx_spc_data_cx[`CPX_A01_C6_HI:`CPX_A01_C6_LO],
                  cpx_spc_data_cx[`CPX_A00_C6_HI:`CPX_A00_C6_LO]}),
        .in3    ({cpx_spc_data_cx[`CPX_A11_C7_HI:`CPX_A11_C7_LO],
                  cpx_spc_data_cx[`CPX_A10_C7_HI:`CPX_A10_C7_LO],
                  cpx_spc_data_cx[`CPX_A01_C7_HI:`CPX_A01_C7_LO],
                  cpx_spc_data_cx[`CPX_A00_C7_HI:`CPX_A00_C7_LO]}),
        .sel0   (lsu_cpu_dcd_sel[4]),
        .sel1   (lsu_cpu_dcd_sel[5]),
        .sel2   (lsu_cpu_dcd_sel[6]),
        .sel3   (lsu_cpu_dcd_sel[7]),
        .dout   (cpx_cpuhi_dcfill_wrway[13:0])
);
mux2ds  #(14) st_dcfill_wrway_sel (
        .in0    (cpx_cpulo_dcfill_wrway[13:0]),
        .in1    (cpx_cpuhi_dcfill_wrway[13:0]),
        .sel0   (~lsu_cpu_uhlf_sel),
        .sel1   (lsu_cpu_uhlf_sel),
        .dout   (cpx_st_dcfill_wrway_sel[13:0])
);
// select the appropriate offset
//bug3718 - 0in bug - cpx_st_dcfill_wrway_sel can be multi-hot foe non-stack cpx responses
//          hence qual w/ stack req type
wire  [3:0]  st_dcfill_wrway_mxsel ;
assign st_dcfill_wrway_mxsel[0] =  (lsu_cpxpkt_type_dcd_cx[2] & cpx_st_dcfill_wrway_sel[0]) & ~rst_tri_en ;
assign st_dcfill_wrway_mxsel[1] =  (lsu_cpxpkt_type_dcd_cx[2] & cpx_st_dcfill_wrway_sel[4]) & ~rst_tri_en ;
assign st_dcfill_wrway_mxsel[2] =  (lsu_cpxpkt_type_dcd_cx[2] & cpx_st_dcfill_wrway_sel[7]) & ~rst_tri_en ;
assign st_dcfill_wrway_mxsel[3] =  ~|st_dcfill_wrway_mxsel[2:0] | rst_tri_en;
mux4ds  #(2) st_dcfill_wrway_sel_b54 (
        .in0    (cpx_st_dcfill_wrway_sel[3:2]),
        .in1    (cpx_st_dcfill_wrway_sel[6:5]),
        .in2    (cpx_st_dcfill_wrway_sel[10:9]),
        .in3    (cpx_st_dcfill_wrway_sel[13:12]),
        .sel0   (st_dcfill_wrway_mxsel[0]),
        .sel1   (st_dcfill_wrway_mxsel[1]),
        .sel2   (st_dcfill_wrway_mxsel[2]),
        .sel3   (st_dcfill_wrway_mxsel[3]),
        .dout   (cpx_st_dcfill_wrway[1:0])
);
assign  cpx_st_ack_addr_b54[0] = cpx_st_dcfill_wrway_sel[4] | cpx_st_dcfill_wrway_sel[11] ;
assign  cpx_st_ack_addr_b54[1] = cpx_st_dcfill_wrway_sel[7] | cpx_st_dcfill_wrway_sel[11] ;
//=================================================================================================
//assign store_dfq_pkt[`STB_DFQ_WIDTH-1:0] = stb_dfq_pkt_data[`STB_DFQ_WIDTH-1:0] ;
// Items generated/prior to fill cycle (but after DFQ read).
// This logic will be put in qctl and then be fwded to dcache.
// Need to do alignment. Assume dw for now.
// For a load, a bypass will always happen, a write is
// Mux in diagnostic information. Only data is muxed in because
// all other info is critical
   wire [63:0] diagnstc_wr_data;
dff_s  #(64) diagnstc_wr_data_ff (
        .din    (lsu_diagnstc_wr_data_e[63:0]),
        .q      (diagnstc_wr_data[63:0]),
        .clk    (clk),
        .se     (1'b0),     .si (),          .so ()
        );
mux2ds  #(64) dcwr_sel (
  //.in0  ({store_dfq_pkt[`STB_DFQ_DA_HI:`STB_DFQ_DA_LO]}),
  .in0  ({dfq_byp_ff_data[`STB_DFQ_DA_HI:`STB_DFQ_DA_LO]}),
  .in1  ({diagnstc_wr_data[63:0]}),
  .sel0 ( lsu_dfq_st_vld),
  .sel1 (~lsu_dfq_st_vld),
  //.sel0 (~lsu_diagnstc_wr_src_sel_e),
  //.sel1 ( lsu_diagnstc_wr_src_sel_e),
  .dout (dcache_wr_data[63:0])
);
// store currently assumed to be dword.
// st dword is duplicated across 16B.
// currently assume st and not atomics supported.
// The width can be reduced !!!
assign st_dcfill_data[127:0] =
  {                                                            //dfq_byp_ff_data[`STB_DFQ_VLD],
                                                               //2'b00,   // need thread-id
                                                               //2'b00,1'b0,5'b00000,
//   dfq_byp_ff_data[84:83],                          // 131:130 - wr_way[1:0]
//   dfq_byp_ff_data[`STB_DFQ_SZ_HI:`STB_DFQ_SZ_LO],  // 129:128 - size[1:0]
                                                               //29'd0,                                           //!!! reduce
                                                               //{dfq_byp_ff_data[`CPX_INV_PA_HI:`CPX_INV_PA_LO], // addr 10:6
                                                               //dfq_byp_ff_data[86:85],        // addr 5:4
                                                               //dfq_byp_ff_data[`STB_DFQ_AD_LO+3:`STB_DFQ_AD_LO]}, // addr 3:0
   dcache_wr_data[63:0],                            // 127:64
   dcache_wr_data[63:0]};                           // 63:0
   assign st_dcfill_addr[10:0] =
   {dfq_byp_ff_data[`CPX_INV_PA_HI:`CPX_INV_PA_LO],    // addr 10:6
    dfq_byp_ff_data[86:85],                            // addr 5:4
    dfq_byp_ff_data[`STB_DFQ_AD_LO+3:`STB_DFQ_AD_LO]}; // addr 3:0
// lmq0_pcx_pkt will have to be brought in. Same for lmq_ld_addr
// The width can be reduced !!!
//potentially we can take one cycle earlier version dfq_st_data
   assign lsu_st_way_e[1:0] = dfq_byp_ff_data[84:83];
   assign lsu_st_dcfill_size_e [1:0] = dfq_byp_ff_data[`STB_DFQ_SZ_HI:`STB_DFQ_SZ_LO];
assign ldinv_dcfill_data[127:0] =
  {                                                            //1'b0,
                                                               //dfq_byp_ff_data[`DFQ_TH_HI:`DFQ_TH_LO],
                                                               //dfq_byp_ff_data[`DFQ_LD_TYPE:`DFQ_INV_TYPE],
                                                               //1'b1,  //assume ld always writes.
                                                               //5'b00000,
//   lmq_ld_way[1:0],                                // 131:130 - way[1:0]- dfq_byp_ff_data[`DFQ_WY_HI:`DFQ_WY_LO],
//   2'b0,                                           // 129:128 - size[1:0]- lmq_pcx_pkt_sz[1:0],      //!!! reduce
                                                               //40'b0,  //lmq_pcx_pkt_addr[39:0],   //!!! reduce
   dfq_byp_ff_data[`DFQ_DA_HI:`DFQ_DA_LO]};        // 127:0
// Select between dfq-bypass (ld-inv) and store.
// This may be further restricted in width !!!
mux2ds  #(128) dfq_pkt_src (
  .in0  (st_dcfill_data[127:0]),
  .in1  (ldinv_dcfill_data[127:0]),
  .sel0 (~lsu_dfq_ld_vld),
  .sel1 (lsu_dfq_ld_vld),
  .dout (lsu_dcfill_data[127:0])
);
// Parity Generation for write data - from load or store.
wire  [15:0]  dcache_wr_parity ;
lsu_dc_parity_gen parity_gen (
    .data_in  (lsu_dcfill_data[`DCFILL_DA_HI:`DCFILL_DA_LO]),
    .parity_out (dcache_wr_parity[15:0])
  );
// Bug 4125. Corrupt parity if l2 unc err detected. Corrupt both upper and lower half
// as subsequent read will pick up one of two halves.
//wire	parity_byte0_flip ;
//wire	parity_byte8_flip ;
wire	ld_unc_error ;
assign	ld_unc_error = (dfq_byp_ff_data[138] & dfq_byp_ff_data[`DFQ_WIDTH-1]); // not critical !
//bug7021/ECO7022
//assign	parity_byte0_flip = dcache_wr_parity[0] ^ ld_unc_error ;
//assign	parity_byte8_flip = dcache_wr_parity[8] ^ ld_unc_error ;
   wire [15:0] parity_byte_flip;
   assign      parity_byte_flip[15:0] = dcache_wr_parity[15:0] ^ {16{ld_unc_error }};
//assign  dcache_wr_parity_mod[15:0]  =
//    lsu_diagnstc_wr_src_sel_e ?
//    ({lsu_diagnstc_dc_prty_invrt_e[7:0],lsu_diagnstc_dc_prty_invrt_e[7:0]} ^ dcache_wr_parity[15:0]) :
//    dcache_wr_parity[15:0] ;
wire  [15:0]  diagnstc_wr_parity;
assign diagnstc_wr_parity[15:0]  =  {lsu_diagnstc_dc_prty_invrt_e[7:0],lsu_diagnstc_dc_prty_invrt_e[7:0]} ^ dcache_wr_parity[15:0];
mux2ds  #(16) dcache_wr_parity_mod_mux (
              .in0(diagnstc_wr_parity[15:0]),
//              .in1({dcache_wr_parity[15:9],parity_byte8_flip,dcache_wr_parity[7:1],parity_byte0_flip}),
              .in1(parity_byte_flip[15:0]),        //bug7021/ECO7022
              .sel0(~lsu_dfq_ldst_vld),
              .sel1( lsu_dfq_ldst_vld),
              //.sel0(lsu_diagnstc_wr_src_sel_e),
              //.sel1(~lsu_diagnstc_wr_src_sel_e),
              .dout(dcache_wr_parity_mod[15:0])
);
// Bist read and write address sent thru fill_addr
//assign  lsu_dcache_fill_addr_e[10:0] =
//lsu_dc_iob_access_e ? {dcache_iob_addr_e[7:0],2'b00} :
//(lsu_bist_wvld_e | lsu_bist_rvld_e) ? {1'b0, lsu_bist_addr_e[7:0],2'b00} :  //??FIX
//  lsu_diagnstc_wr_src_sel_e ? lsu_diagnstc_wr_addr_e[10:0] :
//    lsu_dcfill_data[`DCFILL_AD_LO+10:`DCFILL_AD_LO];
//   wire [10:0] lsu_dcache_fill_addr_e;
//mux4ds  #(11) lsu_dcache_fill_addr_e_mux (
//  .in0  ({dcache_iob_addr_e[8:0],2'b00}),
//  .in1  ({mbist_dcache_index[6:0], mbist_dcache_word, 3'b00}),
//  .in2  (lsu_diagnstc_wr_addr_e[10:0]),
//  .in3  (lsu_dcfill_data[`DCFILL_AD_LO+10:`DCFILL_AD_LO]),
//  .sel0 (lsu_dcfill_mx_sel_e[0]),
//  .sel1 (lsu_dcfill_mx_sel_e[1]),
//  .sel2 (lsu_dcfill_mx_sel_e[2]),
//  .sel3 (lsu_dcfill_mx_sel_e[3]),
//  .dout (lsu_dcache_fill_addr_e[10:0])
//);
wire	[63:0] misc_fill_data_e ;
// Use smaller width mux to save area.
//assign	misc_fill_data_e[63:0] =
//lsu_dc_iob_access_e ? dcache_iob_data_e[63:0] :
//	 		{32{lsu_bist_wdata_e[1:0]}} ;
   wire [7:0] mbist_write_data_d1;
dff_s #(8) mbist_write_data_ff (
   .din (mbist_write_data[7:0]),
   .q   (mbist_write_data_d1[7:0]),
   .clk    (clk),
   .se     (1'b0),     .si (),          .so ()
);
   wire      [3:0] misc_fill_parity_e;
assign    misc_fill_parity_e[3:0] = {4{~lsu_dc_iob_access_e}} & mbist_write_data_d1[3:0];
mux2ds  #(64) misc_fill_data_e_mux (
              .in0(dcache_iob_data_e[63:0]),
              .in1({8{mbist_write_data_d1[7:0]}}),
              .sel0(lsu_dc_iob_access_e),
              .sel1(~lsu_dc_iob_access_e),
              .dout(misc_fill_data_e[63:0])
);
mux2ds  #(144) lsu_dcache_fill_data_e_mux (
               .in0({misc_fill_data_e[63:0],misc_fill_data_e[63:0],{4{misc_fill_parity_e[3:0]}}}),
               .in1({lsu_dcfill_data[`DCFILL_DA_HI:`DCFILL_DA_LO],dcache_wr_parity_mod[15:0]}),
               .sel0(lsu_dcfill_data_mx_sel_e),
               .sel1(~lsu_dcfill_data_mx_sel_e),
               .dout(lsu_dcache_fill_data_e[143:0])
);
//assign  lsu_dcache_fill_size_e[1:0] =
//(lsu_dc_iob_access_e | lsu_bist_wvld_e | lsu_diagnstc_wr_src_sel_e) ? 2'b11 :
//    lsu_dcfill_data[`DCFILL_SZ_HI:`DCFILL_SZ_LO] ;
//   wire [1:0] bist_way_e;
//assign bist_way_e[1:0] = (lsu_bist_rvld_e | lsu_bist_wvld_e) ?
//                          mbist_dcache_way[1:0] : 2'b00;
//assign  bist_rsel_way_e[0] = ~bist_way_e[1] & ~bist_way_e[0] ;
//assign  bist_rsel_way_e[1] = ~bist_way_e[1] &  bist_way_e[0] ;
//assign  bist_rsel_way_e[2] =  bist_way_e[1] & ~bist_way_e[0] ;
//assign  bist_rsel_way_e[3] =  bist_way_e[1] &  bist_way_e[0] ;
//   assign lsu_bist_rsel_way_e[3:0] = bist_rsel_way_e[3:0];
// This staging may have to go elsewhere
//always @(posedge clk)
//  begin
//    bist_rsel_way_m[3:0] <= bist_rsel_way_e[3:0] ;
//  end
//always @(posedge clk)
//  begin
//    lsu_bist_rsel_way_wb[3:0] <= bist_rsel_way_m[3:0] ;
//  end
//dff #(4) bist_rsel_way_m_ff (
//        .din    (bist_rsel_way_e[3:0]),
//        .q      (bist_rsel_way_m[3:0]),
//        .clk    (clk),
//        .se     (1'b0),       .si (),          .so ()
//        );
//dff #(4) lsu_bist_rsel_way_wb_ff (
//        .din    (bist_rsel_way_m[3:0]),
//        .q      (lsu_bist_rsel_way_wb[3:0]),
//        .clk    (clk),
//        .se     (1'b0),       .si (),          .so ()
//        );
//assign  lsu_dcache_fill_way_e[0] =
//lsu_dc_iob_access_e ? dcache_iob_wy_e[0] :
//	(lsu_bist_wvld_e | lsu_bist_rvld_e) ? bist_rsel_way_e[0] :
//  		lsu_diagnstc_wr_src_sel_e ? lsu_diagnstc_wr_way_e[0] :
//    			~lsu_dcfill_data[`DCFILL_WY_HI] & ~lsu_dcfill_data[`DCFILL_WY_LO] ;
//assign  lsu_dcache_fill_way_e[1] =
//lsu_dc_iob_access_e ? dcache_iob_wy_e[1] :
//	(lsu_bist_wvld_e | lsu_bist_rvld_e) ? bist_rsel_way_e[1] :
//  		lsu_diagnstc_wr_src_sel_e ? lsu_diagnstc_wr_way_e[1] :
//    			~lsu_dcfill_data[`DCFILL_WY_HI] &  lsu_dcfill_data[`DCFILL_WY_LO] ;
//assign  lsu_dcache_fill_way_e[2] =
//lsu_dc_iob_access_e ? dcache_iob_wy_e[2] :
//	(lsu_bist_wvld_e | lsu_bist_rvld_e) ?  bist_rsel_way_e[2] :
//  		lsu_diagnstc_wr_src_sel_e ? lsu_diagnstc_wr_way_e[2] :
//    			lsu_dcfill_data[`DCFILL_WY_HI] & ~lsu_dcfill_data[`DCFILL_WY_LO] ;
//assign  lsu_dcache_fill_way_e[3] =
//lsu_dc_iob_access_e ? dcache_iob_wy_e[3] :
//	(lsu_bist_wvld_e | lsu_bist_rvld_e) ?  bist_rsel_way_e[3] :
//  		lsu_diagnstc_wr_src_sel_e ? lsu_diagnstc_wr_way_e[3] :
//    			lsu_dcfill_data[`DCFILL_WY_HI] &  lsu_dcfill_data[`DCFILL_WY_LO] ;
/*
mux4ds  #(1) lsu_dcache_fill_way0_e_mux (
  .in0  (dcache_iob_wy_e[0]),
  .in1  (bist_rsel_way_e[0]),
  .in2  (lsu_diagnstc_wr_way_e[0]),
  .in3  (~lsu_dcfill_data[131] & ~lsu_dcfill_data[130]),
  .sel0 (lsu_dcfill_mx_sel_e[0]),
  .sel1 (lsu_dcfill_mx_sel_e[1]),
  .sel2 (lsu_dcfill_mx_sel_e[2]),
  .sel3 (lsu_dcfill_mx_sel_e[3]),
  .dout (lsu_dcache_fill_way_e[0]));
mux4ds  #(1) lsu_dcache_fill_way1_e_mux (
  .in0  (dcache_iob_wy_e[1]),
  .in1  (bist_rsel_way_e[1]),
  .in2  (lsu_diagnstc_wr_way_e[1]),
  .in3  (~lsu_dcfill_data[131] &  lsu_dcfill_data[130]),
  .sel0 (lsu_dcfill_mx_sel_e[0]),
  .sel1 (lsu_dcfill_mx_sel_e[1]),
  .sel2 (lsu_dcfill_mx_sel_e[2]),
  .sel3 (lsu_dcfill_mx_sel_e[3]),
  .dout (lsu_dcache_fill_way_e[1]));
mux4ds  #(1) lsu_dcache_fill_way2_e_mux (
  .in0  (dcache_iob_wy_e[2]),
  .in1  (bist_rsel_way_e[2]),
  .in2  (lsu_diagnstc_wr_way_e[2]),
  .in3  ( lsu_dcfill_data[131] & ~lsu_dcfill_data[130]),
  .sel0 (lsu_dcfill_mx_sel_e[0]),
  .sel1 (lsu_dcfill_mx_sel_e[1]),
  .sel2 (lsu_dcfill_mx_sel_e[2]),
  .sel3 (lsu_dcfill_mx_sel_e[3]),
  .dout (lsu_dcache_fill_way_e[2]));
mux4ds  #(1) lsu_dcache_fill_way3_e_mux (
  .in0  (dcache_iob_wy_e[3]),
  .in1  (bist_rsel_way_e[3]),
  .in2  (lsu_diagnstc_wr_way_e[3]),
  .in3  ( lsu_dcfill_data[131] &  lsu_dcfill_data[130]),
  .sel0 (lsu_dcfill_mx_sel_e[0]),
  .sel1 (lsu_dcfill_mx_sel_e[1]),
  .sel2 (lsu_dcfill_mx_sel_e[2]),
  .sel3 (lsu_dcfill_mx_sel_e[3]),
  .dout (lsu_dcache_fill_way_e[3]));
*/
//   assign lsu_dcache_fill_way_enc_e[0] =  lsu_dcache_fill_way_e[1] |  lsu_dcache_fill_way_e[3];
//   assign lsu_dcache_fill_way_enc_e[1] =  lsu_dcache_fill_way_e[2] |  lsu_dcache_fill_way_e[3];
wire [63:0] l2fill_data_e;
mux2ds        #(64) half_sel (
      .in0    (lsu_dcfill_data[`DCFILL_DA_HI:`DCFILL_DA_LO+64]),
      .in1    (lsu_dcfill_data[`DCFILL_DA_LO+63:`DCFILL_DA_LO]),
      .sel0   (lsu_dfill_data_sel_hi),  .sel1 (~lsu_dfill_data_sel_hi),
      .dout   (l2fill_data_e[63:0])
);
dff_s #(64) stgm_l2fd (
        .din    (l2fill_data_e[63:0]),
        .q      (lsu_l2fill_data[63:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
endmodule