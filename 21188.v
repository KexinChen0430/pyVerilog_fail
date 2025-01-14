module outputs)
   wire                 ctl_dp_ecc_sel_frf;     // From ctl of sparc_ffu_ctl.v
   wire [9:0]           ctl_dp_exc_w2;          // From ctl of sparc_ffu_ctl.v
   wire [7:0]           ctl_dp_fcc_w2;          // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_flip_fpu;        // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_flip_lsu;        // From ctl of sparc_ffu_ctl.v
   wire [3:0]           ctl_dp_fp_thr;          // From ctl of sparc_ffu_ctl.v
   wire [3:0]           ctl_dp_fsr_sel_fpu;     // From ctl of sparc_ffu_ctl.v
   wire [3:0]           ctl_dp_fsr_sel_ld;      // From ctl of sparc_ffu_ctl.v
   wire [3:0]           ctl_dp_fsr_sel_old;     // From ctl of sparc_ffu_ctl.v
   wire [2:0]           ctl_dp_ftt_w2;          // From ctl of sparc_ffu_ctl.v
   wire [3:0]           ctl_dp_gsr_wsr_w2;      // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_new_rs1;         // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_noflip_fpu;      // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_noflip_lsu;      // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_noshift64_frf;   // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_output_sel_frf;  // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_output_sel_fsr;  // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_output_sel_rs1;  // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_output_sel_rs2;  // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_rd_ecc;          // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_rs2_frf_read;    // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_rs2_keep_data;   // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_rs2_sel_fpu_lsu; // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_rs2_sel_vis;     // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_rst_l;           // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_shift_frf_left;  // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_shift_frf_right; // From ctl of sparc_ffu_ctl.v
   wire [1:0]           ctl_dp_sign;            // From ctl of sparc_ffu_ctl.v
   wire [3:0]           ctl_dp_thr_e;           // From ctl of sparc_ffu_ctl.v
   wire [36:0]          ctl_dp_wsr_data_w2;     // From ctl of sparc_ffu_ctl.v
   wire                 ctl_dp_zero_low32_frf;  // From ctl of sparc_ffu_ctl.v
   wire [6:0]           ctl_frf_addr;           // From ctl of sparc_ffu_ctl.v
   wire                 ctl_frf_ren;            // From ctl of sparc_ffu_ctl.v
   wire [1:0]           ctl_frf_wen;            // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_add32;          // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_align0;         // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_align2;         // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_align4;         // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_align6;         // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_align_odd;      // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_cin;            // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_log_constant;   // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_log_invert_rs1; // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_log_invert_rs2; // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_log_pass_const; // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_log_pass_rs1;   // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_log_pass_rs2;   // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_log_sel_nand;   // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_log_sel_nor;    // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_log_sel_pass;   // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_log_sel_xor;    // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_sel_add;        // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_sel_align;      // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_sel_log;        // From ctl of sparc_ffu_ctl.v
   wire                 ctl_vis_subtract;       // From ctl of sparc_ffu_ctl.v
   wire [4:0]           dp_ctl_fsr_aexc;        // From dp of sparc_ffu_dp.v
   wire [4:0]           dp_ctl_fsr_cexc;        // From dp of sparc_ffu_dp.v
   wire [7:0]           dp_ctl_fsr_fcc;         // From dp of sparc_ffu_dp.v
   wire [1:0]           dp_ctl_fsr_rnd;         // From dp of sparc_ffu_dp.v
   wire [4:0]           dp_ctl_fsr_tem;         // From dp of sparc_ffu_dp.v
   wire [31:0]          dp_ctl_gsr_mask_e;      // From dp of sparc_ffu_dp.v
   wire [4:0]           dp_ctl_gsr_scale_e;     // From dp of sparc_ffu_dp.v
   wire [7:0]           dp_ctl_ld_fcc;          // From dp of sparc_ffu_dp.v
   wire [1:0]           dp_ctl_rs2_sign;        // From dp of sparc_ffu_dp.v
   wire [6:0]           dp_ctl_synd_out_high;   // From dp of sparc_ffu_dp.v
   wire [6:0]           dp_ctl_synd_out_low;    // From dp of sparc_ffu_dp.v
   wire [63:0]          dp_vis_rs1_data;        // From dp of sparc_ffu_dp.v
   wire [63:0]          dp_vis_rs2_data;        // From dp of sparc_ffu_dp.v
   wire [77:0]          frf_dp_data;            // From frf of bw_r_frf.v
   wire [63:0]          vis_dp_rd_data;         // From vis of sparc_ffu_vis.v
   // End of automatics
   wire [77:0]          dp_frf_data;
   output [63:0]        ffu_exu_rsr_data_m;
   wire [31:0]          ffu_exu_rsr_data_hi_m;
   wire [2:0]          ffu_exu_rsr_data_mid_m;
   wire [7:0]          ffu_exu_rsr_data_lo_m;
   wire                short_scan_1;
   assign              ffu_exu_rsr_data_m[63:0] = {ffu_exu_rsr_data_hi_m[31:0], 4'b0,
                                                   ffu_exu_rsr_data_mid_m[2:0], 17'b0,
                                                   ffu_exu_rsr_data_lo_m[7:0]};
   bw_r_frf frf(
                .si(short_si0),
                .so(short_scan_1),
                .dp_frf_data            (dp_frf_data[77:0]),
                .rst_tri_en             (mem_write_disable),
                /*AUTOINST*/
                // Outputs
                .frf_dp_data            (frf_dp_data[77:0]),
                // Inputs
                .rclk                   (rclk),
                .se                     (se),
                .sehold                 (sehold),
                .ctl_frf_wen            (ctl_frf_wen[1:0]),
                .ctl_frf_ren            (ctl_frf_ren),
                .ctl_frf_addr           (ctl_frf_addr[6:0]));
   sparc_ffu_dp dp(
                   .dp_frf_data         ({dp_frf_data[70:39],dp_frf_data[31:0]}),
                   /*AUTOINST*/
                   // Outputs
                   .so                  (so),
                   .ffu_lsu_data        (ffu_lsu_data[63:0]),
                   .dp_vis_rs1_data     (dp_vis_rs1_data[63:0]),
                   .dp_vis_rs2_data     (dp_vis_rs2_data[63:0]),
                   .dp_ctl_rs2_sign     (dp_ctl_rs2_sign[1:0]),
                   .dp_ctl_fsr_fcc      (dp_ctl_fsr_fcc[7:0]),
                   .dp_ctl_fsr_rnd      (dp_ctl_fsr_rnd[1:0]),
                   .dp_ctl_fsr_tem      (dp_ctl_fsr_tem[4:0]),
                   .dp_ctl_fsr_aexc     (dp_ctl_fsr_aexc[4:0]),
                   .dp_ctl_fsr_cexc     (dp_ctl_fsr_cexc[4:0]),
                   .dp_ctl_ld_fcc       (dp_ctl_ld_fcc[7:0]),
                   .dp_ctl_gsr_mask_e   (dp_ctl_gsr_mask_e[31:0]),
                   .dp_ctl_gsr_scale_e  (dp_ctl_gsr_scale_e[4:0]),
                   .dp_ctl_synd_out_low (dp_ctl_synd_out_low[6:0]),
                   .dp_ctl_synd_out_high(dp_ctl_synd_out_high[6:0]),
                   // Inputs
                   .rclk                (rclk),
                   .se                  (se),
                   .si                  (si),
                   .ctl_dp_rst_l        (ctl_dp_rst_l),
                   .frf_dp_data         (frf_dp_data[77:0]),
                   .cpx_fpu_data        (cpx_fpu_data[63:0]),
                   .lsu_ffu_ld_data     (lsu_ffu_ld_data[63:0]),
                   .vis_dp_rd_data      (vis_dp_rd_data[63:0]),
                   .ctl_dp_wsr_data_w2  (ctl_dp_wsr_data_w2[36:0]),
                   .ctl_dp_sign         (ctl_dp_sign[1:0]),
                   .ctl_dp_exc_w2       (ctl_dp_exc_w2[9:0]),
                   .ctl_dp_fcc_w2       (ctl_dp_fcc_w2[7:0]),
                   .ctl_dp_ftt_w2       (ctl_dp_ftt_w2[2:0]),
                   .ctl_dp_noshift64_frf(ctl_dp_noshift64_frf),
                   .ctl_dp_shift_frf_right(ctl_dp_shift_frf_right),
                   .ctl_dp_shift_frf_left(ctl_dp_shift_frf_left),
                   .ctl_dp_zero_low32_frf(ctl_dp_zero_low32_frf),
                   .ctl_dp_output_sel_rs1(ctl_dp_output_sel_rs1),
                   .ctl_dp_output_sel_rs2(ctl_dp_output_sel_rs2),
                   .ctl_dp_output_sel_frf(ctl_dp_output_sel_frf),
                   .ctl_dp_output_sel_fsr(ctl_dp_output_sel_fsr),
                   .ctl_dp_noflip_lsu   (ctl_dp_noflip_lsu),
                   .ctl_dp_flip_lsu     (ctl_dp_flip_lsu),
                   .ctl_dp_noflip_fpu   (ctl_dp_noflip_fpu),
                   .ctl_dp_flip_fpu     (ctl_dp_flip_fpu),
                   .ctl_dp_rs2_frf_read (ctl_dp_rs2_frf_read),
                   .ctl_dp_rs2_sel_vis  (ctl_dp_rs2_sel_vis),
                   .ctl_dp_rs2_sel_fpu_lsu(ctl_dp_rs2_sel_fpu_lsu),
                   .ctl_dp_rs2_keep_data(ctl_dp_rs2_keep_data),
                   .ctl_dp_rd_ecc       (ctl_dp_rd_ecc),
                   .ctl_dp_fp_thr       (ctl_dp_fp_thr[3:0]),
                   .ctl_dp_fsr_sel_old  (ctl_dp_fsr_sel_old[3:0]),
                   .ctl_dp_fsr_sel_ld   (ctl_dp_fsr_sel_ld[3:0]),
                   .ctl_dp_fsr_sel_fpu  (ctl_dp_fsr_sel_fpu[3:0]),
                   .ctl_dp_gsr_wsr_w2   (ctl_dp_gsr_wsr_w2[3:0]),
                   .ctl_dp_thr_e        (ctl_dp_thr_e[3:0]),
                   .ctl_dp_new_rs1      (ctl_dp_new_rs1),
                   .ctl_dp_ecc_sel_frf  (ctl_dp_ecc_sel_frf));
   sparc_ffu_ctl ctl(
                     .si(short_scan_1),
                     .so                (short_so0),
                     .ffu_exu_rsr_data_hi_m(ffu_exu_rsr_data_hi_m[31:0]),
                     .ffu_exu_rsr_data_lo_m(ffu_exu_rsr_data_lo_m[7:0]),
                     .ffu_exu_rsr_data_mid_m(ffu_exu_rsr_data_mid_m[2:0]),
                     .ctl_frf_write_synd({dp_frf_data[77:71],dp_frf_data[38:32]}),
                     .rst_tri_en        (mux_drive_disable),
                     /*AUTOINST*/
                     // Outputs
                     .ctl_dp_gsr_wsr_w2 (ctl_dp_gsr_wsr_w2[3:0]),
                     .ctl_dp_thr_e      (ctl_dp_thr_e[3:0]),
                     .ctl_dp_wsr_data_w2(ctl_dp_wsr_data_w2[36:0]),
                     .ctl_vis_add32     (ctl_vis_add32),
                     .ctl_vis_align0    (ctl_vis_align0),
                     .ctl_vis_align2    (ctl_vis_align2),
                     .ctl_vis_align4    (ctl_vis_align4),
                     .ctl_vis_align6    (ctl_vis_align6),
                     .ctl_vis_align_odd (ctl_vis_align_odd),
                     .ctl_vis_cin       (ctl_vis_cin),
                     .ctl_vis_log_constant(ctl_vis_log_constant),
                     .ctl_vis_log_invert_rs1(ctl_vis_log_invert_rs1),
                     .ctl_vis_log_invert_rs2(ctl_vis_log_invert_rs2),
                     .ctl_vis_log_pass_const(ctl_vis_log_pass_const),
                     .ctl_vis_log_pass_rs1(ctl_vis_log_pass_rs1),
                     .ctl_vis_log_pass_rs2(ctl_vis_log_pass_rs2),
                     .ctl_vis_log_sel_nand(ctl_vis_log_sel_nand),
                     .ctl_vis_log_sel_nor(ctl_vis_log_sel_nor),
                     .ctl_vis_log_sel_pass(ctl_vis_log_sel_pass),
                     .ctl_vis_log_sel_xor(ctl_vis_log_sel_xor),
                     .ctl_vis_sel_add   (ctl_vis_sel_add),
                     .ctl_vis_sel_align (ctl_vis_sel_align),
                     .ctl_vis_sel_log   (ctl_vis_sel_log),
                     .ctl_vis_subtract  (ctl_vis_subtract),
                     .ctl_dp_rst_l      (ctl_dp_rst_l),
                     .ffu_ifu_fpop_done_w2(ffu_ifu_fpop_done_w2),
                     .ffu_ifu_cc_vld_w2 (ffu_ifu_cc_vld_w2[3:0]),
                     .ffu_ifu_cc_w2     (ffu_ifu_cc_w2[7:0]),
                     .ffu_ifu_tid_w2    (ffu_ifu_tid_w2[1:0]),
                     .ffu_ifu_stallreq  (ffu_ifu_stallreq),
                     .ffu_ifu_ecc_ce_w2 (ffu_ifu_ecc_ce_w2),
                     .ffu_ifu_ecc_ue_w2 (ffu_ifu_ecc_ue_w2),
                     .ffu_ifu_err_reg_w2(ffu_ifu_err_reg_w2[5:0]),
                     .ffu_ifu_err_synd_w2(ffu_ifu_err_synd_w2[13:0]),
                     .ffu_ifu_fst_ce_w  (ffu_ifu_fst_ce_w),
                     .ffu_lsu_kill_fst_w(ffu_lsu_kill_fst_w),
                     .ffu_ifu_inj_ack   (ffu_ifu_inj_ack),
                     .ffu_lsu_data      (ffu_lsu_data[80:64]),
                     .ffu_lsu_fpop_rq_vld(ffu_lsu_fpop_rq_vld),
                     .ffu_lsu_blk_st_va_e(ffu_lsu_blk_st_va_e[5:3]),
                     .ffu_lsu_blk_st_e  (ffu_lsu_blk_st_e),
                     .ffu_tlu_trap_ieee754(ffu_tlu_trap_ieee754),
                     .ffu_tlu_trap_other(ffu_tlu_trap_other),
                     .ffu_tlu_trap_ue   (ffu_tlu_trap_ue),
                     .ffu_tlu_ill_inst_m(ffu_tlu_ill_inst_m),
                     .ffu_tlu_fpu_tid   (ffu_tlu_fpu_tid[1:0]),
                     .ffu_tlu_fpu_cmplt (ffu_tlu_fpu_cmplt),
                     .ctl_frf_ren       (ctl_frf_ren),
                     .ctl_frf_wen       (ctl_frf_wen[1:0]),
                     .ctl_frf_addr      (ctl_frf_addr[6:0]),
                     .ctl_dp_fp_thr     (ctl_dp_fp_thr[3:0]),
                     .ctl_dp_fcc_w2     (ctl_dp_fcc_w2[7:0]),
                     .ctl_dp_ftt_w2     (ctl_dp_ftt_w2[2:0]),
                     .ctl_dp_exc_w2     (ctl_dp_exc_w2[9:0]),
                     .ctl_dp_ecc_sel_frf(ctl_dp_ecc_sel_frf),
                     .ctl_dp_output_sel_rs1(ctl_dp_output_sel_rs1),
                     .ctl_dp_output_sel_rs2(ctl_dp_output_sel_rs2),
                     .ctl_dp_output_sel_frf(ctl_dp_output_sel_frf),
                     .ctl_dp_output_sel_fsr(ctl_dp_output_sel_fsr),
                     .ctl_dp_rs2_frf_read(ctl_dp_rs2_frf_read),
                     .ctl_dp_rs2_sel_vis(ctl_dp_rs2_sel_vis),
                     .ctl_dp_rs2_sel_fpu_lsu(ctl_dp_rs2_sel_fpu_lsu),
                     .ctl_dp_rs2_keep_data(ctl_dp_rs2_keep_data),
                     .ctl_dp_rd_ecc     (ctl_dp_rd_ecc),
                     .ctl_dp_fsr_sel_ld (ctl_dp_fsr_sel_ld[3:0]),
                     .ctl_dp_fsr_sel_fpu(ctl_dp_fsr_sel_fpu[3:0]),
                     .ctl_dp_fsr_sel_old(ctl_dp_fsr_sel_old[3:0]),
                     .ctl_dp_noshift64_frf(ctl_dp_noshift64_frf),
                     .ctl_dp_shift_frf_right(ctl_dp_shift_frf_right),
                     .ctl_dp_shift_frf_left(ctl_dp_shift_frf_left),
                     .ctl_dp_zero_low32_frf(ctl_dp_zero_low32_frf),
                     .ctl_dp_new_rs1    (ctl_dp_new_rs1),
                     .ctl_dp_sign       (ctl_dp_sign[1:0]),
                     .ctl_dp_flip_fpu   (ctl_dp_flip_fpu),
                     .ctl_dp_flip_lsu   (ctl_dp_flip_lsu),
                     .ctl_dp_noflip_fpu (ctl_dp_noflip_fpu),
                     .ctl_dp_noflip_lsu (ctl_dp_noflip_lsu),
                     // Inputs
                     .dp_ctl_gsr_mask_e (dp_ctl_gsr_mask_e[31:0]),
                     .dp_ctl_gsr_scale_e(dp_ctl_gsr_scale_e[4:0]),
                     .exu_ffu_gsr_align_m(exu_ffu_gsr_align_m[2:0]),
                     .exu_ffu_gsr_mask_m(exu_ffu_gsr_mask_m[31:0]),
                     .exu_ffu_gsr_rnd_m (exu_ffu_gsr_rnd_m[2:0]),
                     .exu_ffu_gsr_scale_m(exu_ffu_gsr_scale_m[4:0]),
                     .exu_ffu_wsr_inst_e(exu_ffu_wsr_inst_e),
                     .ifu_tlu_sraddr_d  (ifu_tlu_sraddr_d[6:0]),
                     .lsu_ffu_st_dtlb_perr_g  (lsu_ffu_st_dtlb_perr_g), //sotheas,8/17/04: fixed eco 6529
                     .rclk              (rclk),
                     .se                (se),
                     .grst_l            (grst_l),
                     .arst_l            (arst_l),
                     .dp_ctl_rs2_sign   (dp_ctl_rs2_sign[1:0]),
                     .cpx_vld           (cpx_vld),
                     .cpx_fcmp          (cpx_fcmp),
                     .cpx_req           (cpx_req[3:0]),
                     .cpx_fccval        (cpx_fccval[1:0]),
                     .cpx_fpexc         (cpx_fpexc[4:0]),
                     .dp_ctl_fsr_fcc    (dp_ctl_fsr_fcc[7:0]),
                     .dp_ctl_fsr_rnd    (dp_ctl_fsr_rnd[1:0]),
                     .dp_ctl_fsr_tem    (dp_ctl_fsr_tem[4:0]),
                     .dp_ctl_fsr_aexc   (dp_ctl_fsr_aexc[4:0]),
                     .dp_ctl_fsr_cexc   (dp_ctl_fsr_cexc[4:0]),
                     .dp_ctl_synd_out_low(dp_ctl_synd_out_low[6:0]),
                     .dp_ctl_synd_out_high(dp_ctl_synd_out_high[6:0]),
                     .ifu_ffu_fpop1_d   (ifu_ffu_fpop1_d),
                     .ifu_ffu_fpop2_d   (ifu_ffu_fpop2_d),
                     .ifu_ffu_visop_d   (ifu_ffu_visop_d),
                     .ifu_ffu_fpopcode_d(ifu_ffu_fpopcode_d[8:0]),
                     .ifu_ffu_frs1_d    (ifu_ffu_frs1_d[4:0]),
                     .ifu_ffu_frs2_d    (ifu_ffu_frs2_d[4:0]),
                     .ifu_ffu_frd_d     (ifu_ffu_frd_d[4:0]),
                     .ifu_ffu_fld_d     (ifu_ffu_fld_d),
                     .ifu_ffu_fst_d     (ifu_ffu_fst_d),
                     .ifu_ffu_ldst_single_d(ifu_ffu_ldst_single_d),
                     .ifu_ffu_tid_d     (ifu_ffu_tid_d[1:0]),
                     .ifu_ffu_fcc_num_d (ifu_ffu_fcc_num_d[1:0]),
                     .ifu_ffu_mvcnd_m   (ifu_ffu_mvcnd_m),
                     .ifu_ffu_inj_frferr(ifu_ffu_inj_frferr),
                     .ifu_exu_ecc_mask  (ifu_exu_ecc_mask[6:0]),
                     .ifu_ffu_ldfsr_d   (ifu_ffu_ldfsr_d),
                     .ifu_ffu_ldxfsr_d  (ifu_ffu_ldxfsr_d),
                     .ifu_ffu_stfsr_d   (ifu_ffu_stfsr_d),
                     .ifu_ffu_quad_op_e (ifu_ffu_quad_op_e),
                     .ifu_tlu_inst_vld_w(ifu_tlu_inst_vld_w),
                     .lsu_ffu_flush_pipe_w(lsu_ffu_flush_pipe_w),
                     .ifu_tlu_flush_w   (ifu_tlu_flush_w),
                     .lsu_ffu_ack       (lsu_ffu_ack),
                     .lsu_ffu_ld_vld    (lsu_ffu_ld_vld),
                     .lsu_ffu_bld_cnt_w (lsu_ffu_bld_cnt_w[2:0]),
                     .dp_ctl_ld_fcc     (dp_ctl_ld_fcc[7:0]),
                     .ifu_exu_nceen_e   (ifu_exu_nceen_e),
                     .ifu_exu_disable_ce_e(ifu_exu_disable_ce_e),
                     .lsu_ffu_blk_asi_e (lsu_ffu_blk_asi_e),
                     .exu_ffu_ist_e     (exu_ffu_ist_e),
                     .ifu_tlu_flsh_inst_e(ifu_tlu_flsh_inst_e),
                     .ifu_lsu_ld_inst_e (ifu_lsu_ld_inst_e),
                     .lsu_ffu_stb_full0 (lsu_ffu_stb_full0),
                     .lsu_ffu_stb_full1 (lsu_ffu_stb_full1),
                     .lsu_ffu_stb_full2 (lsu_ffu_stb_full2),
                     .lsu_ffu_stb_full3 (lsu_ffu_stb_full3));
   sparc_ffu_vis vis(/*AUTOINST*/
                     // Outputs
                     .vis_dp_rd_data    (vis_dp_rd_data[63:0]),
                     // Inputs
                     .dp_vis_rs1_data   (dp_vis_rs1_data[63:0]),
                     .dp_vis_rs2_data   (dp_vis_rs2_data[63:0]),
                     .ctl_vis_sel_add   (ctl_vis_sel_add),
                     .ctl_vis_sel_log   (ctl_vis_sel_log),
                     .ctl_vis_sel_align (ctl_vis_sel_align),
                     .ctl_vis_add32     (ctl_vis_add32),
                     .ctl_vis_subtract  (ctl_vis_subtract),
                     .ctl_vis_cin       (ctl_vis_cin),
                     .ctl_vis_align0    (ctl_vis_align0),
                     .ctl_vis_align2    (ctl_vis_align2),
                     .ctl_vis_align4    (ctl_vis_align4),
                     .ctl_vis_align6    (ctl_vis_align6),
                     .ctl_vis_align_odd (ctl_vis_align_odd),
                     .ctl_vis_log_sel_pass(ctl_vis_log_sel_pass),
                     .ctl_vis_log_sel_nand(ctl_vis_log_sel_nand),
                     .ctl_vis_log_sel_nor(ctl_vis_log_sel_nor),
                     .ctl_vis_log_sel_xor(ctl_vis_log_sel_xor),
                     .ctl_vis_log_invert_rs1(ctl_vis_log_invert_rs1),
                     .ctl_vis_log_invert_rs2(ctl_vis_log_invert_rs2),
                     .ctl_vis_log_constant(ctl_vis_log_constant),
                     .ctl_vis_log_pass_const(ctl_vis_log_pass_const),
                     .ctl_vis_log_pass_rs1(ctl_vis_log_pass_rs1),
                     .ctl_vis_log_pass_rs2(ctl_vis_log_pass_rs2));
endmodule