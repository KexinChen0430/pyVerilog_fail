module
assign sig_svm_check = msr[`pippo_MSR_PR_BITS] &
                    (((reg_uops == `REGOP_MTMSR) | (reg_uops == `REGOP_MFMSR)) |
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
// GP CSR
reg [width-1:0]  uarch0, uarch1, uarch2, uarch3, uarch4, uarch5, uarch6, uarch7;
reg [width-1:0]  uarch8, uarch9, uarch10, uarch11, uarch12, uarch13, uarch14, uarch15;
// SPRG0, SPRG1, SPRG2, SPRG3 - Privileged
assign uarch0_sel = (spr_addr == `pippo_CSR_UARCH0);
assign uarch1_sel = (spr_addr == `pippo_CSR_UARCH1);
assign uarch2_sel = (spr_addr == `pippo_CSR_UARCH2);
assign uarch3_sel = (spr_addr == `pippo_CSR_UARCH3);
assign uarch4_sel = (spr_addr == `pippo_CSR_UARCH4);
assign uarch5_sel = (spr_addr == `pippo_CSR_UARCH5);
assign uarch6_sel = (spr_addr == `pippo_CSR_UARCH6);
assign uarch7_sel = (spr_addr == `pippo_CSR_UARCH7);
assign uarch8_sel = (spr_addr == `pippo_CSR_UARCH8);
assign uarch9_sel = (spr_addr == `pippo_CSR_UARCH9);
assign uarch10_sel = (spr_addr == `pippo_CSR_UARCH10);
assign uarch11_sel = (spr_addr == `pippo_CSR_UARCH11);
assign uarch12_sel = (spr_addr == `pippo_CSR_UARCH12);
assign uarch13_sel = (spr_addr == `pippo_CSR_UARCH13);
assign uarch14_sel = (spr_addr == `pippo_CSR_UARCH14);
assign uarch15_sel = (spr_addr == `pippo_CSR_UARCH15);
assign uarch0_we = write_spr & uarch0_sel;
assign uarch1_we = write_spr & uarch1_sel;
assign uarch2_we = write_spr & uarch2_sel;
assign uarch3_we = write_spr & uarch3_sel;
assign uarch4_we = write_spr & uarch4_sel;
assign uarch5_we = write_spr & uarch5_sel;
assign uarch6_we = write_spr & uarch6_sel;
assign uarch7_we = write_spr & uarch7_sel;
assign uarch8_we = write_spr & uarch8_sel;
assign uarch9_we = write_spr & uarch9_sel;
assign uarch10_we = write_spr & uarch10_sel;
assign uarch11_we = write_spr & uarch11_sel;
assign uarch12_we = write_spr & uarch12_sel;
assign uarch13_we = write_spr & uarch13_sel;
assign uarch14_we = write_spr & uarch14_sel;
assign uarch15_we = write_spr & uarch15_sel;
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch0 <= #1 `pippo_CSR_UARCH0_RESET;
	else if (uarch0_we)
		uarch0 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch1 <= #1 `pippo_CSR_UARCH1_RESET;
	else if (uarch1_we)
		uarch1 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch2 <= #1 `pippo_CSR_UARCH2_RESET;
	else if (uarch2_we)
		uarch2 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch3 <= #1 `pippo_CSR_UARCH3_RESET;
	else if (uarch3_we)
		uarch3 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch4 <= #1 `pippo_CSR_UARCH4_RESET;
	else if (uarch4_we)
		uarch4 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch5 <= #1 `pippo_CSR_UARCH5_RESET;
	else if (uarch5_we)
		uarch5 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch6 <= #1 `pippo_CSR_UARCH6_RESET;
	else if (uarch6_we)
		uarch6 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch7 <= #1 `pippo_CSR_UARCH7_RESET;
	else if (uarch7_we)
		uarch7 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch8 <= #1 `pippo_CSR_UARCH8_RESET;
	else if (uarch8_we)
		uarch8 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch9 <= #1 `pippo_CSR_UARCH9_RESET;
	else if (uarch9_we)
		uarch9 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch10 <= #1 `pippo_CSR_UARCH10_RESET;
	else if (uarch10_we)
		uarch10 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch11 <= #1 `pippo_CSR_UARCH11_RESET;
	else if (uarch11_we)
		uarch11 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch12 <= #1 `pippo_CSR_UARCH12_RESET;
	else if (uarch12_we)
		uarch12 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch13 <= #1 `pippo_CSR_UARCH13_RESET;
	else if (uarch13_we)
		uarch13 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch14 <= #1 `pippo_CSR_UARCH14_RESET;
	else if (uarch14_we)
		uarch14 <= #1 spr_dat_i;
end
always @(posedge clk or posedge rst) begin
	if (rst)
		uarch15 <= #1 `pippo_CSR_UARCH15_RESET;
	else if (uarch15_we)
		uarch15 <= #1 spr_dat_i;
end
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
always @(reg_uops or spr_addr or msr or pvr or
         dear or esr or evpr or mcsr or srr0 or srr1 or srr2 or srr3 or
         usprg0 or sprg0 or sprg1 or sprg2 or sprg3 or sprg4 or sprg5 or
         sprg6 or sprg7 or dsurx or dsutx or dsuctrl or dsusta or
         tbl or tbu or  pit or tsr or tcr or
         dear_sel or esr_sel or evpr_sel or mcsr_sel or srr0_sel or srr1_sel or
         srr2_sel or srr3_sel or pvr_sel or
         usprg0_sel or sprg0_sel or sprg1_sel or sprg2_sel or sprg3_sel or
         sprg4_sel or sprg5_sel or sprg6_sel or sprg7_sel or
         sprg4_selu or sprg5_selu or sprg6_selu or sprg7_selu or
         tbl_sel or tbl_selu or tbu_sel or tbu_selu or pit_sel or tsr_sel or tcr_sel or
         dsurx_sel or dsutx_sel or dsuctrl_sel or dsusta_sel) begin
    write_spr = 1'b0;
	read_spr = 1'b0;
	spr_wb_dat = 64'b0;
	case (reg_uops)	// synopsys parallel_case
        `REGOP_MFMSR : begin
			write_spr = 1'b0;
			read_spr = 1'b1;
			spr_wb_dat = msr;
		end
		`REGOP_MFSPR : begin
			write_spr = 1'b0;
			read_spr = 1'b1;
			casex (1) // synopsys parallel_case
				pvr_sel:
				    spr_wb_dat = pvr;
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
                    spr_wb_dat = {56'd0, dsurx};
                dsutx_sel:
                    spr_wb_dat = {56'd0, dsutx};
                dsuctrl_sel:
                    spr_wb_dat = {56'd0, dsuctrl};
                dsusta_sel:
                    spr_wb_dat = {56'd0, dsusta};
				default:
					spr_wb_dat = 64'd0;     // how to deal with CCR0/CCR1 access, to support legacy binary
			endcase
		end
		`REGOP_MTSPR : begin
			write_spr = 1'b1;
			read_spr = 1'b0;
			spr_wb_dat = 64'b0;
		end
		default : begin
			write_spr = 1'b0;
			read_spr = 1'b0;
			spr_wb_dat = 64'b0;
		end
	endcase
end
endmodule