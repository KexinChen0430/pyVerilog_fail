module top_2core2dr(
  /* verilator lint_off UNUSED */
  /* verilator lint_off UNDRIVEN */
   input clk
  ,input reset
   // icache core 0
  ,input                      core0_coretoic_pc_valid
  ,output                     core0_coretoic_pc_retry
  ,input  I_coretoic_pc_type  core0_coretoic_pc
  ,output                      core0_ictocore_valid
  ,input                       core0_ictocore_retry
  ,output I_ictocore_type      core0_ictocore
   // dcache core 0, slice 0
  ,input                           core0_slice0_coretodc_ld_valid
  ,output                          core0_slice0_coretodc_ld_retry
  ,input   I_coretodc_ld_type      core0_slice0_coretodc_ld
  ,output                          core0_slice0_dctocore_ld_valid
  ,input                           core0_slice0_dctocore_ld_retry
  ,output  I_dctocore_ld_type      core0_slice0_dctocore_ld
  ,input                           core0_slice0_coretodc_std_valid
  ,output                          core0_slice0_coretodc_std_retry
  ,input   I_coretodc_std_type     core0_slice0_coretodc_std
  ,output                          core0_slice0_dctocore_std_ack_valid
  ,input                           core0_slice0_dctocore_std_ack_retry
  ,output  I_dctocore_std_ack_type core0_slice0_dctocore_std_ack
    ,input                         c0_s0_coretodctlb_ld_valid
    ,output                        c0_s0_coretodctlb_ld_retry
    ,input   I_coretodctlb_ld_type c0_s0_coretodctlb_ld
    ,input                         c0_s0_coretodctlb_st_valid
    ,output                        c0_s0_coretodctlb_st_retry
    ,input   I_coretodctlb_st_type c0_s0_coretodctlb_st
   // dcache core 0, slice 1
  ,input                           core0_slice1_coretodc_ld_valid
  ,output                          core0_slice1_coretodc_ld_retry
  ,input   I_coretodc_ld_type      core0_slice1_coretodc_ld
  ,output                          core0_slice1_dctocore_ld_valid
  ,input                           core0_slice1_dctocore_ld_retry
  ,output  I_dctocore_ld_type      core0_slice1_dctocore_ld
  ,input                           core0_slice1_coretodc_std_valid
  ,output                          core0_slice1_coretodc_std_retry
  ,input   I_coretodc_std_type     core0_slice1_coretodc_std
  ,output                          core0_slice1_dctocore_std_ack_valid
  ,input                           core0_slice1_dctocore_std_ack_retry
  ,output  I_dctocore_std_ack_type core0_slice1_dctocore_std_ack
    ,input                         c0_s1_coretodctlb_ld_valid
    ,output                        c0_s1_coretodctlb_ld_retry
    ,input   I_coretodctlb_ld_type c0_s1_coretodctlb_ld
    ,input                         c0_s1_coretodctlb_st_valid
    ,output                        c0_s1_coretodctlb_st_retry
    ,input   I_coretodctlb_st_type c0_s1_coretodctlb_st
`ifdef SC_4PIPE
   // dcache core 0, slice 2
  ,input                           core0_slice2_coretodc_ld_valid
  ,output                          core0_slice2_coretodc_ld_retry
  ,input   I_coretodc_ld_type      core0_slice2_coretodc_ld
  ,output                          core0_slice2_dctocore_ld_valid
  ,input                           core0_slice2_dctocore_ld_retry
  ,output  I_dctocore_ld_type      core0_slice2_dctocore_ld
  ,input                           core0_slice2_coretodc_std_valid
  ,output                          core0_slice2_coretodc_std_retry
  ,input   I_coretodc_std_type     core0_slice2_coretodc_std
  ,output                          core0_slice2_dctocore_std_ack_valid
  ,input                           core0_slice2_dctocore_std_ack_retry
  ,output  I_dctocore_std_ack_type core0_slice2_dctocore_std_ack
    ,input                         c0_s2_coretodctlb_ld_valid
    ,output                        c0_s2_coretodctlb_ld_retry
    ,input   I_coretodctlb_ld_type c0_s2_coretodctlb_ld
    ,input                         c0_s2_coretodctlb_st_valid
    ,output                        c0_s2_coretodctlb_st_retry
    ,input   I_coretodctlb_st_type c0_s2_coretodctlb_st
   // dcache core 0, slice 3
  ,input                           core0_slice3_coretodc_ld_valid
  ,output                          core0_slice3_coretodc_ld_retry
  ,input   I_coretodc_ld_type      core0_slice3_coretodc_ld
  ,output                          core0_slice3_dctocore_ld_valid
  ,input                           core0_slice3_dctocore_ld_retry
  ,output  I_dctocore_ld_type      core0_slice3_dctocore_ld
  ,input                           core0_slice3_coretodc_std_valid
  ,output                          core0_slice3_coretodc_std_retry
  ,input   I_coretodc_std_type     core0_slice3_coretodc_std
  ,output                          core0_slice3_dctocore_std_ack_valid
  ,input                           core0_slice3_dctocore_std_ack_retry
  ,output  I_dctocore_std_ack_type core0_slice3_dctocore_std_ack
    ,input                         c0_s3_coretodctlb_ld_valid
    ,output                        c0_s3_coretodctlb_ld_retry
    ,input   I_coretodctlb_ld_type c0_s3_coretodctlb_ld
    ,input                         c0_s3_coretodctlb_st_valid
    ,output                        c0_s3_coretodctlb_st_retry
    ,input   I_coretodctlb_st_type c0_s3_coretodctlb_st
`endif
    // core 0 prefetch
  ,input  logic                core0_pfgtopfe_op_valid
  ,output logic                core0_pfgtopfe_op_retry
  ,input  I_pfgtopfe_op_type   core0_pfgtopfe_op
   // icache core 1
  ,input                      core1_coretoic_pc_valid
  ,output                     core1_coretoic_pc_retry
  ,input  I_coretoic_pc_type  core1_coretoic_pc
  ,output                      core1_ictocore_valid
  ,input                       core1_ictocore_retry
  ,output I_ictocore_type      core1_ictocore
   // dcache core 1, slice 0
  ,input                           core1_slice0_coretodc_ld_valid
  ,output                          core1_slice0_coretodc_ld_retry
  ,input   I_coretodc_ld_type      core1_slice0_coretodc_ld
  ,output                          core1_slice0_dctocore_ld_valid
  ,input                           core1_slice0_dctocore_ld_retry
  ,output  I_dctocore_ld_type      core1_slice0_dctocore_ld
  ,input                           core1_slice0_coretodc_std_valid
  ,output                          core1_slice0_coretodc_std_retry
  ,input   I_coretodc_std_type     core1_slice0_coretodc_std
  ,output                          core1_slice0_dctocore_std_ack_valid
  ,input                           core1_slice0_dctocore_std_ack_retry
  ,output  I_dctocore_std_ack_type core1_slice0_dctocore_std_ack
    ,input                         c1_s0_coretodctlb_ld_valid
    ,output                        c1_s0_coretodctlb_ld_retry
    ,input   I_coretodctlb_ld_type c1_s0_coretodctlb_ld
    ,input                         c1_s0_coretodctlb_st_valid
    ,output                        c1_s0_coretodctlb_st_retry
    ,input   I_coretodctlb_st_type c1_s0_coretodctlb_st
   // dcache core 1, slice 1
  ,input                           core1_slice1_coretodc_ld_valid
  ,output                          core1_slice1_coretodc_ld_retry
  ,input   I_coretodc_ld_type      core1_slice1_coretodc_ld
  ,output                          core1_slice1_dctocore_ld_valid
  ,input                           core1_slice1_dctocore_ld_retry
  ,output  I_dctocore_ld_type      core1_slice1_dctocore_ld
  ,input                           core1_slice1_coretodc_std_valid
  ,output                          core1_slice1_coretodc_std_retry
  ,input   I_coretodc_std_type     core1_slice1_coretodc_std
  ,output                          core1_slice1_dctocore_std_ack_valid
  ,input                           core1_slice1_dctocore_std_ack_retry
  ,output  I_dctocore_std_ack_type core1_slice1_dctocore_std_ack
    ,input                         c1_s1_coretodctlb_ld_valid
    ,output                        c1_s1_coretodctlb_ld_retry
    ,input   I_coretodctlb_ld_type c1_s1_coretodctlb_ld
    ,input                         c1_s1_coretodctlb_st_valid
    ,output                        c1_s1_coretodctlb_st_retry
    ,input   I_coretodctlb_st_type c1_s1_coretodctlb_st
`ifdef SC_4PIPE
   // dcache core 1, slice 2
  ,input                           core1_slice2_coretodc_ld_valid
  ,output                          core1_slice2_coretodc_ld_retry
  ,input   I_coretodc_ld_type      core1_slice2_coretodc_ld
  ,output                          core1_slice2_dctocore_ld_valid
  ,input                           core1_slice2_dctocore_ld_retry
  ,output  I_dctocore_ld_type      core1_slice2_dctocore_ld
  ,input                           core1_slice2_coretodc_std_valid
  ,output                          core1_slice2_coretodc_std_retry
  ,input   I_coretodc_std_type     core1_slice2_coretodc_std
  ,output                          core1_slice2_dctocore_std_ack_valid
  ,input                           core1_slice2_dctocore_std_ack_retry
  ,output  I_dctocore_std_ack_type core1_slice2_dctocore_std_ack
    ,input                         c1_s2_coretodctlb_ld_valid
    ,output                        c1_s2_coretodctlb_ld_retry
    ,input   I_coretodctlb_ld_type c1_s2_coretodctlb_ld
    ,input                         c1_s2_coretodctlb_st_valid
    ,output                        c1_s2_coretodctlb_st_retry
    ,input   I_coretodctlb_st_type c1_s2_coretodctlb_st
   // dcache core 1, slice 3
  ,input                           core1_slice3_coretodc_ld_valid
  ,output                          core1_slice3_coretodc_ld_retry
  ,input   I_coretodc_ld_type      core1_slice3_coretodc_ld
  ,output                          core1_slice3_dctocore_ld_valid
  ,input                           core1_slice3_dctocore_ld_retry
  ,output  I_dctocore_ld_type      core1_slice3_dctocore_ld
  ,input                           core1_slice3_coretodc_std_valid
  ,output                          core1_slice3_coretodc_std_retry
  ,input   I_coretodc_std_type     core1_slice3_coretodc_std
  ,output                          core1_slice3_dctocore_std_ack_valid
  ,input                           core1_slice3_dctocore_std_ack_retry
  ,output  I_dctocore_std_ack_type core1_slice3_dctocore_std_ack
    ,input                         c1_s3_coretodctlb_ld_valid
    ,output                        c1_s3_coretodctlb_ld_retry
    ,input   I_coretodctlb_ld_type c1_s3_coretodctlb_ld
    ,input                         c1_s3_coretodctlb_st_valid
    ,output                        c1_s3_coretodctlb_st_retry
    ,input   I_coretodctlb_st_type c1_s3_coretodctlb_st
`endif
    // core 1 prefetch
  ,input  logic                core1_pfgtopfe_op_valid
  ,output logic                core1_pfgtopfe_op_retry
  ,input  I_pfgtopfe_op_type   core1_pfgtopfe_op
  ,output                       dr0_drtomem_req_valid
  ,input                        dr0_drtomem_req_retry
  ,output  I_drtomem_req_type   dr0_drtomem_req
  ,input                        dr0_memtodr_ack_valid
  ,output                       dr0_memtodr_ack_retry
  ,input   I_memtodr_ack_type   dr0_memtodr_ack
  ,output                       dr0_drtomem_wb_valid
  ,input                        dr0_drtomem_wb_retry
  ,output  I_drtomem_wb_type    dr0_drtomem_wb
  ,output  logic                dr0_drtomem_pfreq_valid
  ,input   logic                dr0_drtomem_pfreq_retry
  ,output  I_drtomem_pfreq_type dr0_drtomem_pfreq
  ,output                       dr1_drtomem_req_valid
  ,input                        dr1_drtomem_req_retry
  ,output  I_drtomem_req_type   dr1_drtomem_req
  ,input                        dr1_memtodr_ack_valid
  ,output                       dr1_memtodr_ack_retry
  ,input   I_memtodr_ack_type   dr1_memtodr_ack
  ,output                       dr1_drtomem_wb_valid
  ,input                        dr1_drtomem_wb_retry
  ,output  I_drtomem_wb_type    dr1_drtomem_wb
  ,output  logic                dr1_drtomem_pfreq_valid
  ,input   logic                dr1_drtomem_pfreq_retry
  ,output  I_drtomem_pfreq_type dr1_drtomem_pfreq
);
  wire core0_slice0_l1tol2_req_valid      ;
  wire core0_slice0_l1tol2_req_retry      ;
   I_l1tol2_req_type       core0_slice0_l1tol2_req            ;
  wire core0_slice0_l2tol1_snack_valid    ;
  wire core0_slice0_l2tol1_snack_retry    ;
   I_l2tol1_snack_type     core0_slice0_l2tol1_snack          ;
  wire core0_slice0_l1tol2_snoop_ack_valid;
  wire core0_slice0_l1tol2_snoop_ack_retry;
   I_l2snoop_ack_type      core0_slice0_l1tol2_snoop_ack      ;
  wire core0_slice0_l1tol2_disp_valid     ;
  wire core0_slice0_l1tol2_disp_retry     ;
   I_l1tol2_disp_type      core0_slice0_l1tol2_disp           ;
  wire core0_slice0_l2tol1_dack_valid     ;
  wire core0_slice0_l2tol1_dack_retry     ;
   I_l2tol1_dack_type      core0_slice0_l2tol1_dack           ;
  PF_cache_stats_type     core0_slice0_pf0_dcstats      ;
  wire core0_slice0_l1tol2tlb_req_valid;
  wire core0_slice0_l1tol2tlb_req_retry;
  I_l1tol2tlb_req_type core0_slice0_l1tol2tlb_req      ;
  dcache_pipe core0_slice0_dcache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core0_slice0_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core0_slice0_l1tol2_req_retry      )
    ,.l1tol2_req            (core0_slice0_l1tol2_req            )
    ,.l2tol1_snack_valid    (core0_slice0_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core0_slice0_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core0_slice0_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core0_slice0_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core0_slice0_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core0_slice0_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core0_slice0_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core0_slice0_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core0_slice0_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core0_slice0_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core0_slice0_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core0_slice0_l2tol1_dack           )
    ,.l1tol2tlb_req_valid(core0_slice0_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core0_slice0_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core0_slice0_l1tol2tlb_req      )
    ,.coretodc_ld_valid     (core0_slice0_coretodc_ld_valid     )
    ,.coretodc_ld_retry     (core0_slice0_coretodc_ld_retry     )
    ,.coretodc_ld           (core0_slice0_coretodc_ld           )
    ,.dctocore_ld_valid     (core0_slice0_dctocore_ld_valid     )
    ,.dctocore_ld_retry     (core0_slice0_dctocore_ld_retry     )
    ,.dctocore_ld           (core0_slice0_dctocore_ld           )
    ,.coretodc_std_valid    (core0_slice0_coretodc_std_valid    )
    ,.coretodc_std_retry    (core0_slice0_coretodc_std_retry    )
    ,.coretodc_std          (core0_slice0_coretodc_std          )
    ,.dctocore_std_ack_valid(core0_slice0_dctocore_std_ack_valid)
    ,.dctocore_std_ack_retry(core0_slice0_dctocore_std_ack_retry)
    ,.dctocore_std_ack      (core0_slice0_dctocore_std_ack      )
    ,.cachetopf_stats       (core0_slice0_pf0_dcstats      )
    ,.l1tlbtol1_fwd0_valid(core0_slice0_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core0_slice0_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core0_slice0_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core0_slice0_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core0_slice0_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core0_slice0_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core0_slice0_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core0_slice0_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core0_slice0_l1tlbtol1_cmd       )
  );
  wire core0_slice0_l1tlbtol1_fwd0_valid;
  wire core0_slice0_l1tlbtol1_fwd0_retry;
  I_l1tlbtol1_fwd_type core0_slice0_l1tlbtol1_fwd0      ;
  wire core0_slice0_l1tlbtol1_fwd1_valid;
  wire core0_slice0_l1tlbtol1_fwd1_retry;
  I_l1tlbtol1_fwd_type core0_slice0_l1tlbtol1_fwd1      ;
  wire core0_slice0_l1tlbtol1_cmd_valid ;
  wire core0_slice0_l1tlbtol1_cmd_retry ;
  I_l1tlbtol1_cmd_type core0_slice0_l1tlbtol1_cmd       ;
  wire core0_slice0_l2tlbtol1tlb_snoop_valid;
  wire core0_slice0_l2tlbtol1tlb_snoop_retry;
  I_l2tlbtol1tlb_snoop_type core0_slice0_l2tlbtol1tlb_snoop      ;
  wire core0_slice0_l2tlbtol1tlb_ack_valid  ;
  wire core0_slice0_l2tlbtol1tlb_ack_retry  ;
  I_l2tlbtol1tlb_ack_type   core0_slice0_l2tlbtol1tlb_ack        ;
  wire core0_slice0_l1tlbtol2tlb_req_valid  ;
  wire core0_slice0_l1tlbtol2tlb_req_retry  ;
   I_l1tlbtol2tlb_req_type  core0_slice0_l1tlbtol2tlb_req        ;
  wire core0_slice0_l1tlbtol2tlb_sack_valid ;
  wire core0_slice0_l1tlbtol2tlb_sack_retry ;
   I_l1tlbtol2tlb_sack_type core0_slice0_l1tlbtol2tlb_sack       ;
  wire core0_slice0_pftodc_req0_valid;
  wire core0_slice0_pftodc_req0_retry;
  I_pfetol1tlb_req_type    core0_slice0_pftodc_req0      ;
  dctlb dcltb_c0s0(
     .clk(clk)
    ,.reset(reset)
    ,.coretodctlb_ld_valid(c0_s0_coretodctlb_ld_valid)
    ,.coretodctlb_ld_retry(c0_s0_coretodctlb_ld_retry)
    ,.coretodctlb_ld      (c0_s0_coretodctlb_ld      )
    ,.coretodctlb_st_valid(c0_s0_coretodctlb_st_valid)
    ,.coretodctlb_st_retry(c0_s0_coretodctlb_st_retry)
    ,.coretodctlb_st      (c0_s0_coretodctlb_st      )
    ,.pfetol1tlb_req_valid   (core0_slice0_pftodc_req0_valid)
    ,.pfetol1tlb_req_retry   (core0_slice0_pftodc_req0_retry)
    ,.pfetol1tlb_req         (core0_slice0_pftodc_req0      )
    ,.l1tlbtol1_fwd0_valid(core0_slice0_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core0_slice0_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core0_slice0_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core0_slice0_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core0_slice0_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core0_slice0_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core0_slice0_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core0_slice0_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core0_slice0_l1tlbtol1_cmd       )
    ,.l2tlbtol1tlb_snoop_valid(core0_slice0_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core0_slice0_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core0_slice0_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core0_slice0_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core0_slice0_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core0_slice0_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core0_slice0_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core0_slice0_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core0_slice0_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core0_slice0_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core0_slice0_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core0_slice0_l1tlbtol2tlb_sack       )
  );
  wire core0_slice1_l1tol2_req_valid      ;
  wire core0_slice1_l1tol2_req_retry      ;
   I_l1tol2_req_type       core0_slice1_l1tol2_req            ;
  wire core0_slice1_l2tol1_snack_valid    ;
  wire core0_slice1_l2tol1_snack_retry    ;
   I_l2tol1_snack_type     core0_slice1_l2tol1_snack          ;
  wire core0_slice1_l1tol2_snoop_ack_valid;
  wire core0_slice1_l1tol2_snoop_ack_retry;
   I_l2snoop_ack_type      core0_slice1_l1tol2_snoop_ack      ;
  wire core0_slice1_l1tol2_disp_valid     ;
  wire core0_slice1_l1tol2_disp_retry     ;
   I_l1tol2_disp_type      core0_slice1_l1tol2_disp           ;
  wire core0_slice1_l2tol1_dack_valid     ;
  wire core0_slice1_l2tol1_dack_retry     ;
   I_l2tol1_dack_type      core0_slice1_l2tol1_dack           ;
  PF_cache_stats_type     core0_slice1_pf1_dcstats      ;
  wire core0_slice1_l1tol2tlb_req_valid;
  wire core0_slice1_l1tol2tlb_req_retry;
  I_l1tol2tlb_req_type core0_slice1_l1tol2tlb_req      ;
  dcache_pipe core0_slice1_dcache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core0_slice1_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core0_slice1_l1tol2_req_retry      )
    ,.l1tol2_req            (core0_slice1_l1tol2_req            )
    ,.l2tol1_snack_valid    (core0_slice1_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core0_slice1_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core0_slice1_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core0_slice1_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core0_slice1_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core0_slice1_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core0_slice1_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core0_slice1_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core0_slice1_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core0_slice1_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core0_slice1_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core0_slice1_l2tol1_dack           )
    ,.l1tol2tlb_req_valid(core0_slice1_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core0_slice1_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core0_slice1_l1tol2tlb_req      )
    ,.coretodc_ld_valid     (core0_slice1_coretodc_ld_valid     )
    ,.coretodc_ld_retry     (core0_slice1_coretodc_ld_retry     )
    ,.coretodc_ld           (core0_slice1_coretodc_ld           )
    ,.dctocore_ld_valid     (core0_slice1_dctocore_ld_valid     )
    ,.dctocore_ld_retry     (core0_slice1_dctocore_ld_retry     )
    ,.dctocore_ld           (core0_slice1_dctocore_ld           )
    ,.coretodc_std_valid    (core0_slice1_coretodc_std_valid    )
    ,.coretodc_std_retry    (core0_slice1_coretodc_std_retry    )
    ,.coretodc_std          (core0_slice1_coretodc_std          )
    ,.dctocore_std_ack_valid(core0_slice1_dctocore_std_ack_valid)
    ,.dctocore_std_ack_retry(core0_slice1_dctocore_std_ack_retry)
    ,.dctocore_std_ack      (core0_slice1_dctocore_std_ack      )
    ,.cachetopf_stats       (core0_slice1_pf1_dcstats      )
    ,.l1tlbtol1_fwd0_valid(core0_slice1_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core0_slice1_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core0_slice1_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core0_slice1_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core0_slice1_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core0_slice1_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core0_slice1_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core0_slice1_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core0_slice1_l1tlbtol1_cmd       )
  );
  wire core0_slice1_l1tlbtol1_fwd0_valid;
  wire core0_slice1_l1tlbtol1_fwd0_retry;
  I_l1tlbtol1_fwd_type core0_slice1_l1tlbtol1_fwd0      ;
  wire core0_slice1_l1tlbtol1_fwd1_valid;
  wire core0_slice1_l1tlbtol1_fwd1_retry;
  I_l1tlbtol1_fwd_type core0_slice1_l1tlbtol1_fwd1      ;
  wire core0_slice1_l1tlbtol1_cmd_valid ;
  wire core0_slice1_l1tlbtol1_cmd_retry ;
  I_l1tlbtol1_cmd_type core0_slice1_l1tlbtol1_cmd       ;
  wire core0_slice1_l2tlbtol1tlb_snoop_valid;
  wire core0_slice1_l2tlbtol1tlb_snoop_retry;
  I_l2tlbtol1tlb_snoop_type core0_slice1_l2tlbtol1tlb_snoop      ;
  wire core0_slice1_l2tlbtol1tlb_ack_valid  ;
  wire core0_slice1_l2tlbtol1tlb_ack_retry  ;
  I_l2tlbtol1tlb_ack_type   core0_slice1_l2tlbtol1tlb_ack        ;
  wire core0_slice1_l1tlbtol2tlb_req_valid  ;
  wire core0_slice1_l1tlbtol2tlb_req_retry  ;
   I_l1tlbtol2tlb_req_type  core0_slice1_l1tlbtol2tlb_req        ;
  wire core0_slice1_l1tlbtol2tlb_sack_valid ;
  wire core0_slice1_l1tlbtol2tlb_sack_retry ;
   I_l1tlbtol2tlb_sack_type core0_slice1_l1tlbtol2tlb_sack       ;
  wire core0_slice1_pftodc_req1_valid;
  wire core0_slice1_pftodc_req1_retry;
  I_pfetol1tlb_req_type    core0_slice1_pftodc_req1      ;
  dctlb dcltb_c0s1(
     .clk(clk)
    ,.reset(reset)
    ,.coretodctlb_ld_valid(c0_s1_coretodctlb_ld_valid)
    ,.coretodctlb_ld_retry(c0_s1_coretodctlb_ld_retry)
    ,.coretodctlb_ld      (c0_s1_coretodctlb_ld      )
    ,.coretodctlb_st_valid(c0_s1_coretodctlb_st_valid)
    ,.coretodctlb_st_retry(c0_s1_coretodctlb_st_retry)
    ,.coretodctlb_st      (c0_s1_coretodctlb_st      )
    ,.pfetol1tlb_req_valid   (core0_slice1_pftodc_req1_valid)
    ,.pfetol1tlb_req_retry   (core0_slice1_pftodc_req1_retry)
    ,.pfetol1tlb_req         (core0_slice1_pftodc_req1      )
    ,.l1tlbtol1_fwd0_valid(core0_slice1_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core0_slice1_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core0_slice1_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core0_slice1_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core0_slice1_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core0_slice1_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core0_slice1_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core0_slice1_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core0_slice1_l1tlbtol1_cmd       )
    ,.l2tlbtol1tlb_snoop_valid(core0_slice1_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core0_slice1_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core0_slice1_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core0_slice1_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core0_slice1_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core0_slice1_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core0_slice1_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core0_slice1_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core0_slice1_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core0_slice1_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core0_slice1_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core0_slice1_l1tlbtol2tlb_sack       )
  );
`ifdef SC_4PIPE
  wire core0_slice2_l1tol2_req_valid      ;
  wire core0_slice2_l1tol2_req_retry      ;
   I_l1tol2_req_type       core0_slice2_l1tol2_req            ;
  wire core0_slice2_l2tol1_snack_valid    ;
  wire core0_slice2_l2tol1_snack_retry    ;
   I_l2tol1_snack_type     core0_slice2_l2tol1_snack          ;
  wire core0_slice2_l1tol2_snoop_ack_valid;
  wire core0_slice2_l1tol2_snoop_ack_retry;
   I_l2snoop_ack_type      core0_slice2_l1tol2_snoop_ack      ;
  wire core0_slice2_l1tol2_disp_valid     ;
  wire core0_slice2_l1tol2_disp_retry     ;
   I_l1tol2_disp_type      core0_slice2_l1tol2_disp           ;
  wire core0_slice2_l2tol1_dack_valid     ;
  wire core0_slice2_l2tol1_dack_retry     ;
   I_l2tol1_dack_type      core0_slice2_l2tol1_dack           ;
  PF_cache_stats_type     core0_slice2_pf2_dcstats      ;
  wire core0_slice2_l1tol2tlb_req_valid;
  wire core0_slice2_l1tol2tlb_req_retry;
  I_l1tol2tlb_req_type core0_slice2_l1tol2tlb_req      ;
  dcache_pipe core0_slice2_dcache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core0_slice2_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core0_slice2_l1tol2_req_retry      )
    ,.l1tol2_req            (core0_slice2_l1tol2_req            )
    ,.l2tol1_snack_valid    (core0_slice2_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core0_slice2_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core0_slice2_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core0_slice2_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core0_slice2_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core0_slice2_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core0_slice2_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core0_slice2_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core0_slice2_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core0_slice2_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core0_slice2_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core0_slice2_l2tol1_dack           )
    ,.l1tol2tlb_req_valid(core0_slice2_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core0_slice2_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core0_slice2_l1tol2tlb_req      )
    ,.coretodc_ld_valid     (core0_slice2_coretodc_ld_valid     )
    ,.coretodc_ld_retry     (core0_slice2_coretodc_ld_retry     )
    ,.coretodc_ld           (core0_slice2_coretodc_ld           )
    ,.dctocore_ld_valid     (core0_slice2_dctocore_ld_valid     )
    ,.dctocore_ld_retry     (core0_slice2_dctocore_ld_retry     )
    ,.dctocore_ld           (core0_slice2_dctocore_ld           )
    ,.coretodc_std_valid    (core0_slice2_coretodc_std_valid    )
    ,.coretodc_std_retry    (core0_slice2_coretodc_std_retry    )
    ,.coretodc_std          (core0_slice2_coretodc_std          )
    ,.dctocore_std_ack_valid(core0_slice2_dctocore_std_ack_valid)
    ,.dctocore_std_ack_retry(core0_slice2_dctocore_std_ack_retry)
    ,.dctocore_std_ack      (core0_slice2_dctocore_std_ack      )
    ,.cachetopf_stats       (core0_slice2_pf2_dcstats      )
    ,.l1tlbtol1_fwd0_valid(core0_slice2_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core0_slice2_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core0_slice2_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core0_slice2_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core0_slice2_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core0_slice2_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core0_slice2_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core0_slice2_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core0_slice2_l1tlbtol1_cmd       )
  );
  wire core0_slice2_l1tlbtol1_fwd0_valid;
  wire core0_slice2_l1tlbtol1_fwd0_retry;
  I_l1tlbtol1_fwd_type core0_slice2_l1tlbtol1_fwd0      ;
  wire core0_slice2_l1tlbtol1_fwd1_valid;
  wire core0_slice2_l1tlbtol1_fwd1_retry;
  I_l1tlbtol1_fwd_type core0_slice2_l1tlbtol1_fwd1      ;
  wire core0_slice2_l1tlbtol1_cmd_valid ;
  wire core0_slice2_l1tlbtol1_cmd_retry ;
  I_l1tlbtol1_cmd_type core0_slice2_l1tlbtol1_cmd       ;
  wire core0_slice2_l2tlbtol1tlb_snoop_valid;
  wire core0_slice2_l2tlbtol1tlb_snoop_retry;
  I_l2tlbtol1tlb_snoop_type core0_slice2_l2tlbtol1tlb_snoop      ;
  wire core0_slice2_l2tlbtol1tlb_ack_valid  ;
  wire core0_slice2_l2tlbtol1tlb_ack_retry  ;
  I_l2tlbtol1tlb_ack_type   core0_slice2_l2tlbtol1tlb_ack        ;
  wire core0_slice2_l1tlbtol2tlb_req_valid  ;
  wire core0_slice2_l1tlbtol2tlb_req_retry  ;
   I_l1tlbtol2tlb_req_type  core0_slice2_l1tlbtol2tlb_req        ;
  wire core0_slice2_l1tlbtol2tlb_sack_valid ;
  wire core0_slice2_l1tlbtol2tlb_sack_retry ;
   I_l1tlbtol2tlb_sack_type core0_slice2_l1tlbtol2tlb_sack       ;
  wire core0_slice2_pftodc_req2_valid;
  wire core0_slice2_pftodc_req2_retry;
  I_pfetol1tlb_req_type    core0_slice2_pftodc_req2      ;
  dctlb dcltb_c0s2(
     .clk(clk)
    ,.reset(reset)
    ,.coretodctlb_ld_valid(c0_s2_coretodctlb_ld_valid)
    ,.coretodctlb_ld_retry(c0_s2_coretodctlb_ld_retry)
    ,.coretodctlb_ld      (c0_s2_coretodctlb_ld      )
    ,.coretodctlb_st_valid(c0_s2_coretodctlb_st_valid)
    ,.coretodctlb_st_retry(c0_s2_coretodctlb_st_retry)
    ,.coretodctlb_st      (c0_s2_coretodctlb_st      )
    ,.pfetol1tlb_req_valid   (core0_slice2_pftodc_req2_valid)
    ,.pfetol1tlb_req_retry   (core0_slice2_pftodc_req2_retry)
    ,.pfetol1tlb_req         (core0_slice2_pftodc_req2      )
    ,.l1tlbtol1_fwd0_valid(core0_slice2_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core0_slice2_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core0_slice2_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core0_slice2_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core0_slice2_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core0_slice2_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core0_slice2_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core0_slice2_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core0_slice2_l1tlbtol1_cmd       )
    ,.l2tlbtol1tlb_snoop_valid(core0_slice2_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core0_slice2_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core0_slice2_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core0_slice2_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core0_slice2_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core0_slice2_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core0_slice2_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core0_slice2_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core0_slice2_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core0_slice2_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core0_slice2_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core0_slice2_l1tlbtol2tlb_sack       )
  );
  wire core0_slice3_l1tol2_req_valid      ;
  wire core0_slice3_l1tol2_req_retry      ;
   I_l1tol2_req_type       core0_slice3_l1tol2_req            ;
  wire core0_slice3_l2tol1_snack_valid    ;
  wire core0_slice3_l2tol1_snack_retry    ;
   I_l2tol1_snack_type     core0_slice3_l2tol1_snack          ;
  wire core0_slice3_l1tol2_snoop_ack_valid;
  wire core0_slice3_l1tol2_snoop_ack_retry;
   I_l2snoop_ack_type      core0_slice3_l1tol2_snoop_ack      ;
  wire core0_slice3_l1tol2_disp_valid     ;
  wire core0_slice3_l1tol2_disp_retry     ;
   I_l1tol2_disp_type      core0_slice3_l1tol2_disp           ;
  wire core0_slice3_l2tol1_dack_valid     ;
  wire core0_slice3_l2tol1_dack_retry     ;
   I_l2tol1_dack_type      core0_slice3_l2tol1_dack           ;
  PF_cache_stats_type     core0_slice3_pf3_dcstats      ;
  wire core0_slice3_l1tol2tlb_req_valid;
  wire core0_slice3_l1tol2tlb_req_retry;
  I_l1tol2tlb_req_type core0_slice3_l1tol2tlb_req      ;
  dcache_pipe core0_slice3_dcache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core0_slice3_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core0_slice3_l1tol2_req_retry      )
    ,.l1tol2_req            (core0_slice3_l1tol2_req            )
    ,.l2tol1_snack_valid    (core0_slice3_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core0_slice3_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core0_slice3_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core0_slice3_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core0_slice3_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core0_slice3_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core0_slice3_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core0_slice3_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core0_slice3_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core0_slice3_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core0_slice3_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core0_slice3_l2tol1_dack           )
    ,.l1tol2tlb_req_valid(core0_slice3_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core0_slice3_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core0_slice3_l1tol2tlb_req      )
    ,.coretodc_ld_valid     (core0_slice3_coretodc_ld_valid     )
    ,.coretodc_ld_retry     (core0_slice3_coretodc_ld_retry     )
    ,.coretodc_ld           (core0_slice3_coretodc_ld           )
    ,.dctocore_ld_valid     (core0_slice3_dctocore_ld_valid     )
    ,.dctocore_ld_retry     (core0_slice3_dctocore_ld_retry     )
    ,.dctocore_ld           (core0_slice3_dctocore_ld           )
    ,.coretodc_std_valid    (core0_slice3_coretodc_std_valid    )
    ,.coretodc_std_retry    (core0_slice3_coretodc_std_retry    )
    ,.coretodc_std          (core0_slice3_coretodc_std          )
    ,.dctocore_std_ack_valid(core0_slice3_dctocore_std_ack_valid)
    ,.dctocore_std_ack_retry(core0_slice3_dctocore_std_ack_retry)
    ,.dctocore_std_ack      (core0_slice3_dctocore_std_ack      )
    ,.cachetopf_stats       (core0_slice3_pf3_dcstats      )
    ,.l1tlbtol1_fwd0_valid(core0_slice3_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core0_slice3_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core0_slice3_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core0_slice3_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core0_slice3_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core0_slice3_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core0_slice3_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core0_slice3_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core0_slice3_l1tlbtol1_cmd       )
  );
  wire core0_slice3_l1tlbtol1_fwd0_valid;
  wire core0_slice3_l1tlbtol1_fwd0_retry;
  I_l1tlbtol1_fwd_type core0_slice3_l1tlbtol1_fwd0      ;
  wire core0_slice3_l1tlbtol1_fwd1_valid;
  wire core0_slice3_l1tlbtol1_fwd1_retry;
  I_l1tlbtol1_fwd_type core0_slice3_l1tlbtol1_fwd1      ;
  wire core0_slice3_l1tlbtol1_cmd_valid ;
  wire core0_slice3_l1tlbtol1_cmd_retry ;
  I_l1tlbtol1_cmd_type core0_slice3_l1tlbtol1_cmd       ;
  wire core0_slice3_l2tlbtol1tlb_snoop_valid;
  wire core0_slice3_l2tlbtol1tlb_snoop_retry;
  I_l2tlbtol1tlb_snoop_type core0_slice3_l2tlbtol1tlb_snoop      ;
  wire core0_slice3_l2tlbtol1tlb_ack_valid  ;
  wire core0_slice3_l2tlbtol1tlb_ack_retry  ;
  I_l2tlbtol1tlb_ack_type   core0_slice3_l2tlbtol1tlb_ack        ;
  wire core0_slice3_l1tlbtol2tlb_req_valid  ;
  wire core0_slice3_l1tlbtol2tlb_req_retry  ;
   I_l1tlbtol2tlb_req_type  core0_slice3_l1tlbtol2tlb_req        ;
  wire core0_slice3_l1tlbtol2tlb_sack_valid ;
  wire core0_slice3_l1tlbtol2tlb_sack_retry ;
   I_l1tlbtol2tlb_sack_type core0_slice3_l1tlbtol2tlb_sack       ;
  wire core0_slice3_pftodc_req3_valid;
  wire core0_slice3_pftodc_req3_retry;
  I_pfetol1tlb_req_type    core0_slice3_pftodc_req3      ;
  dctlb dcltb_c0s3(
     .clk(clk)
    ,.reset(reset)
    ,.coretodctlb_ld_valid(c0_s3_coretodctlb_ld_valid)
    ,.coretodctlb_ld_retry(c0_s3_coretodctlb_ld_retry)
    ,.coretodctlb_ld      (c0_s3_coretodctlb_ld      )
    ,.coretodctlb_st_valid(c0_s3_coretodctlb_st_valid)
    ,.coretodctlb_st_retry(c0_s3_coretodctlb_st_retry)
    ,.coretodctlb_st      (c0_s3_coretodctlb_st      )
    ,.pfetol1tlb_req_valid   (core0_slice3_pftodc_req3_valid)
    ,.pfetol1tlb_req_retry   (core0_slice3_pftodc_req3_retry)
    ,.pfetol1tlb_req         (core0_slice3_pftodc_req3      )
    ,.l1tlbtol1_fwd0_valid(core0_slice3_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core0_slice3_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core0_slice3_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core0_slice3_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core0_slice3_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core0_slice3_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core0_slice3_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core0_slice3_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core0_slice3_l1tlbtol1_cmd       )
    ,.l2tlbtol1tlb_snoop_valid(core0_slice3_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core0_slice3_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core0_slice3_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core0_slice3_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core0_slice3_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core0_slice3_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core0_slice3_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core0_slice3_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core0_slice3_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core0_slice3_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core0_slice3_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core0_slice3_l1tlbtol2tlb_sack       )
  );
`endif
  wire core0_l1tol2_req_valid      ;
  wire core0_l1tol2_req_retry      ;
  I_l1tol2_req_type    core0_l1tol2_req            ;
  wire core0_l2tol1_snack_valid    ;
  wire core0_l2tol1_snack_retry    ;
  I_l2tol1_snack_type  core0_l2tol1_snack          ;
  wire core0_l1tol2_snoop_ack_valid;
  wire core0_l1tol2_snoop_ack_retry;
  I_l2snoop_ack_type   core0_l1tol2_snoop_ack      ;
  wire core0_l1tlbtol1_fwd_valid;
  wire core0_l1tlbtol1_fwd_retry;
   I_l1tlbtol1_fwd_type core0_l1tlbtol1_fwd      ;
  wire core0_l1tlbtol1_cmd_valid;
  wire core0_l1tlbtol1_cmd_retry;
   I_l1tlbtol1_cmd_type core0_l1tlbtol1_cmd      ;
  wire core0_l1tol2tlb_req_valid;
  wire core0_l1tol2tlb_req_retry;
   I_l1tol2tlb_req_type core0_l1tol2tlb_req      ;
  PF_cache_stats_type core0_cachetopf_stats;
  icache core0_icache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core0_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core0_l1tol2_req_retry      )
    ,.l1tol2_req            (core0_l1tol2_req            )
    ,.l2tol1_snack_valid    (core0_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core0_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core0_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core0_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core0_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core0_l1tol2_snoop_ack      )
    ,.l1tlbtol1_fwd_valid(core0_l1tlbtol1_fwd_valid)
    ,.l1tlbtol1_fwd_retry(core0_l1tlbtol1_fwd_retry)
    ,.l1tlbtol1_fwd      (core0_l1tlbtol1_fwd      )
    ,.l1tlbtol1_cmd_valid(core0_l1tlbtol1_cmd_valid)
    ,.l1tlbtol1_cmd_retry(core0_l1tlbtol1_cmd_retry)
    ,.l1tlbtol1_cmd      (core0_l1tlbtol1_cmd      )
    ,.l1tol2tlb_req_valid(core0_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core0_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core0_l1tol2tlb_req      )
    ,.cachetopf_stats(core0_cachetopf_stats)
    ,.coretoic_pc_valid        (core0_coretoic_pc_valid        )
    ,.coretoic_pc_retry        (core0_coretoic_pc_retry        )
    ,.coretoic_pc              (core0_coretoic_pc              )
    ,.ictocore_valid        (core0_ictocore_valid        )
    ,.ictocore_retry        (core0_ictocore_retry        )
    ,.ictocore              (core0_ictocore              )
  );
  PF_cache_stats_type  core0_slice0_pf0_l2stats      ;
  wire core0_slice0_l2todr_req_valid      ;
  wire core0_slice0_l2todr_req_retry      ;
   I_l2todr_req_type    core0_slice0_l2todr_req            ;
  wire core0_slice0_drtol2_snack_valid    ;
  wire core0_slice0_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_slice0_drtol2_snack          ;
  wire core0_slice0_l2todr_disp_valid     ;
  wire core0_slice0_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_slice0_l2todr_disp           ;
  wire core0_slice0_drtol2_dack_valid     ;
  wire core0_slice0_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_slice0_drtol2_dack           ;
  wire core0_slice0_l2todr_snoop_ack_valid;
  wire core0_slice0_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_slice0_l2todr_snoop_ack      ;
  PF_cache_stats_type     core0_l2d_slice0_pf0_dcstats      ;
  wire core0_slice0_l2todr_pfreq_valid    ;
  wire core0_slice0_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core0_slice0_l2todr_pfreq          ;
  wire core0_slice0_l2tlbtol2_fwd_valid;
  wire core0_slice0_l2tlbtol2_fwd_retry;
   I_l2tlbtol2_fwd_type core0_slice0_l2tlbtol2_fwd      ;
  l2cache_pipe core0_l2d_slice0(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core0_slice0_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core0_slice0_l1tol2_req_retry      )
    ,.l1tol2_req            (core0_slice0_l1tol2_req            )
    ,.l2tol1_snack_valid    (core0_slice0_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core0_slice0_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core0_slice0_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core0_slice0_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core0_slice0_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core0_slice0_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core0_slice0_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core0_slice0_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core0_slice0_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core0_slice0_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core0_slice0_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core0_slice0_l2tol1_dack           )
    ,.l2todr_pfreq_valid    (core0_slice0_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core0_slice0_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core0_slice0_l2todr_pfreq          )
    ,.l2tlbtol2_fwd_valid(core0_slice0_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core0_slice0_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core0_slice0_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core0_slice0_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_slice0_l2todr_req_retry      )
    ,.l2todr_req            (core0_slice0_l2todr_req            )
    ,.drtol2_snack_valid    (core0_slice0_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_slice0_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_slice0_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_slice0_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_slice0_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_slice0_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_slice0_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_slice0_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_slice0_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_slice0_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_slice0_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_slice0_l2todr_snoop_ack      )
    ,.cachetopf_stats   (core0_slice0_pf0_l2stats      )
  );
  wire core0_slice0_l2tlb_l2todr_req_valid      ;
  wire core0_slice0_l2tlb_l2todr_req_retry      ;
   I_l2todr_req_type    core0_slice0_l2tlb_l2todr_req            ;
  wire core0_slice0_l2tlb_drtol2_snack_valid    ;
  wire core0_slice0_l2tlb_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_slice0_l2tlb_drtol2_snack          ;
  wire core0_slice0_l2tlb_l2todr_disp_valid     ;
  wire core0_slice0_l2tlb_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_slice0_l2tlb_l2todr_disp           ;
  wire core0_slice0_l2tlb_drtol2_dack_valid     ;
  wire core0_slice0_l2tlb_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_slice0_l2tlb_drtol2_dack           ;
  wire core0_slice0_l2tlb_l2todr_snoop_ack_valid;
  wire core0_slice0_l2tlb_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_slice0_l2tlb_l2todr_snoop_ack      ;
  l2tlb l2tlb_core0_slice0(
     .clk(clk)
    ,.reset(reset)
    ,.l2tlbtol1tlb_snoop_valid(core0_slice0_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core0_slice0_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core0_slice0_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core0_slice0_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core0_slice0_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core0_slice0_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core0_slice0_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core0_slice0_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core0_slice0_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core0_slice0_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core0_slice0_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core0_slice0_l1tlbtol2tlb_sack       )
    ,.l1tol2tlb_req_valid(core0_slice0_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core0_slice0_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core0_slice0_l1tol2tlb_req      )
    ,.l2tlbtol2_fwd_valid(core0_slice0_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core0_slice0_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core0_slice0_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core0_slice0_l2tlb_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_slice0_l2tlb_l2todr_req_retry      )
    ,.l2todr_req            (core0_slice0_l2tlb_l2todr_req            )
    ,.drtol2_snack_valid    (core0_slice0_l2tlb_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_slice0_l2tlb_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_slice0_l2tlb_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_slice0_l2tlb_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_slice0_l2tlb_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_slice0_l2tlb_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_slice0_l2tlb_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_slice0_l2tlb_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_slice0_l2tlb_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_slice0_l2tlb_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_slice0_l2tlb_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_slice0_l2tlb_l2todr_snoop_ack      )
  );
  PF_cache_stats_type  core0_slice1_pf1_l2stats      ;
  wire core0_slice1_l2todr_req_valid      ;
  wire core0_slice1_l2todr_req_retry      ;
   I_l2todr_req_type    core0_slice1_l2todr_req            ;
  wire core0_slice1_drtol2_snack_valid    ;
  wire core0_slice1_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_slice1_drtol2_snack          ;
  wire core0_slice1_l2todr_disp_valid     ;
  wire core0_slice1_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_slice1_l2todr_disp           ;
  wire core0_slice1_drtol2_dack_valid     ;
  wire core0_slice1_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_slice1_drtol2_dack           ;
  wire core0_slice1_l2todr_snoop_ack_valid;
  wire core0_slice1_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_slice1_l2todr_snoop_ack      ;
  PF_cache_stats_type     core0_l2d_slice1_pf1_dcstats      ;
  wire core0_slice1_l2todr_pfreq_valid    ;
  wire core0_slice1_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core0_slice1_l2todr_pfreq          ;
  wire core0_slice1_l2tlbtol2_fwd_valid;
  wire core0_slice1_l2tlbtol2_fwd_retry;
   I_l2tlbtol2_fwd_type core0_slice1_l2tlbtol2_fwd      ;
  l2cache_pipe core0_l2d_slice1(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core0_slice1_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core0_slice1_l1tol2_req_retry      )
    ,.l1tol2_req            (core0_slice1_l1tol2_req            )
    ,.l2tol1_snack_valid    (core0_slice1_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core0_slice1_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core0_slice1_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core0_slice1_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core0_slice1_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core0_slice1_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core0_slice1_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core0_slice1_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core0_slice1_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core0_slice1_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core0_slice1_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core0_slice1_l2tol1_dack           )
    ,.l2todr_pfreq_valid    (core0_slice1_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core0_slice1_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core0_slice1_l2todr_pfreq          )
    ,.l2tlbtol2_fwd_valid(core0_slice1_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core0_slice1_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core0_slice1_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core0_slice1_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_slice1_l2todr_req_retry      )
    ,.l2todr_req            (core0_slice1_l2todr_req            )
    ,.drtol2_snack_valid    (core0_slice1_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_slice1_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_slice1_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_slice1_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_slice1_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_slice1_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_slice1_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_slice1_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_slice1_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_slice1_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_slice1_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_slice1_l2todr_snoop_ack      )
    ,.cachetopf_stats   (core0_slice1_pf1_l2stats      )
  );
  wire core0_slice1_l2tlb_l2todr_req_valid      ;
  wire core0_slice1_l2tlb_l2todr_req_retry      ;
   I_l2todr_req_type    core0_slice1_l2tlb_l2todr_req            ;
  wire core0_slice1_l2tlb_drtol2_snack_valid    ;
  wire core0_slice1_l2tlb_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_slice1_l2tlb_drtol2_snack          ;
  wire core0_slice1_l2tlb_l2todr_disp_valid     ;
  wire core0_slice1_l2tlb_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_slice1_l2tlb_l2todr_disp           ;
  wire core0_slice1_l2tlb_drtol2_dack_valid     ;
  wire core0_slice1_l2tlb_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_slice1_l2tlb_drtol2_dack           ;
  wire core0_slice1_l2tlb_l2todr_snoop_ack_valid;
  wire core0_slice1_l2tlb_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_slice1_l2tlb_l2todr_snoop_ack      ;
  l2tlb l2tlb_core0_slice1(
     .clk(clk)
    ,.reset(reset)
    ,.l2tlbtol1tlb_snoop_valid(core0_slice1_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core0_slice1_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core0_slice1_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core0_slice1_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core0_slice1_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core0_slice1_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core0_slice1_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core0_slice1_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core0_slice1_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core0_slice1_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core0_slice1_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core0_slice1_l1tlbtol2tlb_sack       )
    ,.l1tol2tlb_req_valid(core0_slice1_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core0_slice1_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core0_slice1_l1tol2tlb_req      )
    ,.l2tlbtol2_fwd_valid(core0_slice1_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core0_slice1_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core0_slice1_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core0_slice1_l2tlb_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_slice1_l2tlb_l2todr_req_retry      )
    ,.l2todr_req            (core0_slice1_l2tlb_l2todr_req            )
    ,.drtol2_snack_valid    (core0_slice1_l2tlb_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_slice1_l2tlb_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_slice1_l2tlb_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_slice1_l2tlb_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_slice1_l2tlb_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_slice1_l2tlb_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_slice1_l2tlb_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_slice1_l2tlb_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_slice1_l2tlb_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_slice1_l2tlb_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_slice1_l2tlb_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_slice1_l2tlb_l2todr_snoop_ack      )
  );
`ifdef SC_4PIPE
  PF_cache_stats_type  core0_slice2_pf2_l2stats      ;
  wire core0_slice2_l2todr_req_valid      ;
  wire core0_slice2_l2todr_req_retry      ;
   I_l2todr_req_type    core0_slice2_l2todr_req            ;
  wire core0_slice2_drtol2_snack_valid    ;
  wire core0_slice2_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_slice2_drtol2_snack          ;
  wire core0_slice2_l2todr_disp_valid     ;
  wire core0_slice2_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_slice2_l2todr_disp           ;
  wire core0_slice2_drtol2_dack_valid     ;
  wire core0_slice2_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_slice2_drtol2_dack           ;
  wire core0_slice2_l2todr_snoop_ack_valid;
  wire core0_slice2_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_slice2_l2todr_snoop_ack      ;
  PF_cache_stats_type     core0_l2d_slice2_pf2_dcstats      ;
  wire core0_slice2_l2todr_pfreq_valid    ;
  wire core0_slice2_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core0_slice2_l2todr_pfreq          ;
  wire core0_slice2_l2tlbtol2_fwd_valid;
  wire core0_slice2_l2tlbtol2_fwd_retry;
   I_l2tlbtol2_fwd_type core0_slice2_l2tlbtol2_fwd      ;
  l2cache_pipe core0_l2d_slice2(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core0_slice2_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core0_slice2_l1tol2_req_retry      )
    ,.l1tol2_req            (core0_slice2_l1tol2_req            )
    ,.l2tol1_snack_valid    (core0_slice2_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core0_slice2_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core0_slice2_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core0_slice2_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core0_slice2_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core0_slice2_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core0_slice2_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core0_slice2_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core0_slice2_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core0_slice2_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core0_slice2_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core0_slice2_l2tol1_dack           )
    ,.l2todr_pfreq_valid    (core0_slice2_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core0_slice2_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core0_slice2_l2todr_pfreq          )
    ,.l2tlbtol2_fwd_valid(core0_slice2_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core0_slice2_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core0_slice2_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core0_slice2_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_slice2_l2todr_req_retry      )
    ,.l2todr_req            (core0_slice2_l2todr_req            )
    ,.drtol2_snack_valid    (core0_slice2_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_slice2_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_slice2_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_slice2_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_slice2_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_slice2_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_slice2_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_slice2_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_slice2_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_slice2_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_slice2_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_slice2_l2todr_snoop_ack      )
    ,.cachetopf_stats   (core0_slice2_pf2_l2stats      )
  );
  wire core0_slice2_l2tlb_l2todr_req_valid      ;
  wire core0_slice2_l2tlb_l2todr_req_retry      ;
   I_l2todr_req_type    core0_slice2_l2tlb_l2todr_req            ;
  wire core0_slice2_l2tlb_drtol2_snack_valid    ;
  wire core0_slice2_l2tlb_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_slice2_l2tlb_drtol2_snack          ;
  wire core0_slice2_l2tlb_l2todr_disp_valid     ;
  wire core0_slice2_l2tlb_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_slice2_l2tlb_l2todr_disp           ;
  wire core0_slice2_l2tlb_drtol2_dack_valid     ;
  wire core0_slice2_l2tlb_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_slice2_l2tlb_drtol2_dack           ;
  wire core0_slice2_l2tlb_l2todr_snoop_ack_valid;
  wire core0_slice2_l2tlb_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_slice2_l2tlb_l2todr_snoop_ack      ;
  l2tlb l2tlb_core0_slice2(
     .clk(clk)
    ,.reset(reset)
    ,.l2tlbtol1tlb_snoop_valid(core0_slice2_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core0_slice2_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core0_slice2_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core0_slice2_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core0_slice2_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core0_slice2_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core0_slice2_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core0_slice2_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core0_slice2_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core0_slice2_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core0_slice2_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core0_slice2_l1tlbtol2tlb_sack       )
    ,.l1tol2tlb_req_valid(core0_slice2_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core0_slice2_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core0_slice2_l1tol2tlb_req      )
    ,.l2tlbtol2_fwd_valid(core0_slice2_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core0_slice2_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core0_slice2_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core0_slice2_l2tlb_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_slice2_l2tlb_l2todr_req_retry      )
    ,.l2todr_req            (core0_slice2_l2tlb_l2todr_req            )
    ,.drtol2_snack_valid    (core0_slice2_l2tlb_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_slice2_l2tlb_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_slice2_l2tlb_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_slice2_l2tlb_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_slice2_l2tlb_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_slice2_l2tlb_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_slice2_l2tlb_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_slice2_l2tlb_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_slice2_l2tlb_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_slice2_l2tlb_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_slice2_l2tlb_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_slice2_l2tlb_l2todr_snoop_ack      )
  );
  PF_cache_stats_type  core0_slice3_pf3_l2stats      ;
  wire core0_slice3_l2todr_req_valid      ;
  wire core0_slice3_l2todr_req_retry      ;
   I_l2todr_req_type    core0_slice3_l2todr_req            ;
  wire core0_slice3_drtol2_snack_valid    ;
  wire core0_slice3_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_slice3_drtol2_snack          ;
  wire core0_slice3_l2todr_disp_valid     ;
  wire core0_slice3_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_slice3_l2todr_disp           ;
  wire core0_slice3_drtol2_dack_valid     ;
  wire core0_slice3_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_slice3_drtol2_dack           ;
  wire core0_slice3_l2todr_snoop_ack_valid;
  wire core0_slice3_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_slice3_l2todr_snoop_ack      ;
  PF_cache_stats_type     core0_l2d_slice3_pf3_dcstats      ;
  wire core0_slice3_l2todr_pfreq_valid    ;
  wire core0_slice3_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core0_slice3_l2todr_pfreq          ;
  wire core0_slice3_l2tlbtol2_fwd_valid;
  wire core0_slice3_l2tlbtol2_fwd_retry;
   I_l2tlbtol2_fwd_type core0_slice3_l2tlbtol2_fwd      ;
  l2cache_pipe core0_l2d_slice3(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core0_slice3_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core0_slice3_l1tol2_req_retry      )
    ,.l1tol2_req            (core0_slice3_l1tol2_req            )
    ,.l2tol1_snack_valid    (core0_slice3_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core0_slice3_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core0_slice3_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core0_slice3_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core0_slice3_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core0_slice3_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core0_slice3_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core0_slice3_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core0_slice3_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core0_slice3_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core0_slice3_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core0_slice3_l2tol1_dack           )
    ,.l2todr_pfreq_valid    (core0_slice3_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core0_slice3_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core0_slice3_l2todr_pfreq          )
    ,.l2tlbtol2_fwd_valid(core0_slice3_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core0_slice3_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core0_slice3_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core0_slice3_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_slice3_l2todr_req_retry      )
    ,.l2todr_req            (core0_slice3_l2todr_req            )
    ,.drtol2_snack_valid    (core0_slice3_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_slice3_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_slice3_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_slice3_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_slice3_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_slice3_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_slice3_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_slice3_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_slice3_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_slice3_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_slice3_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_slice3_l2todr_snoop_ack      )
    ,.cachetopf_stats   (core0_slice3_pf3_l2stats      )
  );
  wire core0_slice3_l2tlb_l2todr_req_valid      ;
  wire core0_slice3_l2tlb_l2todr_req_retry      ;
   I_l2todr_req_type    core0_slice3_l2tlb_l2todr_req            ;
  wire core0_slice3_l2tlb_drtol2_snack_valid    ;
  wire core0_slice3_l2tlb_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_slice3_l2tlb_drtol2_snack          ;
  wire core0_slice3_l2tlb_l2todr_disp_valid     ;
  wire core0_slice3_l2tlb_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_slice3_l2tlb_l2todr_disp           ;
  wire core0_slice3_l2tlb_drtol2_dack_valid     ;
  wire core0_slice3_l2tlb_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_slice3_l2tlb_drtol2_dack           ;
  wire core0_slice3_l2tlb_l2todr_snoop_ack_valid;
  wire core0_slice3_l2tlb_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_slice3_l2tlb_l2todr_snoop_ack      ;
  l2tlb l2tlb_core0_slice3(
     .clk(clk)
    ,.reset(reset)
    ,.l2tlbtol1tlb_snoop_valid(core0_slice3_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core0_slice3_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core0_slice3_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core0_slice3_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core0_slice3_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core0_slice3_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core0_slice3_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core0_slice3_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core0_slice3_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core0_slice3_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core0_slice3_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core0_slice3_l1tlbtol2tlb_sack       )
    ,.l1tol2tlb_req_valid(core0_slice3_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core0_slice3_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core0_slice3_l1tol2tlb_req      )
    ,.l2tlbtol2_fwd_valid(core0_slice3_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core0_slice3_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core0_slice3_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core0_slice3_l2tlb_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_slice3_l2tlb_l2todr_req_retry      )
    ,.l2todr_req            (core0_slice3_l2tlb_l2todr_req            )
    ,.drtol2_snack_valid    (core0_slice3_l2tlb_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_slice3_l2tlb_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_slice3_l2tlb_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_slice3_l2tlb_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_slice3_l2tlb_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_slice3_l2tlb_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_slice3_l2tlb_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_slice3_l2tlb_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_slice3_l2tlb_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_slice3_l2tlb_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_slice3_l2tlb_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_slice3_l2tlb_l2todr_snoop_ack      )
  );
`endif
  PF_cache_stats_type  core0_icache_pficache_l2stats      ;
  wire core0_icache_l2tlbtol2_fwd_valid;
  wire core0_icache_l2tlbtol2_fwd_retry;
   I_l2tlbtol2_fwd_type core0_icache_l2tlbtol2_fwd      ;
  wire core0_icache_l2todr_pfreq_valid    ;
  wire core0_icache_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core0_icache_l2todr_pfreq          ;
  wire unconnected_0_icache_l1tol2_disp_retry ;
  wire unconnected_0_icache_l2tol1_dack_valid ;
  I_l2tol1_dack_type  unconnected_0_icache_l2tol1_dack       ;
  wire core0_icache_l2todr_req_valid      ;
  wire core0_icache_l2todr_req_retry      ;
   I_l2todr_req_type    core0_icache_l2todr_req            ;
  wire core0_icache_drtol2_snack_valid    ;
  wire core0_icache_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_icache_drtol2_snack          ;
  wire core0_icache_l2todr_disp_valid     ;
  wire core0_icache_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_icache_l2todr_disp           ;
  wire core0_icache_drtol2_dack_valid     ;
  wire core0_icache_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_icache_drtol2_dack           ;
  wire core0_icache_l2todr_snoop_ack_valid;
  wire core0_icache_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_icache_l2todr_snoop_ack      ;
  l2cache_pipe core0_l2icache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core0_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core0_l1tol2_req_retry      )
    ,.l1tol2_req            (core0_l1tol2_req            )
    ,.l2tol1_snack_valid    (core0_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core0_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core0_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core0_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core0_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core0_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid(1'b0)
    ,.l1tol2_disp      ({$bits(I_l1tol2_disp_type) {1'b0}})
    ,.l2tol1_dack_retry(1'b0)
    ,.l2todr_req_valid      (core0_icache_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_icache_l2todr_req_retry      )
    ,.l2todr_req            (core0_icache_l2todr_req            )
    ,.drtol2_snack_valid    (core0_icache_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_icache_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_icache_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_icache_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_icache_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_icache_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_icache_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_icache_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_icache_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_icache_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_icache_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_icache_l2todr_snoop_ack      )
    ,.l2tlbtol2_fwd_valid(core0_icache_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core0_icache_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core0_icache_l2tlbtol2_fwd      )
    ,.l2todr_pfreq_valid    (core0_icache_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core0_icache_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core0_icache_l2todr_pfreq          )
    ,.cachetopf_stats   (core0_icache_pficache_l2stats      )
    ,.l1tol2_disp_retry (unconnected_0_icache_l1tol2_disp_retry )
    ,.l2tol1_dack_valid (unconnected_0_icache_l2tol1_dack_valid )
    ,.l2tol1_dack       (unconnected_0_icache_l2tol1_dack       )
  );
  wire core0_l2todr_req_valid      ;
  wire core0_l2todr_req_retry      ;
   I_l2todr_req_type    core0_l2todr_req            ;
  wire core0_drtol2_snack_valid    ;
  wire core0_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_drtol2_snack          ;
  wire core0_l2todr_disp_valid     ;
  wire core0_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_l2todr_disp           ;
  wire core0_drtol2_dack_valid     ;
  wire core0_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_drtol2_dack           ;
  wire core0_l2todr_snoop_ack_valid;
  wire core0_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_l2todr_snoop_ack      ;
  wire core0_l2todr_pfreq_valid    ;
  wire core0_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core0_l2todr_pfreq          ;
  arbl2 l2arbiter_core0(
     .clk(clk)
    ,.reset(reset)
    ,.l2d_0todr_req_valid      (core0_slice0_l2todr_req_valid      )
    ,.l2d_0todr_req_retry      (core0_slice0_l2todr_req_retry      )
    ,.l2d_0todr_req            (core0_slice0_l2todr_req            )
    ,.drtol2d_0_snack_valid    (core0_slice0_drtol2_snack_valid    )
    ,.drtol2d_0_snack_retry    (core0_slice0_drtol2_snack_retry    )
    ,.drtol2d_0_snack          (core0_slice0_drtol2_snack          )
    ,.l2d_0todr_disp_valid     (core0_slice0_l2todr_disp_valid     )
    ,.l2d_0todr_disp_retry     (core0_slice0_l2todr_disp_retry     )
    ,.l2d_0todr_disp           (core0_slice0_l2todr_disp           )
    ,.drtol2d_0_dack_valid     (core0_slice0_drtol2_dack_valid     )
    ,.drtol2d_0_dack_retry     (core0_slice0_drtol2_dack_retry     )
    ,.drtol2d_0_dack           (core0_slice0_drtol2_dack           )
    ,.l2d_0todr_snoop_ack_valid(core0_slice0_l2todr_snoop_ack_valid)
    ,.l2d_0todr_snoop_ack_retry(core0_slice0_l2todr_snoop_ack_retry)
    ,.l2d_0todr_snoop_ack      (core0_slice0_l2todr_snoop_ack      )
    ,.l2d_0todr_pfreq_valid    (core0_slice0_l2todr_pfreq_valid    )
    ,.l2d_0todr_pfreq_retry    (core0_slice0_l2todr_pfreq_retry    )
    ,.l2d_0todr_pfreq          (core0_slice0_l2todr_pfreq          )
    ,.l2d_1todr_req_valid      (core0_slice1_l2todr_req_valid      )
    ,.l2d_1todr_req_retry      (core0_slice1_l2todr_req_retry      )
    ,.l2d_1todr_req            (core0_slice1_l2todr_req            )
    ,.drtol2d_1_snack_valid    (core0_slice1_drtol2_snack_valid    )
    ,.drtol2d_1_snack_retry    (core0_slice1_drtol2_snack_retry    )
    ,.drtol2d_1_snack          (core0_slice1_drtol2_snack          )
    ,.l2d_1todr_disp_valid     (core0_slice1_l2todr_disp_valid     )
    ,.l2d_1todr_disp_retry     (core0_slice1_l2todr_disp_retry     )
    ,.l2d_1todr_disp           (core0_slice1_l2todr_disp           )
    ,.drtol2d_1_dack_valid     (core0_slice1_drtol2_dack_valid     )
    ,.drtol2d_1_dack_retry     (core0_slice1_drtol2_dack_retry     )
    ,.drtol2d_1_dack           (core0_slice1_drtol2_dack           )
    ,.l2d_1todr_snoop_ack_valid(core0_slice1_l2todr_snoop_ack_valid)
    ,.l2d_1todr_snoop_ack_retry(core0_slice1_l2todr_snoop_ack_retry)
    ,.l2d_1todr_snoop_ack      (core0_slice1_l2todr_snoop_ack      )
    ,.l2d_1todr_pfreq_valid    (core0_slice1_l2todr_pfreq_valid    )
    ,.l2d_1todr_pfreq_retry    (core0_slice1_l2todr_pfreq_retry    )
    ,.l2d_1todr_pfreq          (core0_slice1_l2todr_pfreq          )
`ifdef SC_4PIPE
    ,.l2d_2todr_req_valid      (core0_slice2_l2todr_req_valid      )
    ,.l2d_2todr_req_retry      (core0_slice2_l2todr_req_retry      )
    ,.l2d_2todr_req            (core0_slice2_l2todr_req            )
    ,.drtol2d_2_snack_valid    (core0_slice2_drtol2_snack_valid    )
    ,.drtol2d_2_snack_retry    (core0_slice2_drtol2_snack_retry    )
    ,.drtol2d_2_snack          (core0_slice2_drtol2_snack          )
    ,.l2d_2todr_disp_valid     (core0_slice2_l2todr_disp_valid     )
    ,.l2d_2todr_disp_retry     (core0_slice2_l2todr_disp_retry     )
    ,.l2d_2todr_disp           (core0_slice2_l2todr_disp           )
    ,.drtol2d_2_dack_valid     (core0_slice2_drtol2_dack_valid     )
    ,.drtol2d_2_dack_retry     (core0_slice2_drtol2_dack_retry     )
    ,.drtol2d_2_dack           (core0_slice2_drtol2_dack           )
    ,.l2d_2todr_snoop_ack_valid(core0_slice2_l2todr_snoop_ack_valid)
    ,.l2d_2todr_snoop_ack_retry(core0_slice2_l2todr_snoop_ack_retry)
    ,.l2d_2todr_snoop_ack      (core0_slice2_l2todr_snoop_ack      )
    ,.l2d_2todr_pfreq_valid    (core0_slice2_l2todr_pfreq_valid    )
    ,.l2d_2todr_pfreq_retry    (core0_slice2_l2todr_pfreq_retry    )
    ,.l2d_2todr_pfreq          (core0_slice2_l2todr_pfreq          )
    ,.l2d_3todr_req_valid      (core0_slice3_l2todr_req_valid      )
    ,.l2d_3todr_req_retry      (core0_slice3_l2todr_req_retry      )
    ,.l2d_3todr_req            (core0_slice3_l2todr_req            )
    ,.drtol2d_3_snack_valid    (core0_slice3_drtol2_snack_valid    )
    ,.drtol2d_3_snack_retry    (core0_slice3_drtol2_snack_retry    )
    ,.drtol2d_3_snack          (core0_slice3_drtol2_snack          )
    ,.l2d_3todr_disp_valid     (core0_slice3_l2todr_disp_valid     )
    ,.l2d_3todr_disp_retry     (core0_slice3_l2todr_disp_retry     )
    ,.l2d_3todr_disp           (core0_slice3_l2todr_disp           )
    ,.drtol2d_3_dack_valid     (core0_slice3_drtol2_dack_valid     )
    ,.drtol2d_3_dack_retry     (core0_slice3_drtol2_dack_retry     )
    ,.drtol2d_3_dack           (core0_slice3_drtol2_dack           )
    ,.l2d_3todr_snoop_ack_valid(core0_slice3_l2todr_snoop_ack_valid)
    ,.l2d_3todr_snoop_ack_retry(core0_slice3_l2todr_snoop_ack_retry)
    ,.l2d_3todr_snoop_ack      (core0_slice3_l2todr_snoop_ack      )
    ,.l2d_3todr_pfreq_valid    (core0_slice3_l2todr_pfreq_valid    )
    ,.l2d_3todr_pfreq_retry    (core0_slice3_l2todr_pfreq_retry    )
    ,.l2d_3todr_pfreq          (core0_slice3_l2todr_pfreq          )
`endif
    ,.l2todr_req_valid      (core0_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_l2todr_req_retry      )
    ,.l2todr_req            (core0_l2todr_req            )
    ,.drtol2_snack_valid    (core0_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_l2todr_snoop_ack      )
    ,.l2todr_pfreq_valid    (core0_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core0_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core0_l2todr_pfreq          )
);
  wire core0_l2tlb_l2todr_req_valid      ;
  wire core0_l2tlb_l2todr_req_retry      ;
   I_l2todr_req_type    core0_l2tlb_l2todr_req            ;
  wire core0_l2tlb_drtol2_snack_valid    ;
  wire core0_l2tlb_drtol2_snack_retry    ;
   I_drtol2_snack_type  core0_l2tlb_drtol2_snack          ;
  wire core0_l2tlb_l2todr_disp_valid     ;
  wire core0_l2tlb_l2todr_disp_retry     ;
   I_l2todr_disp_type   core0_l2tlb_l2todr_disp           ;
  wire core0_l2tlb_drtol2_dack_valid     ;
  wire core0_l2tlb_drtol2_dack_retry     ;
   I_drtol2_dack_type   core0_l2tlb_drtol2_dack           ;
  wire core0_l2tlb_l2todr_snoop_ack_valid;
  wire core0_l2tlb_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core0_l2tlb_l2todr_snoop_ack      ;
  arbl2tlb l2tlbarbiter_core0(
     .clk(clk)
    ,.reset(reset)
    ,.l2d_0todr_req_valid      (core0_slice0_l2tlb_l2todr_req_valid      )
    ,.l2d_0todr_req_retry      (core0_slice0_l2tlb_l2todr_req_retry      )
    ,.l2d_0todr_req            (core0_slice0_l2tlb_l2todr_req            )
    ,.drtol2d_0_snack_valid    (core0_slice0_l2tlb_drtol2_snack_valid    )
    ,.drtol2d_0_snack_retry    (core0_slice0_l2tlb_drtol2_snack_retry    )
    ,.drtol2d_0_snack          (core0_slice0_l2tlb_drtol2_snack          )
    ,.l2d_0todr_disp_valid     (core0_slice0_l2tlb_l2todr_disp_valid     )
    ,.l2d_0todr_disp_retry     (core0_slice0_l2tlb_l2todr_disp_retry     )
    ,.l2d_0todr_disp           (core0_slice0_l2tlb_l2todr_disp           )
    ,.drtol2d_0_dack_valid     (core0_slice0_l2tlb_drtol2_dack_valid     )
    ,.drtol2d_0_dack_retry     (core0_slice0_l2tlb_drtol2_dack_retry     )
    ,.drtol2d_0_dack           (core0_slice0_l2tlb_drtol2_dack           )
    ,.l2d_0todr_snoop_ack_valid(core0_slice0_l2tlb_l2todr_snoop_ack_valid)
    ,.l2d_0todr_snoop_ack_retry(core0_slice0_l2tlb_l2todr_snoop_ack_retry)
    ,.l2d_0todr_snoop_ack      (core0_slice0_l2tlb_l2todr_snoop_ack      )
    ,.l2d_1todr_req_valid      (core0_slice1_l2tlb_l2todr_req_valid      )
    ,.l2d_1todr_req_retry      (core0_slice1_l2tlb_l2todr_req_retry      )
    ,.l2d_1todr_req            (core0_slice1_l2tlb_l2todr_req            )
    ,.drtol2d_1_snack_valid    (core0_slice1_l2tlb_drtol2_snack_valid    )
    ,.drtol2d_1_snack_retry    (core0_slice1_l2tlb_drtol2_snack_retry    )
    ,.drtol2d_1_snack          (core0_slice1_l2tlb_drtol2_snack          )
    ,.l2d_1todr_disp_valid     (core0_slice1_l2tlb_l2todr_disp_valid     )
    ,.l2d_1todr_disp_retry     (core0_slice1_l2tlb_l2todr_disp_retry     )
    ,.l2d_1todr_disp           (core0_slice1_l2tlb_l2todr_disp           )
    ,.drtol2d_1_dack_valid     (core0_slice1_l2tlb_drtol2_dack_valid     )
    ,.drtol2d_1_dack_retry     (core0_slice1_l2tlb_drtol2_dack_retry     )
    ,.drtol2d_1_dack           (core0_slice1_l2tlb_drtol2_dack           )
    ,.l2d_1todr_snoop_ack_valid(core0_slice1_l2tlb_l2todr_snoop_ack_valid)
    ,.l2d_1todr_snoop_ack_retry(core0_slice1_l2tlb_l2todr_snoop_ack_retry)
    ,.l2d_1todr_snoop_ack      (core0_slice1_l2tlb_l2todr_snoop_ack      )
`ifdef SC_4PIPE
    ,.l2d_2todr_req_valid      (core0_slice2_l2tlb_l2todr_req_valid      )
    ,.l2d_2todr_req_retry      (core0_slice2_l2tlb_l2todr_req_retry      )
    ,.l2d_2todr_req            (core0_slice2_l2tlb_l2todr_req            )
    ,.drtol2d_2_snack_valid    (core0_slice2_l2tlb_drtol2_snack_valid    )
    ,.drtol2d_2_snack_retry    (core0_slice2_l2tlb_drtol2_snack_retry    )
    ,.drtol2d_2_snack          (core0_slice2_l2tlb_drtol2_snack          )
    ,.l2d_2todr_disp_valid     (core0_slice2_l2tlb_l2todr_disp_valid     )
    ,.l2d_2todr_disp_retry     (core0_slice2_l2tlb_l2todr_disp_retry     )
    ,.l2d_2todr_disp           (core0_slice2_l2tlb_l2todr_disp           )
    ,.drtol2d_2_dack_valid     (core0_slice2_l2tlb_drtol2_dack_valid     )
    ,.drtol2d_2_dack_retry     (core0_slice2_l2tlb_drtol2_dack_retry     )
    ,.drtol2d_2_dack           (core0_slice2_l2tlb_drtol2_dack           )
    ,.l2d_2todr_snoop_ack_valid(core0_slice2_l2tlb_l2todr_snoop_ack_valid)
    ,.l2d_2todr_snoop_ack_retry(core0_slice2_l2tlb_l2todr_snoop_ack_retry)
    ,.l2d_2todr_snoop_ack      (core0_slice2_l2tlb_l2todr_snoop_ack      )
    ,.l2d_3todr_req_valid      (core0_slice3_l2tlb_l2todr_req_valid      )
    ,.l2d_3todr_req_retry      (core0_slice3_l2tlb_l2todr_req_retry      )
    ,.l2d_3todr_req            (core0_slice3_l2tlb_l2todr_req            )
    ,.drtol2d_3_snack_valid    (core0_slice3_l2tlb_drtol2_snack_valid    )
    ,.drtol2d_3_snack_retry    (core0_slice3_l2tlb_drtol2_snack_retry    )
    ,.drtol2d_3_snack          (core0_slice3_l2tlb_drtol2_snack          )
    ,.l2d_3todr_disp_valid     (core0_slice3_l2tlb_l2todr_disp_valid     )
    ,.l2d_3todr_disp_retry     (core0_slice3_l2tlb_l2todr_disp_retry     )
    ,.l2d_3todr_disp           (core0_slice3_l2tlb_l2todr_disp           )
    ,.drtol2d_3_dack_valid     (core0_slice3_l2tlb_drtol2_dack_valid     )
    ,.drtol2d_3_dack_retry     (core0_slice3_l2tlb_drtol2_dack_retry     )
    ,.drtol2d_3_dack           (core0_slice3_l2tlb_drtol2_dack           )
    ,.l2d_3todr_snoop_ack_valid(core0_slice3_l2tlb_l2todr_snoop_ack_valid)
    ,.l2d_3todr_snoop_ack_retry(core0_slice3_l2tlb_l2todr_snoop_ack_retry)
    ,.l2d_3todr_snoop_ack      (core0_slice3_l2tlb_l2todr_snoop_ack      )
`endif
    ,.l2todr_req_valid      (core0_l2tlb_l2todr_req_valid      )
    ,.l2todr_req_retry      (core0_l2tlb_l2todr_req_retry      )
    ,.l2todr_req            (core0_l2tlb_l2todr_req            )
    ,.drtol2_snack_valid    (core0_l2tlb_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core0_l2tlb_drtol2_snack_retry    )
    ,.drtol2_snack          (core0_l2tlb_drtol2_snack          )
    ,.l2todr_disp_valid     (core0_l2tlb_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core0_l2tlb_l2todr_disp_retry     )
    ,.l2todr_disp           (core0_l2tlb_l2todr_disp           )
    ,.drtol2_dack_valid     (core0_l2tlb_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core0_l2tlb_drtol2_dack_retry     )
    ,.drtol2_dack           (core0_l2tlb_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core0_l2tlb_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core0_l2tlb_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core0_l2tlb_l2todr_snoop_ack      )
  );
  PF_cache_stats_type  unconnected_pfe0_pf_dcstats       ;
  PF_cache_stats_type  unconnected_pfe0_pf_l2stats       ;
  pfengine core0_pfe(
     .clk(clk)
    ,.reset(reset)
    ,.pfgtopfe_op_valid(core0_pfgtopfe_op_valid)
    ,.pfgtopfe_op_retry(core0_pfgtopfe_op_retry)
    ,.pfgtopfe_op      (core0_pfgtopfe_op      )
    ,.pf0_l2stats      (core0_slice0_pf0_l2stats      )
    ,.pftodc_req0_valid(core0_slice0_pftodc_req0_valid)
    ,.pftodc_req0_retry(core0_slice0_pftodc_req0_retry)
    ,.pftodc_req0      (core0_slice0_pftodc_req0      )
    ,.pf0_dcstats      (core0_slice0_pf0_dcstats      )
    ,.pf1_l2stats      (core0_slice1_pf1_l2stats      )
    ,.pftodc_req1_valid(core0_slice1_pftodc_req1_valid)
    ,.pftodc_req1_retry(core0_slice1_pftodc_req1_retry)
    ,.pftodc_req1      (core0_slice1_pftodc_req1      )
    ,.pf1_dcstats      (core0_slice1_pf1_dcstats      )
`ifdef SC_4PIPE
    ,.pf2_l2stats      (core0_slice2_pf2_l2stats      )
    ,.pftodc_req2_valid(core0_slice2_pftodc_req2_valid)
    ,.pftodc_req2_retry(core0_slice2_pftodc_req2_retry)
    ,.pftodc_req2      (core0_slice2_pftodc_req2      )
    ,.pf2_dcstats      (core0_slice2_pf2_dcstats      )
    ,.pf3_l2stats      (core0_slice3_pf3_l2stats      )
    ,.pftodc_req3_valid(core0_slice3_pftodc_req3_valid)
    ,.pftodc_req3_retry(core0_slice3_pftodc_req3_retry)
    ,.pftodc_req3      (core0_slice3_pftodc_req3      )
    ,.pf3_dcstats      (core0_slice3_pf3_dcstats      )
`endif
    ,.pf_dcstats       (unconnected_pfe0_pf_dcstats       )
    ,.pf_l2stats       (unconnected_pfe0_pf_l2stats       )
  );
  wire core1_slice0_l1tol2_req_valid      ;
  wire core1_slice0_l1tol2_req_retry      ;
   I_l1tol2_req_type       core1_slice0_l1tol2_req            ;
  wire core1_slice0_l2tol1_snack_valid    ;
  wire core1_slice0_l2tol1_snack_retry    ;
   I_l2tol1_snack_type     core1_slice0_l2tol1_snack          ;
  wire core1_slice0_l1tol2_snoop_ack_valid;
  wire core1_slice0_l1tol2_snoop_ack_retry;
   I_l2snoop_ack_type      core1_slice0_l1tol2_snoop_ack      ;
  wire core1_slice0_l1tol2_disp_valid     ;
  wire core1_slice0_l1tol2_disp_retry     ;
   I_l1tol2_disp_type      core1_slice0_l1tol2_disp           ;
  wire core1_slice0_l2tol1_dack_valid     ;
  wire core1_slice0_l2tol1_dack_retry     ;
   I_l2tol1_dack_type      core1_slice0_l2tol1_dack           ;
  PF_cache_stats_type     core1_slice0_pf0_dcstats      ;
  wire core1_slice0_l1tol2tlb_req_valid;
  wire core1_slice0_l1tol2tlb_req_retry;
  I_l1tol2tlb_req_type core1_slice0_l1tol2tlb_req      ;
  dcache_pipe core1_slice0_dcache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core1_slice0_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core1_slice0_l1tol2_req_retry      )
    ,.l1tol2_req            (core1_slice0_l1tol2_req            )
    ,.l2tol1_snack_valid    (core1_slice0_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core1_slice0_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core1_slice0_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core1_slice0_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core1_slice0_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core1_slice0_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core1_slice0_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core1_slice0_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core1_slice0_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core1_slice0_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core1_slice0_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core1_slice0_l2tol1_dack           )
    ,.l1tol2tlb_req_valid(core1_slice0_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core1_slice0_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core1_slice0_l1tol2tlb_req      )
    ,.coretodc_ld_valid     (core1_slice0_coretodc_ld_valid     )
    ,.coretodc_ld_retry     (core1_slice0_coretodc_ld_retry     )
    ,.coretodc_ld           (core1_slice0_coretodc_ld           )
    ,.dctocore_ld_valid     (core1_slice0_dctocore_ld_valid     )
    ,.dctocore_ld_retry     (core1_slice0_dctocore_ld_retry     )
    ,.dctocore_ld           (core1_slice0_dctocore_ld           )
    ,.coretodc_std_valid    (core1_slice0_coretodc_std_valid    )
    ,.coretodc_std_retry    (core1_slice0_coretodc_std_retry    )
    ,.coretodc_std          (core1_slice0_coretodc_std          )
    ,.dctocore_std_ack_valid(core1_slice0_dctocore_std_ack_valid)
    ,.dctocore_std_ack_retry(core1_slice0_dctocore_std_ack_retry)
    ,.dctocore_std_ack      (core1_slice0_dctocore_std_ack      )
    ,.cachetopf_stats       (core1_slice0_pf0_dcstats      )
    ,.l1tlbtol1_fwd0_valid(core1_slice0_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core1_slice0_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core1_slice0_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core1_slice0_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core1_slice0_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core1_slice0_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core1_slice0_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core1_slice0_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core1_slice0_l1tlbtol1_cmd       )
  );
  wire core1_slice0_l1tlbtol1_fwd0_valid;
  wire core1_slice0_l1tlbtol1_fwd0_retry;
  I_l1tlbtol1_fwd_type core1_slice0_l1tlbtol1_fwd0      ;
  wire core1_slice0_l1tlbtol1_fwd1_valid;
  wire core1_slice0_l1tlbtol1_fwd1_retry;
  I_l1tlbtol1_fwd_type core1_slice0_l1tlbtol1_fwd1      ;
  wire core1_slice0_l1tlbtol1_cmd_valid ;
  wire core1_slice0_l1tlbtol1_cmd_retry ;
  I_l1tlbtol1_cmd_type core1_slice0_l1tlbtol1_cmd       ;
  wire core1_slice0_l2tlbtol1tlb_snoop_valid;
  wire core1_slice0_l2tlbtol1tlb_snoop_retry;
  I_l2tlbtol1tlb_snoop_type core1_slice0_l2tlbtol1tlb_snoop      ;
  wire core1_slice0_l2tlbtol1tlb_ack_valid  ;
  wire core1_slice0_l2tlbtol1tlb_ack_retry  ;
  I_l2tlbtol1tlb_ack_type   core1_slice0_l2tlbtol1tlb_ack        ;
  wire core1_slice0_l1tlbtol2tlb_req_valid  ;
  wire core1_slice0_l1tlbtol2tlb_req_retry  ;
   I_l1tlbtol2tlb_req_type  core1_slice0_l1tlbtol2tlb_req        ;
  wire core1_slice0_l1tlbtol2tlb_sack_valid ;
  wire core1_slice0_l1tlbtol2tlb_sack_retry ;
   I_l1tlbtol2tlb_sack_type core1_slice0_l1tlbtol2tlb_sack       ;
  wire core1_slice0_pftodc_req0_valid;
  wire core1_slice0_pftodc_req0_retry;
  I_pfetol1tlb_req_type    core1_slice0_pftodc_req0      ;
  dctlb dcltb_c1s0(
     .clk(clk)
    ,.reset(reset)
    ,.coretodctlb_ld_valid(c1_s0_coretodctlb_ld_valid)
    ,.coretodctlb_ld_retry(c1_s0_coretodctlb_ld_retry)
    ,.coretodctlb_ld      (c1_s0_coretodctlb_ld      )
    ,.coretodctlb_st_valid(c1_s0_coretodctlb_st_valid)
    ,.coretodctlb_st_retry(c1_s0_coretodctlb_st_retry)
    ,.coretodctlb_st      (c1_s0_coretodctlb_st      )
    ,.pfetol1tlb_req_valid   (core1_slice0_pftodc_req0_valid)
    ,.pfetol1tlb_req_retry   (core1_slice0_pftodc_req0_retry)
    ,.pfetol1tlb_req         (core1_slice0_pftodc_req0      )
    ,.l1tlbtol1_fwd0_valid(core1_slice0_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core1_slice0_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core1_slice0_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core1_slice0_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core1_slice0_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core1_slice0_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core1_slice0_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core1_slice0_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core1_slice0_l1tlbtol1_cmd       )
    ,.l2tlbtol1tlb_snoop_valid(core1_slice0_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core1_slice0_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core1_slice0_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core1_slice0_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core1_slice0_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core1_slice0_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core1_slice0_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core1_slice0_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core1_slice0_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core1_slice0_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core1_slice0_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core1_slice0_l1tlbtol2tlb_sack       )
  );
  wire core1_slice1_l1tol2_req_valid      ;
  wire core1_slice1_l1tol2_req_retry      ;
   I_l1tol2_req_type       core1_slice1_l1tol2_req            ;
  wire core1_slice1_l2tol1_snack_valid    ;
  wire core1_slice1_l2tol1_snack_retry    ;
   I_l2tol1_snack_type     core1_slice1_l2tol1_snack          ;
  wire core1_slice1_l1tol2_snoop_ack_valid;
  wire core1_slice1_l1tol2_snoop_ack_retry;
   I_l2snoop_ack_type      core1_slice1_l1tol2_snoop_ack      ;
  wire core1_slice1_l1tol2_disp_valid     ;
  wire core1_slice1_l1tol2_disp_retry     ;
   I_l1tol2_disp_type      core1_slice1_l1tol2_disp           ;
  wire core1_slice1_l2tol1_dack_valid     ;
  wire core1_slice1_l2tol1_dack_retry     ;
   I_l2tol1_dack_type      core1_slice1_l2tol1_dack           ;
  PF_cache_stats_type     core1_slice1_pf1_dcstats      ;
  wire core1_slice1_l1tol2tlb_req_valid;
  wire core1_slice1_l1tol2tlb_req_retry;
  I_l1tol2tlb_req_type core1_slice1_l1tol2tlb_req      ;
  dcache_pipe core1_slice1_dcache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core1_slice1_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core1_slice1_l1tol2_req_retry      )
    ,.l1tol2_req            (core1_slice1_l1tol2_req            )
    ,.l2tol1_snack_valid    (core1_slice1_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core1_slice1_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core1_slice1_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core1_slice1_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core1_slice1_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core1_slice1_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core1_slice1_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core1_slice1_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core1_slice1_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core1_slice1_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core1_slice1_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core1_slice1_l2tol1_dack           )
    ,.l1tol2tlb_req_valid(core1_slice1_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core1_slice1_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core1_slice1_l1tol2tlb_req      )
    ,.coretodc_ld_valid     (core1_slice1_coretodc_ld_valid     )
    ,.coretodc_ld_retry     (core1_slice1_coretodc_ld_retry     )
    ,.coretodc_ld           (core1_slice1_coretodc_ld           )
    ,.dctocore_ld_valid     (core1_slice1_dctocore_ld_valid     )
    ,.dctocore_ld_retry     (core1_slice1_dctocore_ld_retry     )
    ,.dctocore_ld           (core1_slice1_dctocore_ld           )
    ,.coretodc_std_valid    (core1_slice1_coretodc_std_valid    )
    ,.coretodc_std_retry    (core1_slice1_coretodc_std_retry    )
    ,.coretodc_std          (core1_slice1_coretodc_std          )
    ,.dctocore_std_ack_valid(core1_slice1_dctocore_std_ack_valid)
    ,.dctocore_std_ack_retry(core1_slice1_dctocore_std_ack_retry)
    ,.dctocore_std_ack      (core1_slice1_dctocore_std_ack      )
    ,.cachetopf_stats       (core1_slice1_pf1_dcstats      )
    ,.l1tlbtol1_fwd0_valid(core1_slice1_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core1_slice1_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core1_slice1_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core1_slice1_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core1_slice1_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core1_slice1_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core1_slice1_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core1_slice1_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core1_slice1_l1tlbtol1_cmd       )
  );
  wire core1_slice1_l1tlbtol1_fwd0_valid;
  wire core1_slice1_l1tlbtol1_fwd0_retry;
  I_l1tlbtol1_fwd_type core1_slice1_l1tlbtol1_fwd0      ;
  wire core1_slice1_l1tlbtol1_fwd1_valid;
  wire core1_slice1_l1tlbtol1_fwd1_retry;
  I_l1tlbtol1_fwd_type core1_slice1_l1tlbtol1_fwd1      ;
  wire core1_slice1_l1tlbtol1_cmd_valid ;
  wire core1_slice1_l1tlbtol1_cmd_retry ;
  I_l1tlbtol1_cmd_type core1_slice1_l1tlbtol1_cmd       ;
  wire core1_slice1_l2tlbtol1tlb_snoop_valid;
  wire core1_slice1_l2tlbtol1tlb_snoop_retry;
  I_l2tlbtol1tlb_snoop_type core1_slice1_l2tlbtol1tlb_snoop      ;
  wire core1_slice1_l2tlbtol1tlb_ack_valid  ;
  wire core1_slice1_l2tlbtol1tlb_ack_retry  ;
  I_l2tlbtol1tlb_ack_type   core1_slice1_l2tlbtol1tlb_ack        ;
  wire core1_slice1_l1tlbtol2tlb_req_valid  ;
  wire core1_slice1_l1tlbtol2tlb_req_retry  ;
   I_l1tlbtol2tlb_req_type  core1_slice1_l1tlbtol2tlb_req        ;
  wire core1_slice1_l1tlbtol2tlb_sack_valid ;
  wire core1_slice1_l1tlbtol2tlb_sack_retry ;
   I_l1tlbtol2tlb_sack_type core1_slice1_l1tlbtol2tlb_sack       ;
  wire core1_slice1_pftodc_req1_valid;
  wire core1_slice1_pftodc_req1_retry;
  I_pfetol1tlb_req_type    core1_slice1_pftodc_req1      ;
  dctlb dcltb_c1s1(
     .clk(clk)
    ,.reset(reset)
    ,.coretodctlb_ld_valid(c1_s1_coretodctlb_ld_valid)
    ,.coretodctlb_ld_retry(c1_s1_coretodctlb_ld_retry)
    ,.coretodctlb_ld      (c1_s1_coretodctlb_ld      )
    ,.coretodctlb_st_valid(c1_s1_coretodctlb_st_valid)
    ,.coretodctlb_st_retry(c1_s1_coretodctlb_st_retry)
    ,.coretodctlb_st      (c1_s1_coretodctlb_st      )
    ,.pfetol1tlb_req_valid   (core1_slice1_pftodc_req1_valid)
    ,.pfetol1tlb_req_retry   (core1_slice1_pftodc_req1_retry)
    ,.pfetol1tlb_req         (core1_slice1_pftodc_req1      )
    ,.l1tlbtol1_fwd0_valid(core1_slice1_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core1_slice1_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core1_slice1_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core1_slice1_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core1_slice1_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core1_slice1_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core1_slice1_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core1_slice1_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core1_slice1_l1tlbtol1_cmd       )
    ,.l2tlbtol1tlb_snoop_valid(core1_slice1_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core1_slice1_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core1_slice1_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core1_slice1_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core1_slice1_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core1_slice1_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core1_slice1_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core1_slice1_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core1_slice1_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core1_slice1_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core1_slice1_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core1_slice1_l1tlbtol2tlb_sack       )
  );
`ifdef SC_4PIPE
  wire core1_slice2_l1tol2_req_valid      ;
  wire core1_slice2_l1tol2_req_retry      ;
   I_l1tol2_req_type       core1_slice2_l1tol2_req            ;
  wire core1_slice2_l2tol1_snack_valid    ;
  wire core1_slice2_l2tol1_snack_retry    ;
   I_l2tol1_snack_type     core1_slice2_l2tol1_snack          ;
  wire core1_slice2_l1tol2_snoop_ack_valid;
  wire core1_slice2_l1tol2_snoop_ack_retry;
   I_l2snoop_ack_type      core1_slice2_l1tol2_snoop_ack      ;
  wire core1_slice2_l1tol2_disp_valid     ;
  wire core1_slice2_l1tol2_disp_retry     ;
   I_l1tol2_disp_type      core1_slice2_l1tol2_disp           ;
  wire core1_slice2_l2tol1_dack_valid     ;
  wire core1_slice2_l2tol1_dack_retry     ;
   I_l2tol1_dack_type      core1_slice2_l2tol1_dack           ;
  PF_cache_stats_type     core1_slice2_pf2_dcstats      ;
  wire core1_slice2_l1tol2tlb_req_valid;
  wire core1_slice2_l1tol2tlb_req_retry;
  I_l1tol2tlb_req_type core1_slice2_l1tol2tlb_req      ;
  dcache_pipe core1_slice2_dcache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core1_slice2_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core1_slice2_l1tol2_req_retry      )
    ,.l1tol2_req            (core1_slice2_l1tol2_req            )
    ,.l2tol1_snack_valid    (core1_slice2_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core1_slice2_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core1_slice2_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core1_slice2_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core1_slice2_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core1_slice2_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core1_slice2_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core1_slice2_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core1_slice2_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core1_slice2_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core1_slice2_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core1_slice2_l2tol1_dack           )
    ,.l1tol2tlb_req_valid(core1_slice2_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core1_slice2_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core1_slice2_l1tol2tlb_req      )
    ,.coretodc_ld_valid     (core1_slice2_coretodc_ld_valid     )
    ,.coretodc_ld_retry     (core1_slice2_coretodc_ld_retry     )
    ,.coretodc_ld           (core1_slice2_coretodc_ld           )
    ,.dctocore_ld_valid     (core1_slice2_dctocore_ld_valid     )
    ,.dctocore_ld_retry     (core1_slice2_dctocore_ld_retry     )
    ,.dctocore_ld           (core1_slice2_dctocore_ld           )
    ,.coretodc_std_valid    (core1_slice2_coretodc_std_valid    )
    ,.coretodc_std_retry    (core1_slice2_coretodc_std_retry    )
    ,.coretodc_std          (core1_slice2_coretodc_std          )
    ,.dctocore_std_ack_valid(core1_slice2_dctocore_std_ack_valid)
    ,.dctocore_std_ack_retry(core1_slice2_dctocore_std_ack_retry)
    ,.dctocore_std_ack      (core1_slice2_dctocore_std_ack      )
    ,.cachetopf_stats       (core1_slice2_pf2_dcstats      )
    ,.l1tlbtol1_fwd0_valid(core1_slice2_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core1_slice2_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core1_slice2_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core1_slice2_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core1_slice2_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core1_slice2_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core1_slice2_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core1_slice2_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core1_slice2_l1tlbtol1_cmd       )
  );
  wire core1_slice2_l1tlbtol1_fwd0_valid;
  wire core1_slice2_l1tlbtol1_fwd0_retry;
  I_l1tlbtol1_fwd_type core1_slice2_l1tlbtol1_fwd0      ;
  wire core1_slice2_l1tlbtol1_fwd1_valid;
  wire core1_slice2_l1tlbtol1_fwd1_retry;
  I_l1tlbtol1_fwd_type core1_slice2_l1tlbtol1_fwd1      ;
  wire core1_slice2_l1tlbtol1_cmd_valid ;
  wire core1_slice2_l1tlbtol1_cmd_retry ;
  I_l1tlbtol1_cmd_type core1_slice2_l1tlbtol1_cmd       ;
  wire core1_slice2_l2tlbtol1tlb_snoop_valid;
  wire core1_slice2_l2tlbtol1tlb_snoop_retry;
  I_l2tlbtol1tlb_snoop_type core1_slice2_l2tlbtol1tlb_snoop      ;
  wire core1_slice2_l2tlbtol1tlb_ack_valid  ;
  wire core1_slice2_l2tlbtol1tlb_ack_retry  ;
  I_l2tlbtol1tlb_ack_type   core1_slice2_l2tlbtol1tlb_ack        ;
  wire core1_slice2_l1tlbtol2tlb_req_valid  ;
  wire core1_slice2_l1tlbtol2tlb_req_retry  ;
   I_l1tlbtol2tlb_req_type  core1_slice2_l1tlbtol2tlb_req        ;
  wire core1_slice2_l1tlbtol2tlb_sack_valid ;
  wire core1_slice2_l1tlbtol2tlb_sack_retry ;
   I_l1tlbtol2tlb_sack_type core1_slice2_l1tlbtol2tlb_sack       ;
  wire core1_slice2_pftodc_req2_valid;
  wire core1_slice2_pftodc_req2_retry;
  I_pfetol1tlb_req_type    core1_slice2_pftodc_req2      ;
  dctlb dcltb_c1s2(
     .clk(clk)
    ,.reset(reset)
    ,.coretodctlb_ld_valid(c1_s2_coretodctlb_ld_valid)
    ,.coretodctlb_ld_retry(c1_s2_coretodctlb_ld_retry)
    ,.coretodctlb_ld      (c1_s2_coretodctlb_ld      )
    ,.coretodctlb_st_valid(c1_s2_coretodctlb_st_valid)
    ,.coretodctlb_st_retry(c1_s2_coretodctlb_st_retry)
    ,.coretodctlb_st      (c1_s2_coretodctlb_st      )
    ,.pfetol1tlb_req_valid   (core1_slice2_pftodc_req2_valid)
    ,.pfetol1tlb_req_retry   (core1_slice2_pftodc_req2_retry)
    ,.pfetol1tlb_req         (core1_slice2_pftodc_req2      )
    ,.l1tlbtol1_fwd0_valid(core1_slice2_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core1_slice2_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core1_slice2_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core1_slice2_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core1_slice2_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core1_slice2_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core1_slice2_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core1_slice2_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core1_slice2_l1tlbtol1_cmd       )
    ,.l2tlbtol1tlb_snoop_valid(core1_slice2_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core1_slice2_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core1_slice2_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core1_slice2_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core1_slice2_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core1_slice2_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core1_slice2_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core1_slice2_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core1_slice2_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core1_slice2_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core1_slice2_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core1_slice2_l1tlbtol2tlb_sack       )
  );
  wire core1_slice3_l1tol2_req_valid      ;
  wire core1_slice3_l1tol2_req_retry      ;
   I_l1tol2_req_type       core1_slice3_l1tol2_req            ;
  wire core1_slice3_l2tol1_snack_valid    ;
  wire core1_slice3_l2tol1_snack_retry    ;
   I_l2tol1_snack_type     core1_slice3_l2tol1_snack          ;
  wire core1_slice3_l1tol2_snoop_ack_valid;
  wire core1_slice3_l1tol2_snoop_ack_retry;
   I_l2snoop_ack_type      core1_slice3_l1tol2_snoop_ack      ;
  wire core1_slice3_l1tol2_disp_valid     ;
  wire core1_slice3_l1tol2_disp_retry     ;
   I_l1tol2_disp_type      core1_slice3_l1tol2_disp           ;
  wire core1_slice3_l2tol1_dack_valid     ;
  wire core1_slice3_l2tol1_dack_retry     ;
   I_l2tol1_dack_type      core1_slice3_l2tol1_dack           ;
  PF_cache_stats_type     core1_slice3_pf3_dcstats      ;
  wire core1_slice3_l1tol2tlb_req_valid;
  wire core1_slice3_l1tol2tlb_req_retry;
  I_l1tol2tlb_req_type core1_slice3_l1tol2tlb_req      ;
  dcache_pipe core1_slice3_dcache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core1_slice3_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core1_slice3_l1tol2_req_retry      )
    ,.l1tol2_req            (core1_slice3_l1tol2_req            )
    ,.l2tol1_snack_valid    (core1_slice3_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core1_slice3_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core1_slice3_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core1_slice3_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core1_slice3_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core1_slice3_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core1_slice3_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core1_slice3_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core1_slice3_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core1_slice3_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core1_slice3_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core1_slice3_l2tol1_dack           )
    ,.l1tol2tlb_req_valid(core1_slice3_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core1_slice3_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core1_slice3_l1tol2tlb_req      )
    ,.coretodc_ld_valid     (core1_slice3_coretodc_ld_valid     )
    ,.coretodc_ld_retry     (core1_slice3_coretodc_ld_retry     )
    ,.coretodc_ld           (core1_slice3_coretodc_ld           )
    ,.dctocore_ld_valid     (core1_slice3_dctocore_ld_valid     )
    ,.dctocore_ld_retry     (core1_slice3_dctocore_ld_retry     )
    ,.dctocore_ld           (core1_slice3_dctocore_ld           )
    ,.coretodc_std_valid    (core1_slice3_coretodc_std_valid    )
    ,.coretodc_std_retry    (core1_slice3_coretodc_std_retry    )
    ,.coretodc_std          (core1_slice3_coretodc_std          )
    ,.dctocore_std_ack_valid(core1_slice3_dctocore_std_ack_valid)
    ,.dctocore_std_ack_retry(core1_slice3_dctocore_std_ack_retry)
    ,.dctocore_std_ack      (core1_slice3_dctocore_std_ack      )
    ,.cachetopf_stats       (core1_slice3_pf3_dcstats      )
    ,.l1tlbtol1_fwd0_valid(core1_slice3_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core1_slice3_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core1_slice3_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core1_slice3_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core1_slice3_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core1_slice3_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core1_slice3_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core1_slice3_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core1_slice3_l1tlbtol1_cmd       )
  );
  wire core1_slice3_l1tlbtol1_fwd0_valid;
  wire core1_slice3_l1tlbtol1_fwd0_retry;
  I_l1tlbtol1_fwd_type core1_slice3_l1tlbtol1_fwd0      ;
  wire core1_slice3_l1tlbtol1_fwd1_valid;
  wire core1_slice3_l1tlbtol1_fwd1_retry;
  I_l1tlbtol1_fwd_type core1_slice3_l1tlbtol1_fwd1      ;
  wire core1_slice3_l1tlbtol1_cmd_valid ;
  wire core1_slice3_l1tlbtol1_cmd_retry ;
  I_l1tlbtol1_cmd_type core1_slice3_l1tlbtol1_cmd       ;
  wire core1_slice3_l2tlbtol1tlb_snoop_valid;
  wire core1_slice3_l2tlbtol1tlb_snoop_retry;
  I_l2tlbtol1tlb_snoop_type core1_slice3_l2tlbtol1tlb_snoop      ;
  wire core1_slice3_l2tlbtol1tlb_ack_valid  ;
  wire core1_slice3_l2tlbtol1tlb_ack_retry  ;
  I_l2tlbtol1tlb_ack_type   core1_slice3_l2tlbtol1tlb_ack        ;
  wire core1_slice3_l1tlbtol2tlb_req_valid  ;
  wire core1_slice3_l1tlbtol2tlb_req_retry  ;
   I_l1tlbtol2tlb_req_type  core1_slice3_l1tlbtol2tlb_req        ;
  wire core1_slice3_l1tlbtol2tlb_sack_valid ;
  wire core1_slice3_l1tlbtol2tlb_sack_retry ;
   I_l1tlbtol2tlb_sack_type core1_slice3_l1tlbtol2tlb_sack       ;
  wire core1_slice3_pftodc_req3_valid;
  wire core1_slice3_pftodc_req3_retry;
  I_pfetol1tlb_req_type    core1_slice3_pftodc_req3      ;
  dctlb dcltb_c1s3(
     .clk(clk)
    ,.reset(reset)
    ,.coretodctlb_ld_valid(c1_s3_coretodctlb_ld_valid)
    ,.coretodctlb_ld_retry(c1_s3_coretodctlb_ld_retry)
    ,.coretodctlb_ld      (c1_s3_coretodctlb_ld      )
    ,.coretodctlb_st_valid(c1_s3_coretodctlb_st_valid)
    ,.coretodctlb_st_retry(c1_s3_coretodctlb_st_retry)
    ,.coretodctlb_st      (c1_s3_coretodctlb_st      )
    ,.pfetol1tlb_req_valid   (core1_slice3_pftodc_req3_valid)
    ,.pfetol1tlb_req_retry   (core1_slice3_pftodc_req3_retry)
    ,.pfetol1tlb_req         (core1_slice3_pftodc_req3      )
    ,.l1tlbtol1_fwd0_valid(core1_slice3_l1tlbtol1_fwd0_valid)
    ,.l1tlbtol1_fwd0_retry(core1_slice3_l1tlbtol1_fwd0_retry)
    ,.l1tlbtol1_fwd0      (core1_slice3_l1tlbtol1_fwd0      )
    ,.l1tlbtol1_fwd1_valid(core1_slice3_l1tlbtol1_fwd1_valid)
    ,.l1tlbtol1_fwd1_retry(core1_slice3_l1tlbtol1_fwd1_retry)
    ,.l1tlbtol1_fwd1      (core1_slice3_l1tlbtol1_fwd1      )
    ,.l1tlbtol1_cmd_valid (core1_slice3_l1tlbtol1_cmd_valid )
    ,.l1tlbtol1_cmd_retry (core1_slice3_l1tlbtol1_cmd_retry )
    ,.l1tlbtol1_cmd       (core1_slice3_l1tlbtol1_cmd       )
    ,.l2tlbtol1tlb_snoop_valid(core1_slice3_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core1_slice3_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core1_slice3_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core1_slice3_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core1_slice3_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core1_slice3_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core1_slice3_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core1_slice3_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core1_slice3_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core1_slice3_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core1_slice3_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core1_slice3_l1tlbtol2tlb_sack       )
  );
`endif
  wire core1_l1tol2_req_valid      ;
  wire core1_l1tol2_req_retry      ;
  I_l1tol2_req_type    core1_l1tol2_req            ;
  wire core1_l2tol1_snack_valid    ;
  wire core1_l2tol1_snack_retry    ;
  I_l2tol1_snack_type  core1_l2tol1_snack          ;
  wire core1_l1tol2_snoop_ack_valid;
  wire core1_l1tol2_snoop_ack_retry;
  I_l2snoop_ack_type   core1_l1tol2_snoop_ack      ;
  wire core1_l1tlbtol1_fwd_valid;
  wire core1_l1tlbtol1_fwd_retry;
   I_l1tlbtol1_fwd_type core1_l1tlbtol1_fwd      ;
  wire core1_l1tlbtol1_cmd_valid;
  wire core1_l1tlbtol1_cmd_retry;
   I_l1tlbtol1_cmd_type core1_l1tlbtol1_cmd      ;
  wire core1_l1tol2tlb_req_valid;
  wire core1_l1tol2tlb_req_retry;
   I_l1tol2tlb_req_type core1_l1tol2tlb_req      ;
  PF_cache_stats_type core1_cachetopf_stats;
  icache core1_icache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core1_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core1_l1tol2_req_retry      )
    ,.l1tol2_req            (core1_l1tol2_req            )
    ,.l2tol1_snack_valid    (core1_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core1_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core1_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core1_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core1_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core1_l1tol2_snoop_ack      )
    ,.l1tlbtol1_fwd_valid(core1_l1tlbtol1_fwd_valid)
    ,.l1tlbtol1_fwd_retry(core1_l1tlbtol1_fwd_retry)
    ,.l1tlbtol1_fwd      (core1_l1tlbtol1_fwd      )
    ,.l1tlbtol1_cmd_valid(core1_l1tlbtol1_cmd_valid)
    ,.l1tlbtol1_cmd_retry(core1_l1tlbtol1_cmd_retry)
    ,.l1tlbtol1_cmd      (core1_l1tlbtol1_cmd      )
    ,.l1tol2tlb_req_valid(core1_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core1_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core1_l1tol2tlb_req      )
    ,.cachetopf_stats(core1_cachetopf_stats)
    ,.coretoic_pc_valid        (core1_coretoic_pc_valid        )
    ,.coretoic_pc_retry        (core1_coretoic_pc_retry        )
    ,.coretoic_pc              (core1_coretoic_pc              )
    ,.ictocore_valid        (core1_ictocore_valid        )
    ,.ictocore_retry        (core1_ictocore_retry        )
    ,.ictocore              (core1_ictocore              )
  );
  PF_cache_stats_type  core1_slice0_pf0_l2stats      ;
  wire core1_slice0_l2todr_req_valid      ;
  wire core1_slice0_l2todr_req_retry      ;
   I_l2todr_req_type    core1_slice0_l2todr_req            ;
  wire core1_slice0_drtol2_snack_valid    ;
  wire core1_slice0_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_slice0_drtol2_snack          ;
  wire core1_slice0_l2todr_disp_valid     ;
  wire core1_slice0_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_slice0_l2todr_disp           ;
  wire core1_slice0_drtol2_dack_valid     ;
  wire core1_slice0_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_slice0_drtol2_dack           ;
  wire core1_slice0_l2todr_snoop_ack_valid;
  wire core1_slice0_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_slice0_l2todr_snoop_ack      ;
  PF_cache_stats_type     core1_l2d_slice0_pf0_dcstats      ;
  wire core1_slice0_l2todr_pfreq_valid    ;
  wire core1_slice0_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core1_slice0_l2todr_pfreq          ;
  wire core1_slice0_l2tlbtol2_fwd_valid;
  wire core1_slice0_l2tlbtol2_fwd_retry;
   I_l2tlbtol2_fwd_type core1_slice0_l2tlbtol2_fwd      ;
  l2cache_pipe core1_l2d_slice0(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core1_slice0_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core1_slice0_l1tol2_req_retry      )
    ,.l1tol2_req            (core1_slice0_l1tol2_req            )
    ,.l2tol1_snack_valid    (core1_slice0_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core1_slice0_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core1_slice0_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core1_slice0_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core1_slice0_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core1_slice0_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core1_slice0_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core1_slice0_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core1_slice0_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core1_slice0_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core1_slice0_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core1_slice0_l2tol1_dack           )
    ,.l2todr_pfreq_valid    (core1_slice0_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core1_slice0_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core1_slice0_l2todr_pfreq          )
    ,.l2tlbtol2_fwd_valid(core1_slice0_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core1_slice0_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core1_slice0_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core1_slice0_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_slice0_l2todr_req_retry      )
    ,.l2todr_req            (core1_slice0_l2todr_req            )
    ,.drtol2_snack_valid    (core1_slice0_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_slice0_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_slice0_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_slice0_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_slice0_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_slice0_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_slice0_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_slice0_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_slice0_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_slice0_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_slice0_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_slice0_l2todr_snoop_ack      )
    ,.cachetopf_stats   (core1_slice0_pf0_l2stats      )
  );
  wire core1_slice0_l2tlb_l2todr_req_valid      ;
  wire core1_slice0_l2tlb_l2todr_req_retry      ;
   I_l2todr_req_type    core1_slice0_l2tlb_l2todr_req            ;
  wire core1_slice0_l2tlb_drtol2_snack_valid    ;
  wire core1_slice0_l2tlb_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_slice0_l2tlb_drtol2_snack          ;
  wire core1_slice0_l2tlb_l2todr_disp_valid     ;
  wire core1_slice0_l2tlb_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_slice0_l2tlb_l2todr_disp           ;
  wire core1_slice0_l2tlb_drtol2_dack_valid     ;
  wire core1_slice0_l2tlb_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_slice0_l2tlb_drtol2_dack           ;
  wire core1_slice0_l2tlb_l2todr_snoop_ack_valid;
  wire core1_slice0_l2tlb_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_slice0_l2tlb_l2todr_snoop_ack      ;
  l2tlb l2tlb_core1_slice0(
     .clk(clk)
    ,.reset(reset)
    ,.l2tlbtol1tlb_snoop_valid(core1_slice0_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core1_slice0_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core1_slice0_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core1_slice0_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core1_slice0_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core1_slice0_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core1_slice0_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core1_slice0_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core1_slice0_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core1_slice0_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core1_slice0_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core1_slice0_l1tlbtol2tlb_sack       )
    ,.l1tol2tlb_req_valid(core1_slice0_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core1_slice0_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core1_slice0_l1tol2tlb_req      )
    ,.l2tlbtol2_fwd_valid(core1_slice0_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core1_slice0_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core1_slice0_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core1_slice0_l2tlb_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_slice0_l2tlb_l2todr_req_retry      )
    ,.l2todr_req            (core1_slice0_l2tlb_l2todr_req            )
    ,.drtol2_snack_valid    (core1_slice0_l2tlb_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_slice0_l2tlb_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_slice0_l2tlb_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_slice0_l2tlb_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_slice0_l2tlb_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_slice0_l2tlb_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_slice0_l2tlb_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_slice0_l2tlb_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_slice0_l2tlb_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_slice0_l2tlb_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_slice0_l2tlb_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_slice0_l2tlb_l2todr_snoop_ack      )
  );
  PF_cache_stats_type  core1_slice1_pf1_l2stats      ;
  wire core1_slice1_l2todr_req_valid      ;
  wire core1_slice1_l2todr_req_retry      ;
   I_l2todr_req_type    core1_slice1_l2todr_req            ;
  wire core1_slice1_drtol2_snack_valid    ;
  wire core1_slice1_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_slice1_drtol2_snack          ;
  wire core1_slice1_l2todr_disp_valid     ;
  wire core1_slice1_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_slice1_l2todr_disp           ;
  wire core1_slice1_drtol2_dack_valid     ;
  wire core1_slice1_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_slice1_drtol2_dack           ;
  wire core1_slice1_l2todr_snoop_ack_valid;
  wire core1_slice1_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_slice1_l2todr_snoop_ack      ;
  PF_cache_stats_type     core1_l2d_slice1_pf1_dcstats      ;
  wire core1_slice1_l2todr_pfreq_valid    ;
  wire core1_slice1_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core1_slice1_l2todr_pfreq          ;
  wire core1_slice1_l2tlbtol2_fwd_valid;
  wire core1_slice1_l2tlbtol2_fwd_retry;
   I_l2tlbtol2_fwd_type core1_slice1_l2tlbtol2_fwd      ;
  l2cache_pipe core1_l2d_slice1(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core1_slice1_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core1_slice1_l1tol2_req_retry      )
    ,.l1tol2_req            (core1_slice1_l1tol2_req            )
    ,.l2tol1_snack_valid    (core1_slice1_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core1_slice1_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core1_slice1_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core1_slice1_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core1_slice1_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core1_slice1_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core1_slice1_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core1_slice1_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core1_slice1_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core1_slice1_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core1_slice1_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core1_slice1_l2tol1_dack           )
    ,.l2todr_pfreq_valid    (core1_slice1_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core1_slice1_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core1_slice1_l2todr_pfreq          )
    ,.l2tlbtol2_fwd_valid(core1_slice1_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core1_slice1_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core1_slice1_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core1_slice1_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_slice1_l2todr_req_retry      )
    ,.l2todr_req            (core1_slice1_l2todr_req            )
    ,.drtol2_snack_valid    (core1_slice1_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_slice1_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_slice1_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_slice1_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_slice1_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_slice1_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_slice1_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_slice1_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_slice1_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_slice1_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_slice1_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_slice1_l2todr_snoop_ack      )
    ,.cachetopf_stats   (core1_slice1_pf1_l2stats      )
  );
  wire core1_slice1_l2tlb_l2todr_req_valid      ;
  wire core1_slice1_l2tlb_l2todr_req_retry      ;
   I_l2todr_req_type    core1_slice1_l2tlb_l2todr_req            ;
  wire core1_slice1_l2tlb_drtol2_snack_valid    ;
  wire core1_slice1_l2tlb_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_slice1_l2tlb_drtol2_snack          ;
  wire core1_slice1_l2tlb_l2todr_disp_valid     ;
  wire core1_slice1_l2tlb_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_slice1_l2tlb_l2todr_disp           ;
  wire core1_slice1_l2tlb_drtol2_dack_valid     ;
  wire core1_slice1_l2tlb_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_slice1_l2tlb_drtol2_dack           ;
  wire core1_slice1_l2tlb_l2todr_snoop_ack_valid;
  wire core1_slice1_l2tlb_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_slice1_l2tlb_l2todr_snoop_ack      ;
  l2tlb l2tlb_core1_slice1(
     .clk(clk)
    ,.reset(reset)
    ,.l2tlbtol1tlb_snoop_valid(core1_slice1_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core1_slice1_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core1_slice1_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core1_slice1_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core1_slice1_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core1_slice1_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core1_slice1_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core1_slice1_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core1_slice1_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core1_slice1_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core1_slice1_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core1_slice1_l1tlbtol2tlb_sack       )
    ,.l1tol2tlb_req_valid(core1_slice1_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core1_slice1_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core1_slice1_l1tol2tlb_req      )
    ,.l2tlbtol2_fwd_valid(core1_slice1_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core1_slice1_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core1_slice1_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core1_slice1_l2tlb_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_slice1_l2tlb_l2todr_req_retry      )
    ,.l2todr_req            (core1_slice1_l2tlb_l2todr_req            )
    ,.drtol2_snack_valid    (core1_slice1_l2tlb_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_slice1_l2tlb_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_slice1_l2tlb_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_slice1_l2tlb_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_slice1_l2tlb_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_slice1_l2tlb_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_slice1_l2tlb_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_slice1_l2tlb_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_slice1_l2tlb_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_slice1_l2tlb_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_slice1_l2tlb_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_slice1_l2tlb_l2todr_snoop_ack      )
  );
`ifdef SC_4PIPE
  PF_cache_stats_type  core1_slice2_pf2_l2stats      ;
  wire core1_slice2_l2todr_req_valid      ;
  wire core1_slice2_l2todr_req_retry      ;
   I_l2todr_req_type    core1_slice2_l2todr_req            ;
  wire core1_slice2_drtol2_snack_valid    ;
  wire core1_slice2_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_slice2_drtol2_snack          ;
  wire core1_slice2_l2todr_disp_valid     ;
  wire core1_slice2_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_slice2_l2todr_disp           ;
  wire core1_slice2_drtol2_dack_valid     ;
  wire core1_slice2_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_slice2_drtol2_dack           ;
  wire core1_slice2_l2todr_snoop_ack_valid;
  wire core1_slice2_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_slice2_l2todr_snoop_ack      ;
  PF_cache_stats_type     core1_l2d_slice2_pf2_dcstats      ;
  wire core1_slice2_l2todr_pfreq_valid    ;
  wire core1_slice2_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core1_slice2_l2todr_pfreq          ;
  wire core1_slice2_l2tlbtol2_fwd_valid;
  wire core1_slice2_l2tlbtol2_fwd_retry;
   I_l2tlbtol2_fwd_type core1_slice2_l2tlbtol2_fwd      ;
  l2cache_pipe core1_l2d_slice2(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core1_slice2_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core1_slice2_l1tol2_req_retry      )
    ,.l1tol2_req            (core1_slice2_l1tol2_req            )
    ,.l2tol1_snack_valid    (core1_slice2_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core1_slice2_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core1_slice2_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core1_slice2_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core1_slice2_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core1_slice2_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core1_slice2_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core1_slice2_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core1_slice2_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core1_slice2_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core1_slice2_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core1_slice2_l2tol1_dack           )
    ,.l2todr_pfreq_valid    (core1_slice2_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core1_slice2_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core1_slice2_l2todr_pfreq          )
    ,.l2tlbtol2_fwd_valid(core1_slice2_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core1_slice2_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core1_slice2_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core1_slice2_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_slice2_l2todr_req_retry      )
    ,.l2todr_req            (core1_slice2_l2todr_req            )
    ,.drtol2_snack_valid    (core1_slice2_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_slice2_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_slice2_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_slice2_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_slice2_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_slice2_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_slice2_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_slice2_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_slice2_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_slice2_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_slice2_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_slice2_l2todr_snoop_ack      )
    ,.cachetopf_stats   (core1_slice2_pf2_l2stats      )
  );
  wire core1_slice2_l2tlb_l2todr_req_valid      ;
  wire core1_slice2_l2tlb_l2todr_req_retry      ;
   I_l2todr_req_type    core1_slice2_l2tlb_l2todr_req            ;
  wire core1_slice2_l2tlb_drtol2_snack_valid    ;
  wire core1_slice2_l2tlb_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_slice2_l2tlb_drtol2_snack          ;
  wire core1_slice2_l2tlb_l2todr_disp_valid     ;
  wire core1_slice2_l2tlb_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_slice2_l2tlb_l2todr_disp           ;
  wire core1_slice2_l2tlb_drtol2_dack_valid     ;
  wire core1_slice2_l2tlb_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_slice2_l2tlb_drtol2_dack           ;
  wire core1_slice2_l2tlb_l2todr_snoop_ack_valid;
  wire core1_slice2_l2tlb_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_slice2_l2tlb_l2todr_snoop_ack      ;
  l2tlb l2tlb_core1_slice2(
     .clk(clk)
    ,.reset(reset)
    ,.l2tlbtol1tlb_snoop_valid(core1_slice2_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core1_slice2_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core1_slice2_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core1_slice2_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core1_slice2_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core1_slice2_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core1_slice2_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core1_slice2_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core1_slice2_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core1_slice2_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core1_slice2_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core1_slice2_l1tlbtol2tlb_sack       )
    ,.l1tol2tlb_req_valid(core1_slice2_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core1_slice2_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core1_slice2_l1tol2tlb_req      )
    ,.l2tlbtol2_fwd_valid(core1_slice2_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core1_slice2_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core1_slice2_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core1_slice2_l2tlb_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_slice2_l2tlb_l2todr_req_retry      )
    ,.l2todr_req            (core1_slice2_l2tlb_l2todr_req            )
    ,.drtol2_snack_valid    (core1_slice2_l2tlb_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_slice2_l2tlb_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_slice2_l2tlb_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_slice2_l2tlb_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_slice2_l2tlb_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_slice2_l2tlb_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_slice2_l2tlb_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_slice2_l2tlb_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_slice2_l2tlb_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_slice2_l2tlb_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_slice2_l2tlb_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_slice2_l2tlb_l2todr_snoop_ack      )
  );
  PF_cache_stats_type  core1_slice3_pf3_l2stats      ;
  wire core1_slice3_l2todr_req_valid      ;
  wire core1_slice3_l2todr_req_retry      ;
   I_l2todr_req_type    core1_slice3_l2todr_req            ;
  wire core1_slice3_drtol2_snack_valid    ;
  wire core1_slice3_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_slice3_drtol2_snack          ;
  wire core1_slice3_l2todr_disp_valid     ;
  wire core1_slice3_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_slice3_l2todr_disp           ;
  wire core1_slice3_drtol2_dack_valid     ;
  wire core1_slice3_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_slice3_drtol2_dack           ;
  wire core1_slice3_l2todr_snoop_ack_valid;
  wire core1_slice3_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_slice3_l2todr_snoop_ack      ;
  PF_cache_stats_type     core1_l2d_slice3_pf3_dcstats      ;
  wire core1_slice3_l2todr_pfreq_valid    ;
  wire core1_slice3_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core1_slice3_l2todr_pfreq          ;
  wire core1_slice3_l2tlbtol2_fwd_valid;
  wire core1_slice3_l2tlbtol2_fwd_retry;
   I_l2tlbtol2_fwd_type core1_slice3_l2tlbtol2_fwd      ;
  l2cache_pipe core1_l2d_slice3(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core1_slice3_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core1_slice3_l1tol2_req_retry      )
    ,.l1tol2_req            (core1_slice3_l1tol2_req            )
    ,.l2tol1_snack_valid    (core1_slice3_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core1_slice3_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core1_slice3_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core1_slice3_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core1_slice3_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core1_slice3_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid     (core1_slice3_l1tol2_disp_valid     )
    ,.l1tol2_disp_retry     (core1_slice3_l1tol2_disp_retry     )
    ,.l1tol2_disp           (core1_slice3_l1tol2_disp           )
    ,.l2tol1_dack_valid     (core1_slice3_l2tol1_dack_valid     )
    ,.l2tol1_dack_retry     (core1_slice3_l2tol1_dack_retry     )
    ,.l2tol1_dack           (core1_slice3_l2tol1_dack           )
    ,.l2todr_pfreq_valid    (core1_slice3_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core1_slice3_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core1_slice3_l2todr_pfreq          )
    ,.l2tlbtol2_fwd_valid(core1_slice3_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core1_slice3_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core1_slice3_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core1_slice3_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_slice3_l2todr_req_retry      )
    ,.l2todr_req            (core1_slice3_l2todr_req            )
    ,.drtol2_snack_valid    (core1_slice3_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_slice3_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_slice3_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_slice3_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_slice3_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_slice3_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_slice3_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_slice3_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_slice3_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_slice3_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_slice3_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_slice3_l2todr_snoop_ack      )
    ,.cachetopf_stats   (core1_slice3_pf3_l2stats      )
  );
  wire core1_slice3_l2tlb_l2todr_req_valid      ;
  wire core1_slice3_l2tlb_l2todr_req_retry      ;
   I_l2todr_req_type    core1_slice3_l2tlb_l2todr_req            ;
  wire core1_slice3_l2tlb_drtol2_snack_valid    ;
  wire core1_slice3_l2tlb_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_slice3_l2tlb_drtol2_snack          ;
  wire core1_slice3_l2tlb_l2todr_disp_valid     ;
  wire core1_slice3_l2tlb_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_slice3_l2tlb_l2todr_disp           ;
  wire core1_slice3_l2tlb_drtol2_dack_valid     ;
  wire core1_slice3_l2tlb_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_slice3_l2tlb_drtol2_dack           ;
  wire core1_slice3_l2tlb_l2todr_snoop_ack_valid;
  wire core1_slice3_l2tlb_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_slice3_l2tlb_l2todr_snoop_ack      ;
  l2tlb l2tlb_core1_slice3(
     .clk(clk)
    ,.reset(reset)
    ,.l2tlbtol1tlb_snoop_valid(core1_slice3_l2tlbtol1tlb_snoop_valid)
    ,.l2tlbtol1tlb_snoop_retry(core1_slice3_l2tlbtol1tlb_snoop_retry)
    ,.l2tlbtol1tlb_snoop      (core1_slice3_l2tlbtol1tlb_snoop      )
    ,.l2tlbtol1tlb_ack_valid  (core1_slice3_l2tlbtol1tlb_ack_valid  )
    ,.l2tlbtol1tlb_ack_retry  (core1_slice3_l2tlbtol1tlb_ack_retry  )
    ,.l2tlbtol1tlb_ack        (core1_slice3_l2tlbtol1tlb_ack        )
    ,.l1tlbtol2tlb_req_valid  (core1_slice3_l1tlbtol2tlb_req_valid  )
    ,.l1tlbtol2tlb_req_retry  (core1_slice3_l1tlbtol2tlb_req_retry  )
    ,.l1tlbtol2tlb_req        (core1_slice3_l1tlbtol2tlb_req        )
    ,.l1tlbtol2tlb_sack_valid (core1_slice3_l1tlbtol2tlb_sack_valid )
    ,.l1tlbtol2tlb_sack_retry (core1_slice3_l1tlbtol2tlb_sack_retry )
    ,.l1tlbtol2tlb_sack       (core1_slice3_l1tlbtol2tlb_sack       )
    ,.l1tol2tlb_req_valid(core1_slice3_l1tol2tlb_req_valid)
    ,.l1tol2tlb_req_retry(core1_slice3_l1tol2tlb_req_retry)
    ,.l1tol2tlb_req      (core1_slice3_l1tol2tlb_req      )
    ,.l2tlbtol2_fwd_valid(core1_slice3_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core1_slice3_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core1_slice3_l2tlbtol2_fwd      )
    ,.l2todr_req_valid      (core1_slice3_l2tlb_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_slice3_l2tlb_l2todr_req_retry      )
    ,.l2todr_req            (core1_slice3_l2tlb_l2todr_req            )
    ,.drtol2_snack_valid    (core1_slice3_l2tlb_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_slice3_l2tlb_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_slice3_l2tlb_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_slice3_l2tlb_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_slice3_l2tlb_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_slice3_l2tlb_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_slice3_l2tlb_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_slice3_l2tlb_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_slice3_l2tlb_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_slice3_l2tlb_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_slice3_l2tlb_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_slice3_l2tlb_l2todr_snoop_ack      )
  );
`endif
  PF_cache_stats_type  core1_icache_pficache_l2stats      ;
  wire core1_icache_l2tlbtol2_fwd_valid;
  wire core1_icache_l2tlbtol2_fwd_retry;
   I_l2tlbtol2_fwd_type core1_icache_l2tlbtol2_fwd      ;
  wire core1_icache_l2todr_pfreq_valid    ;
  wire core1_icache_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core1_icache_l2todr_pfreq          ;
  wire unconnected_1_icache_l1tol2_disp_retry ;
  wire unconnected_1_icache_l2tol1_dack_valid ;
  I_l2tol1_dack_type  unconnected_1_icache_l2tol1_dack       ;
  wire core1_icache_l2todr_req_valid      ;
  wire core1_icache_l2todr_req_retry      ;
   I_l2todr_req_type    core1_icache_l2todr_req            ;
  wire core1_icache_drtol2_snack_valid    ;
  wire core1_icache_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_icache_drtol2_snack          ;
  wire core1_icache_l2todr_disp_valid     ;
  wire core1_icache_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_icache_l2todr_disp           ;
  wire core1_icache_drtol2_dack_valid     ;
  wire core1_icache_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_icache_drtol2_dack           ;
  wire core1_icache_l2todr_snoop_ack_valid;
  wire core1_icache_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_icache_l2todr_snoop_ack      ;
  l2cache_pipe core1_l2icache(
     .clk(clk)
    ,.reset(reset)
    ,.l1tol2_req_valid      (core1_l1tol2_req_valid      )
    ,.l1tol2_req_retry      (core1_l1tol2_req_retry      )
    ,.l1tol2_req            (core1_l1tol2_req            )
    ,.l2tol1_snack_valid    (core1_l2tol1_snack_valid    )
    ,.l2tol1_snack_retry    (core1_l2tol1_snack_retry    )
    ,.l2tol1_snack          (core1_l2tol1_snack          )
    ,.l1tol2_snoop_ack_valid(core1_l1tol2_snoop_ack_valid)
    ,.l1tol2_snoop_ack_retry(core1_l1tol2_snoop_ack_retry)
    ,.l1tol2_snoop_ack      (core1_l1tol2_snoop_ack      )
    ,.l1tol2_disp_valid(1'b0)
    ,.l1tol2_disp      ({$bits(I_l1tol2_disp_type) {1'b0}})
    ,.l2tol1_dack_retry(1'b0)
    ,.l2todr_req_valid      (core1_icache_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_icache_l2todr_req_retry      )
    ,.l2todr_req            (core1_icache_l2todr_req            )
    ,.drtol2_snack_valid    (core1_icache_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_icache_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_icache_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_icache_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_icache_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_icache_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_icache_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_icache_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_icache_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_icache_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_icache_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_icache_l2todr_snoop_ack      )
    ,.l2tlbtol2_fwd_valid(core1_icache_l2tlbtol2_fwd_valid)
    ,.l2tlbtol2_fwd_retry(core1_icache_l2tlbtol2_fwd_retry)
    ,.l2tlbtol2_fwd      (core1_icache_l2tlbtol2_fwd      )
    ,.l2todr_pfreq_valid    (core1_icache_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core1_icache_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core1_icache_l2todr_pfreq          )
    ,.cachetopf_stats   (core1_icache_pficache_l2stats      )
    ,.l1tol2_disp_retry (unconnected_1_icache_l1tol2_disp_retry )
    ,.l2tol1_dack_valid (unconnected_1_icache_l2tol1_dack_valid )
    ,.l2tol1_dack       (unconnected_1_icache_l2tol1_dack       )
  );
  wire core1_l2todr_req_valid      ;
  wire core1_l2todr_req_retry      ;
   I_l2todr_req_type    core1_l2todr_req            ;
  wire core1_drtol2_snack_valid    ;
  wire core1_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_drtol2_snack          ;
  wire core1_l2todr_disp_valid     ;
  wire core1_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_l2todr_disp           ;
  wire core1_drtol2_dack_valid     ;
  wire core1_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_drtol2_dack           ;
  wire core1_l2todr_snoop_ack_valid;
  wire core1_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_l2todr_snoop_ack      ;
  wire core1_l2todr_pfreq_valid    ;
  wire core1_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  core1_l2todr_pfreq          ;
  arbl2 l2arbiter_core1(
     .clk(clk)
    ,.reset(reset)
    ,.l2d_0todr_req_valid      (core1_slice0_l2todr_req_valid      )
    ,.l2d_0todr_req_retry      (core1_slice0_l2todr_req_retry      )
    ,.l2d_0todr_req            (core1_slice0_l2todr_req            )
    ,.drtol2d_0_snack_valid    (core1_slice0_drtol2_snack_valid    )
    ,.drtol2d_0_snack_retry    (core1_slice0_drtol2_snack_retry    )
    ,.drtol2d_0_snack          (core1_slice0_drtol2_snack          )
    ,.l2d_0todr_disp_valid     (core1_slice0_l2todr_disp_valid     )
    ,.l2d_0todr_disp_retry     (core1_slice0_l2todr_disp_retry     )
    ,.l2d_0todr_disp           (core1_slice0_l2todr_disp           )
    ,.drtol2d_0_dack_valid     (core1_slice0_drtol2_dack_valid     )
    ,.drtol2d_0_dack_retry     (core1_slice0_drtol2_dack_retry     )
    ,.drtol2d_0_dack           (core1_slice0_drtol2_dack           )
    ,.l2d_0todr_snoop_ack_valid(core1_slice0_l2todr_snoop_ack_valid)
    ,.l2d_0todr_snoop_ack_retry(core1_slice0_l2todr_snoop_ack_retry)
    ,.l2d_0todr_snoop_ack      (core1_slice0_l2todr_snoop_ack      )
    ,.l2d_0todr_pfreq_valid    (core1_slice0_l2todr_pfreq_valid    )
    ,.l2d_0todr_pfreq_retry    (core1_slice0_l2todr_pfreq_retry    )
    ,.l2d_0todr_pfreq          (core1_slice0_l2todr_pfreq          )
    ,.l2d_1todr_req_valid      (core1_slice1_l2todr_req_valid      )
    ,.l2d_1todr_req_retry      (core1_slice1_l2todr_req_retry      )
    ,.l2d_1todr_req            (core1_slice1_l2todr_req            )
    ,.drtol2d_1_snack_valid    (core1_slice1_drtol2_snack_valid    )
    ,.drtol2d_1_snack_retry    (core1_slice1_drtol2_snack_retry    )
    ,.drtol2d_1_snack          (core1_slice1_drtol2_snack          )
    ,.l2d_1todr_disp_valid     (core1_slice1_l2todr_disp_valid     )
    ,.l2d_1todr_disp_retry     (core1_slice1_l2todr_disp_retry     )
    ,.l2d_1todr_disp           (core1_slice1_l2todr_disp           )
    ,.drtol2d_1_dack_valid     (core1_slice1_drtol2_dack_valid     )
    ,.drtol2d_1_dack_retry     (core1_slice1_drtol2_dack_retry     )
    ,.drtol2d_1_dack           (core1_slice1_drtol2_dack           )
    ,.l2d_1todr_snoop_ack_valid(core1_slice1_l2todr_snoop_ack_valid)
    ,.l2d_1todr_snoop_ack_retry(core1_slice1_l2todr_snoop_ack_retry)
    ,.l2d_1todr_snoop_ack      (core1_slice1_l2todr_snoop_ack      )
    ,.l2d_1todr_pfreq_valid    (core1_slice1_l2todr_pfreq_valid    )
    ,.l2d_1todr_pfreq_retry    (core1_slice1_l2todr_pfreq_retry    )
    ,.l2d_1todr_pfreq          (core1_slice1_l2todr_pfreq          )
`ifdef SC_4PIPE
    ,.l2d_2todr_req_valid      (core1_slice2_l2todr_req_valid      )
    ,.l2d_2todr_req_retry      (core1_slice2_l2todr_req_retry      )
    ,.l2d_2todr_req            (core1_slice2_l2todr_req            )
    ,.drtol2d_2_snack_valid    (core1_slice2_drtol2_snack_valid    )
    ,.drtol2d_2_snack_retry    (core1_slice2_drtol2_snack_retry    )
    ,.drtol2d_2_snack          (core1_slice2_drtol2_snack          )
    ,.l2d_2todr_disp_valid     (core1_slice2_l2todr_disp_valid     )
    ,.l2d_2todr_disp_retry     (core1_slice2_l2todr_disp_retry     )
    ,.l2d_2todr_disp           (core1_slice2_l2todr_disp           )
    ,.drtol2d_2_dack_valid     (core1_slice2_drtol2_dack_valid     )
    ,.drtol2d_2_dack_retry     (core1_slice2_drtol2_dack_retry     )
    ,.drtol2d_2_dack           (core1_slice2_drtol2_dack           )
    ,.l2d_2todr_snoop_ack_valid(core1_slice2_l2todr_snoop_ack_valid)
    ,.l2d_2todr_snoop_ack_retry(core1_slice2_l2todr_snoop_ack_retry)
    ,.l2d_2todr_snoop_ack      (core1_slice2_l2todr_snoop_ack      )
    ,.l2d_2todr_pfreq_valid    (core1_slice2_l2todr_pfreq_valid    )
    ,.l2d_2todr_pfreq_retry    (core1_slice2_l2todr_pfreq_retry    )
    ,.l2d_2todr_pfreq          (core1_slice2_l2todr_pfreq          )
    ,.l2d_3todr_req_valid      (core1_slice3_l2todr_req_valid      )
    ,.l2d_3todr_req_retry      (core1_slice3_l2todr_req_retry      )
    ,.l2d_3todr_req            (core1_slice3_l2todr_req            )
    ,.drtol2d_3_snack_valid    (core1_slice3_drtol2_snack_valid    )
    ,.drtol2d_3_snack_retry    (core1_slice3_drtol2_snack_retry    )
    ,.drtol2d_3_snack          (core1_slice3_drtol2_snack          )
    ,.l2d_3todr_disp_valid     (core1_slice3_l2todr_disp_valid     )
    ,.l2d_3todr_disp_retry     (core1_slice3_l2todr_disp_retry     )
    ,.l2d_3todr_disp           (core1_slice3_l2todr_disp           )
    ,.drtol2d_3_dack_valid     (core1_slice3_drtol2_dack_valid     )
    ,.drtol2d_3_dack_retry     (core1_slice3_drtol2_dack_retry     )
    ,.drtol2d_3_dack           (core1_slice3_drtol2_dack           )
    ,.l2d_3todr_snoop_ack_valid(core1_slice3_l2todr_snoop_ack_valid)
    ,.l2d_3todr_snoop_ack_retry(core1_slice3_l2todr_snoop_ack_retry)
    ,.l2d_3todr_snoop_ack      (core1_slice3_l2todr_snoop_ack      )
    ,.l2d_3todr_pfreq_valid    (core1_slice3_l2todr_pfreq_valid    )
    ,.l2d_3todr_pfreq_retry    (core1_slice3_l2todr_pfreq_retry    )
    ,.l2d_3todr_pfreq          (core1_slice3_l2todr_pfreq          )
`endif
    ,.l2todr_req_valid      (core1_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_l2todr_req_retry      )
    ,.l2todr_req            (core1_l2todr_req            )
    ,.drtol2_snack_valid    (core1_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_l2todr_snoop_ack      )
    ,.l2todr_pfreq_valid    (core1_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (core1_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (core1_l2todr_pfreq          )
);
  wire core1_l2tlb_l2todr_req_valid      ;
  wire core1_l2tlb_l2todr_req_retry      ;
   I_l2todr_req_type    core1_l2tlb_l2todr_req            ;
  wire core1_l2tlb_drtol2_snack_valid    ;
  wire core1_l2tlb_drtol2_snack_retry    ;
   I_drtol2_snack_type  core1_l2tlb_drtol2_snack          ;
  wire core1_l2tlb_l2todr_disp_valid     ;
  wire core1_l2tlb_l2todr_disp_retry     ;
   I_l2todr_disp_type   core1_l2tlb_l2todr_disp           ;
  wire core1_l2tlb_drtol2_dack_valid     ;
  wire core1_l2tlb_drtol2_dack_retry     ;
   I_drtol2_dack_type   core1_l2tlb_drtol2_dack           ;
  wire core1_l2tlb_l2todr_snoop_ack_valid;
  wire core1_l2tlb_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   core1_l2tlb_l2todr_snoop_ack      ;
  arbl2tlb l2tlbarbiter_core1(
     .clk(clk)
    ,.reset(reset)
    ,.l2d_0todr_req_valid      (core1_slice0_l2tlb_l2todr_req_valid      )
    ,.l2d_0todr_req_retry      (core1_slice0_l2tlb_l2todr_req_retry      )
    ,.l2d_0todr_req            (core1_slice0_l2tlb_l2todr_req            )
    ,.drtol2d_0_snack_valid    (core1_slice0_l2tlb_drtol2_snack_valid    )
    ,.drtol2d_0_snack_retry    (core1_slice0_l2tlb_drtol2_snack_retry    )
    ,.drtol2d_0_snack          (core1_slice0_l2tlb_drtol2_snack          )
    ,.l2d_0todr_disp_valid     (core1_slice0_l2tlb_l2todr_disp_valid     )
    ,.l2d_0todr_disp_retry     (core1_slice0_l2tlb_l2todr_disp_retry     )
    ,.l2d_0todr_disp           (core1_slice0_l2tlb_l2todr_disp           )
    ,.drtol2d_0_dack_valid     (core1_slice0_l2tlb_drtol2_dack_valid     )
    ,.drtol2d_0_dack_retry     (core1_slice0_l2tlb_drtol2_dack_retry     )
    ,.drtol2d_0_dack           (core1_slice0_l2tlb_drtol2_dack           )
    ,.l2d_0todr_snoop_ack_valid(core1_slice0_l2tlb_l2todr_snoop_ack_valid)
    ,.l2d_0todr_snoop_ack_retry(core1_slice0_l2tlb_l2todr_snoop_ack_retry)
    ,.l2d_0todr_snoop_ack      (core1_slice0_l2tlb_l2todr_snoop_ack      )
    ,.l2d_1todr_req_valid      (core1_slice1_l2tlb_l2todr_req_valid      )
    ,.l2d_1todr_req_retry      (core1_slice1_l2tlb_l2todr_req_retry      )
    ,.l2d_1todr_req            (core1_slice1_l2tlb_l2todr_req            )
    ,.drtol2d_1_snack_valid    (core1_slice1_l2tlb_drtol2_snack_valid    )
    ,.drtol2d_1_snack_retry    (core1_slice1_l2tlb_drtol2_snack_retry    )
    ,.drtol2d_1_snack          (core1_slice1_l2tlb_drtol2_snack          )
    ,.l2d_1todr_disp_valid     (core1_slice1_l2tlb_l2todr_disp_valid     )
    ,.l2d_1todr_disp_retry     (core1_slice1_l2tlb_l2todr_disp_retry     )
    ,.l2d_1todr_disp           (core1_slice1_l2tlb_l2todr_disp           )
    ,.drtol2d_1_dack_valid     (core1_slice1_l2tlb_drtol2_dack_valid     )
    ,.drtol2d_1_dack_retry     (core1_slice1_l2tlb_drtol2_dack_retry     )
    ,.drtol2d_1_dack           (core1_slice1_l2tlb_drtol2_dack           )
    ,.l2d_1todr_snoop_ack_valid(core1_slice1_l2tlb_l2todr_snoop_ack_valid)
    ,.l2d_1todr_snoop_ack_retry(core1_slice1_l2tlb_l2todr_snoop_ack_retry)
    ,.l2d_1todr_snoop_ack      (core1_slice1_l2tlb_l2todr_snoop_ack      )
`ifdef SC_4PIPE
    ,.l2d_2todr_req_valid      (core1_slice2_l2tlb_l2todr_req_valid      )
    ,.l2d_2todr_req_retry      (core1_slice2_l2tlb_l2todr_req_retry      )
    ,.l2d_2todr_req            (core1_slice2_l2tlb_l2todr_req            )
    ,.drtol2d_2_snack_valid    (core1_slice2_l2tlb_drtol2_snack_valid    )
    ,.drtol2d_2_snack_retry    (core1_slice2_l2tlb_drtol2_snack_retry    )
    ,.drtol2d_2_snack          (core1_slice2_l2tlb_drtol2_snack          )
    ,.l2d_2todr_disp_valid     (core1_slice2_l2tlb_l2todr_disp_valid     )
    ,.l2d_2todr_disp_retry     (core1_slice2_l2tlb_l2todr_disp_retry     )
    ,.l2d_2todr_disp           (core1_slice2_l2tlb_l2todr_disp           )
    ,.drtol2d_2_dack_valid     (core1_slice2_l2tlb_drtol2_dack_valid     )
    ,.drtol2d_2_dack_retry     (core1_slice2_l2tlb_drtol2_dack_retry     )
    ,.drtol2d_2_dack           (core1_slice2_l2tlb_drtol2_dack           )
    ,.l2d_2todr_snoop_ack_valid(core1_slice2_l2tlb_l2todr_snoop_ack_valid)
    ,.l2d_2todr_snoop_ack_retry(core1_slice2_l2tlb_l2todr_snoop_ack_retry)
    ,.l2d_2todr_snoop_ack      (core1_slice2_l2tlb_l2todr_snoop_ack      )
    ,.l2d_3todr_req_valid      (core1_slice3_l2tlb_l2todr_req_valid      )
    ,.l2d_3todr_req_retry      (core1_slice3_l2tlb_l2todr_req_retry      )
    ,.l2d_3todr_req            (core1_slice3_l2tlb_l2todr_req            )
    ,.drtol2d_3_snack_valid    (core1_slice3_l2tlb_drtol2_snack_valid    )
    ,.drtol2d_3_snack_retry    (core1_slice3_l2tlb_drtol2_snack_retry    )
    ,.drtol2d_3_snack          (core1_slice3_l2tlb_drtol2_snack          )
    ,.l2d_3todr_disp_valid     (core1_slice3_l2tlb_l2todr_disp_valid     )
    ,.l2d_3todr_disp_retry     (core1_slice3_l2tlb_l2todr_disp_retry     )
    ,.l2d_3todr_disp           (core1_slice3_l2tlb_l2todr_disp           )
    ,.drtol2d_3_dack_valid     (core1_slice3_l2tlb_drtol2_dack_valid     )
    ,.drtol2d_3_dack_retry     (core1_slice3_l2tlb_drtol2_dack_retry     )
    ,.drtol2d_3_dack           (core1_slice3_l2tlb_drtol2_dack           )
    ,.l2d_3todr_snoop_ack_valid(core1_slice3_l2tlb_l2todr_snoop_ack_valid)
    ,.l2d_3todr_snoop_ack_retry(core1_slice3_l2tlb_l2todr_snoop_ack_retry)
    ,.l2d_3todr_snoop_ack      (core1_slice3_l2tlb_l2todr_snoop_ack      )
`endif
    ,.l2todr_req_valid      (core1_l2tlb_l2todr_req_valid      )
    ,.l2todr_req_retry      (core1_l2tlb_l2todr_req_retry      )
    ,.l2todr_req            (core1_l2tlb_l2todr_req            )
    ,.drtol2_snack_valid    (core1_l2tlb_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (core1_l2tlb_drtol2_snack_retry    )
    ,.drtol2_snack          (core1_l2tlb_drtol2_snack          )
    ,.l2todr_disp_valid     (core1_l2tlb_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (core1_l2tlb_l2todr_disp_retry     )
    ,.l2todr_disp           (core1_l2tlb_l2todr_disp           )
    ,.drtol2_dack_valid     (core1_l2tlb_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (core1_l2tlb_drtol2_dack_retry     )
    ,.drtol2_dack           (core1_l2tlb_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(core1_l2tlb_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(core1_l2tlb_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (core1_l2tlb_l2todr_snoop_ack      )
  );
  PF_cache_stats_type  unconnected_pfe1_pf_dcstats       ;
  PF_cache_stats_type  unconnected_pfe1_pf_l2stats       ;
  pfengine core1_pfe(
     .clk(clk)
    ,.reset(reset)
    ,.pfgtopfe_op_valid(core1_pfgtopfe_op_valid)
    ,.pfgtopfe_op_retry(core1_pfgtopfe_op_retry)
    ,.pfgtopfe_op      (core1_pfgtopfe_op      )
    ,.pf0_l2stats      (core1_slice0_pf0_l2stats      )
    ,.pftodc_req0_valid(core1_slice0_pftodc_req0_valid)
    ,.pftodc_req0_retry(core1_slice0_pftodc_req0_retry)
    ,.pftodc_req0      (core1_slice0_pftodc_req0      )
    ,.pf0_dcstats      (core1_slice0_pf0_dcstats      )
    ,.pf1_l2stats      (core1_slice1_pf1_l2stats      )
    ,.pftodc_req1_valid(core1_slice1_pftodc_req1_valid)
    ,.pftodc_req1_retry(core1_slice1_pftodc_req1_retry)
    ,.pftodc_req1      (core1_slice1_pftodc_req1      )
    ,.pf1_dcstats      (core1_slice1_pf1_dcstats      )
`ifdef SC_4PIPE
    ,.pf2_l2stats      (core1_slice2_pf2_l2stats      )
    ,.pftodc_req2_valid(core1_slice2_pftodc_req2_valid)
    ,.pftodc_req2_retry(core1_slice2_pftodc_req2_retry)
    ,.pftodc_req2      (core1_slice2_pftodc_req2      )
    ,.pf2_dcstats      (core1_slice2_pf2_dcstats      )
    ,.pf3_l2stats      (core1_slice3_pf3_l2stats      )
    ,.pftodc_req3_valid(core1_slice3_pftodc_req3_valid)
    ,.pftodc_req3_retry(core1_slice3_pftodc_req3_retry)
    ,.pftodc_req3      (core1_slice3_pftodc_req3      )
    ,.pf3_dcstats      (core1_slice3_pf3_dcstats      )
`endif
    ,.pf_dcstats       (unconnected_pfe1_pf_dcstats       )
    ,.pf_l2stats       (unconnected_pfe1_pf_l2stats       )
  );
  directory_bank dr_0(
     .clk(clk)
    ,.reset(reset)
    ,.l2todr_req_valid      (dr0_l2todr_req_valid      )
    ,.l2todr_req_retry      (dr0_l2todr_req_retry      )
    ,.l2todr_req            (dr0_l2todr_req            )
    ,.drtol2_snack_valid    (dr0_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (dr0_drtol2_snack_retry    )
    ,.drtol2_snack          (dr0_drtol2_snack          )
    ,.l2todr_disp_valid     (dr0_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (dr0_l2todr_disp_retry     )
    ,.l2todr_disp           (dr0_l2todr_disp           )
    ,.drtol2_dack_valid     (dr0_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (dr0_drtol2_dack_retry     )
    ,.drtol2_dack           (dr0_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(dr0_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(dr0_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (dr0_l2todr_snoop_ack      )
    ,.l2todr_pfreq_valid    (dr0_tlb_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (dr0_tlb_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (dr0_tlb_l2todr_pfreq          )
    ,.drtomem_req_valid     (dr0_drtomem_req_valid     )
    ,.drtomem_req_retry     (dr0_drtomem_req_retry     )
    ,.drtomem_req           (dr0_drtomem_req           )
    ,.memtodr_ack_valid     (dr0_memtodr_ack_valid     )
    ,.memtodr_ack_retry     (dr0_memtodr_ack_retry     )
    ,.memtodr_ack           (dr0_memtodr_ack           )
    ,.drtomem_wb_valid      (dr0_drtomem_wb_valid      )
    ,.drtomem_wb_retry      (dr0_drtomem_wb_retry      )
    ,.drtomem_wb            (dr0_drtomem_wb            )
    ,.drtomem_pfreq_valid   (dr0_drtomem_pfreq_valid   )
    ,.drtomem_pfreq_retry   (dr0_drtomem_pfreq_retry   )
    ,.drtomem_pfreq         (dr0_drtomem_pfreq         )
  );
  directory_bank dr_1(
     .clk(clk)
    ,.reset(reset)
    ,.l2todr_req_valid      (dr1_l2todr_req_valid      )
    ,.l2todr_req_retry      (dr1_l2todr_req_retry      )
    ,.l2todr_req            (dr1_l2todr_req            )
    ,.drtol2_snack_valid    (dr1_drtol2_snack_valid    )
    ,.drtol2_snack_retry    (dr1_drtol2_snack_retry    )
    ,.drtol2_snack          (dr1_drtol2_snack          )
    ,.l2todr_disp_valid     (dr1_l2todr_disp_valid     )
    ,.l2todr_disp_retry     (dr1_l2todr_disp_retry     )
    ,.l2todr_disp           (dr1_l2todr_disp           )
    ,.drtol2_dack_valid     (dr1_drtol2_dack_valid     )
    ,.drtol2_dack_retry     (dr1_drtol2_dack_retry     )
    ,.drtol2_dack           (dr1_drtol2_dack           )
    ,.l2todr_snoop_ack_valid(dr1_l2todr_snoop_ack_valid)
    ,.l2todr_snoop_ack_retry(dr1_l2todr_snoop_ack_retry)
    ,.l2todr_snoop_ack      (dr1_l2todr_snoop_ack      )
    ,.l2todr_pfreq_valid    (dr1_tlb_l2todr_pfreq_valid    )
    ,.l2todr_pfreq_retry    (dr1_tlb_l2todr_pfreq_retry    )
    ,.l2todr_pfreq          (dr1_tlb_l2todr_pfreq          )
    ,.drtomem_req_valid     (dr1_drtomem_req_valid     )
    ,.drtomem_req_retry     (dr1_drtomem_req_retry     )
    ,.drtomem_req           (dr1_drtomem_req           )
    ,.memtodr_ack_valid     (dr1_memtodr_ack_valid     )
    ,.memtodr_ack_retry     (dr1_memtodr_ack_retry     )
    ,.memtodr_ack           (dr1_memtodr_ack           )
    ,.drtomem_wb_valid      (dr1_drtomem_wb_valid      )
    ,.drtomem_wb_retry      (dr1_drtomem_wb_retry      )
    ,.drtomem_wb            (dr1_drtomem_wb            )
    ,.drtomem_pfreq_valid   (dr1_drtomem_pfreq_valid   )
    ,.drtomem_pfreq_retry   (dr1_drtomem_pfreq_retry   )
    ,.drtomem_pfreq         (dr1_drtomem_pfreq         )
  );
  wire dr0_l2todr_req_valid      ;
  wire dr0_l2todr_req_retry      ;
   I_l2todr_req_type    dr0_l2todr_req            ;
  wire dr0_drtol2_snack_valid    ;
  wire dr0_drtol2_snack_retry    ;
   I_drtol2_snack_type  dr0_drtol2_snack          ;
  wire dr0_l2todr_disp_valid     ;
  wire dr0_l2todr_disp_retry     ;
   I_l2todr_disp_type   dr0_l2todr_disp           ;
  wire dr0_drtol2_dack_valid     ;
  wire dr0_drtol2_dack_retry     ;
   I_drtol2_dack_type   dr0_drtol2_dack           ;
  wire dr0_l2todr_snoop_ack_valid;
  wire dr0_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   dr0_l2todr_snoop_ack      ;
  wire dr0_tlb_l2todr_pfreq_valid    ;
  wire dr0_tlb_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  dr0_tlb_l2todr_pfreq          ;
  wire dr1_l2todr_req_valid      ;
  wire dr1_l2todr_req_retry      ;
   I_l2todr_req_type    dr1_l2todr_req            ;
  wire dr1_drtol2_snack_valid    ;
  wire dr1_drtol2_snack_retry    ;
   I_drtol2_snack_type  dr1_drtol2_snack          ;
  wire dr1_l2todr_disp_valid     ;
  wire dr1_l2todr_disp_retry     ;
   I_l2todr_disp_type   dr1_l2todr_disp           ;
  wire dr1_drtol2_dack_valid     ;
  wire dr1_drtol2_dack_retry     ;
   I_drtol2_dack_type   dr1_drtol2_dack           ;
  wire dr1_l2todr_snoop_ack_valid;
  wire dr1_l2todr_snoop_ack_retry;
   I_drsnoop_ack_type   dr1_l2todr_snoop_ack      ;
  wire dr1_tlb_l2todr_pfreq_valid    ;
  wire dr1_tlb_l2todr_pfreq_retry    ;
   I_l2todr_pfreq_type  dr1_tlb_l2todr_pfreq          ;
  net_2core2dr network(
     .clk(clk)
    ,.reset(reset)
    // core 0 l2i and l2d
    ,.c0_l2itodr_req_valid      (core0_icache_l2todr_req_valid      )
    ,.c0_l2itodr_req_retry      (core0_icache_l2todr_req_retry      )
    ,.c0_l2itodr_req            (core0_icache_l2todr_req            )
    ,.c0_drtol2i_snack_valid    (core0_icache_drtol2_snack_valid    )
    ,.c0_drtol2i_snack_retry    (core0_icache_drtol2_snack_retry    )
    ,.c0_drtol2i_snack          (core0_icache_drtol2_snack          )
    ,.c0_l2itodr_disp_valid     (core0_icache_l2todr_disp_valid     )
    ,.c0_l2itodr_disp_retry     (core0_icache_l2todr_disp_retry     )
    ,.c0_l2itodr_disp           (core0_icache_l2todr_disp           )
    ,.c0_drtol2i_dack_valid     (core0_icache_drtol2_dack_valid     )
    ,.c0_drtol2i_dack_retry     (core0_icache_drtol2_dack_retry     )
    ,.c0_drtol2i_dack           (core0_icache_drtol2_dack           )
    ,.c0_l2itodr_snoop_ack_valid(core0_icache_l2todr_snoop_ack_valid)
    ,.c0_l2itodr_snoop_ack_retry(core0_icache_l2todr_snoop_ack_retry)
    ,.c0_l2itodr_snoop_ack      (core0_icache_l2todr_snoop_ack      )
    ,.c0_l2ittodr_req_valid      (core0_icache_l2todr_req_valid      )
    ,.c0_l2ittodr_req_retry      (core0_icache_l2todr_req_retry      )
    ,.c0_l2ittodr_req            (core0_icache_l2todr_req            )
    ,.c0_drtol2it_snack_valid    (core0_icache_drtol2_snack_valid    )
    ,.c0_drtol2it_snack_retry    (core0_icache_drtol2_snack_retry    )
    ,.c0_drtol2it_snack          (core0_icache_drtol2_snack          )
    ,.c0_l2ittodr_disp_valid     (core0_icache_l2todr_disp_valid     )
    ,.c0_l2ittodr_disp_retry     (core0_icache_l2todr_disp_retry     )
    ,.c0_l2ittodr_disp           (core0_icache_l2todr_disp           )
    ,.c0_drtol2it_dack_valid     (core0_icache_drtol2_dack_valid     )
    ,.c0_drtol2it_dack_retry     (core0_icache_drtol2_dack_retry     )
    ,.c0_drtol2it_dack           (core0_icache_drtol2_dack           )
    ,.c0_l2ittodr_snoop_ack_valid(core0_icache_l2todr_snoop_ack_valid)
    ,.c0_l2ittodr_snoop_ack_retry(core0_icache_l2todr_snoop_ack_retry)
    ,.c0_l2ittodr_snoop_ack      (core0_icache_l2todr_snoop_ack      )
    ,.c0_l2itodr_pfreq_valid    (core0_icache_l2todr_pfreq_valid    )
    ,.c0_l2itodr_pfreq_retry    (core0_icache_l2todr_pfreq_retry    )
    ,.c0_l2itodr_pfreq          (core0_icache_l2todr_pfreq          )
    ,.c0_l2d_0todr_req_valid      (core0_l2todr_req_valid      )
    ,.c0_l2d_0todr_req_retry      (core0_l2todr_req_retry      )
    ,.c0_l2d_0todr_req            (core0_l2todr_req            )
    ,.c0_drtol2d_0_snack_valid    (core0_drtol2_snack_valid    )
    ,.c0_drtol2d_0_snack_retry    (core0_drtol2_snack_retry    )
    ,.c0_drtol2d_0_snack          (core0_drtol2_snack          )
    ,.c0_l2d_0todr_disp_valid     (core0_l2todr_disp_valid     )
    ,.c0_l2d_0todr_disp_retry     (core0_l2todr_disp_retry     )
    ,.c0_l2d_0todr_disp           (core0_l2todr_disp           )
    ,.c0_drtol2d_0_dack_valid     (core0_drtol2_dack_valid     )
    ,.c0_drtol2d_0_dack_retry     (core0_drtol2_dack_retry     )
    ,.c0_drtol2d_0_dack           (core0_drtol2_dack           )
    ,.c0_l2d_0todr_snoop_ack_valid(core0_l2todr_snoop_ack_valid)
    ,.c0_l2d_0todr_snoop_ack_retry(core0_l2todr_snoop_ack_retry)
    ,.c0_l2d_0todr_snoop_ack      (core0_l2todr_snoop_ack      )
    ,.c0_l2d_0todr_pfreq_valid    (core0_l2todr_pfreq_valid    )
    ,.c0_l2d_0todr_pfreq_retry    (core0_l2todr_pfreq_retry    )
    ,.c0_l2d_0todr_pfreq          (core0_l2todr_pfreq          )
    ,.c0_l2dt_0todr_req_valid      (core0_l2tlb_l2todr_req_valid      )
    ,.c0_l2dt_0todr_req_retry      (core0_l2tlb_l2todr_req_retry      )
    ,.c0_l2dt_0todr_req            (core0_l2tlb_l2todr_req            )
    ,.c0_drtol2dt_0_snack_valid    (core0_l2tlb_drtol2_snack_valid    )
    ,.c0_drtol2dt_0_snack_retry    (core0_l2tlb_drtol2_snack_retry    )
    ,.c0_drtol2dt_0_snack          (core0_l2tlb_drtol2_snack          )
    ,.c0_l2dt_0todr_disp_valid     (core0_l2tlb_l2todr_disp_valid     )
    ,.c0_l2dt_0todr_disp_retry     (core0_l2tlb_l2todr_disp_retry     )
    ,.c0_l2dt_0todr_disp           (core0_l2tlb_l2todr_disp           )
    ,.c0_drtol2dt_0_dack_valid     (core0_l2tlb_drtol2_dack_valid     )
    ,.c0_drtol2dt_0_dack_retry     (core0_l2tlb_drtol2_dack_retry     )
    ,.c0_drtol2dt_0_dack           (core0_l2tlb_drtol2_dack           )
    ,.c0_l2dt_0todr_snoop_ack_valid(core0_l2tlb_l2todr_snoop_ack_valid)
    ,.c0_l2dt_0todr_snoop_ack_retry(core0_l2tlb_l2todr_snoop_ack_retry)
    ,.c0_l2dt_0todr_snoop_ack      (core0_l2tlb_l2todr_snoop_ack      )
    // core 1 l2i and l2d
    ,.c1_l2itodr_req_valid      (core1_icache_l2todr_req_valid      )
    ,.c1_l2itodr_req_retry      (core1_icache_l2todr_req_retry      )
    ,.c1_l2itodr_req            (core1_icache_l2todr_req            )
    ,.c1_drtol2i_snack_valid    (core1_icache_drtol2_snack_valid    )
    ,.c1_drtol2i_snack_retry    (core1_icache_drtol2_snack_retry    )
    ,.c1_drtol2i_snack          (core1_icache_drtol2_snack          )
    ,.c1_l2itodr_disp_valid     (core1_icache_l2todr_disp_valid     )
    ,.c1_l2itodr_disp_retry     (core1_icache_l2todr_disp_retry     )
    ,.c1_l2itodr_disp           (core1_icache_l2todr_disp           )
    ,.c1_drtol2i_dack_valid     (core1_icache_drtol2_dack_valid     )
    ,.c1_drtol2i_dack_retry     (core1_icache_drtol2_dack_retry     )
    ,.c1_drtol2i_dack           (core1_icache_drtol2_dack           )
    ,.c1_l2itodr_snoop_ack_valid(core1_icache_l2todr_snoop_ack_valid)
    ,.c1_l2itodr_snoop_ack_retry(core1_icache_l2todr_snoop_ack_retry)
    ,.c1_l2itodr_snoop_ack      (core1_icache_l2todr_snoop_ack      )
    ,.c1_l2ittodr_req_valid      (core1_icache_l2todr_req_valid      )
    ,.c1_l2ittodr_req_retry      (core1_icache_l2todr_req_retry      )
    ,.c1_l2ittodr_req            (core1_icache_l2todr_req            )
    ,.c1_drtol2it_snack_valid    (core1_icache_drtol2_snack_valid    )
    ,.c1_drtol2it_snack_retry    (core1_icache_drtol2_snack_retry    )
    ,.c1_drtol2it_snack          (core1_icache_drtol2_snack          )
    ,.c1_l2ittodr_disp_valid     (core1_icache_l2todr_disp_valid     )
    ,.c1_l2ittodr_disp_retry     (core1_icache_l2todr_disp_retry     )
    ,.c1_l2ittodr_disp           (core1_icache_l2todr_disp           )
    ,.c1_drtol2it_dack_valid     (core1_icache_drtol2_dack_valid     )
    ,.c1_drtol2it_dack_retry     (core1_icache_drtol2_dack_retry     )
    ,.c1_drtol2it_dack           (core1_icache_drtol2_dack           )
    ,.c1_l2ittodr_snoop_ack_valid(core1_icache_l2todr_snoop_ack_valid)
    ,.c1_l2ittodr_snoop_ack_retry(core1_icache_l2todr_snoop_ack_retry)
    ,.c1_l2ittodr_snoop_ack      (core1_icache_l2todr_snoop_ack      )
    ,.c1_l2itodr_pfreq_valid    (core1_icache_l2todr_pfreq_valid    )
    ,.c1_l2itodr_pfreq_retry    (core1_icache_l2todr_pfreq_retry    )
    ,.c1_l2itodr_pfreq          (core1_icache_l2todr_pfreq          )
    ,.c1_l2d_0todr_req_valid      (core1_l2todr_req_valid      )
    ,.c1_l2d_0todr_req_retry      (core1_l2todr_req_retry      )
    ,.c1_l2d_0todr_req            (core1_l2todr_req            )
    ,.c1_drtol2d_0_snack_valid    (core1_drtol2_snack_valid    )
    ,.c1_drtol2d_0_snack_retry    (core1_drtol2_snack_retry    )
    ,.c1_drtol2d_0_snack          (core1_drtol2_snack          )
    ,.c1_l2d_0todr_disp_valid     (core1_l2todr_disp_valid     )
    ,.c1_l2d_0todr_disp_retry     (core1_l2todr_disp_retry     )
    ,.c1_l2d_0todr_disp           (core1_l2todr_disp           )
    ,.c1_drtol2d_0_dack_valid     (core1_drtol2_dack_valid     )
    ,.c1_drtol2d_0_dack_retry     (core1_drtol2_dack_retry     )
    ,.c1_drtol2d_0_dack           (core1_drtol2_dack           )
    ,.c1_l2d_0todr_snoop_ack_valid(core1_l2todr_snoop_ack_valid)
    ,.c1_l2d_0todr_snoop_ack_retry(core1_l2todr_snoop_ack_retry)
    ,.c1_l2d_0todr_snoop_ack      (core1_l2todr_snoop_ack      )
    ,.c1_l2d_0todr_pfreq_valid    (core1_l2todr_pfreq_valid    )
    ,.c1_l2d_0todr_pfreq_retry    (core1_l2todr_pfreq_retry    )
    ,.c1_l2d_0todr_pfreq          (core1_l2todr_pfreq          )
    ,.c1_l2dt_0todr_req_valid      (core1_l2tlb_l2todr_req_valid      )
    ,.c1_l2dt_0todr_req_retry      (core1_l2tlb_l2todr_req_retry      )
    ,.c1_l2dt_0todr_req            (core1_l2tlb_l2todr_req            )
    ,.c1_drtol2dt_0_snack_valid    (core1_l2tlb_drtol2_snack_valid    )
    ,.c1_drtol2dt_0_snack_retry    (core1_l2tlb_drtol2_snack_retry    )
    ,.c1_drtol2dt_0_snack          (core1_l2tlb_drtol2_snack          )
    ,.c1_l2dt_0todr_disp_valid     (core1_l2tlb_l2todr_disp_valid     )
    ,.c1_l2dt_0todr_disp_retry     (core1_l2tlb_l2todr_disp_retry     )
    ,.c1_l2dt_0todr_disp           (core1_l2tlb_l2todr_disp           )
    ,.c1_drtol2dt_0_dack_valid     (core1_l2tlb_drtol2_dack_valid     )
    ,.c1_drtol2dt_0_dack_retry     (core1_l2tlb_drtol2_dack_retry     )
    ,.c1_drtol2dt_0_dack           (core1_l2tlb_drtol2_dack           )
    ,.c1_l2dt_0todr_snoop_ack_valid(core1_l2tlb_l2todr_snoop_ack_valid)
    ,.c1_l2dt_0todr_snoop_ack_retry(core1_l2tlb_l2todr_snoop_ack_retry)
    ,.c1_l2dt_0todr_snoop_ack      (core1_l2tlb_l2todr_snoop_ack      )
    // Directory 0 interface
    ,.l2todr0_req_valid      (dr0_l2todr_req_valid      )
    ,.l2todr0_req_retry      (dr0_l2todr_req_retry      )
    ,.l2todr0_req            (dr0_l2todr_req            )
    ,.dr0tol2_snack_valid    (dr0_drtol2_snack_valid    )
    ,.dr0tol2_snack_retry    (dr0_drtol2_snack_retry    )
    ,.dr0tol2_snack          (dr0_drtol2_snack          )
    ,.l2todr0_disp_valid     (dr0_l2todr_disp_valid     )
    ,.l2todr0_disp_retry     (dr0_l2todr_disp_retry     )
    ,.l2todr0_disp           (dr0_l2todr_disp           )
    ,.dr0tol2_dack_valid     (dr0_drtol2_dack_valid     )
    ,.dr0tol2_dack_retry     (dr0_drtol2_dack_retry     )
    ,.dr0tol2_dack           (dr0_drtol2_dack           )
    ,.l2todr0_snoop_ack_valid(dr0_l2todr_snoop_ack_valid)
    ,.l2todr0_snoop_ack_retry(dr0_l2todr_snoop_ack_retry)
    ,.l2todr0_snoop_ack      (dr0_l2todr_snoop_ack      )
    ,.l2todr0_pfreq_valid    (dr0_tlb_l2todr_pfreq_valid    )
    ,.l2todr0_pfreq_retry    (dr0_tlb_l2todr_pfreq_retry    )
    ,.l2todr0_pfreq          (dr0_tlb_l2todr_pfreq          )
    // Directory 1 interface
    ,.l2todr1_req_valid      (dr1_l2todr_req_valid      )
    ,.l2todr1_req_retry      (dr1_l2todr_req_retry      )
    ,.l2todr1_req            (dr1_l2todr_req            )
    ,.dr1tol2_snack_valid    (dr1_drtol2_snack_valid    )
    ,.dr1tol2_snack_retry    (dr1_drtol2_snack_retry    )
    ,.dr1tol2_snack          (dr1_drtol2_snack          )
    ,.l2todr1_disp_valid     (dr1_l2todr_disp_valid     )
    ,.l2todr1_disp_retry     (dr1_l2todr_disp_retry     )
    ,.l2todr1_disp           (dr1_l2todr_disp           )
    ,.dr1tol2_dack_valid     (dr1_drtol2_dack_valid     )
    ,.dr1tol2_dack_retry     (dr1_drtol2_dack_retry     )
    ,.dr1tol2_dack           (dr1_drtol2_dack           )
    ,.l2todr1_snoop_ack_valid(dr1_l2todr_snoop_ack_valid)
    ,.l2todr1_snoop_ack_retry(dr1_l2todr_snoop_ack_retry)
    ,.l2todr1_snoop_ack      (dr1_l2todr_snoop_ack      )
    ,.l2todr1_pfreq_valid    (dr1_tlb_l2todr_pfreq_valid    )
    ,.l2todr1_pfreq_retry    (dr1_tlb_l2todr_pfreq_retry    )
    ,.l2todr1_pfreq          (dr1_tlb_l2todr_pfreq          )
  );
  /* verilator lint_on UNUSED */
  /* verilator lint_on UNDRIVEN */
endmodule