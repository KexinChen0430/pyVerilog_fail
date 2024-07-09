module outputs
  wire [58 : 0] client_request_get;
  wire [39 : 0] server_response_get;
  wire RDY_client_request_get,
       RDY_client_response_put,
       RDY_ecpRx,
       RDY_ecpTx,
       RDY_macAddr,
       RDY_server_request_put,
       RDY_server_response_get,
       ecpRx,
       ecpTx;
  // inlined wires
  wire eDoReq_1$wget,
       eDoReq_1$whas,
       ecpEgress_1$wget,
       ecpEgress_1$whas,
       ecpIngress_1$wget,
       ecpIngress_1$whas,
       edpFsm_abort$wget,
       edpFsm_abort$whas,
       edpFsm_start_reg_1_1$wget,
       edpFsm_start_reg_1_1$whas,
       edpFsm_start_wire$wget,
       edpFsm_start_wire$whas,
       edpFsm_state_fired_1$wget,
       edpFsm_state_fired_1$whas,
       edpFsm_state_overlap_pw$whas,
       edpFsm_state_set_pw$whas;
  // register doInFlight
  reg doInFlight;
  wire doInFlight$D_IN, doInFlight$EN;
  // register eAddr
  reg [31 : 0] eAddr;
  wire [31 : 0] eAddr$D_IN;
  wire eAddr$EN;
  // register eDAddr
  reg [47 : 0] eDAddr;
  wire [47 : 0] eDAddr$D_IN;
  wire eDAddr$EN;
  // register eDMH
  reg [31 : 0] eDMH;
  wire [31 : 0] eDMH$D_IN;
  wire eDMH$EN;
  // register eData
  reg [31 : 0] eData;
  wire [31 : 0] eData$D_IN;
  wire eData$EN;
  // register eDoReq
  reg eDoReq;
  wire eDoReq$D_IN, eDoReq$EN;
  // register eMAddr
  reg [47 : 0] eMAddr;
  wire [47 : 0] eMAddr$D_IN;
  wire eMAddr$EN;
  // register ePli
  reg [15 : 0] ePli;
  wire [15 : 0] ePli$D_IN;
  wire ePli$EN;
  // register eTyp
  reg [15 : 0] eTyp;
  wire [15 : 0] eTyp$D_IN;
  wire eTyp$EN;
  // register ecpEgress
  reg ecpEgress;
  wire ecpEgress$D_IN, ecpEgress$EN;
  // register ecpIngress
  reg ecpIngress;
  wire ecpIngress$D_IN, ecpIngress$EN;
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
  reg [3 : 0] edpFsm_state_mkFSMstate;
  reg [3 : 0] edpFsm_state_mkFSMstate$D_IN;
  wire edpFsm_state_mkFSMstate$EN;
  // register eeDat
  reg [31 : 0] eeDat;
  wire [31 : 0] eeDat$D_IN;
  wire eeDat$EN;
  // register eeDmh
  reg [31 : 0] eeDmh;
  wire [31 : 0] eeDmh$D_IN;
  wire eeDmh$EN;
  // register eeMDst
  reg [47 : 0] eeMDst;
  wire [47 : 0] eeMDst$D_IN;
  wire eeMDst$EN;
  // register eePli
  reg [15 : 0] eePli;
  reg [15 : 0] eePli$D_IN;
  wire eePli$EN;
  // register isWrtResp
  reg isWrtResp;
  wire isWrtResp$D_IN, isWrtResp$EN;
  // register lastResp
  reg [44 : 0] lastResp;
  wire [44 : 0] lastResp$D_IN;
  wire lastResp$EN;
  // register lastTag
  reg [8 : 0] lastTag;
  wire [8 : 0] lastTag$D_IN;
  wire lastTag$EN;
  // register ptr
  reg [3 : 0] ptr;
  wire [3 : 0] ptr$D_IN;
  wire ptr$EN;
  // register uMAddr
  reg [47 : 0] uMAddr;
  wire [47 : 0] uMAddr$D_IN;
  wire uMAddr$EN;
  // ports of submodule cpReqF
  wire [58 : 0] cpReqF$D_IN, cpReqF$D_OUT;
  wire cpReqF$CLR, cpReqF$DEQ, cpReqF$EMPTY_N, cpReqF$ENQ, cpReqF$FULL_N;
  // ports of submodule cpRespF
  wire [39 : 0] cpRespF$D_IN, cpRespF$D_OUT;
  wire cpRespF$CLR, cpRespF$DEQ, cpRespF$EMPTY_N, cpRespF$ENQ, cpRespF$FULL_N;
  // ports of submodule dcpReqF
  reg [78 : 0] dcpReqF$D_IN;
  wire [78 : 0] dcpReqF$D_OUT;
  wire dcpReqF$CLR, dcpReqF$DEQ, dcpReqF$EMPTY_N, dcpReqF$ENQ, dcpReqF$FULL_N;
  // ports of submodule dcpRespF
  wire [44 : 0] dcpRespF$D_IN, dcpRespF$D_OUT;
  wire dcpRespF$CLR,
       dcpRespF$DEQ,
       dcpRespF$EMPTY_N,
       dcpRespF$ENQ,
       dcpRespF$FULL_N;
  // ports of submodule eMAddrF
  wire [47 : 0] eMAddrF$D_IN, eMAddrF$D_OUT;
  wire eMAddrF$CLR, eMAddrF$DEQ, eMAddrF$EMPTY_N, eMAddrF$ENQ, eMAddrF$FULL_N;
  // ports of submodule ecpReqF
  wire [39 : 0] ecpReqF$D_IN, ecpReqF$D_OUT;
  wire ecpReqF$CLR, ecpReqF$DEQ, ecpReqF$EMPTY_N, ecpReqF$ENQ, ecpReqF$FULL_N;
  // ports of submodule ecpRespF
  reg [39 : 0] ecpRespF$D_IN;
  wire [39 : 0] ecpRespF$D_OUT;
  wire ecpRespF$CLR,
       ecpRespF$DEQ,
       ecpRespF$EMPTY_N,
       ecpRespF$ENQ,
       ecpRespF$FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_cp_to_dcp_response,
       WILL_FIRE_RL_dcp_to_cp_request,
       WILL_FIRE_RL_ecp_ingress,
       WILL_FIRE_RL_edpFsm_action_l243c16,
       WILL_FIRE_RL_edpFsm_action_l244c16,
       WILL_FIRE_RL_edpFsm_fsm_start,
       WILL_FIRE_RL_edpFsm_idle_l235c3,
       WILL_FIRE_RL_edpFsm_idle_l235c3_1;
  // inputs to muxes for submodule ports
  reg [44 : 0] MUX_dcpRespF$enq_1__VAL_1;
  wire [44 : 0] MUX_dcpRespF$enq_1__VAL_2;
  wire [39 : 0] MUX_ecpRespF$enq_1__VAL_1,
		MUX_ecpRespF$enq_1__VAL_2,
		MUX_ecpRespF$enq_1__VAL_3,
		MUX_ecpRespF$enq_1__VAL_4,
		MUX_ecpRespF$enq_1__VAL_5,
		MUX_ecpRespF$enq_1__VAL_6,
		MUX_ecpRespF$enq_1__VAL_7;
  wire MUX_dcpRespF$enq_1__SEL_1,
       MUX_doInFlight$write_1__SEL_1,
       MUX_edpFsm_start_reg$write_1__SEL_2,
       MUX_edpFsm_state_mkFSMstate$write_1__SEL_1,
       MUX_edpFsm_state_mkFSMstate$write_1__SEL_2,
       MUX_edpFsm_state_mkFSMstate$write_1__SEL_3,
       MUX_edpFsm_state_mkFSMstate$write_1__SEL_4,
       MUX_edpFsm_state_mkFSMstate$write_1__SEL_5,
       MUX_edpFsm_state_mkFSMstate$write_1__SEL_6;
  // remaining internal signals
  reg [7 : 0] CASE_dcpRespFD_OUT_BITS_44_TO_43_IF_dcpRespF__ETC__q10;
  reg [1 : 0] CASE_ecpRespFD_OUT_BITS_19_TO_18_3_0_ecpRespF_ETC__q3,
	      CASE_ecpRespFD_OUT_BITS_29_TO_28_3_0_ecpRespF_ETC__q2,
	      CASE_ecpRespFD_OUT_BITS_39_TO_38_3_0_ecpRespF_ETC__q1,
	      CASE_ecpRespFD_OUT_BITS_9_TO_8_3_0_ecpRespFD_ETC__q4,
	      CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q8,
	      CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q7,
	      CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q6,
	      CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q9;
  reg CASE_eDMH_BITS_13_TO_12_NOT_eDMH_BITS_13_TO_12_ETC__q5;
  wire [47 : 0] x__h3828, x__h5559, x__h5600, x__h5655, y__h5621, y__h5666;
  wire [31 : 0] bedw__h2322;
  wire [15 : 0] x__h5688, x__h5756;
  wire [7 : 0] IF_dcpRespF_first__49_BIT_42_56_THEN_0x70_ELSE_ETC___d465;
  wire [3 : 0] x__h2347;
  wire IF_dcpReqF_first__19_BITS_78_TO_77_20_EQ_0_21__ETC___d152,
       IF_dcpReqF_first__19_BITS_78_TO_77_20_EQ_1_23__ETC___d150,
       dcpReqF_first__19_BITS_39_TO_32_24_EQ_IF_lastT_ETC___d463,
       dcpReqF_first__19_BITS_71_TO_64_37_EQ_IF_lastT_ETC___d464,
       dcpReqF_first__19_BITS_78_TO_77_20_EQ_0_21_OR__ETC___d155,
       dcpReqF_first__19_BITS_78_TO_77_20_EQ_1_23_AND_ETC___d196,
       eMAddrF_i_notFull__9_AND_IF_eDMH_0_BITS_13_TO__ETC___d100,
       edpFsm_abort_whas__19_AND_edpFsm_abort_wget__2_ETC___d253;
  // action method server_request_put
  assign RDY_server_request_put = ecpReqF$FULL_N ;
  // actionvalue method server_response_get
  assign server_response_get =
	     { CASE_ecpRespFD_OUT_BITS_39_TO_38_3_0_ecpRespF_ETC__q1,
	       ecpRespF$D_OUT[37:30],
	       CASE_ecpRespFD_OUT_BITS_29_TO_28_3_0_ecpRespF_ETC__q2,
	       ecpRespF$D_OUT[27:20],
	       CASE_ecpRespFD_OUT_BITS_19_TO_18_3_0_ecpRespF_ETC__q3,
	       ecpRespF$D_OUT[17:10],
	       CASE_ecpRespFD_OUT_BITS_9_TO_8_3_0_ecpRespFD_ETC__q4,
	       ecpRespF$D_OUT[7:0] } ;
  assign RDY_server_response_get = ecpRespF$EMPTY_N ;
  // actionvalue method client_request_get
  assign client_request_get = cpReqF$D_OUT ;
  assign RDY_client_request_get = cpReqF$EMPTY_N ;
  // action method client_response_put
  assign RDY_client_response_put = cpRespF$FULL_N ;
  // action method macAddr
  assign RDY_macAddr = 1'd1 ;
  // value method ecpRx
  assign ecpRx = ecpIngress ;
  assign RDY_ecpRx = 1'd1 ;
  // value method ecpTx
  assign ecpTx = ecpEgress ;
  assign RDY_ecpTx = 1'd1 ;
  // submodule cpReqF
  FIFO2 #(.width(32'd59), .guarded(32'd1)) cpReqF(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(cpReqF$D_IN),
						  .ENQ(cpReqF$ENQ),
						  .DEQ(cpReqF$DEQ),
						  .CLR(cpReqF$CLR),
						  .D_OUT(cpReqF$D_OUT),
						  .FULL_N(cpReqF$FULL_N),
						  .EMPTY_N(cpReqF$EMPTY_N));
  // submodule cpRespF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) cpRespF(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(cpRespF$D_IN),
						   .ENQ(cpRespF$ENQ),
						   .DEQ(cpRespF$DEQ),
						   .CLR(cpRespF$CLR),
						   .D_OUT(cpRespF$D_OUT),
						   .FULL_N(cpRespF$FULL_N),
						   .EMPTY_N(cpRespF$EMPTY_N));
  // submodule dcpReqF
  FIFO2 #(.width(32'd79), .guarded(32'd1)) dcpReqF(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(dcpReqF$D_IN),
						   .ENQ(dcpReqF$ENQ),
						   .DEQ(dcpReqF$DEQ),
						   .CLR(dcpReqF$CLR),
						   .D_OUT(dcpReqF$D_OUT),
						   .FULL_N(dcpReqF$FULL_N),
						   .EMPTY_N(dcpReqF$EMPTY_N));
  // submodule dcpRespF
  FIFO2 #(.width(32'd45), .guarded(32'd1)) dcpRespF(.RST(RST_N),
						    .CLK(CLK),
						    .D_IN(dcpRespF$D_IN),
						    .ENQ(dcpRespF$ENQ),
						    .DEQ(dcpRespF$DEQ),
						    .CLR(dcpRespF$CLR),
						    .D_OUT(dcpRespF$D_OUT),
						    .FULL_N(dcpRespF$FULL_N),
						    .EMPTY_N(dcpRespF$EMPTY_N));
  // submodule eMAddrF
  FIFO2 #(.width(32'd48), .guarded(32'd1)) eMAddrF(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(eMAddrF$D_IN),
						   .ENQ(eMAddrF$ENQ),
						   .DEQ(eMAddrF$DEQ),
						   .CLR(eMAddrF$CLR),
						   .D_OUT(eMAddrF$D_OUT),
						   .FULL_N(eMAddrF$FULL_N),
						   .EMPTY_N(eMAddrF$EMPTY_N));
  // submodule ecpReqF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) ecpReqF(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(ecpReqF$D_IN),
						   .ENQ(ecpReqF$ENQ),
						   .DEQ(ecpReqF$DEQ),
						   .CLR(ecpReqF$CLR),
						   .D_OUT(ecpReqF$D_OUT),
						   .FULL_N(ecpReqF$FULL_N),
						   .EMPTY_N(ecpReqF$EMPTY_N));
  // submodule ecpRespF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) ecpRespF(.RST(RST_N),
						    .CLK(CLK),
						    .D_IN(ecpRespF$D_IN),
						    .ENQ(ecpRespF$ENQ),
						    .DEQ(ecpRespF$DEQ),
						    .CLR(ecpRespF$CLR),
						    .D_OUT(ecpRespF$D_OUT),
						    .FULL_N(ecpRespF$FULL_N),
						    .EMPTY_N(ecpRespF$EMPTY_N));
  // rule RL_ecp_ingress
  assign WILL_FIRE_RL_ecp_ingress = ecpReqF$EMPTY_N && !eDoReq ;
  // rule RL_dcp_to_cp_request
  assign WILL_FIRE_RL_dcp_to_cp_request =
	     dcpReqF$EMPTY_N &&
	     IF_dcpReqF_first__19_BITS_78_TO_77_20_EQ_0_21__ETC___d152 ;
  // rule RL_cp_to_dcp_response
  assign WILL_FIRE_RL_cp_to_dcp_response =
	     dcpRespF$FULL_N && cpRespF$EMPTY_N &&
	     !WILL_FIRE_RL_dcp_to_cp_request ;
  // rule RL_edpFsm_action_l243c16
  assign WILL_FIRE_RL_edpFsm_action_l243c16 =
	     ecpRespF$FULL_N && !isWrtResp &&
	     edpFsm_state_mkFSMstate == 4'd4 ;
  // rule RL_edpFsm_action_l244c16
  assign WILL_FIRE_RL_edpFsm_action_l244c16 =
	     ecpRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd6 ;
  // rule RL_edpFsm_fsm_start
  assign WILL_FIRE_RL_edpFsm_fsm_start =
	     edpFsm_abort_whas__19_AND_edpFsm_abort_wget__2_ETC___d253 &&
	     (!edpFsm_start_reg_1 || edpFsm_state_fired) &&
	     edpFsm_start_reg ;
  // rule RL_edpFsm_idle_l235c3
  assign WILL_FIRE_RL_edpFsm_idle_l235c3 =
	     !edpFsm_start_wire$whas && edpFsm_state_mkFSMstate == 4'd5 ;
  // rule RL_edpFsm_idle_l235c3_1
  assign WILL_FIRE_RL_edpFsm_idle_l235c3_1 =
	     !edpFsm_start_wire$whas && edpFsm_state_mkFSMstate == 4'd7 ;
  // inputs to muxes for submodule ports
  assign MUX_dcpRespF$enq_1__SEL_1 =
	     WILL_FIRE_RL_dcp_to_cp_request &&
	     dcpReqF_first__19_BITS_78_TO_77_20_EQ_0_21_OR__ETC___d155 ;
  assign MUX_doInFlight$write_1__SEL_1 =
	     WILL_FIRE_RL_dcp_to_cp_request &&
	     (dcpReqF$D_OUT[78:77] == 2'd0 && dcpReqF$D_OUT[40] ||
	      dcpReqF$D_OUT[78:77] != 2'd0 &&
	      (dcpReqF$D_OUT[78:77] == 2'd1 && dcpReqF$D_OUT[76] ||
	       dcpReqF$D_OUT[78:77] != 2'd1 && dcpReqF$D_OUT[44])) ;
  assign MUX_edpFsm_start_reg$write_1__SEL_2 =
	     edpFsm_abort_whas__19_AND_edpFsm_abort_wget__2_ETC___d253 &&
	     (!edpFsm_start_reg_1 || edpFsm_state_fired) &&
	     !edpFsm_start_reg &&
	     eMAddrF$EMPTY_N &&
	     dcpRespF$EMPTY_N ;
  assign MUX_edpFsm_state_mkFSMstate$write_1__SEL_1 =
	     WILL_FIRE_RL_edpFsm_idle_l235c3_1 ||
	     WILL_FIRE_RL_edpFsm_idle_l235c3 ;
  assign MUX_edpFsm_state_mkFSMstate$write_1__SEL_2 =
	     ecpRespF$FULL_N && edpFsm_start_wire$whas &&
	     edpFsm_abort_whas__19_AND_edpFsm_abort_wget__2_ETC___d253 ;
  assign MUX_edpFsm_state_mkFSMstate$write_1__SEL_3 =
	     ecpRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd1 ;
  assign MUX_edpFsm_state_mkFSMstate$write_1__SEL_4 =
	     ecpRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd2 ;
  assign MUX_edpFsm_state_mkFSMstate$write_1__SEL_5 =
	     ecpRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd3 ;
  assign MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 =
	     ecpRespF$FULL_N && isWrtResp && edpFsm_state_mkFSMstate == 4'd4 ;
  always@(dcpReqF$D_OUT or lastResp)
  begin
    case (dcpReqF$D_OUT[78:77])
      2'd0:
	  MUX_dcpRespF$enq_1__VAL_1 =
	      { 2'd0,
		dcpReqF$D_OUT[40],
		32'h40000001,
		dcpReqF$D_OUT[39:32],
		2'd0 };
      2'd1:
	  MUX_dcpRespF$enq_1__VAL_1 =
	      { dcpReqF$D_OUT[78:77],
		32'hAAAAAAAA,
		dcpReqF$D_OUT[76],
		dcpReqF$D_OUT[71:64],
		2'd0 };
      default: MUX_dcpRespF$enq_1__VAL_1 =
		   { (lastResp[44:43] == 2'd0 || lastResp[44:43] == 2'd1) ?
		       lastResp[44:43] :
		       2'd2,
		     lastResp[42:0] };
    endcase
  end
  assign MUX_dcpRespF$enq_1__VAL_2 =
	     { 2'd2,
	       doInFlight,
	       cpRespF$D_OUT[31:0],
	       cpRespF$D_OUT[39:32],
	       2'd0 } ;
  assign MUX_ecpRespF$enq_1__VAL_1 =
	     { 2'd0,
	       eeMDst[23:16],
	       2'd0,
	       eeMDst[31:24],
	       2'd0,
	       eeMDst[39:32],
	       2'd0,
	       eeMDst[47:40] } ;
  assign MUX_ecpRespF$enq_1__VAL_2 =
	     { 2'd0,
	       uMAddr[39:32],
	       2'd0,
	       uMAddr[47:40],
	       2'd0,
	       eeMDst[7:0],
	       2'd0,
	       eeMDst[15:8] } ;
  assign MUX_ecpRespF$enq_1__VAL_3 =
	     { 2'd0,
	       uMAddr[7:0],
	       2'd0,
	       uMAddr[15:8],
	       2'd0,
	       uMAddr[23:16],
	       2'd0,
	       uMAddr[31:24] } ;
  assign MUX_ecpRespF$enq_1__VAL_4 =
	     { 2'd0, eePli[7:0], 2'd0, eePli[15:8], 20'd65776 } ;
  assign MUX_ecpRespF$enq_1__VAL_5 =
	     { 2'd1,
	       eeDmh[31:24],
	       2'd0,
	       eeDmh[23:16],
	       2'd0,
	       eeDmh[15:8],
	       2'd0,
	       eeDmh[7:0] } ;
  assign MUX_ecpRespF$enq_1__VAL_6 =
	     { 2'd0,
	       eeDmh[31:24],
	       2'd0,
	       eeDmh[23:16],
	       2'd0,
	       eeDmh[15:8],
	       2'd0,
	       eeDmh[7:0] } ;
  assign MUX_ecpRespF$enq_1__VAL_7 =
	     { 2'd1,
	       eeDat[7:0],
	       2'd0,
	       eeDat[15:8],
	       2'd0,
	       eeDat[23:16],
	       2'd0,
	       eeDat[31:24] } ;
  // inlined wires
  assign eDoReq_1$wget =
	     (eDAddr == 48'hFFFFFFFFFFFF || eDAddr == uMAddr) &&
	     eTyp == 16'hF040 &&
	     (ePli == 16'd10 && ptr == 4'd5 ||
	      ePli == 16'd14 && ptr == 4'd6) ;
  assign eDoReq_1$whas = WILL_FIRE_RL_ecp_ingress ;
  assign ecpIngress_1$wget = 1'd1 ;
  assign ecpIngress_1$whas = WILL_FIRE_RL_ecp_ingress ;
  assign ecpEgress_1$wget =
	     edpFsm_state_mkFSMstate != 4'd0 &&
	     edpFsm_state_mkFSMstate != 4'd5 &&
	     edpFsm_state_mkFSMstate != 4'd7 ||
	     edpFsm_start_reg_1 && !edpFsm_state_fired ||
	     edpFsm_start_reg ;
  assign ecpEgress_1$whas = 1'd1 ;
  assign edpFsm_start_wire$wget = 1'd1 ;
  assign edpFsm_start_wire$whas =
	     WILL_FIRE_RL_edpFsm_fsm_start ||
	     edpFsm_start_reg_1 && !edpFsm_state_fired ;
  assign edpFsm_start_reg_1_1$wget = 1'd1 ;
  assign edpFsm_start_reg_1_1$whas = edpFsm_start_wire$whas ;
  assign edpFsm_abort$wget = 1'b0 ;
  assign edpFsm_abort$whas = 1'b0 ;
  assign edpFsm_state_fired_1$wget = 1'd1 ;
  assign edpFsm_state_fired_1$whas = edpFsm_state_set_pw$whas ;
  assign edpFsm_state_set_pw$whas =
	     WILL_FIRE_RL_edpFsm_idle_l235c3_1 ||
	     WILL_FIRE_RL_edpFsm_idle_l235c3 ||
	     WILL_FIRE_RL_edpFsm_action_l244c16 ||
	     WILL_FIRE_RL_edpFsm_action_l243c16 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_5 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_4 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_3 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_2 ;
  assign edpFsm_state_overlap_pw$whas = 1'b0 ;
  // register doInFlight
  assign doInFlight$D_IN = MUX_doInFlight$write_1__SEL_1 ;
  assign doInFlight$EN =
	     WILL_FIRE_RL_dcp_to_cp_request &&
	     (dcpReqF$D_OUT[78:77] == 2'd0 && dcpReqF$D_OUT[40] ||
	      dcpReqF$D_OUT[78:77] != 2'd0 &&
	      (dcpReqF$D_OUT[78:77] == 2'd1 && dcpReqF$D_OUT[76] ||
	       dcpReqF$D_OUT[78:77] != 2'd1 && dcpReqF$D_OUT[44])) ||
	     WILL_FIRE_RL_cp_to_dcp_response ;
  // register eAddr
  assign eAddr$D_IN = bedw__h2322 ;
  assign eAddr$EN = WILL_FIRE_RL_ecp_ingress && ptr == 4'd5 ;
  // register eDAddr
  assign eDAddr$D_IN = (ptr == 4'd0) ? x__h3828 : x__h5600 ;
  assign eDAddr$EN =
	     WILL_FIRE_RL_ecp_ingress && (ptr == 4'd0 || ptr == 4'd1) ;
  // register eDMH
  assign eDMH$D_IN = bedw__h2322 ;
  assign eDMH$EN = WILL_FIRE_RL_ecp_ingress && ptr == 4'd4 ;
  // register eData
  assign eData$D_IN = bedw__h2322 ;
  assign eData$EN = WILL_FIRE_RL_ecp_ingress && ptr == 4'd6 ;
  // register eDoReq
  assign eDoReq$D_IN = WILL_FIRE_RL_ecp_ingress && eDoReq_1$wget ;
  assign eDoReq$EN = 1'd1 ;
  // register eMAddr
  assign eMAddr$D_IN = (ptr == 4'd1) ? x__h5559 : x__h5655 ;
  assign eMAddr$EN =
	     WILL_FIRE_RL_ecp_ingress && (ptr == 4'd1 || ptr == 4'd2) ;
  // register ePli
  assign ePli$D_IN = x__h5756 ;
  assign ePli$EN = WILL_FIRE_RL_ecp_ingress && ptr == 4'd3 ;
  // register eTyp
  assign eTyp$D_IN = x__h5688 ;
  assign eTyp$EN = WILL_FIRE_RL_ecp_ingress && ptr == 4'd3 ;
  // register ecpEgress
  assign ecpEgress$D_IN = ecpEgress_1$wget ;
  assign ecpEgress$EN = 1'd1 ;
  // register ecpIngress
  assign ecpIngress$D_IN = WILL_FIRE_RL_ecp_ingress ;
  assign ecpIngress$EN = 1'd1 ;
  // register edpFsm_start_reg
  assign edpFsm_start_reg$D_IN = !WILL_FIRE_RL_edpFsm_fsm_start ;
  assign edpFsm_start_reg$EN =
	     WILL_FIRE_RL_edpFsm_fsm_start ||
	     MUX_edpFsm_start_reg$write_1__SEL_2 ;
  // register edpFsm_start_reg_1
  assign edpFsm_start_reg_1$D_IN = edpFsm_start_wire$whas ;
  assign edpFsm_start_reg_1$EN = 1'd1 ;
  // register edpFsm_state_can_overlap
  assign edpFsm_state_can_overlap$D_IN =
	     edpFsm_state_set_pw$whas || edpFsm_state_can_overlap ;
  assign edpFsm_state_can_overlap$EN = 1'd1 ;
  // register edpFsm_state_fired
  assign edpFsm_state_fired$D_IN = edpFsm_state_set_pw$whas ;
  assign edpFsm_state_fired$EN = 1'd1 ;
  // register edpFsm_state_mkFSMstate
  always@(MUX_edpFsm_state_mkFSMstate$write_1__SEL_1 or
	  MUX_edpFsm_state_mkFSMstate$write_1__SEL_2 or
	  MUX_edpFsm_state_mkFSMstate$write_1__SEL_3 or
	  MUX_edpFsm_state_mkFSMstate$write_1__SEL_4 or
	  MUX_edpFsm_state_mkFSMstate$write_1__SEL_5 or
	  MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 or
	  WILL_FIRE_RL_edpFsm_action_l243c16 or
	  WILL_FIRE_RL_edpFsm_action_l244c16)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_1:
	  edpFsm_state_mkFSMstate$D_IN = 4'd0;
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_2:
	  edpFsm_state_mkFSMstate$D_IN = 4'd1;
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_3:
	  edpFsm_state_mkFSMstate$D_IN = 4'd2;
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_4:
	  edpFsm_state_mkFSMstate$D_IN = 4'd3;
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_5:
	  edpFsm_state_mkFSMstate$D_IN = 4'd4;
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_6:
	  edpFsm_state_mkFSMstate$D_IN = 4'd5;
      WILL_FIRE_RL_edpFsm_action_l243c16: edpFsm_state_mkFSMstate$D_IN = 4'd6;
      WILL_FIRE_RL_edpFsm_action_l244c16: edpFsm_state_mkFSMstate$D_IN = 4'd7;
      default: edpFsm_state_mkFSMstate$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign edpFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_edpFsm_idle_l235c3_1 ||
	     WILL_FIRE_RL_edpFsm_idle_l235c3 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_2 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_3 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_4 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_5 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 ||
	     WILL_FIRE_RL_edpFsm_action_l243c16 ||
	     WILL_FIRE_RL_edpFsm_action_l244c16 ;
  // register eeDat
  assign eeDat$D_IN = dcpRespF$D_OUT[41:10] ;
  assign eeDat$EN =
	     MUX_edpFsm_start_reg$write_1__SEL_2 &&
	     dcpRespF$D_OUT[44:43] != 2'd1 ;
  // register eeDmh
  assign eeDmh$D_IN =
	     { dcpRespF$D_OUT[9:2],
	       CASE_dcpRespFD_OUT_BITS_44_TO_43_IF_dcpRespF__ETC__q10,
	       16'h0 } ;
  assign eeDmh$EN = MUX_edpFsm_start_reg$write_1__SEL_2 ;
  // register eeMDst
  assign eeMDst$D_IN = eMAddrF$D_OUT ;
  assign eeMDst$EN = MUX_edpFsm_start_reg$write_1__SEL_2 ;
  // register eePli
  always@(dcpRespF$D_OUT)
  begin
    case (dcpRespF$D_OUT[44:43])
      2'd0: eePli$D_IN = 16'd10;
      2'd1: eePli$D_IN = 16'd6;
      default: eePli$D_IN = 16'd10;
    endcase
  end
  assign eePli$EN = MUX_edpFsm_start_reg$write_1__SEL_2 ;
  // register isWrtResp
  assign isWrtResp$D_IN = dcpRespF$D_OUT[44:43] == 2'd1 ;
  assign isWrtResp$EN = MUX_edpFsm_start_reg$write_1__SEL_2 ;
  // register lastResp
  assign lastResp$D_IN = MUX_dcpRespF$enq_1__VAL_2 ;
  assign lastResp$EN = WILL_FIRE_RL_cp_to_dcp_response && !doInFlight ;
  // register lastTag
  assign lastTag$D_IN =
	     { dcpReqF$D_OUT[78:77] != 2'd0,
	       (dcpReqF$D_OUT[78:77] == 2'd1) ?
		 dcpReqF$D_OUT[71:64] :
		 dcpReqF$D_OUT[39:32] } ;
  assign lastTag$EN =
	     WILL_FIRE_RL_dcp_to_cp_request &&
	     (dcpReqF$D_OUT[78:77] == 2'd0 && !dcpReqF$D_OUT[40] ||
	      dcpReqF$D_OUT[78:77] != 2'd0 &&
	      (dcpReqF$D_OUT[78:77] == 2'd1 &&
	       (!dcpReqF_first__19_BITS_71_TO_64_37_EQ_IF_lastT_ETC___d464 ||
		!lastTag[8]) &&
	       !dcpReqF$D_OUT[76] ||
	       dcpReqF$D_OUT[78:77] != 2'd1 &&
	       (!dcpReqF_first__19_BITS_39_TO_32_24_EQ_IF_lastT_ETC___d463 ||
		!lastTag[8]) &&
	       !dcpReqF$D_OUT[44])) ;
  // register ptr
  assign ptr$D_IN =
	     (x__h2347 == 4'd0) ? ((ptr == 4'd15) ? ptr : ptr + 4'd1) : 4'd0 ;
  assign ptr$EN = WILL_FIRE_RL_ecp_ingress ;
  // register uMAddr
  assign uMAddr$D_IN = macAddr_u ;
  assign uMAddr$EN = EN_macAddr ;
  // submodule cpReqF
  assign cpReqF$D_IN =
	     { dcpReqF$D_OUT[78:77] != 2'd1,
	       (dcpReqF$D_OUT[78:77] == 2'd1) ?
		 { dcpReqF$D_OUT[23:2],
		   dcpReqF$D_OUT[75:72],
		   dcpReqF$D_OUT[63:32] } :
		 { 24'hAAAAAA,
		   dcpReqF$D_OUT[39:32],
		   dcpReqF$D_OUT[23:2],
		   dcpReqF$D_OUT[43:40] } } ;
  assign cpReqF$ENQ =
	     WILL_FIRE_RL_dcp_to_cp_request && dcpReqF$D_OUT[78:77] != 2'd0 &&
	     dcpReqF_first__19_BITS_78_TO_77_20_EQ_1_23_AND_ETC___d196 ;
  assign cpReqF$DEQ = EN_client_request_get ;
  assign cpReqF$CLR = 1'b0 ;
  // submodule cpRespF
  assign cpRespF$D_IN = client_response_put ;
  assign cpRespF$ENQ = EN_client_response_put ;
  assign cpRespF$DEQ = WILL_FIRE_RL_cp_to_dcp_response ;
  assign cpRespF$CLR = 1'b0 ;
  // submodule dcpReqF
  always@(eDMH or eAddr or eData)
  begin
    case (eDMH[13:12])
      2'd0: dcpReqF$D_IN = { 38'h0AAAAAAAAA, eDMH[14], eDMH[7:0], eAddr };
      2'd1:
	  dcpReqF$D_IN = { eDMH[13:12], eDMH[14], eDMH[11:0], eData, eAddr };
      default: dcpReqF$D_IN = { 34'h2AAAAAAAA, eDMH[14], eDMH[11:0], eAddr };
    endcase
  end
  assign dcpReqF$ENQ =
	     eMAddrF_i_notFull__9_AND_IF_eDMH_0_BITS_13_TO__ETC___d100 &&
	     eDoReq &&
	     (eDMH[13:12] == 2'd0 || eDMH[13:12] == 2'd1 ||
	      eDMH[13:12] == 2'd2) ;
  assign dcpReqF$DEQ = WILL_FIRE_RL_dcp_to_cp_request ;
  assign dcpReqF$CLR = 1'b0 ;
  // submodule dcpRespF
  assign dcpRespF$D_IN =
	     MUX_dcpRespF$enq_1__SEL_1 ?
	       MUX_dcpRespF$enq_1__VAL_1 :
	       MUX_dcpRespF$enq_1__VAL_2 ;
  assign dcpRespF$ENQ =
	     WILL_FIRE_RL_dcp_to_cp_request &&
	     dcpReqF_first__19_BITS_78_TO_77_20_EQ_0_21_OR__ETC___d155 ||
	     WILL_FIRE_RL_cp_to_dcp_response ;
  assign dcpRespF$DEQ = MUX_edpFsm_start_reg$write_1__SEL_2 ;
  assign dcpRespF$CLR = 1'b0 ;
  // submodule eMAddrF
  assign eMAddrF$D_IN = eMAddr ;
  assign eMAddrF$ENQ =
	     eMAddrF_i_notFull__9_AND_IF_eDMH_0_BITS_13_TO__ETC___d100 &&
	     eDoReq ;
  assign eMAddrF$DEQ = MUX_edpFsm_start_reg$write_1__SEL_2 ;
  assign eMAddrF$CLR = 1'b0 ;
  // submodule ecpReqF
  assign ecpReqF$D_IN =
	     { CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q6,
	       server_request_put[37:30],
	       CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q7,
	       server_request_put[27:20],
	       CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q8,
	       server_request_put[17:10],
	       CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q9,
	       server_request_put[7:0] } ;
  assign ecpReqF$ENQ = EN_server_request_put ;
  assign ecpReqF$DEQ = WILL_FIRE_RL_ecp_ingress ;
  assign ecpReqF$CLR = 1'b0 ;
  // submodule ecpRespF
  always@(MUX_edpFsm_state_mkFSMstate$write_1__SEL_2 or
	  MUX_ecpRespF$enq_1__VAL_1 or
	  MUX_edpFsm_state_mkFSMstate$write_1__SEL_3 or
	  MUX_ecpRespF$enq_1__VAL_2 or
	  MUX_edpFsm_state_mkFSMstate$write_1__SEL_4 or
	  MUX_ecpRespF$enq_1__VAL_3 or
	  MUX_edpFsm_state_mkFSMstate$write_1__SEL_5 or
	  MUX_ecpRespF$enq_1__VAL_4 or
	  MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 or
	  MUX_ecpRespF$enq_1__VAL_5 or
	  WILL_FIRE_RL_edpFsm_action_l243c16 or
	  MUX_ecpRespF$enq_1__VAL_6 or
	  WILL_FIRE_RL_edpFsm_action_l244c16 or MUX_ecpRespF$enq_1__VAL_7)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_2:
	  ecpRespF$D_IN = MUX_ecpRespF$enq_1__VAL_1;
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_3:
	  ecpRespF$D_IN = MUX_ecpRespF$enq_1__VAL_2;
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_4:
	  ecpRespF$D_IN = MUX_ecpRespF$enq_1__VAL_3;
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_5:
	  ecpRespF$D_IN = MUX_ecpRespF$enq_1__VAL_4;
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_6:
	  ecpRespF$D_IN = MUX_ecpRespF$enq_1__VAL_5;
      WILL_FIRE_RL_edpFsm_action_l243c16:
	  ecpRespF$D_IN = MUX_ecpRespF$enq_1__VAL_6;
      WILL_FIRE_RL_edpFsm_action_l244c16:
	  ecpRespF$D_IN = MUX_ecpRespF$enq_1__VAL_7;
      default: ecpRespF$D_IN = 40'hAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign ecpRespF$ENQ =
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_2 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_3 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_4 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_5 ||
	     MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 ||
	     WILL_FIRE_RL_edpFsm_action_l243c16 ||
	     WILL_FIRE_RL_edpFsm_action_l244c16 ;
  assign ecpRespF$DEQ = EN_server_response_get ;
  assign ecpRespF$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_dcpReqF_first__19_BITS_78_TO_77_20_EQ_0_21__ETC___d152 =
	     (dcpReqF$D_OUT[78:77] == 2'd0) ?
	       dcpRespF$FULL_N :
	       (dcpReqF$D_OUT[78:77] == 2'd1 ||
		!dcpReqF_first__19_BITS_39_TO_32_24_EQ_IF_lastT_ETC___d463 ||
		!lastTag[8] ||
		dcpReqF$D_OUT[44] ||
		dcpRespF$FULL_N) &&
	       IF_dcpReqF_first__19_BITS_78_TO_77_20_EQ_1_23__ETC___d150 ;
  assign IF_dcpReqF_first__19_BITS_78_TO_77_20_EQ_1_23__ETC___d150 =
	     (dcpReqF$D_OUT[78:77] == 2'd1) ?
	       dcpRespF$FULL_N &&
	       (dcpReqF_first__19_BITS_71_TO_64_37_EQ_IF_lastT_ETC___d464 &&
		lastTag[8] &&
		!dcpReqF$D_OUT[76] ||
		cpReqF$FULL_N) :
	       dcpReqF_first__19_BITS_39_TO_32_24_EQ_IF_lastT_ETC___d463 &&
	       lastTag[8] &&
	       !dcpReqF$D_OUT[44] ||
	       cpReqF$FULL_N ;
  assign IF_dcpRespF_first__49_BIT_42_56_THEN_0x70_ELSE_ETC___d465 =
	     dcpRespF$D_OUT[42] ? 8'h70 : 8'h30 ;
  assign bedw__h2322 =
	     { x__h5688, ecpReqF$D_OUT[27:20], ecpReqF$D_OUT[37:30] } ;
  assign dcpReqF_first__19_BITS_39_TO_32_24_EQ_IF_lastT_ETC___d463 =
	     dcpReqF$D_OUT[39:32] == lastTag[7:0] ;
  assign dcpReqF_first__19_BITS_71_TO_64_37_EQ_IF_lastT_ETC___d464 =
	     dcpReqF$D_OUT[71:64] == lastTag[7:0] ;
  assign dcpReqF_first__19_BITS_78_TO_77_20_EQ_0_21_OR__ETC___d155 =
	     dcpReqF$D_OUT[78:77] == 2'd0 || dcpReqF$D_OUT[78:77] == 2'd1 ||
	     dcpReqF_first__19_BITS_39_TO_32_24_EQ_IF_lastT_ETC___d463 &&
	     lastTag[8] &&
	     !dcpReqF$D_OUT[44] ;
  assign dcpReqF_first__19_BITS_78_TO_77_20_EQ_1_23_AND_ETC___d196 =
	     dcpReqF$D_OUT[78:77] == 2'd1 &&
	     (!dcpReqF_first__19_BITS_71_TO_64_37_EQ_IF_lastT_ETC___d464 ||
	      !lastTag[8] ||
	      dcpReqF$D_OUT[76]) ||
	     dcpReqF$D_OUT[78:77] != 2'd1 &&
	     (!dcpReqF_first__19_BITS_39_TO_32_24_EQ_IF_lastT_ETC___d463 ||
	      !lastTag[8] ||
	      dcpReqF$D_OUT[44]) ;
  assign eMAddrF_i_notFull__9_AND_IF_eDMH_0_BITS_13_TO__ETC___d100 =
	     eMAddrF$FULL_N &&
	     CASE_eDMH_BITS_13_TO_12_NOT_eDMH_BITS_13_TO_12_ETC__q5 ;
  assign edpFsm_abort_whas__19_AND_edpFsm_abort_wget__2_ETC___d253 =
	     edpFsm_state_mkFSMstate == 4'd0 ||
	     edpFsm_state_mkFSMstate == 4'd5 ||
	     edpFsm_state_mkFSMstate == 4'd7 ;
  assign x__h2347 =
	     { ecpReqF$D_OUT[39:38] != 2'd0,
	       ecpReqF$D_OUT[29:28] != 2'd0,
	       ecpReqF$D_OUT[19:18] != 2'd0,
	       ecpReqF$D_OUT[9:8] != 2'd0 } ;
  assign x__h3828 = { bedw__h2322, 16'h0 } ;
  assign x__h5559 = { x__h5756, 32'h0 } ;
  assign x__h5600 = eDAddr | y__h5621 ;
  assign x__h5655 = eMAddr | y__h5666 ;
  assign x__h5688 = { ecpReqF$D_OUT[7:0], ecpReqF$D_OUT[17:10] } ;
  assign x__h5756 = { ecpReqF$D_OUT[27:20], ecpReqF$D_OUT[37:30] } ;
  assign y__h5621 = { 32'h0, x__h5688 } ;
  assign y__h5666 = { 16'd0, bedw__h2322 } ;
  always@(ecpRespF$D_OUT)
  begin
    case (ecpRespF$D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpRespFD_OUT_BITS_39_TO_38_3_0_ecpRespF_ETC__q1 =
	      ecpRespF$D_OUT[39:38];
      2'd3: CASE_ecpRespFD_OUT_BITS_39_TO_38_3_0_ecpRespF_ETC__q1 = 2'd3;
    endcase
  end
  always@(ecpRespF$D_OUT)
  begin
    case (ecpRespF$D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpRespFD_OUT_BITS_29_TO_28_3_0_ecpRespF_ETC__q2 =
	      ecpRespF$D_OUT[29:28];
      2'd3: CASE_ecpRespFD_OUT_BITS_29_TO_28_3_0_ecpRespF_ETC__q2 = 2'd3;
    endcase
  end
  always@(ecpRespF$D_OUT)
  begin
    case (ecpRespF$D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpRespFD_OUT_BITS_19_TO_18_3_0_ecpRespF_ETC__q3 =
	      ecpRespF$D_OUT[19:18];
      2'd3: CASE_ecpRespFD_OUT_BITS_19_TO_18_3_0_ecpRespF_ETC__q3 = 2'd3;
    endcase
  end
  always@(ecpRespF$D_OUT)
  begin
    case (ecpRespF$D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpRespFD_OUT_BITS_9_TO_8_3_0_ecpRespFD_ETC__q4 =
	      ecpRespF$D_OUT[9:8];
      2'd3: CASE_ecpRespFD_OUT_BITS_9_TO_8_3_0_ecpRespFD_ETC__q4 = 2'd3;
    endcase
  end
  always@(eDMH or dcpReqF$FULL_N)
  begin
    case (eDMH[13:12])
      2'd0, 2'd1:
	  CASE_eDMH_BITS_13_TO_12_NOT_eDMH_BITS_13_TO_12_ETC__q5 =
	      dcpReqF$FULL_N;
      default: CASE_eDMH_BITS_13_TO_12_NOT_eDMH_BITS_13_TO_12_ETC__q5 =
		   eDMH[13:12] != 2'd2 || dcpReqF$FULL_N;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q6 =
	      server_request_put[39:38];
      2'd3: CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q6 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q7 =
	      server_request_put[29:28];
      2'd3: CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q7 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q8 =
	      server_request_put[19:18];
      2'd3: CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q8 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q9 =
	      server_request_put[9:8];
      2'd3: CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q9 = 2'd3;
    endcase
  end
  always@(dcpRespF$D_OUT or
	  IF_dcpRespF_first__49_BIT_42_56_THEN_0x70_ELSE_ETC___d465)
  begin
    case (dcpRespF$D_OUT[44:43])
      2'd0:
	  CASE_dcpRespFD_OUT_BITS_44_TO_43_IF_dcpRespF__ETC__q10 =
	      IF_dcpRespF_first__49_BIT_42_56_THEN_0x70_ELSE_ETC___d465;
      2'd1:
	  CASE_dcpRespFD_OUT_BITS_44_TO_43_IF_dcpRespF__ETC__q10 =
	      dcpRespF$D_OUT[10] ? 8'h70 : 8'h30;
      default: CASE_dcpRespFD_OUT_BITS_44_TO_43_IF_dcpRespF__ETC__q10 =
		   IF_dcpRespF_first__49_BIT_42_56_THEN_0x70_ELSE_ETC___d465;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        doInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	eDoReq <= `BSV_ASSIGNMENT_DELAY 1'd0;
	ecpEgress <= `BSV_ASSIGNMENT_DELAY 1'd0;
	ecpIngress <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edpFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edpFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edpFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	edpFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edpFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 4'd0;
	lastTag <= `BSV_ASSIGNMENT_DELAY 9'd170;
	ptr <= `BSV_ASSIGNMENT_DELAY 4'd0;
      end
    else
      begin
        if (doInFlight$EN)
	  doInFlight <= `BSV_ASSIGNMENT_DELAY doInFlight$D_IN;
	if (eDoReq$EN) eDoReq <= `BSV_ASSIGNMENT_DELAY eDoReq$D_IN;
	if (ecpEgress$EN) ecpEgress <= `BSV_ASSIGNMENT_DELAY ecpEgress$D_IN;
	if (ecpIngress$EN)
	  ecpIngress <= `BSV_ASSIGNMENT_DELAY ecpIngress$D_IN;
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
	if (lastTag$EN) lastTag <= `BSV_ASSIGNMENT_DELAY lastTag$D_IN;
	if (ptr$EN) ptr <= `BSV_ASSIGNMENT_DELAY ptr$D_IN;
      end
    if (eAddr$EN) eAddr <= `BSV_ASSIGNMENT_DELAY eAddr$D_IN;
    if (eDAddr$EN) eDAddr <= `BSV_ASSIGNMENT_DELAY eDAddr$D_IN;
    if (eDMH$EN) eDMH <= `BSV_ASSIGNMENT_DELAY eDMH$D_IN;
    if (eData$EN) eData <= `BSV_ASSIGNMENT_DELAY eData$D_IN;
    if (eMAddr$EN) eMAddr <= `BSV_ASSIGNMENT_DELAY eMAddr$D_IN;
    if (ePli$EN) ePli <= `BSV_ASSIGNMENT_DELAY ePli$D_IN;
    if (eTyp$EN) eTyp <= `BSV_ASSIGNMENT_DELAY eTyp$D_IN;
    if (eeDat$EN) eeDat <= `BSV_ASSIGNMENT_DELAY eeDat$D_IN;
    if (eeDmh$EN) eeDmh <= `BSV_ASSIGNMENT_DELAY eeDmh$D_IN;
    if (eeMDst$EN) eeMDst <= `BSV_ASSIGNMENT_DELAY eeMDst$D_IN;
    if (eePli$EN) eePli <= `BSV_ASSIGNMENT_DELAY eePli$D_IN;
    if (isWrtResp$EN) isWrtResp <= `BSV_ASSIGNMENT_DELAY isWrtResp$D_IN;
    if (lastResp$EN) lastResp <= `BSV_ASSIGNMENT_DELAY lastResp$D_IN;
    if (uMAddr$EN) uMAddr <= `BSV_ASSIGNMENT_DELAY uMAddr$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    doInFlight = 1'h0;
    eAddr = 32'hAAAAAAAA;
    eDAddr = 48'hAAAAAAAAAAAA;
    eDMH = 32'hAAAAAAAA;
    eData = 32'hAAAAAAAA;
    eDoReq = 1'h0;
    eMAddr = 48'hAAAAAAAAAAAA;
    ePli = 16'hAAAA;
    eTyp = 16'hAAAA;
    ecpEgress = 1'h0;
    ecpIngress = 1'h0;
    edpFsm_start_reg = 1'h0;
    edpFsm_start_reg_1 = 1'h0;
    edpFsm_state_can_overlap = 1'h0;
    edpFsm_state_fired = 1'h0;
    edpFsm_state_mkFSMstate = 4'hA;
    eeDat = 32'hAAAAAAAA;
    eeDmh = 32'hAAAAAAAA;
    eeMDst = 48'hAAAAAAAAAAAA;
    eePli = 16'hAAAA;
    isWrtResp = 1'h0;
    lastResp = 45'h0AAAAAAAAAAA;
    lastTag = 9'h0AA;
    ptr = 4'hA;
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
      if (MUX_edpFsm_state_mkFSMstate$write_1__SEL_3 &&
	  (MUX_edpFsm_state_mkFSMstate$write_1__SEL_4 ||
	   MUX_edpFsm_state_mkFSMstate$write_1__SEL_5 ||
	   MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 ||
	   WILL_FIRE_RL_edpFsm_action_l243c16 ||
	   WILL_FIRE_RL_edpFsm_action_l244c16))
	$display("Error: \"bsv/eth/EDCP.bsv\", line 237, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l237c14] and\n  [RL_edpFsm_action_l238c14, RL_edpFsm_action_l239c14,\n  RL_edpFsm_action_l241c16, RL_edpFsm_action_l243c16,\n  RL_edpFsm_action_l244c16] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (MUX_edpFsm_state_mkFSMstate$write_1__SEL_4 &&
	  (MUX_edpFsm_state_mkFSMstate$write_1__SEL_5 ||
	   MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 ||
	   WILL_FIRE_RL_edpFsm_action_l243c16 ||
	   WILL_FIRE_RL_edpFsm_action_l244c16))
	$display("Error: \"bsv/eth/EDCP.bsv\", line 238, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l238c14] and\n  [RL_edpFsm_action_l239c14, RL_edpFsm_action_l241c16,\n  RL_edpFsm_action_l243c16, RL_edpFsm_action_l244c16] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (MUX_edpFsm_state_mkFSMstate$write_1__SEL_5 &&
	  (MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 ||
	   WILL_FIRE_RL_edpFsm_action_l243c16 ||
	   WILL_FIRE_RL_edpFsm_action_l244c16))
	$display("Error: \"bsv/eth/EDCP.bsv\", line 239, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l239c14] and\n  [RL_edpFsm_action_l241c16, RL_edpFsm_action_l243c16,\n  RL_edpFsm_action_l244c16] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 &&
	  (WILL_FIRE_RL_edpFsm_action_l243c16 ||
	   WILL_FIRE_RL_edpFsm_action_l244c16))
	$display("Error: \"bsv/eth/EDCP.bsv\", line 241, column 16: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l241c16] and\n  [RL_edpFsm_action_l243c16, RL_edpFsm_action_l244c16] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l243c16 &&
	  WILL_FIRE_RL_edpFsm_action_l244c16)
	$display("Error: \"bsv/eth/EDCP.bsv\", line 243, column 16: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l243c16] and\n  [RL_edpFsm_action_l244c16] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (MUX_edpFsm_state_mkFSMstate$write_1__SEL_2 &&
	  (MUX_edpFsm_state_mkFSMstate$write_1__SEL_3 ||
	   MUX_edpFsm_state_mkFSMstate$write_1__SEL_4 ||
	   MUX_edpFsm_state_mkFSMstate$write_1__SEL_5 ||
	   MUX_edpFsm_state_mkFSMstate$write_1__SEL_6 ||
	   WILL_FIRE_RL_edpFsm_action_l243c16 ||
	   WILL_FIRE_RL_edpFsm_action_l244c16))
	$display("Error: \"bsv/eth/EDCP.bsv\", line 236, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l236c14] and\n  [RL_edpFsm_action_l237c14, RL_edpFsm_action_l238c14,\n  RL_edpFsm_action_l239c14, RL_edpFsm_action_l241c16,\n  RL_edpFsm_action_l243c16, RL_edpFsm_action_l244c16] ) fired in the same\n  clock cycle.\n");
  end
  // synopsys translate_on
endmodule