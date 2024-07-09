module outputs
  wire [63 : 0] slave_rdata;
  wire [15 : 0] slave_bid, slave_rid;
  wire [7 : 0] get_to_console_get;
  wire [1 : 0] slave_bresp, slave_rresp;
  wire RDY_get_to_console_get,
       RDY_put_from_console_put,
       RDY_server_reset_request_put,
       RDY_server_reset_response_get,
       RDY_set_addr_map,
       intr,
       slave_arready,
       slave_awready,
       slave_bvalid,
       slave_rlast,
       slave_rvalid,
       slave_wready;
  // register rg_addr_base
  reg [63 : 0] rg_addr_base;
  wire [63 : 0] rg_addr_base$D_IN;
  wire rg_addr_base$EN;
  // register rg_addr_lim
  reg [63 : 0] rg_addr_lim;
  wire [63 : 0] rg_addr_lim$D_IN;
  wire rg_addr_lim$EN;
  // register rg_dll
  reg [7 : 0] rg_dll;
  wire [7 : 0] rg_dll$D_IN;
  wire rg_dll$EN;
  // register rg_dlm
  reg [7 : 0] rg_dlm;
  wire [7 : 0] rg_dlm$D_IN;
  wire rg_dlm$EN;
  // register rg_fcr
  reg [7 : 0] rg_fcr;
  wire [7 : 0] rg_fcr$D_IN;
  wire rg_fcr$EN;
  // register rg_ier
  reg [7 : 0] rg_ier;
  wire [7 : 0] rg_ier$D_IN;
  wire rg_ier$EN;
  // register rg_lcr
  reg [7 : 0] rg_lcr;
  wire [7 : 0] rg_lcr$D_IN;
  wire rg_lcr$EN;
  // register rg_lsr
  reg [7 : 0] rg_lsr;
  reg [7 : 0] rg_lsr$D_IN;
  wire rg_lsr$EN;
  // register rg_mcr
  reg [7 : 0] rg_mcr;
  wire [7 : 0] rg_mcr$D_IN;
  wire rg_mcr$EN;
  // register rg_msr
  reg [7 : 0] rg_msr;
  wire [7 : 0] rg_msr$D_IN;
  wire rg_msr$EN;
  // register rg_rbr
  reg [7 : 0] rg_rbr;
  wire [7 : 0] rg_rbr$D_IN;
  wire rg_rbr$EN;
  // register rg_scr
  reg [7 : 0] rg_scr;
  wire [7 : 0] rg_scr$D_IN;
  wire rg_scr$EN;
  // register rg_state
  reg rg_state;
  wire rg_state$D_IN, rg_state$EN;
  // register rg_thr
  reg [7 : 0] rg_thr;
  wire [7 : 0] rg_thr$D_IN;
  wire rg_thr$EN;
  // ports of submodule f_from_console
  wire [7 : 0] f_from_console$D_IN, f_from_console$D_OUT;
  wire f_from_console$CLR,
       f_from_console$DEQ,
       f_from_console$EMPTY_N,
       f_from_console$ENQ,
       f_from_console$FULL_N;
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
  // ports of submodule f_to_console
  wire [7 : 0] f_to_console$D_IN, f_to_console$D_OUT;
  wire f_to_console$CLR,
       f_to_console$DEQ,
       f_to_console$EMPTY_N,
       f_to_console$ENQ,
       f_to_console$FULL_N;
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
  wire CAN_FIRE_RL_rl_process_rd_req,
       CAN_FIRE_RL_rl_process_wr_req,
       CAN_FIRE_RL_rl_receive,
       CAN_FIRE_RL_rl_reset,
       CAN_FIRE_get_to_console_get,
       CAN_FIRE_put_from_console_put,
       CAN_FIRE_server_reset_request_put,
       CAN_FIRE_server_reset_response_get,
       CAN_FIRE_set_addr_map,
       CAN_FIRE_slave_m_arvalid,
       CAN_FIRE_slave_m_awvalid,
       CAN_FIRE_slave_m_bready,
       CAN_FIRE_slave_m_rready,
       CAN_FIRE_slave_m_wvalid,
       WILL_FIRE_RL_rl_process_rd_req,
       WILL_FIRE_RL_rl_process_wr_req,
       WILL_FIRE_RL_rl_receive,
       WILL_FIRE_RL_rl_reset,
       WILL_FIRE_get_to_console_get,
       WILL_FIRE_put_from_console_put,
       WILL_FIRE_server_reset_request_put,
       WILL_FIRE_server_reset_response_get,
       WILL_FIRE_set_addr_map,
       WILL_FIRE_slave_m_arvalid,
       WILL_FIRE_slave_m_awvalid,
       WILL_FIRE_slave_m_bready,
       WILL_FIRE_slave_m_rready,
       WILL_FIRE_slave_m_wvalid;
  // inputs to muxes for submodule ports
  wire [7 : 0] MUX_rg_lsr$write_1__VAL_2, MUX_rg_lsr$write_1__VAL_3;
  wire MUX_rg_lsr$write_1__SEL_3;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h1949;
  reg [31 : 0] v__h2931;
  reg [31 : 0] v__h2359;
  reg [31 : 0] v__h2184;
  reg [31 : 0] v__h3512;
  reg [31 : 0] v__h5200;
  reg [31 : 0] v__h3896;
  reg [31 : 0] v__h3726;
  reg [31 : 0] v__h5797;
  reg [31 : 0] v__h5903;
  reg [31 : 0] v__h1943;
  reg [31 : 0] v__h2178;
  reg [31 : 0] v__h2353;
  reg [31 : 0] v__h2925;
  reg [31 : 0] v__h3506;
  reg [31 : 0] v__h3720;
  reg [31 : 0] v__h3890;
  reg [31 : 0] v__h5194;
  reg [31 : 0] v__h5791;
  reg [31 : 0] v__h5897;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] x__h4160;
  reg [7 : 0] y_avValue_snd__h3113;
  wire [63 : 0] offset__h1888,
		offset__h3463,
		rdata___1__h3256,
		rdata__h3204,
		rdr_rdata__h3231,
		result__h4174,
		result__h4204,
		result__h4231,
		result__h4258,
		result__h4285,
		result__h4312,
		result__h4339,
		result__h4366,
		result__h4393,
		result__h4420,
		result__h4447,
		result__h4474,
		result__h4501,
		result__h4528,
		slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30,
		slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149;
  wire [7 : 0] fn_iir__h1320,
	       rdata_byte__h3203,
	       y_avValue_snd__h3126,
	       y_avValue_snd__h3139,
	       y_avValue_snd__h3154,
	       y_avValue_snd__h3168;
  wire [1 : 0] rdr_rresp__h3232,
	       v__h3665,
	       v__h3827,
	       v__h4086,
	       y_avValue_fst__h3167,
	       y_avValue_fst__h3181,
	       y_avValue_fst__h3195;
  wire NOT_slave_xactor_f_rd_addr_first_BITS_92_TO_29_ETC___d43,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d185,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d251,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d256,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d260,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d264,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d268,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d272,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d276,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d309,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d315,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d322,
       NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d328,
       slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12,
       slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14,
       slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145,
       slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146,
       slave_xactor_f_wr_resp_i_notFull__42_AND_slave_ETC___d165;
  // action method server_reset_request_put
  assign RDY_server_reset_request_put = f_reset_reqs$FULL_N ;
  assign CAN_FIRE_server_reset_request_put = f_reset_reqs$FULL_N ;
  assign WILL_FIRE_server_reset_request_put = EN_server_reset_request_put ;
  // action method server_reset_response_get
  assign RDY_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_server_reset_response_get = EN_server_reset_response_get ;
  // action method set_addr_map
  assign RDY_set_addr_map = 1'd1 ;
  assign CAN_FIRE_set_addr_map = 1'd1 ;
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
  // actionvalue method get_to_console_get
  assign get_to_console_get = f_to_console$D_OUT ;
  assign RDY_get_to_console_get = f_to_console$EMPTY_N ;
  assign CAN_FIRE_get_to_console_get = f_to_console$EMPTY_N ;
  assign WILL_FIRE_get_to_console_get = EN_get_to_console_get ;
  // action method put_from_console_put
  assign RDY_put_from_console_put = f_from_console$FULL_N ;
  assign CAN_FIRE_put_from_console_put = f_from_console$FULL_N ;
  assign WILL_FIRE_put_from_console_put = EN_put_from_console_put ;
  // value method intr
  assign intr = !fn_iir__h1320[0] ;
  // submodule f_from_console
  FIFO2 #(.width(32'd8), .guarded(1'd1)) f_from_console(.RST(RST_N),
							.CLK(CLK),
							.D_IN(f_from_console$D_IN),
							.ENQ(f_from_console$ENQ),
							.DEQ(f_from_console$DEQ),
							.CLR(f_from_console$CLR),
							.D_OUT(f_from_console$D_OUT),
							.FULL_N(f_from_console$FULL_N),
							.EMPTY_N(f_from_console$EMPTY_N));
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
  // submodule f_to_console
  FIFO2 #(.width(32'd8), .guarded(1'd1)) f_to_console(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(f_to_console$D_IN),
						      .ENQ(f_to_console$ENQ),
						      .DEQ(f_to_console$DEQ),
						      .CLR(f_to_console$CLR),
						      .D_OUT(f_to_console$D_OUT),
						      .FULL_N(f_to_console$FULL_N),
						      .EMPTY_N(f_to_console$EMPTY_N));
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
  // rule RL_rl_process_rd_req
  assign CAN_FIRE_RL_rl_process_rd_req =
	     slave_xactor_f_rd_addr$EMPTY_N &&
	     slave_xactor_f_rd_data$FULL_N &&
	     rg_state ;
  assign WILL_FIRE_RL_rl_process_rd_req =
	     CAN_FIRE_RL_rl_process_rd_req && !WILL_FIRE_RL_rl_receive ;
  // rule RL_rl_process_wr_req
  assign CAN_FIRE_RL_rl_process_wr_req =
	     slave_xactor_f_wr_addr$EMPTY_N &&
	     slave_xactor_f_wr_data$EMPTY_N &&
	     slave_xactor_f_wr_resp_i_notFull__42_AND_slave_ETC___d165 &&
	     rg_state ;
  assign WILL_FIRE_RL_rl_process_wr_req = CAN_FIRE_RL_rl_process_wr_req ;
  // rule RL_rl_receive
  assign CAN_FIRE_RL_rl_receive = f_from_console$EMPTY_N && !rg_lsr[0] ;
  assign WILL_FIRE_RL_rl_receive = CAN_FIRE_RL_rl_receive ;
  // rule RL_rl_reset
  assign CAN_FIRE_RL_rl_reset = f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
  assign WILL_FIRE_RL_rl_reset = CAN_FIRE_RL_rl_reset ;
  // inputs to muxes for submodule ports
  assign MUX_rg_lsr$write_1__SEL_3 =
	     WILL_FIRE_RL_rl_process_rd_req &&
	     NOT_slave_xactor_f_rd_addr_first_BITS_92_TO_29_ETC___d43 ;
  assign MUX_rg_lsr$write_1__VAL_2 = { rg_lsr[7:1], 1'd1 } ;
  assign MUX_rg_lsr$write_1__VAL_3 = { rg_lsr[7:1], 1'd0 } ;
  // register rg_addr_base
  assign rg_addr_base$D_IN = set_addr_map_addr_base ;
  assign rg_addr_base$EN = EN_set_addr_map ;
  // register rg_addr_lim
  assign rg_addr_lim$D_IN = set_addr_map_addr_lim ;
  assign rg_addr_lim$EN = EN_set_addr_map ;
  // register rg_dll
  assign rg_dll$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4160[7:0] ;
  assign rg_dll$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d251 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_dlm
  assign rg_dlm$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4160[7:0] ;
  assign rg_dlm$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d260 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_fcr
  assign rg_fcr$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4160[7:0] ;
  assign rg_fcr$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d264 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_ier
  assign rg_ier$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4160[7:0] ;
  assign rg_ier$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d256 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_lcr
  assign rg_lcr$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4160[7:0] ;
  assign rg_lcr$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d268 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_lsr
  always@(WILL_FIRE_RL_rl_reset or
	  WILL_FIRE_RL_rl_receive or
	  MUX_rg_lsr$write_1__VAL_2 or
	  MUX_rg_lsr$write_1__SEL_3 or MUX_rg_lsr$write_1__VAL_3)
  case (1'b1)
    WILL_FIRE_RL_rl_reset: rg_lsr$D_IN = 8'd96;
    WILL_FIRE_RL_rl_receive: rg_lsr$D_IN = MUX_rg_lsr$write_1__VAL_2;
    MUX_rg_lsr$write_1__SEL_3: rg_lsr$D_IN = MUX_rg_lsr$write_1__VAL_3;
    default: rg_lsr$D_IN = 8'b10101010 /* unspecified value */ ;
  endcase
  assign rg_lsr$EN =
	     WILL_FIRE_RL_rl_process_rd_req &&
	     NOT_slave_xactor_f_rd_addr_first_BITS_92_TO_29_ETC___d43 ||
	     WILL_FIRE_RL_rl_receive ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_mcr
  assign rg_mcr$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4160[7:0] ;
  assign rg_mcr$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d272 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_msr
  assign rg_msr$D_IN = 8'd0 ;
  assign rg_msr$EN = CAN_FIRE_RL_rl_reset ;
  // register rg_rbr
  assign rg_rbr$D_IN = f_from_console$D_OUT ;
  assign rg_rbr$EN = CAN_FIRE_RL_rl_receive ;
  // register rg_scr
  assign rg_scr$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4160[7:0] ;
  assign rg_scr$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d276 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_state
  assign rg_state$D_IN = 1'd1 ;
  assign rg_state$EN = f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
  // register rg_thr
  assign rg_thr$D_IN = x__h4160[7:0] ;
  assign rg_thr$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d185 ;
  // submodule f_from_console
  assign f_from_console$D_IN = put_from_console_put ;
  assign f_from_console$ENQ = EN_put_from_console_put ;
  assign f_from_console$DEQ = CAN_FIRE_RL_rl_receive ;
  assign f_from_console$CLR = 1'b0 ;
  // submodule f_reset_reqs
  assign f_reset_reqs$ENQ = EN_server_reset_request_put ;
  assign f_reset_reqs$DEQ = f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
  assign f_reset_reqs$CLR = 1'b0 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$ENQ = f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
  assign f_reset_rsps$DEQ = EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule f_to_console
  assign f_to_console$D_IN = x__h4160[7:0] ;
  assign f_to_console$ENQ =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d185 ;
  assign f_to_console$DEQ = EN_get_to_console_get ;
  assign f_to_console$CLR = 1'b0 ;
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
  assign slave_xactor_f_rd_addr$DEQ = WILL_FIRE_RL_rl_process_rd_req ;
  assign slave_xactor_f_rd_addr$CLR =
	     f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
  // submodule slave_xactor_f_rd_data
  assign slave_xactor_f_rd_data$D_IN =
	     { slave_xactor_f_rd_addr$D_OUT[108:93],
	       rdr_rdata__h3231,
	       rdr_rresp__h3232,
	       1'd1 } ;
  assign slave_xactor_f_rd_data$ENQ = WILL_FIRE_RL_rl_process_rd_req ;
  assign slave_xactor_f_rd_data$DEQ =
	     slave_rready && slave_xactor_f_rd_data$EMPTY_N ;
  assign slave_xactor_f_rd_data$CLR =
	     f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
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
  assign slave_xactor_f_wr_addr$DEQ = CAN_FIRE_RL_rl_process_wr_req ;
  assign slave_xactor_f_wr_addr$CLR =
	     f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
  // submodule slave_xactor_f_wr_data
  assign slave_xactor_f_wr_data$D_IN =
	     { slave_wdata, slave_wstrb, slave_wlast } ;
  assign slave_xactor_f_wr_data$ENQ =
	     slave_wvalid && slave_xactor_f_wr_data$FULL_N ;
  assign slave_xactor_f_wr_data$DEQ = CAN_FIRE_RL_rl_process_wr_req ;
  assign slave_xactor_f_wr_data$CLR =
	     f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
  // submodule slave_xactor_f_wr_resp
  assign slave_xactor_f_wr_resp$D_IN =
	     { slave_xactor_f_wr_addr$D_OUT[108:93],
	       (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
		!slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146) ?
		 2'b11 :
		 v__h3665 } ;
  assign slave_xactor_f_wr_resp$ENQ = CAN_FIRE_RL_rl_process_wr_req ;
  assign slave_xactor_f_wr_resp$DEQ =
	     slave_bready && slave_xactor_f_wr_resp$EMPTY_N ;
  assign slave_xactor_f_wr_resp$CLR =
	     f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
  // remaining internal signals
  assign NOT_slave_xactor_f_rd_addr_first_BITS_92_TO_29_ETC___d43 =
	     !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	     slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	     slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	     2'd0 &&
	     slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] ==
	     59'd0 &&
	     slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[4:2] ==
	     3'h0 &&
	     !rg_lcr[7] ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d185 =
	     !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] ==
	     3'h0 &&
	     !rg_lcr[7] ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d251 =
	     !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] ==
	     3'h0 &&
	     rg_lcr[7] ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d256 =
	     !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] ==
	     3'h1 &&
	     !rg_lcr[7] ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d260 =
	     !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] ==
	     3'h1 &&
	     rg_lcr[7] ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d264 =
	     !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] ==
	     3'h2 ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d268 =
	     !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] ==
	     3'h3 ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d272 =
	     !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] ==
	     3'h4 ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d276 =
	     !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] ==
	     3'h7 ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d309 =
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	      3'h1 ||
	      !rg_lcr[7]) &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h2 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h3 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h4 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h5 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h6 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h7 &&
	     slave_xactor_f_wr_data$D_OUT[0] ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d315 =
	     !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	     59'd0 &&
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	      3'h0 ||
	      rg_lcr[7]) &&
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	      3'h0 ||
	      !rg_lcr[7]) &&
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	      3'h1 ||
	      rg_lcr[7]) &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d309 ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d322 =
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	      3'h1 ||
	      !rg_lcr[7]) &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h2 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h3 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h4 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h5 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h6 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	     3'h7 &&
	     !slave_xactor_f_wr_data$D_OUT[0] ;
  assign NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d328 =
	     !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	     59'd0 &&
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	      3'h0 ||
	      rg_lcr[7]) &&
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	      3'h0 ||
	      !rg_lcr[7]) &&
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	      3'h1 ||
	      rg_lcr[7]) &&
	     NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d322 ;
  assign fn_iir__h1320 =
	     (rg_ier[0] && rg_lsr[0]) ? 8'h04 : (rg_ier[1] ? 8'h02 : 8'h01) ;
  assign offset__h1888 =
	     { 2'd0,
	       slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:2] } ;
  assign offset__h3463 =
	     { 2'd0,
	       slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:2] } ;
  assign rdata___1__h3256 = { 24'd0, rdata_byte__h3203, 32'd0 } ;
  assign rdata__h3204 = { 56'd0, rdata_byte__h3203 } ;
  assign rdata_byte__h3203 =
	     (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	      !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 ||
	      slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	      2'd0 ||
	      slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	      59'd0) ?
	       8'd0 :
	       y_avValue_snd__h3168 ;
  assign rdr_rdata__h3231 =
	     (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[2:0] ==
	      3'b100) ?
	       rdata___1__h3256 :
	       rdata__h3204 ;
  assign rdr_rresp__h3232 =
	     (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	      !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14) ?
	       2'b11 :
	       y_avValue_fst__h3195 ;
  assign result__h4174 = { 56'd0, slave_xactor_f_wr_data$D_OUT[16:9] } ;
  assign result__h4204 = { 56'd0, slave_xactor_f_wr_data$D_OUT[24:17] } ;
  assign result__h4231 = { 56'd0, slave_xactor_f_wr_data$D_OUT[32:25] } ;
  assign result__h4258 = { 56'd0, slave_xactor_f_wr_data$D_OUT[40:33] } ;
  assign result__h4285 = { 56'd0, slave_xactor_f_wr_data$D_OUT[48:41] } ;
  assign result__h4312 = { 56'd0, slave_xactor_f_wr_data$D_OUT[56:49] } ;
  assign result__h4339 = { 56'd0, slave_xactor_f_wr_data$D_OUT[64:57] } ;
  assign result__h4366 = { 56'd0, slave_xactor_f_wr_data$D_OUT[72:65] } ;
  assign result__h4393 = { 48'd0, slave_xactor_f_wr_data$D_OUT[24:9] } ;
  assign result__h4420 = { 48'd0, slave_xactor_f_wr_data$D_OUT[40:25] } ;
  assign result__h4447 = { 48'd0, slave_xactor_f_wr_data$D_OUT[56:41] } ;
  assign result__h4474 = { 48'd0, slave_xactor_f_wr_data$D_OUT[72:57] } ;
  assign result__h4501 = { 32'd0, slave_xactor_f_wr_data$D_OUT[40:9] } ;
  assign result__h4528 = { 32'd0, slave_xactor_f_wr_data$D_OUT[72:41] } ;
  assign slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30 =
	     slave_xactor_f_rd_addr$D_OUT[92:29] - rg_addr_base ;
  assign slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 =
	     slave_xactor_f_rd_addr$D_OUT[92:29] < rg_addr_base ;
  assign slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 =
	     slave_xactor_f_rd_addr$D_OUT[92:29] < rg_addr_lim ;
  assign slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 =
	     slave_xactor_f_wr_addr$D_OUT[92:29] < rg_addr_base ;
  assign slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 =
	     slave_xactor_f_wr_addr$D_OUT[92:29] < rg_addr_lim ;
  assign slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149 =
	     slave_xactor_f_wr_addr$D_OUT[92:29] - rg_addr_base ;
  assign slave_xactor_f_wr_resp_i_notFull__42_AND_slave_ETC___d165 =
	     slave_xactor_f_wr_resp$FULL_N &&
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	      !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 ||
	      slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	      2'd0 ||
	      slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	      59'd0 ||
	      slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[4:2] !=
	      3'h0 ||
	      rg_lcr[7] ||
	      f_to_console$FULL_N) ;
  assign v__h3665 =
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	      2'd0) ?
	       v__h3827 :
	       2'b10 ;
  assign v__h3827 =
	     (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] ==
	      59'd0) ?
	       v__h4086 :
	       2'b11 ;
  assign v__h4086 = y_avValue_fst__h3167 ;
  assign y_avValue_fst__h3167 = 2'b0 ;
  assign y_avValue_fst__h3181 =
	     (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] ==
	      59'd0) ?
	       y_avValue_fst__h3167 :
	       2'b11 ;
  assign y_avValue_fst__h3195 =
	     (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	      2'd0) ?
	       y_avValue_fst__h3181 :
	       2'b10 ;
  assign y_avValue_snd__h3126 =
	     (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[4:2] ==
	      3'h1 &&
	      rg_lcr[7]) ?
	       rg_dlm :
	       y_avValue_snd__h3113 ;
  assign y_avValue_snd__h3139 =
	     (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[4:2] ==
	      3'h1 &&
	      !rg_lcr[7]) ?
	       rg_ier :
	       y_avValue_snd__h3126 ;
  assign y_avValue_snd__h3154 =
	     (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[4:2] ==
	      3'h0 &&
	      rg_lcr[7]) ?
	       rg_dll :
	       y_avValue_snd__h3139 ;
  assign y_avValue_snd__h3168 =
	     (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[4:2] ==
	      3'h0 &&
	      !rg_lcr[7]) ?
	       rg_rbr :
	       y_avValue_snd__h3154 ;
  always@(slave_xactor_f_wr_data$D_OUT or
	  result__h4174 or
	  result__h4204 or
	  result__h4393 or
	  result__h4231 or
	  result__h4258 or
	  result__h4420 or
	  result__h4501 or
	  result__h4285 or
	  result__h4312 or
	  result__h4447 or
	  result__h4339 or result__h4366 or result__h4474 or result__h4528)
  begin
    case (slave_xactor_f_wr_data$D_OUT[8:1])
      8'b00000001: x__h4160 = result__h4174;
      8'b00000010: x__h4160 = result__h4204;
      8'b00000011: x__h4160 = result__h4393;
      8'b00000100: x__h4160 = result__h4231;
      8'b00001000: x__h4160 = result__h4258;
      8'b00001100: x__h4160 = result__h4420;
      8'b00001111: x__h4160 = result__h4501;
      8'b00010000: x__h4160 = result__h4285;
      8'b00100000: x__h4160 = result__h4312;
      8'b00110000: x__h4160 = result__h4447;
      8'b01000000: x__h4160 = result__h4339;
      8'b10000000: x__h4160 = result__h4366;
      8'b11000000: x__h4160 = result__h4474;
      8'b11110000: x__h4160 = result__h4528;
      8'b11111111: x__h4160 = slave_xactor_f_wr_data$D_OUT[72:9];
      default: x__h4160 = 64'd0;
    endcase
  end
  always@(slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30 or
	  fn_iir__h1320 or rg_lcr or rg_mcr or rg_lsr or rg_msr or rg_scr)
  begin
    case (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[4:2])
      3'h2: y_avValue_snd__h3113 = fn_iir__h1320;
      3'h3: y_avValue_snd__h3113 = rg_lcr;
      3'h4: y_avValue_snd__h3113 = rg_mcr;
      3'h5: y_avValue_snd__h3113 = rg_lsr;
      3'h6: y_avValue_snd__h3113 = rg_msr;
      3'h7: y_avValue_snd__h3113 = rg_scr;
      default: y_avValue_snd__h3113 = 8'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_dll <= `BSV_ASSIGNMENT_DELAY 8'd0;
	rg_dlm <= `BSV_ASSIGNMENT_DELAY 8'd0;
	rg_fcr <= `BSV_ASSIGNMENT_DELAY 8'd0;
	rg_ier <= `BSV_ASSIGNMENT_DELAY 8'd0;
	rg_lcr <= `BSV_ASSIGNMENT_DELAY 8'd0;
	rg_lsr <= `BSV_ASSIGNMENT_DELAY 8'd96;
	rg_mcr <= `BSV_ASSIGNMENT_DELAY 8'd0;
	rg_msr <= `BSV_ASSIGNMENT_DELAY 8'd0;
	rg_scr <= `BSV_ASSIGNMENT_DELAY 8'd0;
	rg_state <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (rg_dll$EN) rg_dll <= `BSV_ASSIGNMENT_DELAY rg_dll$D_IN;
	if (rg_dlm$EN) rg_dlm <= `BSV_ASSIGNMENT_DELAY rg_dlm$D_IN;
	if (rg_fcr$EN) rg_fcr <= `BSV_ASSIGNMENT_DELAY rg_fcr$D_IN;
	if (rg_ier$EN) rg_ier <= `BSV_ASSIGNMENT_DELAY rg_ier$D_IN;
	if (rg_lcr$EN) rg_lcr <= `BSV_ASSIGNMENT_DELAY rg_lcr$D_IN;
	if (rg_lsr$EN) rg_lsr <= `BSV_ASSIGNMENT_DELAY rg_lsr$D_IN;
	if (rg_mcr$EN) rg_mcr <= `BSV_ASSIGNMENT_DELAY rg_mcr$D_IN;
	if (rg_msr$EN) rg_msr <= `BSV_ASSIGNMENT_DELAY rg_msr$D_IN;
	if (rg_scr$EN) rg_scr <= `BSV_ASSIGNMENT_DELAY rg_scr$D_IN;
	if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
      end
    if (rg_addr_base$EN)
      rg_addr_base <= `BSV_ASSIGNMENT_DELAY rg_addr_base$D_IN;
    if (rg_addr_lim$EN) rg_addr_lim <= `BSV_ASSIGNMENT_DELAY rg_addr_lim$D_IN;
    if (rg_rbr$EN) rg_rbr <= `BSV_ASSIGNMENT_DELAY rg_rbr$D_IN;
    if (rg_thr$EN) rg_thr <= `BSV_ASSIGNMENT_DELAY rg_thr$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_addr_base = 64'hAAAAAAAAAAAAAAAA;
    rg_addr_lim = 64'hAAAAAAAAAAAAAAAA;
    rg_dll = 8'hAA;
    rg_dlm = 8'hAA;
    rg_fcr = 8'hAA;
    rg_ier = 8'hAA;
    rg_lcr = 8'hAA;
    rg_lsr = 8'hAA;
    rg_mcr = 8'hAA;
    rg_msr = 8'hAA;
    rg_rbr = 8'hAA;
    rg_scr = 8'hAA;
    rg_state = 1'h0;
    rg_thr = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	begin
	  v__h1949 = $stime;
	  #0;
	end
    v__h1943 = v__h1949 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$display("%0d: %m.rl_process_rd_req: ERROR: UART addr out of bounds",
		 v__h1943);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$display("    UART base addr 0x%0h  limit addr 0x%0h",
		 rg_addr_base,
		 rg_addr_lim);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("    AXI4 request: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 ||
	   !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	begin
	  v__h2931 = $stime;
	  #0;
	end
    v__h2925 = v__h2931 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$display("%0d: %m.rl_process_rd_req: ERROR: UART unsupported addr",
		 v__h2925);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	begin
	  v__h2359 = $stime;
	  #0;
	end
    v__h2353 = v__h2359 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$display("%0d: %m.rl_process_rd_req: ERROR: UART unsupported addr",
		 v__h2353);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$display("    Register offset 0x%0h", offset__h1888);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[63:5] !=
	  59'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	begin
	  v__h2184 = $stime;
	  #0;
	end
    v__h2178 = v__h2184 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$display("%0d: %m.rl_process_rd_req: ERROR: UART misaligned addr",
		 v__h2178);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d12 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_U_ETC___d14 &&
	  slave_xactor_f_rd_addr_first_BITS_92_TO_29_0_M_ETC___d30[1:0] !=
	  2'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	begin
	  v__h3512 = $stime;
	  #0;
	end
    v__h3506 = v__h3512 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$display("%0d: %m.rl_process_rd_req: ERROR: UART addr out of bounds",
		 v__h3506);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$display("    UART base addr 0x%0h  limit addr 0x%0h",
		 rg_addr_base,
		 rg_addr_lim);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("    AXI4 request: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 ||
	   !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	begin
	  v__h5200 = $stime;
	  #0;
	end
    v__h5194 = v__h5200 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$display("%0d: %m.rl_process_wr_req: ERROR: UART unsupported addr",
		 v__h5194);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d315)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_slave_xactor_f_wr_addr_first__43_BITS_92_T_ETC___d328)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	begin
	  v__h3896 = $stime;
	  #0;
	end
    v__h3890 = v__h3896 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$display("%0d: %m.rl_process_wr_req: ERROR: UART unsupported addr",
		 v__h3890);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$display("    Register offset 0x%0h", offset__h3463);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0 &&
	  slave_xactor_f_wr_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0 &&
	  !slave_xactor_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[63:5] !=
	  59'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	begin
	  v__h3726 = $stime;
	  #0;
	end
    v__h3720 = v__h3726 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$display("%0d: %m.rl_process_wr_req: ERROR: UART misaligned addr",
		 v__h3720);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d145 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d146 &&
	  slave_xactor_f_wr_addr_first__43_BITS_92_TO_29_ETC___d149[1:0] !=
	  2'd0)
	$write("\n");
    if (EN_set_addr_map && set_addr_map_addr_base[2:0] != 3'd0)
      begin
        v__h5797 = $stime;
	#0;
      end
    v__h5791 = v__h5797 / 32'd10;
    if (EN_set_addr_map && set_addr_map_addr_base[2:0] != 3'd0)
      $display("%0d: WARNING: UART.set_addr_map: addr_base 0x%0h is not 8-Byte-aligned",
	       v__h5791,
	       set_addr_map_addr_base);
    if (EN_set_addr_map && set_addr_map_addr_lim[2:0] != 3'd0)
      begin
        v__h5903 = $stime;
	#0;
      end
    v__h5897 = v__h5903 / 32'd10;
    if (EN_set_addr_map && set_addr_map_addr_lim[2:0] != 3'd0)
      $display("%0d: WARNING: UART.set_addr_map: addr_lim 0x%0h is not 8-Byte-aligned",
	       v__h5897,
	       set_addr_map_addr_lim);
  end
  // synopsys translate_on
endmodule