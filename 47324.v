module outputs
  wire [352 : 0] to_raw_mem_request_get;
  wire [63 : 0] slave_rdata;
  wire [15 : 0] slave_bid, slave_rid;
  wire [7 : 0] status;
  wire [1 : 0] slave_bresp, slave_rresp;
  wire RDY_server_reset_request_put,
       RDY_server_reset_response_get,
       RDY_set_addr_map,
       RDY_set_watch_tohost,
       RDY_to_raw_mem_request_get,
       RDY_to_raw_mem_response_put,
       slave_arready,
       slave_awready,
       slave_bvalid,
       slave_rlast,
       slave_rvalid,
       slave_wready;
  // inlined wires
  reg [353 : 0] f_raw_mem_reqs_rv$port1__write_1;
  wire [353 : 0] f_raw_mem_reqs_rv$port1__read,
		 f_raw_mem_reqs_rv$port2__read,
		 f_raw_mem_reqs_rv$port3__read;
  wire [256 : 0] f_raw_mem_rsps_rv$port1__read,
		 f_raw_mem_rsps_rv$port1__write_1,
		 f_raw_mem_rsps_rv$port2__read,
		 f_raw_mem_rsps_rv$port3__read;
  wire [182 : 0] f_reqs_rv$port1__read,
		 f_reqs_rv$port1__write_1,
		 f_reqs_rv$port2__read;
  wire f_raw_mem_reqs_rv$EN_port1__write,
       f_reqs_rv$EN_port0__write,
       f_reqs_rv$EN_port1__write;
  // register cfg_verbosity
  reg [3 : 0] cfg_verbosity;
  wire [3 : 0] cfg_verbosity$D_IN;
  wire cfg_verbosity$EN;
  // register f_raw_mem_reqs_rv
  reg [353 : 0] f_raw_mem_reqs_rv;
  wire [353 : 0] f_raw_mem_reqs_rv$D_IN;
  wire f_raw_mem_reqs_rv$EN;
  // register f_raw_mem_rsps_rv
  reg [256 : 0] f_raw_mem_rsps_rv;
  wire [256 : 0] f_raw_mem_rsps_rv$D_IN;
  wire f_raw_mem_rsps_rv$EN;
  // register f_reqs_rv
  reg [182 : 0] f_reqs_rv;
  wire [182 : 0] f_reqs_rv$D_IN;
  wire f_reqs_rv$EN;
  // register rg_addr_base
  reg [63 : 0] rg_addr_base;
  wire [63 : 0] rg_addr_base$D_IN;
  wire rg_addr_base$EN;
  // register rg_addr_lim
  reg [63 : 0] rg_addr_lim;
  wire [63 : 0] rg_addr_lim$D_IN;
  wire rg_addr_lim$EN;
  // register rg_cached_clean
  reg rg_cached_clean;
  wire rg_cached_clean$D_IN, rg_cached_clean$EN;
  // register rg_cached_raw_mem_addr
  reg [63 : 0] rg_cached_raw_mem_addr;
  wire [63 : 0] rg_cached_raw_mem_addr$D_IN;
  wire rg_cached_raw_mem_addr$EN;
  // register rg_cached_raw_mem_word
  reg [255 : 0] rg_cached_raw_mem_word;
  wire [255 : 0] rg_cached_raw_mem_word$D_IN;
  wire rg_cached_raw_mem_word$EN;
  // register rg_state
  reg [1 : 0] rg_state;
  reg [1 : 0] rg_state$D_IN;
  wire rg_state$EN;
  // register rg_status
  reg [7 : 0] rg_status;
  wire [7 : 0] rg_status$D_IN;
  wire rg_status$EN;
  // register rg_tohost_addr
  reg [63 : 0] rg_tohost_addr;
  wire [63 : 0] rg_tohost_addr$D_IN;
  wire rg_tohost_addr$EN;
  // register rg_watch_tohost
  reg rg_watch_tohost;
  wire rg_watch_tohost$D_IN, rg_watch_tohost$EN;
  // ports of submodule f_reset_reqs
  wire f_reset_reqs$CLR,
       f_reset_reqs$DEQ,
       f_reset_reqs$EMPTY_N,
       f_reset_reqs$ENQ,
       f_reset_reqs$FULL_N;
  // ports of submodule f_reset_rsps
  wire f_reset_rsps$CLR,
       f_reset_rsps$DEQ,
       f_reset_rsps$EMPTY_N,
       f_reset_rsps$ENQ,
       f_reset_rsps$FULL_N;
  // ports of submodule slave_xactor_f_rd_addr
  wire [108 : 0] slave_xactor_f_rd_addr$D_IN, slave_xactor_f_rd_addr$D_OUT;
  wire slave_xactor_f_rd_addr$CLR,
       slave_xactor_f_rd_addr$DEQ,
       slave_xactor_f_rd_addr$EMPTY_N,
       slave_xactor_f_rd_addr$ENQ,
       slave_xactor_f_rd_addr$FULL_N;
  // ports of submodule slave_xactor_f_rd_data
  wire [82 : 0] slave_xactor_f_rd_data$D_IN, slave_xactor_f_rd_data$D_OUT;
  wire slave_xactor_f_rd_data$CLR,
       slave_xactor_f_rd_data$DEQ,
       slave_xactor_f_rd_data$EMPTY_N,
       slave_xactor_f_rd_data$ENQ,
       slave_xactor_f_rd_data$FULL_N;
  // ports of submodule slave_xactor_f_wr_addr
  wire [108 : 0] slave_xactor_f_wr_addr$D_IN, slave_xactor_f_wr_addr$D_OUT;
  wire slave_xactor_f_wr_addr$CLR,
       slave_xactor_f_wr_addr$DEQ,
       slave_xactor_f_wr_addr$EMPTY_N,
       slave_xactor_f_wr_addr$ENQ,
       slave_xactor_f_wr_addr$FULL_N;
  // ports of submodule slave_xactor_f_wr_data
  wire [72 : 0] slave_xactor_f_wr_data$D_IN, slave_xactor_f_wr_data$D_OUT;
  wire slave_xactor_f_wr_data$CLR,
       slave_xactor_f_wr_data$DEQ,
       slave_xactor_f_wr_data$EMPTY_N,
       slave_xactor_f_wr_data$ENQ,
       slave_xactor_f_wr_data$FULL_N;
  // ports of submodule slave_xactor_f_wr_resp
  wire [17 : 0] slave_xactor_f_wr_resp$D_IN, slave_xactor_f_wr_resp$D_OUT;
  wire slave_xactor_f_wr_resp$CLR,
       slave_xactor_f_wr_resp$DEQ,
       slave_xactor_f_wr_resp$EMPTY_N,
       slave_xactor_f_wr_resp$ENQ,
       slave_xactor_f_wr_resp$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_rl_external_reset,
       CAN_FIRE_RL_rl_invalid_rd_address,
       CAN_FIRE_RL_rl_invalid_wr_address,
       CAN_FIRE_RL_rl_merge_rd_req,
       CAN_FIRE_RL_rl_merge_wr_req,
       CAN_FIRE_RL_rl_miss_clean_req,
       CAN_FIRE_RL_rl_power_on_reset,
       CAN_FIRE_RL_rl_process_rd_req,
       CAN_FIRE_RL_rl_process_wr_req,
       CAN_FIRE_RL_rl_reload,
       CAN_FIRE_RL_rl_reset_reload_cache,
       CAN_FIRE_RL_rl_writeback_dirty,
       CAN_FIRE_RL_rl_writeback_dirty_idle,
       CAN_FIRE_server_reset_request_put,
       CAN_FIRE_server_reset_response_get,
       CAN_FIRE_set_addr_map,
       CAN_FIRE_set_watch_tohost,
       CAN_FIRE_slave_m_arvalid,
       CAN_FIRE_slave_m_awvalid,
       CAN_FIRE_slave_m_bready,
       CAN_FIRE_slave_m_rready,
       CAN_FIRE_slave_m_wvalid,
       CAN_FIRE_to_raw_mem_request_get,
       CAN_FIRE_to_raw_mem_response_put,
       WILL_FIRE_RL_rl_external_reset,
       WILL_FIRE_RL_rl_invalid_rd_address,
       WILL_FIRE_RL_rl_invalid_wr_address,
       WILL_FIRE_RL_rl_merge_rd_req,
       WILL_FIRE_RL_rl_merge_wr_req,
       WILL_FIRE_RL_rl_miss_clean_req,
       WILL_FIRE_RL_rl_power_on_reset,
       WILL_FIRE_RL_rl_process_rd_req,
       WILL_FIRE_RL_rl_process_wr_req,
       WILL_FIRE_RL_rl_reload,
       WILL_FIRE_RL_rl_reset_reload_cache,
       WILL_FIRE_RL_rl_writeback_dirty,
       WILL_FIRE_RL_rl_writeback_dirty_idle,
       WILL_FIRE_server_reset_request_put,
       WILL_FIRE_server_reset_response_get,
       WILL_FIRE_set_addr_map,
       WILL_FIRE_set_watch_tohost,
       WILL_FIRE_slave_m_arvalid,
       WILL_FIRE_slave_m_awvalid,
       WILL_FIRE_slave_m_bready,
       WILL_FIRE_slave_m_rready,
       WILL_FIRE_slave_m_wvalid,
       WILL_FIRE_to_raw_mem_request_get,
       WILL_FIRE_to_raw_mem_response_put;
  // inputs to muxes for submodule ports
  wire [353 : 0] MUX_f_raw_mem_reqs_rv$port1__write_1__VAL_1,
		 MUX_f_raw_mem_reqs_rv$port1__write_1__VAL_3;
  wire [255 : 0] MUX_rg_cached_raw_mem_word$write_1__VAL_1;
  wire [182 : 0] MUX_f_reqs_rv$port1__write_1__VAL_1,
		 MUX_f_reqs_rv$port1__write_1__VAL_2;
  wire [82 : 0] MUX_slave_xactor_f_rd_data$enq_1__VAL_1,
		MUX_slave_xactor_f_rd_data$enq_1__VAL_2;
  wire [17 : 0] MUX_slave_xactor_f_wr_resp$enq_1__VAL_1,
		MUX_slave_xactor_f_wr_resp$enq_1__VAL_2;
  wire MUX_f_raw_mem_reqs_rv$port1__write_1__SEL_1,
       MUX_rg_state$write_1__SEL_1,
       MUX_rg_state$write_1__SEL_2;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h2421;
  reg [31 : 0] v__h3358;
  reg [31 : 0] v__h3854;
  reg [31 : 0] v__h4335;
  reg [31 : 0] v__h4624;
  reg [31 : 0] v__h5340;
  reg [31 : 0] v__h7561;
  reg [31 : 0] v__h7769;
  reg [31 : 0] v__h8282;
  reg [31 : 0] v__h9085;
  reg [31 : 0] v__h9716;
  reg [31 : 0] v__h2728;
  reg [31 : 0] v__h3053;
  reg [31 : 0] v__h1680;
  reg [31 : 0] v__h1988;
  reg [31 : 0] v__h1674;
  reg [31 : 0] v__h1982;
  reg [31 : 0] v__h2415;
  reg [31 : 0] v__h2722;
  reg [31 : 0] v__h3047;
  reg [31 : 0] v__h3352;
  reg [31 : 0] v__h3848;
  reg [31 : 0] v__h4329;
  reg [31 : 0] v__h4618;
  reg [31 : 0] v__h5334;
  reg [31 : 0] v__h7555;
  reg [31 : 0] v__h7763;
  reg [31 : 0] v__h8276;
  reg [31 : 0] v__h9079;
  reg [31 : 0] v__h9710;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] rdata__h4995, word64_old__h5795;
  wire [63 : 0] exit_value__h7815,
		f_reqs_rv_BITS_164_TO_101_MINUS_rg_addr_base__q1,
		mask__h5800,
		req_raw_mem_addr__h3183,
		updated_word64__h5801,
		x__h6183,
		y__h6184,
		y__h6185;
  wire [7 : 0] SEXT_f_reqs_rv_port0__read__2_BIT_64_13___d214,
	       SEXT_f_reqs_rv_port0__read__2_BIT_65_10___d211,
	       SEXT_f_reqs_rv_port0__read__2_BIT_66_06___d207,
	       SEXT_f_reqs_rv_port0__read__2_BIT_67_03___d204,
	       SEXT_f_reqs_rv_port0__read__2_BIT_68_99___d200,
	       SEXT_f_reqs_rv_port0__read__2_BIT_69_96___d197,
	       SEXT_f_reqs_rv_port0__read__2_BIT_70_92___d193,
	       SEXT_f_reqs_rv_port0__read__2_BIT_71_89___d190;
  wire [4 : 0] n__h4994;
  wire NOT_cfg_verbosity_read_ULE_1___d5,
       NOT_cfg_verbosity_read_ULE_2_2___d33,
       NOT_f_reqs_rv_port0__read__2_BITS_92_TO_90_6_E_ETC___d278,
       f_reqs_rv_port0__read__2_BITS_164_TO_101_24_UL_ETC___d127,
       f_reqs_rv_port0__read__2_BITS_92_TO_90_6_EQ_0b_ETC___d122,
       rg_addr_base_23_ULE_f_reqs_rv_port0__read__2_B_ETC___d125,
       rg_cached_raw_mem_addr_0_EQ_0_CONCAT_f_reqs_rv_ETC___d134,
       rg_state_EQ_3_3_AND_NOT_f_reqs_rv_port0__read__ETC___d283,
       rg_state_EQ_3_3_AND_f_reqs_rv_port0__read__2_B_ETC___d130,
       rg_watch_tohost_36_AND_f_reqs_rv_port0__read___ETC___d242;
  // action method server_reset_request_put
  assign RDY_server_reset_request_put = f_reset_reqs$FULL_N ;
  assign CAN_FIRE_server_reset_request_put = f_reset_reqs$FULL_N ;
  assign WILL_FIRE_server_reset_request_put = EN_server_reset_request_put ;
  // action method server_reset_response_get
  assign RDY_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_server_reset_response_get = EN_server_reset_response_get ;
  // action method set_addr_map
  assign RDY_set_addr_map = rg_state == 2'd3 ;
  assign CAN_FIRE_set_addr_map = rg_state == 2'd3 ;
  assign WILL_FIRE_set_addr_map = EN_set_addr_map ;
  // action method slave_m_awvalid
  assign CAN_FIRE_slave_m_awvalid = 1'd1 ;
  assign WILL_FIRE_slave_m_awvalid = 1'd1 ;
  // value method slave_m_awready
  assign slave_awready = slave_xactor_f_wr_addr$FULL_N ;
  // action method slave_m_wvalid
  assign CAN_FIRE_slave_m_wvalid = 1'd1 ;
  assign WILL_FIRE_slave_m_wvalid = 1'd1 ;
  // value method slave_m_wready
  assign slave_wready = slave_xactor_f_wr_data$FULL_N ;
  // value method slave_m_bvalid
  assign slave_bvalid = slave_xactor_f_wr_resp$EMPTY_N ;
  // value method slave_m_bid
  assign slave_bid = slave_xactor_f_wr_resp$D_OUT[17:2] ;
  // value method slave_m_bresp
  assign slave_bresp = slave_xactor_f_wr_resp$D_OUT[1:0] ;
  // action method slave_m_bready
  assign CAN_FIRE_slave_m_bready = 1'd1 ;
  assign WILL_FIRE_slave_m_bready = 1'd1 ;
  // action method slave_m_arvalid
  assign CAN_FIRE_slave_m_arvalid = 1'd1 ;
  assign WILL_FIRE_slave_m_arvalid = 1'd1 ;
  // value method slave_m_arready
  assign slave_arready = slave_xactor_f_rd_addr$FULL_N ;
  // value method slave_m_rvalid
  assign slave_rvalid = slave_xactor_f_rd_data$EMPTY_N ;
  // value method slave_m_rid
  assign slave_rid = slave_xactor_f_rd_data$D_OUT[82:67] ;
  // value method slave_m_rdata
  assign slave_rdata = slave_xactor_f_rd_data$D_OUT[66:3] ;
  // value method slave_m_rresp
  assign slave_rresp = slave_xactor_f_rd_data$D_OUT[2:1] ;
  // value method slave_m_rlast
  assign slave_rlast = slave_xactor_f_rd_data$D_OUT[0] ;
  // action method slave_m_rready
  assign CAN_FIRE_slave_m_rready = 1'd1 ;
  assign WILL_FIRE_slave_m_rready = 1'd1 ;
  // actionvalue method to_raw_mem_request_get
  assign to_raw_mem_request_get = f_raw_mem_reqs_rv[352:0] ;
  assign RDY_to_raw_mem_request_get = f_raw_mem_reqs_rv[353] ;
  assign CAN_FIRE_to_raw_mem_request_get = f_raw_mem_reqs_rv[353] ;
  assign WILL_FIRE_to_raw_mem_request_get = EN_to_raw_mem_request_get ;
  // action method to_raw_mem_response_put
  assign RDY_to_raw_mem_response_put = !f_raw_mem_rsps_rv$port1__read[256] ;
  assign CAN_FIRE_to_raw_mem_response_put =
	     !f_raw_mem_rsps_rv$port1__read[256] ;
  assign WILL_FIRE_to_raw_mem_response_put = EN_to_raw_mem_response_put ;
  // value method status
  assign status = rg_status ;
  // action method set_watch_tohost
  assign RDY_set_watch_tohost = 1'd1 ;
  assign CAN_FIRE_set_watch_tohost = 1'd1 ;
  assign WILL_FIRE_set_watch_tohost = EN_set_watch_tohost ;
  // submodule f_reset_reqs
  FIFO20 #(.guarded(1'd1)) f_reset_reqs(.RST(RST_N),
					.CLK(CLK),
					.ENQ(f_reset_reqs$ENQ),
					.DEQ(f_reset_reqs$DEQ),
					.CLR(f_reset_reqs$CLR),
					.FULL_N(f_reset_reqs$FULL_N),
					.EMPTY_N(f_reset_reqs$EMPTY_N));
  // submodule f_reset_rsps
  FIFO20 #(.guarded(1'd1)) f_reset_rsps(.RST(RST_N),
					.CLK(CLK),
					.ENQ(f_reset_rsps$ENQ),
					.DEQ(f_reset_rsps$DEQ),
					.CLR(f_reset_rsps$CLR),
					.FULL_N(f_reset_rsps$FULL_N),
					.EMPTY_N(f_reset_rsps$EMPTY_N));
  // submodule slave_xactor_f_rd_addr
  FIFO2 #(.width(32'd109), .guarded(1'd1)) slave_xactor_f_rd_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(slave_xactor_f_rd_addr$D_IN),
								  .ENQ(slave_xactor_f_rd_addr$ENQ),
								  .DEQ(slave_xactor_f_rd_addr$DEQ),
								  .CLR(slave_xactor_f_rd_addr$CLR),
								  .D_OUT(slave_xactor_f_rd_addr$D_OUT),
								  .FULL_N(slave_xactor_f_rd_addr$FULL_N),
								  .EMPTY_N(slave_xactor_f_rd_addr$EMPTY_N));
  // submodule slave_xactor_f_rd_data
  FIFO2 #(.width(32'd83), .guarded(1'd1)) slave_xactor_f_rd_data(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(slave_xactor_f_rd_data$D_IN),
								 .ENQ(slave_xactor_f_rd_data$ENQ),
								 .DEQ(slave_xactor_f_rd_data$DEQ),
								 .CLR(slave_xactor_f_rd_data$CLR),
								 .D_OUT(slave_xactor_f_rd_data$D_OUT),
								 .FULL_N(slave_xactor_f_rd_data$FULL_N),
								 .EMPTY_N(slave_xactor_f_rd_data$EMPTY_N));
  // submodule slave_xactor_f_wr_addr
  FIFO2 #(.width(32'd109), .guarded(1'd1)) slave_xactor_f_wr_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(slave_xactor_f_wr_addr$D_IN),
								  .ENQ(slave_xactor_f_wr_addr$ENQ),
								  .DEQ(slave_xactor_f_wr_addr$DEQ),
								  .CLR(slave_xactor_f_wr_addr$CLR),
								  .D_OUT(slave_xactor_f_wr_addr$D_OUT),
								  .FULL_N(slave_xactor_f_wr_addr$FULL_N),
								  .EMPTY_N(slave_xactor_f_wr_addr$EMPTY_N));
  // submodule slave_xactor_f_wr_data
  FIFO2 #(.width(32'd73), .guarded(1'd1)) slave_xactor_f_wr_data(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(slave_xactor_f_wr_data$D_IN),
								 .ENQ(slave_xactor_f_wr_data$ENQ),
								 .DEQ(slave_xactor_f_wr_data$DEQ),
								 .CLR(slave_xactor_f_wr_data$CLR),
								 .D_OUT(slave_xactor_f_wr_data$D_OUT),
								 .FULL_N(slave_xactor_f_wr_data$FULL_N),
								 .EMPTY_N(slave_xactor_f_wr_data$EMPTY_N));
  // submodule slave_xactor_f_wr_resp
  FIFO2 #(.width(32'd18), .guarded(1'd1)) slave_xactor_f_wr_resp(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(slave_xactor_f_wr_resp$D_IN),
								 .ENQ(slave_xactor_f_wr_resp$ENQ),
								 .DEQ(slave_xactor_f_wr_resp$DEQ),
								 .CLR(slave_xactor_f_wr_resp$CLR),
								 .D_OUT(slave_xactor_f_wr_resp$D_OUT),
								 .FULL_N(slave_xactor_f_wr_resp$FULL_N),
								 .EMPTY_N(slave_xactor_f_wr_resp$EMPTY_N));
  // rule RL_rl_reset_reload_cache
  assign CAN_FIRE_RL_rl_reset_reload_cache =
	     !f_raw_mem_reqs_rv$port1__read[353] && rg_state == 2'd1 ;
  assign WILL_FIRE_RL_rl_reset_reload_cache =
	     CAN_FIRE_RL_rl_reset_reload_cache ;
  // rule RL_rl_writeback_dirty_idle
  assign CAN_FIRE_RL_rl_writeback_dirty_idle =
	     !f_raw_mem_reqs_rv$port1__read[353] && rg_state == 2'd3 &&
	     !f_reqs_rv[182] &&
	     !rg_cached_clean ;
  assign WILL_FIRE_RL_rl_writeback_dirty_idle =
	     CAN_FIRE_RL_rl_writeback_dirty_idle ;
  // rule RL_rl_writeback_dirty
  assign CAN_FIRE_RL_rl_writeback_dirty =
	     !f_raw_mem_reqs_rv$port1__read[353] && f_reqs_rv[182] &&
	     rg_state_EQ_3_3_AND_f_reqs_rv_port0__read__2_B_ETC___d130 &&
	     !rg_cached_raw_mem_addr_0_EQ_0_CONCAT_f_reqs_rv_ETC___d134 &&
	     !rg_cached_clean ;
  assign WILL_FIRE_RL_rl_writeback_dirty = CAN_FIRE_RL_rl_writeback_dirty ;
  // rule RL_rl_miss_clean_req
  assign CAN_FIRE_RL_rl_miss_clean_req =
	     f_reqs_rv[182] && !f_raw_mem_reqs_rv$port1__read[353] &&
	     rg_state_EQ_3_3_AND_f_reqs_rv_port0__read__2_B_ETC___d130 &&
	     !rg_cached_raw_mem_addr_0_EQ_0_CONCAT_f_reqs_rv_ETC___d134 &&
	     rg_cached_clean ;
  assign WILL_FIRE_RL_rl_miss_clean_req =
	     CAN_FIRE_RL_rl_miss_clean_req &&
	     !WILL_FIRE_RL_rl_external_reset &&
	     !EN_set_addr_map ;
  // rule RL_rl_reload
  assign CAN_FIRE_RL_rl_reload = f_raw_mem_rsps_rv[256] && rg_state == 2'd2 ;
  assign WILL_FIRE_RL_rl_reload = CAN_FIRE_RL_rl_reload ;
  // rule RL_rl_process_rd_req
  assign CAN_FIRE_RL_rl_process_rd_req =
	     f_reqs_rv[182] && slave_xactor_f_rd_data$FULL_N &&
	     rg_state_EQ_3_3_AND_f_reqs_rv_port0__read__2_B_ETC___d130 &&
	     rg_cached_raw_mem_addr_0_EQ_0_CONCAT_f_reqs_rv_ETC___d134 &&
	     !f_reqs_rv[181] ;
  assign WILL_FIRE_RL_rl_process_rd_req = CAN_FIRE_RL_rl_process_rd_req ;
  // rule RL_rl_process_wr_req
  assign CAN_FIRE_RL_rl_process_wr_req =
	     f_reqs_rv[182] && slave_xactor_f_wr_resp$FULL_N &&
	     rg_state_EQ_3_3_AND_f_reqs_rv_port0__read__2_B_ETC___d130 &&
	     rg_cached_raw_mem_addr_0_EQ_0_CONCAT_f_reqs_rv_ETC___d134 &&
	     f_reqs_rv[181] ;
  assign WILL_FIRE_RL_rl_process_wr_req = CAN_FIRE_RL_rl_process_wr_req ;
  // rule RL_rl_invalid_rd_address
  assign CAN_FIRE_RL_rl_invalid_rd_address =
	     f_reqs_rv[182] && slave_xactor_f_rd_data$FULL_N &&
	     rg_state_EQ_3_3_AND_NOT_f_reqs_rv_port0__read__ETC___d283 &&
	     !f_reqs_rv[181] ;
  assign WILL_FIRE_RL_rl_invalid_rd_address =
	     CAN_FIRE_RL_rl_invalid_rd_address ;
  // rule RL_rl_invalid_wr_address
  assign CAN_FIRE_RL_rl_invalid_wr_address =
	     f_reqs_rv[182] && slave_xactor_f_wr_resp$FULL_N &&
	     rg_state_EQ_3_3_AND_NOT_f_reqs_rv_port0__read__ETC___d283 &&
	     f_reqs_rv[181] ;
  assign WILL_FIRE_RL_rl_invalid_wr_address =
	     CAN_FIRE_RL_rl_invalid_wr_address ;
  // rule RL_rl_merge_rd_req
  assign CAN_FIRE_RL_rl_merge_rd_req =
	     slave_xactor_f_rd_addr$EMPTY_N && !f_reqs_rv$port1__read[182] ;
  assign WILL_FIRE_RL_rl_merge_rd_req = CAN_FIRE_RL_rl_merge_rd_req ;
  // rule RL_rl_merge_wr_req
  assign CAN_FIRE_RL_rl_merge_wr_req =
	     !f_reqs_rv$port1__read[182] && slave_xactor_f_wr_addr$EMPTY_N &&
	     slave_xactor_f_wr_data$EMPTY_N ;
  assign WILL_FIRE_RL_rl_merge_wr_req =
	     CAN_FIRE_RL_rl_merge_wr_req && !WILL_FIRE_RL_rl_merge_rd_req ;
  // rule RL_rl_power_on_reset
  assign CAN_FIRE_RL_rl_power_on_reset = rg_state == 2'd0 ;
  assign WILL_FIRE_RL_rl_power_on_reset = CAN_FIRE_RL_rl_power_on_reset ;
  // rule RL_rl_external_reset
  assign CAN_FIRE_RL_rl_external_reset =
	     f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N && rg_state == 2'd3 ;
  assign WILL_FIRE_RL_rl_external_reset = CAN_FIRE_RL_rl_external_reset ;
  // inputs to muxes for submodule ports
  assign MUX_f_raw_mem_reqs_rv$port1__write_1__SEL_1 =
	     WILL_FIRE_RL_rl_writeback_dirty ||
	     WILL_FIRE_RL_rl_writeback_dirty_idle ;
  assign MUX_rg_state$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_external_reset ||
	     WILL_FIRE_RL_rl_power_on_reset ;
  assign MUX_rg_state$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_miss_clean_req ||
	     WILL_FIRE_RL_rl_reset_reload_cache ;
  assign MUX_f_raw_mem_reqs_rv$port1__write_1__VAL_1 =
	     { 34'h3FFFFFFFF,
	       rg_cached_raw_mem_addr,
	       rg_cached_raw_mem_word } ;
  assign MUX_f_raw_mem_reqs_rv$port1__write_1__VAL_3 =
	     { 34'h2FFFFFFFF,
	       req_raw_mem_addr__h3183,
	       256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA } ;
  assign MUX_f_reqs_rv$port1__write_1__VAL_1 =
	     { 2'd2, slave_xactor_f_rd_addr$D_OUT, 72'hAAAAAAAAAAAAAAAAAA } ;
  assign MUX_f_reqs_rv$port1__write_1__VAL_2 =
	     { 2'd3,
	       slave_xactor_f_wr_addr$D_OUT,
	       slave_xactor_f_wr_data$D_OUT[8:1],
	       slave_xactor_f_wr_data$D_OUT[72:9] } ;
  assign MUX_rg_cached_raw_mem_word$write_1__VAL_1 =
	     { (f_reqs_rv[105:104] == 2'd3) ?
		 updated_word64__h5801 :
		 rg_cached_raw_mem_word[255:192],
	       (f_reqs_rv[105:104] == 2'd2) ?
		 updated_word64__h5801 :
		 rg_cached_raw_mem_word[191:128],
	       (f_reqs_rv[105:104] == 2'd1) ?
		 updated_word64__h5801 :
		 rg_cached_raw_mem_word[127:64],
	       (f_reqs_rv[105:104] == 2'd0) ?
		 updated_word64__h5801 :
		 rg_cached_raw_mem_word[63:0] } ;
  assign MUX_slave_xactor_f_rd_data$enq_1__VAL_1 =
	     { f_reqs_rv[180:165], rdata__h4995, 3'd1 } ;
  assign MUX_slave_xactor_f_rd_data$enq_1__VAL_2 =
	     { f_reqs_rv[180:101], 3'd5 } ;
  assign MUX_slave_xactor_f_wr_resp$enq_1__VAL_1 =
	     { f_reqs_rv[180:165], 2'd0 } ;
  assign MUX_slave_xactor_f_wr_resp$enq_1__VAL_2 =
	     { f_reqs_rv[180:165], 2'd2 } ;
  // inlined wires
  assign f_reqs_rv$EN_port0__write =
	     WILL_FIRE_RL_rl_invalid_wr_address ||
	     WILL_FIRE_RL_rl_invalid_rd_address ||
	     WILL_FIRE_RL_rl_process_wr_req ||
	     WILL_FIRE_RL_rl_process_rd_req ;
  assign f_reqs_rv$port1__read =
	     f_reqs_rv$EN_port0__write ?
	       183'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA :
	       f_reqs_rv ;
  assign f_reqs_rv$EN_port1__write =
	     WILL_FIRE_RL_rl_merge_rd_req || WILL_FIRE_RL_rl_merge_wr_req ;
  assign f_reqs_rv$port1__write_1 =
	     WILL_FIRE_RL_rl_merge_rd_req ?
	       MUX_f_reqs_rv$port1__write_1__VAL_1 :
	       MUX_f_reqs_rv$port1__write_1__VAL_2 ;
  assign f_reqs_rv$port2__read =
	     f_reqs_rv$EN_port1__write ?
	       f_reqs_rv$port1__write_1 :
	       f_reqs_rv$port1__read ;
  assign f_raw_mem_reqs_rv$port1__read =
	     EN_to_raw_mem_request_get ?
	       354'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA :
	       f_raw_mem_reqs_rv ;
  assign f_raw_mem_reqs_rv$EN_port1__write =
	     WILL_FIRE_RL_rl_writeback_dirty ||
	     WILL_FIRE_RL_rl_writeback_dirty_idle ||
	     WILL_FIRE_RL_rl_reset_reload_cache ||
	     WILL_FIRE_RL_rl_miss_clean_req ;
  always@(MUX_f_raw_mem_reqs_rv$port1__write_1__SEL_1 or
	  MUX_f_raw_mem_reqs_rv$port1__write_1__VAL_1 or
	  WILL_FIRE_RL_rl_reset_reload_cache or
	  WILL_FIRE_RL_rl_miss_clean_req or
	  MUX_f_raw_mem_reqs_rv$port1__write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_f_raw_mem_reqs_rv$port1__write_1__SEL_1:
	  f_raw_mem_reqs_rv$port1__write_1 =
	      MUX_f_raw_mem_reqs_rv$port1__write_1__VAL_1;
      WILL_FIRE_RL_rl_reset_reload_cache:
	  f_raw_mem_reqs_rv$port1__write_1 =
	      354'h2FFFFFFFF0000000000000000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
      WILL_FIRE_RL_rl_miss_clean_req:
	  f_raw_mem_reqs_rv$port1__write_1 =
	      MUX_f_raw_mem_reqs_rv$port1__write_1__VAL_3;
      default: f_raw_mem_reqs_rv$port1__write_1 =
		   354'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign f_raw_mem_reqs_rv$port2__read =
	     f_raw_mem_reqs_rv$EN_port1__write ?
	       f_raw_mem_reqs_rv$port1__write_1 :
	       f_raw_mem_reqs_rv$port1__read ;
  assign f_raw_mem_reqs_rv$port3__read =
	     MUX_rg_state$write_1__SEL_1 ?
	       354'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA :
	       f_raw_mem_reqs_rv$port2__read ;
  assign f_raw_mem_rsps_rv$port1__read =
	     CAN_FIRE_RL_rl_reload ?
	       257'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA :
	       f_raw_mem_rsps_rv ;
  assign f_raw_mem_rsps_rv$port1__write_1 =
	     { 1'd1, to_raw_mem_response_put } ;
  assign f_raw_mem_rsps_rv$port2__read =
	     EN_to_raw_mem_response_put ?
	       f_raw_mem_rsps_rv$port1__write_1 :
	       f_raw_mem_rsps_rv$port1__read ;
  assign f_raw_mem_rsps_rv$port3__read =
	     MUX_rg_state$write_1__SEL_1 ?
	       257'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA :
	       f_raw_mem_rsps_rv$port2__read ;
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = 4'h0 ;
  assign cfg_verbosity$EN = 1'b0 ;
  // register f_raw_mem_reqs_rv
  assign f_raw_mem_reqs_rv$D_IN = f_raw_mem_reqs_rv$port3__read ;
  assign f_raw_mem_reqs_rv$EN = 1'b1 ;
  // register f_raw_mem_rsps_rv
  assign f_raw_mem_rsps_rv$D_IN = f_raw_mem_rsps_rv$port3__read ;
  assign f_raw_mem_rsps_rv$EN = 1'b1 ;
  // register f_reqs_rv
  assign f_reqs_rv$D_IN = f_reqs_rv$port2__read ;
  assign f_reqs_rv$EN = 1'b1 ;
  // register rg_addr_base
  assign rg_addr_base$D_IN = set_addr_map_addr_base ;
  assign rg_addr_base$EN = EN_set_addr_map ;
  // register rg_addr_lim
  assign rg_addr_lim$D_IN = set_addr_map_addr_lim ;
  assign rg_addr_lim$EN = EN_set_addr_map ;
  // register rg_cached_clean
  assign rg_cached_clean$D_IN = !WILL_FIRE_RL_rl_process_wr_req ;
  assign rg_cached_clean$EN =
	     WILL_FIRE_RL_rl_process_wr_req || WILL_FIRE_RL_rl_reload ||
	     WILL_FIRE_RL_rl_writeback_dirty ||
	     WILL_FIRE_RL_rl_writeback_dirty_idle ;
  // register rg_cached_raw_mem_addr
  assign rg_cached_raw_mem_addr$D_IN =
	     WILL_FIRE_RL_rl_miss_clean_req ?
	       req_raw_mem_addr__h3183 :
	       64'd0 ;
  assign rg_cached_raw_mem_addr$EN = MUX_rg_state$write_1__SEL_2 ;
  // register rg_cached_raw_mem_word
  assign rg_cached_raw_mem_word$D_IN =
	     WILL_FIRE_RL_rl_process_wr_req ?
	       MUX_rg_cached_raw_mem_word$write_1__VAL_1 :
	       f_raw_mem_rsps_rv[255:0] ;
  assign rg_cached_raw_mem_word$EN =
	     WILL_FIRE_RL_rl_process_wr_req || WILL_FIRE_RL_rl_reload ;
  // register rg_state
  always@(MUX_rg_state$write_1__SEL_1 or
	  MUX_rg_state$write_1__SEL_2 or WILL_FIRE_RL_rl_reload)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rg_state$write_1__SEL_1: rg_state$D_IN = 2'd1;
      MUX_rg_state$write_1__SEL_2: rg_state$D_IN = 2'd2;
      WILL_FIRE_RL_rl_reload: rg_state$D_IN = 2'd3;
      default: rg_state$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign rg_state$EN =
	     WILL_FIRE_RL_rl_external_reset ||
	     WILL_FIRE_RL_rl_power_on_reset ||
	     WILL_FIRE_RL_rl_miss_clean_req ||
	     WILL_FIRE_RL_rl_reset_reload_cache ||
	     WILL_FIRE_RL_rl_reload ;
  // register rg_status
  assign rg_status$D_IN =
	     (WILL_FIRE_RL_rl_external_reset ||
	      WILL_FIRE_RL_rl_power_on_reset) ?
	       8'd0 :
	       8'd1 ;
  assign rg_status$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     rg_watch_tohost_36_AND_f_reqs_rv_port0__read___ETC___d242 ||
	     WILL_FIRE_RL_rl_external_reset ||
	     WILL_FIRE_RL_rl_power_on_reset ;
  // register rg_tohost_addr
  assign rg_tohost_addr$D_IN = set_watch_tohost_tohost_addr ;
  assign rg_tohost_addr$EN = EN_set_watch_tohost ;
  // register rg_watch_tohost
  assign rg_watch_tohost$D_IN = set_watch_tohost_watch_tohost ;
  assign rg_watch_tohost$EN = EN_set_watch_tohost ;
  // submodule f_reset_reqs
  assign f_reset_reqs$ENQ = EN_server_reset_request_put ;
  assign f_reset_reqs$DEQ = CAN_FIRE_RL_rl_external_reset ;
  assign f_reset_reqs$CLR = 1'b0 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$ENQ = CAN_FIRE_RL_rl_external_reset ;
  assign f_reset_rsps$DEQ = EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule slave_xactor_f_rd_addr
  assign slave_xactor_f_rd_addr$D_IN =
	     { slave_arid,
	       slave_araddr,
	       slave_arlen,
	       slave_arsize,
	       slave_arburst,
	       slave_arlock,
	       slave_arcache,
	       slave_arprot,
	       slave_arqos,
	       slave_arregion } ;
  assign slave_xactor_f_rd_addr$ENQ =
	     slave_arvalid && slave_xactor_f_rd_addr$FULL_N ;
  assign slave_xactor_f_rd_addr$DEQ = CAN_FIRE_RL_rl_merge_rd_req ;
  assign slave_xactor_f_rd_addr$CLR = MUX_rg_state$write_1__SEL_1 ;
  // submodule slave_xactor_f_rd_data
  assign slave_xactor_f_rd_data$D_IN =
	     WILL_FIRE_RL_rl_process_rd_req ?
	       MUX_slave_xactor_f_rd_data$enq_1__VAL_1 :
	       MUX_slave_xactor_f_rd_data$enq_1__VAL_2 ;
  assign slave_xactor_f_rd_data$ENQ =
	     WILL_FIRE_RL_rl_process_rd_req ||
	     WILL_FIRE_RL_rl_invalid_rd_address ;
  assign slave_xactor_f_rd_data$DEQ =
	     slave_rready && slave_xactor_f_rd_data$EMPTY_N ;
  assign slave_xactor_f_rd_data$CLR = MUX_rg_state$write_1__SEL_1 ;
  // submodule slave_xactor_f_wr_addr
  assign slave_xactor_f_wr_addr$D_IN =
	     { slave_awid,
	       slave_awaddr,
	       slave_awlen,
	       slave_awsize,
	       slave_awburst,
	       slave_awlock,
	       slave_awcache,
	       slave_awprot,
	       slave_awqos,
	       slave_awregion } ;
  assign slave_xactor_f_wr_addr$ENQ =
	     slave_awvalid && slave_xactor_f_wr_addr$FULL_N ;
  assign slave_xactor_f_wr_addr$DEQ = WILL_FIRE_RL_rl_merge_wr_req ;
  assign slave_xactor_f_wr_addr$CLR = MUX_rg_state$write_1__SEL_1 ;
  // submodule slave_xactor_f_wr_data
  assign slave_xactor_f_wr_data$D_IN =
	     { slave_wdata, slave_wstrb, slave_wlast } ;
  assign slave_xactor_f_wr_data$ENQ =
	     slave_wvalid && slave_xactor_f_wr_data$FULL_N ;
  assign slave_xactor_f_wr_data$DEQ = WILL_FIRE_RL_rl_merge_wr_req ;
  assign slave_xactor_f_wr_data$CLR = MUX_rg_state$write_1__SEL_1 ;
  // submodule slave_xactor_f_wr_resp
  assign slave_xactor_f_wr_resp$D_IN =
	     WILL_FIRE_RL_rl_process_wr_req ?
	       MUX_slave_xactor_f_wr_resp$enq_1__VAL_1 :
	       MUX_slave_xactor_f_wr_resp$enq_1__VAL_2 ;
  assign slave_xactor_f_wr_resp$ENQ =
	     WILL_FIRE_RL_rl_process_wr_req ||
	     WILL_FIRE_RL_rl_invalid_wr_address ;
  assign slave_xactor_f_wr_resp$DEQ =
	     slave_bready && slave_xactor_f_wr_resp$EMPTY_N ;
  assign slave_xactor_f_wr_resp$CLR = MUX_rg_state$write_1__SEL_1 ;
  // remaining internal signals
  assign NOT_cfg_verbosity_read_ULE_1___d5 = cfg_verbosity > 4'd1 ;
  assign NOT_cfg_verbosity_read_ULE_2_2___d33 = cfg_verbosity > 4'd2 ;
  assign NOT_f_reqs_rv_port0__read__2_BITS_92_TO_90_6_E_ETC___d278 =
	     f_reqs_rv[92:90] != 3'b0 &&
	     (f_reqs_rv[92:90] != 3'b001 || f_reqs_rv[101]) &&
	     (f_reqs_rv[92:90] != 3'b010 || f_reqs_rv[102:101] != 2'h0) &&
	     (f_reqs_rv[92:90] != 3'b011 || f_reqs_rv[103:101] != 3'h0) &&
	     (f_reqs_rv[92:90] != 3'b100 || f_reqs_rv[104:101] != 4'h0) &&
	     (f_reqs_rv[92:90] != 3'b101 || f_reqs_rv[105:101] != 5'h0) &&
	     (f_reqs_rv[92:90] != 3'b110 || f_reqs_rv[106:101] != 6'h0) &&
	     (f_reqs_rv[92:90] != 3'b111 || f_reqs_rv[107:101] != 7'h0) ;
  assign SEXT_f_reqs_rv_port0__read__2_BIT_64_13___d214 = {8{f_reqs_rv[64]}} ;
  assign SEXT_f_reqs_rv_port0__read__2_BIT_65_10___d211 = {8{f_reqs_rv[65]}} ;
  assign SEXT_f_reqs_rv_port0__read__2_BIT_66_06___d207 = {8{f_reqs_rv[66]}} ;
  assign SEXT_f_reqs_rv_port0__read__2_BIT_67_03___d204 = {8{f_reqs_rv[67]}} ;
  assign SEXT_f_reqs_rv_port0__read__2_BIT_68_99___d200 = {8{f_reqs_rv[68]}} ;
  assign SEXT_f_reqs_rv_port0__read__2_BIT_69_96___d197 = {8{f_reqs_rv[69]}} ;
  assign SEXT_f_reqs_rv_port0__read__2_BIT_70_92___d193 = {8{f_reqs_rv[70]}} ;
  assign SEXT_f_reqs_rv_port0__read__2_BIT_71_89___d190 = {8{f_reqs_rv[71]}} ;
  assign exit_value__h7815 = { 1'd0, f_reqs_rv[63:1] } ;
  assign f_reqs_rv_BITS_164_TO_101_MINUS_rg_addr_base__q1 =
	     f_reqs_rv[164:101] - rg_addr_base ;
  assign f_reqs_rv_port0__read__2_BITS_164_TO_101_24_UL_ETC___d127 =
	     f_reqs_rv[164:101] < rg_addr_lim ;
  assign f_reqs_rv_port0__read__2_BITS_92_TO_90_6_EQ_0b_ETC___d122 =
	     f_reqs_rv[92:90] == 3'b0 ||
	     f_reqs_rv[92:90] == 3'b001 && !f_reqs_rv[101] ||
	     f_reqs_rv[92:90] == 3'b010 && f_reqs_rv[102:101] == 2'h0 ||
	     f_reqs_rv[92:90] == 3'b011 && f_reqs_rv[103:101] == 3'h0 ||
	     f_reqs_rv[92:90] == 3'b100 && f_reqs_rv[104:101] == 4'h0 ||
	     f_reqs_rv[92:90] == 3'b101 && f_reqs_rv[105:101] == 5'h0 ||
	     f_reqs_rv[92:90] == 3'b110 && f_reqs_rv[106:101] == 6'h0 ||
	     f_reqs_rv[92:90] == 3'b111 && f_reqs_rv[107:101] == 7'h0 ;
  assign mask__h5800 =
	     { SEXT_f_reqs_rv_port0__read__2_BIT_71_89___d190,
	       SEXT_f_reqs_rv_port0__read__2_BIT_70_92___d193,
	       SEXT_f_reqs_rv_port0__read__2_BIT_69_96___d197,
	       SEXT_f_reqs_rv_port0__read__2_BIT_68_99___d200,
	       SEXT_f_reqs_rv_port0__read__2_BIT_67_03___d204,
	       SEXT_f_reqs_rv_port0__read__2_BIT_66_06___d207,
	       SEXT_f_reqs_rv_port0__read__2_BIT_65_10___d211,
	       SEXT_f_reqs_rv_port0__read__2_BIT_64_13___d214 } ;
  assign n__h4994 = { 3'd0, f_reqs_rv[105:104] } ;
  assign req_raw_mem_addr__h3183 =
	     { 5'd0,
	       f_reqs_rv_BITS_164_TO_101_MINUS_rg_addr_base__q1[63:5] } ;
  assign rg_addr_base_23_ULE_f_reqs_rv_port0__read__2_B_ETC___d125 =
	     rg_addr_base <= f_reqs_rv[164:101] ;
  assign rg_cached_raw_mem_addr_0_EQ_0_CONCAT_f_reqs_rv_ETC___d134 =
	     rg_cached_raw_mem_addr == req_raw_mem_addr__h3183 ;
  assign rg_state_EQ_3_3_AND_NOT_f_reqs_rv_port0__read__ETC___d283 =
	     rg_state == 2'd3 &&
	     (NOT_f_reqs_rv_port0__read__2_BITS_92_TO_90_6_E_ETC___d278 ||
	      !rg_addr_base_23_ULE_f_reqs_rv_port0__read__2_B_ETC___d125 ||
	      !f_reqs_rv_port0__read__2_BITS_164_TO_101_24_UL_ETC___d127) ;
  assign rg_state_EQ_3_3_AND_f_reqs_rv_port0__read__2_B_ETC___d130 =
	     rg_state == 2'd3 &&
	     f_reqs_rv_port0__read__2_BITS_92_TO_90_6_EQ_0b_ETC___d122 &&
	     rg_addr_base_23_ULE_f_reqs_rv_port0__read__2_B_ETC___d125 &&
	     f_reqs_rv_port0__read__2_BITS_164_TO_101_24_UL_ETC___d127 ;
  assign rg_watch_tohost_36_AND_f_reqs_rv_port0__read___ETC___d242 =
	     rg_watch_tohost && f_reqs_rv[164:101] == rg_tohost_addr &&
	     f_reqs_rv[63:0] != 64'd0 ;
  assign updated_word64__h5801 = x__h6183 | y__h6184 ;
  assign x__h6183 = word64_old__h5795 & y__h6185 ;
  assign y__h6184 = f_reqs_rv[63:0] & mask__h5800 ;
  assign y__h6185 =
	     { ~SEXT_f_reqs_rv_port0__read__2_BIT_71_89___d190,
	       ~SEXT_f_reqs_rv_port0__read__2_BIT_70_92___d193,
	       ~SEXT_f_reqs_rv_port0__read__2_BIT_69_96___d197,
	       ~SEXT_f_reqs_rv_port0__read__2_BIT_68_99___d200,
	       ~SEXT_f_reqs_rv_port0__read__2_BIT_67_03___d204,
	       ~SEXT_f_reqs_rv_port0__read__2_BIT_66_06___d207,
	       ~SEXT_f_reqs_rv_port0__read__2_BIT_65_10___d211,
	       ~SEXT_f_reqs_rv_port0__read__2_BIT_64_13___d214 } ;
  always@(f_reqs_rv or rg_cached_raw_mem_word)
  begin
    case (f_reqs_rv[105:104])
      2'd0: word64_old__h5795 = rg_cached_raw_mem_word[63:0];
      2'd1: word64_old__h5795 = rg_cached_raw_mem_word[127:64];
      2'd2: word64_old__h5795 = rg_cached_raw_mem_word[191:128];
      2'd3: word64_old__h5795 = rg_cached_raw_mem_word[255:192];
    endcase
  end
  always@(n__h4994 or rg_cached_raw_mem_word)
  begin
    case (n__h4994)
      5'd0: rdata__h4995 = rg_cached_raw_mem_word[63:0];
      5'd1: rdata__h4995 = rg_cached_raw_mem_word[127:64];
      5'd2: rdata__h4995 = rg_cached_raw_mem_word[191:128];
      5'd3: rdata__h4995 = rg_cached_raw_mem_word[255:192];
      default: rdata__h4995 = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	f_raw_mem_reqs_rv <= `BSV_ASSIGNMENT_DELAY
	    354'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	f_raw_mem_rsps_rv <= `BSV_ASSIGNMENT_DELAY
	    257'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	f_reqs_rv <= `BSV_ASSIGNMENT_DELAY
	    183'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	rg_state <= `BSV_ASSIGNMENT_DELAY 2'd0;
	rg_status <= `BSV_ASSIGNMENT_DELAY 8'd0;
	rg_tohost_addr <= `BSV_ASSIGNMENT_DELAY 64'h0000000080001000;
	rg_watch_tohost <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (cfg_verbosity$EN)
	  cfg_verbosity <= `BSV_ASSIGNMENT_DELAY cfg_verbosity$D_IN;
	if (f_raw_mem_reqs_rv$EN)
	  f_raw_mem_reqs_rv <= `BSV_ASSIGNMENT_DELAY f_raw_mem_reqs_rv$D_IN;
	if (f_raw_mem_rsps_rv$EN)
	  f_raw_mem_rsps_rv <= `BSV_ASSIGNMENT_DELAY f_raw_mem_rsps_rv$D_IN;
	if (f_reqs_rv$EN) f_reqs_rv <= `BSV_ASSIGNMENT_DELAY f_reqs_rv$D_IN;
	if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
	if (rg_status$EN) rg_status <= `BSV_ASSIGNMENT_DELAY rg_status$D_IN;
	if (rg_tohost_addr$EN)
	  rg_tohost_addr <= `BSV_ASSIGNMENT_DELAY rg_tohost_addr$D_IN;
	if (rg_watch_tohost$EN)
	  rg_watch_tohost <= `BSV_ASSIGNMENT_DELAY rg_watch_tohost$D_IN;
      end
    if (rg_addr_base$EN)
      rg_addr_base <= `BSV_ASSIGNMENT_DELAY rg_addr_base$D_IN;
    if (rg_addr_lim$EN) rg_addr_lim <= `BSV_ASSIGNMENT_DELAY rg_addr_lim$D_IN;
    if (rg_cached_clean$EN)
      rg_cached_clean <= `BSV_ASSIGNMENT_DELAY rg_cached_clean$D_IN;
    if (rg_cached_raw_mem_addr$EN)
      rg_cached_raw_mem_addr <= `BSV_ASSIGNMENT_DELAY
	  rg_cached_raw_mem_addr$D_IN;
    if (rg_cached_raw_mem_word$EN)
      rg_cached_raw_mem_word <= `BSV_ASSIGNMENT_DELAY
	  rg_cached_raw_mem_word$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cfg_verbosity = 4'hA;
    f_raw_mem_reqs_rv =
	354'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    f_raw_mem_rsps_rv =
	257'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    f_reqs_rv = 183'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    rg_addr_base = 64'hAAAAAAAAAAAAAAAA;
    rg_addr_lim = 64'hAAAAAAAAAAAAAAAA;
    rg_cached_clean = 1'h0;
    rg_cached_raw_mem_addr = 64'hAAAAAAAAAAAAAAAA;
    rg_cached_raw_mem_word =
	256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    rg_state = 2'h2;
    rg_status = 8'hAA;
    rg_tohost_addr = 64'hAAAAAAAAAAAAAAAA;
    rg_watch_tohost = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_reload_cache &&
	  NOT_cfg_verbosity_read_ULE_1___d5)
	begin
	  v__h2421 = $stime;
	  #0;
	end
    v__h2415 = v__h2421 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_reload_cache &&
	  NOT_cfg_verbosity_read_ULE_1___d5)
	$display("%0d: Mem_Controller.rl_reset_reload_cache => STATE_RELOADING",
		 v__h2415);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_dirty_idle &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	begin
	  v__h3358 = $stime;
	  #0;
	end
    v__h3352 = v__h3358 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_dirty_idle &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$display("%0d: Mem_Controller.rl_writeback_dirty_idle to raw addr 0x%0h",
		 v__h3352,
		 rg_cached_raw_mem_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_dirty &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	begin
	  v__h3854 = $stime;
	  #0;
	end
    v__h3848 = v__h3854 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_dirty &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$display("%0d: Mem_Controller.rl_writeback_dirty to raw addr 0x%0h",
		 v__h3848,
		 rg_cached_raw_mem_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_miss_clean_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	begin
	  v__h4335 = $stime;
	  #0;
	end
    v__h4329 = v__h4335 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_miss_clean_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$display("%0d: Mem_Controller.rl_miss_clean_req: read raw addr 0x%0h",
		 v__h4329,
		 req_raw_mem_addr__h3183);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reload && NOT_cfg_verbosity_read_ULE_2_2___d33)
	begin
	  v__h4624 = $stime;
	  #0;
	end
    v__h4618 = v__h4624 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reload && NOT_cfg_verbosity_read_ULE_2_2___d33)
	$display("%0d: Mem_Controller.rl_reload: raw addr 0x%0h",
		 v__h4618,
		 rg_cached_raw_mem_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reload && NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reload && NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", f_raw_mem_rsps_rv[255:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reload && NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	begin
	  v__h5340 = $stime;
	  #0;
	end
    v__h5334 = v__h5340 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$display("%0d: Mem_Controller.rl_process_rd_req: ", v__h5334);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("Req { ", "req_op: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("REQ_OP_RD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "id: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[180:165]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "addr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[164:101]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "len: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[100:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "size: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[92:90]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "burst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[89:88]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "lock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[87]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "cache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[86:83]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "prot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[82:80]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "qos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[79:76]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "region: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[75:72]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "user: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[71:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "data: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[63:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("     => ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[180:165]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", rdata__h4995);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", 2'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	begin
	  v__h7561 = $stime;
	  #0;
	end
    v__h7555 = v__h7561 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$display("%0d: Mem_Controller.rl_process_wr_req: ", v__h7555);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("Req { ", "req_op: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("REQ_OP_WR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "id: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[180:165]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "addr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[164:101]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "len: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[100:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "size: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[92:90]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "burst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[89:88]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "lock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[87]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "cache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[86:83]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "prot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[82:80]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "qos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[79:76]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "region: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[75:72]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "user: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[71:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "data: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[63:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("     => ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", f_reqs_rv[180:165]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", 2'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req && NOT_cfg_verbosity_read_ULE_1___d5)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  rg_watch_tohost_36_AND_f_reqs_rv_port0__read___ETC___d242)
	begin
	  v__h7769 = $stime;
	  #0;
	end
    v__h7763 = v__h7769 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  rg_watch_tohost_36_AND_f_reqs_rv_port0__read___ETC___d242)
	$display("%0d: Mem_Controller.rl_process_wr_req: addr 0x%0h (<tohost>) data 0x%0h",
		 v__h7763,
		 f_reqs_rv[164:101],
		 f_reqs_rv[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  rg_watch_tohost_36_AND_f_reqs_rv_port0__read___ETC___d242 &&
	  f_reqs_rv[63:1] == 63'd0)
	$display("PASS");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  rg_watch_tohost_36_AND_f_reqs_rv_port0__read___ETC___d242 &&
	  f_reqs_rv[63:1] != 63'd0)
	$display("FAIL %0d", exit_value__h7815);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	begin
	  v__h8282 = $stime;
	  #0;
	end
    v__h8276 = v__h8282 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("%0d: ERROR: Mem_Controller:", v__h8276);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address &&
	  NOT_f_reqs_rv_port0__read__2_BITS_92_TO_90_6_E_ETC___d278)
	$display(" read-addr is misaligned");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address &&
	  f_reqs_rv_port0__read__2_BITS_92_TO_90_6_EQ_0b_ETC___d122)
	$display(" read-addr is out of bounds");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$display("        rg_addr_base 0x%0h  rg_addr_lim 0x%0h",
		 rg_addr_base,
		 rg_addr_lim);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("Req { ", "req_op: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("REQ_OP_RD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "id: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[180:165]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "addr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[164:101]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "len: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[100:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "size: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[92:90]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "burst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[89:88]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "lock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("'h%h", f_reqs_rv[87]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "cache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[86:83]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "prot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[82:80]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "qos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[79:76]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "region: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[75:72]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "user: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[71:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "data: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[63:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("     => ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[180:165]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address)
	$write("'h%h", f_reqs_rv[164:101]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_rd_address) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	begin
	  v__h9085 = $stime;
	  #0;
	end
    v__h9079 = v__h9085 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("%0d: ERROR: Mem_Controller:", v__h9079);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address &&
	  NOT_f_reqs_rv_port0__read__2_BITS_92_TO_90_6_E_ETC___d278)
	$display(" write-addr is misaligned");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address &&
	  f_reqs_rv_port0__read__2_BITS_92_TO_90_6_EQ_0b_ETC___d122)
	$display(" write-addr is out of bounds");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$display("        rg_addr_base 0x%0h  rg_addr_lim 0x%0h",
		 rg_addr_base,
		 rg_addr_lim);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write("Req { ", "req_op: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write("REQ_OP_WR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "id: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[180:165]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "addr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[164:101]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "len: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[100:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "size: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[92:90]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "burst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[89:88]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "lock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write("'h%h", f_reqs_rv[87]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "cache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[86:83]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "prot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[82:80]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "qos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[79:76]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "region: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[75:72]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "user: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[71:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "data: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[63:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write("     => ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address)
	$write("'h%h", f_reqs_rv[180:165]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write("'h%h", 2'b10);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_invalid_wr_address) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_addr_map)
	begin
	  v__h9716 = $stime;
	  #0;
	end
    v__h9710 = v__h9716 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_addr_map)
	$display("%0d: Mem_Controller.set_addr_map: addr_base 0x%0h addr_lim 0x%0h",
		 v__h9710,
		 set_addr_map_addr_base,
		 set_addr_map_addr_lim);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	begin
	  v__h2728 = $stime;
	  #0;
	end
    v__h2722 = v__h2728 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$display("%0d: Mem_Controller.rl_merge_rd_req", v__h2722);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	begin
	  v__h3053 = $stime;
	  #0;
	end
    v__h3047 = v__h3053 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$display("%0d: Mem_Controller.rl_merge_wr_req", v__h3047);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33 &&
	  slave_xactor_f_wr_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33 &&
	  !slave_xactor_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  NOT_cfg_verbosity_read_ULE_2_2___d33)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_power_on_reset && NOT_cfg_verbosity_read_ULE_1___d5)
	begin
	  v__h1680 = $stime;
	  #0;
	end
    v__h1674 = v__h1680 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_power_on_reset && NOT_cfg_verbosity_read_ULE_1___d5)
	$display("%0d: Mem_Controller.rl_power_on_reset", v__h1674);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_external_reset && NOT_cfg_verbosity_read_ULE_1___d5)
	begin
	  v__h1988 = $stime;
	  #0;
	end
    v__h1982 = v__h1988 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_external_reset && NOT_cfg_verbosity_read_ULE_1___d5)
	$display("%0d: Mem_Controller.rl_external_reset => STATE_RESET_RELOAD_CACHE",
		 v__h1982);
  end
  // synopsys translate_on
endmodule