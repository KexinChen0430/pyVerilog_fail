module outputs
  wire [63 : 0] v_from_masters_0_rdata,
		v_from_masters_1_rdata,
		v_to_slaves_0_araddr,
		v_to_slaves_0_awaddr,
		v_to_slaves_0_wdata,
		v_to_slaves_1_araddr,
		v_to_slaves_1_awaddr,
		v_to_slaves_1_wdata,
		v_to_slaves_2_araddr,
		v_to_slaves_2_awaddr,
		v_to_slaves_2_wdata;
  wire [7 : 0] v_to_slaves_0_arlen,
	       v_to_slaves_0_awlen,
	       v_to_slaves_0_wstrb,
	       v_to_slaves_1_arlen,
	       v_to_slaves_1_awlen,
	       v_to_slaves_1_wstrb,
	       v_to_slaves_2_arlen,
	       v_to_slaves_2_awlen,
	       v_to_slaves_2_wstrb;
  wire [3 : 0] v_from_masters_0_bid,
	       v_from_masters_0_rid,
	       v_from_masters_1_bid,
	       v_from_masters_1_rid,
	       v_to_slaves_0_arcache,
	       v_to_slaves_0_arid,
	       v_to_slaves_0_arqos,
	       v_to_slaves_0_arregion,
	       v_to_slaves_0_awcache,
	       v_to_slaves_0_awid,
	       v_to_slaves_0_awqos,
	       v_to_slaves_0_awregion,
	       v_to_slaves_1_arcache,
	       v_to_slaves_1_arid,
	       v_to_slaves_1_arqos,
	       v_to_slaves_1_arregion,
	       v_to_slaves_1_awcache,
	       v_to_slaves_1_awid,
	       v_to_slaves_1_awqos,
	       v_to_slaves_1_awregion,
	       v_to_slaves_2_arcache,
	       v_to_slaves_2_arid,
	       v_to_slaves_2_arqos,
	       v_to_slaves_2_arregion,
	       v_to_slaves_2_awcache,
	       v_to_slaves_2_awid,
	       v_to_slaves_2_awqos,
	       v_to_slaves_2_awregion;
  wire [2 : 0] v_to_slaves_0_arprot,
	       v_to_slaves_0_arsize,
	       v_to_slaves_0_awprot,
	       v_to_slaves_0_awsize,
	       v_to_slaves_1_arprot,
	       v_to_slaves_1_arsize,
	       v_to_slaves_1_awprot,
	       v_to_slaves_1_awsize,
	       v_to_slaves_2_arprot,
	       v_to_slaves_2_arsize,
	       v_to_slaves_2_awprot,
	       v_to_slaves_2_awsize;
  wire [1 : 0] v_from_masters_0_bresp,
	       v_from_masters_0_rresp,
	       v_from_masters_1_bresp,
	       v_from_masters_1_rresp,
	       v_to_slaves_0_arburst,
	       v_to_slaves_0_awburst,
	       v_to_slaves_1_arburst,
	       v_to_slaves_1_awburst,
	       v_to_slaves_2_arburst,
	       v_to_slaves_2_awburst;
  wire RDY_reset,
       RDY_set_verbosity,
       v_from_masters_0_arready,
       v_from_masters_0_awready,
       v_from_masters_0_bvalid,
       v_from_masters_0_rlast,
       v_from_masters_0_rvalid,
       v_from_masters_0_wready,
       v_from_masters_1_arready,
       v_from_masters_1_awready,
       v_from_masters_1_bvalid,
       v_from_masters_1_rlast,
       v_from_masters_1_rvalid,
       v_from_masters_1_wready,
       v_to_slaves_0_arlock,
       v_to_slaves_0_arvalid,
       v_to_slaves_0_awlock,
       v_to_slaves_0_awvalid,
       v_to_slaves_0_bready,
       v_to_slaves_0_rready,
       v_to_slaves_0_wlast,
       v_to_slaves_0_wvalid,
       v_to_slaves_1_arlock,
       v_to_slaves_1_arvalid,
       v_to_slaves_1_awlock,
       v_to_slaves_1_awvalid,
       v_to_slaves_1_bready,
       v_to_slaves_1_rready,
       v_to_slaves_1_wlast,
       v_to_slaves_1_wvalid,
       v_to_slaves_2_arlock,
       v_to_slaves_2_arvalid,
       v_to_slaves_2_awlock,
       v_to_slaves_2_awvalid,
       v_to_slaves_2_bready,
       v_to_slaves_2_rready,
       v_to_slaves_2_wlast,
       v_to_slaves_2_wvalid;
  // register fabric_cfg_verbosity
  reg [3 : 0] fabric_cfg_verbosity;
  wire [3 : 0] fabric_cfg_verbosity$D_IN;
  wire fabric_cfg_verbosity$EN;
  // register fabric_rg_reset
  reg fabric_rg_reset;
  wire fabric_rg_reset$D_IN, fabric_rg_reset$EN;
  // register fabric_v_rg_r_beat_count_0
  reg [7 : 0] fabric_v_rg_r_beat_count_0;
  reg [7 : 0] fabric_v_rg_r_beat_count_0$D_IN;
  wire fabric_v_rg_r_beat_count_0$EN;
  // register fabric_v_rg_r_beat_count_1
  reg [7 : 0] fabric_v_rg_r_beat_count_1;
  reg [7 : 0] fabric_v_rg_r_beat_count_1$D_IN;
  wire fabric_v_rg_r_beat_count_1$EN;
  // register fabric_v_rg_r_beat_count_2
  reg [7 : 0] fabric_v_rg_r_beat_count_2;
  reg [7 : 0] fabric_v_rg_r_beat_count_2$D_IN;
  wire fabric_v_rg_r_beat_count_2$EN;
  // register fabric_v_rg_r_err_beat_count_0
  reg [7 : 0] fabric_v_rg_r_err_beat_count_0;
  wire [7 : 0] fabric_v_rg_r_err_beat_count_0$D_IN;
  wire fabric_v_rg_r_err_beat_count_0$EN;
  // register fabric_v_rg_r_err_beat_count_1
  reg [7 : 0] fabric_v_rg_r_err_beat_count_1;
  wire [7 : 0] fabric_v_rg_r_err_beat_count_1$D_IN;
  wire fabric_v_rg_r_err_beat_count_1$EN;
  // register fabric_v_rg_wd_beat_count_0
  reg [7 : 0] fabric_v_rg_wd_beat_count_0;
  wire [7 : 0] fabric_v_rg_wd_beat_count_0$D_IN;
  wire fabric_v_rg_wd_beat_count_0$EN;
  // register fabric_v_rg_wd_beat_count_1
  reg [7 : 0] fabric_v_rg_wd_beat_count_1;
  wire [7 : 0] fabric_v_rg_wd_beat_count_1$D_IN;
  wire fabric_v_rg_wd_beat_count_1$EN;
  // ports of submodule fabric_v_f_rd_err_info_0
  wire [11 : 0] fabric_v_f_rd_err_info_0$D_IN, fabric_v_f_rd_err_info_0$D_OUT;
  wire fabric_v_f_rd_err_info_0$CLR,
       fabric_v_f_rd_err_info_0$DEQ,
       fabric_v_f_rd_err_info_0$EMPTY_N,
       fabric_v_f_rd_err_info_0$ENQ;
  // ports of submodule fabric_v_f_rd_err_info_1
  wire [11 : 0] fabric_v_f_rd_err_info_1$D_IN, fabric_v_f_rd_err_info_1$D_OUT;
  wire fabric_v_f_rd_err_info_1$CLR,
       fabric_v_f_rd_err_info_1$DEQ,
       fabric_v_f_rd_err_info_1$EMPTY_N,
       fabric_v_f_rd_err_info_1$ENQ;
  // ports of submodule fabric_v_f_rd_mis_0
  wire [9 : 0] fabric_v_f_rd_mis_0$D_IN, fabric_v_f_rd_mis_0$D_OUT;
  wire fabric_v_f_rd_mis_0$CLR,
       fabric_v_f_rd_mis_0$DEQ,
       fabric_v_f_rd_mis_0$EMPTY_N,
       fabric_v_f_rd_mis_0$ENQ,
       fabric_v_f_rd_mis_0$FULL_N;
  // ports of submodule fabric_v_f_rd_mis_1
  wire [9 : 0] fabric_v_f_rd_mis_1$D_IN, fabric_v_f_rd_mis_1$D_OUT;
  wire fabric_v_f_rd_mis_1$CLR,
       fabric_v_f_rd_mis_1$DEQ,
       fabric_v_f_rd_mis_1$EMPTY_N,
       fabric_v_f_rd_mis_1$ENQ,
       fabric_v_f_rd_mis_1$FULL_N;
  // ports of submodule fabric_v_f_rd_mis_2
  wire [9 : 0] fabric_v_f_rd_mis_2$D_IN, fabric_v_f_rd_mis_2$D_OUT;
  wire fabric_v_f_rd_mis_2$CLR,
       fabric_v_f_rd_mis_2$DEQ,
       fabric_v_f_rd_mis_2$EMPTY_N,
       fabric_v_f_rd_mis_2$ENQ,
       fabric_v_f_rd_mis_2$FULL_N;
  // ports of submodule fabric_v_f_rd_sjs_0
  reg [1 : 0] fabric_v_f_rd_sjs_0$D_IN;
  wire [1 : 0] fabric_v_f_rd_sjs_0$D_OUT;
  wire fabric_v_f_rd_sjs_0$CLR,
       fabric_v_f_rd_sjs_0$DEQ,
       fabric_v_f_rd_sjs_0$EMPTY_N,
       fabric_v_f_rd_sjs_0$ENQ,
       fabric_v_f_rd_sjs_0$FULL_N;
  // ports of submodule fabric_v_f_rd_sjs_1
  reg [1 : 0] fabric_v_f_rd_sjs_1$D_IN;
  wire [1 : 0] fabric_v_f_rd_sjs_1$D_OUT;
  wire fabric_v_f_rd_sjs_1$CLR,
       fabric_v_f_rd_sjs_1$DEQ,
       fabric_v_f_rd_sjs_1$EMPTY_N,
       fabric_v_f_rd_sjs_1$ENQ,
       fabric_v_f_rd_sjs_1$FULL_N;
  // ports of submodule fabric_v_f_wd_tasks_0
  reg [9 : 0] fabric_v_f_wd_tasks_0$D_IN;
  wire [9 : 0] fabric_v_f_wd_tasks_0$D_OUT;
  wire fabric_v_f_wd_tasks_0$CLR,
       fabric_v_f_wd_tasks_0$DEQ,
       fabric_v_f_wd_tasks_0$EMPTY_N,
       fabric_v_f_wd_tasks_0$ENQ,
       fabric_v_f_wd_tasks_0$FULL_N;
  // ports of submodule fabric_v_f_wd_tasks_1
  reg [9 : 0] fabric_v_f_wd_tasks_1$D_IN;
  wire [9 : 0] fabric_v_f_wd_tasks_1$D_OUT;
  wire fabric_v_f_wd_tasks_1$CLR,
       fabric_v_f_wd_tasks_1$DEQ,
       fabric_v_f_wd_tasks_1$EMPTY_N,
       fabric_v_f_wd_tasks_1$ENQ,
       fabric_v_f_wd_tasks_1$FULL_N;
  // ports of submodule fabric_v_f_wr_err_info_0
  wire [3 : 0] fabric_v_f_wr_err_info_0$D_IN, fabric_v_f_wr_err_info_0$D_OUT;
  wire fabric_v_f_wr_err_info_0$CLR,
       fabric_v_f_wr_err_info_0$DEQ,
       fabric_v_f_wr_err_info_0$EMPTY_N,
       fabric_v_f_wr_err_info_0$ENQ;
  // ports of submodule fabric_v_f_wr_err_info_1
  wire [3 : 0] fabric_v_f_wr_err_info_1$D_IN, fabric_v_f_wr_err_info_1$D_OUT;
  wire fabric_v_f_wr_err_info_1$CLR,
       fabric_v_f_wr_err_info_1$DEQ,
       fabric_v_f_wr_err_info_1$EMPTY_N,
       fabric_v_f_wr_err_info_1$ENQ;
  // ports of submodule fabric_v_f_wr_mis_0
  wire [1 : 0] fabric_v_f_wr_mis_0$D_IN, fabric_v_f_wr_mis_0$D_OUT;
  wire fabric_v_f_wr_mis_0$CLR,
       fabric_v_f_wr_mis_0$DEQ,
       fabric_v_f_wr_mis_0$EMPTY_N,
       fabric_v_f_wr_mis_0$ENQ,
       fabric_v_f_wr_mis_0$FULL_N;
  // ports of submodule fabric_v_f_wr_mis_1
  wire [1 : 0] fabric_v_f_wr_mis_1$D_IN, fabric_v_f_wr_mis_1$D_OUT;
  wire fabric_v_f_wr_mis_1$CLR,
       fabric_v_f_wr_mis_1$DEQ,
       fabric_v_f_wr_mis_1$EMPTY_N,
       fabric_v_f_wr_mis_1$ENQ,
       fabric_v_f_wr_mis_1$FULL_N;
  // ports of submodule fabric_v_f_wr_mis_2
  wire [1 : 0] fabric_v_f_wr_mis_2$D_IN, fabric_v_f_wr_mis_2$D_OUT;
  wire fabric_v_f_wr_mis_2$CLR,
       fabric_v_f_wr_mis_2$DEQ,
       fabric_v_f_wr_mis_2$EMPTY_N,
       fabric_v_f_wr_mis_2$ENQ,
       fabric_v_f_wr_mis_2$FULL_N;
  // ports of submodule fabric_v_f_wr_sjs_0
  reg [1 : 0] fabric_v_f_wr_sjs_0$D_IN;
  wire [1 : 0] fabric_v_f_wr_sjs_0$D_OUT;
  wire fabric_v_f_wr_sjs_0$CLR,
       fabric_v_f_wr_sjs_0$DEQ,
       fabric_v_f_wr_sjs_0$EMPTY_N,
       fabric_v_f_wr_sjs_0$ENQ,
       fabric_v_f_wr_sjs_0$FULL_N;
  // ports of submodule fabric_v_f_wr_sjs_1
  reg [1 : 0] fabric_v_f_wr_sjs_1$D_IN;
  wire [1 : 0] fabric_v_f_wr_sjs_1$D_OUT;
  wire fabric_v_f_wr_sjs_1$CLR,
       fabric_v_f_wr_sjs_1$DEQ,
       fabric_v_f_wr_sjs_1$EMPTY_N,
       fabric_v_f_wr_sjs_1$ENQ,
       fabric_v_f_wr_sjs_1$FULL_N;
  // ports of submodule fabric_xactors_from_masters_0_f_rd_addr
  wire [96 : 0] fabric_xactors_from_masters_0_f_rd_addr$D_IN,
		fabric_xactors_from_masters_0_f_rd_addr$D_OUT;
  wire fabric_xactors_from_masters_0_f_rd_addr$CLR,
       fabric_xactors_from_masters_0_f_rd_addr$DEQ,
       fabric_xactors_from_masters_0_f_rd_addr$EMPTY_N,
       fabric_xactors_from_masters_0_f_rd_addr$ENQ,
       fabric_xactors_from_masters_0_f_rd_addr$FULL_N;
  // ports of submodule fabric_xactors_from_masters_0_f_rd_data
  reg [70 : 0] fabric_xactors_from_masters_0_f_rd_data$D_IN;
  wire [70 : 0] fabric_xactors_from_masters_0_f_rd_data$D_OUT;
  wire fabric_xactors_from_masters_0_f_rd_data$CLR,
       fabric_xactors_from_masters_0_f_rd_data$DEQ,
       fabric_xactors_from_masters_0_f_rd_data$EMPTY_N,
       fabric_xactors_from_masters_0_f_rd_data$ENQ,
       fabric_xactors_from_masters_0_f_rd_data$FULL_N;
  // ports of submodule fabric_xactors_from_masters_0_f_wr_addr
  wire [96 : 0] fabric_xactors_from_masters_0_f_wr_addr$D_IN,
		fabric_xactors_from_masters_0_f_wr_addr$D_OUT;
  wire fabric_xactors_from_masters_0_f_wr_addr$CLR,
       fabric_xactors_from_masters_0_f_wr_addr$DEQ,
       fabric_xactors_from_masters_0_f_wr_addr$EMPTY_N,
       fabric_xactors_from_masters_0_f_wr_addr$ENQ,
       fabric_xactors_from_masters_0_f_wr_addr$FULL_N;
  // ports of submodule fabric_xactors_from_masters_0_f_wr_data
  wire [72 : 0] fabric_xactors_from_masters_0_f_wr_data$D_IN,
		fabric_xactors_from_masters_0_f_wr_data$D_OUT;
  wire fabric_xactors_from_masters_0_f_wr_data$CLR,
       fabric_xactors_from_masters_0_f_wr_data$DEQ,
       fabric_xactors_from_masters_0_f_wr_data$EMPTY_N,
       fabric_xactors_from_masters_0_f_wr_data$ENQ,
       fabric_xactors_from_masters_0_f_wr_data$FULL_N;
  // ports of submodule fabric_xactors_from_masters_0_f_wr_resp
  reg [5 : 0] fabric_xactors_from_masters_0_f_wr_resp$D_IN;
  wire [5 : 0] fabric_xactors_from_masters_0_f_wr_resp$D_OUT;
  wire fabric_xactors_from_masters_0_f_wr_resp$CLR,
       fabric_xactors_from_masters_0_f_wr_resp$DEQ,
       fabric_xactors_from_masters_0_f_wr_resp$EMPTY_N,
       fabric_xactors_from_masters_0_f_wr_resp$ENQ,
       fabric_xactors_from_masters_0_f_wr_resp$FULL_N;
  // ports of submodule fabric_xactors_from_masters_1_f_rd_addr
  wire [96 : 0] fabric_xactors_from_masters_1_f_rd_addr$D_IN,
		fabric_xactors_from_masters_1_f_rd_addr$D_OUT;
  wire fabric_xactors_from_masters_1_f_rd_addr$CLR,
       fabric_xactors_from_masters_1_f_rd_addr$DEQ,
       fabric_xactors_from_masters_1_f_rd_addr$EMPTY_N,
       fabric_xactors_from_masters_1_f_rd_addr$ENQ,
       fabric_xactors_from_masters_1_f_rd_addr$FULL_N;
  // ports of submodule fabric_xactors_from_masters_1_f_rd_data
  reg [70 : 0] fabric_xactors_from_masters_1_f_rd_data$D_IN;
  wire [70 : 0] fabric_xactors_from_masters_1_f_rd_data$D_OUT;
  wire fabric_xactors_from_masters_1_f_rd_data$CLR,
       fabric_xactors_from_masters_1_f_rd_data$DEQ,
       fabric_xactors_from_masters_1_f_rd_data$EMPTY_N,
       fabric_xactors_from_masters_1_f_rd_data$ENQ,
       fabric_xactors_from_masters_1_f_rd_data$FULL_N;
  // ports of submodule fabric_xactors_from_masters_1_f_wr_addr
  wire [96 : 0] fabric_xactors_from_masters_1_f_wr_addr$D_IN,
		fabric_xactors_from_masters_1_f_wr_addr$D_OUT;
  wire fabric_xactors_from_masters_1_f_wr_addr$CLR,
       fabric_xactors_from_masters_1_f_wr_addr$DEQ,
       fabric_xactors_from_masters_1_f_wr_addr$EMPTY_N,
       fabric_xactors_from_masters_1_f_wr_addr$ENQ,
       fabric_xactors_from_masters_1_f_wr_addr$FULL_N;
  // ports of submodule fabric_xactors_from_masters_1_f_wr_data
  wire [72 : 0] fabric_xactors_from_masters_1_f_wr_data$D_IN,
		fabric_xactors_from_masters_1_f_wr_data$D_OUT;
  wire fabric_xactors_from_masters_1_f_wr_data$CLR,
       fabric_xactors_from_masters_1_f_wr_data$DEQ,
       fabric_xactors_from_masters_1_f_wr_data$EMPTY_N,
       fabric_xactors_from_masters_1_f_wr_data$ENQ,
       fabric_xactors_from_masters_1_f_wr_data$FULL_N;
  // ports of submodule fabric_xactors_from_masters_1_f_wr_resp
  reg [5 : 0] fabric_xactors_from_masters_1_f_wr_resp$D_IN;
  wire [5 : 0] fabric_xactors_from_masters_1_f_wr_resp$D_OUT;
  wire fabric_xactors_from_masters_1_f_wr_resp$CLR,
       fabric_xactors_from_masters_1_f_wr_resp$DEQ,
       fabric_xactors_from_masters_1_f_wr_resp$EMPTY_N,
       fabric_xactors_from_masters_1_f_wr_resp$ENQ,
       fabric_xactors_from_masters_1_f_wr_resp$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_0_f_rd_addr
  wire [96 : 0] fabric_xactors_to_slaves_0_f_rd_addr$D_IN,
		fabric_xactors_to_slaves_0_f_rd_addr$D_OUT;
  wire fabric_xactors_to_slaves_0_f_rd_addr$CLR,
       fabric_xactors_to_slaves_0_f_rd_addr$DEQ,
       fabric_xactors_to_slaves_0_f_rd_addr$EMPTY_N,
       fabric_xactors_to_slaves_0_f_rd_addr$ENQ,
       fabric_xactors_to_slaves_0_f_rd_addr$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_0_f_rd_data
  wire [70 : 0] fabric_xactors_to_slaves_0_f_rd_data$D_IN,
		fabric_xactors_to_slaves_0_f_rd_data$D_OUT;
  wire fabric_xactors_to_slaves_0_f_rd_data$CLR,
       fabric_xactors_to_slaves_0_f_rd_data$DEQ,
       fabric_xactors_to_slaves_0_f_rd_data$EMPTY_N,
       fabric_xactors_to_slaves_0_f_rd_data$ENQ,
       fabric_xactors_to_slaves_0_f_rd_data$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_0_f_wr_addr
  wire [96 : 0] fabric_xactors_to_slaves_0_f_wr_addr$D_IN,
		fabric_xactors_to_slaves_0_f_wr_addr$D_OUT;
  wire fabric_xactors_to_slaves_0_f_wr_addr$CLR,
       fabric_xactors_to_slaves_0_f_wr_addr$DEQ,
       fabric_xactors_to_slaves_0_f_wr_addr$EMPTY_N,
       fabric_xactors_to_slaves_0_f_wr_addr$ENQ,
       fabric_xactors_to_slaves_0_f_wr_addr$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_0_f_wr_data
  wire [72 : 0] fabric_xactors_to_slaves_0_f_wr_data$D_IN,
		fabric_xactors_to_slaves_0_f_wr_data$D_OUT;
  wire fabric_xactors_to_slaves_0_f_wr_data$CLR,
       fabric_xactors_to_slaves_0_f_wr_data$DEQ,
       fabric_xactors_to_slaves_0_f_wr_data$EMPTY_N,
       fabric_xactors_to_slaves_0_f_wr_data$ENQ,
       fabric_xactors_to_slaves_0_f_wr_data$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_0_f_wr_resp
  wire [5 : 0] fabric_xactors_to_slaves_0_f_wr_resp$D_IN,
	       fabric_xactors_to_slaves_0_f_wr_resp$D_OUT;
  wire fabric_xactors_to_slaves_0_f_wr_resp$CLR,
       fabric_xactors_to_slaves_0_f_wr_resp$DEQ,
       fabric_xactors_to_slaves_0_f_wr_resp$EMPTY_N,
       fabric_xactors_to_slaves_0_f_wr_resp$ENQ,
       fabric_xactors_to_slaves_0_f_wr_resp$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_1_f_rd_addr
  wire [96 : 0] fabric_xactors_to_slaves_1_f_rd_addr$D_IN,
		fabric_xactors_to_slaves_1_f_rd_addr$D_OUT;
  wire fabric_xactors_to_slaves_1_f_rd_addr$CLR,
       fabric_xactors_to_slaves_1_f_rd_addr$DEQ,
       fabric_xactors_to_slaves_1_f_rd_addr$EMPTY_N,
       fabric_xactors_to_slaves_1_f_rd_addr$ENQ,
       fabric_xactors_to_slaves_1_f_rd_addr$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_1_f_rd_data
  wire [70 : 0] fabric_xactors_to_slaves_1_f_rd_data$D_IN,
		fabric_xactors_to_slaves_1_f_rd_data$D_OUT;
  wire fabric_xactors_to_slaves_1_f_rd_data$CLR,
       fabric_xactors_to_slaves_1_f_rd_data$DEQ,
       fabric_xactors_to_slaves_1_f_rd_data$EMPTY_N,
       fabric_xactors_to_slaves_1_f_rd_data$ENQ,
       fabric_xactors_to_slaves_1_f_rd_data$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_1_f_wr_addr
  wire [96 : 0] fabric_xactors_to_slaves_1_f_wr_addr$D_IN,
		fabric_xactors_to_slaves_1_f_wr_addr$D_OUT;
  wire fabric_xactors_to_slaves_1_f_wr_addr$CLR,
       fabric_xactors_to_slaves_1_f_wr_addr$DEQ,
       fabric_xactors_to_slaves_1_f_wr_addr$EMPTY_N,
       fabric_xactors_to_slaves_1_f_wr_addr$ENQ,
       fabric_xactors_to_slaves_1_f_wr_addr$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_1_f_wr_data
  wire [72 : 0] fabric_xactors_to_slaves_1_f_wr_data$D_IN,
		fabric_xactors_to_slaves_1_f_wr_data$D_OUT;
  wire fabric_xactors_to_slaves_1_f_wr_data$CLR,
       fabric_xactors_to_slaves_1_f_wr_data$DEQ,
       fabric_xactors_to_slaves_1_f_wr_data$EMPTY_N,
       fabric_xactors_to_slaves_1_f_wr_data$ENQ,
       fabric_xactors_to_slaves_1_f_wr_data$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_1_f_wr_resp
  wire [5 : 0] fabric_xactors_to_slaves_1_f_wr_resp$D_IN,
	       fabric_xactors_to_slaves_1_f_wr_resp$D_OUT;
  wire fabric_xactors_to_slaves_1_f_wr_resp$CLR,
       fabric_xactors_to_slaves_1_f_wr_resp$DEQ,
       fabric_xactors_to_slaves_1_f_wr_resp$EMPTY_N,
       fabric_xactors_to_slaves_1_f_wr_resp$ENQ,
       fabric_xactors_to_slaves_1_f_wr_resp$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_2_f_rd_addr
  wire [96 : 0] fabric_xactors_to_slaves_2_f_rd_addr$D_IN,
		fabric_xactors_to_slaves_2_f_rd_addr$D_OUT;
  wire fabric_xactors_to_slaves_2_f_rd_addr$CLR,
       fabric_xactors_to_slaves_2_f_rd_addr$DEQ,
       fabric_xactors_to_slaves_2_f_rd_addr$EMPTY_N,
       fabric_xactors_to_slaves_2_f_rd_addr$ENQ,
       fabric_xactors_to_slaves_2_f_rd_addr$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_2_f_rd_data
  wire [70 : 0] fabric_xactors_to_slaves_2_f_rd_data$D_IN,
		fabric_xactors_to_slaves_2_f_rd_data$D_OUT;
  wire fabric_xactors_to_slaves_2_f_rd_data$CLR,
       fabric_xactors_to_slaves_2_f_rd_data$DEQ,
       fabric_xactors_to_slaves_2_f_rd_data$EMPTY_N,
       fabric_xactors_to_slaves_2_f_rd_data$ENQ,
       fabric_xactors_to_slaves_2_f_rd_data$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_2_f_wr_addr
  wire [96 : 0] fabric_xactors_to_slaves_2_f_wr_addr$D_IN,
		fabric_xactors_to_slaves_2_f_wr_addr$D_OUT;
  wire fabric_xactors_to_slaves_2_f_wr_addr$CLR,
       fabric_xactors_to_slaves_2_f_wr_addr$DEQ,
       fabric_xactors_to_slaves_2_f_wr_addr$EMPTY_N,
       fabric_xactors_to_slaves_2_f_wr_addr$ENQ,
       fabric_xactors_to_slaves_2_f_wr_addr$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_2_f_wr_data
  wire [72 : 0] fabric_xactors_to_slaves_2_f_wr_data$D_IN,
		fabric_xactors_to_slaves_2_f_wr_data$D_OUT;
  wire fabric_xactors_to_slaves_2_f_wr_data$CLR,
       fabric_xactors_to_slaves_2_f_wr_data$DEQ,
       fabric_xactors_to_slaves_2_f_wr_data$EMPTY_N,
       fabric_xactors_to_slaves_2_f_wr_data$ENQ,
       fabric_xactors_to_slaves_2_f_wr_data$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_2_f_wr_resp
  wire [5 : 0] fabric_xactors_to_slaves_2_f_wr_resp$D_IN,
	       fabric_xactors_to_slaves_2_f_wr_resp$D_OUT;
  wire fabric_xactors_to_slaves_2_f_wr_resp$CLR,
       fabric_xactors_to_slaves_2_f_wr_resp$DEQ,
       fabric_xactors_to_slaves_2_f_wr_resp$EMPTY_N,
       fabric_xactors_to_slaves_2_f_wr_resp$ENQ,
       fabric_xactors_to_slaves_2_f_wr_resp$FULL_N;
  // ports of submodule soc_map
  wire [63 : 0] soc_map$m_is_IO_addr_addr,
		soc_map$m_is_mem_addr_addr,
		soc_map$m_is_near_mem_IO_addr_addr,
		soc_map$m_near_mem_io_addr_base,
		soc_map$m_near_mem_io_addr_lim,
		soc_map$m_plic_addr_base,
		soc_map$m_plic_addr_lim;
  // rule scheduling signals
  wire CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master,
       CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master_1,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5,
       CAN_FIRE_RL_fabric_rl_reset,
       CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master,
       CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master_1,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1,
       CAN_FIRE_reset,
       CAN_FIRE_set_verbosity,
       CAN_FIRE_v_from_masters_0_m_arvalid,
       CAN_FIRE_v_from_masters_0_m_awvalid,
       CAN_FIRE_v_from_masters_0_m_bready,
       CAN_FIRE_v_from_masters_0_m_rready,
       CAN_FIRE_v_from_masters_0_m_wvalid,
       CAN_FIRE_v_from_masters_1_m_arvalid,
       CAN_FIRE_v_from_masters_1_m_awvalid,
       CAN_FIRE_v_from_masters_1_m_bready,
       CAN_FIRE_v_from_masters_1_m_rready,
       CAN_FIRE_v_from_masters_1_m_wvalid,
       CAN_FIRE_v_to_slaves_0_m_arready,
       CAN_FIRE_v_to_slaves_0_m_awready,
       CAN_FIRE_v_to_slaves_0_m_bvalid,
       CAN_FIRE_v_to_slaves_0_m_rvalid,
       CAN_FIRE_v_to_slaves_0_m_wready,
       CAN_FIRE_v_to_slaves_1_m_arready,
       CAN_FIRE_v_to_slaves_1_m_awready,
       CAN_FIRE_v_to_slaves_1_m_bvalid,
       CAN_FIRE_v_to_slaves_1_m_rvalid,
       CAN_FIRE_v_to_slaves_1_m_wready,
       CAN_FIRE_v_to_slaves_2_m_arready,
       CAN_FIRE_v_to_slaves_2_m_awready,
       CAN_FIRE_v_to_slaves_2_m_bvalid,
       CAN_FIRE_v_to_slaves_2_m_rvalid,
       CAN_FIRE_v_to_slaves_2_m_wready,
       WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master,
       WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5,
       WILL_FIRE_RL_fabric_rl_reset,
       WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master,
       WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1,
       WILL_FIRE_reset,
       WILL_FIRE_set_verbosity,
       WILL_FIRE_v_from_masters_0_m_arvalid,
       WILL_FIRE_v_from_masters_0_m_awvalid,
       WILL_FIRE_v_from_masters_0_m_bready,
       WILL_FIRE_v_from_masters_0_m_rready,
       WILL_FIRE_v_from_masters_0_m_wvalid,
       WILL_FIRE_v_from_masters_1_m_arvalid,
       WILL_FIRE_v_from_masters_1_m_awvalid,
       WILL_FIRE_v_from_masters_1_m_bready,
       WILL_FIRE_v_from_masters_1_m_rready,
       WILL_FIRE_v_from_masters_1_m_wvalid,
       WILL_FIRE_v_to_slaves_0_m_arready,
       WILL_FIRE_v_to_slaves_0_m_awready,
       WILL_FIRE_v_to_slaves_0_m_bvalid,
       WILL_FIRE_v_to_slaves_0_m_rvalid,
       WILL_FIRE_v_to_slaves_0_m_wready,
       WILL_FIRE_v_to_slaves_1_m_arready,
       WILL_FIRE_v_to_slaves_1_m_awready,
       WILL_FIRE_v_to_slaves_1_m_bvalid,
       WILL_FIRE_v_to_slaves_1_m_rvalid,
       WILL_FIRE_v_to_slaves_1_m_wready,
       WILL_FIRE_v_to_slaves_2_m_arready,
       WILL_FIRE_v_to_slaves_2_m_awready,
       WILL_FIRE_v_to_slaves_2_m_bvalid,
       WILL_FIRE_v_to_slaves_2_m_rvalid,
       WILL_FIRE_v_to_slaves_2_m_wready;
  // inputs to muxes for submodule ports
  wire [70 : 0] MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_1,
		MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_2,
		MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_3,
		MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_4,
		MUX_fabric_xactors_from_masters_1_f_rd_data$enq_1__VAL_4;
  wire [9 : 0] MUX_fabric_v_f_rd_mis_0$enq_1__VAL_1,
	       MUX_fabric_v_f_rd_mis_0$enq_1__VAL_2,
	       MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_1,
	       MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_2,
	       MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_3,
	       MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_1,
	       MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_2,
	       MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_3;
  wire [7 : 0] MUX_fabric_v_rg_r_beat_count_0$write_1__VAL_3,
	       MUX_fabric_v_rg_r_beat_count_1$write_1__VAL_2,
	       MUX_fabric_v_rg_r_beat_count_2$write_1__VAL_3,
	       MUX_fabric_v_rg_wd_beat_count_0$write_1__VAL_2,
	       MUX_fabric_v_rg_wd_beat_count_1$write_1__VAL_2;
  wire [5 : 0] MUX_fabric_xactors_from_masters_0_f_wr_resp$enq_1__VAL_4,
	       MUX_fabric_xactors_from_masters_1_f_wr_resp$enq_1__VAL_4;
  wire MUX_fabric_xactors_to_slaves_0_f_wr_data$enq_1__SEL_1,
       MUX_fabric_xactors_to_slaves_1_f_wr_data$enq_1__SEL_1,
       MUX_fabric_xactors_to_slaves_2_f_wr_data$enq_1__SEL_1;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h8795;
  reg [31 : 0] v__h9170;
  reg [31 : 0] v__h9545;
  reg [31 : 0] v__h9990;
  reg [31 : 0] v__h10359;
  reg [31 : 0] v__h10728;
  reg [31 : 0] v__h11804;
  reg [31 : 0] v__h12050;
  reg [31 : 0] v__h12430;
  reg [31 : 0] v__h12676;
  reg [31 : 0] v__h13053;
  reg [31 : 0] v__h13345;
  reg [31 : 0] v__h13637;
  reg [31 : 0] v__h13940;
  reg [31 : 0] v__h14206;
  reg [31 : 0] v__h14472;
  reg [31 : 0] v__h14736;
  reg [31 : 0] v__h14962;
  reg [31 : 0] v__h15391;
  reg [31 : 0] v__h15747;
  reg [31 : 0] v__h16103;
  reg [31 : 0] v__h16520;
  reg [31 : 0] v__h16852;
  reg [31 : 0] v__h17184;
  reg [31 : 0] v__h18200;
  reg [31 : 0] v__h18451;
  reg [31 : 0] v__h18826;
  reg [31 : 0] v__h19067;
  reg [31 : 0] v__h19442;
  reg [31 : 0] v__h19683;
  reg [31 : 0] v__h20045;
  reg [31 : 0] v__h20296;
  reg [31 : 0] v__h20626;
  reg [31 : 0] v__h20867;
  reg [31 : 0] v__h21197;
  reg [31 : 0] v__h21438;
  reg [31 : 0] v__h21951;
  reg [31 : 0] v__h22352;
  reg [31 : 0] v__h5824;
  reg [31 : 0] v__h5818;
  reg [31 : 0] v__h8789;
  reg [31 : 0] v__h9164;
  reg [31 : 0] v__h9539;
  reg [31 : 0] v__h9984;
  reg [31 : 0] v__h10353;
  reg [31 : 0] v__h10722;
  reg [31 : 0] v__h11798;
  reg [31 : 0] v__h12044;
  reg [31 : 0] v__h12424;
  reg [31 : 0] v__h12670;
  reg [31 : 0] v__h13047;
  reg [31 : 0] v__h13339;
  reg [31 : 0] v__h13631;
  reg [31 : 0] v__h13934;
  reg [31 : 0] v__h14200;
  reg [31 : 0] v__h14466;
  reg [31 : 0] v__h14730;
  reg [31 : 0] v__h14956;
  reg [31 : 0] v__h15385;
  reg [31 : 0] v__h15741;
  reg [31 : 0] v__h16097;
  reg [31 : 0] v__h16514;
  reg [31 : 0] v__h16846;
  reg [31 : 0] v__h17178;
  reg [31 : 0] v__h18194;
  reg [31 : 0] v__h18445;
  reg [31 : 0] v__h18820;
  reg [31 : 0] v__h19061;
  reg [31 : 0] v__h19436;
  reg [31 : 0] v__h19677;
  reg [31 : 0] v__h20039;
  reg [31 : 0] v__h20290;
  reg [31 : 0] v__h20620;
  reg [31 : 0] v__h20861;
  reg [31 : 0] v__h21191;
  reg [31 : 0] v__h21432;
  reg [31 : 0] v__h21945;
  reg [31 : 0] v__h22346;
  // synopsys translate_on
  // remaining internal signals
  reg CASE_fabric_v_f_wd_tasks_0D_OUT_BITS_9_TO_8_0_ETC__q1,
      CASE_fabric_v_f_wd_tasks_1D_OUT_BITS_9_TO_8_0_ETC__q2;
  wire [7 : 0] x__h11955,
	       x__h12581,
	       x__h18337,
	       x__h18963,
	       x__h19579,
	       x__h21883,
	       x__h22284;
  wire [1 : 0] IF_fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_ETC___d403,
	       IF_fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_ETC___d438,
	       IF_fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_ETC___d473,
	       x1_avValue_rresp__h18315,
	       x1_avValue_rresp__h18941,
	       x1_avValue_rresp__h19557;
  wire _dor1fabric_v_f_rd_mis_0$EN_deq,
       _dor1fabric_v_f_rd_mis_1$EN_deq,
       _dor1fabric_v_f_rd_mis_2$EN_deq,
       fabric_v_f_wd_tasks_0_i_notEmpty__21_AND_fabri_ETC___d130,
       fabric_v_f_wd_tasks_1_i_notEmpty__53_AND_fabri_ETC___d159,
       fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387,
       fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422,
       fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457,
       fabric_v_rg_r_err_beat_count_0_20_EQ_fabric_v__ETC___d522,
       fabric_v_rg_r_err_beat_count_1_38_EQ_fabric_v__ETC___d540,
       fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146,
       fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d286,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d291,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d22,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d29,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d336,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d341,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d83,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d88,
       soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d19,
       soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d284,
       soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d334,
       soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d81,
       soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d26,
       soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d289,
       soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d339,
       soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d86;
  // action method reset
  assign RDY_reset = !fabric_rg_reset ;
  assign CAN_FIRE_reset = !fabric_rg_reset ;
  assign WILL_FIRE_reset = EN_reset ;
  // action method set_verbosity
  assign RDY_set_verbosity = 1'd1 ;
  assign CAN_FIRE_set_verbosity = 1'd1 ;
  assign WILL_FIRE_set_verbosity = EN_set_verbosity ;
  // action method v_from_masters_0_m_awvalid
  assign CAN_FIRE_v_from_masters_0_m_awvalid = 1'd1 ;
  assign WILL_FIRE_v_from_masters_0_m_awvalid = 1'd1 ;
  // value method v_from_masters_0_m_awready
  assign v_from_masters_0_awready =
	     fabric_xactors_from_masters_0_f_wr_addr$FULL_N ;
  // action method v_from_masters_0_m_wvalid
  assign CAN_FIRE_v_from_masters_0_m_wvalid = 1'd1 ;
  assign WILL_FIRE_v_from_masters_0_m_wvalid = 1'd1 ;
  // value method v_from_masters_0_m_wready
  assign v_from_masters_0_wready =
	     fabric_xactors_from_masters_0_f_wr_data$FULL_N ;
  // value method v_from_masters_0_m_bvalid
  assign v_from_masters_0_bvalid =
	     fabric_xactors_from_masters_0_f_wr_resp$EMPTY_N ;
  // value method v_from_masters_0_m_bid
  assign v_from_masters_0_bid =
	     fabric_xactors_from_masters_0_f_wr_resp$D_OUT[5:2] ;
  // value method v_from_masters_0_m_bresp
  assign v_from_masters_0_bresp =
	     fabric_xactors_from_masters_0_f_wr_resp$D_OUT[1:0] ;
  // action method v_from_masters_0_m_bready
  assign CAN_FIRE_v_from_masters_0_m_bready = 1'd1 ;
  assign WILL_FIRE_v_from_masters_0_m_bready = 1'd1 ;
  // action method v_from_masters_0_m_arvalid
  assign CAN_FIRE_v_from_masters_0_m_arvalid = 1'd1 ;
  assign WILL_FIRE_v_from_masters_0_m_arvalid = 1'd1 ;
  // value method v_from_masters_0_m_arready
  assign v_from_masters_0_arready =
	     fabric_xactors_from_masters_0_f_rd_addr$FULL_N ;
  // value method v_from_masters_0_m_rvalid
  assign v_from_masters_0_rvalid =
	     fabric_xactors_from_masters_0_f_rd_data$EMPTY_N ;
  // value method v_from_masters_0_m_rid
  assign v_from_masters_0_rid =
	     fabric_xactors_from_masters_0_f_rd_data$D_OUT[70:67] ;
  // value method v_from_masters_0_m_rdata
  assign v_from_masters_0_rdata =
	     fabric_xactors_from_masters_0_f_rd_data$D_OUT[66:3] ;
  // value method v_from_masters_0_m_rresp
  assign v_from_masters_0_rresp =
	     fabric_xactors_from_masters_0_f_rd_data$D_OUT[2:1] ;
  // value method v_from_masters_0_m_rlast
  assign v_from_masters_0_rlast =
	     fabric_xactors_from_masters_0_f_rd_data$D_OUT[0] ;
  // action method v_from_masters_0_m_rready
  assign CAN_FIRE_v_from_masters_0_m_rready = 1'd1 ;
  assign WILL_FIRE_v_from_masters_0_m_rready = 1'd1 ;
  // action method v_from_masters_1_m_awvalid
  assign CAN_FIRE_v_from_masters_1_m_awvalid = 1'd1 ;
  assign WILL_FIRE_v_from_masters_1_m_awvalid = 1'd1 ;
  // value method v_from_masters_1_m_awready
  assign v_from_masters_1_awready =
	     fabric_xactors_from_masters_1_f_wr_addr$FULL_N ;
  // action method v_from_masters_1_m_wvalid
  assign CAN_FIRE_v_from_masters_1_m_wvalid = 1'd1 ;
  assign WILL_FIRE_v_from_masters_1_m_wvalid = 1'd1 ;
  // value method v_from_masters_1_m_wready
  assign v_from_masters_1_wready =
	     fabric_xactors_from_masters_1_f_wr_data$FULL_N ;
  // value method v_from_masters_1_m_bvalid
  assign v_from_masters_1_bvalid =
	     fabric_xactors_from_masters_1_f_wr_resp$EMPTY_N ;
  // value method v_from_masters_1_m_bid
  assign v_from_masters_1_bid =
	     fabric_xactors_from_masters_1_f_wr_resp$D_OUT[5:2] ;
  // value method v_from_masters_1_m_bresp
  assign v_from_masters_1_bresp =
	     fabric_xactors_from_masters_1_f_wr_resp$D_OUT[1:0] ;
  // action method v_from_masters_1_m_bready
  assign CAN_FIRE_v_from_masters_1_m_bready = 1'd1 ;
  assign WILL_FIRE_v_from_masters_1_m_bready = 1'd1 ;
  // action method v_from_masters_1_m_arvalid
  assign CAN_FIRE_v_from_masters_1_m_arvalid = 1'd1 ;
  assign WILL_FIRE_v_from_masters_1_m_arvalid = 1'd1 ;
  // value method v_from_masters_1_m_arready
  assign v_from_masters_1_arready =
	     fabric_xactors_from_masters_1_f_rd_addr$FULL_N ;
  // value method v_from_masters_1_m_rvalid
  assign v_from_masters_1_rvalid =
	     fabric_xactors_from_masters_1_f_rd_data$EMPTY_N ;
  // value method v_from_masters_1_m_rid
  assign v_from_masters_1_rid =
	     fabric_xactors_from_masters_1_f_rd_data$D_OUT[70:67] ;
  // value method v_from_masters_1_m_rdata
  assign v_from_masters_1_rdata =
	     fabric_xactors_from_masters_1_f_rd_data$D_OUT[66:3] ;
  // value method v_from_masters_1_m_rresp
  assign v_from_masters_1_rresp =
	     fabric_xactors_from_masters_1_f_rd_data$D_OUT[2:1] ;
  // value method v_from_masters_1_m_rlast
  assign v_from_masters_1_rlast =
	     fabric_xactors_from_masters_1_f_rd_data$D_OUT[0] ;
  // action method v_from_masters_1_m_rready
  assign CAN_FIRE_v_from_masters_1_m_rready = 1'd1 ;
  assign WILL_FIRE_v_from_masters_1_m_rready = 1'd1 ;
  // value method v_to_slaves_0_m_awvalid
  assign v_to_slaves_0_awvalid =
	     fabric_xactors_to_slaves_0_f_wr_addr$EMPTY_N ;
  // value method v_to_slaves_0_m_awid
  assign v_to_slaves_0_awid =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[96:93] ;
  // value method v_to_slaves_0_m_awaddr
  assign v_to_slaves_0_awaddr =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[92:29] ;
  // value method v_to_slaves_0_m_awlen
  assign v_to_slaves_0_awlen =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[28:21] ;
  // value method v_to_slaves_0_m_awsize
  assign v_to_slaves_0_awsize =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[20:18] ;
  // value method v_to_slaves_0_m_awburst
  assign v_to_slaves_0_awburst =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[17:16] ;
  // value method v_to_slaves_0_m_awlock
  assign v_to_slaves_0_awlock =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[15] ;
  // value method v_to_slaves_0_m_awcache
  assign v_to_slaves_0_awcache =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[14:11] ;
  // value method v_to_slaves_0_m_awprot
  assign v_to_slaves_0_awprot =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[10:8] ;
  // value method v_to_slaves_0_m_awqos
  assign v_to_slaves_0_awqos =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[7:4] ;
  // value method v_to_slaves_0_m_awregion
  assign v_to_slaves_0_awregion =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[3:0] ;
  // action method v_to_slaves_0_m_awready
  assign CAN_FIRE_v_to_slaves_0_m_awready = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_0_m_awready = 1'd1 ;
  // value method v_to_slaves_0_m_wvalid
  assign v_to_slaves_0_wvalid = fabric_xactors_to_slaves_0_f_wr_data$EMPTY_N ;
  // value method v_to_slaves_0_m_wdata
  assign v_to_slaves_0_wdata =
	     fabric_xactors_to_slaves_0_f_wr_data$D_OUT[72:9] ;
  // value method v_to_slaves_0_m_wstrb
  assign v_to_slaves_0_wstrb =
	     fabric_xactors_to_slaves_0_f_wr_data$D_OUT[8:1] ;
  // value method v_to_slaves_0_m_wlast
  assign v_to_slaves_0_wlast = fabric_xactors_to_slaves_0_f_wr_data$D_OUT[0] ;
  // action method v_to_slaves_0_m_wready
  assign CAN_FIRE_v_to_slaves_0_m_wready = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_0_m_wready = 1'd1 ;
  // action method v_to_slaves_0_m_bvalid
  assign CAN_FIRE_v_to_slaves_0_m_bvalid = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_0_m_bvalid = 1'd1 ;
  // value method v_to_slaves_0_m_bready
  assign v_to_slaves_0_bready = fabric_xactors_to_slaves_0_f_wr_resp$FULL_N ;
  // value method v_to_slaves_0_m_arvalid
  assign v_to_slaves_0_arvalid =
	     fabric_xactors_to_slaves_0_f_rd_addr$EMPTY_N ;
  // value method v_to_slaves_0_m_arid
  assign v_to_slaves_0_arid =
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[96:93] ;
  // value method v_to_slaves_0_m_araddr
  assign v_to_slaves_0_araddr =
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[92:29] ;
  // value method v_to_slaves_0_m_arlen
  assign v_to_slaves_0_arlen =
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[28:21] ;
  // value method v_to_slaves_0_m_arsize
  assign v_to_slaves_0_arsize =
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[20:18] ;
  // value method v_to_slaves_0_m_arburst
  assign v_to_slaves_0_arburst =
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[17:16] ;
  // value method v_to_slaves_0_m_arlock
  assign v_to_slaves_0_arlock =
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[15] ;
  // value method v_to_slaves_0_m_arcache
  assign v_to_slaves_0_arcache =
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[14:11] ;
  // value method v_to_slaves_0_m_arprot
  assign v_to_slaves_0_arprot =
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[10:8] ;
  // value method v_to_slaves_0_m_arqos
  assign v_to_slaves_0_arqos =
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[7:4] ;
  // value method v_to_slaves_0_m_arregion
  assign v_to_slaves_0_arregion =
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[3:0] ;
  // action method v_to_slaves_0_m_arready
  assign CAN_FIRE_v_to_slaves_0_m_arready = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_0_m_arready = 1'd1 ;
  // action method v_to_slaves_0_m_rvalid
  assign CAN_FIRE_v_to_slaves_0_m_rvalid = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_0_m_rvalid = 1'd1 ;
  // value method v_to_slaves_0_m_rready
  assign v_to_slaves_0_rready = fabric_xactors_to_slaves_0_f_rd_data$FULL_N ;
  // value method v_to_slaves_1_m_awvalid
  assign v_to_slaves_1_awvalid =
	     fabric_xactors_to_slaves_1_f_wr_addr$EMPTY_N ;
  // value method v_to_slaves_1_m_awid
  assign v_to_slaves_1_awid =
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[96:93] ;
  // value method v_to_slaves_1_m_awaddr
  assign v_to_slaves_1_awaddr =
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[92:29] ;
  // value method v_to_slaves_1_m_awlen
  assign v_to_slaves_1_awlen =
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[28:21] ;
  // value method v_to_slaves_1_m_awsize
  assign v_to_slaves_1_awsize =
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[20:18] ;
  // value method v_to_slaves_1_m_awburst
  assign v_to_slaves_1_awburst =
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[17:16] ;
  // value method v_to_slaves_1_m_awlock
  assign v_to_slaves_1_awlock =
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[15] ;
  // value method v_to_slaves_1_m_awcache
  assign v_to_slaves_1_awcache =
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[14:11] ;
  // value method v_to_slaves_1_m_awprot
  assign v_to_slaves_1_awprot =
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[10:8] ;
  // value method v_to_slaves_1_m_awqos
  assign v_to_slaves_1_awqos =
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[7:4] ;
  // value method v_to_slaves_1_m_awregion
  assign v_to_slaves_1_awregion =
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[3:0] ;
  // action method v_to_slaves_1_m_awready
  assign CAN_FIRE_v_to_slaves_1_m_awready = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_1_m_awready = 1'd1 ;
  // value method v_to_slaves_1_m_wvalid
  assign v_to_slaves_1_wvalid = fabric_xactors_to_slaves_1_f_wr_data$EMPTY_N ;
  // value method v_to_slaves_1_m_wdata
  assign v_to_slaves_1_wdata =
	     fabric_xactors_to_slaves_1_f_wr_data$D_OUT[72:9] ;
  // value method v_to_slaves_1_m_wstrb
  assign v_to_slaves_1_wstrb =
	     fabric_xactors_to_slaves_1_f_wr_data$D_OUT[8:1] ;
  // value method v_to_slaves_1_m_wlast
  assign v_to_slaves_1_wlast = fabric_xactors_to_slaves_1_f_wr_data$D_OUT[0] ;
  // action method v_to_slaves_1_m_wready
  assign CAN_FIRE_v_to_slaves_1_m_wready = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_1_m_wready = 1'd1 ;
  // action method v_to_slaves_1_m_bvalid
  assign CAN_FIRE_v_to_slaves_1_m_bvalid = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_1_m_bvalid = 1'd1 ;
  // value method v_to_slaves_1_m_bready
  assign v_to_slaves_1_bready = fabric_xactors_to_slaves_1_f_wr_resp$FULL_N ;
  // value method v_to_slaves_1_m_arvalid
  assign v_to_slaves_1_arvalid =
	     fabric_xactors_to_slaves_1_f_rd_addr$EMPTY_N ;
  // value method v_to_slaves_1_m_arid
  assign v_to_slaves_1_arid =
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[96:93] ;
  // value method v_to_slaves_1_m_araddr
  assign v_to_slaves_1_araddr =
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[92:29] ;
  // value method v_to_slaves_1_m_arlen
  assign v_to_slaves_1_arlen =
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[28:21] ;
  // value method v_to_slaves_1_m_arsize
  assign v_to_slaves_1_arsize =
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[20:18] ;
  // value method v_to_slaves_1_m_arburst
  assign v_to_slaves_1_arburst =
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[17:16] ;
  // value method v_to_slaves_1_m_arlock
  assign v_to_slaves_1_arlock =
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[15] ;
  // value method v_to_slaves_1_m_arcache
  assign v_to_slaves_1_arcache =
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[14:11] ;
  // value method v_to_slaves_1_m_arprot
  assign v_to_slaves_1_arprot =
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[10:8] ;
  // value method v_to_slaves_1_m_arqos
  assign v_to_slaves_1_arqos =
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[7:4] ;
  // value method v_to_slaves_1_m_arregion
  assign v_to_slaves_1_arregion =
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[3:0] ;
  // action method v_to_slaves_1_m_arready
  assign CAN_FIRE_v_to_slaves_1_m_arready = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_1_m_arready = 1'd1 ;
  // action method v_to_slaves_1_m_rvalid
  assign CAN_FIRE_v_to_slaves_1_m_rvalid = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_1_m_rvalid = 1'd1 ;
  // value method v_to_slaves_1_m_rready
  assign v_to_slaves_1_rready = fabric_xactors_to_slaves_1_f_rd_data$FULL_N ;
  // value method v_to_slaves_2_m_awvalid
  assign v_to_slaves_2_awvalid =
	     fabric_xactors_to_slaves_2_f_wr_addr$EMPTY_N ;
  // value method v_to_slaves_2_m_awid
  assign v_to_slaves_2_awid =
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[96:93] ;
  // value method v_to_slaves_2_m_awaddr
  assign v_to_slaves_2_awaddr =
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[92:29] ;
  // value method v_to_slaves_2_m_awlen
  assign v_to_slaves_2_awlen =
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[28:21] ;
  // value method v_to_slaves_2_m_awsize
  assign v_to_slaves_2_awsize =
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[20:18] ;
  // value method v_to_slaves_2_m_awburst
  assign v_to_slaves_2_awburst =
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[17:16] ;
  // value method v_to_slaves_2_m_awlock
  assign v_to_slaves_2_awlock =
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[15] ;
  // value method v_to_slaves_2_m_awcache
  assign v_to_slaves_2_awcache =
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[14:11] ;
  // value method v_to_slaves_2_m_awprot
  assign v_to_slaves_2_awprot =
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[10:8] ;
  // value method v_to_slaves_2_m_awqos
  assign v_to_slaves_2_awqos =
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[7:4] ;
  // value method v_to_slaves_2_m_awregion
  assign v_to_slaves_2_awregion =
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[3:0] ;
  // action method v_to_slaves_2_m_awready
  assign CAN_FIRE_v_to_slaves_2_m_awready = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_2_m_awready = 1'd1 ;
  // value method v_to_slaves_2_m_wvalid
  assign v_to_slaves_2_wvalid = fabric_xactors_to_slaves_2_f_wr_data$EMPTY_N ;
  // value method v_to_slaves_2_m_wdata
  assign v_to_slaves_2_wdata =
	     fabric_xactors_to_slaves_2_f_wr_data$D_OUT[72:9] ;
  // value method v_to_slaves_2_m_wstrb
  assign v_to_slaves_2_wstrb =
	     fabric_xactors_to_slaves_2_f_wr_data$D_OUT[8:1] ;
  // value method v_to_slaves_2_m_wlast
  assign v_to_slaves_2_wlast = fabric_xactors_to_slaves_2_f_wr_data$D_OUT[0] ;
  // action method v_to_slaves_2_m_wready
  assign CAN_FIRE_v_to_slaves_2_m_wready = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_2_m_wready = 1'd1 ;
  // action method v_to_slaves_2_m_bvalid
  assign CAN_FIRE_v_to_slaves_2_m_bvalid = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_2_m_bvalid = 1'd1 ;
  // value method v_to_slaves_2_m_bready
  assign v_to_slaves_2_bready = fabric_xactors_to_slaves_2_f_wr_resp$FULL_N ;
  // value method v_to_slaves_2_m_arvalid
  assign v_to_slaves_2_arvalid =
	     fabric_xactors_to_slaves_2_f_rd_addr$EMPTY_N ;
  // value method v_to_slaves_2_m_arid
  assign v_to_slaves_2_arid =
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[96:93] ;
  // value method v_to_slaves_2_m_araddr
  assign v_to_slaves_2_araddr =
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[92:29] ;
  // value method v_to_slaves_2_m_arlen
  assign v_to_slaves_2_arlen =
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[28:21] ;
  // value method v_to_slaves_2_m_arsize
  assign v_to_slaves_2_arsize =
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[20:18] ;
  // value method v_to_slaves_2_m_arburst
  assign v_to_slaves_2_arburst =
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[17:16] ;
  // value method v_to_slaves_2_m_arlock
  assign v_to_slaves_2_arlock =
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[15] ;
  // value method v_to_slaves_2_m_arcache
  assign v_to_slaves_2_arcache =
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[14:11] ;
  // value method v_to_slaves_2_m_arprot
  assign v_to_slaves_2_arprot =
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[10:8] ;
  // value method v_to_slaves_2_m_arqos
  assign v_to_slaves_2_arqos =
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[7:4] ;
  // value method v_to_slaves_2_m_arregion
  assign v_to_slaves_2_arregion =
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[3:0] ;
  // action method v_to_slaves_2_m_arready
  assign CAN_FIRE_v_to_slaves_2_m_arready = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_2_m_arready = 1'd1 ;
  // action method v_to_slaves_2_m_rvalid
  assign CAN_FIRE_v_to_slaves_2_m_rvalid = 1'd1 ;
  assign WILL_FIRE_v_to_slaves_2_m_rvalid = 1'd1 ;
  // value method v_to_slaves_2_m_rready
  assign v_to_slaves_2_rready = fabric_xactors_to_slaves_2_f_rd_data$FULL_N ;
  // submodule fabric_v_f_rd_err_info_0
  SizedFIFO #(.p1width(32'd12),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_rd_err_info_0(.RST(RST_N),
							.CLK(CLK),
							.D_IN(fabric_v_f_rd_err_info_0$D_IN),
							.ENQ(fabric_v_f_rd_err_info_0$ENQ),
							.DEQ(fabric_v_f_rd_err_info_0$DEQ),
							.CLR(fabric_v_f_rd_err_info_0$CLR),
							.D_OUT(fabric_v_f_rd_err_info_0$D_OUT),
							.FULL_N(),
							.EMPTY_N(fabric_v_f_rd_err_info_0$EMPTY_N));
  // submodule fabric_v_f_rd_err_info_1
  SizedFIFO #(.p1width(32'd12),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_rd_err_info_1(.RST(RST_N),
							.CLK(CLK),
							.D_IN(fabric_v_f_rd_err_info_1$D_IN),
							.ENQ(fabric_v_f_rd_err_info_1$ENQ),
							.DEQ(fabric_v_f_rd_err_info_1$DEQ),
							.CLR(fabric_v_f_rd_err_info_1$CLR),
							.D_OUT(fabric_v_f_rd_err_info_1$D_OUT),
							.FULL_N(),
							.EMPTY_N(fabric_v_f_rd_err_info_1$EMPTY_N));
  // submodule fabric_v_f_rd_mis_0
  SizedFIFO #(.p1width(32'd10),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_rd_mis_0(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fabric_v_f_rd_mis_0$D_IN),
						   .ENQ(fabric_v_f_rd_mis_0$ENQ),
						   .DEQ(fabric_v_f_rd_mis_0$DEQ),
						   .CLR(fabric_v_f_rd_mis_0$CLR),
						   .D_OUT(fabric_v_f_rd_mis_0$D_OUT),
						   .FULL_N(fabric_v_f_rd_mis_0$FULL_N),
						   .EMPTY_N(fabric_v_f_rd_mis_0$EMPTY_N));
  // submodule fabric_v_f_rd_mis_1
  SizedFIFO #(.p1width(32'd10),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_rd_mis_1(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fabric_v_f_rd_mis_1$D_IN),
						   .ENQ(fabric_v_f_rd_mis_1$ENQ),
						   .DEQ(fabric_v_f_rd_mis_1$DEQ),
						   .CLR(fabric_v_f_rd_mis_1$CLR),
						   .D_OUT(fabric_v_f_rd_mis_1$D_OUT),
						   .FULL_N(fabric_v_f_rd_mis_1$FULL_N),
						   .EMPTY_N(fabric_v_f_rd_mis_1$EMPTY_N));
  // submodule fabric_v_f_rd_mis_2
  SizedFIFO #(.p1width(32'd10),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_rd_mis_2(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fabric_v_f_rd_mis_2$D_IN),
						   .ENQ(fabric_v_f_rd_mis_2$ENQ),
						   .DEQ(fabric_v_f_rd_mis_2$DEQ),
						   .CLR(fabric_v_f_rd_mis_2$CLR),
						   .D_OUT(fabric_v_f_rd_mis_2$D_OUT),
						   .FULL_N(fabric_v_f_rd_mis_2$FULL_N),
						   .EMPTY_N(fabric_v_f_rd_mis_2$EMPTY_N));
  // submodule fabric_v_f_rd_sjs_0
  SizedFIFO #(.p1width(32'd2),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_rd_sjs_0(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fabric_v_f_rd_sjs_0$D_IN),
						   .ENQ(fabric_v_f_rd_sjs_0$ENQ),
						   .DEQ(fabric_v_f_rd_sjs_0$DEQ),
						   .CLR(fabric_v_f_rd_sjs_0$CLR),
						   .D_OUT(fabric_v_f_rd_sjs_0$D_OUT),
						   .FULL_N(fabric_v_f_rd_sjs_0$FULL_N),
						   .EMPTY_N(fabric_v_f_rd_sjs_0$EMPTY_N));
  // submodule fabric_v_f_rd_sjs_1
  SizedFIFO #(.p1width(32'd2),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_rd_sjs_1(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fabric_v_f_rd_sjs_1$D_IN),
						   .ENQ(fabric_v_f_rd_sjs_1$ENQ),
						   .DEQ(fabric_v_f_rd_sjs_1$DEQ),
						   .CLR(fabric_v_f_rd_sjs_1$CLR),
						   .D_OUT(fabric_v_f_rd_sjs_1$D_OUT),
						   .FULL_N(fabric_v_f_rd_sjs_1$FULL_N),
						   .EMPTY_N(fabric_v_f_rd_sjs_1$EMPTY_N));
  // submodule fabric_v_f_wd_tasks_0
  FIFO2 #(.width(32'd10), .guarded(32'd1)) fabric_v_f_wd_tasks_0(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(fabric_v_f_wd_tasks_0$D_IN),
								 .ENQ(fabric_v_f_wd_tasks_0$ENQ),
								 .DEQ(fabric_v_f_wd_tasks_0$DEQ),
								 .CLR(fabric_v_f_wd_tasks_0$CLR),
								 .D_OUT(fabric_v_f_wd_tasks_0$D_OUT),
								 .FULL_N(fabric_v_f_wd_tasks_0$FULL_N),
								 .EMPTY_N(fabric_v_f_wd_tasks_0$EMPTY_N));
  // submodule fabric_v_f_wd_tasks_1
  FIFO2 #(.width(32'd10), .guarded(32'd1)) fabric_v_f_wd_tasks_1(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(fabric_v_f_wd_tasks_1$D_IN),
								 .ENQ(fabric_v_f_wd_tasks_1$ENQ),
								 .DEQ(fabric_v_f_wd_tasks_1$DEQ),
								 .CLR(fabric_v_f_wd_tasks_1$CLR),
								 .D_OUT(fabric_v_f_wd_tasks_1$D_OUT),
								 .FULL_N(fabric_v_f_wd_tasks_1$FULL_N),
								 .EMPTY_N(fabric_v_f_wd_tasks_1$EMPTY_N));
  // submodule fabric_v_f_wr_err_info_0
  SizedFIFO #(.p1width(32'd4),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_wr_err_info_0(.RST(RST_N),
							.CLK(CLK),
							.D_IN(fabric_v_f_wr_err_info_0$D_IN),
							.ENQ(fabric_v_f_wr_err_info_0$ENQ),
							.DEQ(fabric_v_f_wr_err_info_0$DEQ),
							.CLR(fabric_v_f_wr_err_info_0$CLR),
							.D_OUT(fabric_v_f_wr_err_info_0$D_OUT),
							.FULL_N(),
							.EMPTY_N(fabric_v_f_wr_err_info_0$EMPTY_N));
  // submodule fabric_v_f_wr_err_info_1
  SizedFIFO #(.p1width(32'd4),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_wr_err_info_1(.RST(RST_N),
							.CLK(CLK),
							.D_IN(fabric_v_f_wr_err_info_1$D_IN),
							.ENQ(fabric_v_f_wr_err_info_1$ENQ),
							.DEQ(fabric_v_f_wr_err_info_1$DEQ),
							.CLR(fabric_v_f_wr_err_info_1$CLR),
							.D_OUT(fabric_v_f_wr_err_info_1$D_OUT),
							.FULL_N(),
							.EMPTY_N(fabric_v_f_wr_err_info_1$EMPTY_N));
  // submodule fabric_v_f_wr_mis_0
  SizedFIFO #(.p1width(32'd2),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_wr_mis_0(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fabric_v_f_wr_mis_0$D_IN),
						   .ENQ(fabric_v_f_wr_mis_0$ENQ),
						   .DEQ(fabric_v_f_wr_mis_0$DEQ),
						   .CLR(fabric_v_f_wr_mis_0$CLR),
						   .D_OUT(fabric_v_f_wr_mis_0$D_OUT),
						   .FULL_N(fabric_v_f_wr_mis_0$FULL_N),
						   .EMPTY_N(fabric_v_f_wr_mis_0$EMPTY_N));
  // submodule fabric_v_f_wr_mis_1
  SizedFIFO #(.p1width(32'd2),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_wr_mis_1(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fabric_v_f_wr_mis_1$D_IN),
						   .ENQ(fabric_v_f_wr_mis_1$ENQ),
						   .DEQ(fabric_v_f_wr_mis_1$DEQ),
						   .CLR(fabric_v_f_wr_mis_1$CLR),
						   .D_OUT(fabric_v_f_wr_mis_1$D_OUT),
						   .FULL_N(fabric_v_f_wr_mis_1$FULL_N),
						   .EMPTY_N(fabric_v_f_wr_mis_1$EMPTY_N));
  // submodule fabric_v_f_wr_mis_2
  SizedFIFO #(.p1width(32'd2),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_wr_mis_2(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fabric_v_f_wr_mis_2$D_IN),
						   .ENQ(fabric_v_f_wr_mis_2$ENQ),
						   .DEQ(fabric_v_f_wr_mis_2$DEQ),
						   .CLR(fabric_v_f_wr_mis_2$CLR),
						   .D_OUT(fabric_v_f_wr_mis_2$D_OUT),
						   .FULL_N(fabric_v_f_wr_mis_2$FULL_N),
						   .EMPTY_N(fabric_v_f_wr_mis_2$EMPTY_N));
  // submodule fabric_v_f_wr_sjs_0
  SizedFIFO #(.p1width(32'd2),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_wr_sjs_0(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fabric_v_f_wr_sjs_0$D_IN),
						   .ENQ(fabric_v_f_wr_sjs_0$ENQ),
						   .DEQ(fabric_v_f_wr_sjs_0$DEQ),
						   .CLR(fabric_v_f_wr_sjs_0$CLR),
						   .D_OUT(fabric_v_f_wr_sjs_0$D_OUT),
						   .FULL_N(fabric_v_f_wr_sjs_0$FULL_N),
						   .EMPTY_N(fabric_v_f_wr_sjs_0$EMPTY_N));
  // submodule fabric_v_f_wr_sjs_1
  SizedFIFO #(.p1width(32'd2),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(32'd1)) fabric_v_f_wr_sjs_1(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fabric_v_f_wr_sjs_1$D_IN),
						   .ENQ(fabric_v_f_wr_sjs_1$ENQ),
						   .DEQ(fabric_v_f_wr_sjs_1$DEQ),
						   .CLR(fabric_v_f_wr_sjs_1$CLR),
						   .D_OUT(fabric_v_f_wr_sjs_1$D_OUT),
						   .FULL_N(fabric_v_f_wr_sjs_1$FULL_N),
						   .EMPTY_N(fabric_v_f_wr_sjs_1$EMPTY_N));
  // submodule fabric_xactors_from_masters_0_f_rd_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) fabric_xactors_from_masters_0_f_rd_addr(.RST(RST_N),
								   .CLK(CLK),
								   .D_IN(fabric_xactors_from_masters_0_f_rd_addr$D_IN),
								   .ENQ(fabric_xactors_from_masters_0_f_rd_addr$ENQ),
								   .DEQ(fabric_xactors_from_masters_0_f_rd_addr$DEQ),
								   .CLR(fabric_xactors_from_masters_0_f_rd_addr$CLR),
								   .D_OUT(fabric_xactors_from_masters_0_f_rd_addr$D_OUT),
								   .FULL_N(fabric_xactors_from_masters_0_f_rd_addr$FULL_N),
								   .EMPTY_N(fabric_xactors_from_masters_0_f_rd_addr$EMPTY_N));
  // submodule fabric_xactors_from_masters_0_f_rd_data
  FIFO2 #(.width(32'd71),
	  .guarded(32'd1)) fabric_xactors_from_masters_0_f_rd_data(.RST(RST_N),
								   .CLK(CLK),
								   .D_IN(fabric_xactors_from_masters_0_f_rd_data$D_IN),
								   .ENQ(fabric_xactors_from_masters_0_f_rd_data$ENQ),
								   .DEQ(fabric_xactors_from_masters_0_f_rd_data$DEQ),
								   .CLR(fabric_xactors_from_masters_0_f_rd_data$CLR),
								   .D_OUT(fabric_xactors_from_masters_0_f_rd_data$D_OUT),
								   .FULL_N(fabric_xactors_from_masters_0_f_rd_data$FULL_N),
								   .EMPTY_N(fabric_xactors_from_masters_0_f_rd_data$EMPTY_N));
  // submodule fabric_xactors_from_masters_0_f_wr_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) fabric_xactors_from_masters_0_f_wr_addr(.RST(RST_N),
								   .CLK(CLK),
								   .D_IN(fabric_xactors_from_masters_0_f_wr_addr$D_IN),
								   .ENQ(fabric_xactors_from_masters_0_f_wr_addr$ENQ),
								   .DEQ(fabric_xactors_from_masters_0_f_wr_addr$DEQ),
								   .CLR(fabric_xactors_from_masters_0_f_wr_addr$CLR),
								   .D_OUT(fabric_xactors_from_masters_0_f_wr_addr$D_OUT),
								   .FULL_N(fabric_xactors_from_masters_0_f_wr_addr$FULL_N),
								   .EMPTY_N(fabric_xactors_from_masters_0_f_wr_addr$EMPTY_N));
  // submodule fabric_xactors_from_masters_0_f_wr_data
  FIFO2 #(.width(32'd73),
	  .guarded(32'd1)) fabric_xactors_from_masters_0_f_wr_data(.RST(RST_N),
								   .CLK(CLK),
								   .D_IN(fabric_xactors_from_masters_0_f_wr_data$D_IN),
								   .ENQ(fabric_xactors_from_masters_0_f_wr_data$ENQ),
								   .DEQ(fabric_xactors_from_masters_0_f_wr_data$DEQ),
								   .CLR(fabric_xactors_from_masters_0_f_wr_data$CLR),
								   .D_OUT(fabric_xactors_from_masters_0_f_wr_data$D_OUT),
								   .FULL_N(fabric_xactors_from_masters_0_f_wr_data$FULL_N),
								   .EMPTY_N(fabric_xactors_from_masters_0_f_wr_data$EMPTY_N));
  // submodule fabric_xactors_from_masters_0_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(32'd1)) fabric_xactors_from_masters_0_f_wr_resp(.RST(RST_N),
								   .CLK(CLK),
								   .D_IN(fabric_xactors_from_masters_0_f_wr_resp$D_IN),
								   .ENQ(fabric_xactors_from_masters_0_f_wr_resp$ENQ),
								   .DEQ(fabric_xactors_from_masters_0_f_wr_resp$DEQ),
								   .CLR(fabric_xactors_from_masters_0_f_wr_resp$CLR),
								   .D_OUT(fabric_xactors_from_masters_0_f_wr_resp$D_OUT),
								   .FULL_N(fabric_xactors_from_masters_0_f_wr_resp$FULL_N),
								   .EMPTY_N(fabric_xactors_from_masters_0_f_wr_resp$EMPTY_N));
  // submodule fabric_xactors_from_masters_1_f_rd_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) fabric_xactors_from_masters_1_f_rd_addr(.RST(RST_N),
								   .CLK(CLK),
								   .D_IN(fabric_xactors_from_masters_1_f_rd_addr$D_IN),
								   .ENQ(fabric_xactors_from_masters_1_f_rd_addr$ENQ),
								   .DEQ(fabric_xactors_from_masters_1_f_rd_addr$DEQ),
								   .CLR(fabric_xactors_from_masters_1_f_rd_addr$CLR),
								   .D_OUT(fabric_xactors_from_masters_1_f_rd_addr$D_OUT),
								   .FULL_N(fabric_xactors_from_masters_1_f_rd_addr$FULL_N),
								   .EMPTY_N(fabric_xactors_from_masters_1_f_rd_addr$EMPTY_N));
  // submodule fabric_xactors_from_masters_1_f_rd_data
  FIFO2 #(.width(32'd71),
	  .guarded(32'd1)) fabric_xactors_from_masters_1_f_rd_data(.RST(RST_N),
								   .CLK(CLK),
								   .D_IN(fabric_xactors_from_masters_1_f_rd_data$D_IN),
								   .ENQ(fabric_xactors_from_masters_1_f_rd_data$ENQ),
								   .DEQ(fabric_xactors_from_masters_1_f_rd_data$DEQ),
								   .CLR(fabric_xactors_from_masters_1_f_rd_data$CLR),
								   .D_OUT(fabric_xactors_from_masters_1_f_rd_data$D_OUT),
								   .FULL_N(fabric_xactors_from_masters_1_f_rd_data$FULL_N),
								   .EMPTY_N(fabric_xactors_from_masters_1_f_rd_data$EMPTY_N));
  // submodule fabric_xactors_from_masters_1_f_wr_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) fabric_xactors_from_masters_1_f_wr_addr(.RST(RST_N),
								   .CLK(CLK),
								   .D_IN(fabric_xactors_from_masters_1_f_wr_addr$D_IN),
								   .ENQ(fabric_xactors_from_masters_1_f_wr_addr$ENQ),
								   .DEQ(fabric_xactors_from_masters_1_f_wr_addr$DEQ),
								   .CLR(fabric_xactors_from_masters_1_f_wr_addr$CLR),
								   .D_OUT(fabric_xactors_from_masters_1_f_wr_addr$D_OUT),
								   .FULL_N(fabric_xactors_from_masters_1_f_wr_addr$FULL_N),
								   .EMPTY_N(fabric_xactors_from_masters_1_f_wr_addr$EMPTY_N));
  // submodule fabric_xactors_from_masters_1_f_wr_data
  FIFO2 #(.width(32'd73),
	  .guarded(32'd1)) fabric_xactors_from_masters_1_f_wr_data(.RST(RST_N),
								   .CLK(CLK),
								   .D_IN(fabric_xactors_from_masters_1_f_wr_data$D_IN),
								   .ENQ(fabric_xactors_from_masters_1_f_wr_data$ENQ),
								   .DEQ(fabric_xactors_from_masters_1_f_wr_data$DEQ),
								   .CLR(fabric_xactors_from_masters_1_f_wr_data$CLR),
								   .D_OUT(fabric_xactors_from_masters_1_f_wr_data$D_OUT),
								   .FULL_N(fabric_xactors_from_masters_1_f_wr_data$FULL_N),
								   .EMPTY_N(fabric_xactors_from_masters_1_f_wr_data$EMPTY_N));
  // submodule fabric_xactors_from_masters_1_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(32'd1)) fabric_xactors_from_masters_1_f_wr_resp(.RST(RST_N),
								   .CLK(CLK),
								   .D_IN(fabric_xactors_from_masters_1_f_wr_resp$D_IN),
								   .ENQ(fabric_xactors_from_masters_1_f_wr_resp$ENQ),
								   .DEQ(fabric_xactors_from_masters_1_f_wr_resp$DEQ),
								   .CLR(fabric_xactors_from_masters_1_f_wr_resp$CLR),
								   .D_OUT(fabric_xactors_from_masters_1_f_wr_resp$D_OUT),
								   .FULL_N(fabric_xactors_from_masters_1_f_wr_resp$FULL_N),
								   .EMPTY_N(fabric_xactors_from_masters_1_f_wr_resp$EMPTY_N));
  // submodule fabric_xactors_to_slaves_0_f_rd_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) fabric_xactors_to_slaves_0_f_rd_addr(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_0_f_rd_addr$D_IN),
								.ENQ(fabric_xactors_to_slaves_0_f_rd_addr$ENQ),
								.DEQ(fabric_xactors_to_slaves_0_f_rd_addr$DEQ),
								.CLR(fabric_xactors_to_slaves_0_f_rd_addr$CLR),
								.D_OUT(fabric_xactors_to_slaves_0_f_rd_addr$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_0_f_rd_addr$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_0_f_rd_addr$EMPTY_N));
  // submodule fabric_xactors_to_slaves_0_f_rd_data
  FIFO2 #(.width(32'd71),
	  .guarded(32'd1)) fabric_xactors_to_slaves_0_f_rd_data(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_0_f_rd_data$D_IN),
								.ENQ(fabric_xactors_to_slaves_0_f_rd_data$ENQ),
								.DEQ(fabric_xactors_to_slaves_0_f_rd_data$DEQ),
								.CLR(fabric_xactors_to_slaves_0_f_rd_data$CLR),
								.D_OUT(fabric_xactors_to_slaves_0_f_rd_data$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_0_f_rd_data$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_0_f_rd_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_0_f_wr_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) fabric_xactors_to_slaves_0_f_wr_addr(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_0_f_wr_addr$D_IN),
								.ENQ(fabric_xactors_to_slaves_0_f_wr_addr$ENQ),
								.DEQ(fabric_xactors_to_slaves_0_f_wr_addr$DEQ),
								.CLR(fabric_xactors_to_slaves_0_f_wr_addr$CLR),
								.D_OUT(fabric_xactors_to_slaves_0_f_wr_addr$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_0_f_wr_addr$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_0_f_wr_addr$EMPTY_N));
  // submodule fabric_xactors_to_slaves_0_f_wr_data
  FIFO2 #(.width(32'd73),
	  .guarded(32'd1)) fabric_xactors_to_slaves_0_f_wr_data(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_0_f_wr_data$D_IN),
								.ENQ(fabric_xactors_to_slaves_0_f_wr_data$ENQ),
								.DEQ(fabric_xactors_to_slaves_0_f_wr_data$DEQ),
								.CLR(fabric_xactors_to_slaves_0_f_wr_data$CLR),
								.D_OUT(fabric_xactors_to_slaves_0_f_wr_data$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_0_f_wr_data$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_0_f_wr_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_0_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(32'd1)) fabric_xactors_to_slaves_0_f_wr_resp(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_0_f_wr_resp$D_IN),
								.ENQ(fabric_xactors_to_slaves_0_f_wr_resp$ENQ),
								.DEQ(fabric_xactors_to_slaves_0_f_wr_resp$DEQ),
								.CLR(fabric_xactors_to_slaves_0_f_wr_resp$CLR),
								.D_OUT(fabric_xactors_to_slaves_0_f_wr_resp$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_0_f_wr_resp$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_0_f_wr_resp$EMPTY_N));
  // submodule fabric_xactors_to_slaves_1_f_rd_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) fabric_xactors_to_slaves_1_f_rd_addr(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_1_f_rd_addr$D_IN),
								.ENQ(fabric_xactors_to_slaves_1_f_rd_addr$ENQ),
								.DEQ(fabric_xactors_to_slaves_1_f_rd_addr$DEQ),
								.CLR(fabric_xactors_to_slaves_1_f_rd_addr$CLR),
								.D_OUT(fabric_xactors_to_slaves_1_f_rd_addr$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_1_f_rd_addr$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_1_f_rd_addr$EMPTY_N));
  // submodule fabric_xactors_to_slaves_1_f_rd_data
  FIFO2 #(.width(32'd71),
	  .guarded(32'd1)) fabric_xactors_to_slaves_1_f_rd_data(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_1_f_rd_data$D_IN),
								.ENQ(fabric_xactors_to_slaves_1_f_rd_data$ENQ),
								.DEQ(fabric_xactors_to_slaves_1_f_rd_data$DEQ),
								.CLR(fabric_xactors_to_slaves_1_f_rd_data$CLR),
								.D_OUT(fabric_xactors_to_slaves_1_f_rd_data$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_1_f_rd_data$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_1_f_rd_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_1_f_wr_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) fabric_xactors_to_slaves_1_f_wr_addr(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_1_f_wr_addr$D_IN),
								.ENQ(fabric_xactors_to_slaves_1_f_wr_addr$ENQ),
								.DEQ(fabric_xactors_to_slaves_1_f_wr_addr$DEQ),
								.CLR(fabric_xactors_to_slaves_1_f_wr_addr$CLR),
								.D_OUT(fabric_xactors_to_slaves_1_f_wr_addr$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_1_f_wr_addr$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_1_f_wr_addr$EMPTY_N));
  // submodule fabric_xactors_to_slaves_1_f_wr_data
  FIFO2 #(.width(32'd73),
	  .guarded(32'd1)) fabric_xactors_to_slaves_1_f_wr_data(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_1_f_wr_data$D_IN),
								.ENQ(fabric_xactors_to_slaves_1_f_wr_data$ENQ),
								.DEQ(fabric_xactors_to_slaves_1_f_wr_data$DEQ),
								.CLR(fabric_xactors_to_slaves_1_f_wr_data$CLR),
								.D_OUT(fabric_xactors_to_slaves_1_f_wr_data$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_1_f_wr_data$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_1_f_wr_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_1_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(32'd1)) fabric_xactors_to_slaves_1_f_wr_resp(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_1_f_wr_resp$D_IN),
								.ENQ(fabric_xactors_to_slaves_1_f_wr_resp$ENQ),
								.DEQ(fabric_xactors_to_slaves_1_f_wr_resp$DEQ),
								.CLR(fabric_xactors_to_slaves_1_f_wr_resp$CLR),
								.D_OUT(fabric_xactors_to_slaves_1_f_wr_resp$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_1_f_wr_resp$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_1_f_wr_resp$EMPTY_N));
  // submodule fabric_xactors_to_slaves_2_f_rd_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) fabric_xactors_to_slaves_2_f_rd_addr(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_2_f_rd_addr$D_IN),
								.ENQ(fabric_xactors_to_slaves_2_f_rd_addr$ENQ),
								.DEQ(fabric_xactors_to_slaves_2_f_rd_addr$DEQ),
								.CLR(fabric_xactors_to_slaves_2_f_rd_addr$CLR),
								.D_OUT(fabric_xactors_to_slaves_2_f_rd_addr$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_2_f_rd_addr$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_2_f_rd_addr$EMPTY_N));
  // submodule fabric_xactors_to_slaves_2_f_rd_data
  FIFO2 #(.width(32'd71),
	  .guarded(32'd1)) fabric_xactors_to_slaves_2_f_rd_data(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_2_f_rd_data$D_IN),
								.ENQ(fabric_xactors_to_slaves_2_f_rd_data$ENQ),
								.DEQ(fabric_xactors_to_slaves_2_f_rd_data$DEQ),
								.CLR(fabric_xactors_to_slaves_2_f_rd_data$CLR),
								.D_OUT(fabric_xactors_to_slaves_2_f_rd_data$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_2_f_rd_data$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_2_f_rd_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_2_f_wr_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) fabric_xactors_to_slaves_2_f_wr_addr(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_2_f_wr_addr$D_IN),
								.ENQ(fabric_xactors_to_slaves_2_f_wr_addr$ENQ),
								.DEQ(fabric_xactors_to_slaves_2_f_wr_addr$DEQ),
								.CLR(fabric_xactors_to_slaves_2_f_wr_addr$CLR),
								.D_OUT(fabric_xactors_to_slaves_2_f_wr_addr$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_2_f_wr_addr$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_2_f_wr_addr$EMPTY_N));
  // submodule fabric_xactors_to_slaves_2_f_wr_data
  FIFO2 #(.width(32'd73),
	  .guarded(32'd1)) fabric_xactors_to_slaves_2_f_wr_data(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_2_f_wr_data$D_IN),
								.ENQ(fabric_xactors_to_slaves_2_f_wr_data$ENQ),
								.DEQ(fabric_xactors_to_slaves_2_f_wr_data$DEQ),
								.CLR(fabric_xactors_to_slaves_2_f_wr_data$CLR),
								.D_OUT(fabric_xactors_to_slaves_2_f_wr_data$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_2_f_wr_data$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_2_f_wr_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_2_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(32'd1)) fabric_xactors_to_slaves_2_f_wr_resp(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_xactors_to_slaves_2_f_wr_resp$D_IN),
								.ENQ(fabric_xactors_to_slaves_2_f_wr_resp$ENQ),
								.DEQ(fabric_xactors_to_slaves_2_f_wr_resp$DEQ),
								.CLR(fabric_xactors_to_slaves_2_f_wr_resp$CLR),
								.D_OUT(fabric_xactors_to_slaves_2_f_wr_resp$D_OUT),
								.FULL_N(fabric_xactors_to_slaves_2_f_wr_resp$FULL_N),
								.EMPTY_N(fabric_xactors_to_slaves_2_f_wr_resp$EMPTY_N));
  // submodule soc_map
  mkSoC_Map soc_map(.CLK(CLK),
		    .RST_N(RST_N),
		    .m_is_IO_addr_addr(soc_map$m_is_IO_addr_addr),
		    .m_is_mem_addr_addr(soc_map$m_is_mem_addr_addr),
		    .m_is_near_mem_IO_addr_addr(soc_map$m_is_near_mem_IO_addr_addr),
		    .m_plic_addr_base(soc_map$m_plic_addr_base),
		    .m_plic_addr_size(),
		    .m_plic_addr_lim(soc_map$m_plic_addr_lim),
		    .m_near_mem_io_addr_base(soc_map$m_near_mem_io_addr_base),
		    .m_near_mem_io_addr_size(),
		    .m_near_mem_io_addr_lim(soc_map$m_near_mem_io_addr_lim),
		    .m_flash_mem_addr_base(),
		    .m_flash_mem_addr_size(),
		    .m_flash_mem_addr_lim(),
		    .m_ethernet_0_addr_base(),
		    .m_ethernet_0_addr_size(),
		    .m_ethernet_0_addr_lim(),
		    .m_dma_0_addr_base(),
		    .m_dma_0_addr_size(),
		    .m_dma_0_addr_lim(),
		    .m_uart16550_0_addr_base(),
		    .m_uart16550_0_addr_size(),
		    .m_uart16550_0_addr_lim(),
		    .m_gpio_0_addr_base(),
		    .m_gpio_0_addr_size(),
		    .m_gpio_0_addr_lim(),
		    .m_boot_rom_addr_base(),
		    .m_boot_rom_addr_size(),
		    .m_boot_rom_addr_lim(),
		    .m_ddr4_0_uncached_addr_base(),
		    .m_ddr4_0_uncached_addr_size(),
		    .m_ddr4_0_uncached_addr_lim(),
		    .m_ddr4_0_cached_addr_base(),
		    .m_ddr4_0_cached_addr_size(),
		    .m_ddr4_0_cached_addr_lim(),
		    .m_is_mem_addr(),
		    .m_is_IO_addr(),
		    .m_is_near_mem_IO_addr(),
		    .m_pc_reset_value(),
		    .m_mtvec_reset_value(),
		    .m_nmivec_reset_value());
  // rule RL_fabric_rl_wr_xaction_master_to_slave
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave =
	     fabric_xactors_from_masters_0_f_wr_addr$EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_wr_addr$FULL_N &&
	     fabric_v_f_wd_tasks_0$FULL_N &&
	     fabric_v_f_wr_mis_0$FULL_N &&
	     fabric_v_f_wr_sjs_0$FULL_N &&
	     (!soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d19 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d22) &&
	     (!soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d26 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d29) ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;
  // rule RL_fabric_rl_wr_xaction_master_to_slave_1
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 =
	     fabric_xactors_from_masters_0_f_wr_addr$EMPTY_N &&
	     fabric_v_f_wd_tasks_0$FULL_N &&
	     fabric_v_f_wr_sjs_0$FULL_N &&
	     fabric_xactors_to_slaves_1_f_wr_addr$FULL_N &&
	     fabric_v_f_wr_mis_1$FULL_N &&
	     soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d19 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d22 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;
  // rule RL_fabric_rl_wr_xaction_master_to_slave_2
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 =
	     fabric_xactors_from_masters_0_f_wr_addr$EMPTY_N &&
	     fabric_v_f_wd_tasks_0$FULL_N &&
	     fabric_v_f_wr_sjs_0$FULL_N &&
	     fabric_xactors_to_slaves_2_f_wr_addr$FULL_N &&
	     fabric_v_f_wr_mis_2$FULL_N &&
	     (!soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d19 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d22) &&
	     soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d26 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d29 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;
  // rule RL_fabric_rl_wr_xaction_master_to_slave_3
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 =
	     fabric_xactors_to_slaves_0_f_wr_addr$FULL_N &&
	     fabric_v_f_wr_mis_0$FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_addr$EMPTY_N &&
	     fabric_v_f_wd_tasks_1$FULL_N &&
	     fabric_v_f_wr_sjs_1$FULL_N &&
	     (!soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d81 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d83) &&
	     (!soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d86 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d88) ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;
  // rule RL_fabric_rl_wr_xaction_master_to_slave_4
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 =
	     fabric_xactors_to_slaves_1_f_wr_addr$FULL_N &&
	     fabric_v_f_wr_mis_1$FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_addr$EMPTY_N &&
	     fabric_v_f_wd_tasks_1$FULL_N &&
	     fabric_v_f_wr_sjs_1$FULL_N &&
	     soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d81 &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d83 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;
  // rule RL_fabric_rl_wr_xaction_master_to_slave_5
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 =
	     fabric_xactors_to_slaves_2_f_wr_addr$FULL_N &&
	     fabric_v_f_wr_mis_2$FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_addr$EMPTY_N &&
	     fabric_v_f_wd_tasks_1$FULL_N &&
	     fabric_v_f_wr_sjs_1$FULL_N &&
	     (!soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d81 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d83) &&
	     soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d86 &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d88 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;
  // rule RL_fabric_rl_wr_xaction_master_to_slave_data
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data =
	     fabric_xactors_from_masters_0_f_wr_data$EMPTY_N &&
	     fabric_v_f_wd_tasks_0_i_notEmpty__21_AND_fabri_ETC___d130 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data ;
  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_1
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 =
	     fabric_xactors_from_masters_1_f_wr_data$EMPTY_N &&
	     fabric_v_f_wd_tasks_1_i_notEmpty__53_AND_fabri_ETC___d159 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data ;
  // rule RL_fabric_rl_wr_resp_slave_to_master
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master =
	     fabric_v_f_wr_mis_0$EMPTY_N && fabric_v_f_wr_sjs_0$EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_wr_resp$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_mis_0$D_OUT == 2'd0 &&
	     fabric_v_f_wr_sjs_0$D_OUT == 2'd0 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;
  // rule RL_fabric_rl_wr_resp_slave_to_master_1
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 =
	     fabric_v_f_wr_sjs_0$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_mis_1$EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_wr_resp$EMPTY_N &&
	     fabric_v_f_wr_mis_1$D_OUT == 2'd0 &&
	     fabric_v_f_wr_sjs_0$D_OUT == 2'd1 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ;
  // rule RL_fabric_rl_wr_resp_slave_to_master_2
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 =
	     fabric_v_f_wr_sjs_0$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_mis_2$EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_wr_resp$EMPTY_N &&
	     fabric_v_f_wr_mis_2$D_OUT == 2'd0 &&
	     fabric_v_f_wr_sjs_0$D_OUT == 2'd2 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ;
  // rule RL_fabric_rl_wr_resp_slave_to_master_3
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 =
	     fabric_v_f_wr_mis_0$EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_wr_resp$EMPTY_N &&
	     fabric_v_f_wr_sjs_1$EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_mis_0$D_OUT == 2'd1 &&
	     fabric_v_f_wr_sjs_1$D_OUT == 2'd0 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 ;
  // rule RL_fabric_rl_wr_resp_slave_to_master_4
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 =
	     fabric_v_f_wr_mis_1$EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_wr_resp$EMPTY_N &&
	     fabric_v_f_wr_sjs_1$EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_mis_1$D_OUT == 2'd1 &&
	     fabric_v_f_wr_sjs_1$D_OUT == 2'd1 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 ;
  // rule RL_fabric_rl_wr_resp_slave_to_master_5
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 =
	     fabric_v_f_wr_mis_2$EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_wr_resp$EMPTY_N &&
	     fabric_v_f_wr_sjs_1$EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_mis_2$D_OUT == 2'd1 &&
	     fabric_v_f_wr_sjs_1$D_OUT == 2'd2 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 ;
  // rule RL_fabric_rl_wr_resp_err_to_master
  assign CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master =
	     fabric_v_f_wr_sjs_0$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_err_info_0$EMPTY_N &&
	     fabric_v_f_wr_sjs_0$D_OUT == 2'd3 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master =
	     CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master ;
  // rule RL_fabric_rl_wr_resp_err_to_master_1
  assign CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 =
	     fabric_v_f_wr_sjs_1$EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_err_info_1$EMPTY_N &&
	     fabric_v_f_wr_sjs_1$D_OUT == 2'd3 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 ;
  // rule RL_fabric_rl_rd_xaction_master_to_slave
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave =
	     fabric_xactors_from_masters_0_f_rd_addr$EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_rd_addr$FULL_N &&
	     fabric_v_f_rd_mis_0$FULL_N &&
	     fabric_v_f_rd_sjs_0$FULL_N &&
	     (!soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d284 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d286) &&
	     (!soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d289 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d291) ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ;
  // rule RL_fabric_rl_rd_xaction_master_to_slave_1
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 =
	     fabric_xactors_from_masters_0_f_rd_addr$EMPTY_N &&
	     fabric_v_f_rd_sjs_0$FULL_N &&
	     fabric_xactors_to_slaves_1_f_rd_addr$FULL_N &&
	     fabric_v_f_rd_mis_1$FULL_N &&
	     soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d284 &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d286 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ;
  // rule RL_fabric_rl_rd_xaction_master_to_slave_2
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 =
	     fabric_xactors_from_masters_0_f_rd_addr$EMPTY_N &&
	     fabric_v_f_rd_sjs_0$FULL_N &&
	     fabric_xactors_to_slaves_2_f_rd_addr$FULL_N &&
	     fabric_v_f_rd_mis_2$FULL_N &&
	     (!soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d284 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d286) &&
	     soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d289 &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d291 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ;
  // rule RL_fabric_rl_rd_xaction_master_to_slave_3
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 =
	     fabric_xactors_to_slaves_0_f_rd_addr$FULL_N &&
	     fabric_v_f_rd_mis_0$FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr$EMPTY_N &&
	     fabric_v_f_rd_sjs_1$FULL_N &&
	     (!soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d334 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d336) &&
	     (!soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d339 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d341) ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ;
  // rule RL_fabric_rl_rd_xaction_master_to_slave_4
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 =
	     fabric_xactors_to_slaves_1_f_rd_addr$FULL_N &&
	     fabric_v_f_rd_mis_1$FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr$EMPTY_N &&
	     fabric_v_f_rd_sjs_1$FULL_N &&
	     soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d334 &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d336 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ;
  // rule RL_fabric_rl_rd_xaction_master_to_slave_5
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 =
	     fabric_xactors_to_slaves_2_f_rd_addr$FULL_N &&
	     fabric_v_f_rd_mis_2$FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr$EMPTY_N &&
	     fabric_v_f_rd_sjs_1$FULL_N &&
	     (!soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d334 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d336) &&
	     soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d339 &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d341 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ;
  // rule RL_fabric_rl_rd_resp_slave_to_master
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master =
	     fabric_v_f_rd_mis_0$EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_rd_data$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_rd_data$FULL_N &&
	     fabric_v_f_rd_sjs_0$EMPTY_N &&
	     fabric_v_f_rd_mis_0$D_OUT[9:8] == 2'd0 &&
	     fabric_v_f_rd_sjs_0$D_OUT == 2'd0 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master ;
  // rule RL_fabric_rl_rd_resp_slave_to_master_1
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 =
	     fabric_xactors_from_masters_0_f_rd_data$FULL_N &&
	     fabric_v_f_rd_mis_1$EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_rd_data$EMPTY_N &&
	     fabric_v_f_rd_sjs_0$EMPTY_N &&
	     fabric_v_f_rd_mis_1$D_OUT[9:8] == 2'd0 &&
	     fabric_v_f_rd_sjs_0$D_OUT == 2'd1 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ;
  // rule RL_fabric_rl_rd_resp_slave_to_master_2
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 =
	     fabric_xactors_from_masters_0_f_rd_data$FULL_N &&
	     fabric_v_f_rd_mis_2$EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_rd_data$EMPTY_N &&
	     fabric_v_f_rd_sjs_0$EMPTY_N &&
	     fabric_v_f_rd_mis_2$D_OUT[9:8] == 2'd0 &&
	     fabric_v_f_rd_sjs_0$D_OUT == 2'd2 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ;
  // rule RL_fabric_rl_rd_resp_slave_to_master_3
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 =
	     fabric_v_f_rd_mis_0$EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_rd_data$EMPTY_N &&
	     fabric_xactors_from_masters_1_f_rd_data$FULL_N &&
	     fabric_v_f_rd_sjs_1$EMPTY_N &&
	     fabric_v_f_rd_mis_0$D_OUT[9:8] == 2'd1 &&
	     fabric_v_f_rd_sjs_1$D_OUT == 2'd0 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 ;
  // rule RL_fabric_rl_rd_resp_slave_to_master_4
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 =
	     fabric_v_f_rd_mis_1$EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_rd_data$EMPTY_N &&
	     fabric_xactors_from_masters_1_f_rd_data$FULL_N &&
	     fabric_v_f_rd_sjs_1$EMPTY_N &&
	     fabric_v_f_rd_mis_1$D_OUT[9:8] == 2'd1 &&
	     fabric_v_f_rd_sjs_1$D_OUT == 2'd1 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 ;
  // rule RL_fabric_rl_rd_resp_slave_to_master_5
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 =
	     fabric_v_f_rd_mis_2$EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_rd_data$EMPTY_N &&
	     fabric_xactors_from_masters_1_f_rd_data$FULL_N &&
	     fabric_v_f_rd_sjs_1$EMPTY_N &&
	     fabric_v_f_rd_mis_2$D_OUT[9:8] == 2'd1 &&
	     fabric_v_f_rd_sjs_1$D_OUT == 2'd2 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 ;
  // rule RL_fabric_rl_rd_resp_err_to_master
  assign CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master =
	     fabric_v_f_rd_sjs_0$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_rd_data$FULL_N &&
	     fabric_v_f_rd_err_info_0$EMPTY_N &&
	     fabric_v_f_rd_sjs_0$D_OUT == 2'd3 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master =
	     CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master ;
  // rule RL_fabric_rl_rd_resp_err_to_master_1
  assign CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 =
	     fabric_v_f_rd_sjs_1$EMPTY_N &&
	     fabric_xactors_from_masters_1_f_rd_data$FULL_N &&
	     fabric_v_f_rd_err_info_1$EMPTY_N &&
	     fabric_v_f_rd_sjs_1$D_OUT == 2'd3 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 ;
  // rule RL_fabric_rl_reset
  assign CAN_FIRE_RL_fabric_rl_reset = fabric_rg_reset ;
  assign WILL_FIRE_RL_fabric_rl_reset = fabric_rg_reset ;
  // inputs to muxes for submodule ports
  assign MUX_fabric_xactors_to_slaves_0_f_wr_data$enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_v_f_wd_tasks_0$D_OUT[9:8] == 2'd0 ;
  assign MUX_fabric_xactors_to_slaves_1_f_wr_data$enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_v_f_wd_tasks_0$D_OUT[9:8] == 2'd1 ;
  assign MUX_fabric_xactors_to_slaves_2_f_wr_data$enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_v_f_wd_tasks_0$D_OUT[9:8] == 2'd2 ;
  assign MUX_fabric_v_f_rd_mis_0$enq_1__VAL_1 =
	     { 2'd0, fabric_xactors_from_masters_0_f_rd_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_f_rd_mis_0$enq_1__VAL_2 =
	     { 2'd1, fabric_xactors_from_masters_1_f_rd_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_1 =
	     { 2'd0, fabric_xactors_from_masters_0_f_wr_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_2 =
	     { 2'd1, fabric_xactors_from_masters_0_f_wr_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_3 =
	     { 2'd2, fabric_xactors_from_masters_0_f_wr_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_1 =
	     { 2'd0, fabric_xactors_from_masters_1_f_wr_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_2 =
	     { 2'd1, fabric_xactors_from_masters_1_f_wr_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_3 =
	     { 2'd2, fabric_xactors_from_masters_1_f_wr_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_rg_r_beat_count_0$write_1__VAL_3 =
	     fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 ?
	       8'd0 :
	       x__h18337 ;
  assign MUX_fabric_v_rg_r_beat_count_1$write_1__VAL_2 =
	     fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 ?
	       8'd0 :
	       x__h18963 ;
  assign MUX_fabric_v_rg_r_beat_count_2$write_1__VAL_3 =
	     fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 ?
	       8'd0 :
	       x__h19579 ;
  assign MUX_fabric_v_rg_wd_beat_count_0$write_1__VAL_2 =
	     fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 ?
	       8'd0 :
	       x__h11955 ;
  assign MUX_fabric_v_rg_wd_beat_count_1$write_1__VAL_2 =
	     fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 ?
	       8'd0 :
	       x__h12581 ;
  assign MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_1 =
	     { fabric_xactors_to_slaves_0_f_rd_data$D_OUT[70:3],
	       IF_fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_ETC___d403,
	       fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0] } ;
  assign MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_2 =
	     { fabric_xactors_to_slaves_1_f_rd_data$D_OUT[70:3],
	       IF_fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_ETC___d438,
	       fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0] } ;
  assign MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_3 =
	     { fabric_xactors_to_slaves_2_f_rd_data$D_OUT[70:3],
	       IF_fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_ETC___d473,
	       fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0] } ;
  assign MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_4 =
	     { fabric_v_f_rd_err_info_0$D_OUT[3:0],
	       66'd3,
	       fabric_v_rg_r_err_beat_count_0_20_EQ_fabric_v__ETC___d522 } ;
  assign MUX_fabric_xactors_from_masters_0_f_wr_resp$enq_1__VAL_4 =
	     { fabric_v_f_wr_err_info_0$D_OUT, 2'd3 } ;
  assign MUX_fabric_xactors_from_masters_1_f_rd_data$enq_1__VAL_4 =
	     { fabric_v_f_rd_err_info_1$D_OUT[3:0],
	       66'd3,
	       fabric_v_rg_r_err_beat_count_1_38_EQ_fabric_v__ETC___d540 } ;
  assign MUX_fabric_xactors_from_masters_1_f_wr_resp$enq_1__VAL_4 =
	     { fabric_v_f_wr_err_info_1$D_OUT, 2'd3 } ;
  // register fabric_cfg_verbosity
  assign fabric_cfg_verbosity$D_IN = set_verbosity_verbosity ;
  assign fabric_cfg_verbosity$EN = EN_set_verbosity ;
  // register fabric_rg_reset
  assign fabric_rg_reset$D_IN = !fabric_rg_reset ;
  assign fabric_rg_reset$EN = fabric_rg_reset || EN_reset ;
  // register fabric_v_rg_r_beat_count_0
  always@(fabric_rg_reset or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 or
	  MUX_fabric_v_rg_r_beat_count_0$write_1__VAL_3 or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master)
  case (1'b1)
    fabric_rg_reset: fabric_v_rg_r_beat_count_0$D_IN = 8'd0;
    WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3:
	fabric_v_rg_r_beat_count_0$D_IN =
	    MUX_fabric_v_rg_r_beat_count_0$write_1__VAL_3;
    WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master:
	fabric_v_rg_r_beat_count_0$D_IN =
	    MUX_fabric_v_rg_r_beat_count_0$write_1__VAL_3;
    default: fabric_v_rg_r_beat_count_0$D_IN =
		 8'b10101010 /* unspecified value */ ;
  endcase
  assign fabric_v_rg_r_beat_count_0$EN =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master ||
	     fabric_rg_reset ;
  // register fabric_v_rg_r_beat_count_1
  always@(fabric_rg_reset or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 or
	  MUX_fabric_v_rg_r_beat_count_1$write_1__VAL_2 or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1)
  case (1'b1)
    fabric_rg_reset: fabric_v_rg_r_beat_count_1$D_IN = 8'd0;
    WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4:
	fabric_v_rg_r_beat_count_1$D_IN =
	    MUX_fabric_v_rg_r_beat_count_1$write_1__VAL_2;
    WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1:
	fabric_v_rg_r_beat_count_1$D_IN =
	    MUX_fabric_v_rg_r_beat_count_1$write_1__VAL_2;
    default: fabric_v_rg_r_beat_count_1$D_IN =
		 8'b10101010 /* unspecified value */ ;
  endcase
  assign fabric_v_rg_r_beat_count_1$EN =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ||
	     fabric_rg_reset ;
  // register fabric_v_rg_r_beat_count_2
  always@(fabric_rg_reset or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 or
	  MUX_fabric_v_rg_r_beat_count_2$write_1__VAL_3 or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2)
  case (1'b1)
    fabric_rg_reset: fabric_v_rg_r_beat_count_2$D_IN = 8'd0;
    WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5:
	fabric_v_rg_r_beat_count_2$D_IN =
	    MUX_fabric_v_rg_r_beat_count_2$write_1__VAL_3;
    WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2:
	fabric_v_rg_r_beat_count_2$D_IN =
	    MUX_fabric_v_rg_r_beat_count_2$write_1__VAL_3;
    default: fabric_v_rg_r_beat_count_2$D_IN =
		 8'b10101010 /* unspecified value */ ;
  endcase
  assign fabric_v_rg_r_beat_count_2$EN =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ||
	     fabric_rg_reset ;
  // register fabric_v_rg_r_err_beat_count_0
  assign fabric_v_rg_r_err_beat_count_0$D_IN =
	     fabric_v_rg_r_err_beat_count_0_20_EQ_fabric_v__ETC___d522 ?
	       8'd0 :
	       x__h21883 ;
  assign fabric_v_rg_r_err_beat_count_0$EN =
	     CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master ;
  // register fabric_v_rg_r_err_beat_count_1
  assign fabric_v_rg_r_err_beat_count_1$D_IN =
	     fabric_v_rg_r_err_beat_count_1_38_EQ_fabric_v__ETC___d540 ?
	       8'd0 :
	       x__h22284 ;
  assign fabric_v_rg_r_err_beat_count_1$EN =
	     CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 ;
  // register fabric_v_rg_wd_beat_count_0
  assign fabric_v_rg_wd_beat_count_0$D_IN =
	     fabric_rg_reset ?
	       8'd0 :
	       MUX_fabric_v_rg_wd_beat_count_0$write_1__VAL_2 ;
  assign fabric_v_rg_wd_beat_count_0$EN =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data ||
	     fabric_rg_reset ;
  // register fabric_v_rg_wd_beat_count_1
  assign fabric_v_rg_wd_beat_count_1$D_IN =
	     fabric_rg_reset ?
	       8'd0 :
	       MUX_fabric_v_rg_wd_beat_count_1$write_1__VAL_2 ;
  assign fabric_v_rg_wd_beat_count_1$EN =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 ||
	     fabric_rg_reset ;
  // submodule fabric_v_f_rd_err_info_0
  assign fabric_v_f_rd_err_info_0$D_IN = 12'h0 ;
  assign fabric_v_f_rd_err_info_0$ENQ = 1'b0 ;
  assign fabric_v_f_rd_err_info_0$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	     fabric_v_rg_r_err_beat_count_0_20_EQ_fabric_v__ETC___d522 ;
  assign fabric_v_f_rd_err_info_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_rd_err_info_1
  assign fabric_v_f_rd_err_info_1$D_IN = 12'h0 ;
  assign fabric_v_f_rd_err_info_1$ENQ = 1'b0 ;
  assign fabric_v_f_rd_err_info_1$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	     fabric_v_rg_r_err_beat_count_1_38_EQ_fabric_v__ETC___d540 ;
  assign fabric_v_f_rd_err_info_1$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_rd_mis_0
  assign fabric_v_f_rd_mis_0$D_IN =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ?
	       MUX_fabric_v_f_rd_mis_0$enq_1__VAL_1 :
	       MUX_fabric_v_f_rd_mis_0$enq_1__VAL_2 ;
  assign fabric_v_f_rd_mis_0$ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ;
  assign fabric_v_f_rd_mis_0$DEQ =
	     _dor1fabric_v_f_rd_mis_0$EN_deq &&
	     fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 ;
  assign fabric_v_f_rd_mis_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_rd_mis_1
  assign fabric_v_f_rd_mis_1$D_IN =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ?
	       MUX_fabric_v_f_rd_mis_0$enq_1__VAL_1 :
	       MUX_fabric_v_f_rd_mis_0$enq_1__VAL_2 ;
  assign fabric_v_f_rd_mis_1$ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ;
  assign fabric_v_f_rd_mis_1$DEQ =
	     _dor1fabric_v_f_rd_mis_1$EN_deq &&
	     fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 ;
  assign fabric_v_f_rd_mis_1$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_rd_mis_2
  assign fabric_v_f_rd_mis_2$D_IN =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ?
	       MUX_fabric_v_f_rd_mis_0$enq_1__VAL_1 :
	       MUX_fabric_v_f_rd_mis_0$enq_1__VAL_2 ;
  assign fabric_v_f_rd_mis_2$ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ;
  assign fabric_v_f_rd_mis_2$DEQ =
	     _dor1fabric_v_f_rd_mis_2$EN_deq &&
	     fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 ;
  assign fabric_v_f_rd_mis_2$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_rd_sjs_0
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave:
	  fabric_v_f_rd_sjs_0$D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1:
	  fabric_v_f_rd_sjs_0$D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2:
	  fabric_v_f_rd_sjs_0$D_IN = 2'd2;
      default: fabric_v_f_rd_sjs_0$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_sjs_0$ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ;
  assign fabric_v_f_rd_sjs_0$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	     fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	     fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	     fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	     fabric_v_rg_r_err_beat_count_0_20_EQ_fabric_v__ETC___d522 ;
  assign fabric_v_f_rd_sjs_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_rd_sjs_1
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3:
	  fabric_v_f_rd_sjs_1$D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4:
	  fabric_v_f_rd_sjs_1$D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5:
	  fabric_v_f_rd_sjs_1$D_IN = 2'd2;
      default: fabric_v_f_rd_sjs_1$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_sjs_1$ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ;
  assign fabric_v_f_rd_sjs_1$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	     fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	     fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	     fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	     fabric_v_rg_r_err_beat_count_1_38_EQ_fabric_v__ETC___d540 ;
  assign fabric_v_f_rd_sjs_1$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wd_tasks_0
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave or
	  MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_1 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 or
	  MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_2 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 or
	  MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave:
	  fabric_v_f_wd_tasks_0$D_IN = MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1:
	  fabric_v_f_wd_tasks_0$D_IN = MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_2;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2:
	  fabric_v_f_wd_tasks_0$D_IN = MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_3;
      default: fabric_v_f_wd_tasks_0$D_IN =
		   10'b1010101010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wd_tasks_0$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;
  assign fabric_v_f_wd_tasks_0$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 ;
  assign fabric_v_f_wd_tasks_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wd_tasks_1
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 or
	  MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_1 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 or
	  MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_2 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 or
	  MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3:
	  fabric_v_f_wd_tasks_1$D_IN = MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4:
	  fabric_v_f_wd_tasks_1$D_IN = MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_2;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5:
	  fabric_v_f_wd_tasks_1$D_IN = MUX_fabric_v_f_wd_tasks_1$enq_1__VAL_3;
      default: fabric_v_f_wd_tasks_1$D_IN =
		   10'b1010101010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wd_tasks_1$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;
  assign fabric_v_f_wd_tasks_1$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	     fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 ;
  assign fabric_v_f_wd_tasks_1$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_err_info_0
  assign fabric_v_f_wr_err_info_0$D_IN = 4'h0 ;
  assign fabric_v_f_wr_err_info_0$ENQ = 1'b0 ;
  assign fabric_v_f_wr_err_info_0$DEQ =
	     CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master ;
  assign fabric_v_f_wr_err_info_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_err_info_1
  assign fabric_v_f_wr_err_info_1$D_IN = 4'h0 ;
  assign fabric_v_f_wr_err_info_1$ENQ = 1'b0 ;
  assign fabric_v_f_wr_err_info_1$DEQ =
	     CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 ;
  assign fabric_v_f_wr_err_info_1$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_mis_0
  assign fabric_v_f_wr_mis_0$D_IN =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ? 2'd0 : 2'd1 ;
  assign fabric_v_f_wr_mis_0$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ;
  assign fabric_v_f_wr_mis_0$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;
  assign fabric_v_f_wr_mis_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_mis_1
  assign fabric_v_f_wr_mis_1$D_IN =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ?
	       2'd0 :
	       2'd1 ;
  assign fabric_v_f_wr_mis_1$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ;
  assign fabric_v_f_wr_mis_1$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ;
  assign fabric_v_f_wr_mis_1$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_mis_2
  assign fabric_v_f_wr_mis_2$D_IN =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ?
	       2'd0 :
	       2'd1 ;
  assign fabric_v_f_wr_mis_2$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;
  assign fabric_v_f_wr_mis_2$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ;
  assign fabric_v_f_wr_mis_2$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_sjs_0
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave:
	  fabric_v_f_wr_sjs_0$D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1:
	  fabric_v_f_wr_sjs_0$D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2:
	  fabric_v_f_wr_sjs_0$D_IN = 2'd2;
      default: fabric_v_f_wr_sjs_0$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_sjs_0$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;
  assign fabric_v_f_wr_sjs_0$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;
  assign fabric_v_f_wr_sjs_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_sjs_1
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3:
	  fabric_v_f_wr_sjs_1$D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4:
	  fabric_v_f_wr_sjs_1$D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5:
	  fabric_v_f_wr_sjs_1$D_IN = 2'd2;
      default: fabric_v_f_wr_sjs_1$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_sjs_1$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;
  assign fabric_v_f_wr_sjs_1$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 ;
  assign fabric_v_f_wr_sjs_1$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_from_masters_0_f_rd_addr
  assign fabric_xactors_from_masters_0_f_rd_addr$D_IN =
	     { v_from_masters_0_arid,
	       v_from_masters_0_araddr,
	       v_from_masters_0_arlen,
	       v_from_masters_0_arsize,
	       v_from_masters_0_arburst,
	       v_from_masters_0_arlock,
	       v_from_masters_0_arcache,
	       v_from_masters_0_arprot,
	       v_from_masters_0_arqos,
	       v_from_masters_0_arregion } ;
  assign fabric_xactors_from_masters_0_f_rd_addr$ENQ =
	     v_from_masters_0_arvalid &&
	     fabric_xactors_from_masters_0_f_rd_addr$FULL_N ;
  assign fabric_xactors_from_masters_0_f_rd_addr$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ;
  assign fabric_xactors_from_masters_0_f_rd_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_from_masters_0_f_rd_data
  always@(WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master or
	  MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_1 or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 or
	  MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_2 or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 or
	  MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_3 or
	  WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master or
	  MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master:
	  fabric_xactors_from_masters_0_f_rd_data$D_IN =
	      MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_1;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1:
	  fabric_xactors_from_masters_0_f_rd_data$D_IN =
	      MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_2;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2:
	  fabric_xactors_from_masters_0_f_rd_data$D_IN =
	      MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_3;
      WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master:
	  fabric_xactors_from_masters_0_f_rd_data$D_IN =
	      MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_4;
      default: fabric_xactors_from_masters_0_f_rd_data$D_IN =
		   71'h2AAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_from_masters_0_f_rd_data$ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master ;
  assign fabric_xactors_from_masters_0_f_rd_data$DEQ =
	     v_from_masters_0_rready &&
	     fabric_xactors_from_masters_0_f_rd_data$EMPTY_N ;
  assign fabric_xactors_from_masters_0_f_rd_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_from_masters_0_f_wr_addr
  assign fabric_xactors_from_masters_0_f_wr_addr$D_IN =
	     { v_from_masters_0_awid,
	       v_from_masters_0_awaddr,
	       v_from_masters_0_awlen,
	       v_from_masters_0_awsize,
	       v_from_masters_0_awburst,
	       v_from_masters_0_awlock,
	       v_from_masters_0_awcache,
	       v_from_masters_0_awprot,
	       v_from_masters_0_awqos,
	       v_from_masters_0_awregion } ;
  assign fabric_xactors_from_masters_0_f_wr_addr$ENQ =
	     v_from_masters_0_awvalid &&
	     fabric_xactors_from_masters_0_f_wr_addr$FULL_N ;
  assign fabric_xactors_from_masters_0_f_wr_addr$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;
  assign fabric_xactors_from_masters_0_f_wr_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_from_masters_0_f_wr_data
  assign fabric_xactors_from_masters_0_f_wr_data$D_IN =
	     { v_from_masters_0_wdata,
	       v_from_masters_0_wstrb,
	       v_from_masters_0_wlast } ;
  assign fabric_xactors_from_masters_0_f_wr_data$ENQ =
	     v_from_masters_0_wvalid &&
	     fabric_xactors_from_masters_0_f_wr_data$FULL_N ;
  assign fabric_xactors_from_masters_0_f_wr_data$DEQ =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data ;
  assign fabric_xactors_from_masters_0_f_wr_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_from_masters_0_f_wr_resp
  always@(WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 or
	  fabric_xactors_to_slaves_1_f_wr_resp$D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master or
	  fabric_xactors_to_slaves_0_f_wr_resp$D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 or
	  fabric_xactors_to_slaves_2_f_wr_resp$D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master or
	  MUX_fabric_xactors_from_masters_0_f_wr_resp$enq_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1:
	  fabric_xactors_from_masters_0_f_wr_resp$D_IN =
	      fabric_xactors_to_slaves_1_f_wr_resp$D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master:
	  fabric_xactors_from_masters_0_f_wr_resp$D_IN =
	      fabric_xactors_to_slaves_0_f_wr_resp$D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2:
	  fabric_xactors_from_masters_0_f_wr_resp$D_IN =
	      fabric_xactors_to_slaves_2_f_wr_resp$D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master:
	  fabric_xactors_from_masters_0_f_wr_resp$D_IN =
	      MUX_fabric_xactors_from_masters_0_f_wr_resp$enq_1__VAL_4;
      default: fabric_xactors_from_masters_0_f_wr_resp$D_IN =
		   6'b101010 /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_from_masters_0_f_wr_resp$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master ;
  assign fabric_xactors_from_masters_0_f_wr_resp$DEQ =
	     v_from_masters_0_bready &&
	     fabric_xactors_from_masters_0_f_wr_resp$EMPTY_N ;
  assign fabric_xactors_from_masters_0_f_wr_resp$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_from_masters_1_f_rd_addr
  assign fabric_xactors_from_masters_1_f_rd_addr$D_IN =
	     { v_from_masters_1_arid,
	       v_from_masters_1_araddr,
	       v_from_masters_1_arlen,
	       v_from_masters_1_arsize,
	       v_from_masters_1_arburst,
	       v_from_masters_1_arlock,
	       v_from_masters_1_arcache,
	       v_from_masters_1_arprot,
	       v_from_masters_1_arqos,
	       v_from_masters_1_arregion } ;
  assign fabric_xactors_from_masters_1_f_rd_addr$ENQ =
	     v_from_masters_1_arvalid &&
	     fabric_xactors_from_masters_1_f_rd_addr$FULL_N ;
  assign fabric_xactors_from_masters_1_f_rd_addr$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ;
  assign fabric_xactors_from_masters_1_f_rd_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_from_masters_1_f_rd_data
  always@(WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 or
	  MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_1 or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 or
	  MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_2 or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 or
	  MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_3 or
	  WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 or
	  MUX_fabric_xactors_from_masters_1_f_rd_data$enq_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3:
	  fabric_xactors_from_masters_1_f_rd_data$D_IN =
	      MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_1;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4:
	  fabric_xactors_from_masters_1_f_rd_data$D_IN =
	      MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_2;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5:
	  fabric_xactors_from_masters_1_f_rd_data$D_IN =
	      MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_3;
      WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1:
	  fabric_xactors_from_masters_1_f_rd_data$D_IN =
	      MUX_fabric_xactors_from_masters_1_f_rd_data$enq_1__VAL_4;
      default: fabric_xactors_from_masters_1_f_rd_data$D_IN =
		   71'h2AAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_from_masters_1_f_rd_data$ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 ;
  assign fabric_xactors_from_masters_1_f_rd_data$DEQ =
	     v_from_masters_1_rready &&
	     fabric_xactors_from_masters_1_f_rd_data$EMPTY_N ;
  assign fabric_xactors_from_masters_1_f_rd_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_from_masters_1_f_wr_addr
  assign fabric_xactors_from_masters_1_f_wr_addr$D_IN =
	     { v_from_masters_1_awid,
	       v_from_masters_1_awaddr,
	       v_from_masters_1_awlen,
	       v_from_masters_1_awsize,
	       v_from_masters_1_awburst,
	       v_from_masters_1_awlock,
	       v_from_masters_1_awcache,
	       v_from_masters_1_awprot,
	       v_from_masters_1_awqos,
	       v_from_masters_1_awregion } ;
  assign fabric_xactors_from_masters_1_f_wr_addr$ENQ =
	     v_from_masters_1_awvalid &&
	     fabric_xactors_from_masters_1_f_wr_addr$FULL_N ;
  assign fabric_xactors_from_masters_1_f_wr_addr$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ;
  assign fabric_xactors_from_masters_1_f_wr_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_from_masters_1_f_wr_data
  assign fabric_xactors_from_masters_1_f_wr_data$D_IN =
	     { v_from_masters_1_wdata,
	       v_from_masters_1_wstrb,
	       v_from_masters_1_wlast } ;
  assign fabric_xactors_from_masters_1_f_wr_data$ENQ =
	     v_from_masters_1_wvalid &&
	     fabric_xactors_from_masters_1_f_wr_data$FULL_N ;
  assign fabric_xactors_from_masters_1_f_wr_data$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 ;
  assign fabric_xactors_from_masters_1_f_wr_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_from_masters_1_f_wr_resp
  always@(WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 or
	  fabric_xactors_to_slaves_1_f_wr_resp$D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 or
	  fabric_xactors_to_slaves_0_f_wr_resp$D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 or
	  fabric_xactors_to_slaves_2_f_wr_resp$D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 or
	  MUX_fabric_xactors_from_masters_1_f_wr_resp$enq_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4:
	  fabric_xactors_from_masters_1_f_wr_resp$D_IN =
	      fabric_xactors_to_slaves_1_f_wr_resp$D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3:
	  fabric_xactors_from_masters_1_f_wr_resp$D_IN =
	      fabric_xactors_to_slaves_0_f_wr_resp$D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5:
	  fabric_xactors_from_masters_1_f_wr_resp$D_IN =
	      fabric_xactors_to_slaves_2_f_wr_resp$D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1:
	  fabric_xactors_from_masters_1_f_wr_resp$D_IN =
	      MUX_fabric_xactors_from_masters_1_f_wr_resp$enq_1__VAL_4;
      default: fabric_xactors_from_masters_1_f_wr_resp$D_IN =
		   6'b101010 /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_from_masters_1_f_wr_resp$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 ;
  assign fabric_xactors_from_masters_1_f_wr_resp$DEQ =
	     v_from_masters_1_bready &&
	     fabric_xactors_from_masters_1_f_wr_resp$EMPTY_N ;
  assign fabric_xactors_from_masters_1_f_wr_resp$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_0_f_rd_addr
  assign fabric_xactors_to_slaves_0_f_rd_addr$D_IN =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ?
	       fabric_xactors_from_masters_0_f_rd_addr$D_OUT :
	       fabric_xactors_from_masters_1_f_rd_addr$D_OUT ;
  assign fabric_xactors_to_slaves_0_f_rd_addr$ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ;
  assign fabric_xactors_to_slaves_0_f_rd_addr$DEQ =
	     fabric_xactors_to_slaves_0_f_rd_addr$EMPTY_N &&
	     v_to_slaves_0_arready ;
  assign fabric_xactors_to_slaves_0_f_rd_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_0_f_rd_data
  assign fabric_xactors_to_slaves_0_f_rd_data$D_IN =
	     { v_to_slaves_0_rid,
	       v_to_slaves_0_rdata,
	       v_to_slaves_0_rresp,
	       v_to_slaves_0_rlast } ;
  assign fabric_xactors_to_slaves_0_f_rd_data$ENQ =
	     v_to_slaves_0_rvalid &&
	     fabric_xactors_to_slaves_0_f_rd_data$FULL_N ;
  assign fabric_xactors_to_slaves_0_f_rd_data$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master ;
  assign fabric_xactors_to_slaves_0_f_rd_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_0_f_wr_addr
  assign fabric_xactors_to_slaves_0_f_wr_addr$D_IN =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ?
	       fabric_xactors_from_masters_0_f_wr_addr$D_OUT :
	       fabric_xactors_from_masters_1_f_wr_addr$D_OUT ;
  assign fabric_xactors_to_slaves_0_f_wr_addr$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ;
  assign fabric_xactors_to_slaves_0_f_wr_addr$DEQ =
	     fabric_xactors_to_slaves_0_f_wr_addr$EMPTY_N &&
	     v_to_slaves_0_awready ;
  assign fabric_xactors_to_slaves_0_f_wr_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_0_f_wr_data
  assign fabric_xactors_to_slaves_0_f_wr_data$D_IN =
	     MUX_fabric_xactors_to_slaves_0_f_wr_data$enq_1__SEL_1 ?
	       fabric_xactors_from_masters_0_f_wr_data$D_OUT :
	       fabric_xactors_from_masters_1_f_wr_data$D_OUT ;
  assign fabric_xactors_to_slaves_0_f_wr_data$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_v_f_wd_tasks_0$D_OUT[9:8] == 2'd0 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	     fabric_v_f_wd_tasks_1$D_OUT[9:8] == 2'd0 ;
  assign fabric_xactors_to_slaves_0_f_wr_data$DEQ =
	     fabric_xactors_to_slaves_0_f_wr_data$EMPTY_N &&
	     v_to_slaves_0_wready ;
  assign fabric_xactors_to_slaves_0_f_wr_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_0_f_wr_resp
  assign fabric_xactors_to_slaves_0_f_wr_resp$D_IN =
	     { v_to_slaves_0_bid, v_to_slaves_0_bresp } ;
  assign fabric_xactors_to_slaves_0_f_wr_resp$ENQ =
	     v_to_slaves_0_bvalid &&
	     fabric_xactors_to_slaves_0_f_wr_resp$FULL_N ;
  assign fabric_xactors_to_slaves_0_f_wr_resp$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;
  assign fabric_xactors_to_slaves_0_f_wr_resp$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_1_f_rd_addr
  assign fabric_xactors_to_slaves_1_f_rd_addr$D_IN =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ?
	       fabric_xactors_from_masters_0_f_rd_addr$D_OUT :
	       fabric_xactors_from_masters_1_f_rd_addr$D_OUT ;
  assign fabric_xactors_to_slaves_1_f_rd_addr$ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ;
  assign fabric_xactors_to_slaves_1_f_rd_addr$DEQ =
	     fabric_xactors_to_slaves_1_f_rd_addr$EMPTY_N &&
	     v_to_slaves_1_arready ;
  assign fabric_xactors_to_slaves_1_f_rd_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_1_f_rd_data
  assign fabric_xactors_to_slaves_1_f_rd_data$D_IN =
	     { v_to_slaves_1_rid,
	       v_to_slaves_1_rdata,
	       v_to_slaves_1_rresp,
	       v_to_slaves_1_rlast } ;
  assign fabric_xactors_to_slaves_1_f_rd_data$ENQ =
	     v_to_slaves_1_rvalid &&
	     fabric_xactors_to_slaves_1_f_rd_data$FULL_N ;
  assign fabric_xactors_to_slaves_1_f_rd_data$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ;
  assign fabric_xactors_to_slaves_1_f_rd_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_1_f_wr_addr
  assign fabric_xactors_to_slaves_1_f_wr_addr$D_IN =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ?
	       fabric_xactors_from_masters_0_f_wr_addr$D_OUT :
	       fabric_xactors_from_masters_1_f_wr_addr$D_OUT ;
  assign fabric_xactors_to_slaves_1_f_wr_addr$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ;
  assign fabric_xactors_to_slaves_1_f_wr_addr$DEQ =
	     fabric_xactors_to_slaves_1_f_wr_addr$EMPTY_N &&
	     v_to_slaves_1_awready ;
  assign fabric_xactors_to_slaves_1_f_wr_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_1_f_wr_data
  assign fabric_xactors_to_slaves_1_f_wr_data$D_IN =
	     MUX_fabric_xactors_to_slaves_1_f_wr_data$enq_1__SEL_1 ?
	       fabric_xactors_from_masters_0_f_wr_data$D_OUT :
	       fabric_xactors_from_masters_1_f_wr_data$D_OUT ;
  assign fabric_xactors_to_slaves_1_f_wr_data$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_v_f_wd_tasks_0$D_OUT[9:8] == 2'd1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	     fabric_v_f_wd_tasks_1$D_OUT[9:8] == 2'd1 ;
  assign fabric_xactors_to_slaves_1_f_wr_data$DEQ =
	     fabric_xactors_to_slaves_1_f_wr_data$EMPTY_N &&
	     v_to_slaves_1_wready ;
  assign fabric_xactors_to_slaves_1_f_wr_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_1_f_wr_resp
  assign fabric_xactors_to_slaves_1_f_wr_resp$D_IN =
	     { v_to_slaves_1_bid, v_to_slaves_1_bresp } ;
  assign fabric_xactors_to_slaves_1_f_wr_resp$ENQ =
	     v_to_slaves_1_bvalid &&
	     fabric_xactors_to_slaves_1_f_wr_resp$FULL_N ;
  assign fabric_xactors_to_slaves_1_f_wr_resp$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ;
  assign fabric_xactors_to_slaves_1_f_wr_resp$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_2_f_rd_addr
  assign fabric_xactors_to_slaves_2_f_rd_addr$D_IN =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ?
	       fabric_xactors_from_masters_0_f_rd_addr$D_OUT :
	       fabric_xactors_from_masters_1_f_rd_addr$D_OUT ;
  assign fabric_xactors_to_slaves_2_f_rd_addr$ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ;
  assign fabric_xactors_to_slaves_2_f_rd_addr$DEQ =
	     fabric_xactors_to_slaves_2_f_rd_addr$EMPTY_N &&
	     v_to_slaves_2_arready ;
  assign fabric_xactors_to_slaves_2_f_rd_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_2_f_rd_data
  assign fabric_xactors_to_slaves_2_f_rd_data$D_IN =
	     { v_to_slaves_2_rid,
	       v_to_slaves_2_rdata,
	       v_to_slaves_2_rresp,
	       v_to_slaves_2_rlast } ;
  assign fabric_xactors_to_slaves_2_f_rd_data$ENQ =
	     v_to_slaves_2_rvalid &&
	     fabric_xactors_to_slaves_2_f_rd_data$FULL_N ;
  assign fabric_xactors_to_slaves_2_f_rd_data$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ;
  assign fabric_xactors_to_slaves_2_f_rd_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_2_f_wr_addr
  assign fabric_xactors_to_slaves_2_f_wr_addr$D_IN =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ?
	       fabric_xactors_from_masters_0_f_wr_addr$D_OUT :
	       fabric_xactors_from_masters_1_f_wr_addr$D_OUT ;
  assign fabric_xactors_to_slaves_2_f_wr_addr$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;
  assign fabric_xactors_to_slaves_2_f_wr_addr$DEQ =
	     fabric_xactors_to_slaves_2_f_wr_addr$EMPTY_N &&
	     v_to_slaves_2_awready ;
  assign fabric_xactors_to_slaves_2_f_wr_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_2_f_wr_data
  assign fabric_xactors_to_slaves_2_f_wr_data$D_IN =
	     MUX_fabric_xactors_to_slaves_2_f_wr_data$enq_1__SEL_1 ?
	       fabric_xactors_from_masters_0_f_wr_data$D_OUT :
	       fabric_xactors_from_masters_1_f_wr_data$D_OUT ;
  assign fabric_xactors_to_slaves_2_f_wr_data$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_v_f_wd_tasks_0$D_OUT[9:8] == 2'd2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	     fabric_v_f_wd_tasks_1$D_OUT[9:8] == 2'd2 ;
  assign fabric_xactors_to_slaves_2_f_wr_data$DEQ =
	     fabric_xactors_to_slaves_2_f_wr_data$EMPTY_N &&
	     v_to_slaves_2_wready ;
  assign fabric_xactors_to_slaves_2_f_wr_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_2_f_wr_resp
  assign fabric_xactors_to_slaves_2_f_wr_resp$D_IN =
	     { v_to_slaves_2_bid, v_to_slaves_2_bresp } ;
  assign fabric_xactors_to_slaves_2_f_wr_resp$ENQ =
	     v_to_slaves_2_bvalid &&
	     fabric_xactors_to_slaves_2_f_wr_resp$FULL_N ;
  assign fabric_xactors_to_slaves_2_f_wr_resp$DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ;
  assign fabric_xactors_to_slaves_2_f_wr_resp$CLR = fabric_rg_reset ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = 64'h0 ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // remaining internal signals
  assign IF_fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_ETC___d403 =
	     fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 ?
	       x1_avValue_rresp__h18315 :
	       fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] ;
  assign IF_fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_ETC___d438 =
	     fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 ?
	       x1_avValue_rresp__h18941 :
	       fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] ;
  assign IF_fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_ETC___d473 =
	     fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 ?
	       x1_avValue_rresp__h19557 :
	       fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] ;
  assign _dor1fabric_v_f_rd_mis_0$EN_deq =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master ;
  assign _dor1fabric_v_f_rd_mis_1$EN_deq =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ;
  assign _dor1fabric_v_f_rd_mis_2$EN_deq =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ;
  assign fabric_v_f_wd_tasks_0_i_notEmpty__21_AND_fabri_ETC___d130 =
	     fabric_v_f_wd_tasks_0$EMPTY_N &&
	     CASE_fabric_v_f_wd_tasks_0D_OUT_BITS_9_TO_8_0_ETC__q1 ;
  assign fabric_v_f_wd_tasks_1_i_notEmpty__53_AND_fabri_ETC___d159 =
	     fabric_v_f_wd_tasks_1$EMPTY_N &&
	     CASE_fabric_v_f_wd_tasks_1D_OUT_BITS_9_TO_8_0_ETC__q2 ;
  assign fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 =
	     fabric_v_rg_r_beat_count_0 == fabric_v_f_rd_mis_0$D_OUT[7:0] ;
  assign fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 =
	     fabric_v_rg_r_beat_count_1 == fabric_v_f_rd_mis_1$D_OUT[7:0] ;
  assign fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 =
	     fabric_v_rg_r_beat_count_2 == fabric_v_f_rd_mis_2$D_OUT[7:0] ;
  assign fabric_v_rg_r_err_beat_count_0_20_EQ_fabric_v__ETC___d522 =
	     fabric_v_rg_r_err_beat_count_0 ==
	     fabric_v_f_rd_err_info_0$D_OUT[11:4] ;
  assign fabric_v_rg_r_err_beat_count_1_38_EQ_fabric_v__ETC___d540 =
	     fabric_v_rg_r_err_beat_count_1 ==
	     fabric_v_f_rd_err_info_1$D_OUT[11:4] ;
  assign fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 =
	     fabric_v_rg_wd_beat_count_0 == fabric_v_f_wd_tasks_0$D_OUT[7:0] ;
  assign fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 =
	     fabric_v_rg_wd_beat_count_1 == fabric_v_f_wd_tasks_1$D_OUT[7:0] ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d286 =
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29] <
	     soc_map$m_near_mem_io_addr_lim ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d291 =
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29] <
	     soc_map$m_plic_addr_lim ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d22 =
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29] <
	     soc_map$m_near_mem_io_addr_lim ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d29 =
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29] <
	     soc_map$m_plic_addr_lim ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d336 =
	     fabric_xactors_from_masters_1_f_rd_addr$D_OUT[92:29] <
	     soc_map$m_near_mem_io_addr_lim ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d341 =
	     fabric_xactors_from_masters_1_f_rd_addr$D_OUT[92:29] <
	     soc_map$m_plic_addr_lim ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d83 =
	     fabric_xactors_from_masters_1_f_wr_addr$D_OUT[92:29] <
	     soc_map$m_near_mem_io_addr_lim ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d88 =
	     fabric_xactors_from_masters_1_f_wr_addr$D_OUT[92:29] <
	     soc_map$m_plic_addr_lim ;
  assign soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d19 =
	     soc_map$m_near_mem_io_addr_base <=
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29] ;
  assign soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d284 =
	     soc_map$m_near_mem_io_addr_base <=
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29] ;
  assign soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d334 =
	     soc_map$m_near_mem_io_addr_base <=
	     fabric_xactors_from_masters_1_f_rd_addr$D_OUT[92:29] ;
  assign soc_map_m_near_mem_io_addr_base__6_ULE_fabric__ETC___d81 =
	     soc_map$m_near_mem_io_addr_base <=
	     fabric_xactors_from_masters_1_f_wr_addr$D_OUT[92:29] ;
  assign soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d26 =
	     soc_map$m_plic_addr_base <=
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29] ;
  assign soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d289 =
	     soc_map$m_plic_addr_base <=
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29] ;
  assign soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d339 =
	     soc_map$m_plic_addr_base <=
	     fabric_xactors_from_masters_1_f_rd_addr$D_OUT[92:29] ;
  assign soc_map_m_plic_addr_base__5_ULE_fabric_xactors_ETC___d86 =
	     soc_map$m_plic_addr_base <=
	     fabric_xactors_from_masters_1_f_wr_addr$D_OUT[92:29] ;
  assign x1_avValue_rresp__h18315 =
	     (fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	      !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0]) ?
	       2'b10 :
	       fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] ;
  assign x1_avValue_rresp__h18941 =
	     (fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	      !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0]) ?
	       2'b10 :
	       fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] ;
  assign x1_avValue_rresp__h19557 =
	     (fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	      !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0]) ?
	       2'b10 :
	       fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] ;
  assign x__h11955 = fabric_v_rg_wd_beat_count_0 + 8'd1 ;
  assign x__h12581 = fabric_v_rg_wd_beat_count_1 + 8'd1 ;
  assign x__h18337 = fabric_v_rg_r_beat_count_0 + 8'd1 ;
  assign x__h18963 = fabric_v_rg_r_beat_count_1 + 8'd1 ;
  assign x__h19579 = fabric_v_rg_r_beat_count_2 + 8'd1 ;
  assign x__h21883 = fabric_v_rg_r_err_beat_count_0 + 8'd1 ;
  assign x__h22284 = fabric_v_rg_r_err_beat_count_1 + 8'd1 ;
  always@(fabric_v_f_wd_tasks_0$D_OUT or
	  fabric_xactors_to_slaves_0_f_wr_data$FULL_N or
	  fabric_xactors_to_slaves_1_f_wr_data$FULL_N or
	  fabric_xactors_to_slaves_2_f_wr_data$FULL_N)
  begin
    case (fabric_v_f_wd_tasks_0$D_OUT[9:8])
      2'd0:
	  CASE_fabric_v_f_wd_tasks_0D_OUT_BITS_9_TO_8_0_ETC__q1 =
	      fabric_xactors_to_slaves_0_f_wr_data$FULL_N;
      2'd1:
	  CASE_fabric_v_f_wd_tasks_0D_OUT_BITS_9_TO_8_0_ETC__q1 =
	      fabric_xactors_to_slaves_1_f_wr_data$FULL_N;
      2'd2:
	  CASE_fabric_v_f_wd_tasks_0D_OUT_BITS_9_TO_8_0_ETC__q1 =
	      fabric_xactors_to_slaves_2_f_wr_data$FULL_N;
      2'd3: CASE_fabric_v_f_wd_tasks_0D_OUT_BITS_9_TO_8_0_ETC__q1 = 1'd1;
    endcase
  end
  always@(fabric_v_f_wd_tasks_1$D_OUT or
	  fabric_xactors_to_slaves_0_f_wr_data$FULL_N or
	  fabric_xactors_to_slaves_1_f_wr_data$FULL_N or
	  fabric_xactors_to_slaves_2_f_wr_data$FULL_N)
  begin
    case (fabric_v_f_wd_tasks_1$D_OUT[9:8])
      2'd0:
	  CASE_fabric_v_f_wd_tasks_1D_OUT_BITS_9_TO_8_0_ETC__q2 =
	      fabric_xactors_to_slaves_0_f_wr_data$FULL_N;
      2'd1:
	  CASE_fabric_v_f_wd_tasks_1D_OUT_BITS_9_TO_8_0_ETC__q2 =
	      fabric_xactors_to_slaves_1_f_wr_data$FULL_N;
      2'd2:
	  CASE_fabric_v_f_wd_tasks_1D_OUT_BITS_9_TO_8_0_ETC__q2 =
	      fabric_xactors_to_slaves_2_f_wr_data$FULL_N;
      2'd3: CASE_fabric_v_f_wd_tasks_1D_OUT_BITS_9_TO_8_0_ETC__q2 = 1'd1;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        fabric_cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	fabric_rg_reset <= `BSV_ASSIGNMENT_DELAY 1'd1;
	fabric_v_rg_r_beat_count_0 <= `BSV_ASSIGNMENT_DELAY 8'd0;
	fabric_v_rg_r_beat_count_1 <= `BSV_ASSIGNMENT_DELAY 8'd0;
	fabric_v_rg_r_beat_count_2 <= `BSV_ASSIGNMENT_DELAY 8'd0;
	fabric_v_rg_r_err_beat_count_0 <= `BSV_ASSIGNMENT_DELAY 8'd0;
	fabric_v_rg_r_err_beat_count_1 <= `BSV_ASSIGNMENT_DELAY 8'd0;
	fabric_v_rg_wd_beat_count_0 <= `BSV_ASSIGNMENT_DELAY 8'd0;
	fabric_v_rg_wd_beat_count_1 <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (fabric_cfg_verbosity$EN)
	  fabric_cfg_verbosity <= `BSV_ASSIGNMENT_DELAY
	      fabric_cfg_verbosity$D_IN;
	if (fabric_rg_reset$EN)
	  fabric_rg_reset <= `BSV_ASSIGNMENT_DELAY fabric_rg_reset$D_IN;
	if (fabric_v_rg_r_beat_count_0$EN)
	  fabric_v_rg_r_beat_count_0 <= `BSV_ASSIGNMENT_DELAY
	      fabric_v_rg_r_beat_count_0$D_IN;
	if (fabric_v_rg_r_beat_count_1$EN)
	  fabric_v_rg_r_beat_count_1 <= `BSV_ASSIGNMENT_DELAY
	      fabric_v_rg_r_beat_count_1$D_IN;
	if (fabric_v_rg_r_beat_count_2$EN)
	  fabric_v_rg_r_beat_count_2 <= `BSV_ASSIGNMENT_DELAY
	      fabric_v_rg_r_beat_count_2$D_IN;
	if (fabric_v_rg_r_err_beat_count_0$EN)
	  fabric_v_rg_r_err_beat_count_0 <= `BSV_ASSIGNMENT_DELAY
	      fabric_v_rg_r_err_beat_count_0$D_IN;
	if (fabric_v_rg_r_err_beat_count_1$EN)
	  fabric_v_rg_r_err_beat_count_1 <= `BSV_ASSIGNMENT_DELAY
	      fabric_v_rg_r_err_beat_count_1$D_IN;
	if (fabric_v_rg_wd_beat_count_0$EN)
	  fabric_v_rg_wd_beat_count_0 <= `BSV_ASSIGNMENT_DELAY
	      fabric_v_rg_wd_beat_count_0$D_IN;
	if (fabric_v_rg_wd_beat_count_1$EN)
	  fabric_v_rg_wd_beat_count_1 <= `BSV_ASSIGNMENT_DELAY
	      fabric_v_rg_wd_beat_count_1$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    fabric_cfg_verbosity = 4'hA;
    fabric_rg_reset = 1'h0;
    fabric_v_rg_r_beat_count_0 = 8'hAA;
    fabric_v_rg_r_beat_count_1 = 8'hAA;
    fabric_v_rg_r_beat_count_2 = 8'hAA;
    fabric_v_rg_r_err_beat_count_0 = 8'hAA;
    fabric_v_rg_r_err_beat_count_1 = 8'hAA;
    fabric_v_rg_wd_beat_count_0 = 8'hAA;
    fabric_v_rg_wd_beat_count_1 = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h8795 = $stime;
	  #0;
	end
    v__h8789 = v__h8795 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave: m%0d -> s%0d",
		 v__h8789,
		 $signed(32'd0),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h9170 = $stime;
	  #0;
	end
    v__h9164 = v__h9170 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave: m%0d -> s%0d",
		 v__h9164,
		 $signed(32'd0),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h9545 = $stime;
	  #0;
	end
    v__h9539 = v__h9545 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave: m%0d -> s%0d",
		 v__h9539,
		 $signed(32'd0),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h9990 = $stime;
	  #0;
	end
    v__h9984 = v__h9990 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave: m%0d -> s%0d",
		 v__h9984,
		 $signed(32'd1),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h10359 = $stime;
	  #0;
	end
    v__h10353 = v__h10359 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave: m%0d -> s%0d",
		 v__h10353,
		 $signed(32'd1),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h10728 = $stime;
	  #0;
	end
    v__h10722 = v__h10728 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave: m%0d -> s%0d",
		 v__h10722,
		 $signed(32'd1),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h11804 = $stime;
	  #0;
	end
    v__h11798 = v__h11804 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave_data: m%0d -> s%0d, beat %0d/%0d",
		 v__h11798,
		 $signed(32'd0),
		 fabric_v_f_wd_tasks_0$D_OUT[9:8],
		 fabric_v_rg_wd_beat_count_0,
		 fabric_v_f_wd_tasks_0$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0 &&
	  fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	begin
	  v__h12050 = $stime;
	  #0;
	end
    v__h12044 = v__h12050 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$display("%0d: %m.rl_wr_xaction_master_to_slave_data: ERROR: m%0d -> s%0d",
		 v__h12044,
		 $signed(32'd0),
		 fabric_v_f_wd_tasks_0$D_OUT[9:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$display("    WLAST not set on final data beat (awlen = %0d)",
		 fabric_v_f_wd_tasks_0$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_38_EQ_fabric_v_f_w_ETC___d146 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h12430 = $stime;
	  #0;
	end
    v__h12424 = v__h12430 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave_data: m%0d -> s%0d, beat %0d/%0d",
		 v__h12424,
		 $signed(32'd1),
		 fabric_v_f_wd_tasks_1$D_OUT[9:8],
		 fabric_v_rg_wd_beat_count_1,
		 fabric_v_f_wd_tasks_1$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	begin
	  v__h12676 = $stime;
	  #0;
	end
    v__h12670 = v__h12676 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$display("%0d: %m.rl_wr_xaction_master_to_slave_data: ERROR: m%0d -> s%0d",
		 v__h12670,
		 $signed(32'd1),
		 fabric_v_f_wd_tasks_1$D_OUT[9:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$display("    WLAST not set on final data beat (awlen = %0d)",
		 fabric_v_f_wd_tasks_1$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  fabric_v_rg_wd_beat_count_1_67_EQ_fabric_v_f_w_ETC___d175 &&
	  !fabric_xactors_from_masters_1_f_wr_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h13053 = $stime;
	  #0;
	end
    v__h13047 = v__h13053 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_slave_to_master: m%0d <- s%0d",
		 v__h13047,
		 $signed(32'd0),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_0_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_0_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h13345 = $stime;
	  #0;
	end
    v__h13339 = v__h13345 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_slave_to_master: m%0d <- s%0d",
		 v__h13339,
		 $signed(32'd0),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_1_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_1_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h13637 = $stime;
	  #0;
	end
    v__h13631 = v__h13637 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_slave_to_master: m%0d <- s%0d",
		 v__h13631,
		 $signed(32'd0),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_2_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_2_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h13940 = $stime;
	  #0;
	end
    v__h13934 = v__h13940 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_slave_to_master: m%0d <- s%0d",
		 v__h13934,
		 $signed(32'd1),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_0_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_0_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h14206 = $stime;
	  #0;
	end
    v__h14200 = v__h14206 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_slave_to_master: m%0d <- s%0d",
		 v__h14200,
		 $signed(32'd1),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_1_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_1_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h14472 = $stime;
	  #0;
	end
    v__h14466 = v__h14472 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_slave_to_master: m%0d <- s%0d",
		 v__h14466,
		 $signed(32'd1),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_2_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_2_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h14736 = $stime;
	  #0;
	end
    v__h14730 = v__h14736 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_err_to_master: m%0d <- err",
		 v__h14730,
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_v_f_wr_err_info_0$D_OUT);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 2'b11);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h14962 = $stime;
	  #0;
	end
    v__h14956 = v__h14962 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_err_to_master: m%0d <- err",
		 v__h14956,
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_v_f_wr_err_info_1$D_OUT);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 2'b11);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h15391 = $stime;
	  #0;
	end
    v__h15385 = v__h15391 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_xaction_master_to_slave: m%0d -> s%0d",
		 v__h15385,
		 $signed(32'd0),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h15747 = $stime;
	  #0;
	end
    v__h15741 = v__h15747 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_xaction_master_to_slave: m%0d -> s%0d",
		 v__h15741,
		 $signed(32'd0),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h16103 = $stime;
	  #0;
	end
    v__h16097 = v__h16103 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_xaction_master_to_slave: m%0d -> s%0d",
		 v__h16097,
		 $signed(32'd0),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h16520 = $stime;
	  #0;
	end
    v__h16514 = v__h16520 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_xaction_master_to_slave: m%0d -> s%0d",
		 v__h16514,
		 $signed(32'd1),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h16852 = $stime;
	  #0;
	end
    v__h16846 = v__h16852 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_xaction_master_to_slave: m%0d -> s%0d",
		 v__h16846,
		 $signed(32'd1),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h17184 = $stime;
	  #0;
	end
    v__h17178 = v__h17184 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_xaction_master_to_slave: m%0d -> s%0d",
		 v__h17178,
		 $signed(32'd1),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	begin
	  v__h18200 = $stime;
	  #0;
	end
    v__h18194 = v__h18200 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$display("%0d: %m.rl_rd_resp_slave_to_master: ERROR: m%0d <- s%0d",
		 v__h18194,
		 $signed(32'd0),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$display("    RLAST not set on final data beat (arlen = %0d)",
		 fabric_v_f_rd_mis_0$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h18451 = $stime;
	  #0;
	end
    v__h18445 = v__h18451 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_slave_to_master: m%0d <- s%0d",
		 v__h18445,
		 $signed(32'd0),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    r: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h",
	       IF_fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_ETC___d403);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	begin
	  v__h18826 = $stime;
	  #0;
	end
    v__h18820 = v__h18826 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$display("%0d: %m.rl_rd_resp_slave_to_master: ERROR: m%0d <- s%0d",
		 v__h18820,
		 $signed(32'd0),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$display("    RLAST not set on final data beat (arlen = %0d)",
		 fabric_v_f_rd_mis_1$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h19067 = $stime;
	  #0;
	end
    v__h19061 = v__h19067 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_slave_to_master: m%0d <- s%0d",
		 v__h19061,
		 $signed(32'd0),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    r: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h",
	       IF_fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_ETC___d438);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	begin
	  v__h19442 = $stime;
	  #0;
	end
    v__h19436 = v__h19442 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$display("%0d: %m.rl_rd_resp_slave_to_master: ERROR: m%0d <- s%0d",
		 v__h19436,
		 $signed(32'd0),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$display("    RLAST not set on final data beat (arlen = %0d)",
		 fabric_v_f_rd_mis_2$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h19683 = $stime;
	  #0;
	end
    v__h19677 = v__h19683 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_slave_to_master: m%0d <- s%0d",
		 v__h19677,
		 $signed(32'd0),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    r: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h",
	       IF_fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_ETC___d473);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	begin
	  v__h20045 = $stime;
	  #0;
	end
    v__h20039 = v__h20045 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$display("%0d: %m.rl_rd_resp_slave_to_master: ERROR: m%0d <- s%0d",
		 v__h20039,
		 $signed(32'd1),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$display("    RLAST not set on final data beat (arlen = %0d)",
		 fabric_v_f_rd_mis_0$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_rd_ETC___d387 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h20296 = $stime;
	  #0;
	end
    v__h20290 = v__h20296 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_slave_to_master: m%0d <- s%0d",
		 v__h20290,
		 $signed(32'd1),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    r: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h",
	       IF_fabric_v_rg_r_beat_count_0_85_EQ_fabric_v_f_ETC___d403);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	begin
	  v__h20626 = $stime;
	  #0;
	end
    v__h20620 = v__h20626 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$display("%0d: %m.rl_rd_resp_slave_to_master: ERROR: m%0d <- s%0d",
		 v__h20620,
		 $signed(32'd1),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$display("    RLAST not set on final data beat (arlen = %0d)",
		 fabric_v_f_rd_mis_1$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_rd_ETC___d422 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h20867 = $stime;
	  #0;
	end
    v__h20861 = v__h20867 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_slave_to_master: m%0d <- s%0d",
		 v__h20861,
		 $signed(32'd1),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    r: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h",
	       IF_fabric_v_rg_r_beat_count_1_20_EQ_fabric_v_f_ETC___d438);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	begin
	  v__h21197 = $stime;
	  #0;
	end
    v__h21191 = v__h21197 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$display("%0d: %m.rl_rd_resp_slave_to_master: ERROR: m%0d <- s%0d",
		 v__h21191,
		 $signed(32'd1),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$display("    RLAST not set on final data beat (arlen = %0d)",
		 fabric_v_f_rd_mis_2$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_rd_ETC___d457 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h21438 = $stime;
	  #0;
	end
    v__h21432 = v__h21438 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_slave_to_master: m%0d <- s%0d",
		 v__h21432,
		 $signed(32'd1),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    r: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h",
	       IF_fabric_v_rg_r_beat_count_2_55_EQ_fabric_v_f_ETC___d473);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h21951 = $stime;
	  #0;
	end
    v__h21945 = v__h21951 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_err_to_master: m%0d <- err",
		 v__h21945,
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    r: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_v_f_rd_err_info_0$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 2'b11);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0 &&
	  fabric_v_rg_r_err_beat_count_0_20_EQ_fabric_v__ETC___d522)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_v_rg_r_err_beat_count_0_20_EQ_fabric_v__ETC___d522)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h22352 = $stime;
	  #0;
	end
    v__h22346 = v__h22352 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_err_to_master: m%0d <- err",
		 v__h22346,
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("    r: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", fabric_v_f_rd_err_info_1$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 2'b11);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  fabric_v_rg_r_err_beat_count_1_38_EQ_fabric_v__ETC___d540)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_v_rg_r_err_beat_count_1_38_EQ_fabric_v__ETC___d540)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (fabric_rg_reset && fabric_cfg_verbosity != 4'd0)
	begin
	  v__h5824 = $stime;
	  #0;
	end
    v__h5818 = v__h5824 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (fabric_rg_reset && fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_reset", v__h5818);
  end
  // synopsys translate_on
endmodule