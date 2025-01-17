module outputs
  wire [63 : 0] slave_rdata;
  wire [7 : 0] get_to_console_get;
  wire [3 : 0] slave_bid, slave_rid;
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
  // register cfg_verbosity
  reg [7 : 0] cfg_verbosity;
  wire [7 : 0] cfg_verbosity$D_IN;
  wire cfg_verbosity$EN;
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
  wire [96 : 0] slave_xactor_f_rd_addr$D_IN, slave_xactor_f_rd_addr$D_OUT;
  wire slave_xactor_f_rd_addr$CLR,
       slave_xactor_f_rd_addr$DEQ,
       slave_xactor_f_rd_addr$EMPTY_N,
       slave_xactor_f_rd_addr$ENQ,
       slave_xactor_f_rd_addr$FULL_N;
  // ports of submodule slave_xactor_f_rd_data
  wire [70 : 0] slave_xactor_f_rd_data$D_IN, slave_xactor_f_rd_data$D_OUT;
  wire slave_xactor_f_rd_data$CLR,
       slave_xactor_f_rd_data$DEQ,
       slave_xactor_f_rd_data$EMPTY_N,
       slave_xactor_f_rd_data$ENQ,
       slave_xactor_f_rd_data$FULL_N;
  // ports of submodule slave_xactor_f_wr_addr
  wire [96 : 0] slave_xactor_f_wr_addr$D_IN, slave_xactor_f_wr_addr$D_OUT;
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
  wire [5 : 0] slave_xactor_f_wr_resp$D_IN, slave_xactor_f_wr_resp$D_OUT;
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
  wire [7 : 0] MUX_rg_lsr$write_1__VAL_3;
  wire MUX_rg_lsr$write_1__SEL_3;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h1992;
  reg [31 : 0] v__h2869;
  reg [31 : 0] v__h2357;
  reg [31 : 0] v__h2200;
  reg [31 : 0] v__h3288;
  reg [31 : 0] v__h3576;
  reg [31 : 0] v__h5025;
  reg [31 : 0] v__h3915;
  reg [31 : 0] v__h3763;
  reg [31 : 0] v__h5335;
  reg [31 : 0] v__h5777;
  reg [31 : 0] v__h5887;
  reg [31 : 0] v__h1812;
  reg [31 : 0] v__h1806;
  reg [31 : 0] v__h1986;
  reg [31 : 0] v__h2194;
  reg [31 : 0] v__h2351;
  reg [31 : 0] v__h2863;
  reg [31 : 0] v__h3282;
  reg [31 : 0] v__h3570;
  reg [31 : 0] v__h3757;
  reg [31 : 0] v__h3909;
  reg [31 : 0] v__h5019;
  reg [31 : 0] v__h5329;
  reg [31 : 0] v__h5771;
  reg [31 : 0] v__h5881;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] x__h4063;
  reg [7 : 0] y_avValue_snd__h3033;
  wire [63 : 0] rdata___1__h3181,
		rdata__h3123,
		rdr_rdata__h3156,
		result__h4081,
		result__h4111,
		result__h4138,
		result__h4165,
		result__h4192,
		result__h4219,
		result__h4246,
		result__h4273,
		result__h4300,
		result__h4327,
		result__h4354,
		result__h4381,
		result__h4408,
		result__h4435,
		slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35,
		slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156;
  wire [7 : 0] fn_iir__h1357,
	       new_lsr__h5544,
	       x__h3184,
	       y_avValue_snd__h3046,
	       y_avValue_snd__h3059,
	       y_avValue_snd__h3074,
	       y_avValue_snd__h3088;
  wire [1 : 0] rdr_rresp__h3157,
	       v__h3531,
	       v__h3702,
	       v__h3846,
	       v__h3998,
	       y_avValue_fst__h3087,
	       y_avValue_fst__h3101,
	       y_avValue_fst__h3115;
  wire NOT_cfg_verbosity_read_ULE_1_43___d144,
       NOT_slave_xactor_f_rd_addr_first__4_BITS_92_TO_ETC___d48,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d192,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d258,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d263,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d267,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d271,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d275,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d279,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d283,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d316,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d322,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d329,
       NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d335,
       slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17,
       slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19,
       slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152,
       slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153,
       slave_xactor_f_wr_resp_i_notFull__49_AND_slave_ETC___d172;
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
  assign slave_bid = slave_xactor_f_wr_resp$D_OUT[5:2] ;
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
  assign slave_rid = slave_xactor_f_rd_data$D_OUT[70:67] ;
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
  assign intr = !fn_iir__h1357[0] ;
  // submodule f_from_console
  FIFO2 #(.width(32'd8), .guarded(32'd1)) f_from_console(.RST(RST_N),
							 .CLK(CLK),
							 .D_IN(f_from_console$D_IN),
							 .ENQ(f_from_console$ENQ),
							 .DEQ(f_from_console$DEQ),
							 .CLR(f_from_console$CLR),
							 .D_OUT(f_from_console$D_OUT),
							 .FULL_N(f_from_console$FULL_N),
							 .EMPTY_N(f_from_console$EMPTY_N));
  // submodule f_reset_reqs
  FIFO20 #(.guarded(32'd1)) f_reset_reqs(.RST(RST_N),
					 .CLK(CLK),
					 .ENQ(f_reset_reqs$ENQ),
					 .DEQ(f_reset_reqs$DEQ),
					 .CLR(f_reset_reqs$CLR),
					 .FULL_N(f_reset_reqs$FULL_N),
					 .EMPTY_N(f_reset_reqs$EMPTY_N));
  // submodule f_reset_rsps
  FIFO20 #(.guarded(32'd1)) f_reset_rsps(.RST(RST_N),
					 .CLK(CLK),
					 .ENQ(f_reset_rsps$ENQ),
					 .DEQ(f_reset_rsps$DEQ),
					 .CLR(f_reset_rsps$CLR),
					 .FULL_N(f_reset_rsps$FULL_N),
					 .EMPTY_N(f_reset_rsps$EMPTY_N));
  // submodule f_to_console
  FIFO2 #(.width(32'd8), .guarded(32'd1)) f_to_console(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(f_to_console$D_IN),
						       .ENQ(f_to_console$ENQ),
						       .DEQ(f_to_console$DEQ),
						       .CLR(f_to_console$CLR),
						       .D_OUT(f_to_console$D_OUT),
						       .FULL_N(f_to_console$FULL_N),
						       .EMPTY_N(f_to_console$EMPTY_N));
  // submodule slave_xactor_f_rd_addr
  FIFO2 #(.width(32'd97), .guarded(32'd1)) slave_xactor_f_rd_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(slave_xactor_f_rd_addr$D_IN),
								  .ENQ(slave_xactor_f_rd_addr$ENQ),
								  .DEQ(slave_xactor_f_rd_addr$DEQ),
								  .CLR(slave_xactor_f_rd_addr$CLR),
								  .D_OUT(slave_xactor_f_rd_addr$D_OUT),
								  .FULL_N(slave_xactor_f_rd_addr$FULL_N),
								  .EMPTY_N(slave_xactor_f_rd_addr$EMPTY_N));
  // submodule slave_xactor_f_rd_data
  FIFO2 #(.width(32'd71), .guarded(32'd1)) slave_xactor_f_rd_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(slave_xactor_f_rd_data$D_IN),
								  .ENQ(slave_xactor_f_rd_data$ENQ),
								  .DEQ(slave_xactor_f_rd_data$DEQ),
								  .CLR(slave_xactor_f_rd_data$CLR),
								  .D_OUT(slave_xactor_f_rd_data$D_OUT),
								  .FULL_N(slave_xactor_f_rd_data$FULL_N),
								  .EMPTY_N(slave_xactor_f_rd_data$EMPTY_N));
  // submodule slave_xactor_f_wr_addr
  FIFO2 #(.width(32'd97), .guarded(32'd1)) slave_xactor_f_wr_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(slave_xactor_f_wr_addr$D_IN),
								  .ENQ(slave_xactor_f_wr_addr$ENQ),
								  .DEQ(slave_xactor_f_wr_addr$DEQ),
								  .CLR(slave_xactor_f_wr_addr$CLR),
								  .D_OUT(slave_xactor_f_wr_addr$D_OUT),
								  .FULL_N(slave_xactor_f_wr_addr$FULL_N),
								  .EMPTY_N(slave_xactor_f_wr_addr$EMPTY_N));
  // submodule slave_xactor_f_wr_data
  FIFO2 #(.width(32'd73), .guarded(32'd1)) slave_xactor_f_wr_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(slave_xactor_f_wr_data$D_IN),
								  .ENQ(slave_xactor_f_wr_data$ENQ),
								  .DEQ(slave_xactor_f_wr_data$DEQ),
								  .CLR(slave_xactor_f_wr_data$CLR),
								  .D_OUT(slave_xactor_f_wr_data$D_OUT),
								  .FULL_N(slave_xactor_f_wr_data$FULL_N),
								  .EMPTY_N(slave_xactor_f_wr_data$EMPTY_N));
  // submodule slave_xactor_f_wr_resp
  FIFO2 #(.width(32'd6), .guarded(32'd1)) slave_xactor_f_wr_resp(.RST(RST_N),
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
	     slave_xactor_f_wr_resp_i_notFull__49_AND_slave_ETC___d172 &&
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
	     NOT_slave_xactor_f_rd_addr_first__4_BITS_92_TO_ETC___d48 ;
  assign MUX_rg_lsr$write_1__VAL_3 = { rg_lsr[7:1], 1'd0 } ;
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = 8'h0 ;
  assign cfg_verbosity$EN = 1'b0 ;
  // register rg_addr_base
  assign rg_addr_base$D_IN = set_addr_map_addr_base ;
  assign rg_addr_base$EN = EN_set_addr_map ;
  // register rg_addr_lim
  assign rg_addr_lim$D_IN = set_addr_map_addr_lim ;
  assign rg_addr_lim$EN = EN_set_addr_map ;
  // register rg_dll
  assign rg_dll$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4063[7:0] ;
  assign rg_dll$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d258 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_dlm
  assign rg_dlm$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4063[7:0] ;
  assign rg_dlm$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d267 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_fcr
  assign rg_fcr$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4063[7:0] ;
  assign rg_fcr$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d271 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_ier
  assign rg_ier$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4063[7:0] ;
  assign rg_ier$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d263 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_lcr
  assign rg_lcr$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4063[7:0] ;
  assign rg_lcr$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d275 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_lsr
  always@(WILL_FIRE_RL_rl_reset or
	  WILL_FIRE_RL_rl_receive or
	  new_lsr__h5544 or
	  MUX_rg_lsr$write_1__SEL_3 or MUX_rg_lsr$write_1__VAL_3)
  case (1'b1)
    WILL_FIRE_RL_rl_reset: rg_lsr$D_IN = 8'd96;
    WILL_FIRE_RL_rl_receive: rg_lsr$D_IN = new_lsr__h5544;
    MUX_rg_lsr$write_1__SEL_3: rg_lsr$D_IN = MUX_rg_lsr$write_1__VAL_3;
    default: rg_lsr$D_IN = 8'b10101010 /* unspecified value */ ;
  endcase
  assign rg_lsr$EN =
	     WILL_FIRE_RL_rl_process_rd_req &&
	     NOT_slave_xactor_f_rd_addr_first__4_BITS_92_TO_ETC___d48 ||
	     WILL_FIRE_RL_rl_receive ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_mcr
  assign rg_mcr$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4063[7:0] ;
  assign rg_mcr$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d279 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_msr
  assign rg_msr$D_IN = 8'd0 ;
  assign rg_msr$EN = CAN_FIRE_RL_rl_reset ;
  // register rg_rbr
  assign rg_rbr$D_IN = f_from_console$D_OUT ;
  assign rg_rbr$EN = CAN_FIRE_RL_rl_receive ;
  // register rg_scr
  assign rg_scr$D_IN = WILL_FIRE_RL_rl_reset ? 8'd0 : x__h4063[7:0] ;
  assign rg_scr$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d283 ||
	     WILL_FIRE_RL_rl_reset ;
  // register rg_state
  assign rg_state$D_IN = 1'd1 ;
  assign rg_state$EN = f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
  // register rg_thr
  assign rg_thr$D_IN = x__h4063[7:0] ;
  assign rg_thr$EN =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d192 ;
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
  assign f_to_console$D_IN = x__h4063[7:0] ;
  assign f_to_console$ENQ =
	     WILL_FIRE_RL_rl_process_wr_req &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d192 ;
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
	     { slave_xactor_f_rd_addr$D_OUT[96:93],
	       rdr_rdata__h3156,
	       rdr_rresp__h3157,
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
	     { slave_xactor_f_wr_addr$D_OUT[96:93], v__h3531 } ;
  assign slave_xactor_f_wr_resp$ENQ = CAN_FIRE_RL_rl_process_wr_req ;
  assign slave_xactor_f_wr_resp$DEQ =
	     slave_bready && slave_xactor_f_wr_resp$EMPTY_N ;
  assign slave_xactor_f_wr_resp$CLR =
	     f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N ;
  // remaining internal signals
  assign NOT_cfg_verbosity_read_ULE_1_43___d144 = cfg_verbosity > 8'd1 ;
  assign NOT_slave_xactor_f_rd_addr_first__4_BITS_92_TO_ETC___d48 =
	     !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	     slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	     slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	     2'd0 &&
	     slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] ==
	     59'd0 &&
	     slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[4:2] ==
	     3'h0 &&
	     !rg_lcr[7] ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d192 =
	     !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] ==
	     3'h0 &&
	     !rg_lcr[7] ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d258 =
	     !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] ==
	     3'h0 &&
	     rg_lcr[7] ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d263 =
	     !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] ==
	     3'h1 &&
	     !rg_lcr[7] ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d267 =
	     !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] ==
	     3'h1 &&
	     rg_lcr[7] ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d271 =
	     !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] ==
	     3'h2 ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d275 =
	     !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] ==
	     3'h3 ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d279 =
	     !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] ==
	     3'h4 ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d283 =
	     !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	     59'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] ==
	     3'h7 ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d316 =
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	      3'h1 ||
	      !rg_lcr[7]) &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h2 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h3 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h4 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h5 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h6 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h7 &&
	     slave_xactor_f_wr_data$D_OUT[0] ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d322 =
	     !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	     59'd0 &&
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	      3'h0 ||
	      rg_lcr[7]) &&
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	      3'h0 ||
	      !rg_lcr[7]) &&
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	      3'h1 ||
	      rg_lcr[7]) &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d316 ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d329 =
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	      3'h1 ||
	      !rg_lcr[7]) &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h2 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h3 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h4 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h5 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h6 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	     3'h7 &&
	     !slave_xactor_f_wr_data$D_OUT[0] ;
  assign NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d335 =
	     !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	     2'd0 &&
	     slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	     59'd0 &&
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	      3'h0 ||
	      rg_lcr[7]) &&
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	      3'h0 ||
	      !rg_lcr[7]) &&
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	      3'h1 ||
	      rg_lcr[7]) &&
	     NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d329 ;
  assign fn_iir__h1357 =
	     (rg_ier[0] && rg_lsr[0]) ? 8'h04 : (rg_ier[1] ? 8'h02 : 8'h01) ;
  assign new_lsr__h5544 = { rg_lsr[7:1], 1'd1 } ;
  assign rdata___1__h3181 = { 24'd0, x__h3184, 32'd0 } ;
  assign rdata__h3123 = { 56'd0, x__h3184 } ;
  assign rdr_rdata__h3156 =
	     (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[2:0] ==
	      3'b100) ?
	       rdata___1__h3181 :
	       rdata__h3123 ;
  assign rdr_rresp__h3157 =
	     (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	      !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19) ?
	       2'b11 :
	       y_avValue_fst__h3115 ;
  assign result__h4081 = { 56'd0, slave_xactor_f_wr_data$D_OUT[16:9] } ;
  assign result__h4111 = { 56'd0, slave_xactor_f_wr_data$D_OUT[24:17] } ;
  assign result__h4138 = { 56'd0, slave_xactor_f_wr_data$D_OUT[32:25] } ;
  assign result__h4165 = { 56'd0, slave_xactor_f_wr_data$D_OUT[40:33] } ;
  assign result__h4192 = { 56'd0, slave_xactor_f_wr_data$D_OUT[48:41] } ;
  assign result__h4219 = { 56'd0, slave_xactor_f_wr_data$D_OUT[56:49] } ;
  assign result__h4246 = { 56'd0, slave_xactor_f_wr_data$D_OUT[64:57] } ;
  assign result__h4273 = { 56'd0, slave_xactor_f_wr_data$D_OUT[72:65] } ;
  assign result__h4300 = { 48'd0, slave_xactor_f_wr_data$D_OUT[24:9] } ;
  assign result__h4327 = { 48'd0, slave_xactor_f_wr_data$D_OUT[40:25] } ;
  assign result__h4354 = { 48'd0, slave_xactor_f_wr_data$D_OUT[56:41] } ;
  assign result__h4381 = { 48'd0, slave_xactor_f_wr_data$D_OUT[72:57] } ;
  assign result__h4408 = { 32'd0, slave_xactor_f_wr_data$D_OUT[40:9] } ;
  assign result__h4435 = { 32'd0, slave_xactor_f_wr_data$D_OUT[72:41] } ;
  assign slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 =
	     slave_xactor_f_rd_addr$D_OUT[92:29] < rg_addr_base ;
  assign slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 =
	     slave_xactor_f_rd_addr$D_OUT[92:29] < rg_addr_lim ;
  assign slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35 =
	     slave_xactor_f_rd_addr$D_OUT[92:29] - rg_addr_base ;
  assign slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 =
	     slave_xactor_f_wr_addr$D_OUT[92:29] < rg_addr_base ;
  assign slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 =
	     slave_xactor_f_wr_addr$D_OUT[92:29] < rg_addr_lim ;
  assign slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156 =
	     slave_xactor_f_wr_addr$D_OUT[92:29] - rg_addr_base ;
  assign slave_xactor_f_wr_resp_i_notFull__49_AND_slave_ETC___d172 =
	     slave_xactor_f_wr_resp$FULL_N &&
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	      !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 ||
	      slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	      2'd0 ||
	      slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	      59'd0 ||
	      slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[4:2] !=
	      3'h0 ||
	      rg_lcr[7] ||
	      f_to_console$FULL_N) ;
  assign v__h3531 =
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	      !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153) ?
	       2'b11 :
	       v__h3702 ;
  assign v__h3702 =
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	      2'd0) ?
	       v__h3846 :
	       2'b10 ;
  assign v__h3846 =
	     (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] ==
	      59'd0) ?
	       v__h3998 :
	       2'b11 ;
  assign v__h3998 = y_avValue_fst__h3087 ;
  assign x__h3184 =
	     (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	      !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 ||
	      slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	      2'd0 ||
	      slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	      59'd0) ?
	       8'd0 :
	       y_avValue_snd__h3088 ;
  assign y_avValue_fst__h3087 = 2'b0 ;
  assign y_avValue_fst__h3101 =
	     (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] ==
	      59'd0) ?
	       y_avValue_fst__h3087 :
	       2'b11 ;
  assign y_avValue_fst__h3115 =
	     (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	      2'd0) ?
	       y_avValue_fst__h3101 :
	       2'b10 ;
  assign y_avValue_snd__h3046 =
	     (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[4:2] ==
	      3'h1 &&
	      rg_lcr[7]) ?
	       rg_dlm :
	       y_avValue_snd__h3033 ;
  assign y_avValue_snd__h3059 =
	     (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[4:2] ==
	      3'h1 &&
	      !rg_lcr[7]) ?
	       rg_ier :
	       y_avValue_snd__h3046 ;
  assign y_avValue_snd__h3074 =
	     (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[4:2] ==
	      3'h0 &&
	      rg_lcr[7]) ?
	       rg_dll :
	       y_avValue_snd__h3059 ;
  assign y_avValue_snd__h3088 =
	     (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[4:2] ==
	      3'h0 &&
	      !rg_lcr[7]) ?
	       rg_rbr :
	       y_avValue_snd__h3074 ;
  always@(slave_xactor_f_wr_data$D_OUT or
	  result__h4081 or
	  result__h4111 or
	  result__h4300 or
	  result__h4138 or
	  result__h4165 or
	  result__h4327 or
	  result__h4408 or
	  result__h4192 or
	  result__h4219 or
	  result__h4354 or
	  result__h4246 or result__h4273 or result__h4381 or result__h4435)
  begin
    case (slave_xactor_f_wr_data$D_OUT[8:1])
      8'b00000001: x__h4063 = result__h4081;
      8'b00000010: x__h4063 = result__h4111;
      8'b00000011: x__h4063 = result__h4300;
      8'b00000100: x__h4063 = result__h4138;
      8'b00001000: x__h4063 = result__h4165;
      8'b00001100: x__h4063 = result__h4327;
      8'b00001111: x__h4063 = result__h4408;
      8'b00010000: x__h4063 = result__h4192;
      8'b00100000: x__h4063 = result__h4219;
      8'b00110000: x__h4063 = result__h4354;
      8'b01000000: x__h4063 = result__h4246;
      8'b10000000: x__h4063 = result__h4273;
      8'b11000000: x__h4063 = result__h4381;
      8'b11110000: x__h4063 = result__h4435;
      8'b11111111: x__h4063 = slave_xactor_f_wr_data$D_OUT[72:9];
      default: x__h4063 = 64'd0;
    endcase
  end
  always@(slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35 or
	  fn_iir__h1357 or rg_lcr or rg_mcr or rg_lsr or rg_msr or rg_scr)
  begin
    case (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[4:2])
      3'h2: y_avValue_snd__h3033 = fn_iir__h1357;
      3'h3: y_avValue_snd__h3033 = rg_lcr;
      3'h4: y_avValue_snd__h3033 = rg_mcr;
      3'h5: y_avValue_snd__h3033 = rg_lsr;
      3'h6: y_avValue_snd__h3033 = rg_msr;
      3'h7: y_avValue_snd__h3033 = rg_scr;
      default: y_avValue_snd__h3033 = 8'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 8'd0;
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
        if (cfg_verbosity$EN)
	  cfg_verbosity <= `BSV_ASSIGNMENT_DELAY cfg_verbosity$D_IN;
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
    cfg_verbosity = 8'hAA;
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
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	begin
	  v__h1992 = $stime;
	  #0;
	end
    v__h1986 = v__h1992 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$display("%0d: %m.rl_process_rd_req: ERROR: UART addr out of bounds",
		 v__h1986);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$display("    UART base addr 0x%0h  limit addr 0x%0h",
		 rg_addr_base,
		 rg_addr_lim);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("    AXI4 request: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  (slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 ||
	   !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	begin
	  v__h2869 = $stime;
	  #0;
	end
    v__h2863 = v__h2869 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$display("%0d: %m.rl_process_rd_req: ERROR: UART unsupported addr",
		 v__h2863);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	begin
	  v__h2357 = $stime;
	  #0;
	end
    v__h2351 = v__h2357 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$display("%0d: %m.rl_process_rd_req: ERROR: UART unsupported addr",
		 v__h2351);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] ==
	  2'd0 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[63:5] !=
	  59'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	begin
	  v__h2200 = $stime;
	  #0;
	end
    v__h2194 = v__h2200 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$display("%0d: %m.rl_process_rd_req: ERROR: UART misaligned addr",
		 v__h2194);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  !slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d17 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d19 &&
	  slave_xactor_f_rd_addr_first__4_BITS_92_TO_29__ETC___d35[1:0] !=
	  2'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	begin
	  v__h3288 = $stime;
	  #0;
	end
    v__h3282 = v__h3288 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$display("%0d: %m.rl_process_rd_req", v__h3282);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_rd_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", rdr_rdata__h3156);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", rdr_rresp__h3157);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_rd_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	begin
	  v__h3576 = $stime;
	  #0;
	end
    v__h3570 = v__h3576 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$display("%0d: %m.rl_process_rd_req: ERROR: UART addr out of bounds",
		 v__h3570);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$display("    UART base addr 0x%0h  limit addr 0x%0h",
		 rg_addr_base,
		 rg_addr_lim);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("    AXI4 request: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  (slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 ||
	   !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	begin
	  v__h5025 = $stime;
	  #0;
	end
    v__h5019 = v__h5025 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$display("%0d: %m.rl_process_wr_req: ERROR: UART unsupported addr",
		 v__h5019);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d322)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_slave_xactor_f_wr_addr_first__50_BITS_92_T_ETC___d335)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  1'b0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	begin
	  v__h3915 = $stime;
	  #0;
	end
    v__h3909 = v__h3915 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$display("%0d: %m.rl_process_wr_req: ERROR: UART unsupported addr",
		 v__h3909);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] ==
	  2'd0 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[63:5] !=
	  59'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	begin
	  v__h3763 = $stime;
	  #0;
	end
    v__h3757 = v__h3763 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$display("%0d: %m.rl_process_wr_req: ERROR: UART misaligned addr",
		 v__h3757);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  !slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d152 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d153 &&
	  slave_xactor_f_wr_addr_first__50_BITS_92_TO_29_ETC___d156[1:0] !=
	  2'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	begin
	  v__h5335 = $stime;
	  #0;
	end
    v__h5329 = v__h5335 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$display("%0d: %m.rl_process_wr_req", v__h5329);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144 &&
	  slave_xactor_f_wr_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144 &&
	  !slave_xactor_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("            ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", slave_xactor_f_wr_addr$D_OUT[96:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", v__h3531);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_process_wr_req &&
	  NOT_cfg_verbosity_read_ULE_1_43___d144)
	$write("\n");
    if (EN_set_addr_map && set_addr_map_addr_base[2:0] != 3'd0)
      begin
        v__h5777 = $stime;
	#0;
      end
    v__h5771 = v__h5777 / 32'd10;
    if (EN_set_addr_map && set_addr_map_addr_base[2:0] != 3'd0)
      $display("%0d: WARNING: UART.set_addr_map: addr_base 0x%0h is not 8-Byte-aligned",
	       v__h5771,
	       set_addr_map_addr_base);
    if (EN_set_addr_map && set_addr_map_addr_lim[2:0] != 3'd0)
      begin
        v__h5887 = $stime;
	#0;
      end
    v__h5881 = v__h5887 / 32'd10;
    if (EN_set_addr_map && set_addr_map_addr_lim[2:0] != 3'd0)
      $display("%0d: WARNING: UART.set_addr_map: addr_lim 0x%0h is not 8-Byte-aligned",
	       v__h5881,
	       set_addr_map_addr_lim);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_receive && NOT_cfg_verbosity_read_ULE_1_43___d144)
	$display("UART_Model.rl_receive: received char 0x%0h; new_lsr = 0x%0h",
		 f_from_console$D_OUT,
		 new_lsr__h5544);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && cfg_verbosity != 8'd0)
	begin
	  v__h1812 = $stime;
	  #0;
	end
    v__h1806 = v__h1812 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && cfg_verbosity != 8'd0)
	$display("%0d: UART.rl_reset", v__h1806);
  end
  // synopsys translate_on
endmodule