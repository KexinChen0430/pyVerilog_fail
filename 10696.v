module
  wire alu_req_alu = alu_op & i_rdwen;// Regular ALU only req datapath when it need to write-back
`ifdef E203_SUPPORT_SHARE_MULDIV //{
  wire muldiv_req_alu = mdv_op;// Since MULDIV have no point to let rd=0, so always need ALU datapath
`endif//E203_SUPPORT_SHARE_MULDIV}
  wire bjp_req_alu = bjp_op;// Since BJP may not write-back, but still need ALU datapath
  wire agu_req_alu = agu_op;// Since AGU may have some other features, so always need ALU datapath
  e203_exu_alu_dpath u_e203_exu_alu_dpath(
      .alu_req_alu         (alu_req_alu           ),
      .alu_req_alu_add     (alu_req_alu_add       ),
      .alu_req_alu_sub     (alu_req_alu_sub       ),
      .alu_req_alu_xor     (alu_req_alu_xor       ),
      .alu_req_alu_sll     (alu_req_alu_sll       ),
      .alu_req_alu_srl     (alu_req_alu_srl       ),
      .alu_req_alu_sra     (alu_req_alu_sra       ),
      .alu_req_alu_or      (alu_req_alu_or        ),
      .alu_req_alu_and     (alu_req_alu_and       ),
      .alu_req_alu_slt     (alu_req_alu_slt       ),
      .alu_req_alu_sltu    (alu_req_alu_sltu      ),
      .alu_req_alu_lui     (alu_req_alu_lui       ),
      .alu_req_alu_op1     (alu_req_alu_op1       ),
      .alu_req_alu_op2     (alu_req_alu_op2       ),
      .alu_req_alu_res     (alu_req_alu_res       ),
      .bjp_req_alu         (bjp_req_alu           ),
      .bjp_req_alu_op1     (bjp_req_alu_op1       ),
      .bjp_req_alu_op2     (bjp_req_alu_op2       ),
      .bjp_req_alu_cmp_eq  (bjp_req_alu_cmp_eq    ),
      .bjp_req_alu_cmp_ne  (bjp_req_alu_cmp_ne    ),
      .bjp_req_alu_cmp_lt  (bjp_req_alu_cmp_lt    ),
      .bjp_req_alu_cmp_gt  (bjp_req_alu_cmp_gt    ),
      .bjp_req_alu_cmp_ltu (bjp_req_alu_cmp_ltu   ),
      .bjp_req_alu_cmp_gtu (bjp_req_alu_cmp_gtu   ),
      .bjp_req_alu_add     (bjp_req_alu_add       ),
      .bjp_req_alu_cmp_res (bjp_req_alu_cmp_res   ),
      .bjp_req_alu_add_res (bjp_req_alu_add_res   ),
      .agu_req_alu         (agu_req_alu           ),
      .agu_req_alu_op1     (agu_req_alu_op1       ),
      .agu_req_alu_op2     (agu_req_alu_op2       ),
      .agu_req_alu_swap    (agu_req_alu_swap      ),
      .agu_req_alu_add     (agu_req_alu_add       ),
      .agu_req_alu_and     (agu_req_alu_and       ),
      .agu_req_alu_or      (agu_req_alu_or        ),
      .agu_req_alu_xor     (agu_req_alu_xor       ),
      .agu_req_alu_max     (agu_req_alu_max       ),
      .agu_req_alu_min     (agu_req_alu_min       ),
      .agu_req_alu_maxu    (agu_req_alu_maxu      ),
      .agu_req_alu_minu    (agu_req_alu_minu      ),
      .agu_req_alu_res     (agu_req_alu_res       ),
      .agu_sbf_0_ena       (agu_sbf_0_ena         ),
      .agu_sbf_0_nxt       (agu_sbf_0_nxt         ),
      .agu_sbf_0_r         (agu_sbf_0_r           ),
      .agu_sbf_1_ena       (agu_sbf_1_ena         ),
      .agu_sbf_1_nxt       (agu_sbf_1_nxt         ),
      .agu_sbf_1_r         (agu_sbf_1_r           ),
`ifdef E203_SUPPORT_SHARE_MULDIV //{
      .muldiv_req_alu      (muldiv_req_alu    ),
      .muldiv_req_alu_op1  (muldiv_req_alu_op1),
      .muldiv_req_alu_op2  (muldiv_req_alu_op2),
      .muldiv_req_alu_add  (muldiv_req_alu_add),
      .muldiv_req_alu_sub  (muldiv_req_alu_sub),
      .muldiv_req_alu_res  (muldiv_req_alu_res),
      .muldiv_sbf_0_ena    (muldiv_sbf_0_ena  ),
      .muldiv_sbf_0_nxt    (muldiv_sbf_0_nxt  ),
      .muldiv_sbf_0_r      (muldiv_sbf_0_r    ),
      .muldiv_sbf_1_ena    (muldiv_sbf_1_ena  ),
      .muldiv_sbf_1_nxt    (muldiv_sbf_1_nxt  ),
      .muldiv_sbf_1_r      (muldiv_sbf_1_r    ),
`endif//E203_SUPPORT_SHARE_MULDIV}
      .clk                 (clk           ),
      .rst_n               (rst_n         )
    );
  wire ifu_excp_o_valid;
  wire ifu_excp_o_ready;
  wire [`E203_XLEN-1:0] ifu_excp_o_wbck_wdat;
  wire ifu_excp_o_wbck_err;
  assign ifu_excp_i_ready = ifu_excp_o_ready;
  assign ifu_excp_o_valid = ifu_excp_i_valid;
  assign ifu_excp_o_wbck_wdat = `E203_XLEN'b0;
  assign ifu_excp_o_wbck_err  = 1'b1;// IFU illegal instruction always treat as error
  // Aribtrate the Result and generate output interfaces
  wire o_valid;
  wire o_ready;
  wire o_sel_ifu_excp = ifu_excp_op;
  wire o_sel_alu = alu_op;
  wire o_sel_bjp = bjp_op;
  wire o_sel_csr = csr_op;
  wire o_sel_agu = agu_op;
`ifdef E203_SUPPORT_SHARE_MULDIV //{
  wire o_sel_mdv = mdv_op;
`endif//E203_SUPPORT_SHARE_MULDIV}
  assign o_valid =     (o_sel_alu      & alu_o_valid     )
                     | (o_sel_bjp      & bjp_o_valid     )
                     | (o_sel_csr      & csr_o_valid     )
                     | (o_sel_agu      & agu_o_valid     )
                     | (o_sel_ifu_excp & ifu_excp_o_valid)
                      `ifdef E203_SUPPORT_SHARE_MULDIV //{
                     | (o_sel_mdv      & mdv_o_valid     )
                      `endif//E203_SUPPORT_SHARE_MULDIV}
                     ;
  assign ifu_excp_o_ready = o_sel_ifu_excp & o_ready;
  assign alu_o_ready      = o_sel_alu & o_ready;
  assign agu_o_ready      = o_sel_agu & o_ready;
`ifdef E203_SUPPORT_SHARE_MULDIV //{
  assign mdv_o_ready      = o_sel_mdv & o_ready;
`endif//E203_SUPPORT_SHARE_MULDIV}
  assign bjp_o_ready      = o_sel_bjp & o_ready;
  assign csr_o_ready      = o_sel_csr & o_ready;
  assign wbck_o_wdat =
                    ({`E203_XLEN{o_sel_alu}} & alu_o_wbck_wdat)
                  | ({`E203_XLEN{o_sel_bjp}} & bjp_o_wbck_wdat)
                  | ({`E203_XLEN{o_sel_csr}} & csr_o_wbck_wdat)
                  | ({`E203_XLEN{o_sel_agu}} & agu_o_wbck_wdat)
                      `ifdef E203_SUPPORT_SHARE_MULDIV //{
                  | ({`E203_XLEN{o_sel_mdv}} & mdv_o_wbck_wdat)
                      `endif//E203_SUPPORT_SHARE_MULDIV}
                  | ({`E203_XLEN{o_sel_ifu_excp}} & ifu_excp_o_wbck_wdat)
                  ;
  assign wbck_o_rdidx = i_rdidx;
  wire wbck_o_rdwen = i_rdwen;
  wire wbck_o_err =
                    ({1{o_sel_alu}} & alu_o_wbck_err)
                  | ({1{o_sel_bjp}} & bjp_o_wbck_err)
                  | ({1{o_sel_csr}} & csr_o_wbck_err)
                  | ({1{o_sel_agu}} & agu_o_wbck_err)
                      `ifdef E203_SUPPORT_SHARE_MULDIV //{
                  | ({1{o_sel_mdv}} & mdv_o_wbck_err)
                      `endif//E203_SUPPORT_SHARE_MULDIV}
                  | ({1{o_sel_ifu_excp}} & ifu_excp_o_wbck_err)
                  ;
  //  Each Instruction need to commit or write-back
  //     the result (need to write RD), and it is not a long-pipe uop
  //     (need to be write back by its long-pipe write-back, not here)
  wire o_need_wbck = wbck_o_rdwen & (~i_longpipe) & (~wbck_o_err);
  wire o_need_cmt  = 1'b1;
  assign o_ready =
           (o_need_cmt  ? cmt_o_ready  : 1'b1)
         & (o_need_wbck ? wbck_o_ready : 1'b1);
  assign wbck_o_valid = o_need_wbck & o_valid & (o_need_cmt  ? cmt_o_ready  : 1'b1);
  assign cmt_o_valid  = o_need_cmt  & o_valid & (o_need_wbck ? wbck_o_ready : 1'b1);
  //  The commint interface have some special signals
  assign cmt_o_instr   = i_instr;
  assign cmt_o_pc   = i_pc;
  assign cmt_o_imm  = i_imm;
  assign cmt_o_rv32 = i_info[`E203_DECINFO_RV32];
    // The cmt_o_pc_vld is used by the commit stage to check
    // if current instruction is outputing a valid current PC
    //   to guarante the commit to flush pipeline safely, this
    //   vld only be asserted when:
    //             value to stored in DPC or EPC
  assign cmt_o_pc_vld      =
              // Otherwise, just use the i_pc_vld
                              i_pc_vld;
  assign cmt_o_misalgn     = (o_sel_agu & agu_o_cmt_misalgn)
                           ;
  assign cmt_o_ld          = (o_sel_agu & agu_o_cmt_ld)
                           ;
  assign cmt_o_badaddr     = ({`E203_ADDR_SIZE{o_sel_agu}} & agu_o_cmt_badaddr)
                           ;
  assign cmt_o_buserr      = o_sel_agu & agu_o_cmt_buserr;
  assign cmt_o_stamo       = o_sel_agu & agu_o_cmt_stamo ;
  assign cmt_o_bjp         = o_sel_bjp & bjp_o_cmt_bjp;
  assign cmt_o_mret        = o_sel_bjp & bjp_o_cmt_mret;
  assign cmt_o_dret        = o_sel_bjp & bjp_o_cmt_dret;
  assign cmt_o_bjp_prdt    = o_sel_bjp & bjp_o_cmt_prdt;
  assign cmt_o_bjp_rslv    = o_sel_bjp & bjp_o_cmt_rslv;
  assign cmt_o_fencei      = o_sel_bjp & bjp_o_cmt_fencei;
  assign cmt_o_ecall       = o_sel_alu & alu_o_cmt_ecall;
  assign cmt_o_ebreak      = o_sel_alu & alu_o_cmt_ebreak;
  assign cmt_o_wfi         = o_sel_alu & alu_o_cmt_wfi;
  assign cmt_o_ifu_misalgn = i_misalgn;
  assign cmt_o_ifu_buserr  = i_buserr;
  assign cmt_o_ifu_ilegl   = i_ilegl
                           | (o_sel_csr & csr_access_ilgl)
                        ;
endmodule