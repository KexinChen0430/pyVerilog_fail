module outputs
  wire [23 : 0] flash_addr;
  wire [15 : 0] user_response_get;
  wire RDY_user_request_put,
       RDY_user_response_get,
       RDY_user_waitBit,
       flash_adv_n,
       flash_ce_n,
       flash_oe_n,
       flash_rst_n,
       flash_we_n,
       flash_wp_n,
       user_waitBit;
  // inlined wires
  wire rseqFsm_abort_wget,
       rseqFsm_abort_whas,
       rseqFsm_start_reg_2_wget,
       rseqFsm_start_reg_2_whas,
       rseqFsm_start_wire_wget,
       rseqFsm_start_wire_whas,
       rseqFsm_state_fired_1_wget,
       rseqFsm_state_fired_1_whas,
       rseqFsm_state_overlap_pw_whas,
       rseqFsm_state_set_pw_whas,
       wseqFsm_abort_wget,
       wseqFsm_abort_whas,
       wseqFsm_start_reg_2_wget,
       wseqFsm_start_reg_2_whas,
       wseqFsm_start_wire_wget,
       wseqFsm_start_wire_whas,
       wseqFsm_state_fired_1_wget,
       wseqFsm_state_fired_1_whas,
       wseqFsm_state_overlap_pw_whas,
       wseqFsm_state_set_pw_whas;
  // register aReg
  reg [23 : 0] aReg;
  wire [23 : 0] aReg_D_IN;
  wire aReg_EN;
  // register ceReg
  reg ceReg;
  wire ceReg_D_IN, ceReg_EN;
  // register isRead
  reg isRead;
  wire isRead_D_IN, isRead_EN;
  // register oeReg
  reg oeReg;
  wire oeReg_D_IN, oeReg_EN;
  // register rseqFsm_jj_delay_count
  reg [14 : 0] rseqFsm_jj_delay_count;
  wire [14 : 0] rseqFsm_jj_delay_count_D_IN;
  wire rseqFsm_jj_delay_count_EN;
  // register rseqFsm_start_reg
  reg rseqFsm_start_reg;
  wire rseqFsm_start_reg_D_IN, rseqFsm_start_reg_EN;
  // register rseqFsm_start_reg_1
  reg rseqFsm_start_reg_1;
  wire rseqFsm_start_reg_1_D_IN, rseqFsm_start_reg_1_EN;
  // register rseqFsm_state_can_overlap
  reg rseqFsm_state_can_overlap;
  wire rseqFsm_state_can_overlap_D_IN, rseqFsm_state_can_overlap_EN;
  // register rseqFsm_state_fired
  reg rseqFsm_state_fired;
  wire rseqFsm_state_fired_D_IN, rseqFsm_state_fired_EN;
  // register rseqFsm_state_mkFSMstate
  reg [3 : 0] rseqFsm_state_mkFSMstate;
  reg [3 : 0] rseqFsm_state_mkFSMstate_D_IN;
  wire rseqFsm_state_mkFSMstate_EN;
  // register tmpWD
  reg [15 : 0] tmpWD;
  wire [15 : 0] tmpWD_D_IN;
  wire tmpWD_EN;
  // register tsOE
  reg tsOE;
  wire tsOE_D_IN, tsOE_EN;
  // register tsWD
  reg [15 : 0] tsWD;
  wire [15 : 0] tsWD_D_IN;
  wire tsWD_EN;
  // register waitReg
  reg waitReg;
  wire waitReg_D_IN, waitReg_EN;
  // register wdReg
  reg [15 : 0] wdReg;
  wire [15 : 0] wdReg_D_IN;
  wire wdReg_EN;
  // register weReg
  reg weReg;
  wire weReg_D_IN, weReg_EN;
  // register wseqFsm_jj_1_delay_count
  reg [6 : 0] wseqFsm_jj_1_delay_count;
  wire [6 : 0] wseqFsm_jj_1_delay_count_D_IN;
  wire wseqFsm_jj_1_delay_count_EN;
  // register wseqFsm_jj_2_delay_count
  reg [6 : 0] wseqFsm_jj_2_delay_count;
  wire [6 : 0] wseqFsm_jj_2_delay_count_D_IN;
  wire wseqFsm_jj_2_delay_count_EN;
  // register wseqFsm_jj_delay_count
  reg [6 : 0] wseqFsm_jj_delay_count;
  wire [6 : 0] wseqFsm_jj_delay_count_D_IN;
  wire wseqFsm_jj_delay_count_EN;
  // register wseqFsm_start_reg
  reg wseqFsm_start_reg;
  wire wseqFsm_start_reg_D_IN, wseqFsm_start_reg_EN;
  // register wseqFsm_start_reg_1
  reg wseqFsm_start_reg_1;
  wire wseqFsm_start_reg_1_D_IN, wseqFsm_start_reg_1_EN;
  // register wseqFsm_state_can_overlap
  reg wseqFsm_state_can_overlap;
  wire wseqFsm_state_can_overlap_D_IN, wseqFsm_state_can_overlap_EN;
  // register wseqFsm_state_fired
  reg wseqFsm_state_fired;
  wire wseqFsm_state_fired_D_IN, wseqFsm_state_fired_EN;
  // register wseqFsm_state_mkFSMstate
  reg [4 : 0] wseqFsm_state_mkFSMstate;
  reg [4 : 0] wseqFsm_state_mkFSMstate_D_IN;
  wire wseqFsm_state_mkFSMstate_EN;
  // ports of submodule reqF
  wire [40 : 0] reqF_D_IN, reqF_D_OUT;
  wire reqF_CLR, reqF_DEQ, reqF_EMPTY_N, reqF_ENQ, reqF_FULL_N;
  // ports of submodule respF
  wire [15 : 0] respF_D_IN, respF_D_OUT;
  wire respF_CLR, respF_DEQ, respF_EMPTY_N, respF_ENQ, respF_FULL_N;
  // ports of submodule tsd
  wire [15 : 0] tsd_IO, tsd_O;
  // rule scheduling signals
  wire WILL_FIRE_RL_nextRequest,
       WILL_FIRE_RL_rseqFsm_action_d_init_np,
       WILL_FIRE_RL_rseqFsm_action_l60c12,
       WILL_FIRE_RL_rseqFsm_action_l61c12,
       WILL_FIRE_RL_rseqFsm_action_l63c10,
       WILL_FIRE_RL_rseqFsm_action_l64c12,
       WILL_FIRE_RL_rseqFsm_action_l65c12,
       WILL_FIRE_RL_rseqFsm_action_np,
       WILL_FIRE_RL_rseqFsm_fsm_start,
       WILL_FIRE_RL_rseqFsm_idle_l59c15,
       WILL_FIRE_RL_wseqFsm_action_d_init_np,
       WILL_FIRE_RL_wseqFsm_action_d_init_np_1,
       WILL_FIRE_RL_wseqFsm_action_d_init_np_2,
       WILL_FIRE_RL_wseqFsm_action_l70c12,
       WILL_FIRE_RL_wseqFsm_action_l71c12,
       WILL_FIRE_RL_wseqFsm_action_l72c12,
       WILL_FIRE_RL_wseqFsm_action_l73c12,
       WILL_FIRE_RL_wseqFsm_action_l75c12,
       WILL_FIRE_RL_wseqFsm_action_l76c12,
       WILL_FIRE_RL_wseqFsm_action_l78c12,
       WILL_FIRE_RL_wseqFsm_action_l79c12,
       WILL_FIRE_RL_wseqFsm_action_l80c12,
       WILL_FIRE_RL_wseqFsm_action_l82c12,
       WILL_FIRE_RL_wseqFsm_action_l83c12,
       WILL_FIRE_RL_wseqFsm_action_l84c12,
       WILL_FIRE_RL_wseqFsm_action_l87c12,
       WILL_FIRE_RL_wseqFsm_action_l88c12,
       WILL_FIRE_RL_wseqFsm_action_l90c12,
       WILL_FIRE_RL_wseqFsm_action_l91c12,
       WILL_FIRE_RL_wseqFsm_action_np,
       WILL_FIRE_RL_wseqFsm_action_np_1,
       WILL_FIRE_RL_wseqFsm_action_np_2,
       WILL_FIRE_RL_wseqFsm_action_np_3,
       WILL_FIRE_RL_wseqFsm_action_np_4,
       WILL_FIRE_RL_wseqFsm_fsm_start,
       WILL_FIRE_RL_wseqFsm_idle_l69c15;
  // inputs to muxes for submodule ports
  wire [14 : 0] MUX_rseqFsm_jj_delay_count_write_1__VAL_1;
  wire [6 : 0] MUX_wseqFsm_jj_1_delay_count_write_1__VAL_1,
	       MUX_wseqFsm_jj_2_delay_count_write_1__VAL_1,
	       MUX_wseqFsm_jj_delay_count_write_1__VAL_1;
  wire MUX_ceReg_write_1__SEL_1,
       MUX_oeReg_write_1__SEL_1,
       MUX_rseqFsm_start_reg_write_1__SEL_1,
       MUX_weReg_write_1__SEL_1,
       MUX_wseqFsm_start_reg_write_1__SEL_1;
  // remaining internal signals
  wire IF_reqF_first__11_BIT_40_12_THEN_rseqFsm_abort_ETC___d217,
       rseqFsm_abort_whas_AND_rseqFsm_abort_wget_OR_r_ETC___d71,
       wseqFsm_abort_whas__7_AND_wseqFsm_abort_wget___ETC___d207;
  // value method flash_addr
  assign flash_addr = aReg ;
  // value method flash_ce_n
  assign flash_ce_n = !ceReg ;
  // value method flash_oe_n
  assign flash_oe_n = !oeReg ;
  // value method flash_we_n
  assign flash_we_n = !weReg ;
  // value method flash_wp_n
  assign flash_wp_n = 1'd1 ;
  // value method flash_rst_n
  assign flash_rst_n = 1'd1 ;
  // value method flash_adv_n
  assign flash_adv_n = 1'd0 ;
  // action method user_request_put
  assign RDY_user_request_put = reqF_FULL_N ;
  // actionvalue method user_response_get
  assign user_response_get = respF_D_OUT ;
  assign RDY_user_response_get = respF_EMPTY_N ;
  // value method user_waitBit
  assign user_waitBit = waitReg ;
  assign RDY_user_waitBit = 1'd1 ;
  // submodule reqF
  FIFO2 #(.width(32'd41), .guarded(32'd1)) reqF(.RST(RST_N),
						.CLK(CLK),
						.D_IN(reqF_D_IN),
						.ENQ(reqF_ENQ),
						.DEQ(reqF_DEQ),
						.CLR(reqF_CLR),
						.D_OUT(reqF_D_OUT),
						.FULL_N(reqF_FULL_N),
						.EMPTY_N(reqF_EMPTY_N));
  // submodule respF
  FIFO2 #(.width(32'd16), .guarded(32'd1)) respF(.RST(RST_N),
						 .CLK(CLK),
						 .D_IN(respF_D_IN),
						 .ENQ(respF_ENQ),
						 .DEQ(respF_DEQ),
						 .CLR(respF_CLR),
						 .D_OUT(respF_D_OUT),
						 .FULL_N(respF_FULL_N),
						 .EMPTY_N(respF_EMPTY_N));
  // submodule tsd
  TriState #(.width(32'd16)) tsd(.I(tsWD), .OE(tsOE), .O(tsd_O), .IO(tsd_IO));
  // rule RL_rseqFsm_action_l61c12
  assign WILL_FIRE_RL_rseqFsm_action_l61c12 =
	     isRead && rseqFsm_state_mkFSMstate == 4'd1 ;
  // rule RL_rseqFsm_action_d_init_np
  assign WILL_FIRE_RL_rseqFsm_action_d_init_np =
	     isRead && rseqFsm_state_mkFSMstate == 4'd2 ;
  // rule RL_rseqFsm_action_np
  assign WILL_FIRE_RL_rseqFsm_action_np =
	     isRead && !rseqFsm_jj_delay_count[14] &&
	     (rseqFsm_state_mkFSMstate == 4'd3 ||
	      rseqFsm_state_mkFSMstate == 4'd4) ;
  // rule RL_rseqFsm_action_l63c10
  assign WILL_FIRE_RL_rseqFsm_action_l63c10 =
	     respF_FULL_N && isRead && rseqFsm_jj_delay_count[14] &&
	     (rseqFsm_state_mkFSMstate == 4'd3 ||
	      rseqFsm_state_mkFSMstate == 4'd4) ;
  // rule RL_rseqFsm_action_l64c12
  assign WILL_FIRE_RL_rseqFsm_action_l64c12 =
	     isRead && rseqFsm_state_mkFSMstate == 4'd5 ;
  // rule RL_rseqFsm_action_l65c12
  assign WILL_FIRE_RL_rseqFsm_action_l65c12 =
	     isRead && rseqFsm_state_mkFSMstate == 4'd6 ;
  // rule RL_rseqFsm_fsm_start
  assign WILL_FIRE_RL_rseqFsm_fsm_start =
	     rseqFsm_abort_whas_AND_rseqFsm_abort_wget_OR_r_ETC___d71 &&
	     rseqFsm_start_reg ;
  // rule RL_rseqFsm_action_l60c12
  assign WILL_FIRE_RL_rseqFsm_action_l60c12 =
	     isRead && rseqFsm_start_wire_whas &&
	     (rseqFsm_state_mkFSMstate == 4'd0 ||
	      rseqFsm_state_mkFSMstate == 4'd7) ;
  // rule RL_rseqFsm_idle_l59c15
  assign WILL_FIRE_RL_rseqFsm_idle_l59c15 =
	     !rseqFsm_start_wire_whas && rseqFsm_state_mkFSMstate == 4'd7 ;
  // rule RL_wseqFsm_action_l71c12
  assign WILL_FIRE_RL_wseqFsm_action_l71c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd1 ;
  // rule RL_wseqFsm_action_l72c12
  assign WILL_FIRE_RL_wseqFsm_action_l72c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd2 ;
  // rule RL_wseqFsm_action_l73c12
  assign WILL_FIRE_RL_wseqFsm_action_l73c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd3 ;
  // rule RL_wseqFsm_action_d_init_np
  assign WILL_FIRE_RL_wseqFsm_action_d_init_np =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd4 ;
  // rule RL_wseqFsm_action_np
  assign WILL_FIRE_RL_wseqFsm_action_np =
	     !isRead && !wseqFsm_jj_delay_count[6] &&
	     (wseqFsm_state_mkFSMstate == 5'd5 ||
	      wseqFsm_state_mkFSMstate == 5'd6) ;
  // rule RL_wseqFsm_action_l75c12
  assign WILL_FIRE_RL_wseqFsm_action_l75c12 =
	     !isRead && wseqFsm_jj_delay_count[6] &&
	     (wseqFsm_state_mkFSMstate == 5'd5 ||
	      wseqFsm_state_mkFSMstate == 5'd6) ;
  // rule RL_wseqFsm_action_l76c12
  assign WILL_FIRE_RL_wseqFsm_action_l76c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd7 ;
  // rule RL_wseqFsm_action_np_1
  assign WILL_FIRE_RL_wseqFsm_action_np_1 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd8 ;
  // rule RL_wseqFsm_action_l78c12
  assign WILL_FIRE_RL_wseqFsm_action_l78c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd9 ;
  // rule RL_wseqFsm_action_l79c12
  assign WILL_FIRE_RL_wseqFsm_action_l79c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd10 ;
  // rule RL_wseqFsm_action_l80c12
  assign WILL_FIRE_RL_wseqFsm_action_l80c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd11 ;
  // rule RL_wseqFsm_action_d_init_np_1
  assign WILL_FIRE_RL_wseqFsm_action_d_init_np_1 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd12 ;
  // rule RL_wseqFsm_action_np_2
  assign WILL_FIRE_RL_wseqFsm_action_np_2 =
	     !isRead && !wseqFsm_jj_1_delay_count[6] &&
	     (wseqFsm_state_mkFSMstate == 5'd13 ||
	      wseqFsm_state_mkFSMstate == 5'd14) ;
  // rule RL_wseqFsm_action_l82c12
  assign WILL_FIRE_RL_wseqFsm_action_l82c12 =
	     !isRead && wseqFsm_jj_1_delay_count[6] &&
	     (wseqFsm_state_mkFSMstate == 5'd13 ||
	      wseqFsm_state_mkFSMstate == 5'd14) ;
  // rule RL_wseqFsm_action_l83c12
  assign WILL_FIRE_RL_wseqFsm_action_l83c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd15 ;
  // rule RL_wseqFsm_action_l84c12
  assign WILL_FIRE_RL_wseqFsm_action_l84c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd16 ;
  // rule RL_wseqFsm_action_np_3
  assign WILL_FIRE_RL_wseqFsm_action_np_3 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd17 ;
  // rule RL_wseqFsm_action_l87c12
  assign WILL_FIRE_RL_wseqFsm_action_l87c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd18 ;
  // rule RL_wseqFsm_action_l88c12
  assign WILL_FIRE_RL_wseqFsm_action_l88c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd19 ;
  // rule RL_wseqFsm_action_d_init_np_2
  assign WILL_FIRE_RL_wseqFsm_action_d_init_np_2 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd20 ;
  // rule RL_wseqFsm_action_np_4
  assign WILL_FIRE_RL_wseqFsm_action_np_4 =
	     !isRead && !wseqFsm_jj_2_delay_count[6] &&
	     (wseqFsm_state_mkFSMstate == 5'd21 ||
	      wseqFsm_state_mkFSMstate == 5'd22) ;
  // rule RL_wseqFsm_action_l90c12
  assign WILL_FIRE_RL_wseqFsm_action_l90c12 =
	     !isRead && wseqFsm_jj_2_delay_count[6] &&
	     (wseqFsm_state_mkFSMstate == 5'd21 ||
	      wseqFsm_state_mkFSMstate == 5'd22) ;
  // rule RL_wseqFsm_action_l91c12
  assign WILL_FIRE_RL_wseqFsm_action_l91c12 =
	     !isRead && wseqFsm_state_mkFSMstate == 5'd23 ;
  // rule RL_wseqFsm_fsm_start
  assign WILL_FIRE_RL_wseqFsm_fsm_start =
	     wseqFsm_abort_whas__7_AND_wseqFsm_abort_wget___ETC___d207 &&
	     wseqFsm_start_reg ;
  // rule RL_wseqFsm_action_l70c12
  assign WILL_FIRE_RL_wseqFsm_action_l70c12 =
	     !isRead && wseqFsm_start_wire_whas &&
	     (wseqFsm_state_mkFSMstate == 5'd0 ||
	      wseqFsm_state_mkFSMstate == 5'd24) ;
  // rule RL_nextRequest
  assign WILL_FIRE_RL_nextRequest =
	     reqF_EMPTY_N &&
	     IF_reqF_first__11_BIT_40_12_THEN_rseqFsm_abort_ETC___d217 &&
	     rseqFsm_abort_whas_AND_rseqFsm_abort_wget_OR_r_ETC___d71 &&
	     !rseqFsm_start_reg &&
	     wseqFsm_abort_whas__7_AND_wseqFsm_abort_wget___ETC___d207 &&
	     !wseqFsm_start_reg ;
  // rule RL_wseqFsm_idle_l69c15
  assign WILL_FIRE_RL_wseqFsm_idle_l69c15 =
	     !wseqFsm_start_wire_whas && wseqFsm_state_mkFSMstate == 5'd24 ;
  // inputs to muxes for submodule ports
  assign MUX_ceReg_write_1__SEL_1 =
	     WILL_FIRE_RL_wseqFsm_action_l91c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l65c12 ;
  assign MUX_oeReg_write_1__SEL_1 =
	     WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l64c12 ;
  assign MUX_rseqFsm_start_reg_write_1__SEL_1 =
	     WILL_FIRE_RL_nextRequest && reqF_D_OUT[40] ;
  assign MUX_weReg_write_1__SEL_1 =
	     WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l75c12 ;
  assign MUX_wseqFsm_start_reg_write_1__SEL_1 =
	     WILL_FIRE_RL_nextRequest && !reqF_D_OUT[40] ;
  assign MUX_rseqFsm_jj_delay_count_write_1__VAL_1 =
	     { rseqFsm_jj_delay_count[13:0], 1'd0 } ;
  assign MUX_wseqFsm_jj_1_delay_count_write_1__VAL_1 =
	     { wseqFsm_jj_1_delay_count[5:0], 1'd0 } ;
  assign MUX_wseqFsm_jj_2_delay_count_write_1__VAL_1 =
	     { wseqFsm_jj_2_delay_count[5:0], 1'd0 } ;
  assign MUX_wseqFsm_jj_delay_count_write_1__VAL_1 =
	     { wseqFsm_jj_delay_count[5:0], 1'd0 } ;
  // inlined wires
  assign rseqFsm_start_wire_wget = 1'd1 ;
  assign rseqFsm_start_wire_whas =
	     WILL_FIRE_RL_rseqFsm_fsm_start ||
	     rseqFsm_start_reg_1 && !rseqFsm_state_fired ;
  assign rseqFsm_start_reg_2_wget = 1'd1 ;
  assign rseqFsm_start_reg_2_whas = rseqFsm_start_wire_whas ;
  assign rseqFsm_abort_wget = 1'b0 ;
  assign rseqFsm_abort_whas = 1'b0 ;
  assign rseqFsm_state_fired_1_wget = 1'd1 ;
  assign rseqFsm_state_fired_1_whas = rseqFsm_state_set_pw_whas ;
  assign wseqFsm_start_wire_wget = 1'd1 ;
  assign wseqFsm_start_wire_whas =
	     WILL_FIRE_RL_wseqFsm_fsm_start ||
	     wseqFsm_start_reg_1 && !wseqFsm_state_fired ;
  assign wseqFsm_start_reg_2_wget = 1'd1 ;
  assign wseqFsm_start_reg_2_whas = wseqFsm_start_wire_whas ;
  assign wseqFsm_abort_wget = 1'b0 ;
  assign wseqFsm_abort_whas = 1'b0 ;
  assign wseqFsm_state_fired_1_wget = 1'd1 ;
  assign wseqFsm_state_fired_1_whas = wseqFsm_state_set_pw_whas ;
  assign rseqFsm_state_set_pw_whas =
	     WILL_FIRE_RL_rseqFsm_idle_l59c15 ||
	     WILL_FIRE_RL_rseqFsm_action_l65c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l64c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l63c10 ||
	     WILL_FIRE_RL_rseqFsm_action_np ||
	     WILL_FIRE_RL_rseqFsm_action_d_init_np ||
	     WILL_FIRE_RL_rseqFsm_action_l61c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l60c12 ;
  assign rseqFsm_state_overlap_pw_whas = 1'b0 ;
  assign wseqFsm_state_set_pw_whas =
	     WILL_FIRE_RL_wseqFsm_idle_l69c15 ||
	     WILL_FIRE_RL_wseqFsm_action_l91c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	     WILL_FIRE_RL_wseqFsm_action_np_4 ||
	     WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	     WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	     WILL_FIRE_RL_wseqFsm_action_np_3 ||
	     WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	     WILL_FIRE_RL_wseqFsm_action_np_2 ||
	     WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	     WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	     WILL_FIRE_RL_wseqFsm_action_np_1 ||
	     WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l75c12 ||
	     WILL_FIRE_RL_wseqFsm_action_np ||
	     WILL_FIRE_RL_wseqFsm_action_d_init_np ||
	     WILL_FIRE_RL_wseqFsm_action_l73c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l72c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l71c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l70c12 ;
  assign wseqFsm_state_overlap_pw_whas = 1'b0 ;
  // register aReg
  assign aReg_D_IN = reqF_D_OUT[39:16] ;
  assign aReg_EN = WILL_FIRE_RL_nextRequest ;
  // register ceReg
  assign ceReg_D_IN = !MUX_ceReg_write_1__SEL_1 ;
  assign ceReg_EN =
	     WILL_FIRE_RL_wseqFsm_action_l91c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l65c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l71c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l60c12 ;
  // register isRead
  assign isRead_D_IN = reqF_D_OUT[40] ;
  assign isRead_EN = WILL_FIRE_RL_nextRequest ;
  // register oeReg
  assign oeReg_D_IN = !MUX_oeReg_write_1__SEL_1 ;
  assign oeReg_EN =
	     WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l64c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l61c12 ;
  // register rseqFsm_jj_delay_count
  assign rseqFsm_jj_delay_count_D_IN =
	     WILL_FIRE_RL_rseqFsm_action_np ?
	       MUX_rseqFsm_jj_delay_count_write_1__VAL_1 :
	       15'd1 ;
  assign rseqFsm_jj_delay_count_EN =
	     WILL_FIRE_RL_rseqFsm_action_np ||
	     WILL_FIRE_RL_rseqFsm_action_d_init_np ;
  // register rseqFsm_start_reg
  assign rseqFsm_start_reg_D_IN = MUX_rseqFsm_start_reg_write_1__SEL_1 ;
  assign rseqFsm_start_reg_EN =
	     WILL_FIRE_RL_nextRequest && reqF_D_OUT[40] ||
	     WILL_FIRE_RL_rseqFsm_fsm_start ;
  // register rseqFsm_start_reg_1
  assign rseqFsm_start_reg_1_D_IN = rseqFsm_start_wire_whas ;
  assign rseqFsm_start_reg_1_EN = 1'd1 ;
  // register rseqFsm_state_can_overlap
  assign rseqFsm_state_can_overlap_D_IN =
	     rseqFsm_state_set_pw_whas || rseqFsm_state_can_overlap ;
  assign rseqFsm_state_can_overlap_EN = 1'd1 ;
  // register rseqFsm_state_fired
  assign rseqFsm_state_fired_D_IN = rseqFsm_state_set_pw_whas ;
  assign rseqFsm_state_fired_EN = 1'd1 ;
  // register rseqFsm_state_mkFSMstate
  always@(WILL_FIRE_RL_rseqFsm_idle_l59c15 or
	  WILL_FIRE_RL_rseqFsm_action_l60c12 or
	  WILL_FIRE_RL_rseqFsm_action_l61c12 or
	  WILL_FIRE_RL_rseqFsm_action_d_init_np or
	  WILL_FIRE_RL_rseqFsm_action_np or
	  WILL_FIRE_RL_rseqFsm_action_l63c10 or
	  WILL_FIRE_RL_rseqFsm_action_l64c12 or
	  WILL_FIRE_RL_rseqFsm_action_l65c12)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rseqFsm_idle_l59c15: rseqFsm_state_mkFSMstate_D_IN = 4'd0;
      WILL_FIRE_RL_rseqFsm_action_l60c12:
	  rseqFsm_state_mkFSMstate_D_IN = 4'd1;
      WILL_FIRE_RL_rseqFsm_action_l61c12:
	  rseqFsm_state_mkFSMstate_D_IN = 4'd2;
      WILL_FIRE_RL_rseqFsm_action_d_init_np:
	  rseqFsm_state_mkFSMstate_D_IN = 4'd3;
      WILL_FIRE_RL_rseqFsm_action_np: rseqFsm_state_mkFSMstate_D_IN = 4'd4;
      WILL_FIRE_RL_rseqFsm_action_l63c10:
	  rseqFsm_state_mkFSMstate_D_IN = 4'd5;
      WILL_FIRE_RL_rseqFsm_action_l64c12:
	  rseqFsm_state_mkFSMstate_D_IN = 4'd6;
      WILL_FIRE_RL_rseqFsm_action_l65c12:
	  rseqFsm_state_mkFSMstate_D_IN = 4'd7;
      default: rseqFsm_state_mkFSMstate_D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign rseqFsm_state_mkFSMstate_EN =
	     WILL_FIRE_RL_rseqFsm_idle_l59c15 ||
	     WILL_FIRE_RL_rseqFsm_action_l60c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l61c12 ||
	     WILL_FIRE_RL_rseqFsm_action_d_init_np ||
	     WILL_FIRE_RL_rseqFsm_action_np ||
	     WILL_FIRE_RL_rseqFsm_action_l63c10 ||
	     WILL_FIRE_RL_rseqFsm_action_l64c12 ||
	     WILL_FIRE_RL_rseqFsm_action_l65c12 ;
  // register tmpWD
  assign tmpWD_D_IN = reqF_D_OUT[15:0] ;
  assign tmpWD_EN = WILL_FIRE_RL_nextRequest ;
  // register tsOE
  assign tsOE_D_IN = !WILL_FIRE_RL_wseqFsm_action_l84c12 ;
  assign tsOE_EN =
	     WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l72c12 ;
  // register tsWD
  assign tsWD_D_IN = WILL_FIRE_RL_wseqFsm_action_l78c12 ? tmpWD : 16'd64 ;
  assign tsWD_EN =
	     WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l70c12 ;
  // register waitReg
  assign waitReg_D_IN = flash_fwait_i ;
  assign waitReg_EN = 1'd1 ;
  // register wdReg
  assign wdReg_D_IN = 16'h0 ;
  assign wdReg_EN = 1'b0 ;
  // register weReg
  assign weReg_D_IN = !MUX_weReg_write_1__SEL_1 ;
  assign weReg_EN =
	     WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l75c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l73c12 ;
  // register wseqFsm_jj_1_delay_count
  assign wseqFsm_jj_1_delay_count_D_IN =
	     WILL_FIRE_RL_wseqFsm_action_np_2 ?
	       MUX_wseqFsm_jj_1_delay_count_write_1__VAL_1 :
	       7'd1 ;
  assign wseqFsm_jj_1_delay_count_EN =
	     WILL_FIRE_RL_wseqFsm_action_np_2 ||
	     WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ;
  // register wseqFsm_jj_2_delay_count
  assign wseqFsm_jj_2_delay_count_D_IN =
	     WILL_FIRE_RL_wseqFsm_action_np_4 ?
	       MUX_wseqFsm_jj_2_delay_count_write_1__VAL_1 :
	       7'd1 ;
  assign wseqFsm_jj_2_delay_count_EN =
	     WILL_FIRE_RL_wseqFsm_action_np_4 ||
	     WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ;
  // register wseqFsm_jj_delay_count
  assign wseqFsm_jj_delay_count_D_IN =
	     WILL_FIRE_RL_wseqFsm_action_np ?
	       MUX_wseqFsm_jj_delay_count_write_1__VAL_1 :
	       7'd1 ;
  assign wseqFsm_jj_delay_count_EN =
	     WILL_FIRE_RL_wseqFsm_action_np ||
	     WILL_FIRE_RL_wseqFsm_action_d_init_np ;
  // register wseqFsm_start_reg
  assign wseqFsm_start_reg_D_IN = MUX_wseqFsm_start_reg_write_1__SEL_1 ;
  assign wseqFsm_start_reg_EN =
	     WILL_FIRE_RL_nextRequest && !reqF_D_OUT[40] ||
	     WILL_FIRE_RL_wseqFsm_fsm_start ;
  // register wseqFsm_start_reg_1
  assign wseqFsm_start_reg_1_D_IN = wseqFsm_start_wire_whas ;
  assign wseqFsm_start_reg_1_EN = 1'd1 ;
  // register wseqFsm_state_can_overlap
  assign wseqFsm_state_can_overlap_D_IN =
	     wseqFsm_state_set_pw_whas || wseqFsm_state_can_overlap ;
  assign wseqFsm_state_can_overlap_EN = 1'd1 ;
  // register wseqFsm_state_fired
  assign wseqFsm_state_fired_D_IN = wseqFsm_state_set_pw_whas ;
  assign wseqFsm_state_fired_EN = 1'd1 ;
  // register wseqFsm_state_mkFSMstate
  always@(WILL_FIRE_RL_wseqFsm_idle_l69c15 or
	  WILL_FIRE_RL_wseqFsm_action_l70c12 or
	  WILL_FIRE_RL_wseqFsm_action_l71c12 or
	  WILL_FIRE_RL_wseqFsm_action_l72c12 or
	  WILL_FIRE_RL_wseqFsm_action_l73c12 or
	  WILL_FIRE_RL_wseqFsm_action_d_init_np or
	  WILL_FIRE_RL_wseqFsm_action_np or
	  WILL_FIRE_RL_wseqFsm_action_l75c12 or
	  WILL_FIRE_RL_wseqFsm_action_l76c12 or
	  WILL_FIRE_RL_wseqFsm_action_np_1 or
	  WILL_FIRE_RL_wseqFsm_action_l78c12 or
	  WILL_FIRE_RL_wseqFsm_action_l79c12 or
	  WILL_FIRE_RL_wseqFsm_action_l80c12 or
	  WILL_FIRE_RL_wseqFsm_action_d_init_np_1 or
	  WILL_FIRE_RL_wseqFsm_action_np_2 or
	  WILL_FIRE_RL_wseqFsm_action_l82c12 or
	  WILL_FIRE_RL_wseqFsm_action_l83c12 or
	  WILL_FIRE_RL_wseqFsm_action_l84c12 or
	  WILL_FIRE_RL_wseqFsm_action_np_3 or
	  WILL_FIRE_RL_wseqFsm_action_l87c12 or
	  WILL_FIRE_RL_wseqFsm_action_l88c12 or
	  WILL_FIRE_RL_wseqFsm_action_d_init_np_2 or
	  WILL_FIRE_RL_wseqFsm_action_np_4 or
	  WILL_FIRE_RL_wseqFsm_action_l90c12 or
	  WILL_FIRE_RL_wseqFsm_action_l91c12)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wseqFsm_idle_l69c15: wseqFsm_state_mkFSMstate_D_IN = 5'd0;
      WILL_FIRE_RL_wseqFsm_action_l70c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd1;
      WILL_FIRE_RL_wseqFsm_action_l71c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd2;
      WILL_FIRE_RL_wseqFsm_action_l72c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd3;
      WILL_FIRE_RL_wseqFsm_action_l73c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd4;
      WILL_FIRE_RL_wseqFsm_action_d_init_np:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd5;
      WILL_FIRE_RL_wseqFsm_action_np: wseqFsm_state_mkFSMstate_D_IN = 5'd6;
      WILL_FIRE_RL_wseqFsm_action_l75c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd7;
      WILL_FIRE_RL_wseqFsm_action_l76c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd8;
      WILL_FIRE_RL_wseqFsm_action_np_1: wseqFsm_state_mkFSMstate_D_IN = 5'd9;
      WILL_FIRE_RL_wseqFsm_action_l78c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd10;
      WILL_FIRE_RL_wseqFsm_action_l79c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd11;
      WILL_FIRE_RL_wseqFsm_action_l80c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd12;
      WILL_FIRE_RL_wseqFsm_action_d_init_np_1:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd13;
      WILL_FIRE_RL_wseqFsm_action_np_2: wseqFsm_state_mkFSMstate_D_IN = 5'd14;
      WILL_FIRE_RL_wseqFsm_action_l82c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd15;
      WILL_FIRE_RL_wseqFsm_action_l83c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd16;
      WILL_FIRE_RL_wseqFsm_action_l84c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd17;
      WILL_FIRE_RL_wseqFsm_action_np_3: wseqFsm_state_mkFSMstate_D_IN = 5'd18;
      WILL_FIRE_RL_wseqFsm_action_l87c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd19;
      WILL_FIRE_RL_wseqFsm_action_l88c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd20;
      WILL_FIRE_RL_wseqFsm_action_d_init_np_2:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd21;
      WILL_FIRE_RL_wseqFsm_action_np_4: wseqFsm_state_mkFSMstate_D_IN = 5'd22;
      WILL_FIRE_RL_wseqFsm_action_l90c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd23;
      WILL_FIRE_RL_wseqFsm_action_l91c12:
	  wseqFsm_state_mkFSMstate_D_IN = 5'd24;
      default: wseqFsm_state_mkFSMstate_D_IN =
		   5'b01010 /* unspecified value */ ;
    endcase
  end
  assign wseqFsm_state_mkFSMstate_EN =
	     WILL_FIRE_RL_wseqFsm_idle_l69c15 ||
	     WILL_FIRE_RL_wseqFsm_action_l70c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l71c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l72c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l73c12 ||
	     WILL_FIRE_RL_wseqFsm_action_d_init_np ||
	     WILL_FIRE_RL_wseqFsm_action_np ||
	     WILL_FIRE_RL_wseqFsm_action_l75c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	     WILL_FIRE_RL_wseqFsm_action_np_1 ||
	     WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	     WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	     WILL_FIRE_RL_wseqFsm_action_np_2 ||
	     WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	     WILL_FIRE_RL_wseqFsm_action_np_3 ||
	     WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	     WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	     WILL_FIRE_RL_wseqFsm_action_np_4 ||
	     WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	     WILL_FIRE_RL_wseqFsm_action_l91c12 ;
  // submodule reqF
  assign reqF_D_IN = user_request_put ;
  assign reqF_ENQ = EN_user_request_put ;
  assign reqF_DEQ = WILL_FIRE_RL_nextRequest ;
  assign reqF_CLR = 1'b0 ;
  // submodule respF
  assign respF_D_IN = tsd_O ;
  assign respF_ENQ = WILL_FIRE_RL_rseqFsm_action_l63c10 ;
  assign respF_DEQ = EN_user_response_get ;
  assign respF_CLR = 1'b0 ;
  // remaining internal signals
  assign IF_reqF_first__11_BIT_40_12_THEN_rseqFsm_abort_ETC___d217 =
	     reqF_D_OUT[40] ?
	       rseqFsm_abort_whas_AND_rseqFsm_abort_wget_OR_r_ETC___d71 &&
	       !rseqFsm_start_reg :
	       wseqFsm_abort_whas__7_AND_wseqFsm_abort_wget___ETC___d207 &&
	       !wseqFsm_start_reg ;
  assign rseqFsm_abort_whas_AND_rseqFsm_abort_wget_OR_r_ETC___d71 =
	     (rseqFsm_state_mkFSMstate == 4'd0 ||
	      rseqFsm_state_mkFSMstate == 4'd7) &&
	     (!rseqFsm_start_reg_1 || rseqFsm_state_fired) ;
  assign wseqFsm_abort_whas__7_AND_wseqFsm_abort_wget___ETC___d207 =
	     (wseqFsm_state_mkFSMstate == 5'd0 ||
	      wseqFsm_state_mkFSMstate == 5'd24) &&
	     (!wseqFsm_start_reg_1 || wseqFsm_state_fired) ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        aReg <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ceReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	isRead <= `BSV_ASSIGNMENT_DELAY 1'd1;
	oeReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY 15'd1;
	rseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 4'd0;
	tmpWD <= `BSV_ASSIGNMENT_DELAY 16'd0;
	tsOE <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tsWD <= `BSV_ASSIGNMENT_DELAY 16'd0;
	wdReg <= `BSV_ASSIGNMENT_DELAY 16'd0;
	weReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wseqFsm_jj_1_delay_count <= `BSV_ASSIGNMENT_DELAY 7'd1;
	wseqFsm_jj_2_delay_count <= `BSV_ASSIGNMENT_DELAY 7'd1;
	wseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY 7'd1;
	wseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 5'd0;
      end
    else
      begin
        if (aReg_EN) aReg <= `BSV_ASSIGNMENT_DELAY aReg_D_IN;
	if (ceReg_EN) ceReg <= `BSV_ASSIGNMENT_DELAY ceReg_D_IN;
	if (isRead_EN) isRead <= `BSV_ASSIGNMENT_DELAY isRead_D_IN;
	if (oeReg_EN) oeReg <= `BSV_ASSIGNMENT_DELAY oeReg_D_IN;
	if (rseqFsm_jj_delay_count_EN)
	  rseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY
	      rseqFsm_jj_delay_count_D_IN;
	if (rseqFsm_start_reg_EN)
	  rseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY rseqFsm_start_reg_D_IN;
	if (rseqFsm_start_reg_1_EN)
	  rseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      rseqFsm_start_reg_1_D_IN;
	if (rseqFsm_state_can_overlap_EN)
	  rseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      rseqFsm_state_can_overlap_D_IN;
	if (rseqFsm_state_fired_EN)
	  rseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY
	      rseqFsm_state_fired_D_IN;
	if (rseqFsm_state_mkFSMstate_EN)
	  rseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      rseqFsm_state_mkFSMstate_D_IN;
	if (tmpWD_EN) tmpWD <= `BSV_ASSIGNMENT_DELAY tmpWD_D_IN;
	if (tsOE_EN) tsOE <= `BSV_ASSIGNMENT_DELAY tsOE_D_IN;
	if (tsWD_EN) tsWD <= `BSV_ASSIGNMENT_DELAY tsWD_D_IN;
	if (wdReg_EN) wdReg <= `BSV_ASSIGNMENT_DELAY wdReg_D_IN;
	if (weReg_EN) weReg <= `BSV_ASSIGNMENT_DELAY weReg_D_IN;
	if (wseqFsm_jj_1_delay_count_EN)
	  wseqFsm_jj_1_delay_count <= `BSV_ASSIGNMENT_DELAY
	      wseqFsm_jj_1_delay_count_D_IN;
	if (wseqFsm_jj_2_delay_count_EN)
	  wseqFsm_jj_2_delay_count <= `BSV_ASSIGNMENT_DELAY
	      wseqFsm_jj_2_delay_count_D_IN;
	if (wseqFsm_jj_delay_count_EN)
	  wseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY
	      wseqFsm_jj_delay_count_D_IN;
	if (wseqFsm_start_reg_EN)
	  wseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY wseqFsm_start_reg_D_IN;
	if (wseqFsm_start_reg_1_EN)
	  wseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      wseqFsm_start_reg_1_D_IN;
	if (wseqFsm_state_can_overlap_EN)
	  wseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      wseqFsm_state_can_overlap_D_IN;
	if (wseqFsm_state_fired_EN)
	  wseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY
	      wseqFsm_state_fired_D_IN;
	if (wseqFsm_state_mkFSMstate_EN)
	  wseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      wseqFsm_state_mkFSMstate_D_IN;
      end
    if (waitReg_EN) waitReg <= `BSV_ASSIGNMENT_DELAY waitReg_D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    aReg = 24'hAAAAAA;
    ceReg = 1'h0;
    isRead = 1'h0;
    oeReg = 1'h0;
    rseqFsm_jj_delay_count = 15'h2AAA;
    rseqFsm_start_reg = 1'h0;
    rseqFsm_start_reg_1 = 1'h0;
    rseqFsm_state_can_overlap = 1'h0;
    rseqFsm_state_fired = 1'h0;
    rseqFsm_state_mkFSMstate = 4'hA;
    tmpWD = 16'hAAAA;
    tsOE = 1'h0;
    tsWD = 16'hAAAA;
    waitReg = 1'h0;
    wdReg = 16'hAAAA;
    weReg = 1'h0;
    wseqFsm_jj_1_delay_count = 7'h2A;
    wseqFsm_jj_2_delay_count = 7'h2A;
    wseqFsm_jj_delay_count = 7'h2A;
    wseqFsm_start_reg = 1'h0;
    wseqFsm_start_reg_1 = 1'h0;
    wseqFsm_state_can_overlap = 1'h0;
    wseqFsm_state_fired = 1'h0;
    wseqFsm_state_mkFSMstate = 5'h0A;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rseqFsm_action_l61c12 &&
	  (WILL_FIRE_RL_rseqFsm_action_d_init_np ||
	   WILL_FIRE_RL_rseqFsm_action_np ||
	   WILL_FIRE_RL_rseqFsm_action_l63c10 ||
	   WILL_FIRE_RL_rseqFsm_action_l64c12 ||
	   WILL_FIRE_RL_rseqFsm_action_l65c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 61, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_rseqFsm_action_l61c12] and\n  [RL_rseqFsm_action_d_init_np, RL_rseqFsm_action_np,\n  RL_rseqFsm_action_l63c10, RL_rseqFsm_action_l64c12,\n  RL_rseqFsm_action_l65c12] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rseqFsm_action_d_init_np &&
	  (WILL_FIRE_RL_rseqFsm_action_np ||
	   WILL_FIRE_RL_rseqFsm_action_l63c10 ||
	   WILL_FIRE_RL_rseqFsm_action_l64c12 ||
	   WILL_FIRE_RL_rseqFsm_action_l65c12))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_rseqFsm_action_d_init_np] and\n  [RL_rseqFsm_action_np, RL_rseqFsm_action_l63c10, RL_rseqFsm_action_l64c12,\n  RL_rseqFsm_action_l65c12] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rseqFsm_action_np &&
	  (WILL_FIRE_RL_rseqFsm_action_l63c10 ||
	   WILL_FIRE_RL_rseqFsm_action_l64c12 ||
	   WILL_FIRE_RL_rseqFsm_action_l65c12))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_rseqFsm_action_np] and\n  [RL_rseqFsm_action_l63c10, RL_rseqFsm_action_l64c12,\n  RL_rseqFsm_action_l65c12] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rseqFsm_action_l63c10 &&
	  (WILL_FIRE_RL_rseqFsm_action_l64c12 ||
	   WILL_FIRE_RL_rseqFsm_action_l65c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 63, column 10: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_rseqFsm_action_l63c10] and\n  [RL_rseqFsm_action_l64c12, RL_rseqFsm_action_l65c12] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rseqFsm_action_l64c12 &&
	  WILL_FIRE_RL_rseqFsm_action_l65c12)
	$display("Error: \"bsv/dev/Flash.bsv\", line 64, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_rseqFsm_action_l64c12] and\n  [RL_rseqFsm_action_l65c12] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rseqFsm_action_l60c12 &&
	  (WILL_FIRE_RL_rseqFsm_action_l61c12 ||
	   WILL_FIRE_RL_rseqFsm_action_d_init_np ||
	   WILL_FIRE_RL_rseqFsm_action_np ||
	   WILL_FIRE_RL_rseqFsm_action_l63c10 ||
	   WILL_FIRE_RL_rseqFsm_action_l64c12 ||
	   WILL_FIRE_RL_rseqFsm_action_l65c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 60, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_rseqFsm_action_l60c12] and\n  [RL_rseqFsm_action_l61c12, RL_rseqFsm_action_d_init_np,\n  RL_rseqFsm_action_np, RL_rseqFsm_action_l63c10, RL_rseqFsm_action_l64c12,\n  RL_rseqFsm_action_l65c12] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l71c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_l72c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l73c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np ||
	   WILL_FIRE_RL_wseqFsm_action_np ||
	   WILL_FIRE_RL_wseqFsm_action_l75c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 71, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l71c12] and\n  [RL_wseqFsm_action_l72c12, RL_wseqFsm_action_l73c12,\n  RL_wseqFsm_action_d_init_np, RL_wseqFsm_action_np, RL_wseqFsm_action_l75c12,\n  RL_wseqFsm_action_l76c12, RL_wseqFsm_action_np_1, RL_wseqFsm_action_l78c12,\n  RL_wseqFsm_action_l79c12, RL_wseqFsm_action_l80c12,\n  RL_wseqFsm_action_d_init_np_1, RL_wseqFsm_action_np_2,\n  RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l72c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_l73c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np ||
	   WILL_FIRE_RL_wseqFsm_action_np ||
	   WILL_FIRE_RL_wseqFsm_action_l75c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 72, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l72c12] and\n  [RL_wseqFsm_action_l73c12, RL_wseqFsm_action_d_init_np,\n  RL_wseqFsm_action_np, RL_wseqFsm_action_l75c12, RL_wseqFsm_action_l76c12,\n  RL_wseqFsm_action_np_1, RL_wseqFsm_action_l78c12, RL_wseqFsm_action_l79c12,\n  RL_wseqFsm_action_l80c12, RL_wseqFsm_action_d_init_np_1,\n  RL_wseqFsm_action_np_2, RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l73c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_d_init_np ||
	   WILL_FIRE_RL_wseqFsm_action_np ||
	   WILL_FIRE_RL_wseqFsm_action_l75c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 73, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l73c12] and\n  [RL_wseqFsm_action_d_init_np, RL_wseqFsm_action_np,\n  RL_wseqFsm_action_l75c12, RL_wseqFsm_action_l76c12, RL_wseqFsm_action_np_1,\n  RL_wseqFsm_action_l78c12, RL_wseqFsm_action_l79c12,\n  RL_wseqFsm_action_l80c12, RL_wseqFsm_action_d_init_np_1,\n  RL_wseqFsm_action_np_2, RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_d_init_np &&
	  (WILL_FIRE_RL_wseqFsm_action_np ||
	   WILL_FIRE_RL_wseqFsm_action_l75c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_d_init_np] and\n  [RL_wseqFsm_action_np, RL_wseqFsm_action_l75c12, RL_wseqFsm_action_l76c12,\n  RL_wseqFsm_action_np_1, RL_wseqFsm_action_l78c12, RL_wseqFsm_action_l79c12,\n  RL_wseqFsm_action_l80c12, RL_wseqFsm_action_d_init_np_1,\n  RL_wseqFsm_action_np_2, RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l75c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 75, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l75c12] and\n  [RL_wseqFsm_action_l76c12, RL_wseqFsm_action_np_1, RL_wseqFsm_action_l78c12,\n  RL_wseqFsm_action_l79c12, RL_wseqFsm_action_l80c12,\n  RL_wseqFsm_action_d_init_np_1, RL_wseqFsm_action_np_2,\n  RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_np &&
	  (WILL_FIRE_RL_wseqFsm_action_l75c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_np] and\n  [RL_wseqFsm_action_l75c12, RL_wseqFsm_action_l76c12, RL_wseqFsm_action_np_1,\n  RL_wseqFsm_action_l78c12, RL_wseqFsm_action_l79c12,\n  RL_wseqFsm_action_l80c12, RL_wseqFsm_action_d_init_np_1,\n  RL_wseqFsm_action_np_2, RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l76c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 76, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l76c12] and\n  [RL_wseqFsm_action_np_1, RL_wseqFsm_action_l78c12, RL_wseqFsm_action_l79c12,\n  RL_wseqFsm_action_l80c12, RL_wseqFsm_action_d_init_np_1,\n  RL_wseqFsm_action_np_2, RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l78c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 78, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l78c12] and\n  [RL_wseqFsm_action_l79c12, RL_wseqFsm_action_l80c12,\n  RL_wseqFsm_action_d_init_np_1, RL_wseqFsm_action_np_2,\n  RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_np_1 &&
	  (WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_np_1] and\n  [RL_wseqFsm_action_l78c12, RL_wseqFsm_action_l79c12,\n  RL_wseqFsm_action_l80c12, RL_wseqFsm_action_d_init_np_1,\n  RL_wseqFsm_action_np_2, RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l79c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 79, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l79c12] and\n  [RL_wseqFsm_action_l80c12, RL_wseqFsm_action_d_init_np_1,\n  RL_wseqFsm_action_np_2, RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l80c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 80, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l80c12] and\n  [RL_wseqFsm_action_d_init_np_1, RL_wseqFsm_action_np_2,\n  RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_np_2 &&
	  (WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_np_2] and\n  [RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_d_init_np_1 &&
	  (WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_d_init_np_1]\n  and [RL_wseqFsm_action_np_2, RL_wseqFsm_action_l82c12,\n  RL_wseqFsm_action_l83c12, RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3,\n  RL_wseqFsm_action_l87c12, RL_wseqFsm_action_l88c12,\n  RL_wseqFsm_action_d_init_np_2, RL_wseqFsm_action_np_4,\n  RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l82c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 82, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l82c12] and\n  [RL_wseqFsm_action_l83c12, RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3,\n  RL_wseqFsm_action_l87c12, RL_wseqFsm_action_l88c12,\n  RL_wseqFsm_action_d_init_np_2, RL_wseqFsm_action_np_4,\n  RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l83c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 83, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l83c12] and\n  [RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_np_3 &&
	  (WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_np_3] and\n  [RL_wseqFsm_action_l87c12, RL_wseqFsm_action_l88c12,\n  RL_wseqFsm_action_d_init_np_2, RL_wseqFsm_action_np_4,\n  RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l84c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 84, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l84c12] and\n  [RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12, RL_wseqFsm_action_l88c12,\n  RL_wseqFsm_action_d_init_np_2, RL_wseqFsm_action_np_4,\n  RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l87c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 87, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l87c12] and\n  [RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l88c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 88, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l88c12] and\n  [RL_wseqFsm_action_d_init_np_2, RL_wseqFsm_action_np_4,\n  RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_d_init_np_2 &&
	  (WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_d_init_np_2]\n  and [RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12,\n  RL_wseqFsm_action_l91c12] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l90c12 &&
	  WILL_FIRE_RL_wseqFsm_action_l91c12)
	$display("Error: \"bsv/dev/Flash.bsv\", line 90, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l90c12] and\n  [RL_wseqFsm_action_l91c12] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_np_4 &&
	  (WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_np_4] and\n  [RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wseqFsm_action_l70c12 &&
	  (WILL_FIRE_RL_wseqFsm_action_l71c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l72c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l73c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np ||
	   WILL_FIRE_RL_wseqFsm_action_np ||
	   WILL_FIRE_RL_wseqFsm_action_l75c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l76c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_l78c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l79c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l80c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_1 ||
	   WILL_FIRE_RL_wseqFsm_action_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_l82c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l83c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l84c12 ||
	   WILL_FIRE_RL_wseqFsm_action_np_3 ||
	   WILL_FIRE_RL_wseqFsm_action_l87c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l88c12 ||
	   WILL_FIRE_RL_wseqFsm_action_d_init_np_2 ||
	   WILL_FIRE_RL_wseqFsm_action_np_4 ||
	   WILL_FIRE_RL_wseqFsm_action_l90c12 ||
	   WILL_FIRE_RL_wseqFsm_action_l91c12))
	$display("Error: \"bsv/dev/Flash.bsv\", line 70, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wseqFsm_action_l70c12] and\n  [RL_wseqFsm_action_l71c12, RL_wseqFsm_action_l72c12,\n  RL_wseqFsm_action_l73c12, RL_wseqFsm_action_d_init_np, RL_wseqFsm_action_np,\n  RL_wseqFsm_action_l75c12, RL_wseqFsm_action_l76c12, RL_wseqFsm_action_np_1,\n  RL_wseqFsm_action_l78c12, RL_wseqFsm_action_l79c12,\n  RL_wseqFsm_action_l80c12, RL_wseqFsm_action_d_init_np_1,\n  RL_wseqFsm_action_np_2, RL_wseqFsm_action_l82c12, RL_wseqFsm_action_l83c12,\n  RL_wseqFsm_action_l84c12, RL_wseqFsm_action_np_3, RL_wseqFsm_action_l87c12,\n  RL_wseqFsm_action_l88c12, RL_wseqFsm_action_d_init_np_2,\n  RL_wseqFsm_action_np_4, RL_wseqFsm_action_l90c12, RL_wseqFsm_action_l91c12]\n  ) fired in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule