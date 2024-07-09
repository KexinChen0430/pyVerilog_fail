module outputs
  wire [63 : 0] v_from_masters_0_rdata,
		v_to_slaves_0_araddr,
		v_to_slaves_0_awaddr,
		v_to_slaves_0_wdata,
		v_to_slaves_1_araddr,
		v_to_slaves_1_awaddr,
		v_to_slaves_1_wdata,
		v_to_slaves_2_araddr,
		v_to_slaves_2_awaddr,
		v_to_slaves_2_wdata;
  wire [15 : 0] v_from_masters_0_bid,
		v_from_masters_0_rid,
		v_to_slaves_0_arid,
		v_to_slaves_0_awid,
		v_to_slaves_1_arid,
		v_to_slaves_1_awid,
		v_to_slaves_2_arid,
		v_to_slaves_2_awid;
  wire [7 : 0] v_to_slaves_0_arlen,
	       v_to_slaves_0_awlen,
	       v_to_slaves_0_wstrb,
	       v_to_slaves_1_arlen,
	       v_to_slaves_1_awlen,
	       v_to_slaves_1_wstrb,
	       v_to_slaves_2_arlen,
	       v_to_slaves_2_awlen,
	       v_to_slaves_2_wstrb;
  wire [3 : 0] v_to_slaves_0_arcache,
	       v_to_slaves_0_arqos,
	       v_to_slaves_0_arregion,
	       v_to_slaves_0_awcache,
	       v_to_slaves_0_awqos,
	       v_to_slaves_0_awregion,
	       v_to_slaves_1_arcache,
	       v_to_slaves_1_arqos,
	       v_to_slaves_1_arregion,
	       v_to_slaves_1_awcache,
	       v_to_slaves_1_awqos,
	       v_to_slaves_1_awregion,
	       v_to_slaves_2_arcache,
	       v_to_slaves_2_arqos,
	       v_to_slaves_2_arregion,
	       v_to_slaves_2_awcache,
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
  wire [7 : 0] fabric_v_rg_r_beat_count_0$D_IN;
  wire fabric_v_rg_r_beat_count_0$EN;
  // register fabric_v_rg_r_beat_count_1
  reg [7 : 0] fabric_v_rg_r_beat_count_1;
  wire [7 : 0] fabric_v_rg_r_beat_count_1$D_IN;
  wire fabric_v_rg_r_beat_count_1$EN;
  // register fabric_v_rg_r_beat_count_2
  reg [7 : 0] fabric_v_rg_r_beat_count_2;
  wire [7 : 0] fabric_v_rg_r_beat_count_2$D_IN;
  wire fabric_v_rg_r_beat_count_2$EN;
  // register fabric_v_rg_r_err_beat_count_0
  reg [7 : 0] fabric_v_rg_r_err_beat_count_0;
  wire [7 : 0] fabric_v_rg_r_err_beat_count_0$D_IN;
  wire fabric_v_rg_r_err_beat_count_0$EN;
  // register fabric_v_rg_wd_beat_count_0
  reg [7 : 0] fabric_v_rg_wd_beat_count_0;
  wire [7 : 0] fabric_v_rg_wd_beat_count_0$D_IN;
  wire fabric_v_rg_wd_beat_count_0$EN;
  // ports of submodule fabric_v_f_rd_err_info_0
  wire [23 : 0] fabric_v_f_rd_err_info_0$D_IN, fabric_v_f_rd_err_info_0$D_OUT;
  wire fabric_v_f_rd_err_info_0$CLR,
       fabric_v_f_rd_err_info_0$DEQ,
       fabric_v_f_rd_err_info_0$EMPTY_N,
       fabric_v_f_rd_err_info_0$ENQ;
  // ports of submodule fabric_v_f_rd_mis_0
  wire [8 : 0] fabric_v_f_rd_mis_0$D_IN, fabric_v_f_rd_mis_0$D_OUT;
  wire fabric_v_f_rd_mis_0$CLR,
       fabric_v_f_rd_mis_0$DEQ,
       fabric_v_f_rd_mis_0$EMPTY_N,
       fabric_v_f_rd_mis_0$ENQ,
       fabric_v_f_rd_mis_0$FULL_N;
  // ports of submodule fabric_v_f_rd_mis_1
  wire [8 : 0] fabric_v_f_rd_mis_1$D_IN, fabric_v_f_rd_mis_1$D_OUT;
  wire fabric_v_f_rd_mis_1$CLR,
       fabric_v_f_rd_mis_1$DEQ,
       fabric_v_f_rd_mis_1$EMPTY_N,
       fabric_v_f_rd_mis_1$ENQ,
       fabric_v_f_rd_mis_1$FULL_N;
  // ports of submodule fabric_v_f_rd_mis_2
  wire [8 : 0] fabric_v_f_rd_mis_2$D_IN, fabric_v_f_rd_mis_2$D_OUT;
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
  // ports of submodule fabric_v_f_wd_tasks_0
  reg [9 : 0] fabric_v_f_wd_tasks_0$D_IN;
  wire [9 : 0] fabric_v_f_wd_tasks_0$D_OUT;
  wire fabric_v_f_wd_tasks_0$CLR,
       fabric_v_f_wd_tasks_0$DEQ,
       fabric_v_f_wd_tasks_0$EMPTY_N,
       fabric_v_f_wd_tasks_0$ENQ,
       fabric_v_f_wd_tasks_0$FULL_N;
  // ports of submodule fabric_v_f_wr_err_info_0
  wire [15 : 0] fabric_v_f_wr_err_info_0$D_IN, fabric_v_f_wr_err_info_0$D_OUT;
  wire fabric_v_f_wr_err_info_0$CLR,
       fabric_v_f_wr_err_info_0$DEQ,
       fabric_v_f_wr_err_info_0$EMPTY_N,
       fabric_v_f_wr_err_info_0$ENQ;
  // ports of submodule fabric_v_f_wr_mis_0
  wire fabric_v_f_wr_mis_0$CLR,
       fabric_v_f_wr_mis_0$DEQ,
       fabric_v_f_wr_mis_0$D_IN,
       fabric_v_f_wr_mis_0$D_OUT,
       fabric_v_f_wr_mis_0$EMPTY_N,
       fabric_v_f_wr_mis_0$ENQ,
       fabric_v_f_wr_mis_0$FULL_N;
  // ports of submodule fabric_v_f_wr_mis_1
  wire fabric_v_f_wr_mis_1$CLR,
       fabric_v_f_wr_mis_1$DEQ,
       fabric_v_f_wr_mis_1$D_IN,
       fabric_v_f_wr_mis_1$D_OUT,
       fabric_v_f_wr_mis_1$EMPTY_N,
       fabric_v_f_wr_mis_1$ENQ,
       fabric_v_f_wr_mis_1$FULL_N;
  // ports of submodule fabric_v_f_wr_mis_2
  wire fabric_v_f_wr_mis_2$CLR,
       fabric_v_f_wr_mis_2$DEQ,
       fabric_v_f_wr_mis_2$D_IN,
       fabric_v_f_wr_mis_2$D_OUT,
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
  // ports of submodule fabric_xactors_from_masters_0_f_rd_addr
  wire [108 : 0] fabric_xactors_from_masters_0_f_rd_addr$D_IN,
		 fabric_xactors_from_masters_0_f_rd_addr$D_OUT;
  wire fabric_xactors_from_masters_0_f_rd_addr$CLR,
       fabric_xactors_from_masters_0_f_rd_addr$DEQ,
       fabric_xactors_from_masters_0_f_rd_addr$EMPTY_N,
       fabric_xactors_from_masters_0_f_rd_addr$ENQ,
       fabric_xactors_from_masters_0_f_rd_addr$FULL_N;
  // ports of submodule fabric_xactors_from_masters_0_f_rd_data
  reg [82 : 0] fabric_xactors_from_masters_0_f_rd_data$D_IN;
  wire [82 : 0] fabric_xactors_from_masters_0_f_rd_data$D_OUT;
  wire fabric_xactors_from_masters_0_f_rd_data$CLR,
       fabric_xactors_from_masters_0_f_rd_data$DEQ,
       fabric_xactors_from_masters_0_f_rd_data$EMPTY_N,
       fabric_xactors_from_masters_0_f_rd_data$ENQ,
       fabric_xactors_from_masters_0_f_rd_data$FULL_N;
  // ports of submodule fabric_xactors_from_masters_0_f_wr_addr
  wire [108 : 0] fabric_xactors_from_masters_0_f_wr_addr$D_IN,
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
  reg [17 : 0] fabric_xactors_from_masters_0_f_wr_resp$D_IN;
  wire [17 : 0] fabric_xactors_from_masters_0_f_wr_resp$D_OUT;
  wire fabric_xactors_from_masters_0_f_wr_resp$CLR,
       fabric_xactors_from_masters_0_f_wr_resp$DEQ,
       fabric_xactors_from_masters_0_f_wr_resp$EMPTY_N,
       fabric_xactors_from_masters_0_f_wr_resp$ENQ,
       fabric_xactors_from_masters_0_f_wr_resp$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_0_f_rd_addr
  wire [108 : 0] fabric_xactors_to_slaves_0_f_rd_addr$D_IN,
		 fabric_xactors_to_slaves_0_f_rd_addr$D_OUT;
  wire fabric_xactors_to_slaves_0_f_rd_addr$CLR,
       fabric_xactors_to_slaves_0_f_rd_addr$DEQ,
       fabric_xactors_to_slaves_0_f_rd_addr$EMPTY_N,
       fabric_xactors_to_slaves_0_f_rd_addr$ENQ,
       fabric_xactors_to_slaves_0_f_rd_addr$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_0_f_rd_data
  wire [82 : 0] fabric_xactors_to_slaves_0_f_rd_data$D_IN,
		fabric_xactors_to_slaves_0_f_rd_data$D_OUT;
  wire fabric_xactors_to_slaves_0_f_rd_data$CLR,
       fabric_xactors_to_slaves_0_f_rd_data$DEQ,
       fabric_xactors_to_slaves_0_f_rd_data$EMPTY_N,
       fabric_xactors_to_slaves_0_f_rd_data$ENQ,
       fabric_xactors_to_slaves_0_f_rd_data$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_0_f_wr_addr
  wire [108 : 0] fabric_xactors_to_slaves_0_f_wr_addr$D_IN,
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
  wire [17 : 0] fabric_xactors_to_slaves_0_f_wr_resp$D_IN,
		fabric_xactors_to_slaves_0_f_wr_resp$D_OUT;
  wire fabric_xactors_to_slaves_0_f_wr_resp$CLR,
       fabric_xactors_to_slaves_0_f_wr_resp$DEQ,
       fabric_xactors_to_slaves_0_f_wr_resp$EMPTY_N,
       fabric_xactors_to_slaves_0_f_wr_resp$ENQ,
       fabric_xactors_to_slaves_0_f_wr_resp$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_1_f_rd_addr
  wire [108 : 0] fabric_xactors_to_slaves_1_f_rd_addr$D_IN,
		 fabric_xactors_to_slaves_1_f_rd_addr$D_OUT;
  wire fabric_xactors_to_slaves_1_f_rd_addr$CLR,
       fabric_xactors_to_slaves_1_f_rd_addr$DEQ,
       fabric_xactors_to_slaves_1_f_rd_addr$EMPTY_N,
       fabric_xactors_to_slaves_1_f_rd_addr$ENQ,
       fabric_xactors_to_slaves_1_f_rd_addr$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_1_f_rd_data
  wire [82 : 0] fabric_xactors_to_slaves_1_f_rd_data$D_IN,
		fabric_xactors_to_slaves_1_f_rd_data$D_OUT;
  wire fabric_xactors_to_slaves_1_f_rd_data$CLR,
       fabric_xactors_to_slaves_1_f_rd_data$DEQ,
       fabric_xactors_to_slaves_1_f_rd_data$EMPTY_N,
       fabric_xactors_to_slaves_1_f_rd_data$ENQ,
       fabric_xactors_to_slaves_1_f_rd_data$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_1_f_wr_addr
  wire [108 : 0] fabric_xactors_to_slaves_1_f_wr_addr$D_IN,
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
  wire [17 : 0] fabric_xactors_to_slaves_1_f_wr_resp$D_IN,
		fabric_xactors_to_slaves_1_f_wr_resp$D_OUT;
  wire fabric_xactors_to_slaves_1_f_wr_resp$CLR,
       fabric_xactors_to_slaves_1_f_wr_resp$DEQ,
       fabric_xactors_to_slaves_1_f_wr_resp$EMPTY_N,
       fabric_xactors_to_slaves_1_f_wr_resp$ENQ,
       fabric_xactors_to_slaves_1_f_wr_resp$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_2_f_rd_addr
  wire [108 : 0] fabric_xactors_to_slaves_2_f_rd_addr$D_IN,
		 fabric_xactors_to_slaves_2_f_rd_addr$D_OUT;
  wire fabric_xactors_to_slaves_2_f_rd_addr$CLR,
       fabric_xactors_to_slaves_2_f_rd_addr$DEQ,
       fabric_xactors_to_slaves_2_f_rd_addr$EMPTY_N,
       fabric_xactors_to_slaves_2_f_rd_addr$ENQ,
       fabric_xactors_to_slaves_2_f_rd_addr$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_2_f_rd_data
  wire [82 : 0] fabric_xactors_to_slaves_2_f_rd_data$D_IN,
		fabric_xactors_to_slaves_2_f_rd_data$D_OUT;
  wire fabric_xactors_to_slaves_2_f_rd_data$CLR,
       fabric_xactors_to_slaves_2_f_rd_data$DEQ,
       fabric_xactors_to_slaves_2_f_rd_data$EMPTY_N,
       fabric_xactors_to_slaves_2_f_rd_data$ENQ,
       fabric_xactors_to_slaves_2_f_rd_data$FULL_N;
  // ports of submodule fabric_xactors_to_slaves_2_f_wr_addr
  wire [108 : 0] fabric_xactors_to_slaves_2_f_wr_addr$D_IN,
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
  wire [17 : 0] fabric_xactors_to_slaves_2_f_wr_resp$D_IN,
		fabric_xactors_to_slaves_2_f_wr_resp$D_OUT;
  wire fabric_xactors_to_slaves_2_f_wr_resp$CLR,
       fabric_xactors_to_slaves_2_f_wr_resp$DEQ,
       fabric_xactors_to_slaves_2_f_wr_resp$EMPTY_N,
       fabric_xactors_to_slaves_2_f_wr_resp$ENQ,
       fabric_xactors_to_slaves_2_f_wr_resp$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2,
       CAN_FIRE_RL_fabric_rl_reset,
       CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data,
       CAN_FIRE_reset,
       CAN_FIRE_set_verbosity,
       CAN_FIRE_v_from_masters_0_m_arvalid,
       CAN_FIRE_v_from_masters_0_m_awvalid,
       CAN_FIRE_v_from_masters_0_m_bready,
       CAN_FIRE_v_from_masters_0_m_rready,
       CAN_FIRE_v_from_masters_0_m_wvalid,
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
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2,
       WILL_FIRE_RL_fabric_rl_reset,
       WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data,
       WILL_FIRE_reset,
       WILL_FIRE_set_verbosity,
       WILL_FIRE_v_from_masters_0_m_arvalid,
       WILL_FIRE_v_from_masters_0_m_awvalid,
       WILL_FIRE_v_from_masters_0_m_bready,
       WILL_FIRE_v_from_masters_0_m_rready,
       WILL_FIRE_v_from_masters_0_m_wvalid,
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
  wire [82 : 0] MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_1,
		MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_2,
		MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_3,
		MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_4;
  wire [17 : 0] MUX_fabric_xactors_from_masters_0_f_wr_resp$enq_1__VAL_4;
  wire [9 : 0] MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_1,
	       MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_2,
	       MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_3;
  wire [7 : 0] MUX_fabric_v_rg_r_beat_count_0$write_1__VAL_2,
	       MUX_fabric_v_rg_r_beat_count_1$write_1__VAL_2,
	       MUX_fabric_v_rg_r_beat_count_2$write_1__VAL_2,
	       MUX_fabric_v_rg_wd_beat_count_0$write_1__VAL_2;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h6565;
  reg [31 : 0] v__h6916;
  reg [31 : 0] v__h7267;
  reg [31 : 0] v__h7953;
  reg [31 : 0] v__h8200;
  reg [31 : 0] v__h8557;
  reg [31 : 0] v__h8827;
  reg [31 : 0] v__h9097;
  reg [31 : 0] v__h9331;
  reg [31 : 0] v__h9735;
  reg [31 : 0] v__h10073;
  reg [31 : 0] v__h10411;
  reg [31 : 0] v__h11108;
  reg [31 : 0] v__h11389;
  reg [31 : 0] v__h11757;
  reg [31 : 0] v__h12028;
  reg [31 : 0] v__h12396;
  reg [31 : 0] v__h12667;
  reg [31 : 0] v__h13120;
  reg [31 : 0] v__h4397;
  reg [31 : 0] v__h6910;
  reg [31 : 0] v__h4391;
  reg [31 : 0] v__h6559;
  reg [31 : 0] v__h7261;
  reg [31 : 0] v__h7947;
  reg [31 : 0] v__h8194;
  reg [31 : 0] v__h8551;
  reg [31 : 0] v__h8821;
  reg [31 : 0] v__h9091;
  reg [31 : 0] v__h9325;
  reg [31 : 0] v__h9729;
  reg [31 : 0] v__h10067;
  reg [31 : 0] v__h10405;
  reg [31 : 0] v__h11102;
  reg [31 : 0] v__h11383;
  reg [31 : 0] v__h11751;
  reg [31 : 0] v__h12022;
  reg [31 : 0] v__h12390;
  reg [31 : 0] v__h12661;
  reg [31 : 0] v__h13114;
  // synopsys translate_on
  // remaining internal signals
  reg CASE_fabric_v_f_wd_tasks_0D_OUT_BITS_9_TO_8_0_ETC__q1;
  wire [7 : 0] x__h11272, x__h11921, x__h12560, x__h13057, x__h8102;
  wire [1 : 0] IF_fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_ETC___d245,
	       IF_fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_ETC___d284,
	       IF_fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_ETC___d323,
	       x1_avValue_rresp__h11250,
	       x1_avValue_rresp__h11899,
	       x1_avValue_rresp__h12538;
  wire fabric_v_f_wd_tasks_0_i_notEmpty__9_AND_fabric_ETC___d78,
       fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218,
       fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258,
       fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297,
       fabric_v_rg_r_err_beat_count_0_36_EQ_fabric_v__ETC___d338,
       fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d166,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d167,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d170,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d171,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d19,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d22,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d23;
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
	     fabric_xactors_from_masters_0_f_wr_resp$D_OUT[17:2] ;
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
	     fabric_xactors_from_masters_0_f_rd_data$D_OUT[82:67] ;
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
  // value method v_to_slaves_0_m_awvalid
  assign v_to_slaves_0_awvalid =
	     fabric_xactors_to_slaves_0_f_wr_addr$EMPTY_N ;
  // value method v_to_slaves_0_m_awid
  assign v_to_slaves_0_awid =
	     fabric_xactors_to_slaves_0_f_wr_addr$D_OUT[108:93] ;
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
	     fabric_xactors_to_slaves_0_f_rd_addr$D_OUT[108:93] ;
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
	     fabric_xactors_to_slaves_1_f_wr_addr$D_OUT[108:93] ;
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
	     fabric_xactors_to_slaves_1_f_rd_addr$D_OUT[108:93] ;
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
	     fabric_xactors_to_slaves_2_f_wr_addr$D_OUT[108:93] ;
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
	     fabric_xactors_to_slaves_2_f_rd_addr$D_OUT[108:93] ;
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
  SizedFIFO #(.p1width(32'd24),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(1'd1)) fabric_v_f_rd_err_info_0(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(fabric_v_f_rd_err_info_0$D_IN),
						       .ENQ(fabric_v_f_rd_err_info_0$ENQ),
						       .DEQ(fabric_v_f_rd_err_info_0$DEQ),
						       .CLR(fabric_v_f_rd_err_info_0$CLR),
						       .D_OUT(fabric_v_f_rd_err_info_0$D_OUT),
						       .FULL_N(),
						       .EMPTY_N(fabric_v_f_rd_err_info_0$EMPTY_N));
  // submodule fabric_v_f_rd_mis_0
  SizedFIFO #(.p1width(32'd9),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(1'd1)) fabric_v_f_rd_mis_0(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(fabric_v_f_rd_mis_0$D_IN),
						  .ENQ(fabric_v_f_rd_mis_0$ENQ),
						  .DEQ(fabric_v_f_rd_mis_0$DEQ),
						  .CLR(fabric_v_f_rd_mis_0$CLR),
						  .D_OUT(fabric_v_f_rd_mis_0$D_OUT),
						  .FULL_N(fabric_v_f_rd_mis_0$FULL_N),
						  .EMPTY_N(fabric_v_f_rd_mis_0$EMPTY_N));
  // submodule fabric_v_f_rd_mis_1
  SizedFIFO #(.p1width(32'd9),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(1'd1)) fabric_v_f_rd_mis_1(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(fabric_v_f_rd_mis_1$D_IN),
						  .ENQ(fabric_v_f_rd_mis_1$ENQ),
						  .DEQ(fabric_v_f_rd_mis_1$DEQ),
						  .CLR(fabric_v_f_rd_mis_1$CLR),
						  .D_OUT(fabric_v_f_rd_mis_1$D_OUT),
						  .FULL_N(fabric_v_f_rd_mis_1$FULL_N),
						  .EMPTY_N(fabric_v_f_rd_mis_1$EMPTY_N));
  // submodule fabric_v_f_rd_mis_2
  SizedFIFO #(.p1width(32'd9),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(1'd1)) fabric_v_f_rd_mis_2(.RST(RST_N),
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
	      .guarded(1'd1)) fabric_v_f_rd_sjs_0(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(fabric_v_f_rd_sjs_0$D_IN),
						  .ENQ(fabric_v_f_rd_sjs_0$ENQ),
						  .DEQ(fabric_v_f_rd_sjs_0$DEQ),
						  .CLR(fabric_v_f_rd_sjs_0$CLR),
						  .D_OUT(fabric_v_f_rd_sjs_0$D_OUT),
						  .FULL_N(fabric_v_f_rd_sjs_0$FULL_N),
						  .EMPTY_N(fabric_v_f_rd_sjs_0$EMPTY_N));
  // submodule fabric_v_f_wd_tasks_0
  FIFO2 #(.width(32'd10), .guarded(1'd1)) fabric_v_f_wd_tasks_0(.RST(RST_N),
								.CLK(CLK),
								.D_IN(fabric_v_f_wd_tasks_0$D_IN),
								.ENQ(fabric_v_f_wd_tasks_0$ENQ),
								.DEQ(fabric_v_f_wd_tasks_0$DEQ),
								.CLR(fabric_v_f_wd_tasks_0$CLR),
								.D_OUT(fabric_v_f_wd_tasks_0$D_OUT),
								.FULL_N(fabric_v_f_wd_tasks_0$FULL_N),
								.EMPTY_N(fabric_v_f_wd_tasks_0$EMPTY_N));
  // submodule fabric_v_f_wr_err_info_0
  SizedFIFO #(.p1width(32'd16),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(1'd1)) fabric_v_f_wr_err_info_0(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(fabric_v_f_wr_err_info_0$D_IN),
						       .ENQ(fabric_v_f_wr_err_info_0$ENQ),
						       .DEQ(fabric_v_f_wr_err_info_0$DEQ),
						       .CLR(fabric_v_f_wr_err_info_0$CLR),
						       .D_OUT(fabric_v_f_wr_err_info_0$D_OUT),
						       .FULL_N(),
						       .EMPTY_N(fabric_v_f_wr_err_info_0$EMPTY_N));
  // submodule fabric_v_f_wr_mis_0
  SizedFIFO #(.p1width(32'd1),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(1'd1)) fabric_v_f_wr_mis_0(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(fabric_v_f_wr_mis_0$D_IN),
						  .ENQ(fabric_v_f_wr_mis_0$ENQ),
						  .DEQ(fabric_v_f_wr_mis_0$DEQ),
						  .CLR(fabric_v_f_wr_mis_0$CLR),
						  .D_OUT(fabric_v_f_wr_mis_0$D_OUT),
						  .FULL_N(fabric_v_f_wr_mis_0$FULL_N),
						  .EMPTY_N(fabric_v_f_wr_mis_0$EMPTY_N));
  // submodule fabric_v_f_wr_mis_1
  SizedFIFO #(.p1width(32'd1),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(1'd1)) fabric_v_f_wr_mis_1(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(fabric_v_f_wr_mis_1$D_IN),
						  .ENQ(fabric_v_f_wr_mis_1$ENQ),
						  .DEQ(fabric_v_f_wr_mis_1$DEQ),
						  .CLR(fabric_v_f_wr_mis_1$CLR),
						  .D_OUT(fabric_v_f_wr_mis_1$D_OUT),
						  .FULL_N(fabric_v_f_wr_mis_1$FULL_N),
						  .EMPTY_N(fabric_v_f_wr_mis_1$EMPTY_N));
  // submodule fabric_v_f_wr_mis_2
  SizedFIFO #(.p1width(32'd1),
	      .p2depth(32'd8),
	      .p3cntr_width(32'd3),
	      .guarded(1'd1)) fabric_v_f_wr_mis_2(.RST(RST_N),
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
	      .guarded(1'd1)) fabric_v_f_wr_sjs_0(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(fabric_v_f_wr_sjs_0$D_IN),
						  .ENQ(fabric_v_f_wr_sjs_0$ENQ),
						  .DEQ(fabric_v_f_wr_sjs_0$DEQ),
						  .CLR(fabric_v_f_wr_sjs_0$CLR),
						  .D_OUT(fabric_v_f_wr_sjs_0$D_OUT),
						  .FULL_N(fabric_v_f_wr_sjs_0$FULL_N),
						  .EMPTY_N(fabric_v_f_wr_sjs_0$EMPTY_N));
  // submodule fabric_xactors_from_masters_0_f_rd_addr
  FIFO2 #(.width(32'd109),
	  .guarded(1'd1)) fabric_xactors_from_masters_0_f_rd_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_0_f_rd_addr$D_IN),
								  .ENQ(fabric_xactors_from_masters_0_f_rd_addr$ENQ),
								  .DEQ(fabric_xactors_from_masters_0_f_rd_addr$DEQ),
								  .CLR(fabric_xactors_from_masters_0_f_rd_addr$CLR),
								  .D_OUT(fabric_xactors_from_masters_0_f_rd_addr$D_OUT),
								  .FULL_N(fabric_xactors_from_masters_0_f_rd_addr$FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_0_f_rd_addr$EMPTY_N));
  // submodule fabric_xactors_from_masters_0_f_rd_data
  FIFO2 #(.width(32'd83),
	  .guarded(1'd1)) fabric_xactors_from_masters_0_f_rd_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_0_f_rd_data$D_IN),
								  .ENQ(fabric_xactors_from_masters_0_f_rd_data$ENQ),
								  .DEQ(fabric_xactors_from_masters_0_f_rd_data$DEQ),
								  .CLR(fabric_xactors_from_masters_0_f_rd_data$CLR),
								  .D_OUT(fabric_xactors_from_masters_0_f_rd_data$D_OUT),
								  .FULL_N(fabric_xactors_from_masters_0_f_rd_data$FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_0_f_rd_data$EMPTY_N));
  // submodule fabric_xactors_from_masters_0_f_wr_addr
  FIFO2 #(.width(32'd109),
	  .guarded(1'd1)) fabric_xactors_from_masters_0_f_wr_addr(.RST(RST_N),
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
	  .guarded(1'd1)) fabric_xactors_from_masters_0_f_wr_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_0_f_wr_data$D_IN),
								  .ENQ(fabric_xactors_from_masters_0_f_wr_data$ENQ),
								  .DEQ(fabric_xactors_from_masters_0_f_wr_data$DEQ),
								  .CLR(fabric_xactors_from_masters_0_f_wr_data$CLR),
								  .D_OUT(fabric_xactors_from_masters_0_f_wr_data$D_OUT),
								  .FULL_N(fabric_xactors_from_masters_0_f_wr_data$FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_0_f_wr_data$EMPTY_N));
  // submodule fabric_xactors_from_masters_0_f_wr_resp
  FIFO2 #(.width(32'd18),
	  .guarded(1'd1)) fabric_xactors_from_masters_0_f_wr_resp(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_0_f_wr_resp$D_IN),
								  .ENQ(fabric_xactors_from_masters_0_f_wr_resp$ENQ),
								  .DEQ(fabric_xactors_from_masters_0_f_wr_resp$DEQ),
								  .CLR(fabric_xactors_from_masters_0_f_wr_resp$CLR),
								  .D_OUT(fabric_xactors_from_masters_0_f_wr_resp$D_OUT),
								  .FULL_N(fabric_xactors_from_masters_0_f_wr_resp$FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_0_f_wr_resp$EMPTY_N));
  // submodule fabric_xactors_to_slaves_0_f_rd_addr
  FIFO2 #(.width(32'd109),
	  .guarded(1'd1)) fabric_xactors_to_slaves_0_f_rd_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_0_f_rd_addr$D_IN),
							       .ENQ(fabric_xactors_to_slaves_0_f_rd_addr$ENQ),
							       .DEQ(fabric_xactors_to_slaves_0_f_rd_addr$DEQ),
							       .CLR(fabric_xactors_to_slaves_0_f_rd_addr$CLR),
							       .D_OUT(fabric_xactors_to_slaves_0_f_rd_addr$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_0_f_rd_addr$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_0_f_rd_addr$EMPTY_N));
  // submodule fabric_xactors_to_slaves_0_f_rd_data
  FIFO2 #(.width(32'd83),
	  .guarded(1'd1)) fabric_xactors_to_slaves_0_f_rd_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_0_f_rd_data$D_IN),
							       .ENQ(fabric_xactors_to_slaves_0_f_rd_data$ENQ),
							       .DEQ(fabric_xactors_to_slaves_0_f_rd_data$DEQ),
							       .CLR(fabric_xactors_to_slaves_0_f_rd_data$CLR),
							       .D_OUT(fabric_xactors_to_slaves_0_f_rd_data$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_0_f_rd_data$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_0_f_rd_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_0_f_wr_addr
  FIFO2 #(.width(32'd109),
	  .guarded(1'd1)) fabric_xactors_to_slaves_0_f_wr_addr(.RST(RST_N),
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
	  .guarded(1'd1)) fabric_xactors_to_slaves_0_f_wr_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_0_f_wr_data$D_IN),
							       .ENQ(fabric_xactors_to_slaves_0_f_wr_data$ENQ),
							       .DEQ(fabric_xactors_to_slaves_0_f_wr_data$DEQ),
							       .CLR(fabric_xactors_to_slaves_0_f_wr_data$CLR),
							       .D_OUT(fabric_xactors_to_slaves_0_f_wr_data$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_0_f_wr_data$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_0_f_wr_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_0_f_wr_resp
  FIFO2 #(.width(32'd18),
	  .guarded(1'd1)) fabric_xactors_to_slaves_0_f_wr_resp(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_0_f_wr_resp$D_IN),
							       .ENQ(fabric_xactors_to_slaves_0_f_wr_resp$ENQ),
							       .DEQ(fabric_xactors_to_slaves_0_f_wr_resp$DEQ),
							       .CLR(fabric_xactors_to_slaves_0_f_wr_resp$CLR),
							       .D_OUT(fabric_xactors_to_slaves_0_f_wr_resp$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_0_f_wr_resp$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_0_f_wr_resp$EMPTY_N));
  // submodule fabric_xactors_to_slaves_1_f_rd_addr
  FIFO2 #(.width(32'd109),
	  .guarded(1'd1)) fabric_xactors_to_slaves_1_f_rd_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_1_f_rd_addr$D_IN),
							       .ENQ(fabric_xactors_to_slaves_1_f_rd_addr$ENQ),
							       .DEQ(fabric_xactors_to_slaves_1_f_rd_addr$DEQ),
							       .CLR(fabric_xactors_to_slaves_1_f_rd_addr$CLR),
							       .D_OUT(fabric_xactors_to_slaves_1_f_rd_addr$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_1_f_rd_addr$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_1_f_rd_addr$EMPTY_N));
  // submodule fabric_xactors_to_slaves_1_f_rd_data
  FIFO2 #(.width(32'd83),
	  .guarded(1'd1)) fabric_xactors_to_slaves_1_f_rd_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_1_f_rd_data$D_IN),
							       .ENQ(fabric_xactors_to_slaves_1_f_rd_data$ENQ),
							       .DEQ(fabric_xactors_to_slaves_1_f_rd_data$DEQ),
							       .CLR(fabric_xactors_to_slaves_1_f_rd_data$CLR),
							       .D_OUT(fabric_xactors_to_slaves_1_f_rd_data$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_1_f_rd_data$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_1_f_rd_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_1_f_wr_addr
  FIFO2 #(.width(32'd109),
	  .guarded(1'd1)) fabric_xactors_to_slaves_1_f_wr_addr(.RST(RST_N),
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
	  .guarded(1'd1)) fabric_xactors_to_slaves_1_f_wr_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_1_f_wr_data$D_IN),
							       .ENQ(fabric_xactors_to_slaves_1_f_wr_data$ENQ),
							       .DEQ(fabric_xactors_to_slaves_1_f_wr_data$DEQ),
							       .CLR(fabric_xactors_to_slaves_1_f_wr_data$CLR),
							       .D_OUT(fabric_xactors_to_slaves_1_f_wr_data$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_1_f_wr_data$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_1_f_wr_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_1_f_wr_resp
  FIFO2 #(.width(32'd18),
	  .guarded(1'd1)) fabric_xactors_to_slaves_1_f_wr_resp(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_1_f_wr_resp$D_IN),
							       .ENQ(fabric_xactors_to_slaves_1_f_wr_resp$ENQ),
							       .DEQ(fabric_xactors_to_slaves_1_f_wr_resp$DEQ),
							       .CLR(fabric_xactors_to_slaves_1_f_wr_resp$CLR),
							       .D_OUT(fabric_xactors_to_slaves_1_f_wr_resp$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_1_f_wr_resp$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_1_f_wr_resp$EMPTY_N));
  // submodule fabric_xactors_to_slaves_2_f_rd_addr
  FIFO2 #(.width(32'd109),
	  .guarded(1'd1)) fabric_xactors_to_slaves_2_f_rd_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_2_f_rd_addr$D_IN),
							       .ENQ(fabric_xactors_to_slaves_2_f_rd_addr$ENQ),
							       .DEQ(fabric_xactors_to_slaves_2_f_rd_addr$DEQ),
							       .CLR(fabric_xactors_to_slaves_2_f_rd_addr$CLR),
							       .D_OUT(fabric_xactors_to_slaves_2_f_rd_addr$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_2_f_rd_addr$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_2_f_rd_addr$EMPTY_N));
  // submodule fabric_xactors_to_slaves_2_f_rd_data
  FIFO2 #(.width(32'd83),
	  .guarded(1'd1)) fabric_xactors_to_slaves_2_f_rd_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_2_f_rd_data$D_IN),
							       .ENQ(fabric_xactors_to_slaves_2_f_rd_data$ENQ),
							       .DEQ(fabric_xactors_to_slaves_2_f_rd_data$DEQ),
							       .CLR(fabric_xactors_to_slaves_2_f_rd_data$CLR),
							       .D_OUT(fabric_xactors_to_slaves_2_f_rd_data$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_2_f_rd_data$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_2_f_rd_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_2_f_wr_addr
  FIFO2 #(.width(32'd109),
	  .guarded(1'd1)) fabric_xactors_to_slaves_2_f_wr_addr(.RST(RST_N),
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
	  .guarded(1'd1)) fabric_xactors_to_slaves_2_f_wr_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_2_f_wr_data$D_IN),
							       .ENQ(fabric_xactors_to_slaves_2_f_wr_data$ENQ),
							       .DEQ(fabric_xactors_to_slaves_2_f_wr_data$DEQ),
							       .CLR(fabric_xactors_to_slaves_2_f_wr_data$CLR),
							       .D_OUT(fabric_xactors_to_slaves_2_f_wr_data$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_2_f_wr_data$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_2_f_wr_data$EMPTY_N));
  // submodule fabric_xactors_to_slaves_2_f_wr_resp
  FIFO2 #(.width(32'd18),
	  .guarded(1'd1)) fabric_xactors_to_slaves_2_f_wr_resp(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_2_f_wr_resp$D_IN),
							       .ENQ(fabric_xactors_to_slaves_2_f_wr_resp$ENQ),
							       .DEQ(fabric_xactors_to_slaves_2_f_wr_resp$DEQ),
							       .CLR(fabric_xactors_to_slaves_2_f_wr_resp$CLR),
							       .D_OUT(fabric_xactors_to_slaves_2_f_wr_resp$D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_2_f_wr_resp$FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_2_f_wr_resp$EMPTY_N));
  // rule RL_fabric_rl_wr_xaction_master_to_slave
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave =
	     fabric_xactors_from_masters_0_f_wr_addr$EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_wr_addr$FULL_N &&
	     fabric_v_f_wd_tasks_0$FULL_N &&
	     fabric_v_f_wr_mis_0$FULL_N &&
	     fabric_v_f_wr_sjs_0$FULL_N &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d19) &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d22 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d23) ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;
  // rule RL_fabric_rl_wr_xaction_master_to_slave_1
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 =
	     fabric_xactors_from_masters_0_f_wr_addr$EMPTY_N &&
	     fabric_v_f_wd_tasks_0$FULL_N &&
	     fabric_v_f_wr_sjs_0$FULL_N &&
	     fabric_xactors_to_slaves_1_f_wr_addr$FULL_N &&
	     fabric_v_f_wr_mis_1$FULL_N &&
	     !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d19 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;
  // rule RL_fabric_rl_wr_xaction_master_to_slave_2
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 =
	     fabric_xactors_from_masters_0_f_wr_addr$EMPTY_N &&
	     fabric_v_f_wd_tasks_0$FULL_N &&
	     fabric_v_f_wr_sjs_0$FULL_N &&
	     fabric_xactors_to_slaves_2_f_wr_addr$FULL_N &&
	     fabric_v_f_wr_mis_2$FULL_N &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d19) &&
	     !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d22 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d23 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;
  // rule RL_fabric_rl_wr_xaction_master_to_slave_data
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data =
	     fabric_xactors_from_masters_0_f_wr_data$EMPTY_N &&
	     fabric_v_f_wd_tasks_0_i_notEmpty__9_AND_fabric_ETC___d78 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data ;
  // rule RL_fabric_rl_wr_resp_slave_to_master
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master =
	     fabric_v_f_wr_mis_0$EMPTY_N && fabric_v_f_wr_sjs_0$EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_wr_resp$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp$FULL_N &&
	     !fabric_v_f_wr_mis_0$D_OUT &&
	     fabric_v_f_wr_sjs_0$D_OUT == 2'd0 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;
  // rule RL_fabric_rl_wr_resp_slave_to_master_1
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 =
	     fabric_v_f_wr_sjs_0$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_mis_1$EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_wr_resp$EMPTY_N &&
	     !fabric_v_f_wr_mis_1$D_OUT &&
	     fabric_v_f_wr_sjs_0$D_OUT == 2'd1 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ;
  // rule RL_fabric_rl_wr_resp_slave_to_master_2
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 =
	     fabric_v_f_wr_sjs_0$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_mis_2$EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_wr_resp$EMPTY_N &&
	     !fabric_v_f_wr_mis_2$D_OUT &&
	     fabric_v_f_wr_sjs_0$D_OUT == 2'd2 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ;
  // rule RL_fabric_rl_wr_resp_err_to_master
  assign CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master =
	     fabric_v_f_wr_sjs_0$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp$FULL_N &&
	     fabric_v_f_wr_err_info_0$EMPTY_N &&
	     fabric_v_f_wr_sjs_0$D_OUT == 2'd3 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master =
	     CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master ;
  // rule RL_fabric_rl_rd_xaction_master_to_slave
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave =
	     fabric_xactors_from_masters_0_f_rd_addr$EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_rd_addr$FULL_N &&
	     fabric_v_f_rd_mis_0$FULL_N &&
	     fabric_v_f_rd_sjs_0$FULL_N &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d166 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d167) &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d170 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d171) ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ;
  // rule RL_fabric_rl_rd_xaction_master_to_slave_1
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 =
	     fabric_xactors_from_masters_0_f_rd_addr$EMPTY_N &&
	     fabric_v_f_rd_sjs_0$FULL_N &&
	     fabric_xactors_to_slaves_1_f_rd_addr$FULL_N &&
	     fabric_v_f_rd_mis_1$FULL_N &&
	     !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d166 &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d167 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ;
  // rule RL_fabric_rl_rd_xaction_master_to_slave_2
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 =
	     fabric_xactors_from_masters_0_f_rd_addr$EMPTY_N &&
	     fabric_v_f_rd_sjs_0$FULL_N &&
	     fabric_xactors_to_slaves_2_f_rd_addr$FULL_N &&
	     fabric_v_f_rd_mis_2$FULL_N &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d166 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d167) &&
	     !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d170 &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d171 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ;
  // rule RL_fabric_rl_rd_resp_slave_to_master
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master =
	     fabric_v_f_rd_mis_0$EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_rd_data$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_rd_data$FULL_N &&
	     (fabric_v_f_rd_mis_0$D_OUT[8] || fabric_v_f_rd_sjs_0$EMPTY_N) &&
	     (!fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 ||
	      fabric_v_f_rd_sjs_0$EMPTY_N) &&
	     !fabric_v_f_rd_mis_0$D_OUT[8] &&
	     fabric_v_f_rd_sjs_0$D_OUT == 2'd0 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master ;
  // rule RL_fabric_rl_rd_resp_slave_to_master_1
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 =
	     fabric_xactors_from_masters_0_f_rd_data$FULL_N &&
	     fabric_v_f_rd_mis_1$EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_rd_data$EMPTY_N &&
	     (fabric_v_f_rd_mis_1$D_OUT[8] || fabric_v_f_rd_sjs_0$EMPTY_N) &&
	     (!fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 ||
	      fabric_v_f_rd_sjs_0$EMPTY_N) &&
	     !fabric_v_f_rd_mis_1$D_OUT[8] &&
	     fabric_v_f_rd_sjs_0$D_OUT == 2'd1 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ;
  // rule RL_fabric_rl_rd_resp_slave_to_master_2
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 =
	     fabric_xactors_from_masters_0_f_rd_data$FULL_N &&
	     fabric_v_f_rd_mis_2$EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_rd_data$EMPTY_N &&
	     (fabric_v_f_rd_mis_2$D_OUT[8] || fabric_v_f_rd_sjs_0$EMPTY_N) &&
	     (!fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 ||
	      fabric_v_f_rd_sjs_0$EMPTY_N) &&
	     !fabric_v_f_rd_mis_2$D_OUT[8] &&
	     fabric_v_f_rd_sjs_0$D_OUT == 2'd2 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ;
  // rule RL_fabric_rl_rd_resp_err_to_master
  assign CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master =
	     fabric_v_f_rd_sjs_0$EMPTY_N &&
	     fabric_xactors_from_masters_0_f_rd_data$FULL_N &&
	     fabric_v_f_rd_err_info_0$EMPTY_N &&
	     fabric_v_f_rd_sjs_0$D_OUT == 2'd3 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master =
	     CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master ;
  // rule RL_fabric_rl_reset
  assign CAN_FIRE_RL_fabric_rl_reset = fabric_rg_reset ;
  assign WILL_FIRE_RL_fabric_rl_reset = fabric_rg_reset ;
  // inputs to muxes for submodule ports
  assign MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_1 =
	     { 2'd0, fabric_xactors_from_masters_0_f_wr_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_2 =
	     { 2'd1, fabric_xactors_from_masters_0_f_wr_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_f_wd_tasks_0$enq_1__VAL_3 =
	     { 2'd2, fabric_xactors_from_masters_0_f_wr_addr$D_OUT[28:21] } ;
  assign MUX_fabric_v_rg_r_beat_count_0$write_1__VAL_2 =
	     fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 ?
	       8'd0 :
	       x__h11272 ;
  assign MUX_fabric_v_rg_r_beat_count_1$write_1__VAL_2 =
	     fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 ?
	       8'd0 :
	       x__h11921 ;
  assign MUX_fabric_v_rg_r_beat_count_2$write_1__VAL_2 =
	     fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 ?
	       8'd0 :
	       x__h12560 ;
  assign MUX_fabric_v_rg_wd_beat_count_0$write_1__VAL_2 =
	     fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 ?
	       8'd0 :
	       x__h8102 ;
  assign MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_1 =
	     { fabric_xactors_to_slaves_0_f_rd_data$D_OUT[82:3],
	       IF_fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_ETC___d245,
	       fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0] } ;
  assign MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_2 =
	     { fabric_xactors_to_slaves_1_f_rd_data$D_OUT[82:3],
	       IF_fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_ETC___d284,
	       fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0] } ;
  assign MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_3 =
	     { fabric_xactors_to_slaves_2_f_rd_data$D_OUT[82:3],
	       IF_fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_ETC___d323,
	       fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0] } ;
  assign MUX_fabric_xactors_from_masters_0_f_rd_data$enq_1__VAL_4 =
	     { fabric_v_f_rd_err_info_0$D_OUT[15:0],
	       66'd3,
	       fabric_v_rg_r_err_beat_count_0_36_EQ_fabric_v__ETC___d338 } ;
  assign MUX_fabric_xactors_from_masters_0_f_wr_resp$enq_1__VAL_4 =
	     { fabric_v_f_wr_err_info_0$D_OUT, 2'd3 } ;
  // register fabric_cfg_verbosity
  assign fabric_cfg_verbosity$D_IN = set_verbosity_verbosity ;
  assign fabric_cfg_verbosity$EN = EN_set_verbosity ;
  // register fabric_rg_reset
  assign fabric_rg_reset$D_IN = !fabric_rg_reset ;
  assign fabric_rg_reset$EN = fabric_rg_reset || EN_reset ;
  // register fabric_v_rg_r_beat_count_0
  assign fabric_v_rg_r_beat_count_0$D_IN =
	     fabric_rg_reset ?
	       8'd0 :
	       MUX_fabric_v_rg_r_beat_count_0$write_1__VAL_2 ;
  assign fabric_v_rg_r_beat_count_0$EN =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master ||
	     fabric_rg_reset ;
  // register fabric_v_rg_r_beat_count_1
  assign fabric_v_rg_r_beat_count_1$D_IN =
	     fabric_rg_reset ?
	       8'd0 :
	       MUX_fabric_v_rg_r_beat_count_1$write_1__VAL_2 ;
  assign fabric_v_rg_r_beat_count_1$EN =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ||
	     fabric_rg_reset ;
  // register fabric_v_rg_r_beat_count_2
  assign fabric_v_rg_r_beat_count_2$D_IN =
	     fabric_rg_reset ?
	       8'd0 :
	       MUX_fabric_v_rg_r_beat_count_2$write_1__VAL_2 ;
  assign fabric_v_rg_r_beat_count_2$EN =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ||
	     fabric_rg_reset ;
  // register fabric_v_rg_r_err_beat_count_0
  assign fabric_v_rg_r_err_beat_count_0$D_IN =
	     fabric_v_rg_r_err_beat_count_0_36_EQ_fabric_v__ETC___d338 ?
	       8'd0 :
	       x__h13057 ;
  assign fabric_v_rg_r_err_beat_count_0$EN =
	     CAN_FIRE_RL_fabric_rl_rd_resp_err_to_master ;
  // register fabric_v_rg_wd_beat_count_0
  assign fabric_v_rg_wd_beat_count_0$D_IN =
	     fabric_rg_reset ?
	       8'd0 :
	       MUX_fabric_v_rg_wd_beat_count_0$write_1__VAL_2 ;
  assign fabric_v_rg_wd_beat_count_0$EN =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data ||
	     fabric_rg_reset ;
  // submodule fabric_v_f_rd_err_info_0
  assign fabric_v_f_rd_err_info_0$D_IN = 24'h0 ;
  assign fabric_v_f_rd_err_info_0$ENQ = 1'b0 ;
  assign fabric_v_f_rd_err_info_0$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	     fabric_v_rg_r_err_beat_count_0_36_EQ_fabric_v__ETC___d338 ;
  assign fabric_v_f_rd_err_info_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_rd_mis_0
  assign fabric_v_f_rd_mis_0$D_IN =
	     { 1'd0, fabric_xactors_from_masters_0_f_rd_addr$D_OUT[28:21] } ;
  assign fabric_v_f_rd_mis_0$ENQ =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ;
  assign fabric_v_f_rd_mis_0$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	     fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 ;
  assign fabric_v_f_rd_mis_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_rd_mis_1
  assign fabric_v_f_rd_mis_1$D_IN = fabric_v_f_rd_mis_0$D_IN ;
  assign fabric_v_f_rd_mis_1$ENQ =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ;
  assign fabric_v_f_rd_mis_1$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	     fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 ;
  assign fabric_v_f_rd_mis_1$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_rd_mis_2
  assign fabric_v_f_rd_mis_2$D_IN = fabric_v_f_rd_mis_0$D_IN ;
  assign fabric_v_f_rd_mis_2$ENQ =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ;
  assign fabric_v_f_rd_mis_2$DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	     fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 ;
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
	     fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	     fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	     fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	     fabric_v_rg_r_err_beat_count_0_36_EQ_fabric_v__ETC___d338 ;
  assign fabric_v_f_rd_sjs_0$CLR = fabric_rg_reset ;
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
	     fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 ;
  assign fabric_v_f_wd_tasks_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_err_info_0
  assign fabric_v_f_wr_err_info_0$D_IN = 16'h0 ;
  assign fabric_v_f_wr_err_info_0$ENQ = 1'b0 ;
  assign fabric_v_f_wr_err_info_0$DEQ =
	     CAN_FIRE_RL_fabric_rl_wr_resp_err_to_master ;
  assign fabric_v_f_wr_err_info_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_mis_0
  assign fabric_v_f_wr_mis_0$D_IN = 1'd0 ;
  assign fabric_v_f_wr_mis_0$ENQ =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;
  assign fabric_v_f_wr_mis_0$DEQ =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;
  assign fabric_v_f_wr_mis_0$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_mis_1
  assign fabric_v_f_wr_mis_1$D_IN = 1'd0 ;
  assign fabric_v_f_wr_mis_1$ENQ =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;
  assign fabric_v_f_wr_mis_1$DEQ =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ;
  assign fabric_v_f_wr_mis_1$CLR = fabric_rg_reset ;
  // submodule fabric_v_f_wr_mis_2
  assign fabric_v_f_wr_mis_2$D_IN = 1'd0 ;
  assign fabric_v_f_wr_mis_2$ENQ =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;
  assign fabric_v_f_wr_mis_2$DEQ =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ;
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
		   83'h2AAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
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
		   18'b101010101010101010 /* unspecified value */ ;
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
  // submodule fabric_xactors_to_slaves_0_f_rd_addr
  assign fabric_xactors_to_slaves_0_f_rd_addr$D_IN =
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT ;
  assign fabric_xactors_to_slaves_0_f_rd_addr$ENQ =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ;
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
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master ;
  assign fabric_xactors_to_slaves_0_f_rd_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_0_f_wr_addr
  assign fabric_xactors_to_slaves_0_f_wr_addr$D_IN =
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT ;
  assign fabric_xactors_to_slaves_0_f_wr_addr$ENQ =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;
  assign fabric_xactors_to_slaves_0_f_wr_addr$DEQ =
	     fabric_xactors_to_slaves_0_f_wr_addr$EMPTY_N &&
	     v_to_slaves_0_awready ;
  assign fabric_xactors_to_slaves_0_f_wr_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_0_f_wr_data
  assign fabric_xactors_to_slaves_0_f_wr_data$D_IN =
	     fabric_xactors_from_masters_0_f_wr_data$D_OUT ;
  assign fabric_xactors_to_slaves_0_f_wr_data$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_v_f_wd_tasks_0$D_OUT[9:8] == 2'd0 ;
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
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;
  assign fabric_xactors_to_slaves_0_f_wr_resp$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_1_f_rd_addr
  assign fabric_xactors_to_slaves_1_f_rd_addr$D_IN =
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT ;
  assign fabric_xactors_to_slaves_1_f_rd_addr$ENQ =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ;
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
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ;
  assign fabric_xactors_to_slaves_1_f_rd_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_1_f_wr_addr
  assign fabric_xactors_to_slaves_1_f_wr_addr$D_IN =
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT ;
  assign fabric_xactors_to_slaves_1_f_wr_addr$ENQ =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;
  assign fabric_xactors_to_slaves_1_f_wr_addr$DEQ =
	     fabric_xactors_to_slaves_1_f_wr_addr$EMPTY_N &&
	     v_to_slaves_1_awready ;
  assign fabric_xactors_to_slaves_1_f_wr_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_1_f_wr_data
  assign fabric_xactors_to_slaves_1_f_wr_data$D_IN =
	     fabric_xactors_from_masters_0_f_wr_data$D_OUT ;
  assign fabric_xactors_to_slaves_1_f_wr_data$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_v_f_wd_tasks_0$D_OUT[9:8] == 2'd1 ;
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
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ;
  assign fabric_xactors_to_slaves_1_f_wr_resp$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_2_f_rd_addr
  assign fabric_xactors_to_slaves_2_f_rd_addr$D_IN =
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT ;
  assign fabric_xactors_to_slaves_2_f_rd_addr$ENQ =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ;
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
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ;
  assign fabric_xactors_to_slaves_2_f_rd_data$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_2_f_wr_addr
  assign fabric_xactors_to_slaves_2_f_wr_addr$D_IN =
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT ;
  assign fabric_xactors_to_slaves_2_f_wr_addr$ENQ =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;
  assign fabric_xactors_to_slaves_2_f_wr_addr$DEQ =
	     fabric_xactors_to_slaves_2_f_wr_addr$EMPTY_N &&
	     v_to_slaves_2_awready ;
  assign fabric_xactors_to_slaves_2_f_wr_addr$CLR = fabric_rg_reset ;
  // submodule fabric_xactors_to_slaves_2_f_wr_data
  assign fabric_xactors_to_slaves_2_f_wr_data$D_IN =
	     fabric_xactors_from_masters_0_f_wr_data$D_OUT ;
  assign fabric_xactors_to_slaves_2_f_wr_data$ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_v_f_wd_tasks_0$D_OUT[9:8] == 2'd2 ;
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
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ;
  assign fabric_xactors_to_slaves_2_f_wr_resp$CLR = fabric_rg_reset ;
  // remaining internal signals
  assign IF_fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_ETC___d245 =
	     fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 ?
	       x1_avValue_rresp__h11250 :
	       fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] ;
  assign IF_fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_ETC___d284 =
	     fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 ?
	       x1_avValue_rresp__h11899 :
	       fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] ;
  assign IF_fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_ETC___d323 =
	     fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 ?
	       x1_avValue_rresp__h12538 :
	       fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] ;
  assign fabric_v_f_wd_tasks_0_i_notEmpty__9_AND_fabric_ETC___d78 =
	     fabric_v_f_wd_tasks_0$EMPTY_N &&
	     CASE_fabric_v_f_wd_tasks_0D_OUT_BITS_9_TO_8_0_ETC__q1 ;
  assign fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 =
	     fabric_v_rg_r_beat_count_0 == fabric_v_f_rd_mis_0$D_OUT[7:0] ;
  assign fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 =
	     fabric_v_rg_r_beat_count_1 == fabric_v_f_rd_mis_1$D_OUT[7:0] ;
  assign fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 =
	     fabric_v_rg_r_beat_count_2 == fabric_v_f_rd_mis_2$D_OUT[7:0] ;
  assign fabric_v_rg_r_err_beat_count_0_36_EQ_fabric_v__ETC___d338 =
	     fabric_v_rg_r_err_beat_count_0 ==
	     fabric_v_f_rd_err_info_0$D_OUT[23:16] ;
  assign fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 =
	     fabric_v_rg_wd_beat_count_0 == fabric_v_f_wd_tasks_0$D_OUT[7:0] ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d166 =
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29] <
	     64'h0000000002000000 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d167 =
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29] <
	     64'd33603584 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d170 =
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29] <
	     64'h000000000C000000 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d171 =
	     fabric_xactors_from_masters_0_f_rd_addr$D_OUT[92:29] <
	     64'd205520896 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 =
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29] <
	     64'h0000000002000000 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d19 =
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29] <
	     64'd33603584 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d22 =
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29] <
	     64'h000000000C000000 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d23 =
	     fabric_xactors_from_masters_0_f_wr_addr$D_OUT[92:29] <
	     64'd205520896 ;
  assign x1_avValue_rresp__h11250 =
	     (fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	      !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0]) ?
	       2'b10 :
	       fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] ;
  assign x1_avValue_rresp__h11899 =
	     (fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	      !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0]) ?
	       2'b10 :
	       fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] ;
  assign x1_avValue_rresp__h12538 =
	     (fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	      !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0]) ?
	       2'b10 :
	       fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] ;
  assign x__h11272 = fabric_v_rg_r_beat_count_0 + 8'd1 ;
  assign x__h11921 = fabric_v_rg_r_beat_count_1 + 8'd1 ;
  assign x__h12560 = fabric_v_rg_r_beat_count_2 + 8'd1 ;
  assign x__h13057 = fabric_v_rg_r_err_beat_count_0 + 8'd1 ;
  assign x__h8102 = fabric_v_rg_wd_beat_count_0 + 8'd1 ;
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
	fabric_v_rg_wd_beat_count_0 <= `BSV_ASSIGNMENT_DELAY 8'd0;
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
	if (fabric_v_rg_wd_beat_count_0$EN)
	  fabric_v_rg_wd_beat_count_0 <= `BSV_ASSIGNMENT_DELAY
	      fabric_v_rg_wd_beat_count_0$D_IN;
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
    fabric_v_rg_wd_beat_count_0 = 8'hAA;
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
	  v__h6565 = $stime;
	  #0;
	end
    v__h6559 = v__h6565 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave: m%0d -> s%0d",
		 v__h6559,
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
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[108:93]);
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
	  v__h6916 = $stime;
	  #0;
	end
    v__h6910 = v__h6916 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave: m%0d -> s%0d",
		 v__h6910,
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
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[108:93]);
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
	  v__h7267 = $stime;
	  #0;
	end
    v__h7261 = v__h7267 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave: m%0d -> s%0d",
		 v__h7261,
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
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr$D_OUT[108:93]);
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
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h7953 = $stime;
	  #0;
	end
    v__h7947 = v__h7953 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_xaction_master_to_slave_data: m%0d -> s%0d, beat %0d/%0d",
		 v__h7947,
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
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	begin
	  v__h8200 = $stime;
	  #0;
	end
    v__h8194 = v__h8200 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$display("%0d: %m.rl_wr_xaction_master_to_slave_data: ERROR: m%0d -> s%0d",
		 v__h8194,
		 $signed(32'd0),
		 fabric_v_f_wd_tasks_0$D_OUT[9:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$display("    WLAST not set on final data beat (awlen = %0d)",
		 fabric_v_f_wd_tasks_0$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  fabric_v_rg_wd_beat_count_0_6_EQ_fabric_v_f_wd_ETC___d94 &&
	  !fabric_xactors_from_masters_0_f_wr_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h8557 = $stime;
	  #0;
	end
    v__h8551 = v__h8557 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_slave_to_master: m%0d <- s%0d",
		 v__h8551,
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
	$write("'h%h", fabric_xactors_to_slaves_0_f_wr_resp$D_OUT[17:2]);
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
	  v__h8827 = $stime;
	  #0;
	end
    v__h8821 = v__h8827 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_slave_to_master: m%0d <- s%0d",
		 v__h8821,
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
	$write("'h%h", fabric_xactors_to_slaves_1_f_wr_resp$D_OUT[17:2]);
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
	  v__h9097 = $stime;
	  #0;
	end
    v__h9091 = v__h9097 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_slave_to_master: m%0d <- s%0d",
		 v__h9091,
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
	$write("'h%h", fabric_xactors_to_slaves_2_f_wr_resp$D_OUT[17:2]);
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
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h9331 = $stime;
	  #0;
	end
    v__h9325 = v__h9331 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_wr_resp_err_to_master: m%0d <- err",
		 v__h9325,
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
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h9735 = $stime;
	  #0;
	end
    v__h9729 = v__h9735 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_xaction_master_to_slave: m%0d -> s%0d",
		 v__h9729,
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
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[108:93]);
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
	  v__h10073 = $stime;
	  #0;
	end
    v__h10067 = v__h10073 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_xaction_master_to_slave: m%0d -> s%0d",
		 v__h10067,
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
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[108:93]);
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
	  v__h10411 = $stime;
	  #0;
	end
    v__h10405 = v__h10411 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_xaction_master_to_slave: m%0d -> s%0d",
		 v__h10405,
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
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr$D_OUT[108:93]);
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
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	begin
	  v__h11108 = $stime;
	  #0;
	end
    v__h11102 = v__h11108 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$display("%0d: %m.rl_rd_resp_slave_to_master: ERROR: m%0d <- s%0d",
		 v__h11102,
		 $signed(32'd0),
		 $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$display("    RLAST not set on final data beat (arlen = %0d)",
		 fabric_v_f_rd_mis_0$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[82:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_rd_ETC___d218 &&
	  fabric_xactors_to_slaves_0_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_0_f_rd_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h11389 = $stime;
	  #0;
	end
    v__h11383 = v__h11389 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_slave_to_master: m%0d <- s%0d",
		 v__h11383,
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
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data$D_OUT[82:67]);
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
	       IF_fabric_v_rg_r_beat_count_0_16_EQ_fabric_v_f_ETC___d245);
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
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	begin
	  v__h11757 = $stime;
	  #0;
	end
    v__h11751 = v__h11757 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$display("%0d: %m.rl_rd_resp_slave_to_master: ERROR: m%0d <- s%0d",
		 v__h11751,
		 $signed(32'd0),
		 $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$display("    RLAST not set on final data beat (arlen = %0d)",
		 fabric_v_f_rd_mis_1$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[82:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_rd_ETC___d258 &&
	  fabric_xactors_to_slaves_1_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_1_f_rd_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h12028 = $stime;
	  #0;
	end
    v__h12022 = v__h12028 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_slave_to_master: m%0d <- s%0d",
		 v__h12022,
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
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data$D_OUT[82:67]);
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
	       IF_fabric_v_rg_r_beat_count_1_56_EQ_fabric_v_f_ETC___d284);
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
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	begin
	  v__h12396 = $stime;
	  #0;
	end
    v__h12390 = v__h12396 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$display("%0d: %m.rl_rd_resp_slave_to_master: ERROR: m%0d <- s%0d",
		 v__h12390,
		 $signed(32'd0),
		 $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$display("    RLAST not set on final data beat (arlen = %0d)",
		 fabric_v_f_rd_mis_2$D_OUT[7:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[82:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_rd_ETC___d297 &&
	  fabric_xactors_to_slaves_2_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !fabric_xactors_to_slaves_2_f_rd_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h12667 = $stime;
	  #0;
	end
    v__h12661 = v__h12667 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_slave_to_master: m%0d <- s%0d",
		 v__h12661,
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
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data$D_OUT[82:67]);
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
	       IF_fabric_v_rg_r_beat_count_2_95_EQ_fabric_v_f_ETC___d323);
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
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	begin
	  v__h13120 = $stime;
	  #0;
	end
    v__h13114 = v__h13120 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_rd_resp_err_to_master: m%0d <- err",
		 v__h13114,
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
	$write("'h%h", fabric_v_f_rd_err_info_0$D_OUT[15:0]);
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
	  fabric_v_rg_r_err_beat_count_0_36_EQ_fabric_v__ETC___d338)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_err_to_master &&
	  fabric_cfg_verbosity != 4'd0 &&
	  !fabric_v_rg_r_err_beat_count_0_36_EQ_fabric_v__ETC___d338)
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
      if (fabric_rg_reset && fabric_cfg_verbosity != 4'd0)
	begin
	  v__h4397 = $stime;
	  #0;
	end
    v__h4391 = v__h4397 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (fabric_rg_reset && fabric_cfg_verbosity != 4'd0)
	$display("%0d: %m.rl_reset", v__h4391);
  end
  // synopsys translate_on
endmodule