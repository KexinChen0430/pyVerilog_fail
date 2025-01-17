module ictlb_wp(
  /* verilator lint_off UNUSED */
    input   logic               clk
    ,input  logic               reset
  // core interface
    ,input  logic               coretoictlb_pc_valid
    ,output logic               coretoictlb_pc_retry
    //  ,input  I_coretoictlb_pc_type    coretoictlb_pc
    ,input  CORE_reqid_type     coretoictlb_pc_coreid
    ,input  SC_laddr_type       coretoictlb_pc_laddr
    ,input  SC_sptbr_type       coretoictlb_pc_sptbr
  // prefetch request (uses the fwd port opportunistically)
    ,input  logic               pfetol1tlb_req_valid
    ,output logic               pfetol1tlb_req_retry
    //  ,input  I_pfetol1tlb_req_type    pfetol1tlb_req
    ,input  logic               pfetol1tlb_req_l2
    ,input  SC_laddr_type       pfetol1tlb_req_laddr
    ,input  SC_sptbr_type       pfetol1tlb_req_sptbr
  // forward st core interface
    ,output logic               l1tlbtol1_fwd_valid
    ,input  logic               l1tlbtol1_fwd_retry
    //  ,output I_l1tlbtol1_fwd_type     l1tlbtol1_fwd
    ,output CORE_reqid_type     l1tlbtol1_fwd_coreid
    ,output logic               l1tlbtol1_fwd_prefetch
    ,output logic               l1tlbtol1_fwd_l2_prefetch
    ,output SC_fault_type       l1tlbtol1_fwd_fault
    ,output TLB_hpaddr_type     l1tlbtol1_fwd_hpaddr
    ,output SC_ppaddr_type      l1tlbtol1_fwd_ppaddr
  // Notify the L1 that the index of the TLB is gone
    ,output logic               l1tlbtol1_cmd_valid
    ,input  logic               l1tlbtol1_cmd_retry
    //  ,output I_l1tlbtol1_cmd_type     l1tlbtol1_cmd
    ,output logic               l1tlbtol1_cmd_flush
    ,output TLB_hpaddr_type     l1tlbtol1_cmd_hpaddr
  // Interface with the L2 TLB
    ,input  logic               l2tlbtol1tlb_snoop_valid
    ,output logic               l2tlbtol1tlb_snoop_retry
    //  ,input I_l2tlbtol1tlb_snoop_type l2tlbtol1tlb_snoop
    ,input  TLB_reqid_type      l2tlbtol1tlb_snoop_rid
    ,input  TLB_hpaddr_type     l2tlbtol1tlb_snoop_hpaddr
    ,input  logic               l2tlbtol1tlb_ack_valid
    ,output logic               l2tlbtol1tlb_ack_retry
    //  ,input I_l2tlbtol1tlb_ack_type   l2tlbtol1tlb_ack
    ,input  TLB_reqid_type      l2tlbtol1tlb_ack_rid
    ,input  TLB_hpaddr_type     l2tlbtol1tlb_ack_hpaddr
    ,input  SC_ppaddr_type      l2tlbtol1tlb_ack_ppaddr
    ,input  SC_dctlbe_type      l2tlbtol1tlb_ack_dctlbe
    ,output logic               l1tlbtol2tlb_req_valid
    ,input  logic               l1tlbtol2tlb_req_retry
    //  ,output I_l1tlbtol2tlb_req_type  l1tlbtol2tlb_req
    ,output TLB_reqid_type      l1tlbtol2tlb_req_rid
    ,output logic               l1tlbtol2tlb_req_disp_req
    ,output logic               l1tlbtol2tlb_req_disp_A
    ,output logic               l1tlbtol2tlb_req_disp_D
    ,output TLB_hpaddr_type     l1tlbtol2tlb_req_disp_hpaddr
    ,output SC_laddr_type       l1tlbtol2tlb_req_laddr
    ,output SC_sptbr_type       l1tlbtol2tlb_req_sptbr
    ,output logic               l1tlbtol2tlb_sack_valid
    ,input  logic               l1tlbtol2tlb_sack_retry
    //  ,output I_l1tlbtol2tlb_sack_type l1tlbtol2tlb_sack
    ,output TLB_reqid_type      l1tlbtol2tlb_sack_rid
  /* verilator lint_on UNUSED */
);
    I_coretoictlb_pc_type coretoictlb_pc;
    assign coretoictlb_pc.coreid = coretoictlb_pc_coreid;
    assign coretoictlb_pc.laddr = coretoictlb_pc_laddr;
    assign coretoictlb_pc.sptbr = coretoictlb_pc_sptbr;
    I_pfetol1tlb_req_type pfetol1tlb_req;
    assign pfetol1tlb_req.l2 = pfetol1tlb_req_l2;
    assign pfetol1tlb_req.laddr = pfetol1tlb_req_laddr;
    assign pfetol1tlb_req.sptbr = pfetol1tlb_req_sptbr;
    I_l1tlbtol1_fwd_type l1tlbtol1_fwd;
    assign l1tlbtol1_fwd_coreid = l1tlbtol1_fwd.coreid;
    assign l1tlbtol1_fwd_prefetch = l1tlbtol1_fwd.prefetch;
    assign l1tlbtol1_fwd_l2_prefetch = l1tlbtol1_fwd.l2_prefetch;
    assign l1tlbtol1_fwd_fault = l1tlbtol1_fwd.fault;
    assign l1tlbtol1_fwd_hpaddr = l1tlbtol1_fwd.hpaddr;
    assign l1tlbtol1_fwd_ppaddr = l1tlbtol1_fwd.ppaddr;
    I_l1tlbtol1_cmd_type l1tlbtol1_cmd;
    assign l1tlbtol1_cmd_flush = l1tlbtol1_cmd.flush;
    assign l1tlbtol1_cmd_hpaddr = l1tlbtol1_cmd.hpaddr;
    I_l2tlbtol1tlb_snoop_type l2tlbtol1tlb_snoop;
    assign l2tlbtol1tlb_snoop.rid = l2tlbtol1tlb_snoop_rid;
    assign l2tlbtol1tlb_snoop.hpaddr = l2tlbtol1tlb_snoop_hpaddr;
    I_l2tlbtol1tlb_ack_type l2tlbtol1tlb_ack;
    assign l2tlbtol1tlb_ack.rid = l2tlbtol1tlb_ack_rid;
    assign l2tlbtol1tlb_ack.hpaddr = l2tlbtol1tlb_ack_hpaddr;
    assign l2tlbtol1tlb_ack.ppaddr = l2tlbtol1tlb_ack_ppaddr;
    assign l2tlbtol1tlb_ack.dctlbe = l2tlbtol1tlb_ack_dctlbe;
    I_l1tlbtol2tlb_req_type l1tlbtol2tlb_req;
    assign l1tlbtol2tlb_req_rid = l1tlbtol2tlb_req.rid;
    assign l1tlbtol2tlb_req_disp_req = l1tlbtol2tlb_req.disp_req;
    assign l1tlbtol2tlb_req_disp_A = l1tlbtol2tlb_req.disp_A;
    assign l1tlbtol2tlb_req_disp_D = l1tlbtol2tlb_req.disp_D;
    assign l1tlbtol2tlb_req_disp_hpaddr = l1tlbtol2tlb_req.disp_hpaddr;
    assign l1tlbtol2tlb_req_laddr = l1tlbtol2tlb_req.laddr;
    assign l1tlbtol2tlb_req_sptbr = l1tlbtol2tlb_req.sptbr;
    I_l1tlbtol2tlb_sack_type l1tlbtol2tlb_sack;
    assign l1tlbtol2tlb_sack_rid = l1tlbtol2tlb_sack.rid;
ictlb ictlb_dut(.*);
endmodule