module outputs
  wire [39 : 0] client_request_get, server_response_get;
  wire RDY_client_request_get,
       RDY_client_response_put,
       RDY_dstAddr,
       RDY_dstType,
       RDY_edpRx,
       RDY_edpTx,
       RDY_edpTxEOP,
       RDY_macAddr,
       RDY_server_request_put,
       RDY_server_response_get,
       edpRx,
       edpTx,
       edpTxEOP;
  // inlined wires
  wire edpEgressEOP_1$wget,
       edpEgressEOP_1$whas,
       edpEgress_1$wget,
       edpEgress_1$whas,
       edpFsm_abort$wget,
       edpFsm_abort$whas,
       edpFsm_start_reg_1_1$wget,
       edpFsm_start_reg_1_1$whas,
       edpFsm_start_wire$wget,
       edpFsm_start_wire$whas,
       edpFsm_state_fired_1$wget,
       edpFsm_state_fired_1$whas,
       edpFsm_state_overlap_pw$whas,
       edpFsm_state_set_pw$whas,
       edpIngress_1$wget,
       edpIngress_1$whas;
  // register dEType
  reg [15 : 0] dEType;
  wire [15 : 0] dEType$D_IN;
  wire dEType$EN;
  // register dMAddr
  reg [47 : 0] dMAddr;
  wire [47 : 0] dMAddr$D_IN;
  wire dMAddr$EN;
  // register dbge0
  reg [9 : 0] dbge0;
  wire [9 : 0] dbge0$D_IN;
  wire dbge0$EN;
  // register dbge1
  reg [9 : 0] dbge1;
  wire [9 : 0] dbge1$D_IN;
  wire dbge1$EN;
  // register dbge2
  reg [9 : 0] dbge2;
  wire [9 : 0] dbge2$D_IN;
  wire dbge2$EN;
  // register dbge3
  reg [9 : 0] dbge3;
  wire [9 : 0] dbge3$D_IN;
  wire dbge3$EN;
  // register edpEgress
  reg edpEgress;
  wire edpEgress$D_IN, edpEgress$EN;
  // register edpEgressEOP
  reg edpEgressEOP;
  wire edpEgressEOP$D_IN, edpEgressEOP$EN;
  // register edpFsm_start_reg
  reg edpFsm_start_reg;
  wire edpFsm_start_reg$D_IN, edpFsm_start_reg$EN;
  // register edpFsm_start_reg_1
  reg edpFsm_start_reg_1;
  wire edpFsm_start_reg_1$D_IN, edpFsm_start_reg_1$EN;
  // register edpFsm_state_can_overlap
  reg edpFsm_state_can_overlap;
  wire edpFsm_state_can_overlap$D_IN, edpFsm_state_can_overlap$EN;
  // register edpFsm_state_fired
  reg edpFsm_state_fired;
  wire edpFsm_state_fired$D_IN, edpFsm_state_fired$EN;
  // register edpFsm_state_mkFSMstate
  reg [2 : 0] edpFsm_state_mkFSMstate;
  reg [2 : 0] edpFsm_state_mkFSMstate$D_IN;
  wire edpFsm_state_mkFSMstate$EN;
  // register edpIngress
  reg edpIngress;
  wire edpIngress$D_IN, edpIngress$EN;
  // register eeDID
  reg [15 : 0] eeDID;
  wire [15 : 0] eeDID$D_IN;
  wire eeDID$EN;
  // register igPtr
  reg [3 : 0] igPtr;
  wire [3 : 0] igPtr$D_IN;
  wire igPtr$EN;
  // register txPayload
  reg txPayload;
  wire txPayload$D_IN, txPayload$EN;
  // register uMAddr
  reg [47 : 0] uMAddr;
  wire [47 : 0] uMAddr$D_IN;
  wire uMAddr$EN;
  // ports of submodule dpReqF
  wire [39 : 0] dpReqF$D_IN, dpReqF$D_OUT;
  wire dpReqF$CLR, dpReqF$DEQ, dpReqF$EMPTY_N, dpReqF$ENQ, dpReqF$FULL_N;
  // ports of submodule dpRespF
  wire [39 : 0] dpRespF$D_IN, dpRespF$D_OUT;
  wire dpRespF$CLR, dpRespF$DEQ, dpRespF$EMPTY_N, dpRespF$ENQ, dpRespF$FULL_N;
  // ports of submodule edpReqF
  wire [39 : 0] edpReqF$D_IN, edpReqF$D_OUT;
  wire edpReqF$CLR, edpReqF$DEQ, edpReqF$EMPTY_N, edpReqF$ENQ, edpReqF$FULL_N;
  // ports of submodule edpRespF
  reg [39 : 0] edpRespF$D_IN;
  wire [39 : 0] edpRespF$D_OUT;
  wire edpRespF$CLR,
       edpRespF$DEQ,
       edpRespF$EMPTY_N,
       edpRespF$ENQ,
       edpRespF$FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_edpFsm_action_l90c14,
       WILL_FIRE_RL_edpFsm_action_l91c14,
       WILL_FIRE_RL_edpFsm_action_l92c14,
       WILL_FIRE_RL_edpFsm_action_l93c14,
       WILL_FIRE_RL_edpFsm_fsm_start,
       WILL_FIRE_RL_edpFsm_idle_l89c3,
       WILL_FIRE_RL_egress_body;
  // inputs to muxes for submodule ports
  wire [39 : 0] MUX_edpRespF$enq_1__VAL_1,
		MUX_edpRespF$enq_1__VAL_2,
		MUX_edpRespF$enq_1__VAL_3,
		MUX_edpRespF$enq_1__VAL_4,
		MUX_edpRespF$enq_1__VAL_5;
  wire MUX_edpFsm_start_reg$write_1__SEL_2, MUX_txPayload$write_1__VAL_2;
  // remaining internal signals
  reg [1 : 0] CASE_client_response_put_BITS_19_TO_18_3_0_cli_ETC__q19,
	      CASE_client_response_put_BITS_29_TO_28_3_0_cli_ETC__q18,
	      CASE_client_response_put_BITS_39_TO_38_3_0_cli_ETC__q17,
	      CASE_client_response_put_BITS_9_TO_8_3_0_clien_ETC__q20,
	      CASE_dpReqFD_OUT_BITS_19_TO_18_3_0_dpReqFD_O_ETC__q7,
	      CASE_dpReqFD_OUT_BITS_29_TO_28_3_0_dpReqFD_O_ETC__q6,
	      CASE_dpReqFD_OUT_BITS_39_TO_38_3_0_dpReqFD_O_ETC__q5,
	      CASE_dpReqFD_OUT_BITS_9_TO_8_3_0_dpReqFD_OUT_ETC__q8,
	      CASE_dpRespFD_OUT_BITS_19_TO_18_3_0_dpRespFD_ETC__q11,
	      CASE_dpRespFD_OUT_BITS_29_TO_28_3_0_dpRespFD_ETC__q10,
	      CASE_dpRespFD_OUT_BITS_39_TO_38_3_0_dpRespFD_ETC__q9,
	      CASE_dpRespFD_OUT_BITS_9_TO_8_3_0_dpRespFD_O_ETC__q12,
	      CASE_edpReqFD_OUT_BITS_19_TO_18_3_0_edpReqFD_ETC__q15,
	      CASE_edpReqFD_OUT_BITS_29_TO_28_3_0_edpReqFD_ETC__q14,
	      CASE_edpReqFD_OUT_BITS_39_TO_38_3_0_edpReqFD_ETC__q13,
	      CASE_edpReqFD_OUT_BITS_9_TO_8_3_0_edpReqFD_O_ETC__q16,
	      CASE_edpRespFD_OUT_BITS_19_TO_18_3_0_edpRespF_ETC__q3,
	      CASE_edpRespFD_OUT_BITS_29_TO_28_3_0_edpRespF_ETC__q2,
	      CASE_edpRespFD_OUT_BITS_39_TO_38_3_0_edpRespF_ETC__q1,
	      CASE_edpRespFD_OUT_BITS_9_TO_8_3_0_edpRespFD_ETC__q4,
	      CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q23,
	      CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q22,
	      CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q21,
	      CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q24;
  wire [3 : 0] x__h1670;
  wire edpFsm_abort_whas__5_AND_edpFsm_abort_wget__6__ETC___d157,
       igPtr_1_ULE_3___d12;
  // action method server_request_put
  assign RDY_server_request_put = edpReqF$FULL_N ;
  // actionvalue method server_response_get
  assign server_response_get =
	     { CASE_edpRespFD_OUT_BITS_39_TO_38_3_0_edpRespF_ETC__q1,
	       edpRespF$D_OUT[37:30],
	       CASE_edpRespFD_OUT_BITS_29_TO_28_3_0_edpRespF_ETC__q2,
	       edpRespF$D_OUT[27:20],
	       CASE_edpRespFD_OUT_BITS_19_TO_18_3_0_edpRespF_ETC__q3,
	       edpRespF$D_OUT[17:10],
	       CASE_edpRespFD_OUT_BITS_9_TO_8_3_0_edpRespFD_ETC__q4,
	       edpRespF$D_OUT[7:0] } ;
  assign RDY_server_response_get = edpRespF$EMPTY_N ;
  // actionvalue method client_request_get
  assign client_request_get =
	     { CASE_dpReqFD_OUT_BITS_39_TO_38_3_0_dpReqFD_O_ETC__q5,
	       dpReqF$D_OUT[37:30],
	       CASE_dpReqFD_OUT_BITS_29_TO_28_3_0_dpReqFD_O_ETC__q6,
	       dpReqF$D_OUT[27:20],
	       CASE_dpReqFD_OUT_BITS_19_TO_18_3_0_dpReqFD_O_ETC__q7,
	       dpReqF$D_OUT[17:10],
	       CASE_dpReqFD_OUT_BITS_9_TO_8_3_0_dpReqFD_OUT_ETC__q8,
	       dpReqF$D_OUT[7:0] } ;
  assign RDY_client_request_get = dpReqF$EMPTY_N ;
  // action method client_response_put
  assign RDY_client_response_put = dpRespF$FULL_N ;
  // action method macAddr
  assign RDY_macAddr = 1'd1 ;
  // action method dstAddr
  assign RDY_dstAddr = 1'd1 ;
  // action method dstType
  assign RDY_dstType = 1'd1 ;
  // value method edpRx
  assign edpRx = edpIngress ;
  assign RDY_edpRx = 1'd1 ;
  // value method edpTx
  assign edpTx = edpEgress ;
  assign RDY_edpTx = 1'd1 ;
  // value method edpTxEOP
  assign edpTxEOP = edpEgressEOP ;
  assign RDY_edpTxEOP = 1'd1 ;
  // submodule dpReqF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) dpReqF(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(dpReqF$D_IN),
						  .ENQ(dpReqF$ENQ),
						  .DEQ(dpReqF$DEQ),
						  .CLR(dpReqF$CLR),
						  .D_OUT(dpReqF$D_OUT),
						  .FULL_N(dpReqF$FULL_N),
						  .EMPTY_N(dpReqF$EMPTY_N));
  // submodule dpRespF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) dpRespF(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(dpRespF$D_IN),
						   .ENQ(dpRespF$ENQ),
						   .DEQ(dpRespF$DEQ),
						   .CLR(dpRespF$CLR),
						   .D_OUT(dpRespF$D_OUT),
						   .FULL_N(dpRespF$FULL_N),
						   .EMPTY_N(dpRespF$EMPTY_N));
  // submodule edpReqF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) edpReqF(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(edpReqF$D_IN),
						   .ENQ(edpReqF$ENQ),
						   .DEQ(edpReqF$DEQ),
						   .CLR(edpReqF$CLR),
						   .D_OUT(edpReqF$D_OUT),
						   .FULL_N(edpReqF$FULL_N),
						   .EMPTY_N(edpReqF$EMPTY_N));
  // submodule edpRespF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) edpRespF(.RST(RST_N),
						    .CLK(CLK),
						    .D_IN(edpRespF$D_IN),
						    .ENQ(edpRespF$ENQ),
						    .DEQ(edpRespF$DEQ),
						    .CLR(edpRespF$CLR),
						    .D_OUT(edpRespF$D_OUT),
						    .FULL_N(edpRespF$FULL_N),
						    .EMPTY_N(edpRespF$EMPTY_N));
  // rule RL_egress_body
  assign WILL_FIRE_RL_egress_body =
	     edpRespF$FULL_N && dpRespF$EMPTY_N && txPayload ;
  // rule RL_edpFsm_action_l91c14
  assign WILL_FIRE_RL_edpFsm_action_l91c14 =
	     edpRespF$FULL_N && edpFsm_state_mkFSMstate == 3'd1 &&
	     !WILL_FIRE_RL_egress_body ;
  // rule RL_edpFsm_action_l92c14
  assign WILL_FIRE_RL_edpFsm_action_l92c14 =
	     edpRespF$FULL_N && edpFsm_state_mkFSMstate == 3'd2 &&
	     !WILL_FIRE_RL_egress_body ;
  // rule RL_edpFsm_action_l93c14
  assign WILL_FIRE_RL_edpFsm_action_l93c14 =
	     edpRespF$FULL_N && edpFsm_state_mkFSMstate == 3'd3 &&
	     !WILL_FIRE_RL_egress_body ;
  // rule RL_edpFsm_fsm_start
  assign WILL_FIRE_RL_edpFsm_fsm_start =
	     edpFsm_abort_whas__5_AND_edpFsm_abort_wget__6__ETC___d157 &&
	     edpFsm_start_reg ;
  // rule RL_edpFsm_action_l90c14
  assign WILL_FIRE_RL_edpFsm_action_l90c14 =
	     edpRespF$FULL_N && edpFsm_start_reg_1_1$whas &&
	     (edpFsm_state_mkFSMstate == 3'd0 ||
	      edpFsm_state_mkFSMstate == 3'd5) &&
	     !WILL_FIRE_RL_egress_body ;
  // rule RL_edpFsm_idle_l89c3
  assign WILL_FIRE_RL_edpFsm_idle_l89c3 =
	     !edpFsm_start_reg_1_1$whas && edpFsm_state_mkFSMstate == 3'd5 ;
  // inputs to muxes for submodule ports
  assign MUX_edpFsm_start_reg$write_1__SEL_2 =
	     edpFsm_abort_whas__5_AND_edpFsm_abort_wget__6__ETC___d157 &&
	     !edpFsm_start_reg &&
	     dpRespF$EMPTY_N &&
	     !txPayload ;
  assign MUX_edpRespF$enq_1__VAL_1 =
	     { 2'd0,
	       dMAddr[23:16],
	       2'd0,
	       dMAddr[31:24],
	       2'd0,
	       dMAddr[39:32],
	       2'd0,
	       dMAddr[47:40] } ;
  assign MUX_edpRespF$enq_1__VAL_2 =
	     { 2'd0,
	       uMAddr[39:32],
	       2'd0,
	       uMAddr[47:40],
	       2'd0,
	       dMAddr[7:0],
	       2'd0,
	       dMAddr[15:8] } ;
  assign MUX_edpRespF$enq_1__VAL_3 =
	     { 2'd0,
	       uMAddr[7:0],
	       2'd0,
	       uMAddr[15:8],
	       2'd0,
	       uMAddr[23:16],
	       2'd0,
	       uMAddr[31:24] } ;
  assign MUX_edpRespF$enq_1__VAL_4 =
	     { 2'd0,
	       eeDID[7:0],
	       2'd0,
	       eeDID[15:8],
	       2'd0,
	       dEType[7:0],
	       2'd0,
	       dEType[15:8] } ;
  assign MUX_edpRespF$enq_1__VAL_5 =
	     { CASE_dpRespFD_OUT_BITS_39_TO_38_3_0_dpRespFD_ETC__q9,
	       dpRespF$D_OUT[37:30],
	       CASE_dpRespFD_OUT_BITS_29_TO_28_3_0_dpRespFD_ETC__q10,
	       dpRespF$D_OUT[27:20],
	       CASE_dpRespFD_OUT_BITS_19_TO_18_3_0_dpRespFD_ETC__q11,
	       dpRespF$D_OUT[17:10],
	       CASE_dpRespFD_OUT_BITS_9_TO_8_3_0_dpRespFD_O_ETC__q12,
	       dpRespF$D_OUT[7:0] } ;
  assign MUX_txPayload$write_1__VAL_2 =
	     dpRespF$D_OUT[9:8] == 2'd0 && dpRespF$D_OUT[19:18] == 2'd0 &&
	     dpRespF$D_OUT[29:28] == 2'd0 &&
	     dpRespF$D_OUT[39:38] == 2'd0 ;
  // inlined wires
  assign edpIngress_1$wget = 1'd1 ;
  assign edpIngress_1$whas =
	     edpReqF$EMPTY_N && (igPtr_1_ULE_3___d12 || dpReqF$FULL_N) ;
  assign edpEgress_1$wget = 1'd1 ;
  assign edpEgress_1$whas = WILL_FIRE_RL_egress_body ;
  assign edpEgressEOP_1$wget =
	     dpRespF$D_OUT[9:8] != 2'd0 || dpRespF$D_OUT[19:18] != 2'd0 ||
	     dpRespF$D_OUT[29:28] != 2'd0 ||
	     dpRespF$D_OUT[39:38] != 2'd0 ;
  assign edpEgressEOP_1$whas = WILL_FIRE_RL_egress_body ;
  assign edpFsm_start_wire$wget = 1'd1 ;
  assign edpFsm_start_wire$whas = edpFsm_start_reg_1_1$whas ;
  assign edpFsm_start_reg_1_1$wget = 1'd1 ;
  assign edpFsm_start_reg_1_1$whas =
	     WILL_FIRE_RL_edpFsm_fsm_start ||
	     edpFsm_start_reg_1 && !edpFsm_state_fired ;
  assign edpFsm_abort$wget = 1'b0 ;
  assign edpFsm_abort$whas = 1'b0 ;
  assign edpFsm_state_fired_1$wget = 1'd1 ;
  assign edpFsm_state_fired_1$whas = edpFsm_state_set_pw$whas ;
  assign edpFsm_state_set_pw$whas =
	     WILL_FIRE_RL_edpFsm_idle_l89c3 ||
	     edpFsm_state_mkFSMstate == 3'd4 ||
	     WILL_FIRE_RL_edpFsm_action_l93c14 ||
	     WILL_FIRE_RL_edpFsm_action_l92c14 ||
	     WILL_FIRE_RL_edpFsm_action_l91c14 ||
	     WILL_FIRE_RL_edpFsm_action_l90c14 ;
  assign edpFsm_state_overlap_pw$whas = 1'b0 ;
  // register dEType
  assign dEType$D_IN = dstType_t ;
  assign dEType$EN = EN_dstType ;
  // register dMAddr
  assign dMAddr$D_IN = dstAddr_d ;
  assign dMAddr$EN = EN_dstAddr ;
  // register dbge0
  assign dbge0$D_IN =
	     { CASE_dpRespFD_OUT_BITS_9_TO_8_3_0_dpRespFD_O_ETC__q12,
	       dpRespF$D_OUT[7:0] } ;
  assign dbge0$EN = WILL_FIRE_RL_egress_body ;
  // register dbge1
  assign dbge1$D_IN =
	     { CASE_dpRespFD_OUT_BITS_19_TO_18_3_0_dpRespFD_ETC__q11,
	       dpRespF$D_OUT[17:10] } ;
  assign dbge1$EN = WILL_FIRE_RL_egress_body ;
  // register dbge2
  assign dbge2$D_IN =
	     { CASE_dpRespFD_OUT_BITS_29_TO_28_3_0_dpRespFD_ETC__q10,
	       dpRespF$D_OUT[27:20] } ;
  assign dbge2$EN = WILL_FIRE_RL_egress_body ;
  // register dbge3
  assign dbge3$D_IN =
	     { CASE_dpRespFD_OUT_BITS_39_TO_38_3_0_dpRespFD_ETC__q9,
	       dpRespF$D_OUT[37:30] } ;
  assign dbge3$EN = WILL_FIRE_RL_egress_body ;
  // register edpEgress
  assign edpEgress$D_IN = WILL_FIRE_RL_egress_body ;
  assign edpEgress$EN = 1'd1 ;
  // register edpEgressEOP
  assign edpEgressEOP$D_IN = WILL_FIRE_RL_egress_body && edpEgressEOP_1$wget ;
  assign edpEgressEOP$EN = 1'd1 ;
  // register edpFsm_start_reg
  assign edpFsm_start_reg$D_IN = !WILL_FIRE_RL_edpFsm_fsm_start ;
  assign edpFsm_start_reg$EN =
	     WILL_FIRE_RL_edpFsm_fsm_start ||
	     MUX_edpFsm_start_reg$write_1__SEL_2 ;
  // register edpFsm_start_reg_1
  assign edpFsm_start_reg_1$D_IN = edpFsm_start_reg_1_1$whas ;
  assign edpFsm_start_reg_1$EN = 1'd1 ;
  // register edpFsm_state_can_overlap
  assign edpFsm_state_can_overlap$D_IN =
	     edpFsm_state_set_pw$whas || edpFsm_state_can_overlap ;
  assign edpFsm_state_can_overlap$EN = 1'd1 ;
  // register edpFsm_state_fired
  assign edpFsm_state_fired$D_IN = edpFsm_state_set_pw$whas ;
  assign edpFsm_state_fired$EN = 1'd1 ;
  // register edpFsm_state_mkFSMstate
  always@(WILL_FIRE_RL_edpFsm_idle_l89c3 or
	  WILL_FIRE_RL_edpFsm_action_l90c14 or
	  WILL_FIRE_RL_edpFsm_action_l91c14 or
	  WILL_FIRE_RL_edpFsm_action_l92c14 or
	  WILL_FIRE_RL_edpFsm_action_l93c14 or edpFsm_state_mkFSMstate)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_edpFsm_idle_l89c3: edpFsm_state_mkFSMstate$D_IN = 3'd0;
      WILL_FIRE_RL_edpFsm_action_l90c14: edpFsm_state_mkFSMstate$D_IN = 3'd1;
      WILL_FIRE_RL_edpFsm_action_l91c14: edpFsm_state_mkFSMstate$D_IN = 3'd2;
      WILL_FIRE_RL_edpFsm_action_l92c14: edpFsm_state_mkFSMstate$D_IN = 3'd3;
      WILL_FIRE_RL_edpFsm_action_l93c14: edpFsm_state_mkFSMstate$D_IN = 3'd4;
      edpFsm_state_mkFSMstate == 3'd4: edpFsm_state_mkFSMstate$D_IN = 3'd5;
      default: edpFsm_state_mkFSMstate$D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign edpFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_edpFsm_idle_l89c3 ||
	     WILL_FIRE_RL_edpFsm_action_l90c14 ||
	     WILL_FIRE_RL_edpFsm_action_l91c14 ||
	     WILL_FIRE_RL_edpFsm_action_l92c14 ||
	     WILL_FIRE_RL_edpFsm_action_l93c14 ||
	     edpFsm_state_mkFSMstate == 3'd4 ;
  // register edpIngress
  assign edpIngress$D_IN = edpIngress_1$whas ;
  assign edpIngress$EN = 1'd1 ;
  // register eeDID
  assign eeDID$D_IN = { dpRespF$D_OUT[27:20], dpRespF$D_OUT[37:30] } ;
  assign eeDID$EN = MUX_edpFsm_start_reg$write_1__SEL_2 ;
  // register igPtr
  assign igPtr$D_IN =
	     (x__h1670 == 4'd0) ?
	       ((igPtr == 4'd15) ? igPtr : igPtr + 4'd1) :
	       4'd0 ;
  assign igPtr$EN = edpIngress_1$whas ;
  // register txPayload
  assign txPayload$D_IN =
	     edpFsm_state_mkFSMstate == 3'd4 || MUX_txPayload$write_1__VAL_2 ;
  assign txPayload$EN =
	     WILL_FIRE_RL_egress_body || edpFsm_state_mkFSMstate == 3'd4 ;
  // register uMAddr
  assign uMAddr$D_IN = macAddr_u ;
  assign uMAddr$EN = EN_macAddr ;
  // submodule dpReqF
  assign dpReqF$D_IN =
	     { CASE_edpReqFD_OUT_BITS_39_TO_38_3_0_edpReqFD_ETC__q13,
	       edpReqF$D_OUT[37:30],
	       CASE_edpReqFD_OUT_BITS_29_TO_28_3_0_edpReqFD_ETC__q14,
	       edpReqF$D_OUT[27:20],
	       CASE_edpReqFD_OUT_BITS_19_TO_18_3_0_edpReqFD_ETC__q15,
	       edpReqF$D_OUT[17:10],
	       CASE_edpReqFD_OUT_BITS_9_TO_8_3_0_edpReqFD_O_ETC__q16,
	       edpReqF$D_OUT[7:0] } ;
  assign dpReqF$ENQ =
	     edpReqF$EMPTY_N && (igPtr_1_ULE_3___d12 || dpReqF$FULL_N) &&
	     !igPtr_1_ULE_3___d12 ;
  assign dpReqF$DEQ = EN_client_request_get ;
  assign dpReqF$CLR = 1'b0 ;
  // submodule dpRespF
  assign dpRespF$D_IN =
	     { CASE_client_response_put_BITS_39_TO_38_3_0_cli_ETC__q17,
	       client_response_put[37:30],
	       CASE_client_response_put_BITS_29_TO_28_3_0_cli_ETC__q18,
	       client_response_put[27:20],
	       CASE_client_response_put_BITS_19_TO_18_3_0_cli_ETC__q19,
	       client_response_put[17:10],
	       CASE_client_response_put_BITS_9_TO_8_3_0_clien_ETC__q20,
	       client_response_put[7:0] } ;
  assign dpRespF$ENQ = EN_client_response_put ;
  assign dpRespF$DEQ =
	     WILL_FIRE_RL_egress_body || MUX_edpFsm_start_reg$write_1__SEL_2 ;
  assign dpRespF$CLR = 1'b0 ;
  // submodule edpReqF
  assign edpReqF$D_IN =
	     { CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q21,
	       server_request_put[37:30],
	       CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q22,
	       server_request_put[27:20],
	       CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q23,
	       server_request_put[17:10],
	       CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q24,
	       server_request_put[7:0] } ;
  assign edpReqF$ENQ = EN_server_request_put ;
  assign edpReqF$DEQ = edpIngress_1$whas ;
  assign edpReqF$CLR = 1'b0 ;
  // submodule edpRespF
  always@(WILL_FIRE_RL_edpFsm_action_l90c14 or
	  MUX_edpRespF$enq_1__VAL_1 or
	  WILL_FIRE_RL_edpFsm_action_l91c14 or
	  MUX_edpRespF$enq_1__VAL_2 or
	  WILL_FIRE_RL_edpFsm_action_l92c14 or
	  MUX_edpRespF$enq_1__VAL_3 or
	  WILL_FIRE_RL_edpFsm_action_l93c14 or
	  MUX_edpRespF$enq_1__VAL_4 or
	  WILL_FIRE_RL_egress_body or MUX_edpRespF$enq_1__VAL_5)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_edpFsm_action_l90c14:
	  edpRespF$D_IN = MUX_edpRespF$enq_1__VAL_1;
      WILL_FIRE_RL_edpFsm_action_l91c14:
	  edpRespF$D_IN = MUX_edpRespF$enq_1__VAL_2;
      WILL_FIRE_RL_edpFsm_action_l92c14:
	  edpRespF$D_IN = MUX_edpRespF$enq_1__VAL_3;
      WILL_FIRE_RL_edpFsm_action_l93c14:
	  edpRespF$D_IN = MUX_edpRespF$enq_1__VAL_4;
      WILL_FIRE_RL_egress_body: edpRespF$D_IN = MUX_edpRespF$enq_1__VAL_5;
      default: edpRespF$D_IN = 40'hAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign edpRespF$ENQ =
	     WILL_FIRE_RL_edpFsm_action_l90c14 ||
	     WILL_FIRE_RL_edpFsm_action_l91c14 ||
	     WILL_FIRE_RL_edpFsm_action_l92c14 ||
	     WILL_FIRE_RL_edpFsm_action_l93c14 ||
	     WILL_FIRE_RL_egress_body ;
  assign edpRespF$DEQ = EN_server_response_get ;
  assign edpRespF$CLR = 1'b0 ;
  // remaining internal signals
  assign edpFsm_abort_whas__5_AND_edpFsm_abort_wget__6__ETC___d157 =
	     (edpFsm_state_mkFSMstate == 3'd0 ||
	      edpFsm_state_mkFSMstate == 3'd5) &&
	     (!edpFsm_start_reg_1 || edpFsm_state_fired) ;
  assign igPtr_1_ULE_3___d12 = igPtr <= 4'd3 ;
  assign x__h1670 =
	     { edpReqF$D_OUT[39:38] != 2'd0,
	       edpReqF$D_OUT[29:28] != 2'd0,
	       edpReqF$D_OUT[19:18] != 2'd0,
	       edpReqF$D_OUT[9:8] != 2'd0 } ;
  always@(edpRespF$D_OUT)
  begin
    case (edpRespF$D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_edpRespFD_OUT_BITS_39_TO_38_3_0_edpRespF_ETC__q1 =
	      edpRespF$D_OUT[39:38];
      2'd3: CASE_edpRespFD_OUT_BITS_39_TO_38_3_0_edpRespF_ETC__q1 = 2'd3;
    endcase
  end
  always@(edpRespF$D_OUT)
  begin
    case (edpRespF$D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_edpRespFD_OUT_BITS_29_TO_28_3_0_edpRespF_ETC__q2 =
	      edpRespF$D_OUT[29:28];
      2'd3: CASE_edpRespFD_OUT_BITS_29_TO_28_3_0_edpRespF_ETC__q2 = 2'd3;
    endcase
  end
  always@(edpRespF$D_OUT)
  begin
    case (edpRespF$D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_edpRespFD_OUT_BITS_19_TO_18_3_0_edpRespF_ETC__q3 =
	      edpRespF$D_OUT[19:18];
      2'd3: CASE_edpRespFD_OUT_BITS_19_TO_18_3_0_edpRespF_ETC__q3 = 2'd3;
    endcase
  end
  always@(edpRespF$D_OUT)
  begin
    case (edpRespF$D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_edpRespFD_OUT_BITS_9_TO_8_3_0_edpRespFD_ETC__q4 =
	      edpRespF$D_OUT[9:8];
      2'd3: CASE_edpRespFD_OUT_BITS_9_TO_8_3_0_edpRespFD_ETC__q4 = 2'd3;
    endcase
  end
  always@(dpReqF$D_OUT)
  begin
    case (dpReqF$D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_dpReqFD_OUT_BITS_39_TO_38_3_0_dpReqFD_O_ETC__q5 =
	      dpReqF$D_OUT[39:38];
      2'd3: CASE_dpReqFD_OUT_BITS_39_TO_38_3_0_dpReqFD_O_ETC__q5 = 2'd3;
    endcase
  end
  always@(dpReqF$D_OUT)
  begin
    case (dpReqF$D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_dpReqFD_OUT_BITS_29_TO_28_3_0_dpReqFD_O_ETC__q6 =
	      dpReqF$D_OUT[29:28];
      2'd3: CASE_dpReqFD_OUT_BITS_29_TO_28_3_0_dpReqFD_O_ETC__q6 = 2'd3;
    endcase
  end
  always@(dpReqF$D_OUT)
  begin
    case (dpReqF$D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_dpReqFD_OUT_BITS_19_TO_18_3_0_dpReqFD_O_ETC__q7 =
	      dpReqF$D_OUT[19:18];
      2'd3: CASE_dpReqFD_OUT_BITS_19_TO_18_3_0_dpReqFD_O_ETC__q7 = 2'd3;
    endcase
  end
  always@(dpReqF$D_OUT)
  begin
    case (dpReqF$D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_dpReqFD_OUT_BITS_9_TO_8_3_0_dpReqFD_OUT_ETC__q8 =
	      dpReqF$D_OUT[9:8];
      2'd3: CASE_dpReqFD_OUT_BITS_9_TO_8_3_0_dpReqFD_OUT_ETC__q8 = 2'd3;
    endcase
  end
  always@(dpRespF$D_OUT)
  begin
    case (dpRespF$D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_dpRespFD_OUT_BITS_39_TO_38_3_0_dpRespFD_ETC__q9 =
	      dpRespF$D_OUT[39:38];
      2'd3: CASE_dpRespFD_OUT_BITS_39_TO_38_3_0_dpRespFD_ETC__q9 = 2'd3;
    endcase
  end
  always@(dpRespF$D_OUT)
  begin
    case (dpRespF$D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_dpRespFD_OUT_BITS_29_TO_28_3_0_dpRespFD_ETC__q10 =
	      dpRespF$D_OUT[29:28];
      2'd3: CASE_dpRespFD_OUT_BITS_29_TO_28_3_0_dpRespFD_ETC__q10 = 2'd3;
    endcase
  end
  always@(dpRespF$D_OUT)
  begin
    case (dpRespF$D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_dpRespFD_OUT_BITS_19_TO_18_3_0_dpRespFD_ETC__q11 =
	      dpRespF$D_OUT[19:18];
      2'd3: CASE_dpRespFD_OUT_BITS_19_TO_18_3_0_dpRespFD_ETC__q11 = 2'd3;
    endcase
  end
  always@(dpRespF$D_OUT)
  begin
    case (dpRespF$D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_dpRespFD_OUT_BITS_9_TO_8_3_0_dpRespFD_O_ETC__q12 =
	      dpRespF$D_OUT[9:8];
      2'd3: CASE_dpRespFD_OUT_BITS_9_TO_8_3_0_dpRespFD_O_ETC__q12 = 2'd3;
    endcase
  end
  always@(edpReqF$D_OUT)
  begin
    case (edpReqF$D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_edpReqFD_OUT_BITS_39_TO_38_3_0_edpReqFD_ETC__q13 =
	      edpReqF$D_OUT[39:38];
      2'd3: CASE_edpReqFD_OUT_BITS_39_TO_38_3_0_edpReqFD_ETC__q13 = 2'd3;
    endcase
  end
  always@(edpReqF$D_OUT)
  begin
    case (edpReqF$D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_edpReqFD_OUT_BITS_29_TO_28_3_0_edpReqFD_ETC__q14 =
	      edpReqF$D_OUT[29:28];
      2'd3: CASE_edpReqFD_OUT_BITS_29_TO_28_3_0_edpReqFD_ETC__q14 = 2'd3;
    endcase
  end
  always@(edpReqF$D_OUT)
  begin
    case (edpReqF$D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_edpReqFD_OUT_BITS_19_TO_18_3_0_edpReqFD_ETC__q15 =
	      edpReqF$D_OUT[19:18];
      2'd3: CASE_edpReqFD_OUT_BITS_19_TO_18_3_0_edpReqFD_ETC__q15 = 2'd3;
    endcase
  end
  always@(edpReqF$D_OUT)
  begin
    case (edpReqF$D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_edpReqFD_OUT_BITS_9_TO_8_3_0_edpReqFD_O_ETC__q16 =
	      edpReqF$D_OUT[9:8];
      2'd3: CASE_edpReqFD_OUT_BITS_9_TO_8_3_0_edpReqFD_O_ETC__q16 = 2'd3;
    endcase
  end
  always@(client_response_put)
  begin
    case (client_response_put[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_client_response_put_BITS_39_TO_38_3_0_cli_ETC__q17 =
	      client_response_put[39:38];
      2'd3: CASE_client_response_put_BITS_39_TO_38_3_0_cli_ETC__q17 = 2'd3;
    endcase
  end
  always@(client_response_put)
  begin
    case (client_response_put[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_client_response_put_BITS_29_TO_28_3_0_cli_ETC__q18 =
	      client_response_put[29:28];
      2'd3: CASE_client_response_put_BITS_29_TO_28_3_0_cli_ETC__q18 = 2'd3;
    endcase
  end
  always@(client_response_put)
  begin
    case (client_response_put[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_client_response_put_BITS_19_TO_18_3_0_cli_ETC__q19 =
	      client_response_put[19:18];
      2'd3: CASE_client_response_put_BITS_19_TO_18_3_0_cli_ETC__q19 = 2'd3;
    endcase
  end
  always@(client_response_put)
  begin
    case (client_response_put[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_client_response_put_BITS_9_TO_8_3_0_clien_ETC__q20 =
	      client_response_put[9:8];
      2'd3: CASE_client_response_put_BITS_9_TO_8_3_0_clien_ETC__q20 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q21 =
	      server_request_put[39:38];
      2'd3: CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q21 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q22 =
	      server_request_put[29:28];
      2'd3: CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q22 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q23 =
	      server_request_put[19:18];
      2'd3: CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q23 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q24 =
	      server_request_put[9:8];
      2'd3: CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q24 = 2'd3;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        edpEgress <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edpEgressEOP <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edpFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edpFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edpFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	edpFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edpFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 3'd0;
	edpIngress <= `BSV_ASSIGNMENT_DELAY 1'd0;
	igPtr <= `BSV_ASSIGNMENT_DELAY 4'd0;
	txPayload <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (edpEgress$EN) edpEgress <= `BSV_ASSIGNMENT_DELAY edpEgress$D_IN;
	if (edpEgressEOP$EN)
	  edpEgressEOP <= `BSV_ASSIGNMENT_DELAY edpEgressEOP$D_IN;
	if (edpFsm_start_reg$EN)
	  edpFsm_start_reg <= `BSV_ASSIGNMENT_DELAY edpFsm_start_reg$D_IN;
	if (edpFsm_start_reg_1$EN)
	  edpFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY edpFsm_start_reg_1$D_IN;
	if (edpFsm_state_can_overlap$EN)
	  edpFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      edpFsm_state_can_overlap$D_IN;
	if (edpFsm_state_fired$EN)
	  edpFsm_state_fired <= `BSV_ASSIGNMENT_DELAY edpFsm_state_fired$D_IN;
	if (edpFsm_state_mkFSMstate$EN)
	  edpFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      edpFsm_state_mkFSMstate$D_IN;
	if (edpIngress$EN)
	  edpIngress <= `BSV_ASSIGNMENT_DELAY edpIngress$D_IN;
	if (igPtr$EN) igPtr <= `BSV_ASSIGNMENT_DELAY igPtr$D_IN;
	if (txPayload$EN) txPayload <= `BSV_ASSIGNMENT_DELAY txPayload$D_IN;
      end
    if (dEType$EN) dEType <= `BSV_ASSIGNMENT_DELAY dEType$D_IN;
    if (dMAddr$EN) dMAddr <= `BSV_ASSIGNMENT_DELAY dMAddr$D_IN;
    if (dbge0$EN) dbge0 <= `BSV_ASSIGNMENT_DELAY dbge0$D_IN;
    if (dbge1$EN) dbge1 <= `BSV_ASSIGNMENT_DELAY dbge1$D_IN;
    if (dbge2$EN) dbge2 <= `BSV_ASSIGNMENT_DELAY dbge2$D_IN;
    if (dbge3$EN) dbge3 <= `BSV_ASSIGNMENT_DELAY dbge3$D_IN;
    if (eeDID$EN) eeDID <= `BSV_ASSIGNMENT_DELAY eeDID$D_IN;
    if (uMAddr$EN) uMAddr <= `BSV_ASSIGNMENT_DELAY uMAddr$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    dEType = 16'hAAAA;
    dMAddr = 48'hAAAAAAAAAAAA;
    dbge0 = 10'h2AA;
    dbge1 = 10'h2AA;
    dbge2 = 10'h2AA;
    dbge3 = 10'h2AA;
    edpEgress = 1'h0;
    edpEgressEOP = 1'h0;
    edpFsm_start_reg = 1'h0;
    edpFsm_start_reg_1 = 1'h0;
    edpFsm_state_can_overlap = 1'h0;
    edpFsm_state_fired = 1'h0;
    edpFsm_state_mkFSMstate = 3'h2;
    edpIngress = 1'h0;
    eeDID = 16'hAAAA;
    igPtr = 4'hA;
    txPayload = 1'h0;
    uMAddr = 48'hAAAAAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l91c14 &&
	  (WILL_FIRE_RL_edpFsm_action_l92c14 ||
	   WILL_FIRE_RL_edpFsm_action_l93c14 ||
	   edpFsm_state_mkFSMstate == 3'd4))
	$display("Error: \"bsv/eth/EDDP.bsv\", line 91, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l91c14] and\n  [RL_edpFsm_action_l92c14, RL_edpFsm_action_l93c14, RL_edpFsm_action_l94c16]\n  ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l92c14 &&
	  (WILL_FIRE_RL_edpFsm_action_l93c14 ||
	   edpFsm_state_mkFSMstate == 3'd4))
	$display("Error: \"bsv/eth/EDDP.bsv\", line 92, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l92c14] and\n  [RL_edpFsm_action_l93c14, RL_edpFsm_action_l94c16] ) fired in the same clock\n  cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l93c14 &&
	  edpFsm_state_mkFSMstate == 3'd4)
	$display("Error: \"bsv/eth/EDDP.bsv\", line 93, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l93c14] and\n  [RL_edpFsm_action_l94c16] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l90c14 &&
	  (WILL_FIRE_RL_edpFsm_action_l91c14 ||
	   WILL_FIRE_RL_edpFsm_action_l92c14 ||
	   WILL_FIRE_RL_edpFsm_action_l93c14 ||
	   edpFsm_state_mkFSMstate == 3'd4))
	$display("Error: \"bsv/eth/EDDP.bsv\", line 90, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l90c14] and\n  [RL_edpFsm_action_l91c14, RL_edpFsm_action_l92c14, RL_edpFsm_action_l93c14,\n  RL_edpFsm_action_l94c16] ) fired in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule