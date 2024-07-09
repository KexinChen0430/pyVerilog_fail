module outputs
  wire [63 : 0] axi4_slave_rdata;
  wire [15 : 0] axi4_slave_bid, axi4_slave_rid;
  wire [1 : 0] axi4_slave_bresp, axi4_slave_rresp;
  wire RDY_get_sw_interrupt_req_get,
       RDY_get_timer_interrupt_req_get,
       RDY_server_reset_request_put,
       RDY_server_reset_response_get,
       RDY_set_addr_map,
       axi4_slave_arready,
       axi4_slave_awready,
       axi4_slave_bvalid,
       axi4_slave_rlast,
       axi4_slave_rvalid,
       axi4_slave_wready,
       get_sw_interrupt_req_get,
       get_timer_interrupt_req_get;
  // inlined wires
  wire [63 : 0] crg_time$port0__write_1,
		crg_time$port1__write_1,
		crg_time$port2__read,
		crg_timecmp$port1__write_1,
		crg_timecmp$port2__read;
  wire crg_time$EN_port1__write, crg_timecmp$EN_port1__write;
  // register cfg_verbosity
  reg [3 : 0] cfg_verbosity;
  wire [3 : 0] cfg_verbosity$D_IN;
  wire cfg_verbosity$EN;
  // register crg_time
  reg [63 : 0] crg_time;
  wire [63 : 0] crg_time$D_IN;
  wire crg_time$EN;
  // register crg_timecmp
  reg [63 : 0] crg_timecmp;
  wire [63 : 0] crg_timecmp$D_IN;
  wire crg_timecmp$EN;
  // register rg_addr_base
  reg [63 : 0] rg_addr_base;
  wire [63 : 0] rg_addr_base$D_IN;
  wire rg_addr_base$EN;
  // register rg_addr_lim
  reg [63 : 0] rg_addr_lim;
  wire [63 : 0] rg_addr_lim$D_IN;
  wire rg_addr_lim$EN;
  // register rg_msip
  reg rg_msip;
  wire rg_msip$D_IN, rg_msip$EN;
  // register rg_mtip
  reg rg_mtip;
  wire rg_mtip$D_IN, rg_mtip$EN;
  // register rg_state
  reg rg_state;
  wire rg_state$D_IN, rg_state$EN;
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
  // ports of submodule f_sw_interrupt_req
  wire f_sw_interrupt_req$CLR,
       f_sw_interrupt_req$DEQ,
       f_sw_interrupt_req$D_IN,
       f_sw_interrupt_req$D_OUT,
       f_sw_interrupt_req$EMPTY_N,
       f_sw_interrupt_req$ENQ,
       f_sw_interrupt_req$FULL_N;
  // ports of submodule f_timer_interrupt_req
  wire f_timer_interrupt_req$CLR,
       f_timer_interrupt_req$DEQ,
       f_timer_interrupt_req$D_IN,
       f_timer_interrupt_req$D_OUT,
       f_timer_interrupt_req$EMPTY_N,
       f_timer_interrupt_req$ENQ,
       f_timer_interrupt_req$FULL_N;
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
  wire CAN_FIRE_RL_rl_compare,
       CAN_FIRE_RL_rl_process_rd_req,
       CAN_FIRE_RL_rl_process_wr_req,
       CAN_FIRE_RL_rl_reset,
       CAN_FIRE_RL_rl_soft_reset,
       CAN_FIRE_RL_rl_tick_timer,
       CAN_FIRE_axi4_slave_m_arvalid,
       CAN_FIRE_axi4_slave_m_awvalid,
       CAN_FIRE_axi4_slave_m_bready,
       CAN_FIRE_axi4_slave_m_rready,
       CAN_FIRE_axi4_slave_m_wvalid,
       CAN_FIRE_get_sw_interrupt_req_get,
       CAN_FIRE_get_timer_interrupt_req_get,
       CAN_FIRE_server_reset_request_put,
       CAN_FIRE_server_reset_response_get,
       CAN_FIRE_set_addr_map,
       WILL_FIRE_RL_rl_compare,
       WILL_FIRE_RL_rl_process_rd_req,
       WILL_FIRE_RL_rl_process_wr_req,
       WILL_FIRE_RL_rl_reset,
       WILL_FIRE_RL_rl_soft_reset,
       WILL_FIRE_RL_rl_tick_timer,
       WILL_FIRE_axi4_slave_m_arvalid,
       WILL_FIRE_axi4_slave_m_awvalid,
       WILL_FIRE_axi4_slave_m_bready,
       WILL_FIRE_axi4_slave_m_rready,
       WILL_FIRE_axi4_slave_m_wvalid,
       WILL_FIRE_get_sw_interrupt_req_get,
       WILL_FIRE_get_timer_interrupt_req_get,
       WILL_FIRE_server_reset_request_put,
       WILL_FIRE_server_reset_response_get,
       WILL_FIRE_set_addr_map;
  // inputs to muxes for submodule ports
  wire MUX_crg_time$port1__write_1__SEL_1,
       MUX_crg_timecmp$port1__write_1__SEL_1,
       MUX_rg_msip$write_1__SEL_1,
       MUX_rg_state$write_1__SEL_1,
       MUX_rg_state$write_1__SEL_2;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h10027;
  reg [31 : 0] v__h10149;
  reg [31 : 0] v__h1782;
  reg [31 : 0] v__h2189;
  reg [31 : 0] v__h2371;
  reg [31 : 0] v__h2576;
  reg [31 : 0] v__h2806;
  reg [31 : 0] v__h2021;
  reg [31 : 0] v__h3092;
  reg [31 : 0] v__h3325;
  reg [31 : 0] v__h8872;
  reg [31 : 0] v__h9092;
  reg [31 : 0] v__h9435;
  reg [31 : 0] v__h9541;
  reg [31 : 0] v__h9662;
  reg [31 : 0] v__h1776;
  reg [31 : 0] v__h2015;
  reg [31 : 0] v__h2183;
  reg [31 : 0] v__h2365;
  reg [31 : 0] v__h2570;
  reg [31 : 0] v__h2800;
  reg [31 : 0] v__h3086;
  reg [31 : 0] v__h3319;
  reg [31 : 0] v__h8866;
  reg [31 : 0] v__h9086;
  reg [31 : 0] v__h9429;
  reg [31 : 0] v__h9535;
  reg [31 : 0] v__h9656;
  reg [31 : 0] v__h10021;
  reg [31 : 0] v__h10143;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] _theResult___fst__h2502;
  reg [1 : 0] _theResult___snd__h2503, v__h3476;
  wire [63 : 0] byte_addr__h2323,
		byte_addr__h3287,
		crg_timecmp_port1__read__50_AND_INV_SEXT_slave_ETC___d189,
		mask__h3723,
		new_time__h4999,
		new_timecmp__h3698,
		old_time__h7565,
		rdata___1__h2498,
		x__h2685,
		x__h3734,
		x__h5035,
		y__h3735,
		y__h3736;
  wire [7 : 0] SEXT_slave_xactor_f_wr_data_first__06_BIT_1_75___d176,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_2_72___d173,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_3_68___d169,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_4_65___d166,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_5_61___d162,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_6_58___d159,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_7_54___d155,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_8_51___d152;
  wire [1 : 0] rresp__h2484, v__h3291;
  wire NOT_cfg_verbosity_read_ULE_1_0___d31,
       NOT_crg_time_port0__read__3_ULT_crg_timecmp_po_ETC___d24,
       rg_msip_7_EQ_slave_xactor_f_wr_data_first__06__ETC___d108,
       slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53,
       slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102,
       slave_xactor_f_wr_addr_i_notEmpty__7_AND_slave_ETC___d115;
  // action method server_reset_request_put
  assign RDY_server_reset_request_put = f_reset_reqs$FULL_N ;
  assign CAN_FIRE_server_reset_request_put = f_reset_reqs$FULL_N ;
  assign WILL_FIRE_server_reset_request_put = EN_server_reset_request_put ;
  // action method server_reset_response_get
  assign RDY_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_server_reset_response_get = EN_server_reset_response_get ;
  // action method set_addr_map
  assign RDY_set_addr_map = rg_state ;
  assign CAN_FIRE_set_addr_map = rg_state ;
  assign WILL_FIRE_set_addr_map = EN_set_addr_map ;
  // action method axi4_slave_m_awvalid
  assign CAN_FIRE_axi4_slave_m_awvalid = 1'd1 ;
  assign WILL_FIRE_axi4_slave_m_awvalid = 1'd1 ;
  // value method axi4_slave_m_awready
  assign axi4_slave_awready = slave_xactor_f_wr_addr$FULL_N ;
  // action method axi4_slave_m_wvalid
  assign CAN_FIRE_axi4_slave_m_wvalid = 1'd1 ;
  assign WILL_FIRE_axi4_slave_m_wvalid = 1'd1 ;
  // value method axi4_slave_m_wready
  assign axi4_slave_wready = slave_xactor_f_wr_data$FULL_N ;
  // value method axi4_slave_m_bvalid
  assign axi4_slave_bvalid = slave_xactor_f_wr_resp$EMPTY_N ;
  // value method axi4_slave_m_bid
  assign axi4_slave_bid = slave_xactor_f_wr_resp$D_OUT[17:2] ;
  // value method axi4_slave_m_bresp
  assign axi4_slave_bresp = slave_xactor_f_wr_resp$D_OUT[1:0] ;
  // action method axi4_slave_m_bready
  assign CAN_FIRE_axi4_slave_m_bready = 1'd1 ;
  assign WILL_FIRE_axi4_slave_m_bready = 1'd1 ;
  // action method axi4_slave_m_arvalid
  assign CAN_FIRE_axi4_slave_m_arvalid = 1'd1 ;
  assign WILL_FIRE_axi4_slave_m_arvalid = 1'd1 ;
  // value method axi4_slave_m_arready
  assign axi4_slave_arready = slave_xactor_f_rd_addr$FULL_N ;
  // value method axi4_slave_m_rvalid
  assign axi4_slave_rvalid = slave_xactor_f_rd_data$EMPTY_N ;
  // value method axi4_slave_m_rid
  assign axi4_slave_rid = slave_xactor_f_rd_data$D_OUT[82:67] ;
  // value method axi4_slave_m_rdata
  assign axi4_slave_rdata = slave_xactor_f_rd_data$D_OUT[66:3] ;
  // value method axi4_slave_m_rresp
  assign axi4_slave_rresp = slave_xactor_f_rd_data$D_OUT[2:1] ;
  // value method axi4_slave_m_rlast
  assign axi4_slave_rlast = slave_xactor_f_rd_data$D_OUT[0] ;
  // action method axi4_slave_m_rready
  assign CAN_FIRE_axi4_slave_m_rready = 1'd1 ;
  assign WILL_FIRE_axi4_slave_m_rready = 1'd1 ;
  // actionvalue method get_timer_interrupt_req_get
  assign get_timer_interrupt_req_get = f_timer_interrupt_req$D_OUT ;
  assign RDY_get_timer_interrupt_req_get = f_timer_interrupt_req$EMPTY_N ;
  assign CAN_FIRE_get_timer_interrupt_req_get =
	     f_timer_interrupt_req$EMPTY_N ;
  assign WILL_FIRE_get_timer_interrupt_req_get =
	     EN_get_timer_interrupt_req_get ;
  // actionvalue method get_sw_interrupt_req_get
  assign get_sw_interrupt_req_get = f_sw_interrupt_req$D_OUT ;
  assign RDY_get_sw_interrupt_req_get = f_sw_interrupt_req$EMPTY_N ;
  assign CAN_FIRE_get_sw_interrupt_req_get = f_sw_interrupt_req$EMPTY_N ;
  assign WILL_FIRE_get_sw_interrupt_req_get = EN_get_sw_interrupt_req_get ;
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
  // submodule f_sw_interrupt_req
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_sw_interrupt_req(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(f_sw_interrupt_req$D_IN),
							    .ENQ(f_sw_interrupt_req$ENQ),
							    .DEQ(f_sw_interrupt_req$DEQ),
							    .CLR(f_sw_interrupt_req$CLR),
							    .D_OUT(f_sw_interrupt_req$D_OUT),
							    .FULL_N(f_sw_interrupt_req$FULL_N),
							    .EMPTY_N(f_sw_interrupt_req$EMPTY_N));
  // submodule f_timer_interrupt_req
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_timer_interrupt_req(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(f_timer_interrupt_req$D_IN),
							       .ENQ(f_timer_interrupt_req$ENQ),
							       .DEQ(f_timer_interrupt_req$DEQ),
							       .CLR(f_timer_interrupt_req$CLR),
							       .D_OUT(f_timer_interrupt_req$D_OUT),
							       .FULL_N(f_timer_interrupt_req$FULL_N),
							       .EMPTY_N(f_timer_interrupt_req$EMPTY_N));
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
  // rule RL_rl_reset
  assign CAN_FIRE_RL_rl_reset = MUX_rg_state$write_1__SEL_2 ;
  assign WILL_FIRE_RL_rl_reset = MUX_rg_state$write_1__SEL_2 ;
  // rule RL_rl_process_rd_req
  assign CAN_FIRE_RL_rl_process_rd_req =
	     slave_xactor_f_rd_addr$EMPTY_N &&
	     slave_xactor_f_rd_data$FULL_N &&
	     rg_state &&
	     !f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_process_rd_req = CAN_FIRE_RL_rl_process_rd_req ;
  // rule RL_rl_compare
  assign CAN_FIRE_RL_rl_compare =
	     f_timer_interrupt_req$FULL_N && rg_state &&
	     rg_mtip !=
	     NOT_crg_time_port0__read__3_ULT_crg_timecmp_po_ETC___d24 &&
	     !f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_compare = CAN_FIRE_RL_rl_compare ;
  // rule RL_rl_tick_timer
  assign CAN_FIRE_RL_rl_tick_timer =
	     rg_state && crg_time != 64'hFFFFFFFFFFFFFFFF &&
	     !f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_tick_timer = CAN_FIRE_RL_rl_tick_timer ;
  // rule RL_rl_process_wr_req
  assign CAN_FIRE_RL_rl_process_wr_req =
	     slave_xactor_f_wr_addr_i_notEmpty__7_AND_slave_ETC___d115 &&
	     rg_state &&
	     !f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_process_wr_req =
	     CAN_FIRE_RL_rl_process_wr_req && !WILL_FIRE_RL_rl_compare ;
  // rule RL_rl_soft_reset
  assign CAN_FIRE_RL_rl_soft_reset = f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_soft_reset = MUX_rg_state$write_1__SEL_1 ;
  // inputs to muxes for submodule ports
  assign MUX_crg_time$port1__write_1__SEL_1 =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	     (byte_addr__h3287 == 64'h000000000000BFF8 ||
	      byte_addr__h3287 == 64'h000000000000BFFC) ;
  assign MUX_crg_timecmp$port1__write_1__SEL_1 =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	     (byte_addr__h3287 == 64'h0000000000004000 ||
	      byte_addr__h3287 == 64'h0000000000004004) ;
  assign MUX_rg_msip$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	     byte_addr__h3287 == 64'h0 &&
	     !rg_msip_7_EQ_slave_xactor_f_wr_data_first__06__ETC___d108 ;
  assign MUX_rg_state$write_1__SEL_1 =
	     f_reset_reqs$EMPTY_N && !WILL_FIRE_RL_rl_reset ;
  assign MUX_rg_state$write_1__SEL_2 =
	     f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N && !rg_state ;
  // inlined wires
  assign crg_time$port0__write_1 = crg_time + 64'd1 ;
  assign crg_time$EN_port1__write =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	     (byte_addr__h3287 == 64'h000000000000BFF8 ||
	      byte_addr__h3287 == 64'h000000000000BFFC) ||
	     WILL_FIRE_RL_rl_reset ;
  assign crg_time$port1__write_1 =
	     MUX_crg_time$port1__write_1__SEL_1 ? new_time__h4999 : 64'd1 ;
  assign crg_time$port2__read =
	     crg_time$EN_port1__write ?
	       crg_time$port1__write_1 :
	       old_time__h7565 ;
  assign crg_timecmp$EN_port1__write =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	     (byte_addr__h3287 == 64'h0000000000004000 ||
	      byte_addr__h3287 == 64'h0000000000004004) ||
	     WILL_FIRE_RL_rl_reset ;
  assign crg_timecmp$port1__write_1 =
	     MUX_crg_timecmp$port1__write_1__SEL_1 ?
	       new_timecmp__h3698 :
	       64'd0 ;
  assign crg_timecmp$port2__read =
	     crg_timecmp$EN_port1__write ?
	       crg_timecmp$port1__write_1 :
	       crg_timecmp ;
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = 4'h0 ;
  assign cfg_verbosity$EN = 1'b0 ;
  // register crg_time
  assign crg_time$D_IN = crg_time$port2__read ;
  assign crg_time$EN = 1'b1 ;
  // register crg_timecmp
  assign crg_timecmp$D_IN = crg_timecmp$port2__read ;
  assign crg_timecmp$EN = 1'b1 ;
  // register rg_addr_base
  assign rg_addr_base$D_IN = set_addr_map_addr_base ;
  assign rg_addr_base$EN = EN_set_addr_map ;
  // register rg_addr_lim
  assign rg_addr_lim$D_IN = set_addr_map_addr_lim ;
  assign rg_addr_lim$EN = EN_set_addr_map ;
  // register rg_msip
  assign rg_msip$D_IN =
	     MUX_rg_msip$write_1__SEL_1 && slave_xactor_f_wr_data$D_OUT[9] ;
  assign rg_msip$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	     byte_addr__h3287 == 64'h0 &&
	     !rg_msip_7_EQ_slave_xactor_f_wr_data_first__06__ETC___d108 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_mtip
  assign rg_mtip$D_IN =
	     !WILL_FIRE_RL_rl_compare ||
	     NOT_crg_time_port0__read__3_ULT_crg_timecmp_po_ETC___d24 ;
  assign rg_mtip$EN = WILL_FIRE_RL_rl_compare || WILL_FIRE_RL_rl_reset ;
  // register rg_state
  assign rg_state$D_IN = !WILL_FIRE_RL_rl_soft_reset ;
  assign rg_state$EN = WILL_FIRE_RL_rl_soft_reset || WILL_FIRE_RL_rl_reset ;
  // submodule f_reset_reqs
  assign f_reset_reqs$ENQ = EN_server_reset_request_put ;
  assign f_reset_reqs$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign f_reset_reqs$CLR = 1'b0 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$ENQ = MUX_rg_state$write_1__SEL_2 ;
  assign f_reset_rsps$DEQ = EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule f_sw_interrupt_req
  assign f_sw_interrupt_req$D_IN = slave_xactor_f_wr_data$D_OUT[9] ;
  assign f_sw_interrupt_req$ENQ = MUX_rg_msip$write_1__SEL_1 ;
  assign f_sw_interrupt_req$DEQ = EN_get_sw_interrupt_req_get ;
  assign f_sw_interrupt_req$CLR = MUX_rg_state$write_1__SEL_2 ;
  // submodule f_timer_interrupt_req
  assign f_timer_interrupt_req$D_IN =
	     NOT_crg_time_port0__read__3_ULT_crg_timecmp_po_ETC___d24 ;
  assign f_timer_interrupt_req$ENQ = CAN_FIRE_RL_rl_compare ;
  assign f_timer_interrupt_req$DEQ = EN_get_timer_interrupt_req_get ;
  assign f_timer_interrupt_req$CLR = MUX_rg_state$write_1__SEL_2 ;
  // submodule slave_xactor_f_rd_addr
  assign slave_xactor_f_rd_addr$D_IN =
	     { axi4_slave_arid,
	       axi4_slave_araddr,
	       axi4_slave_arlen,
	       axi4_slave_arsize,
	       axi4_slave_arburst,
	       axi4_slave_arlock,
	       axi4_slave_arcache,
	       axi4_slave_arprot,
	       axi4_slave_arqos,
	       axi4_slave_arregion } ;
  assign slave_xactor_f_rd_addr$ENQ =
	     axi4_slave_arvalid && slave_xactor_f_rd_addr$FULL_N ;
  assign slave_xactor_f_rd_addr$DEQ = CAN_FIRE_RL_rl_process_rd_req ;
  assign slave_xactor_f_rd_addr$CLR = MUX_rg_state$write_1__SEL_2 ;
  // submodule slave_xactor_f_rd_data
  assign slave_xactor_f_rd_data$D_IN =
	     { slave_xactor_f_rd_addr$D_OUT[108:93],
	       x__h2685,
	       rresp__h2484,
	       1'd1 } ;
  assign slave_xactor_f_rd_data$ENQ = CAN_FIRE_RL_rl_process_rd_req ;
  assign slave_xactor_f_rd_data$DEQ =
	     axi4_slave_rready && slave_xactor_f_rd_data$EMPTY_N ;
  assign slave_xactor_f_rd_data$CLR = MUX_rg_state$write_1__SEL_2 ;
  // submodule slave_xactor_f_wr_addr
  assign slave_xactor_f_wr_addr$D_IN =
	     { axi4_slave_awid,
	       axi4_slave_awaddr,
	       axi4_slave_awlen,
	       axi4_slave_awsize,
	       axi4_slave_awburst,
	       axi4_slave_awlock,
	       axi4_slave_awcache,
	       axi4_slave_awprot,
	       axi4_slave_awqos,
	       axi4_slave_awregion } ;
  assign slave_xactor_f_wr_addr$ENQ =
	     axi4_slave_awvalid && slave_xactor_f_wr_addr$FULL_N ;
  assign slave_xactor_f_wr_addr$DEQ = WILL_FIRE_RL_rl_process_wr_req ;
  assign slave_xactor_f_wr_addr$CLR = MUX_rg_state$write_1__SEL_2 ;
  // submodule slave_xactor_f_wr_data
  assign slave_xactor_f_wr_data$D_IN =
	     { axi4_slave_wdata, axi4_slave_wstrb, axi4_slave_wlast } ;
  assign slave_xactor_f_wr_data$ENQ =
	     axi4_slave_wvalid && slave_xactor_f_wr_data$FULL_N ;
  assign slave_xactor_f_wr_data$DEQ = WILL_FIRE_RL_rl_process_wr_req ;
  assign slave_xactor_f_wr_data$CLR = MUX_rg_state$write_1__SEL_2 ;
  // submodule slave_xactor_f_wr_resp
  assign slave_xactor_f_wr_resp$D_IN =
	     { slave_xactor_f_wr_addr$D_OUT[108:93], v__h3291 } ;
  assign slave_xactor_f_wr_resp$ENQ = WILL_FIRE_RL_rl_process_wr_req ;
  assign slave_xactor_f_wr_resp$DEQ =
	     axi4_slave_bready && slave_xactor_f_wr_resp$EMPTY_N ;
  assign slave_xactor_f_wr_resp$CLR = MUX_rg_state$write_1__SEL_2 ;
  // remaining internal signals
  assign NOT_cfg_verbosity_read_ULE_1_0___d31 = cfg_verbosity > 4'd1 ;
  assign NOT_crg_time_port0__read__3_ULT_crg_timecmp_po_ETC___d24 =
	     crg_time >= crg_timecmp ;
  assign SEXT_slave_xactor_f_wr_data_first__06_BIT_1_75___d176 =
	     {8{slave_xactor_f_wr_data$D_OUT[1]}} ;
  assign SEXT_slave_xactor_f_wr_data_first__06_BIT_2_72___d173 =
	     {8{slave_xactor_f_wr_data$D_OUT[2]}} ;
  assign SEXT_slave_xactor_f_wr_data_first__06_BIT_3_68___d169 =
	     {8{slave_xactor_f_wr_data$D_OUT[3]}} ;
  assign SEXT_slave_xactor_f_wr_data_first__06_BIT_4_65___d166 =
	     {8{slave_xactor_f_wr_data$D_OUT[4]}} ;
  assign SEXT_slave_xactor_f_wr_data_first__06_BIT_5_61___d162 =
	     {8{slave_xactor_f_wr_data$D_OUT[5]}} ;
  assign SEXT_slave_xactor_f_wr_data_first__06_BIT_6_58___d159 =
	     {8{slave_xactor_f_wr_data$D_OUT[6]}} ;
  assign SEXT_slave_xactor_f_wr_data_first__06_BIT_7_54___d155 =
	     {8{slave_xactor_f_wr_data$D_OUT[7]}} ;
  assign SEXT_slave_xactor_f_wr_data_first__06_BIT_8_51___d152 =
	     {8{slave_xactor_f_wr_data$D_OUT[8]}} ;
  assign byte_addr__h2323 =
	     slave_xactor_f_rd_addr$D_OUT[92:29] - rg_addr_base ;
  assign byte_addr__h3287 =
	     slave_xactor_f_wr_addr$D_OUT[92:29] - rg_addr_base ;
  assign crg_timecmp_port1__read__50_AND_INV_SEXT_slave_ETC___d189 =
	     new_timecmp__h3698 - old_time__h7565 ;
  assign mask__h3723 =
	     { SEXT_slave_xactor_f_wr_data_first__06_BIT_8_51___d152,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_7_54___d155,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_6_58___d159,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_5_61___d162,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_4_65___d166,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_3_68___d169,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_2_72___d173,
	       SEXT_slave_xactor_f_wr_data_first__06_BIT_1_75___d176 } ;
  assign new_time__h4999 = x__h5035 | y__h3735 ;
  assign new_timecmp__h3698 = x__h3734 | y__h3735 ;
  assign old_time__h7565 =
	     CAN_FIRE_RL_rl_tick_timer ? crg_time$port0__write_1 : crg_time ;
  assign rdata___1__h2498 = { 63'd0, rg_msip } ;
  assign rg_msip_7_EQ_slave_xactor_f_wr_data_first__06__ETC___d108 =
	     rg_msip == slave_xactor_f_wr_data$D_OUT[9] ;
  assign rresp__h2484 =
	     slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ?
	       2'b11 :
	       _theResult___snd__h2503 ;
  assign slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 =
	     slave_xactor_f_rd_addr$D_OUT[92:29] < rg_addr_base ;
  assign slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 =
	     slave_xactor_f_wr_addr$D_OUT[92:29] < rg_addr_base ;
  assign slave_xactor_f_wr_addr_i_notEmpty__7_AND_slave_ETC___d115 =
	     slave_xactor_f_wr_addr$EMPTY_N &&
	     slave_xactor_f_wr_data$EMPTY_N &&
	     slave_xactor_f_wr_resp$FULL_N &&
	     (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	      byte_addr__h3287 != 64'h0 ||
	      rg_msip_7_EQ_slave_xactor_f_wr_data_first__06__ETC___d108 ||
	      f_sw_interrupt_req$FULL_N) ;
  assign v__h3291 =
	     slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ?
	       2'b11 :
	       v__h3476 ;
  assign x__h2685 =
	     slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ?
	       64'd0 :
	       _theResult___fst__h2502 ;
  assign x__h3734 = crg_timecmp & y__h3736 ;
  assign x__h5035 = old_time__h7565 & y__h3736 ;
  assign y__h3735 = slave_xactor_f_wr_data$D_OUT[72:9] & mask__h3723 ;
  assign y__h3736 =
	     { ~SEXT_slave_xactor_f_wr_data_first__06_BIT_8_51___d152,
	       ~SEXT_slave_xactor_f_wr_data_first__06_BIT_7_54___d155,
	       ~SEXT_slave_xactor_f_wr_data_first__06_BIT_6_58___d159,
	       ~SEXT_slave_xactor_f_wr_data_first__06_BIT_5_61___d162,
	       ~SEXT_slave_xactor_f_wr_data_first__06_BIT_4_65___d166,
	       ~SEXT_slave_xactor_f_wr_data_first__06_BIT_3_68___d169,
	       ~SEXT_slave_xactor_f_wr_data_first__06_BIT_2_72___d173,
	       ~SEXT_slave_xactor_f_wr_data_first__06_BIT_1_75___d176 } ;
  always@(byte_addr__h2323)
  begin
    case (byte_addr__h2323)
      64'h0,
      64'h0000000000000004,
      64'h0000000000004000,
      64'h0000000000004004,
      64'h000000000000BFF8,
      64'h000000000000BFFC:
	  _theResult___snd__h2503 = 2'b0;
      default: _theResult___snd__h2503 = 2'b11;
    endcase
  end
  always@(byte_addr__h2323 or rdata___1__h2498 or crg_timecmp or crg_time)
  begin
    case (byte_addr__h2323)
      64'h0: _theResult___fst__h2502 = rdata___1__h2498;
      64'h0000000000000004: _theResult___fst__h2502 = 64'd0;
      64'h0000000000004000, 64'h0000000000004004:
	  _theResult___fst__h2502 = crg_timecmp;
      64'h000000000000BFF8, 64'h000000000000BFFC:
	  _theResult___fst__h2502 = crg_time;
      default: _theResult___fst__h2502 = 64'd0;
    endcase
  end
  always@(byte_addr__h3287)
  begin
    case (byte_addr__h3287)
      64'h0,
      64'h0000000000000004,
      64'h0000000000004000,
      64'h0000000000004004,
      64'h000000000000BFF8,
      64'h000000000000BFFC:
	  v__h3476 = 2'b0;
      default: v__h3476 = 2'b11;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	crg_time <= `BSV_ASSIGNMENT_DELAY 64'd1;
	crg_timecmp <= `BSV_ASSIGNMENT_DELAY 64'd0;
	rg_mtip <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rg_state <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (cfg_verbosity$EN)
	  cfg_verbosity <= `BSV_ASSIGNMENT_DELAY cfg_verbosity$D_IN;
	if (crg_time$EN) crg_time <= `BSV_ASSIGNMENT_DELAY crg_time$D_IN;
	if (crg_timecmp$EN)
	  crg_timecmp <= `BSV_ASSIGNMENT_DELAY crg_timecmp$D_IN;
	if (rg_mtip$EN) rg_mtip <= `BSV_ASSIGNMENT_DELAY rg_mtip$D_IN;
	if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
      end
    if (rg_addr_base$EN)
      rg_addr_base <= `BSV_ASSIGNMENT_DELAY rg_addr_base$D_IN;
    if (rg_addr_lim$EN) rg_addr_lim <= `BSV_ASSIGNMENT_DELAY rg_addr_lim$D_IN;
    if (rg_msip$EN) rg_msip <= `BSV_ASSIGNMENT_DELAY rg_msip$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cfg_verbosity = 4'hA;
    crg_time = 64'hAAAAAAAAAAAAAAAA;
    crg_timecmp = 64'hAAAAAAAAAAAAAAAA;
    rg_addr_base = 64'hAAAAAAAAAAAAAAAA;
    rg_addr_lim = 64'hAAAAAAAAAAAAAAAA;
    rg_msip = 1'h0;
    rg_mtip = 1'h0;
    rg_state = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_get_timer_interrupt_req_get &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	begin
	  v__h10027 = $stime;
	  #0;
	end
    v__h10021 = v__h10027 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_get_timer_interrupt_req_get &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("%0d: Near_Mem_IO_AXI4: get_timer_interrupt_req: %x",
		 v__h10021,
		 f_timer_interrupt_req$D_OUT);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_get_sw_interrupt_req_get && NOT_cfg_verbosity_read_ULE_1_0___d31)
	begin
	  v__h10149 = $stime;
	  #0;
	end
    v__h10143 = v__h10149 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_get_sw_interrupt_req_get && NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("%0d: Near_Mem_IO_AXI4: get_sw_interrupt_req: %x",
		 v__h10143,
		 f_sw_interrupt_req$D_OUT);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && cfg_verbosity != 4'd0)
	begin
	  v__h1782 = $stime;
	  #0;
	end
    v__h1776 = v__h1782 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && cfg_verbosity != 4'd0)
	$display("%0d: Near_Mem_IO_AXI4.rl_reset", v__h1776);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	begin
	  v__h2189 = $stime;
	  #0;
	end
    v__h2183 = v__h2189 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("%0d: Near_Mem_IO_AXI4.rl_process_rd_req: rg_mtip = %0d",
		 v__h2183,
		 rg_mtip);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	begin
	  v__h2371 = $stime;
	  #0;
	end
    v__h2365 = v__h2371 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$display("%0d: ERROR: Near_Mem_IO_AXI4.rl_process_rd_req: unrecognized addr",
		 v__h2365);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	begin
	  v__h2576 = $stime;
	  #0;
	end
    v__h2570 = v__h2576 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$display("%0d: ERROR: Near_Mem_IO_AXI4.rl_process_rd_req: unrecognized addr",
		 v__h2570);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__1_BITS_92_TO_29__ETC___d53 ||
	   byte_addr__h2323 != 64'h0 &&
	   byte_addr__h2323 != 64'h0000000000004000 &&
	   byte_addr__h2323 != 64'h000000000000BFF8 &&
	   byte_addr__h2323 != 64'h0000000000000004 &&
	   byte_addr__h2323 != 64'h0000000000004004 &&
	   byte_addr__h2323 != 64'h000000000000BFFC))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	begin
	  v__h2806 = $stime;
	  #0;
	end
    v__h2800 = v__h2806 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("%0d: Near_Mem_IO_AXI4.rl_process_rd_req", v__h2800);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", x__h2685);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", rresp__h2484);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_compare && NOT_cfg_verbosity_read_ULE_1_0___d31)
	begin
	  v__h2021 = $stime;
	  #0;
	end
    v__h2015 = v__h2021 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_compare && NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("%0d: Near_Mem_IO_AXI4.rl_compare: new MTIP = %0d, time = %0d, timecmp = %0d",
		 v__h2015,
		 NOT_crg_time_port0__read__3_ULT_crg_timecmp_po_ETC___d24,
		 crg_time,
		 crg_timecmp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	begin
	  v__h3092 = $stime;
	  #0;
	end
    v__h3086 = v__h3092 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("%0d: Near_Mem_IO_AXI4.rl_process_wr_req: rg_mtip = %0d",
		 v__h3086,
		 rg_mtip);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31 &&
	  slave_xactor_f_wr_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31 &&
	  !slave_xactor_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	begin
	  v__h3325 = $stime;
	  #0;
	end
    v__h3319 = v__h3325 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$display("%0d: ERROR: Near_Mem_IO_AXI4.rl_process_wr_req: unrecognized addr",
		 v__h3319);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  slave_xactor_f_wr_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  !slave_xactor_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0 &&
	  !rg_msip_7_EQ_slave_xactor_f_wr_data_first__06__ETC___d108 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("    new MSIP = %0d", slave_xactor_f_wr_data$D_OUT[9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0000000000004000 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("    Writing MTIMECMP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0000000000004000 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        old MTIMECMP         = 0x%0h", crg_timecmp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0000000000004000 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        new MTIMECMP         = 0x%0h", new_timecmp__h3698);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0000000000004000 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        cur MTIME            = 0x%0h", old_time__h7565);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0000000000004000 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        new MTIMECMP - MTIME = 0x%0h",
		 crg_timecmp_port1__read__50_AND_INV_SEXT_slave_ETC___d189);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h000000000000BFF8 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("    Writing MTIME");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h000000000000BFF8 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        old MTIME = 0x%0h", old_time__h7565);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h000000000000BFF8 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        new MTIME = 0x%0h", new_time__h4999);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0000000000004004 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("    Writing MTIMECMP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0000000000004004 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        old MTIMECMP         = 0x%0h", crg_timecmp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0000000000004004 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        new MTIMECMP         = 0x%0h", new_timecmp__h3698);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0000000000004004 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        cur MTIME            = 0x%0h", old_time__h7565);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h0000000000004004 &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        new MTIMECMP - MTIME = 0x%0h",
		 crg_timecmp_port1__read__50_AND_INV_SEXT_slave_ETC___d189);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h000000000000BFFC &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("    Writing MTIME");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h000000000000BFFC &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        old MTIME = 0x%0h", old_time__h7565);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 &&
	  byte_addr__h3287 == 64'h000000000000BFFC &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("        new MTIME = 0x%0h", new_time__h4999);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	begin
	  v__h8872 = $stime;
	  #0;
	end
    v__h8866 = v__h8872 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$display("%0d: ERROR: Near_Mem_IO_AXI4.rl_process_wr_req: unrecognized addr",
		 v__h8866);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC) &&
	  slave_xactor_f_wr_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC) &&
	  !slave_xactor_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__00_BITS_92_TO_29_ETC___d102 ||
	   byte_addr__h3287 != 64'h0 &&
	   byte_addr__h3287 != 64'h0000000000004000 &&
	   byte_addr__h3287 != 64'h000000000000BFF8 &&
	   byte_addr__h3287 != 64'h0000000000000004 &&
	   byte_addr__h3287 != 64'h0000000000004004 &&
	   byte_addr__h3287 != 64'h000000000000BFFC))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	begin
	  v__h9092 = $stime;
	  #0;
	end
    v__h9086 = v__h9092 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$display("%0d: Near_Mem_IO.AXI4.rl_process_wr_req", v__h9086);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31 &&
	  slave_xactor_f_wr_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31 &&
	  !slave_xactor_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", v__h3291);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_0___d31)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_addr_map && set_addr_map_addr_base[1:0] != 2'd0)
	begin
	  v__h9435 = $stime;
	  #0;
	end
    v__h9429 = v__h9435 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_addr_map && set_addr_map_addr_base[1:0] != 2'd0)
	$display("%0d: WARNING: Near_Mem_IO_AXI4.set_addr_map: addr_base 0x%0h is not 4-Byte-aligned",
		 v__h9429,
		 set_addr_map_addr_base);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_addr_map && set_addr_map_addr_lim[1:0] != 2'd0)
	begin
	  v__h9541 = $stime;
	  #0;
	end
    v__h9535 = v__h9541 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_addr_map && set_addr_map_addr_lim[1:0] != 2'd0)
	$display("%0d: WARNING: Near_Mem_IO_AXI4.set_addr_map: addr_lim 0x%0h is not 4-Byte-aligned",
		 v__h9535,
		 set_addr_map_addr_lim);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_addr_map)
	begin
	  v__h9662 = $stime;
	  #0;
	end
    v__h9656 = v__h9662 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_addr_map)
	$display("%0d: Near_Mem_IO_AXI4.set_addr_map: addr_base 0x%0h addr_lim 0x%0h",
		 v__h9656,
		 set_addr_map_addr_base,
		 set_addr_map_addr_lim);
  end
  // synopsys translate_on
endmodule