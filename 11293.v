module integration_2core2dr(
  /* verilator lint_off UNUSED */
  /* verilator lint_off UNDRIVEN */
    input   logic               clk
    ,input  logic               reset
   // icache core 0
    ,input  logic               core0_coretoic_pc_valid
    ,output logic               core0_coretoic_pc_retry
    //  ,input  I_coretoic_pc_type  core0_coretoic_pc
    ,input  CORE_reqid_type     core0_coretoic_pc_coreid
    ,input  SC_poffset_type     core0_coretoic_pc_poffset
    ,output logic               core0_ictocore_valid
    ,input  logic               core0_ictocore_retry
    //  ,output I_ictocore_type      core0_ictocore
    ,output CORE_reqid_type     core0_ictocore_coreid
    ,output SC_fault_type       core0_ictocore_fault
    ,output IC_fwidth_type      core0_ictocore_data
   // dcache core 0, slice 0
    ,input  logic               core0_slice0_coretodc_ld_valid
    ,output logic               core0_slice0_coretodc_ld_retry
    //  ,input   I_coretodc_ld_type      core0_slice0_coretodc_ld
    ,input  DC_ckpid_type       core0_slice0_coretodc_ld_ckpid
    ,input  CORE_reqid_type     core0_slice0_coretodc_ld_coreid
    ,input  CORE_lop_type       core0_slice0_coretodc_ld_lop
    ,input  logic               core0_slice0_coretodc_ld_pnr
    ,input  SC_pcsign_type      core0_slice0_coretodc_ld_pcsign
    ,input  SC_poffset_type     core0_slice0_coretodc_ld_poffset
    ,input  SC_imm_type         core0_slice0_coretodc_ld_imm
    ,output logic               core0_slice0_dctocore_ld_valid
    ,input  logic               core0_slice0_dctocore_ld_retry
    //  ,output  I_dctocore_ld_type      core0_slice0_dctocore_ld
    ,output CORE_reqid_type     core0_slice0_dctocore_ld_coreid
    ,output SC_fault_type       core0_slice0_dctocore_ld_fault
    ,output SC_line_type        core0_slice0_dctocore_ld_data
    ,input  logic               core0_slice0_coretodc_std_valid
    ,output logic               core0_slice0_coretodc_std_retry
    //  ,input   I_coretodc_std_type     core0_slice0_coretodc_std
    ,input  DC_ckpid_type       core0_slice0_coretodc_std_ckpid
    ,input  CORE_reqid_type     core0_slice0_coretodc_std_coreid
    ,input  CORE_mop_type       core0_slice0_coretodc_std_mop
    ,input  logic               core0_slice0_coretodc_std_pnr
    ,input  SC_pcsign_type      core0_slice0_coretodc_std_pcsign
    ,input  SC_poffset_type     core0_slice0_coretodc_std_poffset
    ,input  SC_imm_type         core0_slice0_coretodc_std_imm
    ,input  SC_line_type        core0_slice0_coretodc_std_data
    ,output logic               core0_slice0_dctocore_std_ack_valid
    ,input  logic               core0_slice0_dctocore_std_ack_retry
    //  ,output  I_dctocore_std_ack_type core0_slice0_dctocore_std_ack
    ,output SC_fault_type       core0_slice0_dctocore_std_ack_fault
    ,output CORE_reqid_type     core0_slice0_dctocore_std_ack_coreid
    ,input  logic               c0_s0_coretodctlb_ld_valid
    ,output logic               c0_s0_coretodctlb_ld_retry
    //    ,input   I_coretodctlb_ld_type c0_s0_coretodctlb_ld
    ,input  DC_ckpid_type       c0_s0_coretodctlb_ld_ckpid
    ,input  CORE_reqid_type     c0_s0_coretodctlb_ld_coreid
    ,input  CORE_lop_type       c0_s0_coretodctlb_ld_lop
    ,input  logic               c0_s0_coretodctlb_ld_pnr
    ,input  SC_laddr_type       c0_s0_coretodctlb_ld_laddr
    ,input  SC_imm_type         c0_s0_coretodctlb_ld_imm
    ,input  SC_sptbr_type       c0_s0_coretodctlb_ld_sptbr
    ,input  logic               c0_s0_coretodctlb_ld_user
    ,input  logic               c0_s0_coretodctlb_st_valid
    ,output logic               c0_s0_coretodctlb_st_retry
    //    ,input   I_coretodctlb_st_type c0_s0_coretodctlb_st
    ,input  DC_ckpid_type       c0_s0_coretodctlb_st_ckpid
    ,input  CORE_reqid_type     c0_s0_coretodctlb_st_coreid
    ,input  CORE_mop_type       c0_s0_coretodctlb_st_mop
    ,input  logic               c0_s0_coretodctlb_st_pnr
    ,input  SC_laddr_type       c0_s0_coretodctlb_st_laddr
    ,input  SC_imm_type     c0_s0_coretodctlb_st_imm
    ,input  SC_sptbr_type       c0_s0_coretodctlb_st_sptbr
    ,input  logic               c0_s0_coretodctlb_st_user
   // dcache core 0, slice 1
    ,input  logic               core0_slice1_coretodc_ld_valid
    ,output logic               core0_slice1_coretodc_ld_retry
    //  ,input   I_coretodc_ld_type      core0_slice1_coretodc_ld
    ,input  DC_ckpid_type       core0_slice1_coretodc_ld_ckpid
    ,input  CORE_reqid_type     core0_slice1_coretodc_ld_coreid
    ,input  CORE_lop_type       core0_slice1_coretodc_ld_lop
    ,input  logic               core0_slice1_coretodc_ld_pnr
    ,input  SC_pcsign_type      core0_slice1_coretodc_ld_pcsign
    ,input  SC_poffset_type     core0_slice1_coretodc_ld_poffset
    ,input  SC_imm_type         core0_slice1_coretodc_ld_imm
    ,output logic               core0_slice1_dctocore_ld_valid
    ,input  logic               core0_slice1_dctocore_ld_retry
    //  ,output  I_dctocore_ld_type      core0_slice1_dctocore_ld
    ,output CORE_reqid_type     core0_slice1_dctocore_ld_coreid
    ,output SC_fault_type       core0_slice1_dctocore_ld_fault
    ,output SC_line_type        core0_slice1_dctocore_ld_data
    ,input  logic               core0_slice1_coretodc_std_valid
    ,output logic               core0_slice1_coretodc_std_retry
    //  ,input   I_coretodc_std_type     core0_slice1_coretodc_std
    ,input  DC_ckpid_type       core0_slice1_coretodc_std_ckpid
    ,input  CORE_reqid_type     core0_slice1_coretodc_std_coreid
    ,input  CORE_mop_type       core0_slice1_coretodc_std_mop
    ,input  logic               core0_slice1_coretodc_std_pnr
    ,input  SC_pcsign_type      core0_slice1_coretodc_std_pcsign
    ,input  SC_poffset_type     core0_slice1_coretodc_std_poffset
    ,input  SC_imm_type         core0_slice1_coretodc_std_imm
    ,input  SC_line_type        core0_slice1_coretodc_std_data
    ,output logic               core0_slice1_dctocore_std_ack_valid
    ,input  logic               core0_slice1_dctocore_std_ack_retry
    //  ,output  I_dctocore_std_ack_type core0_slice1_dctocore_std_ack
    ,output SC_fault_type       core0_slice1_dctocore_std_ack_fault
    ,output CORE_reqid_type     core0_slice1_dctocore_std_ack_coreid
    ,input  logic               c0_s1_coretodctlb_ld_valid
    ,output logic               c0_s1_coretodctlb_ld_retry
    //    ,input   I_coretodctlb_ld_type c0_s1_coretodctlb_ld
    ,input  DC_ckpid_type       c0_s1_coretodctlb_ld_ckpid
    ,input  CORE_reqid_type     c0_s1_coretodctlb_ld_coreid
    ,input  CORE_lop_type       c0_s1_coretodctlb_ld_lop
    ,input  logic               c0_s1_coretodctlb_ld_pnr
    ,input  SC_laddr_type       c0_s1_coretodctlb_ld_laddr
    ,input  SC_imm_type         c0_s1_coretodctlb_ld_imm
    ,input  SC_sptbr_type       c0_s1_coretodctlb_ld_sptbr
    ,input  logic               c0_s1_coretodctlb_ld_user
    ,input  logic               c0_s1_coretodctlb_st_valid
    ,output logic               c0_s1_coretodctlb_st_retry
    //    ,input   I_coretodctlb_st_type c0_s1_coretodctlb_st
    ,input  DC_ckpid_type       c0_s1_coretodctlb_st_ckpid
    ,input  CORE_reqid_type     c0_s1_coretodctlb_st_coreid
    ,input  CORE_mop_type       c0_s1_coretodctlb_st_mop
    ,input  logic               c0_s1_coretodctlb_st_pnr
    ,input  SC_laddr_type       c0_s1_coretodctlb_st_laddr
    ,input  SC_imm_type     c0_s1_coretodctlb_st_imm
    ,input  SC_sptbr_type       c0_s1_coretodctlb_st_sptbr
    ,input  logic               c0_s1_coretodctlb_st_user
`ifdef SC_4PIPE
   // dcache core 0, slice 2
    ,input  logic               core0_slice2_coretodc_ld_valid
    ,output logic               core0_slice2_coretodc_ld_retry
    //  ,input   I_coretodc_ld_type      core0_slice2_coretodc_ld
    ,input  DC_ckpid_type       core0_slice2_coretodc_ld_ckpid
    ,input  CORE_reqid_type     core0_slice2_coretodc_ld_coreid
    ,input  CORE_lop_type       core0_slice2_coretodc_ld_lop
    ,input  logic               core0_slice2_coretodc_ld_pnr
    ,input  SC_pcsign_type      core0_slice2_coretodc_ld_pcsign
    ,input  SC_poffset_type     core0_slice2_coretodc_ld_poffset
    ,input  SC_imm_type         core0_slice2_coretodc_ld_imm
    ,output logic               core0_slice2_dctocore_ld_valid
    ,input  logic               core0_slice2_dctocore_ld_retry
    //  ,output  I_dctocore_ld_type      core0_slice2_dctocore_ld
    ,output CORE_reqid_type     core0_slice2_dctocore_ld_coreid
    ,output SC_fault_type       core0_slice2_dctocore_ld_fault
    ,output SC_line_type        core0_slice2_dctocore_ld_data
    ,input  logic               core0_slice2_coretodc_std_valid
    ,output logic               core0_slice2_coretodc_std_retry
    //  ,input   I_coretodc_std_type     core0_slice2_coretodc_std
    ,input  DC_ckpid_type       core0_slice2_coretodc_std_ckpid
    ,input  CORE_reqid_type     core0_slice2_coretodc_std_coreid
    ,input  CORE_mop_type       core0_slice2_coretodc_std_mop
    ,input  logic               core0_slice2_coretodc_std_pnr
    ,input  SC_pcsign_type      core0_slice2_coretodc_std_pcsign
    ,input  SC_poffset_type     core0_slice2_coretodc_std_poffset
    ,input  SC_imm_type         core0_slice2_coretodc_std_imm
    ,input  SC_line_type        core0_slice2_coretodc_std_data
    ,output logic               core0_slice2_dctocore_std_ack_valid
    ,input  logic               core0_slice2_dctocore_std_ack_retry
    //  ,output  I_dctocore_std_ack_type core0_slice2_dctocore_std_ack
    ,output SC_fault_type       core0_slice2_dctocore_std_ack_fault
    ,output CORE_reqid_type     core0_slice2_dctocore_std_ack_coreid
    ,input  logic               c0_s2_coretodctlb_ld_valid
    ,output logic               c0_s2_coretodctlb_ld_retry
    //    ,input   I_coretodctlb_ld_type c0_s2_coretodctlb_ld
    ,input  DC_ckpid_type       c0_s2_coretodctlb_ld_ckpid
    ,input  CORE_reqid_type     c0_s2_coretodctlb_ld_coreid
    ,input  CORE_lop_type       c0_s2_coretodctlb_ld_lop
    ,input  logic               c0_s2_coretodctlb_ld_pnr
    ,input  SC_laddr_type       c0_s2_coretodctlb_ld_laddr
    ,input  SC_imm_type         c0_s2_coretodctlb_ld_imm
    ,input  SC_sptbr_type       c0_s2_coretodctlb_ld_sptbr
    ,input  logic               c0_s2_coretodctlb_ld_user
    ,input  logic               c0_s2_coretodctlb_st_valid
    ,output logic               c0_s2_coretodctlb_st_retry
    //    ,input   I_coretodctlb_st_type c0_s2_coretodctlb_st
    ,input  DC_ckpid_type       c0_s2_coretodctlb_st_ckpid
    ,input  CORE_reqid_type     c0_s2_coretodctlb_st_coreid
    ,input  CORE_mop_type       c0_s2_coretodctlb_st_mop
    ,input  logic               c0_s2_coretodctlb_st_pnr
    ,input  SC_laddr_type       c0_s2_coretodctlb_st_laddr
    ,input  SC_imm_type     c0_s2_coretodctlb_st_imm
    ,input  SC_sptbr_type       c0_s2_coretodctlb_st_sptbr
    ,input  logic               c0_s2_coretodctlb_st_user
   // dcache core 0, slice 3
    ,input  logic               core0_slice3_coretodc_ld_valid
    ,output logic               core0_slice3_coretodc_ld_retry
    //  ,input   I_coretodc_ld_type      core0_slice3_coretodc_ld
    ,input  DC_ckpid_type       core0_slice3_coretodc_ld_ckpid
    ,input  CORE_reqid_type     core0_slice3_coretodc_ld_coreid
    ,input  CORE_lop_type       core0_slice3_coretodc_ld_lop
    ,input  logic               core0_slice3_coretodc_ld_pnr
    ,input  SC_pcsign_type      core0_slice3_coretodc_ld_pcsign
    ,input  SC_poffset_type     core0_slice3_coretodc_ld_poffset
    ,input  SC_imm_type         core0_slice3_coretodc_ld_imm
    ,output logic               core0_slice3_dctocore_ld_valid
    ,input  logic               core0_slice3_dctocore_ld_retry
    //  ,output  I_dctocore_ld_type      core0_slice3_dctocore_ld
    ,output CORE_reqid_type     core0_slice3_dctocore_ld_coreid
    ,output SC_fault_type       core0_slice3_dctocore_ld_fault
    ,output SC_line_type        core0_slice3_dctocore_ld_data
    ,input  logic               core0_slice3_coretodc_std_valid
    ,output logic               core0_slice3_coretodc_std_retry
    //  ,input   I_coretodc_std_type     core0_slice3_coretodc_std
    ,input  DC_ckpid_type       core0_slice3_coretodc_std_ckpid
    ,input  CORE_reqid_type     core0_slice3_coretodc_std_coreid
    ,input  CORE_mop_type       core0_slice3_coretodc_std_mop
    ,input  logic               core0_slice3_coretodc_std_pnr
    ,input  SC_pcsign_type      core0_slice3_coretodc_std_pcsign
    ,input  SC_poffset_type     core0_slice3_coretodc_std_poffset
    ,input  SC_imm_type         core0_slice3_coretodc_std_imm
    ,input  SC_line_type        core0_slice3_coretodc_std_data
    ,output logic               core0_slice3_dctocore_std_ack_valid
    ,input  logic               core0_slice3_dctocore_std_ack_retry
    //  ,output  I_dctocore_std_ack_type core0_slice3_dctocore_std_ack
    ,output SC_fault_type       core0_slice3_dctocore_std_ack_fault
    ,output CORE_reqid_type     core0_slice3_dctocore_std_ack_coreid
    ,input  logic               c0_s3_coretodctlb_ld_valid
    ,output logic               c0_s3_coretodctlb_ld_retry
    //    ,input   I_coretodctlb_ld_type c0_s3_coretodctlb_ld
    ,input  DC_ckpid_type       c0_s3_coretodctlb_ld_ckpid
    ,input  CORE_reqid_type     c0_s3_coretodctlb_ld_coreid
    ,input  CORE_lop_type       c0_s3_coretodctlb_ld_lop
    ,input  logic               c0_s3_coretodctlb_ld_pnr
    ,input  SC_laddr_type       c0_s3_coretodctlb_ld_laddr
    ,input  SC_imm_type         c0_s3_coretodctlb_ld_imm
    ,input  SC_sptbr_type       c0_s3_coretodctlb_ld_sptbr
    ,input  logic               c0_s3_coretodctlb_ld_user
    ,input  logic               c0_s3_coretodctlb_st_valid
    ,output logic               c0_s3_coretodctlb_st_retry
    //    ,input   I_coretodctlb_st_type c0_s3_coretodctlb_st
    ,input  DC_ckpid_type       c0_s3_coretodctlb_st_ckpid
    ,input  CORE_reqid_type     c0_s3_coretodctlb_st_coreid
    ,input  CORE_mop_type       c0_s3_coretodctlb_st_mop
    ,input  logic               c0_s3_coretodctlb_st_pnr
    ,input  SC_laddr_type       c0_s3_coretodctlb_st_laddr
    ,input  SC_imm_type     c0_s3_coretodctlb_st_imm
    ,input  SC_sptbr_type       c0_s3_coretodctlb_st_sptbr
    ,input  logic               c0_s3_coretodctlb_st_user
`endif
    // core 0 prefetch
    ,input  logic               core0_pfgtopfe_op_valid
    ,output logic               core0_pfgtopfe_op_retry
    //  ,input  I_pfgtopfe_op_type   core0_pfgtopfe_op
    ,input  PF_delta_type       core0_pfgtopfe_op_delta
    ,input  PF_weigth_type      core0_pfgtopfe_op_w1
    ,input  PF_weigth_type      core0_pfgtopfe_op_w2
    ,input  SC_pcsign_type      core0_pfgtopfe_op_pcsign
    ,input  SC_laddr_type       core0_pfgtopfe_op_laddr
    ,input  SC_sptbr_type       core0_pfgtopfe_op_sptbr
   // icache core 1
    ,input  logic               core1_coretoic_pc_valid
    ,output logic               core1_coretoic_pc_retry
    //  ,input  I_coretoic_pc_type  core1_coretoic_pc
    ,input  CORE_reqid_type     core1_coretoic_pc_coreid
    ,input  SC_poffset_type     core1_coretoic_pc_poffset
    ,output logic               core1_ictocore_valid
    ,input  logic               core1_ictocore_retry
    //  ,output I_ictocore_type      core1_ictocore
    ,output CORE_reqid_type     core1_ictocore_coreid
    ,output SC_fault_type       core1_ictocore_fault
    ,output IC_fwidth_type      core1_ictocore_data
   // dcache core 1, slice 0
    ,input  logic               core1_slice0_coretodc_ld_valid
    ,output logic               core1_slice0_coretodc_ld_retry
    //  ,input   I_coretodc_ld_type      core1_slice0_coretodc_ld
    ,input  DC_ckpid_type       core1_slice0_coretodc_ld_ckpid
    ,input  CORE_reqid_type     core1_slice0_coretodc_ld_coreid
    ,input  CORE_lop_type       core1_slice0_coretodc_ld_lop
    ,input  logic               core1_slice0_coretodc_ld_pnr
    ,input  SC_pcsign_type      core1_slice0_coretodc_ld_pcsign
    ,input  SC_poffset_type     core1_slice0_coretodc_ld_poffset
    ,input  SC_imm_type         core1_slice0_coretodc_ld_imm
    ,output logic               core1_slice0_dctocore_ld_valid
    ,input  logic               core1_slice0_dctocore_ld_retry
    //  ,output  I_dctocore_ld_type      core1_slice0_dctocore_ld
    ,output CORE_reqid_type     core1_slice0_dctocore_ld_coreid
    ,output SC_fault_type       core1_slice0_dctocore_ld_fault
    ,output SC_line_type        core1_slice0_dctocore_ld_data
    ,input  logic               core1_slice0_coretodc_std_valid
    ,output logic               core1_slice0_coretodc_std_retry
    //  ,input   I_coretodc_std_type     core1_slice0_coretodc_std
    ,input  DC_ckpid_type       core1_slice0_coretodc_std_ckpid
    ,input  CORE_reqid_type     core1_slice0_coretodc_std_coreid
    ,input  CORE_mop_type       core1_slice0_coretodc_std_mop
    ,input  logic               core1_slice0_coretodc_std_pnr
    ,input  SC_pcsign_type      core1_slice0_coretodc_std_pcsign
    ,input  SC_poffset_type     core1_slice0_coretodc_std_poffset
    ,input  SC_imm_type         core1_slice0_coretodc_std_imm
    ,input  SC_line_type        core1_slice0_coretodc_std_data
    ,output logic               core1_slice0_dctocore_std_ack_valid
    ,input  logic               core1_slice0_dctocore_std_ack_retry
    //  ,output  I_dctocore_std_ack_type core1_slice0_dctocore_std_ack
    ,output SC_fault_type       core1_slice0_dctocore_std_ack_fault
    ,output CORE_reqid_type     core1_slice0_dctocore_std_ack_coreid
    ,input  logic               c1_s0_coretodctlb_ld_valid
    ,output logic               c1_s0_coretodctlb_ld_retry
    //    ,input   I_coretodctlb_ld_type c1_s0_coretodctlb_ld
    ,input  DC_ckpid_type       c1_s0_coretodctlb_ld_ckpid
    ,input  CORE_reqid_type     c1_s0_coretodctlb_ld_coreid
    ,input  CORE_lop_type       c1_s0_coretodctlb_ld_lop
    ,input  logic               c1_s0_coretodctlb_ld_pnr
    ,input  SC_laddr_type       c1_s0_coretodctlb_ld_laddr
    ,input  SC_imm_type         c1_s0_coretodctlb_ld_imm
    ,input  SC_sptbr_type       c1_s0_coretodctlb_ld_sptbr
    ,input  logic               c1_s0_coretodctlb_ld_user
    ,input  logic               c1_s0_coretodctlb_st_valid
    ,output logic               c1_s0_coretodctlb_st_retry
    //    ,input   I_coretodctlb_st_type c1_s0_coretodctlb_st
    ,input  DC_ckpid_type       c1_s0_coretodctlb_st_ckpid
    ,input  CORE_reqid_type     c1_s0_coretodctlb_st_coreid
    ,input  CORE_mop_type       c1_s0_coretodctlb_st_mop
    ,input  logic               c1_s0_coretodctlb_st_pnr
    ,input  SC_laddr_type       c1_s0_coretodctlb_st_laddr
    ,input  SC_imm_type     c1_s0_coretodctlb_st_imm
    ,input  SC_sptbr_type       c1_s0_coretodctlb_st_sptbr
    ,input  logic               c1_s0_coretodctlb_st_user
   // dcache core 1, slice 1
    ,input  logic               core1_slice1_coretodc_ld_valid
    ,output logic               core1_slice1_coretodc_ld_retry
    //  ,input   I_coretodc_ld_type      core1_slice1_coretodc_ld
    ,input  DC_ckpid_type       core1_slice1_coretodc_ld_ckpid
    ,input  CORE_reqid_type     core1_slice1_coretodc_ld_coreid
    ,input  CORE_lop_type       core1_slice1_coretodc_ld_lop
    ,input  logic               core1_slice1_coretodc_ld_pnr
    ,input  SC_pcsign_type      core1_slice1_coretodc_ld_pcsign
    ,input  SC_poffset_type     core1_slice1_coretodc_ld_poffset
    ,input  SC_imm_type         core1_slice1_coretodc_ld_imm
    ,output logic               core1_slice1_dctocore_ld_valid
    ,input  logic               core1_slice1_dctocore_ld_retry
    //  ,output  I_dctocore_ld_type      core1_slice1_dctocore_ld
    ,output CORE_reqid_type     core1_slice1_dctocore_ld_coreid
    ,output SC_fault_type       core1_slice1_dctocore_ld_fault
    ,output SC_line_type        core1_slice1_dctocore_ld_data
    ,input  logic               core1_slice1_coretodc_std_valid
    ,output logic               core1_slice1_coretodc_std_retry
    //  ,input   I_coretodc_std_type     core1_slice1_coretodc_std
    ,input  DC_ckpid_type       core1_slice1_coretodc_std_ckpid
    ,input  CORE_reqid_type     core1_slice1_coretodc_std_coreid
    ,input  CORE_mop_type       core1_slice1_coretodc_std_mop
    ,input  logic               core1_slice1_coretodc_std_pnr
    ,input  SC_pcsign_type      core1_slice1_coretodc_std_pcsign
    ,input  SC_poffset_type     core1_slice1_coretodc_std_poffset
    ,input  SC_imm_type         core1_slice1_coretodc_std_imm
    ,input  SC_line_type        core1_slice1_coretodc_std_data
    ,output logic               core1_slice1_dctocore_std_ack_valid
    ,input  logic               core1_slice1_dctocore_std_ack_retry
    //  ,output  I_dctocore_std_ack_type core1_slice1_dctocore_std_ack
    ,output SC_fault_type       core1_slice1_dctocore_std_ack_fault
    ,output CORE_reqid_type     core1_slice1_dctocore_std_ack_coreid
    ,input  logic               c1_s1_coretodctlb_ld_valid
    ,output logic               c1_s1_coretodctlb_ld_retry
    //    ,input   I_coretodctlb_ld_type c1_s1_coretodctlb_ld
    ,input  DC_ckpid_type       c1_s1_coretodctlb_ld_ckpid
    ,input  CORE_reqid_type     c1_s1_coretodctlb_ld_coreid
    ,input  CORE_lop_type       c1_s1_coretodctlb_ld_lop
    ,input  logic               c1_s1_coretodctlb_ld_pnr
    ,input  SC_laddr_type       c1_s1_coretodctlb_ld_laddr
    ,input  SC_imm_type         c1_s1_coretodctlb_ld_imm
    ,input  SC_sptbr_type       c1_s1_coretodctlb_ld_sptbr
    ,input  logic               c1_s1_coretodctlb_ld_user
    ,input  logic               c1_s1_coretodctlb_st_valid
    ,output logic               c1_s1_coretodctlb_st_retry
    //    ,input   I_coretodctlb_st_type c1_s1_coretodctlb_st
    ,input  DC_ckpid_type       c1_s1_coretodctlb_st_ckpid
    ,input  CORE_reqid_type     c1_s1_coretodctlb_st_coreid
    ,input  CORE_mop_type       c1_s1_coretodctlb_st_mop
    ,input  logic               c1_s1_coretodctlb_st_pnr
    ,input  SC_laddr_type       c1_s1_coretodctlb_st_laddr
    ,input  SC_imm_type     c1_s1_coretodctlb_st_imm
    ,input  SC_sptbr_type       c1_s1_coretodctlb_st_sptbr
    ,input  logic               c1_s1_coretodctlb_st_user
`ifdef SC_4PIPE
   // dcache core 1, slice 2
    ,input  logic               core1_slice2_coretodc_ld_valid
    ,output logic               core1_slice2_coretodc_ld_retry
    //  ,input   I_coretodc_ld_type      core1_slice2_coretodc_ld
    ,input  DC_ckpid_type       core1_slice2_coretodc_ld_ckpid
    ,input  CORE_reqid_type     core1_slice2_coretodc_ld_coreid
    ,input  CORE_lop_type       core1_slice2_coretodc_ld_lop
    ,input  logic               core1_slice2_coretodc_ld_pnr
    ,input  SC_pcsign_type      core1_slice2_coretodc_ld_pcsign
    ,input  SC_poffset_type     core1_slice2_coretodc_ld_poffset
    ,input  SC_imm_type         core1_slice2_coretodc_ld_imm
    ,output logic               core1_slice2_dctocore_ld_valid
    ,input  logic               core1_slice2_dctocore_ld_retry
    //  ,output  I_dctocore_ld_type      core1_slice2_dctocore_ld
    ,output CORE_reqid_type     core1_slice2_dctocore_ld_coreid
    ,output SC_fault_type       core1_slice2_dctocore_ld_fault
    ,output SC_line_type        core1_slice2_dctocore_ld_data
    ,input  logic               core1_slice2_coretodc_std_valid
    ,output logic               core1_slice2_coretodc_std_retry
    //  ,input   I_coretodc_std_type     core1_slice2_coretodc_std
    ,input  DC_ckpid_type       core1_slice2_coretodc_std_ckpid
    ,input  CORE_reqid_type     core1_slice2_coretodc_std_coreid
    ,input  CORE_mop_type       core1_slice2_coretodc_std_mop
    ,input  logic               core1_slice2_coretodc_std_pnr
    ,input  SC_pcsign_type      core1_slice2_coretodc_std_pcsign
    ,input  SC_poffset_type     core1_slice2_coretodc_std_poffset
    ,input  SC_imm_type         core1_slice2_coretodc_std_imm
    ,input  SC_line_type        core1_slice2_coretodc_std_data
    ,output logic               core1_slice2_dctocore_std_ack_valid
    ,input  logic               core1_slice2_dctocore_std_ack_retry
    //  ,output  I_dctocore_std_ack_type core1_slice2_dctocore_std_ack
    ,output SC_fault_type       core1_slice2_dctocore_std_ack_fault
    ,output CORE_reqid_type     core1_slice2_dctocore_std_ack_coreid
    ,input  logic               c1_s2_coretodctlb_ld_valid
    ,output logic               c1_s2_coretodctlb_ld_retry
    //    ,input   I_coretodctlb_ld_type c1_s2_coretodctlb_ld
    ,input  DC_ckpid_type       c1_s2_coretodctlb_ld_ckpid
    ,input  CORE_reqid_type     c1_s2_coretodctlb_ld_coreid
    ,input  CORE_lop_type       c1_s2_coretodctlb_ld_lop
    ,input  logic               c1_s2_coretodctlb_ld_pnr
    ,input  SC_laddr_type       c1_s2_coretodctlb_ld_laddr
    ,input  SC_imm_type         c1_s2_coretodctlb_ld_imm
    ,input  SC_sptbr_type       c1_s2_coretodctlb_ld_sptbr
    ,input  logic               c1_s2_coretodctlb_ld_user
    ,input  logic               c1_s2_coretodctlb_st_valid
    ,output logic               c1_s2_coretodctlb_st_retry
    //    ,input   I_coretodctlb_st_type c1_s2_coretodctlb_st
    ,input  DC_ckpid_type       c1_s2_coretodctlb_st_ckpid
    ,input  CORE_reqid_type     c1_s2_coretodctlb_st_coreid
    ,input  CORE_mop_type       c1_s2_coretodctlb_st_mop
    ,input  logic               c1_s2_coretodctlb_st_pnr
    ,input  SC_laddr_type       c1_s2_coretodctlb_st_laddr
    ,input  SC_imm_type     c1_s2_coretodctlb_st_imm
    ,input  SC_sptbr_type       c1_s2_coretodctlb_st_sptbr
    ,input  logic               c1_s2_coretodctlb_st_user
   // dcache core 1, slice 3
    ,input  logic               core1_slice3_coretodc_ld_valid
    ,output logic               core1_slice3_coretodc_ld_retry
    //  ,input   I_coretodc_ld_type      core1_slice3_coretodc_ld
    ,input  DC_ckpid_type       core1_slice3_coretodc_ld_ckpid
    ,input  CORE_reqid_type     core1_slice3_coretodc_ld_coreid
    ,input  CORE_lop_type       core1_slice3_coretodc_ld_lop
    ,input  logic               core1_slice3_coretodc_ld_pnr
    ,input  SC_pcsign_type      core1_slice3_coretodc_ld_pcsign
    ,input  SC_poffset_type     core1_slice3_coretodc_ld_poffset
    ,input  SC_imm_type         core1_slice3_coretodc_ld_imm
    ,output logic               core1_slice3_dctocore_ld_valid
    ,input  logic               core1_slice3_dctocore_ld_retry
    //  ,output  I_dctocore_ld_type      core1_slice3_dctocore_ld
    ,output CORE_reqid_type     core1_slice3_dctocore_ld_coreid
    ,output SC_fault_type       core1_slice3_dctocore_ld_fault
    ,output SC_line_type        core1_slice3_dctocore_ld_data
    ,input  logic               core1_slice3_coretodc_std_valid
    ,output logic               core1_slice3_coretodc_std_retry
    //  ,input   I_coretodc_std_type     core1_slice3_coretodc_std
    ,input  DC_ckpid_type       core1_slice3_coretodc_std_ckpid
    ,input  CORE_reqid_type     core1_slice3_coretodc_std_coreid
    ,input  CORE_mop_type       core1_slice3_coretodc_std_mop
    ,input  logic               core1_slice3_coretodc_std_pnr
    ,input  SC_pcsign_type      core1_slice3_coretodc_std_pcsign
    ,input  SC_poffset_type     core1_slice3_coretodc_std_poffset
    ,input  SC_imm_type         core1_slice3_coretodc_std_imm
    ,input  SC_line_type        core1_slice3_coretodc_std_data
    ,output logic               core1_slice3_dctocore_std_ack_valid
    ,input  logic               core1_slice3_dctocore_std_ack_retry
    //  ,output  I_dctocore_std_ack_type core1_slice3_dctocore_std_ack
    ,output SC_fault_type       core1_slice3_dctocore_std_ack_fault
    ,output CORE_reqid_type     core1_slice3_dctocore_std_ack_coreid
    ,input  logic               c1_s3_coretodctlb_ld_valid
    ,output logic               c1_s3_coretodctlb_ld_retry
    //    ,input   I_coretodctlb_ld_type c1_s3_coretodctlb_ld
    ,input  DC_ckpid_type       c1_s3_coretodctlb_ld_ckpid
    ,input  CORE_reqid_type     c1_s3_coretodctlb_ld_coreid
    ,input  CORE_lop_type       c1_s3_coretodctlb_ld_lop
    ,input  logic               c1_s3_coretodctlb_ld_pnr
    ,input  SC_laddr_type       c1_s3_coretodctlb_ld_laddr
    ,input  SC_imm_type         c1_s3_coretodctlb_ld_imm
    ,input  SC_sptbr_type       c1_s3_coretodctlb_ld_sptbr
    ,input  logic               c1_s3_coretodctlb_ld_user
    ,input  logic               c1_s3_coretodctlb_st_valid
    ,output logic               c1_s3_coretodctlb_st_retry
    //    ,input   I_coretodctlb_st_type c1_s3_coretodctlb_st
    ,input  DC_ckpid_type       c1_s3_coretodctlb_st_ckpid
    ,input  CORE_reqid_type     c1_s3_coretodctlb_st_coreid
    ,input  CORE_mop_type       c1_s3_coretodctlb_st_mop
    ,input  logic               c1_s3_coretodctlb_st_pnr
    ,input  SC_laddr_type       c1_s3_coretodctlb_st_laddr
    ,input  SC_imm_type     c1_s3_coretodctlb_st_imm
    ,input  SC_sptbr_type       c1_s3_coretodctlb_st_sptbr
    ,input  logic               c1_s3_coretodctlb_st_user
`endif
    // core 1 prefetch
    ,input  logic               core1_pfgtopfe_op_valid
    ,output logic               core1_pfgtopfe_op_retry
    //  ,input  I_pfgtopfe_op_type   core1_pfgtopfe_op
    ,input  PF_delta_type       core1_pfgtopfe_op_delta
    ,input  PF_weigth_type      core1_pfgtopfe_op_w1
    ,input  PF_weigth_type      core1_pfgtopfe_op_w2
    ,input  SC_pcsign_type      core1_pfgtopfe_op_pcsign
    ,input  SC_laddr_type       core1_pfgtopfe_op_laddr
    ,input  SC_sptbr_type       core1_pfgtopfe_op_sptbr
    ,output logic               dr0_drtomem_req_valid
    ,input  logic               dr0_drtomem_req_retry
    //  ,output  I_drtomem_req_type   dr0_drtomem_req
    ,output DR_reqid_type       dr0_drtomem_req_drid
    ,output SC_cmd_type         dr0_drtomem_req_cmd
    ,output SC_paddr_type       dr0_drtomem_req_paddr
    ,input  logic               dr0_memtodr_ack_valid
    ,output logic               dr0_memtodr_ack_retry
    //  ,input   I_memtodr_ack_type   dr0_memtodr_ack
    ,input  DR_reqid_type       dr0_memtodr_ack_drid
    ,input  SC_nodeid_type      dr0_memtodr_ack_nid
    ,input  SC_paddr_type       dr0_memtodr_ack_paddr
    ,input  SC_snack_type       dr0_memtodr_ack_ack
    ,input  SC_line_type        dr0_memtodr_ack_line
    ,output logic               dr0_drtomem_wb_valid
    ,input  logic               dr0_drtomem_wb_retry
    //  ,output  I_drtomem_wb_type    dr0_drtomem_wb
    ,output SC_line_type        dr0_drtomem_wb_line
    ,output SC_paddr_type       dr0_drtomem_wb_paddr
    ,output logic               dr0_drtomem_pfreq_valid
    ,input  logic               dr0_drtomem_pfreq_retry
    //  ,output  I_drtomem_pfreq_type dr0_drtomem_pfreq
    ,output SC_nodeid_type      dr0_drtomem_pfreq_nid
    ,output SC_paddr_type       dr0_drtomem_pfreq_paddr
    ,output logic               dr1_drtomem_req_valid
    ,input  logic               dr1_drtomem_req_retry
    //  ,output  I_drtomem_req_type   dr1_drtomem_req
    ,output DR_reqid_type       dr1_drtomem_req_drid
    ,output SC_cmd_type         dr1_drtomem_req_cmd
    ,output SC_paddr_type       dr1_drtomem_req_paddr
    ,input  logic               dr1_memtodr_ack_valid
    ,output logic               dr1_memtodr_ack_retry
    //  ,input   I_memtodr_ack_type   dr1_memtodr_ack
    ,input  DR_reqid_type       dr1_memtodr_ack_drid
    ,input  SC_nodeid_type      dr1_memtodr_ack_nid
    ,input  SC_paddr_type       dr1_memtodr_ack_paddr
    ,input  SC_snack_type       dr1_memtodr_ack_ack
    ,input  SC_line_type        dr1_memtodr_ack_line
    ,output logic               dr1_drtomem_wb_valid
    ,input  logic               dr1_drtomem_wb_retry
    //  ,output  I_drtomem_wb_type    dr1_drtomem_wb
    ,output SC_line_type        dr1_drtomem_wb_line
    ,output SC_paddr_type       dr1_drtomem_wb_paddr
    ,output logic               dr1_drtomem_pfreq_valid
    ,input  logic               dr1_drtomem_pfreq_retry
    //  ,output  I_drtomem_pfreq_type dr1_drtomem_pfreq
    ,output SC_nodeid_type      dr1_drtomem_pfreq_nid
    ,output SC_paddr_type       dr1_drtomem_pfreq_paddr
);
    I_coretoic_pc_type core0_coretoic_pc;
    assign core0_coretoic_pc.coreid = core0_coretoic_pc_coreid;
    assign core0_coretoic_pc.poffset = core0_coretoic_pc_poffset;
    I_ictocore_type core0_ictocore;
    assign core0_ictocore_coreid = core0_ictocore.coreid;
    assign core0_ictocore_fault = core0_ictocore.fault;
    assign core0_ictocore_data = core0_ictocore.data;
    I_coretodc_ld_type core0_slice0_coretodc_ld;
    assign core0_slice0_coretodc_ld.ckpid = core0_slice0_coretodc_ld_ckpid;
    assign core0_slice0_coretodc_ld.coreid = core0_slice0_coretodc_ld_coreid;
    assign core0_slice0_coretodc_ld.lop = core0_slice0_coretodc_ld_lop;
    assign core0_slice0_coretodc_ld.pnr = core0_slice0_coretodc_ld_pnr;
    assign core0_slice0_coretodc_ld.pcsign = core0_slice0_coretodc_ld_pcsign;
    assign core0_slice0_coretodc_ld.poffset = core0_slice0_coretodc_ld_poffset;
    assign core0_slice0_coretodc_ld.imm = core0_slice0_coretodc_ld_imm;
    I_dctocore_ld_type core0_slice0_dctocore_ld;
    assign core0_slice0_dctocore_ld_coreid = core0_slice0_dctocore_ld.coreid;
    assign core0_slice0_dctocore_ld_fault = core0_slice0_dctocore_ld.fault;
    assign core0_slice0_dctocore_ld_data = core0_slice0_dctocore_ld.data;
    I_coretodc_std_type core0_slice0_coretodc_std;
    assign core0_slice0_coretodc_std.ckpid = core0_slice0_coretodc_std_ckpid;
    assign core0_slice0_coretodc_std.coreid = core0_slice0_coretodc_std_coreid;
    assign core0_slice0_coretodc_std.mop = core0_slice0_coretodc_std_mop;
    assign core0_slice0_coretodc_std.pnr = core0_slice0_coretodc_std_pnr;
    assign core0_slice0_coretodc_std.pcsign = core0_slice0_coretodc_std_pcsign;
    assign core0_slice0_coretodc_std.poffset = core0_slice0_coretodc_std_poffset;
    assign core0_slice0_coretodc_std.imm = core0_slice0_coretodc_std_imm;
    assign core0_slice0_coretodc_std.data = core0_slice0_coretodc_std_data;
    I_dctocore_std_ack_type core0_slice0_dctocore_std_ack;
    assign core0_slice0_dctocore_std_ack_fault = core0_slice0_dctocore_std_ack.fault;
    assign core0_slice0_dctocore_std_ack_coreid = core0_slice0_dctocore_std_ack.coreid;
    I_coretodctlb_ld_type c0_s0_coretodctlb_ld;
    assign c0_s0_coretodctlb_ld.ckpid = c0_s0_coretodctlb_ld_ckpid;
    assign c0_s0_coretodctlb_ld.coreid = c0_s0_coretodctlb_ld_coreid;
    assign c0_s0_coretodctlb_ld.lop = c0_s0_coretodctlb_ld_lop;
    assign c0_s0_coretodctlb_ld.pnr = c0_s0_coretodctlb_ld_pnr;
    assign c0_s0_coretodctlb_ld.laddr = c0_s0_coretodctlb_ld_laddr;
    assign c0_s0_coretodctlb_ld.imm = c0_s0_coretodctlb_ld_imm;
    assign c0_s0_coretodctlb_ld.sptbr = c0_s0_coretodctlb_ld_sptbr;
    assign c0_s0_coretodctlb_ld.user = c0_s0_coretodctlb_ld_user;
    I_coretodctlb_st_type c0_s0_coretodctlb_st;
    assign c0_s0_coretodctlb_st.ckpid = c0_s0_coretodctlb_st_ckpid;
    assign c0_s0_coretodctlb_st.coreid = c0_s0_coretodctlb_st_coreid;
    assign c0_s0_coretodctlb_st.mop = c0_s0_coretodctlb_st_mop;
    assign c0_s0_coretodctlb_st.pnr = c0_s0_coretodctlb_st_pnr;
    assign c0_s0_coretodctlb_st.laddr = c0_s0_coretodctlb_st_laddr;
    assign c0_s0_coretodctlb_st.imm = c0_s0_coretodctlb_st_imm;
    assign c0_s0_coretodctlb_st.sptbr = c0_s0_coretodctlb_st_sptbr;
    assign c0_s0_coretodctlb_st.user = c0_s0_coretodctlb_st_user;
    I_coretodc_ld_type core0_slice1_coretodc_ld;
    assign core0_slice1_coretodc_ld.ckpid = core0_slice1_coretodc_ld_ckpid;
    assign core0_slice1_coretodc_ld.coreid = core0_slice1_coretodc_ld_coreid;
    assign core0_slice1_coretodc_ld.lop = core0_slice1_coretodc_ld_lop;
    assign core0_slice1_coretodc_ld.pnr = core0_slice1_coretodc_ld_pnr;
    assign core0_slice1_coretodc_ld.pcsign = core0_slice1_coretodc_ld_pcsign;
    assign core0_slice1_coretodc_ld.poffset = core0_slice1_coretodc_ld_poffset;
    assign core0_slice1_coretodc_ld.imm = core0_slice1_coretodc_ld_imm;
    I_dctocore_ld_type core0_slice1_dctocore_ld;
    assign core0_slice1_dctocore_ld_coreid = core0_slice1_dctocore_ld.coreid;
    assign core0_slice1_dctocore_ld_fault = core0_slice1_dctocore_ld.fault;
    assign core0_slice1_dctocore_ld_data = core0_slice1_dctocore_ld.data;
    I_coretodc_std_type core0_slice1_coretodc_std;
    assign core0_slice1_coretodc_std.ckpid = core0_slice1_coretodc_std_ckpid;
    assign core0_slice1_coretodc_std.coreid = core0_slice1_coretodc_std_coreid;
    assign core0_slice1_coretodc_std.mop = core0_slice1_coretodc_std_mop;
    assign core0_slice1_coretodc_std.pnr = core0_slice1_coretodc_std_pnr;
    assign core0_slice1_coretodc_std.pcsign = core0_slice1_coretodc_std_pcsign;
    assign core0_slice1_coretodc_std.poffset = core0_slice1_coretodc_std_poffset;
    assign core0_slice1_coretodc_std.imm = core0_slice1_coretodc_std_imm;
    assign core0_slice1_coretodc_std.data = core0_slice1_coretodc_std_data;
    I_dctocore_std_ack_type core0_slice1_dctocore_std_ack;
    assign core0_slice1_dctocore_std_ack_fault = core0_slice1_dctocore_std_ack.fault;
    assign core0_slice1_dctocore_std_ack_coreid = core0_slice1_dctocore_std_ack.coreid;
    I_coretodctlb_ld_type c0_s1_coretodctlb_ld;
    assign c0_s1_coretodctlb_ld.ckpid = c0_s1_coretodctlb_ld_ckpid;
    assign c0_s1_coretodctlb_ld.coreid = c0_s1_coretodctlb_ld_coreid;
    assign c0_s1_coretodctlb_ld.lop = c0_s1_coretodctlb_ld_lop;
    assign c0_s1_coretodctlb_ld.pnr = c0_s1_coretodctlb_ld_pnr;
    assign c0_s1_coretodctlb_ld.laddr = c0_s1_coretodctlb_ld_laddr;
    assign c0_s1_coretodctlb_ld.imm = c0_s1_coretodctlb_ld_imm;
    assign c0_s1_coretodctlb_ld.sptbr = c0_s1_coretodctlb_ld_sptbr;
    assign c0_s1_coretodctlb_ld.user = c0_s1_coretodctlb_ld_user;
    I_coretodctlb_st_type c0_s1_coretodctlb_st;
    assign c0_s1_coretodctlb_st.ckpid = c0_s1_coretodctlb_st_ckpid;
    assign c0_s1_coretodctlb_st.coreid = c0_s1_coretodctlb_st_coreid;
    assign c0_s1_coretodctlb_st.mop = c0_s1_coretodctlb_st_mop;
    assign c0_s1_coretodctlb_st.pnr = c0_s1_coretodctlb_st_pnr;
    assign c0_s1_coretodctlb_st.laddr = c0_s1_coretodctlb_st_laddr;
    assign c0_s1_coretodctlb_st.imm = c0_s1_coretodctlb_st_imm;
    assign c0_s1_coretodctlb_st.sptbr = c0_s1_coretodctlb_st_sptbr;
    assign c0_s1_coretodctlb_st.user = c0_s1_coretodctlb_st_user;
`ifdef SC_4PIPE
    I_coretodc_ld_type core0_slice2_coretodc_ld;
    assign core0_slice2_coretodc_ld.ckpid = core0_slice2_coretodc_ld_ckpid;
    assign core0_slice2_coretodc_ld.coreid = core0_slice2_coretodc_ld_coreid;
    assign core0_slice2_coretodc_ld.lop = core0_slice2_coretodc_ld_lop;
    assign core0_slice2_coretodc_ld.pnr = core0_slice2_coretodc_ld_pnr;
    assign core0_slice2_coretodc_ld.pcsign = core0_slice2_coretodc_ld_pcsign;
    assign core0_slice2_coretodc_ld.poffset = core0_slice2_coretodc_ld_poffset;
    assign core0_slice2_coretodc_ld.imm = core0_slice2_coretodc_ld_imm;
    I_dctocore_ld_type core0_slice2_dctocore_ld;
    assign core0_slice2_dctocore_ld_coreid = core0_slice2_dctocore_ld.coreid;
    assign core0_slice2_dctocore_ld_fault = core0_slice2_dctocore_ld.fault;
    assign core0_slice2_dctocore_ld_data = core0_slice2_dctocore_ld.data;
    I_coretodc_std_type core0_slice2_coretodc_std;
    assign core0_slice2_coretodc_std.ckpid = core0_slice2_coretodc_std_ckpid;
    assign core0_slice2_coretodc_std.coreid = core0_slice2_coretodc_std_coreid;
    assign core0_slice2_coretodc_std.mop = core0_slice2_coretodc_std_mop;
    assign core0_slice2_coretodc_std.pnr = core0_slice2_coretodc_std_pnr;
    assign core0_slice2_coretodc_std.pcsign = core0_slice2_coretodc_std_pcsign;
    assign core0_slice2_coretodc_std.poffset = core0_slice2_coretodc_std_poffset;
    assign core0_slice2_coretodc_std.imm = core0_slice2_coretodc_std_imm;
    assign core0_slice2_coretodc_std.data = core0_slice2_coretodc_std_data;
    I_dctocore_std_ack_type core0_slice2_dctocore_std_ack;
    assign core0_slice2_dctocore_std_ack_fault = core0_slice2_dctocore_std_ack.fault;
    assign core0_slice2_dctocore_std_ack_coreid = core0_slice2_dctocore_std_ack.coreid;
    I_coretodctlb_ld_type c0_s2_coretodctlb_ld;
    assign c0_s2_coretodctlb_ld.ckpid = c0_s2_coretodctlb_ld_ckpid;
    assign c0_s2_coretodctlb_ld.coreid = c0_s2_coretodctlb_ld_coreid;
    assign c0_s2_coretodctlb_ld.lop = c0_s2_coretodctlb_ld_lop;
    assign c0_s2_coretodctlb_ld.pnr = c0_s2_coretodctlb_ld_pnr;
    assign c0_s2_coretodctlb_ld.laddr = c0_s2_coretodctlb_ld_laddr;
    assign c0_s2_coretodctlb_ld.imm = c0_s2_coretodctlb_ld_imm;
    assign c0_s2_coretodctlb_ld.sptbr = c0_s2_coretodctlb_ld_sptbr;
    assign c0_s2_coretodctlb_ld.user = c0_s2_coretodctlb_ld_user;
    I_coretodctlb_st_type c0_s2_coretodctlb_st;
    assign c0_s2_coretodctlb_st.ckpid = c0_s2_coretodctlb_st_ckpid;
    assign c0_s2_coretodctlb_st.coreid = c0_s2_coretodctlb_st_coreid;
    assign c0_s2_coretodctlb_st.mop = c0_s2_coretodctlb_st_mop;
    assign c0_s2_coretodctlb_st.pnr = c0_s2_coretodctlb_st_pnr;
    assign c0_s2_coretodctlb_st.laddr = c0_s2_coretodctlb_st_laddr;
    assign c0_s2_coretodctlb_st.imm = c0_s2_coretodctlb_st_imm;
    assign c0_s2_coretodctlb_st.sptbr = c0_s2_coretodctlb_st_sptbr;
    assign c0_s2_coretodctlb_st.user = c0_s2_coretodctlb_st_user;
    I_coretodc_ld_type core0_slice3_coretodc_ld;
    assign core0_slice3_coretodc_ld.ckpid = core0_slice3_coretodc_ld_ckpid;
    assign core0_slice3_coretodc_ld.coreid = core0_slice3_coretodc_ld_coreid;
    assign core0_slice3_coretodc_ld.lop = core0_slice3_coretodc_ld_lop;
    assign core0_slice3_coretodc_ld.pnr = core0_slice3_coretodc_ld_pnr;
    assign core0_slice3_coretodc_ld.pcsign = core0_slice3_coretodc_ld_pcsign;
    assign core0_slice3_coretodc_ld.poffset = core0_slice3_coretodc_ld_poffset;
    assign core0_slice3_coretodc_ld.imm = core0_slice3_coretodc_ld_imm;
    I_dctocore_ld_type core0_slice3_dctocore_ld;
    assign core0_slice3_dctocore_ld_coreid = core0_slice3_dctocore_ld.coreid;
    assign core0_slice3_dctocore_ld_fault = core0_slice3_dctocore_ld.fault;
    assign core0_slice3_dctocore_ld_data = core0_slice3_dctocore_ld.data;
    I_coretodc_std_type core0_slice3_coretodc_std;
    assign core0_slice3_coretodc_std.ckpid = core0_slice3_coretodc_std_ckpid;
    assign core0_slice3_coretodc_std.coreid = core0_slice3_coretodc_std_coreid;
    assign core0_slice3_coretodc_std.mop = core0_slice3_coretodc_std_mop;
    assign core0_slice3_coretodc_std.pnr = core0_slice3_coretodc_std_pnr;
    assign core0_slice3_coretodc_std.pcsign = core0_slice3_coretodc_std_pcsign;
    assign core0_slice3_coretodc_std.poffset = core0_slice3_coretodc_std_poffset;
    assign core0_slice3_coretodc_std.imm = core0_slice3_coretodc_std_imm;
    assign core0_slice3_coretodc_std.data = core0_slice3_coretodc_std_data;
    I_dctocore_std_ack_type core0_slice3_dctocore_std_ack;
    assign core0_slice3_dctocore_std_ack_fault = core0_slice3_dctocore_std_ack.fault;
    assign core0_slice3_dctocore_std_ack_coreid = core0_slice3_dctocore_std_ack.coreid;
    I_coretodctlb_ld_type c0_s3_coretodctlb_ld;
    assign c0_s3_coretodctlb_ld.ckpid = c0_s3_coretodctlb_ld_ckpid;
    assign c0_s3_coretodctlb_ld.coreid = c0_s3_coretodctlb_ld_coreid;
    assign c0_s3_coretodctlb_ld.lop = c0_s3_coretodctlb_ld_lop;
    assign c0_s3_coretodctlb_ld.pnr = c0_s3_coretodctlb_ld_pnr;
    assign c0_s3_coretodctlb_ld.laddr = c0_s3_coretodctlb_ld_laddr;
    assign c0_s3_coretodctlb_ld.imm = c0_s3_coretodctlb_ld_imm;
    assign c0_s3_coretodctlb_ld.sptbr = c0_s3_coretodctlb_ld_sptbr;
    assign c0_s3_coretodctlb_ld.user = c0_s3_coretodctlb_ld_user;
    I_coretodctlb_st_type c0_s3_coretodctlb_st;
    assign c0_s3_coretodctlb_st.ckpid = c0_s3_coretodctlb_st_ckpid;
    assign c0_s3_coretodctlb_st.coreid = c0_s3_coretodctlb_st_coreid;
    assign c0_s3_coretodctlb_st.mop = c0_s3_coretodctlb_st_mop;
    assign c0_s3_coretodctlb_st.pnr = c0_s3_coretodctlb_st_pnr;
    assign c0_s3_coretodctlb_st.laddr = c0_s3_coretodctlb_st_laddr;
    assign c0_s3_coretodctlb_st.imm = c0_s3_coretodctlb_st_imm;
    assign c0_s3_coretodctlb_st.sptbr = c0_s3_coretodctlb_st_sptbr;
    assign c0_s3_coretodctlb_st.user = c0_s3_coretodctlb_st_user;
`endif
    I_pfgtopfe_op_type core0_pfgtopfe_op;
    assign core0_pfgtopfe_op.delta = core0_pfgtopfe_op_delta;
    assign core0_pfgtopfe_op.w1 = core0_pfgtopfe_op_w1;
    assign core0_pfgtopfe_op.w2 = core0_pfgtopfe_op_w2;
    assign core0_pfgtopfe_op.pcsign = core0_pfgtopfe_op_pcsign;
    assign core0_pfgtopfe_op.laddr = core0_pfgtopfe_op_laddr;
    assign core0_pfgtopfe_op.sptbr = core0_pfgtopfe_op_sptbr;
    I_coretoic_pc_type core1_coretoic_pc;
    assign core1_coretoic_pc.coreid = core1_coretoic_pc_coreid;
    assign core1_coretoic_pc.poffset = core1_coretoic_pc_poffset;
    I_ictocore_type core1_ictocore;
    assign core1_ictocore_coreid = core1_ictocore.coreid;
    assign core1_ictocore_fault = core1_ictocore.fault;
    assign core1_ictocore_data = core1_ictocore.data;
    I_coretodc_ld_type core1_slice0_coretodc_ld;
    assign core1_slice0_coretodc_ld.ckpid = core1_slice0_coretodc_ld_ckpid;
    assign core1_slice0_coretodc_ld.coreid = core1_slice0_coretodc_ld_coreid;
    assign core1_slice0_coretodc_ld.lop = core1_slice0_coretodc_ld_lop;
    assign core1_slice0_coretodc_ld.pnr = core1_slice0_coretodc_ld_pnr;
    assign core1_slice0_coretodc_ld.pcsign = core1_slice0_coretodc_ld_pcsign;
    assign core1_slice0_coretodc_ld.poffset = core1_slice0_coretodc_ld_poffset;
    assign core1_slice0_coretodc_ld.imm = core1_slice0_coretodc_ld_imm;
    I_dctocore_ld_type core1_slice0_dctocore_ld;
    assign core1_slice0_dctocore_ld_coreid = core1_slice0_dctocore_ld.coreid;
    assign core1_slice0_dctocore_ld_fault = core1_slice0_dctocore_ld.fault;
    assign core1_slice0_dctocore_ld_data = core1_slice0_dctocore_ld.data;
    I_coretodc_std_type core1_slice0_coretodc_std;
    assign core1_slice0_coretodc_std.ckpid = core1_slice0_coretodc_std_ckpid;
    assign core1_slice0_coretodc_std.coreid = core1_slice0_coretodc_std_coreid;
    assign core1_slice0_coretodc_std.mop = core1_slice0_coretodc_std_mop;
    assign core1_slice0_coretodc_std.pnr = core1_slice0_coretodc_std_pnr;
    assign core1_slice0_coretodc_std.pcsign = core1_slice0_coretodc_std_pcsign;
    assign core1_slice0_coretodc_std.poffset = core1_slice0_coretodc_std_poffset;
    assign core1_slice0_coretodc_std.imm = core1_slice0_coretodc_std_imm;
    assign core1_slice0_coretodc_std.data = core1_slice0_coretodc_std_data;
    I_dctocore_std_ack_type core1_slice0_dctocore_std_ack;
    assign core1_slice0_dctocore_std_ack_fault = core1_slice0_dctocore_std_ack.fault;
    assign core1_slice0_dctocore_std_ack_coreid = core1_slice0_dctocore_std_ack.coreid;
    I_coretodctlb_ld_type c1_s0_coretodctlb_ld;
    assign c1_s0_coretodctlb_ld.ckpid = c1_s0_coretodctlb_ld_ckpid;
    assign c1_s0_coretodctlb_ld.coreid = c1_s0_coretodctlb_ld_coreid;
    assign c1_s0_coretodctlb_ld.lop = c1_s0_coretodctlb_ld_lop;
    assign c1_s0_coretodctlb_ld.pnr = c1_s0_coretodctlb_ld_pnr;
    assign c1_s0_coretodctlb_ld.laddr = c1_s0_coretodctlb_ld_laddr;
    assign c1_s0_coretodctlb_ld.imm = c1_s0_coretodctlb_ld_imm;
    assign c1_s0_coretodctlb_ld.sptbr = c1_s0_coretodctlb_ld_sptbr;
    assign c1_s0_coretodctlb_ld.user = c1_s0_coretodctlb_ld_user;
    I_coretodctlb_st_type c1_s0_coretodctlb_st;
    assign c1_s0_coretodctlb_st.ckpid = c1_s0_coretodctlb_st_ckpid;
    assign c1_s0_coretodctlb_st.coreid = c1_s0_coretodctlb_st_coreid;
    assign c1_s0_coretodctlb_st.mop = c1_s0_coretodctlb_st_mop;
    assign c1_s0_coretodctlb_st.pnr = c1_s0_coretodctlb_st_pnr;
    assign c1_s0_coretodctlb_st.laddr = c1_s0_coretodctlb_st_laddr;
    assign c1_s0_coretodctlb_st.imm = c1_s0_coretodctlb_st_imm;
    assign c1_s0_coretodctlb_st.sptbr = c1_s0_coretodctlb_st_sptbr;
    assign c1_s0_coretodctlb_st.user = c1_s0_coretodctlb_st_user;
    I_coretodc_ld_type core1_slice1_coretodc_ld;
    assign core1_slice1_coretodc_ld.ckpid = core1_slice1_coretodc_ld_ckpid;
    assign core1_slice1_coretodc_ld.coreid = core1_slice1_coretodc_ld_coreid;
    assign core1_slice1_coretodc_ld.lop = core1_slice1_coretodc_ld_lop;
    assign core1_slice1_coretodc_ld.pnr = core1_slice1_coretodc_ld_pnr;
    assign core1_slice1_coretodc_ld.pcsign = core1_slice1_coretodc_ld_pcsign;
    assign core1_slice1_coretodc_ld.poffset = core1_slice1_coretodc_ld_poffset;
    assign core1_slice1_coretodc_ld.imm = core1_slice1_coretodc_ld_imm;
    I_dctocore_ld_type core1_slice1_dctocore_ld;
    assign core1_slice1_dctocore_ld_coreid = core1_slice1_dctocore_ld.coreid;
    assign core1_slice1_dctocore_ld_fault = core1_slice1_dctocore_ld.fault;
    assign core1_slice1_dctocore_ld_data = core1_slice1_dctocore_ld.data;
    I_coretodc_std_type core1_slice1_coretodc_std;
    assign core1_slice1_coretodc_std.ckpid = core1_slice1_coretodc_std_ckpid;
    assign core1_slice1_coretodc_std.coreid = core1_slice1_coretodc_std_coreid;
    assign core1_slice1_coretodc_std.mop = core1_slice1_coretodc_std_mop;
    assign core1_slice1_coretodc_std.pnr = core1_slice1_coretodc_std_pnr;
    assign core1_slice1_coretodc_std.pcsign = core1_slice1_coretodc_std_pcsign;
    assign core1_slice1_coretodc_std.poffset = core1_slice1_coretodc_std_poffset;
    assign core1_slice1_coretodc_std.imm = core1_slice1_coretodc_std_imm;
    assign core1_slice1_coretodc_std.data = core1_slice1_coretodc_std_data;
    I_dctocore_std_ack_type core1_slice1_dctocore_std_ack;
    assign core1_slice1_dctocore_std_ack_fault = core1_slice1_dctocore_std_ack.fault;
    assign core1_slice1_dctocore_std_ack_coreid = core1_slice1_dctocore_std_ack.coreid;
    I_coretodctlb_ld_type c1_s1_coretodctlb_ld;
    assign c1_s1_coretodctlb_ld.ckpid = c1_s1_coretodctlb_ld_ckpid;
    assign c1_s1_coretodctlb_ld.coreid = c1_s1_coretodctlb_ld_coreid;
    assign c1_s1_coretodctlb_ld.lop = c1_s1_coretodctlb_ld_lop;
    assign c1_s1_coretodctlb_ld.pnr = c1_s1_coretodctlb_ld_pnr;
    assign c1_s1_coretodctlb_ld.laddr = c1_s1_coretodctlb_ld_laddr;
    assign c1_s1_coretodctlb_ld.imm = c1_s1_coretodctlb_ld_imm;
    assign c1_s1_coretodctlb_ld.sptbr = c1_s1_coretodctlb_ld_sptbr;
    assign c1_s1_coretodctlb_ld.user = c1_s1_coretodctlb_ld_user;
    I_coretodctlb_st_type c1_s1_coretodctlb_st;
    assign c1_s1_coretodctlb_st.ckpid = c1_s1_coretodctlb_st_ckpid;
    assign c1_s1_coretodctlb_st.coreid = c1_s1_coretodctlb_st_coreid;
    assign c1_s1_coretodctlb_st.mop = c1_s1_coretodctlb_st_mop;
    assign c1_s1_coretodctlb_st.pnr = c1_s1_coretodctlb_st_pnr;
    assign c1_s1_coretodctlb_st.laddr = c1_s1_coretodctlb_st_laddr;
    assign c1_s1_coretodctlb_st.imm = c1_s1_coretodctlb_st_imm;
    assign c1_s1_coretodctlb_st.sptbr = c1_s1_coretodctlb_st_sptbr;
    assign c1_s1_coretodctlb_st.user = c1_s1_coretodctlb_st_user;
`ifdef SC_4PIPE
    I_coretodc_ld_type core1_slice2_coretodc_ld;
    assign core1_slice2_coretodc_ld.ckpid = core1_slice2_coretodc_ld_ckpid;
    assign core1_slice2_coretodc_ld.coreid = core1_slice2_coretodc_ld_coreid;
    assign core1_slice2_coretodc_ld.lop = core1_slice2_coretodc_ld_lop;
    assign core1_slice2_coretodc_ld.pnr = core1_slice2_coretodc_ld_pnr;
    assign core1_slice2_coretodc_ld.pcsign = core1_slice2_coretodc_ld_pcsign;
    assign core1_slice2_coretodc_ld.poffset = core1_slice2_coretodc_ld_poffset;
    assign core1_slice2_coretodc_ld.imm = core1_slice2_coretodc_ld_imm;
    I_dctocore_ld_type core1_slice2_dctocore_ld;
    assign core1_slice2_dctocore_ld_coreid = core1_slice2_dctocore_ld.coreid;
    assign core1_slice2_dctocore_ld_fault = core1_slice2_dctocore_ld.fault;
    assign core1_slice2_dctocore_ld_data = core1_slice2_dctocore_ld.data;
    I_coretodc_std_type core1_slice2_coretodc_std;
    assign core1_slice2_coretodc_std.ckpid = core1_slice2_coretodc_std_ckpid;
    assign core1_slice2_coretodc_std.coreid = core1_slice2_coretodc_std_coreid;
    assign core1_slice2_coretodc_std.mop = core1_slice2_coretodc_std_mop;
    assign core1_slice2_coretodc_std.pnr = core1_slice2_coretodc_std_pnr;
    assign core1_slice2_coretodc_std.pcsign = core1_slice2_coretodc_std_pcsign;
    assign core1_slice2_coretodc_std.poffset = core1_slice2_coretodc_std_poffset;
    assign core1_slice2_coretodc_std.imm = core1_slice2_coretodc_std_imm;
    assign core1_slice2_coretodc_std.data = core1_slice2_coretodc_std_data;
    I_dctocore_std_ack_type core1_slice2_dctocore_std_ack;
    assign core1_slice2_dctocore_std_ack_fault = core1_slice2_dctocore_std_ack.fault;
    assign core1_slice2_dctocore_std_ack_coreid = core1_slice2_dctocore_std_ack.coreid;
    I_coretodctlb_ld_type c1_s2_coretodctlb_ld;
    assign c1_s2_coretodctlb_ld.ckpid = c1_s2_coretodctlb_ld_ckpid;
    assign c1_s2_coretodctlb_ld.coreid = c1_s2_coretodctlb_ld_coreid;
    assign c1_s2_coretodctlb_ld.lop = c1_s2_coretodctlb_ld_lop;
    assign c1_s2_coretodctlb_ld.pnr = c1_s2_coretodctlb_ld_pnr;
    assign c1_s2_coretodctlb_ld.laddr = c1_s2_coretodctlb_ld_laddr;
    assign c1_s2_coretodctlb_ld.imm = c1_s2_coretodctlb_ld_imm;
    assign c1_s2_coretodctlb_ld.sptbr = c1_s2_coretodctlb_ld_sptbr;
    assign c1_s2_coretodctlb_ld.user = c1_s2_coretodctlb_ld_user;
    I_coretodctlb_st_type c1_s2_coretodctlb_st;
    assign c1_s2_coretodctlb_st.ckpid = c1_s2_coretodctlb_st_ckpid;
    assign c1_s2_coretodctlb_st.coreid = c1_s2_coretodctlb_st_coreid;
    assign c1_s2_coretodctlb_st.mop = c1_s2_coretodctlb_st_mop;
    assign c1_s2_coretodctlb_st.pnr = c1_s2_coretodctlb_st_pnr;
    assign c1_s2_coretodctlb_st.laddr = c1_s2_coretodctlb_st_laddr;
    assign c1_s2_coretodctlb_st.imm = c1_s2_coretodctlb_st_imm;
    assign c1_s2_coretodctlb_st.sptbr = c1_s2_coretodctlb_st_sptbr;
    assign c1_s2_coretodctlb_st.user = c1_s2_coretodctlb_st_user;
    I_coretodc_ld_type core1_slice3_coretodc_ld;
    assign core1_slice3_coretodc_ld.ckpid = core1_slice3_coretodc_ld_ckpid;
    assign core1_slice3_coretodc_ld.coreid = core1_slice3_coretodc_ld_coreid;
    assign core1_slice3_coretodc_ld.lop = core1_slice3_coretodc_ld_lop;
    assign core1_slice3_coretodc_ld.pnr = core1_slice3_coretodc_ld_pnr;
    assign core1_slice3_coretodc_ld.pcsign = core1_slice3_coretodc_ld_pcsign;
    assign core1_slice3_coretodc_ld.poffset = core1_slice3_coretodc_ld_poffset;
    assign core1_slice3_coretodc_ld.imm = core1_slice3_coretodc_ld_imm;
    I_dctocore_ld_type core1_slice3_dctocore_ld;
    assign core1_slice3_dctocore_ld_coreid = core1_slice3_dctocore_ld.coreid;
    assign core1_slice3_dctocore_ld_fault = core1_slice3_dctocore_ld.fault;
    assign core1_slice3_dctocore_ld_data = core1_slice3_dctocore_ld.data;
    I_coretodc_std_type core1_slice3_coretodc_std;
    assign core1_slice3_coretodc_std.ckpid = core1_slice3_coretodc_std_ckpid;
    assign core1_slice3_coretodc_std.coreid = core1_slice3_coretodc_std_coreid;
    assign core1_slice3_coretodc_std.mop = core1_slice3_coretodc_std_mop;
    assign core1_slice3_coretodc_std.pnr = core1_slice3_coretodc_std_pnr;
    assign core1_slice3_coretodc_std.pcsign = core1_slice3_coretodc_std_pcsign;
    assign core1_slice3_coretodc_std.poffset = core1_slice3_coretodc_std_poffset;
    assign core1_slice3_coretodc_std.imm = core1_slice3_coretodc_std_imm;
    assign core1_slice3_coretodc_std.data = core1_slice3_coretodc_std_data;
    I_dctocore_std_ack_type core1_slice3_dctocore_std_ack;
    assign core1_slice3_dctocore_std_ack_fault = core1_slice3_dctocore_std_ack.fault;
    assign core1_slice3_dctocore_std_ack_coreid = core1_slice3_dctocore_std_ack.coreid;
    I_coretodctlb_ld_type c1_s3_coretodctlb_ld;
    assign c1_s3_coretodctlb_ld.ckpid = c1_s3_coretodctlb_ld_ckpid;
    assign c1_s3_coretodctlb_ld.coreid = c1_s3_coretodctlb_ld_coreid;
    assign c1_s3_coretodctlb_ld.lop = c1_s3_coretodctlb_ld_lop;
    assign c1_s3_coretodctlb_ld.pnr = c1_s3_coretodctlb_ld_pnr;
    assign c1_s3_coretodctlb_ld.laddr = c1_s3_coretodctlb_ld_laddr;
    assign c1_s3_coretodctlb_ld.imm = c1_s3_coretodctlb_ld_imm;
    assign c1_s3_coretodctlb_ld.sptbr = c1_s3_coretodctlb_ld_sptbr;
    assign c1_s3_coretodctlb_ld.user = c1_s3_coretodctlb_ld_user;
    I_coretodctlb_st_type c1_s3_coretodctlb_st;
    assign c1_s3_coretodctlb_st.ckpid = c1_s3_coretodctlb_st_ckpid;
    assign c1_s3_coretodctlb_st.coreid = c1_s3_coretodctlb_st_coreid;
    assign c1_s3_coretodctlb_st.mop = c1_s3_coretodctlb_st_mop;
    assign c1_s3_coretodctlb_st.pnr = c1_s3_coretodctlb_st_pnr;
    assign c1_s3_coretodctlb_st.laddr = c1_s3_coretodctlb_st_laddr;
    assign c1_s3_coretodctlb_st.imm = c1_s3_coretodctlb_st_imm;
    assign c1_s3_coretodctlb_st.sptbr = c1_s3_coretodctlb_st_sptbr;
    assign c1_s3_coretodctlb_st.user = c1_s3_coretodctlb_st_user;
`endif
    I_pfgtopfe_op_type core1_pfgtopfe_op;
    assign core1_pfgtopfe_op.delta = core1_pfgtopfe_op_delta;
    assign core1_pfgtopfe_op.w1 = core1_pfgtopfe_op_w1;
    assign core1_pfgtopfe_op.w2 = core1_pfgtopfe_op_w2;
    assign core1_pfgtopfe_op.pcsign = core1_pfgtopfe_op_pcsign;
    assign core1_pfgtopfe_op.laddr = core1_pfgtopfe_op_laddr;
    assign core1_pfgtopfe_op.sptbr = core1_pfgtopfe_op_sptbr;
    I_drtomem_req_type dr0_drtomem_req;
    assign dr0_drtomem_req_drid = dr0_drtomem_req.drid;
    assign dr0_drtomem_req_cmd = dr0_drtomem_req.cmd;
    assign dr0_drtomem_req_paddr = dr0_drtomem_req.paddr;
    I_memtodr_ack_type dr0_memtodr_ack;
    assign dr0_memtodr_ack.drid = dr0_memtodr_ack_drid;
    assign dr0_memtodr_ack.nid = dr0_memtodr_ack_nid;
    assign dr0_memtodr_ack.paddr = dr0_memtodr_ack_paddr;
    assign dr0_memtodr_ack.ack = dr0_memtodr_ack_ack;
    assign dr0_memtodr_ack.line = dr0_memtodr_ack_line;
    I_drtomem_wb_type dr0_drtomem_wb;
    assign dr0_drtomem_wb_line = dr0_drtomem_wb.line;
    assign dr0_drtomem_wb_paddr = dr0_drtomem_wb.paddr;
    I_drtomem_pfreq_type dr0_drtomem_pfreq;
    assign dr0_drtomem_pfreq_nid = dr0_drtomem_pfreq.nid;
    assign dr0_drtomem_pfreq_paddr = dr0_drtomem_pfreq.paddr;
    I_drtomem_req_type dr1_drtomem_req;
    assign dr1_drtomem_req_drid = dr1_drtomem_req.drid;
    assign dr1_drtomem_req_cmd = dr1_drtomem_req.cmd;
    assign dr1_drtomem_req_paddr = dr1_drtomem_req.paddr;
    I_memtodr_ack_type dr1_memtodr_ack;
    assign dr1_memtodr_ack.drid = dr1_memtodr_ack_drid;
    assign dr1_memtodr_ack.nid = dr1_memtodr_ack_nid;
    assign dr1_memtodr_ack.paddr = dr1_memtodr_ack_paddr;
    assign dr1_memtodr_ack.ack = dr1_memtodr_ack_ack;
    assign dr1_memtodr_ack.line = dr1_memtodr_ack_line;
    I_drtomem_wb_type dr1_drtomem_wb;
    assign dr1_drtomem_wb_line = dr1_drtomem_wb.line;
    assign dr1_drtomem_wb_paddr = dr1_drtomem_wb.paddr;
    I_drtomem_pfreq_type dr1_drtomem_pfreq;
    assign dr1_drtomem_pfreq_nid = dr1_drtomem_pfreq.nid;
    assign dr1_drtomem_pfreq_paddr = dr1_drtomem_pfreq.paddr;
top_2core2dr top(.*);
endmodule