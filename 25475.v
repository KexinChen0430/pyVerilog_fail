module
assign sig_svm_check = msr[`pippo_MSR_PR_BITS] &
                    (((reg_uops == `REGOP_MTMSR) | (reg_uops == `REGOP_WRTEE) | (reg_uops == `REGOP_MFMSR)) |
                    (spr_addr[9] & (reg_uops == `REGOP_MFSPR) | (reg_uops == `REGOP_MFSPR)));
// MSR
// Note: 1, MSR of pippo only implemented: [PR][ME][CE][EE]
//       2, other unimplemented fields are keep to 1'b0;
//       3, reserved field operate as 405
assign msr_we = msr_expwe | (!sig_svm_check & (reg_uops == `REGOP_MTMSR) | (reg_uops == `REGOP_WRTEE));
// [TBV] msr_new logic's coding style: mux should be inferred, not priority decoder
assign msr_new[`pippo_MSR_PR_BITS] =
		(reg_uops == `REGOP_MTMSR)? spr_dat_i[`pippo_MSR_PR_BITS]:
		msr[`pippo_MSR_PR_BITS];
assign msr_new[`pippo_MSR_ME_BITS] =
		(reg_uops == `REGOP_MTMSR)? spr_dat_i[`pippo_MSR_ME_BITS]:
		msr[`pippo_MSR_ME_BITS];
assign msr_new[`pippo_MSR_CE_BITS] =
		(reg_uops == `REGOP_MTMSR)? spr_dat_i[`pippo_MSR_CE_BITS]:
		msr[`pippo_MSR_CE_BITS];
// wrtee/wrteei
assign msr_new[`pippo_MSR_EE_BITS] =
		(reg_uops == `REGOP_MTMSR)? spr_dat_i[`pippo_MSR_EE_BITS]:
		(reg_uops == `REGOP_WRTEE)? spr_dat_i[`pippo_MSR_EE_BITS]:
		msr[`pippo_MSR_EE_BITS];
always @(posedge clk or posedge rst)
	if (rst)
		msr <= #1 `pippo_MSR_RESET;
	else if (msr_expwe)
        msr <= #1 msr_except;
	else if (msr_we)
		msr <= #1 msr_new;
// GP SPR
reg [31:0]  usprg0;
reg [31:0]  sprg0, sprg1, sprg2, sprg3, sprg4, sprg5, sprg6, sprg7;
// USPRG0 - User
assign usprg0_sel = (spr_addr == `pippo_SPR_USPRG0);
assign usprg0_we = write_spr & usprg0_sel;
always @(posedge clk or posedge rst) begin
	if (rst)
		usprg0 <= #1 `pippo_SPR_USPRG0_RESET;
	else if (usprg0_we)
		usprg0 <= #1 spr_dat_i;
end
// SPRG0, SPRG1, SPRG2, SPRG3 - Privileged
assign sprg0_sel = (spr_addr == `pippo_SPR_SPRG0);
assign sprg1_sel = (spr_addr == `pippo_SPR_SPRG1);
assign sprg2_sel = (spr_addr == `pippo_SPR_SPRG2);
assign sprg3_sel = (spr_addr == `pippo_SPR_SPRG3);
assign sprg0_we = write_spr & sprg0_sel;
assign sprg1_we = write_spr & sprg1_sel;
assign sprg2_we = write_spr & sprg2_sel;
assign sprg3_we = write_spr & sprg3_sel;
always @(posedge clk or posedge rst) begin
	if (rst)
		sprg0 <= #1 `pippo_SPR_SPRG0_RESET;
	else if (sprg0_we)
		sprg0 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		sprg1 <= #1 `pippo_SPR_SPRG1_RESET;
	else if (sprg1_we)
		sprg1 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		sprg2 <= #1 `pippo_SPR_SPRG2_RESET;
	else if (sprg2_we)
		sprg2 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		sprg3 <= #1 `pippo_SPR_SPRG3_RESET;
	else if (sprg3_we)
		sprg3 <= #1 spr_dat_i;
end
// SPRG4, SPRG5, SPRG6, SPRG7 - User read, privileged write
assign sprg4_selu = (spr_addr == `pippo_SPR_SPRG4U);
assign sprg5_selu = (spr_addr == `pippo_SPR_SPRG5U);
assign sprg6_selu = (spr_addr == `pippo_SPR_SPRG6U);
assign sprg7_selu = (spr_addr == `pippo_SPR_SPRG7U);
assign sprg4_sel = (spr_addr == `pippo_SPR_SPRG4);
assign sprg5_sel = (spr_addr == `pippo_SPR_SPRG5);
assign sprg6_sel = (spr_addr == `pippo_SPR_SPRG6);
assign sprg7_sel = (spr_addr == `pippo_SPR_SPRG7);
assign sprg4_we = write_spr & sprg4_sel;
assign sprg5_we = write_spr & sprg5_sel;
assign sprg6_we = write_spr & sprg6_sel;
assign sprg7_we = write_spr & sprg7_sel;
always @(posedge clk or posedge rst) begin
	if (rst)
		sprg4 <= #1 `pippo_SPR_SPRG4_RESET;
	else if (sprg4_we)
		sprg4 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		sprg5 <= #1 `pippo_SPR_SPRG5_RESET;
	else if (sprg5_we)
		sprg5 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		sprg6 <= #1 `pippo_SPR_SPRG6_RESET;
	else if (sprg6_we)
		sprg6 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		sprg7 <= #1 `pippo_SPR_SPRG7_RESET;
	else if (sprg7_we)
		sprg7 <= #1 spr_dat_i;
end
// CR
//[TBD] weºÍwrÂß¼­¼ò»¯
wire    [2:0]   crf_d;
wire    [2:0]   crf_s;
wire    [7:0]   fxm;
assign crf_d = cr_addr[14:12];
assign crf_s = cr_addr[9:7];
assign fxm = cr_addr[8:1];
assign cr0_rd = ((reg_uops == `REGOP_MCRF) & crf_s == 3'b000);
assign cr1_rd = ((reg_uops == `REGOP_MCRF) & crf_s == 3'b001);
assign cr2_rd = ((reg_uops == `REGOP_MCRF) & crf_s == 3'b010);
assign cr3_rd = ((reg_uops == `REGOP_MCRF) & crf_s == 3'b011);
assign cr4_rd = ((reg_uops == `REGOP_MCRF) & crf_s == 3'b100);
assign cr5_rd = ((reg_uops == `REGOP_MCRF) & crf_s == 3'b101);
assign cr6_rd = ((reg_uops == `REGOP_MCRF) & crf_s == 3'b110);
assign cr7_rd = ((reg_uops == `REGOP_MCRF) & crf_s == 3'b111);
assign cr0_wr = ((reg_uops == `REGOP_MCRF) & crf_d == 3'b000) |
                ((reg_uops == `REGOP_MTCRF) & fxm[7]) |
                ((reg_uops == `REGOP_MCRXR) & crf_d == 3'b000);
assign cr1_wr = ((reg_uops == `REGOP_MCRF) & crf_d == 3'b001) |
                ((reg_uops == `REGOP_MTCRF) & fxm[6]) |
                ((reg_uops == `REGOP_MCRXR) & crf_d == 3'b001);
assign cr2_wr = ((reg_uops == `REGOP_MCRF) & crf_d == 3'b010) |
                ((reg_uops == `REGOP_MTCRF) & fxm[5]) |
                ((reg_uops == `REGOP_MCRXR) & crf_d == 3'b010);
assign cr3_wr = ((reg_uops == `REGOP_MCRF) & crf_d == 3'b011) |
                ((reg_uops == `REGOP_MTCRF) & fxm[4]) |
                ((reg_uops == `REGOP_MCRXR) & crf_d == 3'b011);
assign cr4_wr = ((reg_uops == `REGOP_MCRF) & crf_d == 3'b100) |
                ((reg_uops == `REGOP_MTCRF) & fxm[3]) |
                ((reg_uops == `REGOP_MCRXR) & crf_d == 3'b100);
assign cr5_wr = ((reg_uops == `REGOP_MCRF) & crf_d == 3'b101) |
                ((reg_uops == `REGOP_MTCRF) & fxm[2]) |
                ((reg_uops == `REGOP_MCRXR) & crf_d == 3'b101);
assign cr6_wr = ((reg_uops == `REGOP_MCRF) & crf_d == 3'b110) |
                ((reg_uops == `REGOP_MTCRF) & fxm[1]) |
                ((reg_uops == `REGOP_MCRXR) & crf_d == 3'b110);
assign cr7_wr = ((reg_uops == `REGOP_MCRF) & crf_d == 3'b111) |
                ((reg_uops == `REGOP_MTCRF) & fxm[0]) |
                ((reg_uops == `REGOP_MCRXR) & crf_d == 3'b111);
assign cr0_alu_we = cr_alu_we[7];
assign cr1_alu_we = cr_alu_we[6];
assign cr2_alu_we = cr_alu_we[5];
assign cr3_alu_we = cr_alu_we[4];
assign cr4_alu_we = cr_alu_we[3];
assign cr5_alu_we = cr_alu_we[2];
assign cr6_alu_we = cr_alu_we[1];
assign cr7_alu_we = cr_alu_we[0];
assign cr0_alu = cr_alu[31:28];
assign cr1_alu = cr_alu[27:24];
assign cr2_alu = cr_alu[23:20];
assign cr3_alu = cr_alu[19:16];
assign cr4_alu = cr_alu[15:12];
assign cr5_alu = cr_alu[11:8];
assign cr6_alu = cr_alu[7:4];
assign cr7_alu = cr_alu[3:0];
assign cr0_we = cr0_alu_we |
                cr0_lsu_we |
                ((reg_uops == `REGOP_MTCRF) & cr0_wr) |
                ((reg_uops == `REGOP_MCRXR) & cr0_wr) |
                ((reg_uops == `REGOP_MCRF) & cr0_wr);
assign cr0_new =
		cr0_alu_we ? cr0_alu :
		cr0_lsu_we ? cr0_lsu :
		((reg_uops == `REGOP_MCRXR) & cr0_wr) ? xer[31:28]:
		((reg_uops == `REGOP_MTCRF) & cr0_wr) ? spr_dat_i[31:28]:
		((reg_uops == `REGOP_MCRF) & cr0_wr) ?
            (cr0_rd ? cr0 :
             cr1_rd ? cr1 :
             cr2_rd ? cr2 :
             cr3_rd ? cr3 :
             cr4_rd ? cr4 :
             cr5_rd ? cr5 :
             cr6_rd ? cr6 :
             cr7) :
		cr0;
assign cr1_we = cr1_alu_we |
                ((reg_uops == `REGOP_MTCRF) & cr1_wr) |
                ((reg_uops == `REGOP_MCRXR) & cr1_wr) |
                ((reg_uops == `REGOP_MCRF) & cr1_wr);
assign cr1_new =
		cr1_alu_we ? cr1_alu :
		((reg_uops == `REGOP_MCRXR) & cr1_wr) ? xer[31:28]:
		((reg_uops == `REGOP_MTCRF) & cr1_wr) ? spr_dat_i[27:24]:
		((reg_uops == `REGOP_MCRF) & cr1_wr) ?
            (cr0_rd ? cr0 :
             cr1_rd ? cr1 :
             cr2_rd ? cr2 :
             cr3_rd ? cr3 :
             cr4_rd ? cr4 :
             cr5_rd ? cr5 :
             cr6_rd ? cr6 :
             cr7) :
		cr1;
assign cr2_we = cr2_alu_we |
                ((reg_uops == `REGOP_MTCRF) & cr2_wr) |
                ((reg_uops == `REGOP_MCRXR) & cr2_wr) |
                ((reg_uops == `REGOP_MCRF) & cr2_wr);
assign cr2_new =
		cr2_alu_we ? cr2_alu :
		((reg_uops == `REGOP_MCRXR) & cr2_wr) ? xer[31:28]:
		((reg_uops == `REGOP_MTCRF) & cr2_wr) ? spr_dat_i[23:20]:
		((reg_uops == `REGOP_MCRF) & cr2_wr) ?
            (cr0_rd ? cr0 :
             cr1_rd ? cr1 :
             cr2_rd ? cr2 :
             cr3_rd ? cr3 :
             cr4_rd ? cr4 :
             cr5_rd ? cr5 :
             cr6_rd ? cr6 :
             cr7) :
		cr2;
assign cr3_we = cr3_alu_we |
                ((reg_uops == `REGOP_MTCRF) & cr3_wr) |
                ((reg_uops == `REGOP_MCRXR) & cr3_wr) |
                ((reg_uops == `REGOP_MCRF) & cr3_wr);
assign cr3_new =
		cr3_alu_we ? cr3_alu :
		((reg_uops == `REGOP_MCRXR) & cr3_wr) ? xer[31:28]:
		((reg_uops == `REGOP_MTCRF) & cr3_wr) ? spr_dat_i[19:16]:
		((reg_uops == `REGOP_MCRF) & cr3_wr) ?
            (cr0_rd ? cr0 :
             cr1_rd ? cr1 :
             cr2_rd ? cr2 :
             cr3_rd ? cr3 :
             cr4_rd ? cr4 :
             cr5_rd ? cr5 :
             cr6_rd ? cr6 :
             cr7) :
		cr3;
assign cr4_we = cr4_alu_we |
                ((reg_uops == `REGOP_MTCRF) & cr4_wr) |
                ((reg_uops == `REGOP_MCRXR) & cr4_wr) |
                ((reg_uops == `REGOP_MCRF) & cr4_wr);
assign cr4_new =
		cr4_alu_we ? cr4_alu :
		((reg_uops == `REGOP_MCRXR) & cr4_wr) ? xer[31:28]:
		((reg_uops == `REGOP_MTCRF) & cr4_wr) ? spr_dat_i[15:12]:
		((reg_uops == `REGOP_MCRF) & cr4_wr) ?
            (cr0_rd ? cr0 :
             cr1_rd ? cr1 :
             cr2_rd ? cr2 :
             cr3_rd ? cr3 :
             cr4_rd ? cr4 :
             cr5_rd ? cr5 :
             cr6_rd ? cr6 :
             cr7) :
		cr4;
assign cr5_we = cr5_alu_we |
                ((reg_uops == `REGOP_MTCRF) & cr5_wr) |
                ((reg_uops == `REGOP_MCRXR) & cr5_wr) |
                ((reg_uops == `REGOP_MCRF) & cr5_wr);
assign cr5_new =
		cr5_alu_we ? cr5_alu :
		((reg_uops == `REGOP_MCRXR) & cr5_wr) ? xer[31:28]:
		((reg_uops == `REGOP_MTCRF) & cr5_wr) ? spr_dat_i[11:8]:
		((reg_uops == `REGOP_MCRF) & cr5_wr) ?
            (cr0_rd ? cr0 :
             cr1_rd ? cr1 :
             cr2_rd ? cr2 :
             cr3_rd ? cr3 :
             cr4_rd ? cr4 :
             cr5_rd ? cr5 :
             cr6_rd ? cr6 :
             cr7) :
		cr5;
assign cr6_we = cr6_alu_we |
                ((reg_uops == `REGOP_MTCRF) & cr6_wr) |
                ((reg_uops == `REGOP_MCRXR) & cr6_wr) |
                ((reg_uops == `REGOP_MCRF) & cr6_wr);
assign cr6_new =
		cr6_alu_we ? cr6_alu :
		((reg_uops == `REGOP_MCRXR) & cr6_wr) ? xer[31:28]:
		((reg_uops == `REGOP_MTCRF) & cr6_wr) ? spr_dat_i[7:4]:
		((reg_uops == `REGOP_MCRF) & cr6_wr) ?
            (cr0_rd ? cr0 :
             cr1_rd ? cr1 :
             cr2_rd ? cr2 :
             cr3_rd ? cr3 :
             cr4_rd ? cr4 :
             cr5_rd ? cr5 :
             cr6_rd ? cr6 :
             cr7) :
		cr6;
assign cr7_we = cr7_alu_we |
                ((reg_uops == `REGOP_MTCRF) & cr7_wr) |
                ((reg_uops == `REGOP_MCRXR) & cr7_wr) |
                ((reg_uops == `REGOP_MCRF) & cr7_wr);
assign cr7_new =
		cr7_alu_we ? cr7_alu :
		((reg_uops == `REGOP_MCRXR) & cr7_wr) ? xer[31:28]:
		((reg_uops == `REGOP_MTCRF) & cr7_wr) ? spr_dat_i[3:0]:
		((reg_uops == `REGOP_MCRF) & cr7_wr) ?
            (cr0_rd ? cr0 :
             cr1_rd ? cr1 :
             cr2_rd ? cr2 :
             cr3_rd ? cr3 :
             cr4_rd ? cr4 :
             cr5_rd ? cr5 :
             cr6_rd ? cr6 :
             cr7) :
		cr7;
assign cr_we = cr0_we | cr1_we | cr2_we | cr3_we | cr4_we | cr5_we | cr6_we | cr7_we;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		cr0 <= #1 4'b0000;
		cr1 <= #1 4'b0000;
		cr2 <= #1 4'b0000;
		cr3 <= #1 4'b0000;
		cr4 <= #1 4'b0000;
		cr5 <= #1 4'b0000;
		cr6 <= #1 4'b0000;
		cr7 <= #1 4'b0000;
    end
	else if (cr_we) begin
		cr0 <= #1 cr0_new;
		cr1 <= #1 cr1_new;
		cr2 <= #1 cr2_new;
		cr3 <= #1 cr3_new;
		cr4 <= #1 cr4_new;
		cr5 <= #1 cr5_new;
		cr6 <= #1 cr6_new;
		cr7 <= #1 cr7_new;
	end
end
// CR output
assign cr = {cr0, cr1, cr2, cr3, cr4, cr5, cr6, cr7};
// XER
//  xer_weÎªÖØ¸´Âß¼­£¬²¢ÎÞÓÃ
assign xer_sel = (spr_addr == `pippo_SPR_XER);
assign xer_we = (write_spr && xer_sel) | ca_we | ov_we | so_we | (reg_uops == `REGOP_MCRXR);
assign xer_new[`pippo_SPR_XER_SO_BITS] =
		(reg_uops == `REGOP_MCRXR)? 1'b0 :
		so_we ? so_new :
		(write_spr && xer_sel) ? spr_dat_i[`pippo_SPR_XER_SO_BITS] :
		xer[`pippo_SPR_XER_CA_BITS];
assign xer_new[`pippo_SPR_XER_OV_BITS] =
		(reg_uops == `REGOP_MCRXR)? 1'b0 :
		ov_we ? ov_new :
		(write_spr && xer_sel) ? spr_dat_i[`pippo_SPR_XER_OV_BITS] :
		xer[`pippo_SPR_XER_OV_BITS];
assign xer_new[`pippo_SPR_XER_CA_BITS] =
		(reg_uops == `REGOP_MCRXR)? 1'b0 :
		ca_we ? ca_new :
		(write_spr && xer_sel) ? spr_dat_i[`pippo_SPR_XER_CA_BITS] :
		xer[`pippo_SPR_XER_CA_BITS];
always @(posedge clk or posedge rst)
	if (rst)
		xer <= #1 `pippo_SPR_XER_RESET;
	else if (xer_we)
		xer <= #1 xer_new;
// output to ALU
assign carry = xer[`pippo_SPR_XER_CA_BITS];
assign so = xer[`pippo_SPR_XER_SO_BITS];
// PVR: Read Only
//  Implemented as combinational logic only
//  [TBD] coding style, to check
assign pvr_sel = (spr_addr == `pippo_SPR_PVR);
assign pvr[`pippo_SPR_PVR_OWN_BITS] = `pippo_SPR_PVR_OWN;
assign pvr[`pippo_SPR_PVR_PCF_BITS] = `pippo_SPR_PVR_PCF;
assign pvr[`pippo_SPR_PVR_CAS_BITS] = `pippo_SPR_PVR_CAS;
assign pvr[`pippo_SPR_PVR_PCV_BITS] = `pippo_SPR_PVR_PCV;
assign pvr[`pippo_SPR_PVR_AID_BITS] = `pippo_SPR_PVR_AID;
// Exception SPRs Interface
assign dear_sel = (spr_addr == `pippo_SPR_DEAR);
assign esr_sel = (spr_addr == `pippo_SPR_ESR);
assign evpr_sel = (spr_addr == `pippo_SPR_EVPR);
assign mcsr_sel = (spr_addr == `pippo_SPR_MCSR);
assign srr0_sel = (spr_addr == `pippo_SPR_SRR0);
assign srr1_sel = (spr_addr == `pippo_SPR_SRR1);
assign srr2_sel = (spr_addr == `pippo_SPR_SRR2);
assign srr3_sel = (spr_addr == `pippo_SPR_SRR3);
assign dear_we = (write_spr && dear_sel);
assign esr_we = (write_spr && esr_sel);
assign evpr_we = (write_spr && evpr_sel);
assign mcsr_we = (write_spr && mcsr_sel);
assign srr0_we = (write_spr && srr0_sel);
assign srr1_we = (write_spr && srr1_sel);
assign srr2_we = (write_spr && srr2_sel);
assign srr3_we = (write_spr && srr3_sel);
// Emulation SPRs
assign eir_sel = (spr_addr == `pippo_SPR_EIR);
assign eir_we = (write_spr && eir_sel);
// LR/CTR Interface
assign lr_sel =  (spr_addr == `pippo_SPR_LR);
assign lr_we = (write_spr && lr_sel);
assign ctr_sel =  (spr_addr == `pippo_SPR_CTR);
assign ctr_we = (write_spr && ctr_sel);
// timer interface
assign tbl_selu = (spr_addr == `pippo_SPR_TBLU);
assign tbu_selu = (spr_addr == `pippo_SPR_TBUU);
assign tbl_sel = (spr_addr == `pippo_SPR_TBL);
assign tbl_we = (write_spr && tbl_sel);
assign tbu_sel = (spr_addr == `pippo_SPR_TBU);
assign tbu_we = (write_spr && tbu_sel);
assign pit_sel = (spr_addr == `pippo_SPR_PIT);
assign pit_we = (write_spr && pit_sel);
assign tsr_sel = (spr_addr == `pippo_SPR_TSR);
assign tsr_we = (write_spr && tsr_sel);
assign tcr_sel = (spr_addr == `pippo_SPR_TCR);
assign tcr_we = (write_spr && tcr_sel);
// DSU interface
assign  dsurx_sel = (spr_addr == `pippo_SPR_DSURX);
assign  dsurx_we = (write_spr && dsurx_sel);
assign  dsutx_sel = (spr_addr == `pippo_SPR_DSUTX);
assign  dsutx_we = (write_spr && dsutx_sel);
assign  dsuctrl_sel = (spr_addr == `pippo_SPR_DSUCTRL);
assign  dsuctrl_we = (write_spr && dsuctrl_sel);
assign  dsusta_sel = (spr_addr == `pippo_SPR_DSUSTA);
assign  dsusta_we = (write_spr && dsusta_sel);
// MTSPR/MFSPR interface
always @(reg_uops or spr_addr or msr or cr or pvr or xer or ctr or lr or
         dear or esr or evpr or mcsr or srr0 or srr1 or srr2 or srr3 or
         usprg0 or sprg0 or sprg1 or sprg2 or sprg3 or sprg4 or sprg5 or
         sprg6 or sprg7 or dsurx or dsutx or dsuctrl or dsusta or
         tbl or tbu or  pit or tsr or tcr or
         dear_sel or esr_sel or evpr_sel or mcsr_sel or srr0_sel or srr1_sel or
         srr2_sel or srr3_sel or ctr_sel or pvr_sel or xer_sel or lr_sel or
         usprg0_sel or sprg0_sel or sprg1_sel or sprg2_sel or sprg3_sel or
         sprg4_sel or sprg5_sel or sprg6_sel or sprg7_sel or
         sprg4_selu or sprg5_selu or sprg6_selu or sprg7_selu or
         tbl_sel or tbl_selu or tbu_sel or tbu_selu or pit_sel or tsr_sel or tcr_sel or
         eir or eir_sel or
         dsurx_sel or dsutx_sel or dsuctrl_sel or dsusta_sel) begin
    write_spr = 1'b0;
	read_spr = 1'b0;
	spr_wb_dat = 32'b0;
	case (reg_uops)	// synopsys parallel_case
        `REGOP_MFMSR : begin
			write_spr = 1'b0;
			read_spr = 1'b1;
			spr_wb_dat = msr;
		end
		`REGOP_MFCR : begin
			write_spr = 1'b0;
			read_spr = 1'b0;
			spr_wb_dat = cr;
		end
		`REGOP_MFSPR : begin
			write_spr = 1'b0;
			read_spr = 1'b1;
			casex (1) // synopsys parallel_case
				pvr_sel:
				    spr_wb_dat = pvr;
                xer_sel:
                    spr_wb_dat = xer;
                ctr_sel:
                    spr_wb_dat = ctr;
                lr_sel:
                    spr_wb_dat = lr;
                usprg0_sel:
                    spr_wb_dat = usprg0;
                sprg0_sel:
                    spr_wb_dat = sprg0;
                sprg1_sel:
                    spr_wb_dat = sprg1;
                sprg2_sel:
                    spr_wb_dat = sprg2;
                sprg3_sel:
                    spr_wb_dat = sprg3;
                sprg4_sel, sprg4_selu:
                    spr_wb_dat = sprg4;
                sprg5_sel, sprg5_selu:
                    spr_wb_dat = sprg5;
                sprg6_sel, sprg6_selu:
                    spr_wb_dat = sprg6;
                sprg7_sel, sprg7_sel:
                    spr_wb_dat = sprg7;
                dear_sel:
                    spr_wb_dat = dear;
                esr_sel:
                    spr_wb_dat = esr;
                evpr_sel:
                    spr_wb_dat = evpr;
                mcsr_sel:
                    spr_wb_dat = mcsr;
                srr0_sel:
                    spr_wb_dat = srr0;
                srr1_sel:
                    spr_wb_dat = srr1;
                srr2_sel:
                    spr_wb_dat = srr2;
                srr3_sel:
                    spr_wb_dat = srr3;
                eir_sel:
                    spr_wb_dat = eir;
                tbl_sel, tbl_selu:
                    spr_wb_dat = tbl;
                tbu_sel, tbu_selu:
                    spr_wb_dat = tbu;
                pit_sel:
                    spr_wb_dat = pit;
                tsr_sel:
                    spr_wb_dat = tsr;
                tcr_sel:
                    spr_wb_dat = tcr;
                dsurx_sel:
                    spr_wb_dat = {24'd0, dsurx};
                dsutx_sel:
                    spr_wb_dat = {24'd0, dsutx};
                dsuctrl_sel:
                    spr_wb_dat = {24'd0, dsuctrl};
                dsusta_sel:
                    spr_wb_dat = {24'd0, dsusta};
				default:
					spr_wb_dat = 32'd0;     // how to deal with CCR0/CCR1 access, to support legacy binary
			endcase
		end
		`REGOP_MTSPR : begin
			write_spr = 1'b1;
			read_spr = 1'b0;
			spr_wb_dat = 32'b0;
		end
		default : begin
			write_spr = 1'b0;
			read_spr = 1'b0;
			spr_wb_dat = 32'b0;
		end
	endcase
end
endmodule