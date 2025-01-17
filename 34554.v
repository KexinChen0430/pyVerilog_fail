module outputs
  wire [63 : 0] from_master_rdata,
		to_slave_araddr,
		to_slave_awaddr,
		to_slave_wdata;
  wire [7 : 0] to_slave_arlen, to_slave_awlen, to_slave_wstrb;
  wire [3 : 0] from_master_bid,
	       from_master_rid,
	       to_slave_arcache,
	       to_slave_arid,
	       to_slave_arqos,
	       to_slave_arregion,
	       to_slave_awcache,
	       to_slave_awid,
	       to_slave_awqos,
	       to_slave_awregion;
  wire [2 : 0] to_slave_arprot,
	       to_slave_arsize,
	       to_slave_awprot,
	       to_slave_awsize;
  wire [1 : 0] from_master_bresp,
	       from_master_rresp,
	       to_slave_arburst,
	       to_slave_awburst;
  wire RDY_reset,
       from_master_arready,
       from_master_awready,
       from_master_bvalid,
       from_master_rlast,
       from_master_rvalid,
       from_master_wready,
       to_slave_arlock,
       to_slave_arvalid,
       to_slave_awlock,
       to_slave_awvalid,
       to_slave_bready,
       to_slave_rready,
       to_slave_wlast,
       to_slave_wvalid;
  // register m_rg_ar_beat_count
  reg [7 : 0] m_rg_ar_beat_count;
  wire [7 : 0] m_rg_ar_beat_count$D_IN;
  wire m_rg_ar_beat_count$EN;
  // register m_rg_b_beat_count
  reg [7 : 0] m_rg_b_beat_count;
  wire [7 : 0] m_rg_b_beat_count$D_IN;
  wire m_rg_b_beat_count$EN;
  // register m_rg_b_resp
  reg [1 : 0] m_rg_b_resp;
  wire [1 : 0] m_rg_b_resp$D_IN;
  wire m_rg_b_resp$EN;
  // register m_rg_last_beat_raddr
  reg [63 : 0] m_rg_last_beat_raddr;
  wire [63 : 0] m_rg_last_beat_raddr$D_IN;
  wire m_rg_last_beat_raddr$EN;
  // register m_rg_last_beat_waddr
  reg [63 : 0] m_rg_last_beat_waddr;
  wire [63 : 0] m_rg_last_beat_waddr$D_IN;
  wire m_rg_last_beat_waddr$EN;
  // register m_rg_r_beat_count
  reg [7 : 0] m_rg_r_beat_count;
  wire [7 : 0] m_rg_r_beat_count$D_IN;
  wire m_rg_r_beat_count$EN;
  // register m_rg_reset
  reg m_rg_reset;
  wire m_rg_reset$D_IN, m_rg_reset$EN;
  // register m_rg_w_beat_count
  reg [7 : 0] m_rg_w_beat_count;
  wire [7 : 0] m_rg_w_beat_count$D_IN;
  wire m_rg_w_beat_count$EN;
  // ports of submodule m_f_r_arlen
  wire [7 : 0] m_f_r_arlen$D_IN, m_f_r_arlen$D_OUT;
  wire m_f_r_arlen$CLR,
       m_f_r_arlen$DEQ,
       m_f_r_arlen$EMPTY_N,
       m_f_r_arlen$ENQ,
       m_f_r_arlen$FULL_N;
  // ports of submodule m_f_w_awlen
  wire [7 : 0] m_f_w_awlen$D_IN, m_f_w_awlen$D_OUT;
  wire m_f_w_awlen$CLR,
       m_f_w_awlen$DEQ,
       m_f_w_awlen$EMPTY_N,
       m_f_w_awlen$ENQ,
       m_f_w_awlen$FULL_N;
  // ports of submodule m_xactor_from_master_f_rd_addr
  wire [96 : 0] m_xactor_from_master_f_rd_addr$D_IN,
		m_xactor_from_master_f_rd_addr$D_OUT;
  wire m_xactor_from_master_f_rd_addr$CLR,
       m_xactor_from_master_f_rd_addr$DEQ,
       m_xactor_from_master_f_rd_addr$EMPTY_N,
       m_xactor_from_master_f_rd_addr$ENQ,
       m_xactor_from_master_f_rd_addr$FULL_N;
  // ports of submodule m_xactor_from_master_f_rd_data
  wire [70 : 0] m_xactor_from_master_f_rd_data$D_IN,
		m_xactor_from_master_f_rd_data$D_OUT;
  wire m_xactor_from_master_f_rd_data$CLR,
       m_xactor_from_master_f_rd_data$DEQ,
       m_xactor_from_master_f_rd_data$EMPTY_N,
       m_xactor_from_master_f_rd_data$ENQ,
       m_xactor_from_master_f_rd_data$FULL_N;
  // ports of submodule m_xactor_from_master_f_wr_addr
  wire [96 : 0] m_xactor_from_master_f_wr_addr$D_IN,
		m_xactor_from_master_f_wr_addr$D_OUT;
  wire m_xactor_from_master_f_wr_addr$CLR,
       m_xactor_from_master_f_wr_addr$DEQ,
       m_xactor_from_master_f_wr_addr$EMPTY_N,
       m_xactor_from_master_f_wr_addr$ENQ,
       m_xactor_from_master_f_wr_addr$FULL_N;
  // ports of submodule m_xactor_from_master_f_wr_data
  wire [72 : 0] m_xactor_from_master_f_wr_data$D_IN,
		m_xactor_from_master_f_wr_data$D_OUT;
  wire m_xactor_from_master_f_wr_data$CLR,
       m_xactor_from_master_f_wr_data$DEQ,
       m_xactor_from_master_f_wr_data$EMPTY_N,
       m_xactor_from_master_f_wr_data$ENQ,
       m_xactor_from_master_f_wr_data$FULL_N;
  // ports of submodule m_xactor_from_master_f_wr_resp
  wire [5 : 0] m_xactor_from_master_f_wr_resp$D_IN,
	       m_xactor_from_master_f_wr_resp$D_OUT;
  wire m_xactor_from_master_f_wr_resp$CLR,
       m_xactor_from_master_f_wr_resp$DEQ,
       m_xactor_from_master_f_wr_resp$EMPTY_N,
       m_xactor_from_master_f_wr_resp$ENQ,
       m_xactor_from_master_f_wr_resp$FULL_N;
  // ports of submodule m_xactor_to_slave_f_rd_addr
  wire [96 : 0] m_xactor_to_slave_f_rd_addr$D_IN,
		m_xactor_to_slave_f_rd_addr$D_OUT;
  wire m_xactor_to_slave_f_rd_addr$CLR,
       m_xactor_to_slave_f_rd_addr$DEQ,
       m_xactor_to_slave_f_rd_addr$EMPTY_N,
       m_xactor_to_slave_f_rd_addr$ENQ,
       m_xactor_to_slave_f_rd_addr$FULL_N;
  // ports of submodule m_xactor_to_slave_f_rd_data
  wire [70 : 0] m_xactor_to_slave_f_rd_data$D_IN,
		m_xactor_to_slave_f_rd_data$D_OUT;
  wire m_xactor_to_slave_f_rd_data$CLR,
       m_xactor_to_slave_f_rd_data$DEQ,
       m_xactor_to_slave_f_rd_data$EMPTY_N,
       m_xactor_to_slave_f_rd_data$ENQ,
       m_xactor_to_slave_f_rd_data$FULL_N;
  // ports of submodule m_xactor_to_slave_f_wr_addr
  wire [96 : 0] m_xactor_to_slave_f_wr_addr$D_IN,
		m_xactor_to_slave_f_wr_addr$D_OUT;
  wire m_xactor_to_slave_f_wr_addr$CLR,
       m_xactor_to_slave_f_wr_addr$DEQ,
       m_xactor_to_slave_f_wr_addr$EMPTY_N,
       m_xactor_to_slave_f_wr_addr$ENQ,
       m_xactor_to_slave_f_wr_addr$FULL_N;
  // ports of submodule m_xactor_to_slave_f_wr_data
  wire [72 : 0] m_xactor_to_slave_f_wr_data$D_IN,
		m_xactor_to_slave_f_wr_data$D_OUT;
  wire m_xactor_to_slave_f_wr_data$CLR,
       m_xactor_to_slave_f_wr_data$DEQ,
       m_xactor_to_slave_f_wr_data$EMPTY_N,
       m_xactor_to_slave_f_wr_data$ENQ,
       m_xactor_to_slave_f_wr_data$FULL_N;
  // ports of submodule m_xactor_to_slave_f_wr_resp
  wire [5 : 0] m_xactor_to_slave_f_wr_resp$D_IN,
	       m_xactor_to_slave_f_wr_resp$D_OUT;
  wire m_xactor_to_slave_f_wr_resp$CLR,
       m_xactor_to_slave_f_wr_resp$DEQ,
       m_xactor_to_slave_f_wr_resp$EMPTY_N,
       m_xactor_to_slave_f_wr_resp$ENQ,
       m_xactor_to_slave_f_wr_resp$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_m_rl_rd_resp_slave_to_master,
       CAN_FIRE_RL_m_rl_rd_xaction_master_to_slave,
       CAN_FIRE_RL_m_rl_reset,
       CAN_FIRE_RL_m_rl_wr_resp_slave_to_master,
       CAN_FIRE_RL_m_rl_wr_xaction_master_to_slave,
       CAN_FIRE_from_master_m_arvalid,
       CAN_FIRE_from_master_m_awvalid,
       CAN_FIRE_from_master_m_bready,
       CAN_FIRE_from_master_m_rready,
       CAN_FIRE_from_master_m_wvalid,
       CAN_FIRE_reset,
       CAN_FIRE_to_slave_m_arready,
       CAN_FIRE_to_slave_m_awready,
       CAN_FIRE_to_slave_m_bvalid,
       CAN_FIRE_to_slave_m_rvalid,
       CAN_FIRE_to_slave_m_wready,
       WILL_FIRE_RL_m_rl_rd_resp_slave_to_master,
       WILL_FIRE_RL_m_rl_rd_xaction_master_to_slave,
       WILL_FIRE_RL_m_rl_reset,
       WILL_FIRE_RL_m_rl_wr_resp_slave_to_master,
       WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave,
       WILL_FIRE_from_master_m_arvalid,
       WILL_FIRE_from_master_m_awvalid,
       WILL_FIRE_from_master_m_bready,
       WILL_FIRE_from_master_m_rready,
       WILL_FIRE_from_master_m_wvalid,
       WILL_FIRE_reset,
       WILL_FIRE_to_slave_m_arready,
       WILL_FIRE_to_slave_m_awready,
       WILL_FIRE_to_slave_m_bvalid,
       WILL_FIRE_to_slave_m_rvalid,
       WILL_FIRE_to_slave_m_wready;
  // inputs to muxes for submodule ports
  wire [7 : 0] MUX_m_rg_ar_beat_count$write_1__VAL_2,
	       MUX_m_rg_b_beat_count$write_1__VAL_2,
	       MUX_m_rg_r_beat_count$write_1__VAL_2,
	       MUX_m_rg_w_beat_count$write_1__VAL_2;
  wire [1 : 0] MUX_m_rg_b_resp$write_1__VAL_2;
  wire MUX_m_rg_b_resp$write_1__SEL_2;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h2538;
  reg [31 : 0] v__h1445;
  reg [31 : 0] v__h2532;
  reg [31 : 0] v__h1439;
  // synopsys translate_on
  // remaining internal signals
  wire [63 : 0] IF_m_xactor_from_master_f_rd_addr_first__7_BIT_ETC___d104,
		IF_m_xactor_from_master_f_wr_addr_first__7_BIT_ETC___d34,
		a_out_araddr__h3122,
		a_out_awaddr__h2001,
		addr___1__h2153,
		addr___1__h3272,
		addr__h2083,
		addr__h3204,
		burst_len__h2084,
		burst_len__h3205,
		m_rg_last_beat_raddr_2_PLUS_1_SL_m_xactor_from_ETC___d100,
		m_rg_last_beat_waddr_2_PLUS_1_SL_m_xactor_from_ETC___d30,
		wrap_boundary__h2085,
		wrap_boundary__h3206;
  wire [7 : 0] x__h2401, x__h2925, x__h3420, x__h3653;
  wire m_rg_ar_beat_count_0_ULT_m_xactor_from_master__ETC___d110,
       m_rg_b_beat_count_6_ULT_m_f_w_awlen_first__7___d58,
       m_rg_r_beat_count_19_ULT_m_f_r_arlen_first__20___d121,
       m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43;
  // action method reset
  assign RDY_reset = !m_rg_reset ;
  assign CAN_FIRE_reset = !m_rg_reset ;
  assign WILL_FIRE_reset = EN_reset ;
  // action method from_master_m_awvalid
  assign CAN_FIRE_from_master_m_awvalid = 1'd1 ;
  assign WILL_FIRE_from_master_m_awvalid = 1'd1 ;
  // value method from_master_m_awready
  assign from_master_awready = m_xactor_from_master_f_wr_addr$FULL_N ;
  // action method from_master_m_wvalid
  assign CAN_FIRE_from_master_m_wvalid = 1'd1 ;
  assign WILL_FIRE_from_master_m_wvalid = 1'd1 ;
  // value method from_master_m_wready
  assign from_master_wready = m_xactor_from_master_f_wr_data$FULL_N ;
  // value method from_master_m_bvalid
  assign from_master_bvalid = m_xactor_from_master_f_wr_resp$EMPTY_N ;
  // value method from_master_m_bid
  assign from_master_bid = m_xactor_from_master_f_wr_resp$D_OUT[5:2] ;
  // value method from_master_m_bresp
  assign from_master_bresp = m_xactor_from_master_f_wr_resp$D_OUT[1:0] ;
  // action method from_master_m_bready
  assign CAN_FIRE_from_master_m_bready = 1'd1 ;
  assign WILL_FIRE_from_master_m_bready = 1'd1 ;
  // action method from_master_m_arvalid
  assign CAN_FIRE_from_master_m_arvalid = 1'd1 ;
  assign WILL_FIRE_from_master_m_arvalid = 1'd1 ;
  // value method from_master_m_arready
  assign from_master_arready = m_xactor_from_master_f_rd_addr$FULL_N ;
  // value method from_master_m_rvalid
  assign from_master_rvalid = m_xactor_from_master_f_rd_data$EMPTY_N ;
  // value method from_master_m_rid
  assign from_master_rid = m_xactor_from_master_f_rd_data$D_OUT[70:67] ;
  // value method from_master_m_rdata
  assign from_master_rdata = m_xactor_from_master_f_rd_data$D_OUT[66:3] ;
  // value method from_master_m_rresp
  assign from_master_rresp = m_xactor_from_master_f_rd_data$D_OUT[2:1] ;
  // value method from_master_m_rlast
  assign from_master_rlast = m_xactor_from_master_f_rd_data$D_OUT[0] ;
  // action method from_master_m_rready
  assign CAN_FIRE_from_master_m_rready = 1'd1 ;
  assign WILL_FIRE_from_master_m_rready = 1'd1 ;
  // value method to_slave_m_awvalid
  assign to_slave_awvalid = m_xactor_to_slave_f_wr_addr$EMPTY_N ;
  // value method to_slave_m_awid
  assign to_slave_awid = m_xactor_to_slave_f_wr_addr$D_OUT[96:93] ;
  // value method to_slave_m_awaddr
  assign to_slave_awaddr = m_xactor_to_slave_f_wr_addr$D_OUT[92:29] ;
  // value method to_slave_m_awlen
  assign to_slave_awlen = m_xactor_to_slave_f_wr_addr$D_OUT[28:21] ;
  // value method to_slave_m_awsize
  assign to_slave_awsize = m_xactor_to_slave_f_wr_addr$D_OUT[20:18] ;
  // value method to_slave_m_awburst
  assign to_slave_awburst = m_xactor_to_slave_f_wr_addr$D_OUT[17:16] ;
  // value method to_slave_m_awlock
  assign to_slave_awlock = m_xactor_to_slave_f_wr_addr$D_OUT[15] ;
  // value method to_slave_m_awcache
  assign to_slave_awcache = m_xactor_to_slave_f_wr_addr$D_OUT[14:11] ;
  // value method to_slave_m_awprot
  assign to_slave_awprot = m_xactor_to_slave_f_wr_addr$D_OUT[10:8] ;
  // value method to_slave_m_awqos
  assign to_slave_awqos = m_xactor_to_slave_f_wr_addr$D_OUT[7:4] ;
  // value method to_slave_m_awregion
  assign to_slave_awregion = m_xactor_to_slave_f_wr_addr$D_OUT[3:0] ;
  // action method to_slave_m_awready
  assign CAN_FIRE_to_slave_m_awready = 1'd1 ;
  assign WILL_FIRE_to_slave_m_awready = 1'd1 ;
  // value method to_slave_m_wvalid
  assign to_slave_wvalid = m_xactor_to_slave_f_wr_data$EMPTY_N ;
  // value method to_slave_m_wdata
  assign to_slave_wdata = m_xactor_to_slave_f_wr_data$D_OUT[72:9] ;
  // value method to_slave_m_wstrb
  assign to_slave_wstrb = m_xactor_to_slave_f_wr_data$D_OUT[8:1] ;
  // value method to_slave_m_wlast
  assign to_slave_wlast = m_xactor_to_slave_f_wr_data$D_OUT[0] ;
  // action method to_slave_m_wready
  assign CAN_FIRE_to_slave_m_wready = 1'd1 ;
  assign WILL_FIRE_to_slave_m_wready = 1'd1 ;
  // action method to_slave_m_bvalid
  assign CAN_FIRE_to_slave_m_bvalid = 1'd1 ;
  assign WILL_FIRE_to_slave_m_bvalid = 1'd1 ;
  // value method to_slave_m_bready
  assign to_slave_bready = m_xactor_to_slave_f_wr_resp$FULL_N ;
  // value method to_slave_m_arvalid
  assign to_slave_arvalid = m_xactor_to_slave_f_rd_addr$EMPTY_N ;
  // value method to_slave_m_arid
  assign to_slave_arid = m_xactor_to_slave_f_rd_addr$D_OUT[96:93] ;
  // value method to_slave_m_araddr
  assign to_slave_araddr = m_xactor_to_slave_f_rd_addr$D_OUT[92:29] ;
  // value method to_slave_m_arlen
  assign to_slave_arlen = m_xactor_to_slave_f_rd_addr$D_OUT[28:21] ;
  // value method to_slave_m_arsize
  assign to_slave_arsize = m_xactor_to_slave_f_rd_addr$D_OUT[20:18] ;
  // value method to_slave_m_arburst
  assign to_slave_arburst = m_xactor_to_slave_f_rd_addr$D_OUT[17:16] ;
  // value method to_slave_m_arlock
  assign to_slave_arlock = m_xactor_to_slave_f_rd_addr$D_OUT[15] ;
  // value method to_slave_m_arcache
  assign to_slave_arcache = m_xactor_to_slave_f_rd_addr$D_OUT[14:11] ;
  // value method to_slave_m_arprot
  assign to_slave_arprot = m_xactor_to_slave_f_rd_addr$D_OUT[10:8] ;
  // value method to_slave_m_arqos
  assign to_slave_arqos = m_xactor_to_slave_f_rd_addr$D_OUT[7:4] ;
  // value method to_slave_m_arregion
  assign to_slave_arregion = m_xactor_to_slave_f_rd_addr$D_OUT[3:0] ;
  // action method to_slave_m_arready
  assign CAN_FIRE_to_slave_m_arready = 1'd1 ;
  assign WILL_FIRE_to_slave_m_arready = 1'd1 ;
  // action method to_slave_m_rvalid
  assign CAN_FIRE_to_slave_m_rvalid = 1'd1 ;
  assign WILL_FIRE_to_slave_m_rvalid = 1'd1 ;
  // value method to_slave_m_rready
  assign to_slave_rready = m_xactor_to_slave_f_rd_data$FULL_N ;
  // submodule m_f_r_arlen
  SizedFIFO #(.p1width(32'd8),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(32'd1)) m_f_r_arlen(.RST(RST_N),
					   .CLK(CLK),
					   .D_IN(m_f_r_arlen$D_IN),
					   .ENQ(m_f_r_arlen$ENQ),
					   .DEQ(m_f_r_arlen$DEQ),
					   .CLR(m_f_r_arlen$CLR),
					   .D_OUT(m_f_r_arlen$D_OUT),
					   .FULL_N(m_f_r_arlen$FULL_N),
					   .EMPTY_N(m_f_r_arlen$EMPTY_N));
  // submodule m_f_w_awlen
  SizedFIFO #(.p1width(32'd8),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(32'd1)) m_f_w_awlen(.RST(RST_N),
					   .CLK(CLK),
					   .D_IN(m_f_w_awlen$D_IN),
					   .ENQ(m_f_w_awlen$ENQ),
					   .DEQ(m_f_w_awlen$DEQ),
					   .CLR(m_f_w_awlen$CLR),
					   .D_OUT(m_f_w_awlen$D_OUT),
					   .FULL_N(m_f_w_awlen$FULL_N),
					   .EMPTY_N(m_f_w_awlen$EMPTY_N));
  // submodule m_xactor_from_master_f_rd_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) m_xactor_from_master_f_rd_addr(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(m_xactor_from_master_f_rd_addr$D_IN),
							  .ENQ(m_xactor_from_master_f_rd_addr$ENQ),
							  .DEQ(m_xactor_from_master_f_rd_addr$DEQ),
							  .CLR(m_xactor_from_master_f_rd_addr$CLR),
							  .D_OUT(m_xactor_from_master_f_rd_addr$D_OUT),
							  .FULL_N(m_xactor_from_master_f_rd_addr$FULL_N),
							  .EMPTY_N(m_xactor_from_master_f_rd_addr$EMPTY_N));
  // submodule m_xactor_from_master_f_rd_data
  FIFO2 #(.width(32'd71),
	  .guarded(32'd1)) m_xactor_from_master_f_rd_data(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(m_xactor_from_master_f_rd_data$D_IN),
							  .ENQ(m_xactor_from_master_f_rd_data$ENQ),
							  .DEQ(m_xactor_from_master_f_rd_data$DEQ),
							  .CLR(m_xactor_from_master_f_rd_data$CLR),
							  .D_OUT(m_xactor_from_master_f_rd_data$D_OUT),
							  .FULL_N(m_xactor_from_master_f_rd_data$FULL_N),
							  .EMPTY_N(m_xactor_from_master_f_rd_data$EMPTY_N));
  // submodule m_xactor_from_master_f_wr_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) m_xactor_from_master_f_wr_addr(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(m_xactor_from_master_f_wr_addr$D_IN),
							  .ENQ(m_xactor_from_master_f_wr_addr$ENQ),
							  .DEQ(m_xactor_from_master_f_wr_addr$DEQ),
							  .CLR(m_xactor_from_master_f_wr_addr$CLR),
							  .D_OUT(m_xactor_from_master_f_wr_addr$D_OUT),
							  .FULL_N(m_xactor_from_master_f_wr_addr$FULL_N),
							  .EMPTY_N(m_xactor_from_master_f_wr_addr$EMPTY_N));
  // submodule m_xactor_from_master_f_wr_data
  FIFO2 #(.width(32'd73),
	  .guarded(32'd1)) m_xactor_from_master_f_wr_data(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(m_xactor_from_master_f_wr_data$D_IN),
							  .ENQ(m_xactor_from_master_f_wr_data$ENQ),
							  .DEQ(m_xactor_from_master_f_wr_data$DEQ),
							  .CLR(m_xactor_from_master_f_wr_data$CLR),
							  .D_OUT(m_xactor_from_master_f_wr_data$D_OUT),
							  .FULL_N(m_xactor_from_master_f_wr_data$FULL_N),
							  .EMPTY_N(m_xactor_from_master_f_wr_data$EMPTY_N));
  // submodule m_xactor_from_master_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(32'd1)) m_xactor_from_master_f_wr_resp(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(m_xactor_from_master_f_wr_resp$D_IN),
							  .ENQ(m_xactor_from_master_f_wr_resp$ENQ),
							  .DEQ(m_xactor_from_master_f_wr_resp$DEQ),
							  .CLR(m_xactor_from_master_f_wr_resp$CLR),
							  .D_OUT(m_xactor_from_master_f_wr_resp$D_OUT),
							  .FULL_N(m_xactor_from_master_f_wr_resp$FULL_N),
							  .EMPTY_N(m_xactor_from_master_f_wr_resp$EMPTY_N));
  // submodule m_xactor_to_slave_f_rd_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) m_xactor_to_slave_f_rd_addr(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(m_xactor_to_slave_f_rd_addr$D_IN),
						       .ENQ(m_xactor_to_slave_f_rd_addr$ENQ),
						       .DEQ(m_xactor_to_slave_f_rd_addr$DEQ),
						       .CLR(m_xactor_to_slave_f_rd_addr$CLR),
						       .D_OUT(m_xactor_to_slave_f_rd_addr$D_OUT),
						       .FULL_N(m_xactor_to_slave_f_rd_addr$FULL_N),
						       .EMPTY_N(m_xactor_to_slave_f_rd_addr$EMPTY_N));
  // submodule m_xactor_to_slave_f_rd_data
  FIFO2 #(.width(32'd71),
	  .guarded(32'd1)) m_xactor_to_slave_f_rd_data(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(m_xactor_to_slave_f_rd_data$D_IN),
						       .ENQ(m_xactor_to_slave_f_rd_data$ENQ),
						       .DEQ(m_xactor_to_slave_f_rd_data$DEQ),
						       .CLR(m_xactor_to_slave_f_rd_data$CLR),
						       .D_OUT(m_xactor_to_slave_f_rd_data$D_OUT),
						       .FULL_N(m_xactor_to_slave_f_rd_data$FULL_N),
						       .EMPTY_N(m_xactor_to_slave_f_rd_data$EMPTY_N));
  // submodule m_xactor_to_slave_f_wr_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) m_xactor_to_slave_f_wr_addr(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(m_xactor_to_slave_f_wr_addr$D_IN),
						       .ENQ(m_xactor_to_slave_f_wr_addr$ENQ),
						       .DEQ(m_xactor_to_slave_f_wr_addr$DEQ),
						       .CLR(m_xactor_to_slave_f_wr_addr$CLR),
						       .D_OUT(m_xactor_to_slave_f_wr_addr$D_OUT),
						       .FULL_N(m_xactor_to_slave_f_wr_addr$FULL_N),
						       .EMPTY_N(m_xactor_to_slave_f_wr_addr$EMPTY_N));
  // submodule m_xactor_to_slave_f_wr_data
  FIFO2 #(.width(32'd73),
	  .guarded(32'd1)) m_xactor_to_slave_f_wr_data(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(m_xactor_to_slave_f_wr_data$D_IN),
						       .ENQ(m_xactor_to_slave_f_wr_data$ENQ),
						       .DEQ(m_xactor_to_slave_f_wr_data$DEQ),
						       .CLR(m_xactor_to_slave_f_wr_data$CLR),
						       .D_OUT(m_xactor_to_slave_f_wr_data$D_OUT),
						       .FULL_N(m_xactor_to_slave_f_wr_data$FULL_N),
						       .EMPTY_N(m_xactor_to_slave_f_wr_data$EMPTY_N));
  // submodule m_xactor_to_slave_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(32'd1)) m_xactor_to_slave_f_wr_resp(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(m_xactor_to_slave_f_wr_resp$D_IN),
						       .ENQ(m_xactor_to_slave_f_wr_resp$ENQ),
						       .DEQ(m_xactor_to_slave_f_wr_resp$DEQ),
						       .CLR(m_xactor_to_slave_f_wr_resp$CLR),
						       .D_OUT(m_xactor_to_slave_f_wr_resp$D_OUT),
						       .FULL_N(m_xactor_to_slave_f_wr_resp$FULL_N),
						       .EMPTY_N(m_xactor_to_slave_f_wr_resp$EMPTY_N));
  // rule RL_m_rl_wr_xaction_master_to_slave
  assign CAN_FIRE_RL_m_rl_wr_xaction_master_to_slave =
	     m_xactor_to_slave_f_wr_addr$FULL_N &&
	     m_xactor_from_master_f_wr_addr$EMPTY_N &&
	     m_xactor_to_slave_f_wr_data$FULL_N &&
	     m_xactor_from_master_f_wr_data$EMPTY_N &&
	     (m_rg_w_beat_count != 8'd0 || m_f_w_awlen$FULL_N) ;
  assign WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave =
	     CAN_FIRE_RL_m_rl_wr_xaction_master_to_slave ;
  // rule RL_m_rl_wr_resp_slave_to_master
  assign CAN_FIRE_RL_m_rl_wr_resp_slave_to_master =
	     m_xactor_to_slave_f_wr_resp$EMPTY_N && m_f_w_awlen$EMPTY_N &&
	     (m_rg_b_beat_count_6_ULT_m_f_w_awlen_first__7___d58 ||
	      m_xactor_from_master_f_wr_resp$FULL_N) ;
  assign WILL_FIRE_RL_m_rl_wr_resp_slave_to_master =
	     CAN_FIRE_RL_m_rl_wr_resp_slave_to_master ;
  // rule RL_m_rl_rd_xaction_master_to_slave
  assign CAN_FIRE_RL_m_rl_rd_xaction_master_to_slave =
	     m_xactor_to_slave_f_rd_addr$FULL_N &&
	     m_xactor_from_master_f_rd_addr$EMPTY_N &&
	     (m_rg_ar_beat_count != 8'd0 || m_f_r_arlen$FULL_N) ;
  assign WILL_FIRE_RL_m_rl_rd_xaction_master_to_slave =
	     CAN_FIRE_RL_m_rl_rd_xaction_master_to_slave ;
  // rule RL_m_rl_rd_resp_slave_to_master
  assign CAN_FIRE_RL_m_rl_rd_resp_slave_to_master =
	     m_xactor_to_slave_f_rd_data$EMPTY_N && m_f_r_arlen$EMPTY_N &&
	     m_xactor_from_master_f_rd_data$FULL_N ;
  assign WILL_FIRE_RL_m_rl_rd_resp_slave_to_master =
	     CAN_FIRE_RL_m_rl_rd_resp_slave_to_master ;
  // rule RL_m_rl_reset
  assign CAN_FIRE_RL_m_rl_reset = m_rg_reset ;
  assign WILL_FIRE_RL_m_rl_reset = m_rg_reset ;
  // inputs to muxes for submodule ports
  assign MUX_m_rg_b_resp$write_1__SEL_2 =
	     WILL_FIRE_RL_m_rl_wr_resp_slave_to_master &&
	     (m_rg_b_resp == 2'b0 &&
	      m_xactor_to_slave_f_wr_resp$D_OUT[1:0] != 2'b0 ||
	      !m_rg_b_beat_count_6_ULT_m_f_w_awlen_first__7___d58) ;
  assign MUX_m_rg_ar_beat_count$write_1__VAL_2 =
	     m_rg_ar_beat_count_0_ULT_m_xactor_from_master__ETC___d110 ?
	       x__h3420 :
	       8'd0 ;
  assign MUX_m_rg_b_beat_count$write_1__VAL_2 =
	     m_rg_b_beat_count_6_ULT_m_f_w_awlen_first__7___d58 ?
	       x__h2925 :
	       8'd0 ;
  assign MUX_m_rg_b_resp$write_1__VAL_2 =
	     m_rg_b_beat_count_6_ULT_m_f_w_awlen_first__7___d58 ?
	       m_xactor_to_slave_f_wr_resp$D_OUT[1:0] :
	       2'b0 ;
  assign MUX_m_rg_r_beat_count$write_1__VAL_2 =
	     m_rg_r_beat_count_19_ULT_m_f_r_arlen_first__20___d121 ?
	       x__h3653 :
	       8'd0 ;
  assign MUX_m_rg_w_beat_count$write_1__VAL_2 =
	     m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 ?
	       x__h2401 :
	       8'd0 ;
  // register m_rg_ar_beat_count
  assign m_rg_ar_beat_count$D_IN =
	     m_rg_reset ? 8'd0 : MUX_m_rg_ar_beat_count$write_1__VAL_2 ;
  assign m_rg_ar_beat_count$EN =
	     WILL_FIRE_RL_m_rl_rd_xaction_master_to_slave || m_rg_reset ;
  // register m_rg_b_beat_count
  assign m_rg_b_beat_count$D_IN =
	     m_rg_reset ? 8'd0 : MUX_m_rg_b_beat_count$write_1__VAL_2 ;
  assign m_rg_b_beat_count$EN =
	     WILL_FIRE_RL_m_rl_wr_resp_slave_to_master || m_rg_reset ;
  // register m_rg_b_resp
  assign m_rg_b_resp$D_IN =
	     m_rg_reset ? 2'b0 : MUX_m_rg_b_resp$write_1__VAL_2 ;
  assign m_rg_b_resp$EN = MUX_m_rg_b_resp$write_1__SEL_2 || m_rg_reset ;
  // register m_rg_last_beat_raddr
  assign m_rg_last_beat_raddr$D_IN = a_out_araddr__h3122 ;
  assign m_rg_last_beat_raddr$EN =
	     CAN_FIRE_RL_m_rl_rd_xaction_master_to_slave ;
  // register m_rg_last_beat_waddr
  assign m_rg_last_beat_waddr$D_IN = a_out_awaddr__h2001 ;
  assign m_rg_last_beat_waddr$EN =
	     CAN_FIRE_RL_m_rl_wr_xaction_master_to_slave ;
  // register m_rg_r_beat_count
  assign m_rg_r_beat_count$D_IN =
	     m_rg_reset ? 8'd0 : MUX_m_rg_r_beat_count$write_1__VAL_2 ;
  assign m_rg_r_beat_count$EN =
	     WILL_FIRE_RL_m_rl_rd_resp_slave_to_master || m_rg_reset ;
  // register m_rg_reset
  assign m_rg_reset$D_IN = !m_rg_reset ;
  assign m_rg_reset$EN = m_rg_reset || EN_reset ;
  // register m_rg_w_beat_count
  assign m_rg_w_beat_count$D_IN =
	     m_rg_reset ? 8'd0 : MUX_m_rg_w_beat_count$write_1__VAL_2 ;
  assign m_rg_w_beat_count$EN =
	     WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave || m_rg_reset ;
  // submodule m_f_r_arlen
  assign m_f_r_arlen$D_IN = m_xactor_from_master_f_rd_addr$D_OUT[28:21] ;
  assign m_f_r_arlen$ENQ =
	     WILL_FIRE_RL_m_rl_rd_xaction_master_to_slave &&
	     m_rg_ar_beat_count == 8'd0 ;
  assign m_f_r_arlen$DEQ =
	     WILL_FIRE_RL_m_rl_rd_resp_slave_to_master &&
	     !m_rg_r_beat_count_19_ULT_m_f_r_arlen_first__20___d121 ;
  assign m_f_r_arlen$CLR = m_rg_reset ;
  // submodule m_f_w_awlen
  assign m_f_w_awlen$D_IN = m_xactor_from_master_f_wr_addr$D_OUT[28:21] ;
  assign m_f_w_awlen$ENQ =
	     WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	     m_rg_w_beat_count == 8'd0 ;
  assign m_f_w_awlen$DEQ =
	     WILL_FIRE_RL_m_rl_wr_resp_slave_to_master &&
	     !m_rg_b_beat_count_6_ULT_m_f_w_awlen_first__7___d58 ;
  assign m_f_w_awlen$CLR = m_rg_reset ;
  // submodule m_xactor_from_master_f_rd_addr
  assign m_xactor_from_master_f_rd_addr$D_IN =
	     { from_master_arid,
	       from_master_araddr,
	       from_master_arlen,
	       from_master_arsize,
	       from_master_arburst,
	       from_master_arlock,
	       from_master_arcache,
	       from_master_arprot,
	       from_master_arqos,
	       from_master_arregion } ;
  assign m_xactor_from_master_f_rd_addr$ENQ =
	     from_master_arvalid && m_xactor_from_master_f_rd_addr$FULL_N ;
  assign m_xactor_from_master_f_rd_addr$DEQ =
	     WILL_FIRE_RL_m_rl_rd_xaction_master_to_slave &&
	     !m_rg_ar_beat_count_0_ULT_m_xactor_from_master__ETC___d110 ;
  assign m_xactor_from_master_f_rd_addr$CLR = m_rg_reset ;
  // submodule m_xactor_from_master_f_rd_data
  assign m_xactor_from_master_f_rd_data$D_IN =
	     { m_xactor_to_slave_f_rd_data$D_OUT[70:1],
	       !m_rg_r_beat_count_19_ULT_m_f_r_arlen_first__20___d121 } ;
  assign m_xactor_from_master_f_rd_data$ENQ =
	     CAN_FIRE_RL_m_rl_rd_resp_slave_to_master ;
  assign m_xactor_from_master_f_rd_data$DEQ =
	     from_master_rready && m_xactor_from_master_f_rd_data$EMPTY_N ;
  assign m_xactor_from_master_f_rd_data$CLR = m_rg_reset ;
  // submodule m_xactor_from_master_f_wr_addr
  assign m_xactor_from_master_f_wr_addr$D_IN =
	     { from_master_awid,
	       from_master_awaddr,
	       from_master_awlen,
	       from_master_awsize,
	       from_master_awburst,
	       from_master_awlock,
	       from_master_awcache,
	       from_master_awprot,
	       from_master_awqos,
	       from_master_awregion } ;
  assign m_xactor_from_master_f_wr_addr$ENQ =
	     from_master_awvalid && m_xactor_from_master_f_wr_addr$FULL_N ;
  assign m_xactor_from_master_f_wr_addr$DEQ =
	     WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	     !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 ;
  assign m_xactor_from_master_f_wr_addr$CLR = m_rg_reset ;
  // submodule m_xactor_from_master_f_wr_data
  assign m_xactor_from_master_f_wr_data$D_IN =
	     { from_master_wdata, from_master_wstrb, from_master_wlast } ;
  assign m_xactor_from_master_f_wr_data$ENQ =
	     from_master_wvalid && m_xactor_from_master_f_wr_data$FULL_N ;
  assign m_xactor_from_master_f_wr_data$DEQ =
	     CAN_FIRE_RL_m_rl_wr_xaction_master_to_slave ;
  assign m_xactor_from_master_f_wr_data$CLR = m_rg_reset ;
  // submodule m_xactor_from_master_f_wr_resp
  assign m_xactor_from_master_f_wr_resp$D_IN =
	     { m_xactor_to_slave_f_wr_resp$D_OUT[5:2],
	       (m_rg_b_resp == 2'b0) ?
		 m_xactor_to_slave_f_wr_resp$D_OUT[1:0] :
		 m_rg_b_resp } ;
  assign m_xactor_from_master_f_wr_resp$ENQ =
	     WILL_FIRE_RL_m_rl_wr_resp_slave_to_master &&
	     !m_rg_b_beat_count_6_ULT_m_f_w_awlen_first__7___d58 ;
  assign m_xactor_from_master_f_wr_resp$DEQ =
	     from_master_bready && m_xactor_from_master_f_wr_resp$EMPTY_N ;
  assign m_xactor_from_master_f_wr_resp$CLR = m_rg_reset ;
  // submodule m_xactor_to_slave_f_rd_addr
  assign m_xactor_to_slave_f_rd_addr$D_IN =
	     { m_xactor_from_master_f_rd_addr$D_OUT[96:93],
	       a_out_araddr__h3122,
	       8'd0,
	       m_xactor_from_master_f_rd_addr$D_OUT[20:18],
	       2'b0,
	       m_xactor_from_master_f_rd_addr$D_OUT[15:0] } ;
  assign m_xactor_to_slave_f_rd_addr$ENQ =
	     CAN_FIRE_RL_m_rl_rd_xaction_master_to_slave ;
  assign m_xactor_to_slave_f_rd_addr$DEQ =
	     m_xactor_to_slave_f_rd_addr$EMPTY_N && to_slave_arready ;
  assign m_xactor_to_slave_f_rd_addr$CLR = m_rg_reset ;
  // submodule m_xactor_to_slave_f_rd_data
  assign m_xactor_to_slave_f_rd_data$D_IN =
	     { to_slave_rid,
	       to_slave_rdata,
	       to_slave_rresp,
	       to_slave_rlast } ;
  assign m_xactor_to_slave_f_rd_data$ENQ =
	     to_slave_rvalid && m_xactor_to_slave_f_rd_data$FULL_N ;
  assign m_xactor_to_slave_f_rd_data$DEQ =
	     CAN_FIRE_RL_m_rl_rd_resp_slave_to_master ;
  assign m_xactor_to_slave_f_rd_data$CLR = m_rg_reset ;
  // submodule m_xactor_to_slave_f_wr_addr
  assign m_xactor_to_slave_f_wr_addr$D_IN =
	     { m_xactor_from_master_f_wr_addr$D_OUT[96:93],
	       a_out_awaddr__h2001,
	       8'd0,
	       m_xactor_from_master_f_wr_addr$D_OUT[20:18],
	       2'b0,
	       m_xactor_from_master_f_wr_addr$D_OUT[15:0] } ;
  assign m_xactor_to_slave_f_wr_addr$ENQ =
	     CAN_FIRE_RL_m_rl_wr_xaction_master_to_slave ;
  assign m_xactor_to_slave_f_wr_addr$DEQ =
	     m_xactor_to_slave_f_wr_addr$EMPTY_N && to_slave_awready ;
  assign m_xactor_to_slave_f_wr_addr$CLR = m_rg_reset ;
  // submodule m_xactor_to_slave_f_wr_data
  assign m_xactor_to_slave_f_wr_data$D_IN =
	     { m_xactor_from_master_f_wr_data$D_OUT[72:1], 1'd1 } ;
  assign m_xactor_to_slave_f_wr_data$ENQ =
	     CAN_FIRE_RL_m_rl_wr_xaction_master_to_slave ;
  assign m_xactor_to_slave_f_wr_data$DEQ =
	     m_xactor_to_slave_f_wr_data$EMPTY_N && to_slave_wready ;
  assign m_xactor_to_slave_f_wr_data$CLR = m_rg_reset ;
  // submodule m_xactor_to_slave_f_wr_resp
  assign m_xactor_to_slave_f_wr_resp$D_IN = { to_slave_bid, to_slave_bresp } ;
  assign m_xactor_to_slave_f_wr_resp$ENQ =
	     to_slave_bvalid && m_xactor_to_slave_f_wr_resp$FULL_N ;
  assign m_xactor_to_slave_f_wr_resp$DEQ =
	     CAN_FIRE_RL_m_rl_wr_resp_slave_to_master ;
  assign m_xactor_to_slave_f_wr_resp$CLR = m_rg_reset ;
  // remaining internal signals
  assign IF_m_xactor_from_master_f_rd_addr_first__7_BIT_ETC___d104 =
	     (m_xactor_from_master_f_rd_addr$D_OUT[17:16] == 2'b10) ?
	       ((m_rg_last_beat_raddr_2_PLUS_1_SL_m_xactor_from_ETC___d100 ==
		 64'd0) ?
		  addr___1__h3272 :
		  addr__h3204) :
	       addr__h3204 ;
  assign IF_m_xactor_from_master_f_wr_addr_first__7_BIT_ETC___d34 =
	     (m_xactor_from_master_f_wr_addr$D_OUT[17:16] == 2'b10) ?
	       ((m_rg_last_beat_waddr_2_PLUS_1_SL_m_xactor_from_ETC___d30 ==
		 64'd0) ?
		  addr___1__h2153 :
		  addr__h2083) :
	       addr__h2083 ;
  assign a_out_araddr__h3122 =
	     (m_rg_ar_beat_count == 8'd0) ?
	       m_xactor_from_master_f_rd_addr$D_OUT[92:29] :
	       IF_m_xactor_from_master_f_rd_addr_first__7_BIT_ETC___d104 ;
  assign a_out_awaddr__h2001 =
	     (m_rg_w_beat_count == 8'd0) ?
	       m_xactor_from_master_f_wr_addr$D_OUT[92:29] :
	       IF_m_xactor_from_master_f_wr_addr_first__7_BIT_ETC___d34 ;
  assign addr___1__h2153 = addr__h2083 - wrap_boundary__h2085 ;
  assign addr___1__h3272 = addr__h3204 - wrap_boundary__h3206 ;
  assign addr__h2083 =
	     m_rg_last_beat_waddr +
	     (64'd1 << m_xactor_from_master_f_wr_addr$D_OUT[20:18]) ;
  assign addr__h3204 =
	     m_rg_last_beat_raddr +
	     (64'd1 << m_xactor_from_master_f_rd_addr$D_OUT[20:18]) ;
  assign burst_len__h2084 =
	     { 56'd0, m_xactor_from_master_f_wr_addr$D_OUT[28:21] } + 64'd1 ;
  assign burst_len__h3205 =
	     { 56'd0, m_xactor_from_master_f_rd_addr$D_OUT[28:21] } + 64'd1 ;
  assign m_rg_ar_beat_count_0_ULT_m_xactor_from_master__ETC___d110 =
	     m_rg_ar_beat_count <
	     m_xactor_from_master_f_rd_addr$D_OUT[28:21] ;
  assign m_rg_b_beat_count_6_ULT_m_f_w_awlen_first__7___d58 =
	     m_rg_b_beat_count < m_f_w_awlen$D_OUT ;
  assign m_rg_last_beat_raddr_2_PLUS_1_SL_m_xactor_from_ETC___d100 =
	     addr__h3204 % wrap_boundary__h3206 ;
  assign m_rg_last_beat_waddr_2_PLUS_1_SL_m_xactor_from_ETC___d30 =
	     addr__h2083 % wrap_boundary__h2085 ;
  assign m_rg_r_beat_count_19_ULT_m_f_r_arlen_first__20___d121 =
	     m_rg_r_beat_count < m_f_r_arlen$D_OUT ;
  assign m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 =
	     m_rg_w_beat_count < m_xactor_from_master_f_wr_addr$D_OUT[28:21] ;
  assign wrap_boundary__h2085 =
	     burst_len__h2084 << m_xactor_from_master_f_wr_addr$D_OUT[20:18] ;
  assign wrap_boundary__h3206 =
	     burst_len__h3205 << m_xactor_from_master_f_rd_addr$D_OUT[20:18] ;
  assign x__h2401 = m_rg_w_beat_count + 8'd1 ;
  assign x__h2925 = m_rg_b_beat_count + 8'd1 ;
  assign x__h3420 = m_rg_ar_beat_count + 8'd1 ;
  assign x__h3653 = m_rg_r_beat_count + 8'd1 ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        m_rg_ar_beat_count <= `BSV_ASSIGNMENT_DELAY 8'd0;
	m_rg_b_beat_count <= `BSV_ASSIGNMENT_DELAY 8'd0;
	m_rg_b_resp <= `BSV_ASSIGNMENT_DELAY 2'b0;
	m_rg_r_beat_count <= `BSV_ASSIGNMENT_DELAY 8'd0;
	m_rg_reset <= `BSV_ASSIGNMENT_DELAY 1'd1;
	m_rg_w_beat_count <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (m_rg_ar_beat_count$EN)
	  m_rg_ar_beat_count <= `BSV_ASSIGNMENT_DELAY m_rg_ar_beat_count$D_IN;
	if (m_rg_b_beat_count$EN)
	  m_rg_b_beat_count <= `BSV_ASSIGNMENT_DELAY m_rg_b_beat_count$D_IN;
	if (m_rg_b_resp$EN)
	  m_rg_b_resp <= `BSV_ASSIGNMENT_DELAY m_rg_b_resp$D_IN;
	if (m_rg_r_beat_count$EN)
	  m_rg_r_beat_count <= `BSV_ASSIGNMENT_DELAY m_rg_r_beat_count$D_IN;
	if (m_rg_reset$EN)
	  m_rg_reset <= `BSV_ASSIGNMENT_DELAY m_rg_reset$D_IN;
	if (m_rg_w_beat_count$EN)
	  m_rg_w_beat_count <= `BSV_ASSIGNMENT_DELAY m_rg_w_beat_count$D_IN;
      end
    if (m_rg_last_beat_raddr$EN)
      m_rg_last_beat_raddr <= `BSV_ASSIGNMENT_DELAY m_rg_last_beat_raddr$D_IN;
    if (m_rg_last_beat_waddr$EN)
      m_rg_last_beat_waddr <= `BSV_ASSIGNMENT_DELAY m_rg_last_beat_waddr$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    m_rg_ar_beat_count = 8'hAA;
    m_rg_b_beat_count = 8'hAA;
    m_rg_b_resp = 2'h2;
    m_rg_last_beat_raddr = 64'hAAAAAAAAAAAAAAAA;
    m_rg_last_beat_waddr = 64'hAAAAAAAAAAAAAAAA;
    m_rg_r_beat_count = 8'hAA;
    m_rg_reset = 1'h0;
    m_rg_w_beat_count = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	begin
	  v__h2538 = $stime;
	  #0;
	end
    v__h2532 = v__h2538 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$display("%0d: ERROR: %m::AXI4_Deburster.rl_wr_xaction_master_to_slave: m -> s",
		 v__h2532);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$display("    WLAST not set on last data beat (awlen = %0d)",
		 m_xactor_from_master_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$write("'h%h", m_xactor_from_master_f_wr_data$D_OUT[72:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$write("'h%h", m_xactor_from_master_f_wr_data$D_OUT[8:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_m_rl_wr_xaction_master_to_slave &&
	  !m_rg_w_beat_count_ULT_m_xactor_from_master_f_w_ETC___d43 &&
	  !m_xactor_from_master_f_wr_data$D_OUT[0])
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (m_rg_reset)
	begin
	  v__h1445 = $stime;
	  #0;
	end
    v__h1439 = v__h1445 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (m_rg_reset) $display("%0d: %m::AXI4_Deburster.rl_reset", v__h1439);
  end
  // synopsys translate_on
endmodule