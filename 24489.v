module nios_altmemddr_0_phy (
	pll_ref_clk,
	global_reset_n,
	soft_reset_n,
	ctl_dqs_burst,
	ctl_wdata_valid,
	ctl_wdata,
	ctl_dm,
	ctl_addr,
	ctl_ba,
	ctl_cas_n,
	ctl_cke,
	ctl_cs_n,
	ctl_odt,
	ctl_ras_n,
	ctl_we_n,
	ctl_rst_n,
	ctl_mem_clk_disable,
	ctl_doing_rd,
	ctl_cal_req,
	ctl_cal_byte_lane_sel_n,
	dbg_clk,
	dbg_reset_n,
	dbg_addr,
	dbg_wr,
	dbg_rd,
	dbg_cs,
	dbg_wr_data,
	reset_request_n,
	ctl_clk,
	ctl_reset_n,
	ctl_wlat,
	ctl_rdata,
	ctl_rdata_valid,
	ctl_rlat,
	ctl_cal_success,
	ctl_cal_fail,
	ctl_cal_warning,
	mem_addr,
	mem_ba,
	mem_cas_n,
	mem_cke,
	mem_cs_n,
	mem_dm,
	mem_odt,
	mem_ras_n,
	mem_we_n,
	mem_reset_n,
	dbg_rd_data,
	dbg_waitrequest,
	aux_half_rate_clk,
	aux_full_rate_clk,
	mem_clk,
	mem_clk_n,
	mem_dq,
	mem_dqs,
	mem_dqs_n);
	input		pll_ref_clk;
	input		global_reset_n;
	input		soft_reset_n;
	input	[1:0]	ctl_dqs_burst;
	input	[1:0]	ctl_wdata_valid;
	input	[31:0]	ctl_wdata;
	input	[3:0]	ctl_dm;
	input	[27:0]	ctl_addr;
	input	[3:0]	ctl_ba;
	input	[1:0]	ctl_cas_n;
	input	[1:0]	ctl_cke;
	input	[1:0]	ctl_cs_n;
	input	[1:0]	ctl_odt;
	input	[1:0]	ctl_ras_n;
	input	[1:0]	ctl_we_n;
	input	[1:0]	ctl_rst_n;
	input	[0:0]	ctl_mem_clk_disable;
	input	[1:0]	ctl_doing_rd;
	input		ctl_cal_req;
	input	[0:0]	ctl_cal_byte_lane_sel_n;
	input		dbg_clk;
	input		dbg_reset_n;
	input	[12:0]	dbg_addr;
	input		dbg_wr;
	input		dbg_rd;
	input		dbg_cs;
	input	[31:0]	dbg_wr_data;
	output		reset_request_n;
	output		ctl_clk;
	output		ctl_reset_n;
	output	[4:0]	ctl_wlat;
	output	[31:0]	ctl_rdata;
	output	[1:0]	ctl_rdata_valid;
	output	[4:0]	ctl_rlat;
	output		ctl_cal_success;
	output		ctl_cal_fail;
	output		ctl_cal_warning;
	output	[13:0]	mem_addr;
	output	[1:0]	mem_ba;
	output		mem_cas_n;
	output	[0:0]	mem_cke;
	output	[0:0]	mem_cs_n;
	output	[0:0]	mem_dm;
	output	[0:0]	mem_odt;
	output		mem_ras_n;
	output		mem_we_n;
	output		mem_reset_n;
	output	[31:0]	dbg_rd_data;
	output		dbg_waitrequest;
	output		aux_half_rate_clk;
	output		aux_full_rate_clk;
	inout	[0:0]	mem_clk;
	inout	[0:0]	mem_clk_n;
	inout	[7:0]	mem_dq;
	inout	[0:0]	mem_dqs;
	inout	[0:0]	mem_dqs_n;
	nios_altmemddr_0_phy_alt_mem_phy	nios_altmemddr_0_phy_alt_mem_phy_inst(
		.pll_ref_clk(pll_ref_clk),
		.global_reset_n(global_reset_n),
		.soft_reset_n(soft_reset_n),
		.ctl_dqs_burst(ctl_dqs_burst),
		.ctl_wdata_valid(ctl_wdata_valid),
		.ctl_wdata(ctl_wdata),
		.ctl_dm(ctl_dm),
		.ctl_addr(ctl_addr),
		.ctl_ba(ctl_ba),
		.ctl_cas_n(ctl_cas_n),
		.ctl_cke(ctl_cke),
		.ctl_cs_n(ctl_cs_n),
		.ctl_odt(ctl_odt),
		.ctl_ras_n(ctl_ras_n),
		.ctl_we_n(ctl_we_n),
		.ctl_rst_n(ctl_rst_n),
		.ctl_mem_clk_disable(ctl_mem_clk_disable),
		.ctl_doing_rd(ctl_doing_rd),
		.ctl_cal_req(ctl_cal_req),
		.ctl_cal_byte_lane_sel_n(ctl_cal_byte_lane_sel_n),
		.dbg_clk(dbg_clk),
		.dbg_reset_n(dbg_reset_n),
		.dbg_addr(dbg_addr),
		.dbg_wr(dbg_wr),
		.dbg_rd(dbg_rd),
		.dbg_cs(dbg_cs),
		.dbg_wr_data(dbg_wr_data),
		.reset_request_n(reset_request_n),
		.ctl_clk(ctl_clk),
		.ctl_reset_n(ctl_reset_n),
		.ctl_wlat(ctl_wlat),
		.ctl_rdata(ctl_rdata),
		.ctl_rdata_valid(ctl_rdata_valid),
		.ctl_rlat(ctl_rlat),
		.ctl_cal_success(ctl_cal_success),
		.ctl_cal_fail(ctl_cal_fail),
		.ctl_cal_warning(ctl_cal_warning),
		.mem_addr(mem_addr),
		.mem_ba(mem_ba),
		.mem_cas_n(mem_cas_n),
		.mem_cke(mem_cke),
		.mem_cs_n(mem_cs_n),
		.mem_dm(mem_dm),
		.mem_odt(mem_odt),
		.mem_ras_n(mem_ras_n),
		.mem_we_n(mem_we_n),
		.mem_reset_n(mem_reset_n),
		.dbg_rd_data(dbg_rd_data),
		.dbg_waitrequest(dbg_waitrequest),
		.aux_half_rate_clk(aux_half_rate_clk),
		.aux_full_rate_clk(aux_full_rate_clk),
		.mem_clk(mem_clk),
		.mem_clk_n(mem_clk_n),
		.mem_dq(mem_dq),
		.mem_dqs(mem_dqs),
		.mem_dqs_n(mem_dqs_n));
	defparam
		nios_altmemddr_0_phy_alt_mem_phy_inst.FAMILY = "Cyclone IV E",
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_MEMTYPE = "DDR2",
		nios_altmemddr_0_phy_alt_mem_phy_inst.DLL_DELAY_BUFFER_MODE = "LOW",
		nios_altmemddr_0_phy_alt_mem_phy_inst.DLL_DELAY_CHAIN_LENGTH = 12,
		nios_altmemddr_0_phy_alt_mem_phy_inst.DQS_DELAY_CTL_WIDTH = 6,
		nios_altmemddr_0_phy_alt_mem_phy_inst.DQS_OUT_MODE = "DELAY_CHAIN2",
		nios_altmemddr_0_phy_alt_mem_phy_inst.DQS_PHASE = 6000,
		nios_altmemddr_0_phy_alt_mem_phy_inst.DQS_PHASE_SETTING = 2,
		nios_altmemddr_0_phy_alt_mem_phy_inst.DWIDTH_RATIO = 4,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_DWIDTH = 8,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_ADDR_WIDTH = 14,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_BANKADDR_WIDTH = 2,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_CS_WIDTH = 1,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_CS_PER_RANK = 1,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_DM_WIDTH = 1,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_DM_PINS_EN = 1,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_DQ_PER_DQS = 8,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_DQS_WIDTH = 1,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_OCT_EN = 0,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_CLK_PAIR_COUNT = 1,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_CLK_PS = 8000,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_CLK_PS_STR = "8000 ps",
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_MR_0 = 579,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_MR_1 = 1024,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_MR_2 = 0,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_MR_3 = 0,
		nios_altmemddr_0_phy_alt_mem_phy_inst.PLL_STEPS_PER_CYCLE = 80,
		nios_altmemddr_0_phy_alt_mem_phy_inst.SCAN_CLK_DIVIDE_BY = 2,
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_DQSN_EN = 0,
		nios_altmemddr_0_phy_alt_mem_phy_inst.DLL_EXPORT_IMPORT = "EXPORT",
		nios_altmemddr_0_phy_alt_mem_phy_inst.MEM_IF_ADDR_CMD_PHASE = 90,
		nios_altmemddr_0_phy_alt_mem_phy_inst.RANK_HAS_ADDR_SWAP = 0;
endmodule