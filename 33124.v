module always ask for excepiton
  // The DebugMode-entry triggered Exception
  wire step_req_r;
  wire alu_ebreakm_flush_req;
  wire alu_dbgtrig_flush_req;
  // The priority from top to down
                              // dbg_trig_req ? 3'd2 :
                              // dbg_ebrk_req ? 3'd1 :
                              // dbg_irq_req  ? 3'd3 :
                              // dbg_step_req ? 3'd4 :
                              // dbg_halt_req ? 3'd5 :
        // Since the step_req_r is last cycle generated indicated, means last instruction is single-step
        //   and it have been commited in non debug-mode, and then this cyclc step_req_r is the of the highest priority
  wire   dbg_step_req = step_req_r;
  assign dbg_trig_req = alu_dbgtrig_flush_req & (~step_req_r);
  assign dbg_ebrk_req = alu_ebreakm_flush_req & (~alu_dbgtrig_flush_req) & (~step_req_r);
  wire   dbg_irq_req  = dbg_irq_r  & (~alu_ebreakm_flush_req) & (~alu_dbgtrig_flush_req) & (~step_req_r);
  wire   nonalu_dbg_irq_req  = dbg_irq_r & (~step_req_r);
        // The step have higher priority, and will preempt the halt
  wire   dbg_halt_req = dbg_halt_r & (~dbg_irq_r) & (~alu_ebreakm_flush_req) & (~alu_dbgtrig_flush_req) & (~step_req_r) & (~dbg_step_r);
  wire   nonalu_dbg_halt_req = dbg_halt_r & (~dbg_irq_r) & (~step_req_r) & (~dbg_step_r);
  // The debug-step request will be set when currently the step_r is high, and one
  //   instruction (in non debug_mode) have been executed
  // The step request will be clear when
  //   core enter into the debug-mode
  wire step_req_set = (~dbg_mode) & dbg_step_r & cmt_ena & (~dbg_entry_taken_ena);
  wire step_req_clr = dbg_entry_taken_ena;
  wire step_req_ena = step_req_set | step_req_clr;
  wire step_req_nxt = step_req_set | (~step_req_clr);
  sirv_gnrl_dfflr #(1) step_req_dfflr (step_req_ena, step_req_nxt, step_req_r, clk, rst_n);
      // The debug-mode will mask off the debug-mode-entry
  wire dbg_entry_mask  = dbg_mode;
  assign dbg_entry_req = (~dbg_entry_mask) & (
                  // Why do we put a AMO_wait here, because the AMO instructions
                  //   is atomic, we must wait it to complete its all atomic operations
                  //   and during wait cycles irq must be masked, otherwise the irq_req
                  //   will block ALU commit (including AMO) and cause a deadlock
                  // Note: Only the async irq and halt and trig need to have this amo_wait to check
                  //   others are sync event, no need to check with this
                                              (dbg_irq_req & (~amo_wait))
                                            | (dbg_halt_req & (~amo_wait))
                                            | dbg_step_req
                                            | (dbg_trig_req & (~amo_wait))
                                            | dbg_ebrk_req
                                            );
  assign nonalu_dbg_entry_req = (~dbg_entry_mask) & (
                                              (nonalu_dbg_irq_req & (~amo_wait))
                                            | (nonalu_dbg_halt_req & (~amo_wait))
                                            | dbg_step_req
                                            //| (dbg_trig_req & (~amo_wait))
                                            //| dbg_ebrk_req
                                            );
  assign nonalu_dbg_entry_req_raw = (~dbg_entry_mask) & (
                                              dbg_irq_r
                                            | dbg_halt_r
                                            | step_req_r
                                            //| dbg_trig_req
                                            //| dbg_ebrk_req
                                            );
  // The IRQ triggered Exception
    // The debug mode will mask off the interrupts
    // The single-step mode will mask off the interrupts
  wire irq_mask  = dbg_mode | dbg_step_r | (~status_mie_r)
                  // Why do we put a AMO_wait here, because the AMO instructions
                  //   is atomic, we must wait it to complete its all atomic operations
                  //   and during wait cycles irq must be masked, otherwise the irq_req
                  //   will block ALU commit (including AMO) and cause a deadlock
                  // Dont need to worry about the clock gating issue, if amo_wait,
                  //   then defefinitely the ALU is active, and clock on
                   | amo_wait;
  wire wfi_irq_mask  = dbg_mode | dbg_step_r;
                  // Why dont we put amo_wait here, because this is for IRQ to wake
                  //   up the core from sleep mode, the core was in sleep mode, then
                  //   means there is no chance for it to still executing the AMO instructions
                  //   with oustanding uops, so we dont need to worry about it.
  wire irq_req_raw   = (
                                    //(|lcl_irq_r) // not support this now
                                    (ext_irq_r & meie_r)
                                  | (sft_irq_r & msie_r)
                                  | (tmr_irq_r & mtie_r)
                                  );
  assign irq_req     = (~irq_mask) & irq_req_raw;
  assign wfi_irq_req = (~wfi_irq_mask) & irq_req_raw;
  assign irq_req_active = wfi_flag_r ? wfi_irq_req : irq_req;
  wire [`E203_XLEN-1:0] irq_cause;
  assign irq_cause[31] = 1'b1;
  assign irq_cause[30:4] = 27'b0;
  assign irq_cause[3:0]  =  (sft_irq_r & msie_r) ? 4'd3  :  // 3  Machine software interrupt
                            (tmr_irq_r & mtie_r) ? 4'd7  :  // 7  Machine timer interrupt
                            (ext_irq_r & meie_r) ? 4'd11 :  // 11 Machine external interrupt
                                        4'b0;
  // The ALU triggered Exception
  // The ebreak instruction will generated regular exception when the ebreakm
  //    bit of DCSR reg is not set
  wire alu_excp_i_ebreak4excp = (alu_excp_i_ebreak & ((~dbg_ebreakm_r) | dbg_mode))
                                ;
  // The ebreak instruction will enter into the debug-mode when the ebreakm
  //    bit of DCSR reg is set
  wire alu_excp_i_ebreak4dbg = alu_excp_i_ebreak
                               & (~alu_need_flush)// override by other alu exceptions
                               & dbg_ebreakm_r
                               & (~dbg_mode);//Not in debug mode
  assign alu_ebreakm_flush_req = alu_excp_i_valid & alu_excp_i_ebreak4dbg;
  assign alu_ebreakm_flush_req_novld = alu_excp_i_ebreak4dbg;
    `ifndef E203_SUPPORT_TRIGM//{
    // We dont support the HW Trigger Module yet
  assign alu_dbgtrig_flush_req_novld = 1'b0;
  assign alu_dbgtrig_flush_req = 1'b0;
    `endif
  assign alu_need_flush =
            ( alu_excp_i_misalgn
            | alu_excp_i_buserr
            | alu_excp_i_ebreak4excp
            | alu_excp_i_ecall
            | alu_excp_i_ifu_misalgn
            | alu_excp_i_ifu_buserr
            | alu_excp_i_ifu_ilegl
            );
  // Update the CSRs (Mcause, .etc)
  wire longp_excp_flush_req_ld = longp_excp_flush_req & longp_excp_i_ld;
  wire longp_excp_flush_req_st = longp_excp_flush_req & longp_excp_i_st;
  wire longp_excp_flush_req_insterr = longp_excp_flush_req & longp_excp_i_insterr;
  wire alu_excp_flush_req_ld    = alu_excp_flush_req & alu_excp_i_ld;
  wire alu_excp_flush_req_stamo = alu_excp_flush_req & alu_excp_i_stamo;
  wire alu_excp_flush_req_ebreak      = (alu_excp_flush_req & alu_excp_i_ebreak4excp);
  wire alu_excp_flush_req_ecall       = (alu_excp_flush_req & alu_excp_i_ecall);
  wire alu_excp_flush_req_ifu_misalgn = (alu_excp_flush_req & alu_excp_i_ifu_misalgn);
  wire alu_excp_flush_req_ifu_buserr  = (alu_excp_flush_req & alu_excp_i_ifu_buserr);
  wire alu_excp_flush_req_ifu_ilegl   = (alu_excp_flush_req & alu_excp_i_ifu_ilegl);
  wire alu_excp_flush_req_ld_misalgn    = (alu_excp_flush_req_ld    & alu_excp_i_misalgn);// ALU load misalign
  wire alu_excp_flush_req_ld_buserr     = (alu_excp_flush_req_ld    & alu_excp_i_buserr);// ALU load bus error
  wire alu_excp_flush_req_stamo_misalgn = (alu_excp_flush_req_stamo & alu_excp_i_misalgn);// ALU store/AMO misalign
  wire alu_excp_flush_req_stamo_buserr  = (alu_excp_flush_req_stamo & alu_excp_i_buserr);// ALU store/AMO bus error
  wire longp_excp_flush_req_ld_buserr   = (longp_excp_flush_req_ld  & longp_excp_i_buserr);// Longpipe load bus error
  wire longp_excp_flush_req_st_buserr   = (longp_excp_flush_req_st  & longp_excp_i_buserr);// Longpipe store bus error
  wire excp_flush_by_alu_agu =
                     alu_excp_flush_req_ld_misalgn
                   | alu_excp_flush_req_ld_buserr
                   | alu_excp_flush_req_stamo_misalgn
                   | alu_excp_flush_req_stamo_buserr;
  wire excp_flush_by_longp_ldst =
                     longp_excp_flush_req_ld_buserr
                   | longp_excp_flush_req_st_buserr;
  wire [`E203_XLEN-1:0] excp_cause;
  assign excp_cause[31:5] = 27'b0;
  assign excp_cause[4:0]  =
      alu_excp_flush_req_ifu_misalgn? 5'd0 //Instruction address misaligned
    : alu_excp_flush_req_ifu_buserr ? 5'd1 //Instruction access fault
    : alu_excp_flush_req_ifu_ilegl  ? 5'd2 //Illegal instruction
    : alu_excp_flush_req_ebreak     ? 5'd3 //Breakpoint
    : alu_excp_flush_req_ld_misalgn ? 5'd4 //load address misalign
    : (longp_excp_flush_req_ld_buserr | alu_excp_flush_req_ld_buserr) ? 5'd5 //load access fault
    : alu_excp_flush_req_stamo_misalgn ? 5'd6 //Store/AMO address misalign
    : (longp_excp_flush_req_st_buserr | alu_excp_flush_req_stamo_buserr) ? 5'd7 //Store/AMO access fault
    : (alu_excp_flush_req_ecall & u_mode) ? 5'd8 //Environment call from U-mode
    : (alu_excp_flush_req_ecall & s_mode) ? 5'd9 //Environment call from S-mode
    : (alu_excp_flush_req_ecall & h_mode) ? 5'd10 //Environment call from H-mode
    : (alu_excp_flush_req_ecall & m_mode) ? 5'd11 //Environment call from M-mode
    : longp_excp_flush_req_insterr ? 5'd16// This only happened for the EAI long instructions actually
    : 5'h1F;//Otherwise a reserved value
  // mbadaddr is an XLEN-bit read-write register formatted as shown in Figure 3.21. When
  //   occurs, mbadaddr is written with the faulting address.
  // In Priv SPEC v1.10, the mbadaddr have been replaced to mtval, and added following points:
  //        instruction .
  //        setting for other exceptions.
  wire excp_flush_req_ld_misalgn = alu_excp_flush_req_ld_misalgn;
  wire excp_flush_req_ld_buserr  = alu_excp_flush_req_ld_buserr | longp_excp_flush_req_ld_buserr;
  //wire cmt_badaddr_update = all_excp_flush_req &
  //          (
  //            alu_excp_flush_req_ebreak
  //          | alu_excp_flush_req_ifu_misalgn
  //          | alu_excp_flush_req_ifu_buserr
  //          | excp_flush_by_alu_agu
  //          | excp_flush_by_longp_ldst);
            // Per Priv Spec v1.10, all trap need to update this register
            //     information to assist software in handling the trap.
  wire cmt_badaddr_update = excpirq_flush_req;
  assign cmt_badaddr = excp_flush_by_longp_ldst ? longp_excp_i_badaddr :
                       excp_flush_by_alu_agu    ? alu_excp_i_badaddr :
                       (alu_excp_flush_req_ebreak
                        | alu_excp_flush_req_ifu_misalgn
                        | alu_excp_flush_req_ifu_buserr) ? alu_excp_i_pc :
                       alu_excp_flush_req_ifu_ilegl ? alu_excp_i_instr :
                            `E203_ADDR_SIZE'b0;
  // We use the exact PC of long-instruction when exception happened, but
  //   to note since the later instruction may already commited, so long-pipe
  //   excpetion is async-imprecise exceptions
  assign cmt_epc = longp_excp_i_valid ? longp_excp_i_pc : alu_excp_i_pc;
  assign cmt_cause = excp_taken_ena ? excp_cause : irq_cause;
     // Any trap include exception and irq (exclude dbg_irq) will update mstatus register
            // In the debug mode, epc/cause/status/badaddr will not update badaddr
  assign cmt_epc_ena     = (~dbg_mode) & (excp_taken_ena | irq_taken_ena);
  assign cmt_cause_ena   = cmt_epc_ena;
  assign cmt_status_ena  = cmt_epc_ena;
  assign cmt_badaddr_ena = cmt_epc_ena & cmt_badaddr_update;
  assign cmt_dpc = alu_excp_i_pc;// The ALU PC is the current next commiting PC (not yet commited)
  assign cmt_dpc_ena = dbg_entry_taken_ena;
  wire cmt_dcause_set = dbg_entry_taken_ena;
  wire cmt_dcause_clr = cmt_dret_ena;
  wire [2:0] set_dcause_nxt =
                              dbg_trig_req ? 3'd2 :
                              dbg_ebrk_req ? 3'd1 :
                              dbg_irq_req  ? 3'd3 :
                              dbg_step_req ? 3'd4 :
                              dbg_halt_req ? 3'd5 :
                                             3'd0;
  assign cmt_dcause_ena = cmt_dcause_set | cmt_dcause_clr;
  assign cmt_dcause = cmt_dcause_set ? set_dcause_nxt : 3'd0;
endmodule