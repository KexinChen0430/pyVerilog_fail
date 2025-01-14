module outputs
  wire [58 : 0] client_request_get;
  wire [7 : 0] host_response_get;
  wire RDY_client_request_get,
       RDY_client_response_put,
       RDY_host_request_put,
       RDY_host_response_get;
  // inlined wires
  wire eDoReq_1$wget,
       eDoReq_1$whas,
       edpFsm_abort$wget,
       edpFsm_abort$whas,
       edpFsm_start_reg_2$wget,
       edpFsm_start_reg_2$whas,
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
  reg [31 : 0] eAddr$D_IN;
  wire eAddr$EN;
  // register eDMH
  reg [31 : 0] eDMH;
  reg [31 : 0] eDMH$D_IN;
  wire eDMH$EN;
  // register eData
  reg [31 : 0] eData;
  reg [31 : 0] eData$D_IN;
  wire eData$EN;
  // register eDoReq
  reg eDoReq;
  wire eDoReq$D_IN, eDoReq$EN;
  // register ePli
  reg [15 : 0] ePli;
  wire [15 : 0] ePli$D_IN;
  wire ePli$EN;
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
  // ports of submodule simReqF
  wire [7 : 0] simReqF$D_IN, simReqF$D_OUT;
  wire simReqF$CLR, simReqF$DEQ, simReqF$EMPTY_N, simReqF$ENQ, simReqF$FULL_N;
  // ports of submodule simRespF
  reg [7 : 0] simRespF$D_IN;
  wire [7 : 0] simRespF$D_OUT;
  wire simRespF$CLR,
       simRespF$DEQ,
       simRespF$EMPTY_N,
       simRespF$ENQ,
       simRespF$FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_cp_to_dcp_response,
       WILL_FIRE_RL_dcp_to_cp_request,
       WILL_FIRE_RL_edpFsm_action_l220c14,
       WILL_FIRE_RL_edpFsm_action_l221c14,
       WILL_FIRE_RL_edpFsm_action_l222c14,
       WILL_FIRE_RL_edpFsm_action_l223c14,
       WILL_FIRE_RL_edpFsm_action_l224c14,
       WILL_FIRE_RL_edpFsm_action_l225c14,
       WILL_FIRE_RL_edpFsm_action_l227c16,
       WILL_FIRE_RL_edpFsm_action_l228c16,
       WILL_FIRE_RL_edpFsm_action_l229c16,
       WILL_FIRE_RL_edpFsm_action_l230c16,
       WILL_FIRE_RL_edpFsm_fsm_start,
       WILL_FIRE_RL_edpFsm_idle_l219c3,
       WILL_FIRE_RL_edpFsm_idle_l219c3_1,
       WILL_FIRE_RL_rx_sim_dcp,
       WILL_FIRE_RL_sim_egress,
       WILL_FIRE_RL_sim_ingress;
  // inputs to muxes for submodule ports
  reg [44 : 0] MUX_dcpRespF$enq_1__VAL_1;
  wire [44 : 0] MUX_dcpRespF$enq_1__VAL_2;
  wire MUX_dcpRespF$enq_1__SEL_1,
       MUX_doInFlight$write_1__SEL_1,
       MUX_edpFsm_state_mkFSMstate$write_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h26988,
	       v__h27142,
	       v__h27335,
	       v__h3777,
	       v__h3791,
	       v__h3805,
	       v__h4532,
	       v__h5089;
  reg [7 : 0] CASE_dcpRespFD_OUT_BITS_44_TO_43_0_IF_dcpResp_ETC__q4;
  reg [1 : 0] CASE_lastResp_BITS_44_TO_43_0_lastResp_BITS_44_ETC__q3;
  reg CASE_dcpReqFD_OUT_BITS_78_TO_77_0_dcpRespFFU_ETC__q2,
      CASE_eDMH_BITS_13_TO_12_0_dcpReqFFULL_N_0b1_d_ETC__q1;
  wire [31 : 0] x__h1896,
		x__h1913,
		x__h1958,
		x__h2003,
		x__h2062,
		x__h2107,
		x__h2151,
		x__h2210,
		x__h2255,
		x__h2299;
  wire [15 : 0] x__h1866, y__h1877;
  wire [7 : 0] IF_dcpRespF_first__35_BIT_42_42_THEN_0x70_ELSE_ETC___d343;
  wire IF_NOT_dcpReqF_first__33_BITS_39_TO_32_51_EQ_I_ETC___d158,
       NOT_dcpReqF_first__33_BITS_78_TO_77_34_EQ_0_35_ETC___d221,
       dcpReqF_first__33_BITS_39_TO_32_51_EQ_IF_lastT_ETC___d152,
       dcpReqF_first__33_BITS_71_TO_64_38_EQ_IF_lastT_ETC___d143,
       dcpReqF_first__33_BITS_78_TO_77_34_EQ_0_35_OR__ETC___d166,
       dcpReqF_first__33_BITS_78_TO_77_34_EQ_1_37_AND_ETC___d207,
       edpFsm_abort_whas__35_AND_edpFsm_abort_wget__3_ETC___d324,
       edpFsm_abort_whas__35_AND_edpFsm_abort_wget__3_ETC___d332;
  // action method host_request_put
  assign RDY_host_request_put = simReqF$FULL_N ;
  // actionvalue method host_response_get
  assign host_response_get = simRespF$D_OUT ;
  assign RDY_host_response_get = simRespF$EMPTY_N ;
  // actionvalue method client_request_get
  assign client_request_get = cpReqF$D_OUT ;
  assign RDY_client_request_get = cpReqF$EMPTY_N ;
  // action method client_response_put
  assign RDY_client_response_put = cpRespF$FULL_N ;
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
  // submodule simReqF
  FIFO2 #(.width(32'd8), .guarded(32'd1)) simReqF(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(simReqF$D_IN),
						  .ENQ(simReqF$ENQ),
						  .DEQ(simReqF$DEQ),
						  .CLR(simReqF$CLR),
						  .D_OUT(simReqF$D_OUT),
						  .FULL_N(simReqF$FULL_N),
						  .EMPTY_N(simReqF$EMPTY_N));
  // submodule simRespF
  FIFO2 #(.width(32'd8), .guarded(32'd1)) simRespF(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(simRespF$D_IN),
						   .ENQ(simRespF$ENQ),
						   .DEQ(simRespF$DEQ),
						   .CLR(simRespF$CLR),
						   .D_OUT(simRespF$D_OUT),
						   .FULL_N(simRespF$FULL_N),
						   .EMPTY_N(simRespF$EMPTY_N));
  // rule RL_sim_ingress
  assign WILL_FIRE_RL_sim_ingress = simReqF$EMPTY_N && !eDoReq ;
  // rule RL_rx_sim_dcp
  assign WILL_FIRE_RL_rx_sim_dcp =
	     CASE_eDMH_BITS_13_TO_12_0_dcpReqFFULL_N_0b1_d_ETC__q1 && eDoReq ;
  // rule RL_dcp_to_cp_request
  assign WILL_FIRE_RL_dcp_to_cp_request =
	     dcpReqF$EMPTY_N &&
	     CASE_dcpReqFD_OUT_BITS_78_TO_77_0_dcpRespFFU_ETC__q2 ;
  // rule RL_cp_to_dcp_response
  assign WILL_FIRE_RL_cp_to_dcp_response =
	     dcpRespF$FULL_N && cpRespF$EMPTY_N &&
	     !WILL_FIRE_RL_dcp_to_cp_request ;
  // rule RL_edpFsm_action_l221c14
  assign WILL_FIRE_RL_edpFsm_action_l221c14 =
	     simRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd1 ;
  // rule RL_edpFsm_action_l222c14
  assign WILL_FIRE_RL_edpFsm_action_l222c14 =
	     simRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd2 ;
  // rule RL_edpFsm_action_l223c14
  assign WILL_FIRE_RL_edpFsm_action_l223c14 =
	     simRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd3 ;
  // rule RL_edpFsm_action_l224c14
  assign WILL_FIRE_RL_edpFsm_action_l224c14 =
	     simRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd4 ;
  // rule RL_edpFsm_action_l225c14
  assign WILL_FIRE_RL_edpFsm_action_l225c14 =
	     simRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd5 ;
  // rule RL_edpFsm_action_l227c16
  assign WILL_FIRE_RL_edpFsm_action_l227c16 =
	     simRespF$FULL_N && !isWrtResp &&
	     edpFsm_state_mkFSMstate == 4'd6 ;
  // rule RL_edpFsm_action_l228c16
  assign WILL_FIRE_RL_edpFsm_action_l228c16 =
	     simRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd7 ;
  // rule RL_edpFsm_action_l229c16
  assign WILL_FIRE_RL_edpFsm_action_l229c16 =
	     simRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd8 ;
  // rule RL_edpFsm_action_l230c16
  assign WILL_FIRE_RL_edpFsm_action_l230c16 =
	     simRespF$FULL_N && edpFsm_state_mkFSMstate == 4'd9 ;
  // rule RL_edpFsm_fsm_start
  assign WILL_FIRE_RL_edpFsm_fsm_start =
	     (edpFsm_abort_whas__35_AND_edpFsm_abort_wget__3_ETC___d324 ||
	      edpFsm_state_mkFSMstate == 4'd10) &&
	     (!edpFsm_start_reg_1 || edpFsm_state_fired) &&
	     edpFsm_start_reg ;
  // rule RL_edpFsm_action_l220c14
  assign WILL_FIRE_RL_edpFsm_action_l220c14 =
	     simRespF$FULL_N &&
	     (edpFsm_start_wire$whas && edpFsm_state_mkFSMstate == 4'd0 ||
	      isWrtResp && edpFsm_start_wire$whas &&
	      edpFsm_state_mkFSMstate == 4'd6 ||
	      edpFsm_start_wire$whas && edpFsm_state_mkFSMstate == 4'd10) ;
  // rule RL_edpFsm_idle_l219c3
  assign WILL_FIRE_RL_edpFsm_idle_l219c3 =
	     isWrtResp && !edpFsm_start_wire$whas &&
	     edpFsm_state_mkFSMstate == 4'd6 ;
  // rule RL_sim_egress
  assign WILL_FIRE_RL_sim_egress =
	     edpFsm_abort_whas__35_AND_edpFsm_abort_wget__3_ETC___d332 &&
	     dcpRespF$EMPTY_N ;
  // rule RL_edpFsm_idle_l219c3_1
  assign WILL_FIRE_RL_edpFsm_idle_l219c3_1 =
	     !edpFsm_start_wire$whas && edpFsm_state_mkFSMstate == 4'd10 ;
  // inputs to muxes for submodule ports
  assign MUX_dcpRespF$enq_1__SEL_1 =
	     WILL_FIRE_RL_dcp_to_cp_request &&
	     dcpReqF_first__33_BITS_78_TO_77_34_EQ_0_35_OR__ETC___d166 ;
  assign MUX_doInFlight$write_1__SEL_1 =
	     WILL_FIRE_RL_dcp_to_cp_request &&
	     (dcpReqF$D_OUT[78:77] == 2'd0 && dcpReqF$D_OUT[40] ||
	      dcpReqF$D_OUT[78:77] != 2'd0 &&
	      (dcpReqF$D_OUT[78:77] == 2'd1 && dcpReqF$D_OUT[76] ||
	       dcpReqF$D_OUT[78:77] != 2'd1 && dcpReqF$D_OUT[44])) ;
  assign MUX_edpFsm_state_mkFSMstate$write_1__SEL_1 =
	     WILL_FIRE_RL_edpFsm_idle_l219c3_1 ||
	     WILL_FIRE_RL_edpFsm_idle_l219c3 ;
  always@(dcpReqF$D_OUT or
	  CASE_lastResp_BITS_44_TO_43_0_lastResp_BITS_44_ETC__q3 or lastResp)
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
		   { CASE_lastResp_BITS_44_TO_43_0_lastResp_BITS_44_ETC__q3,
		     lastResp[42:0] };
    endcase
  end
  assign MUX_dcpRespF$enq_1__VAL_2 =
	     { 2'd2,
	       doInFlight,
	       cpRespF$D_OUT[31:0],
	       cpRespF$D_OUT[39:32],
	       2'd0 } ;
  // inlined wires
  assign eDoReq_1$wget = ptr == ((eDMH[13:12] == 2'b01) ? 4'd13 : 4'd9) ;
  assign eDoReq_1$whas = WILL_FIRE_RL_sim_ingress ;
  assign edpFsm_start_wire$wget = 1'd1 ;
  assign edpFsm_start_wire$whas =
	     WILL_FIRE_RL_edpFsm_fsm_start ||
	     edpFsm_start_reg_1 && !edpFsm_state_fired ;
  assign edpFsm_start_reg_2$wget = 1'd1 ;
  assign edpFsm_start_reg_2$whas = edpFsm_start_wire$whas ;
  assign edpFsm_abort$wget = 1'b0 ;
  assign edpFsm_abort$whas = 1'b0 ;
  assign edpFsm_state_fired_1$wget = 1'd1 ;
  assign edpFsm_state_fired_1$whas = edpFsm_state_set_pw$whas ;
  assign edpFsm_state_set_pw$whas =
	     WILL_FIRE_RL_edpFsm_idle_l219c3_1 ||
	     WILL_FIRE_RL_edpFsm_idle_l219c3 ||
	     WILL_FIRE_RL_edpFsm_action_l230c16 ||
	     WILL_FIRE_RL_edpFsm_action_l229c16 ||
	     WILL_FIRE_RL_edpFsm_action_l228c16 ||
	     WILL_FIRE_RL_edpFsm_action_l227c16 ||
	     WILL_FIRE_RL_edpFsm_action_l225c14 ||
	     WILL_FIRE_RL_edpFsm_action_l224c14 ||
	     WILL_FIRE_RL_edpFsm_action_l223c14 ||
	     WILL_FIRE_RL_edpFsm_action_l222c14 ||
	     WILL_FIRE_RL_edpFsm_action_l221c14 ||
	     WILL_FIRE_RL_edpFsm_action_l220c14 ;
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
  always@(ptr or x__h2151 or x__h1896 or x__h2062 or x__h2107)
  begin
    case (ptr)
      4'd6: eAddr$D_IN = x__h1896;
      4'd7: eAddr$D_IN = x__h2062;
      4'd8: eAddr$D_IN = x__h2107;
      default: eAddr$D_IN = x__h2151;
    endcase
  end
  assign eAddr$EN =
	     WILL_FIRE_RL_sim_ingress &&
	     (ptr == 4'd6 || ptr == 4'd7 || ptr == 4'd8 || ptr == 4'd9) ;
  // register eDMH
  always@(ptr or x__h2003 or x__h1896 or x__h1913 or x__h1958)
  begin
    case (ptr)
      4'd2: eDMH$D_IN = x__h1896;
      4'd3: eDMH$D_IN = x__h1913;
      4'd4: eDMH$D_IN = x__h1958;
      default: eDMH$D_IN = x__h2003;
    endcase
  end
  assign eDMH$EN =
	     WILL_FIRE_RL_sim_ingress &&
	     (ptr == 4'd2 || ptr == 4'd3 || ptr == 4'd4 || ptr == 4'd5) ;
  // register eData
  always@(ptr or x__h2299 or x__h1896 or x__h2210 or x__h2255)
  begin
    case (ptr)
      4'd10: eData$D_IN = x__h1896;
      4'd11: eData$D_IN = x__h2210;
      4'd12: eData$D_IN = x__h2255;
      default: eData$D_IN = x__h2299;
    endcase
  end
  assign eData$EN =
	     WILL_FIRE_RL_sim_ingress &&
	     (ptr == 4'd10 || ptr == 4'd11 || ptr == 4'd12 || ptr == 4'd13) ;
  // register eDoReq
  assign eDoReq$D_IN = WILL_FIRE_RL_sim_ingress && eDoReq_1$wget ;
  assign eDoReq$EN = 1'd1 ;
  // register ePli
  assign ePli$D_IN = (ptr == 4'd0) ? 16'd0 : x__h1866 ;
  assign ePli$EN = WILL_FIRE_RL_sim_ingress && (ptr == 4'd0 || ptr == 4'd1) ;
  // register edpFsm_start_reg
  assign edpFsm_start_reg$D_IN = !WILL_FIRE_RL_edpFsm_fsm_start ;
  assign edpFsm_start_reg$EN =
	     WILL_FIRE_RL_edpFsm_fsm_start || WILL_FIRE_RL_sim_egress ;
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
	  WILL_FIRE_RL_edpFsm_action_l220c14 or
	  WILL_FIRE_RL_edpFsm_action_l221c14 or
	  WILL_FIRE_RL_edpFsm_action_l222c14 or
	  WILL_FIRE_RL_edpFsm_action_l223c14 or
	  WILL_FIRE_RL_edpFsm_action_l224c14 or
	  WILL_FIRE_RL_edpFsm_action_l225c14 or
	  WILL_FIRE_RL_edpFsm_action_l227c16 or
	  WILL_FIRE_RL_edpFsm_action_l228c16 or
	  WILL_FIRE_RL_edpFsm_action_l229c16 or
	  WILL_FIRE_RL_edpFsm_action_l230c16)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_edpFsm_state_mkFSMstate$write_1__SEL_1:
	  edpFsm_state_mkFSMstate$D_IN = 4'd0;
      WILL_FIRE_RL_edpFsm_action_l220c14: edpFsm_state_mkFSMstate$D_IN = 4'd1;
      WILL_FIRE_RL_edpFsm_action_l221c14: edpFsm_state_mkFSMstate$D_IN = 4'd2;
      WILL_FIRE_RL_edpFsm_action_l222c14: edpFsm_state_mkFSMstate$D_IN = 4'd3;
      WILL_FIRE_RL_edpFsm_action_l223c14: edpFsm_state_mkFSMstate$D_IN = 4'd4;
      WILL_FIRE_RL_edpFsm_action_l224c14: edpFsm_state_mkFSMstate$D_IN = 4'd5;
      WILL_FIRE_RL_edpFsm_action_l225c14: edpFsm_state_mkFSMstate$D_IN = 4'd6;
      WILL_FIRE_RL_edpFsm_action_l227c16: edpFsm_state_mkFSMstate$D_IN = 4'd7;
      WILL_FIRE_RL_edpFsm_action_l228c16: edpFsm_state_mkFSMstate$D_IN = 4'd8;
      WILL_FIRE_RL_edpFsm_action_l229c16: edpFsm_state_mkFSMstate$D_IN = 4'd9;
      WILL_FIRE_RL_edpFsm_action_l230c16:
	  edpFsm_state_mkFSMstate$D_IN = 4'd10;
      default: edpFsm_state_mkFSMstate$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign edpFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_edpFsm_idle_l219c3_1 ||
	     WILL_FIRE_RL_edpFsm_idle_l219c3 ||
	     WILL_FIRE_RL_edpFsm_action_l220c14 ||
	     WILL_FIRE_RL_edpFsm_action_l221c14 ||
	     WILL_FIRE_RL_edpFsm_action_l222c14 ||
	     WILL_FIRE_RL_edpFsm_action_l223c14 ||
	     WILL_FIRE_RL_edpFsm_action_l224c14 ||
	     WILL_FIRE_RL_edpFsm_action_l225c14 ||
	     WILL_FIRE_RL_edpFsm_action_l227c16 ||
	     WILL_FIRE_RL_edpFsm_action_l228c16 ||
	     WILL_FIRE_RL_edpFsm_action_l229c16 ||
	     WILL_FIRE_RL_edpFsm_action_l230c16 ;
  // register eeDat
  assign eeDat$D_IN = dcpRespF$D_OUT[41:10] ;
  assign eeDat$EN = WILL_FIRE_RL_sim_egress && dcpRespF$D_OUT[44:43] != 2'd1 ;
  // register eeDmh
  assign eeDmh$D_IN =
	     { dcpRespF$D_OUT[9:2],
	       CASE_dcpRespFD_OUT_BITS_44_TO_43_0_IF_dcpResp_ETC__q4,
	       16'h0 } ;
  assign eeDmh$EN = WILL_FIRE_RL_sim_egress ;
  // register eePli
  always@(dcpRespF$D_OUT)
  begin
    case (dcpRespF$D_OUT[44:43])
      2'd0: eePli$D_IN = 16'd10;
      2'd1: eePli$D_IN = 16'd6;
      default: eePli$D_IN = 16'd10;
    endcase
  end
  assign eePli$EN = WILL_FIRE_RL_sim_egress ;
  // register isWrtResp
  assign isWrtResp$D_IN = dcpRespF$D_OUT[44:43] == 2'd1 ;
  assign isWrtResp$EN = WILL_FIRE_RL_sim_egress ;
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
	       (!dcpReqF_first__33_BITS_71_TO_64_38_EQ_IF_lastT_ETC___d143 ||
		!lastTag[8]) &&
	       !dcpReqF$D_OUT[76] ||
	       dcpReqF$D_OUT[78:77] != 2'd1 &&
	       (!dcpReqF_first__33_BITS_39_TO_32_51_EQ_IF_lastT_ETC___d152 ||
		!lastTag[8]) &&
	       !dcpReqF$D_OUT[44])) ;
  // register ptr
  assign ptr$D_IN =
	     (ptr == ((eDMH[13:12] == 2'b01) ? 4'd13 : 4'd9)) ?
	       4'd0 :
	       ((ptr == 4'd15) ? ptr : ptr + 4'd1) ;
  assign ptr$EN = WILL_FIRE_RL_sim_ingress ;
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
	     dcpReqF_first__33_BITS_78_TO_77_34_EQ_1_37_AND_ETC___d207 ;
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
      2'b01:
	  dcpReqF$D_IN = { eDMH[13:12], eDMH[14], eDMH[11:0], eData, eAddr };
      default: dcpReqF$D_IN = { 34'h2AAAAAAAA, eDMH[14], eDMH[11:0], eAddr };
    endcase
  end
  assign dcpReqF$ENQ =
	     WILL_FIRE_RL_rx_sim_dcp &&
	     (eDMH[13:12] == 2'd0 || eDMH[13:12] == 2'b01 ||
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
	     dcpReqF_first__33_BITS_78_TO_77_34_EQ_0_35_OR__ETC___d166 ||
	     WILL_FIRE_RL_cp_to_dcp_response ;
  assign dcpRespF$DEQ = WILL_FIRE_RL_sim_egress ;
  assign dcpRespF$CLR = 1'b0 ;
  // submodule simReqF
  assign simReqF$D_IN = host_request_put ;
  assign simReqF$ENQ = EN_host_request_put ;
  assign simReqF$DEQ = WILL_FIRE_RL_sim_ingress ;
  assign simReqF$CLR = 1'b0 ;
  // submodule simRespF
  always@(WILL_FIRE_RL_edpFsm_action_l220c14 or
	  eePli or
	  WILL_FIRE_RL_edpFsm_action_l221c14 or
	  WILL_FIRE_RL_edpFsm_action_l222c14 or
	  eeDmh or
	  WILL_FIRE_RL_edpFsm_action_l223c14 or
	  WILL_FIRE_RL_edpFsm_action_l224c14 or
	  WILL_FIRE_RL_edpFsm_action_l225c14 or
	  WILL_FIRE_RL_edpFsm_action_l227c16 or
	  eeDat or
	  WILL_FIRE_RL_edpFsm_action_l228c16 or
	  WILL_FIRE_RL_edpFsm_action_l229c16 or
	  WILL_FIRE_RL_edpFsm_action_l230c16)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_edpFsm_action_l220c14: simRespF$D_IN = eePli[15:8];
      WILL_FIRE_RL_edpFsm_action_l221c14: simRespF$D_IN = eePli[7:0];
      WILL_FIRE_RL_edpFsm_action_l222c14: simRespF$D_IN = eeDmh[7:0];
      WILL_FIRE_RL_edpFsm_action_l223c14: simRespF$D_IN = eeDmh[15:8];
      WILL_FIRE_RL_edpFsm_action_l224c14: simRespF$D_IN = eeDmh[23:16];
      WILL_FIRE_RL_edpFsm_action_l225c14: simRespF$D_IN = eeDmh[31:24];
      WILL_FIRE_RL_edpFsm_action_l227c16: simRespF$D_IN = eeDat[31:24];
      WILL_FIRE_RL_edpFsm_action_l228c16: simRespF$D_IN = eeDat[23:16];
      WILL_FIRE_RL_edpFsm_action_l229c16: simRespF$D_IN = eeDat[15:8];
      WILL_FIRE_RL_edpFsm_action_l230c16: simRespF$D_IN = eeDat[7:0];
      default: simRespF$D_IN = 8'b10101010 /* unspecified value */ ;
    endcase
  end
  assign simRespF$ENQ =
	     WILL_FIRE_RL_edpFsm_action_l220c14 ||
	     WILL_FIRE_RL_edpFsm_action_l221c14 ||
	     WILL_FIRE_RL_edpFsm_action_l222c14 ||
	     WILL_FIRE_RL_edpFsm_action_l223c14 ||
	     WILL_FIRE_RL_edpFsm_action_l224c14 ||
	     WILL_FIRE_RL_edpFsm_action_l225c14 ||
	     WILL_FIRE_RL_edpFsm_action_l227c16 ||
	     WILL_FIRE_RL_edpFsm_action_l228c16 ||
	     WILL_FIRE_RL_edpFsm_action_l229c16 ||
	     WILL_FIRE_RL_edpFsm_action_l230c16 ;
  assign simRespF$DEQ = EN_host_response_get ;
  assign simRespF$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_NOT_dcpReqF_first__33_BITS_39_TO_32_51_EQ_I_ETC___d158 =
	     (!dcpReqF_first__33_BITS_39_TO_32_51_EQ_IF_lastT_ETC___d152 ||
	      !lastTag[8] ||
	      dcpReqF$D_OUT[44]) ?
	       cpReqF$FULL_N :
	       dcpRespF$FULL_N ;
  assign IF_dcpRespF_first__35_BIT_42_42_THEN_0x70_ELSE_ETC___d343 =
	     dcpRespF$D_OUT[42] ? 8'h70 : 8'h30 ;
  assign NOT_dcpReqF_first__33_BITS_78_TO_77_34_EQ_0_35_ETC___d221 =
	     dcpReqF$D_OUT[78:77] != 2'd0 && dcpReqF$D_OUT[78:77] != 2'd1 &&
	     dcpReqF_first__33_BITS_39_TO_32_51_EQ_IF_lastT_ETC___d152 &&
	     lastTag[8] &&
	     !dcpReqF$D_OUT[44] ;
  assign dcpReqF_first__33_BITS_39_TO_32_51_EQ_IF_lastT_ETC___d152 =
	     dcpReqF$D_OUT[39:32] == lastTag[7:0] ;
  assign dcpReqF_first__33_BITS_71_TO_64_38_EQ_IF_lastT_ETC___d143 =
	     dcpReqF$D_OUT[71:64] == lastTag[7:0] ;
  assign dcpReqF_first__33_BITS_78_TO_77_34_EQ_0_35_OR__ETC___d166 =
	     dcpReqF$D_OUT[78:77] == 2'd0 || dcpReqF$D_OUT[78:77] == 2'd1 ||
	     dcpReqF_first__33_BITS_39_TO_32_51_EQ_IF_lastT_ETC___d152 &&
	     lastTag[8] &&
	     !dcpReqF$D_OUT[44] ;
  assign dcpReqF_first__33_BITS_78_TO_77_34_EQ_1_37_AND_ETC___d207 =
	     dcpReqF$D_OUT[78:77] == 2'd1 &&
	     (!dcpReqF_first__33_BITS_71_TO_64_38_EQ_IF_lastT_ETC___d143 ||
	      !lastTag[8] ||
	      dcpReqF$D_OUT[76]) ||
	     dcpReqF$D_OUT[78:77] != 2'd1 &&
	     (!dcpReqF_first__33_BITS_39_TO_32_51_EQ_IF_lastT_ETC___d152 ||
	      !lastTag[8] ||
	      dcpReqF$D_OUT[44]) ;
  assign edpFsm_abort_whas__35_AND_edpFsm_abort_wget__3_ETC___d324 =
	     edpFsm_state_mkFSMstate == 4'd0 ||
	     isWrtResp && edpFsm_state_mkFSMstate == 4'd6 ;
  assign edpFsm_abort_whas__35_AND_edpFsm_abort_wget__3_ETC___d332 =
	     (edpFsm_abort_whas__35_AND_edpFsm_abort_wget__3_ETC___d324 ||
	      edpFsm_state_mkFSMstate == 4'd10) &&
	     (!edpFsm_start_reg_1 || edpFsm_state_fired) &&
	     !edpFsm_start_reg ;
  assign x__h1866 = ePli | y__h1877 ;
  assign x__h1896 = { simReqF$D_OUT, 24'h0 } ;
  assign x__h1913 = { eDMH[31:24], simReqF$D_OUT, 16'h0 } ;
  assign x__h1958 = { eDMH[31:16], simReqF$D_OUT, 8'h0 } ;
  assign x__h2003 = { eDMH[31:8], simReqF$D_OUT } ;
  assign x__h2062 = { eAddr[31:24], simReqF$D_OUT, 16'h0 } ;
  assign x__h2107 = { eAddr[31:16], simReqF$D_OUT, 8'h0 } ;
  assign x__h2151 = { eAddr[31:8], simReqF$D_OUT } ;
  assign x__h2210 = { eData[31:24], simReqF$D_OUT, 16'h0 } ;
  assign x__h2255 = { eData[31:16], simReqF$D_OUT, 8'h0 } ;
  assign x__h2299 = { eData[31:8], simReqF$D_OUT } ;
  assign y__h1877 = { 8'd0, simReqF$D_OUT } ;
  always@(eDMH or dcpReqF$FULL_N)
  begin
    case (eDMH[13:12])
      2'd0, 2'b01:
	  CASE_eDMH_BITS_13_TO_12_0_dcpReqFFULL_N_0b1_d_ETC__q1 =
	      dcpReqF$FULL_N;
      default: CASE_eDMH_BITS_13_TO_12_0_dcpReqFFULL_N_0b1_d_ETC__q1 =
		   eDMH[13:12] != 2'd2 || dcpReqF$FULL_N;
    endcase
  end
  always@(dcpReqF$D_OUT or
	  IF_NOT_dcpReqF_first__33_BITS_39_TO_32_51_EQ_I_ETC___d158 or
	  dcpRespF$FULL_N or
	  dcpReqF_first__33_BITS_71_TO_64_38_EQ_IF_lastT_ETC___d143 or
	  lastTag or cpReqF$FULL_N)
  begin
    case (dcpReqF$D_OUT[78:77])
      2'd0:
	  CASE_dcpReqFD_OUT_BITS_78_TO_77_0_dcpRespFFU_ETC__q2 =
	      dcpRespF$FULL_N;
      2'd1:
	  CASE_dcpReqFD_OUT_BITS_78_TO_77_0_dcpRespFFU_ETC__q2 =
	      dcpRespF$FULL_N &&
	      (dcpReqF_first__33_BITS_71_TO_64_38_EQ_IF_lastT_ETC___d143 &&
	       lastTag[8] &&
	       !dcpReqF$D_OUT[76] ||
	       cpReqF$FULL_N);
      default: CASE_dcpReqFD_OUT_BITS_78_TO_77_0_dcpRespFFU_ETC__q2 =
		   IF_NOT_dcpReqF_first__33_BITS_39_TO_32_51_EQ_I_ETC___d158;
    endcase
  end
  always@(lastResp)
  begin
    case (lastResp[44:43])
      2'd0, 2'd1:
	  CASE_lastResp_BITS_44_TO_43_0_lastResp_BITS_44_ETC__q3 =
	      lastResp[44:43];
      default: CASE_lastResp_BITS_44_TO_43_0_lastResp_BITS_44_ETC__q3 = 2'd2;
    endcase
  end
  always@(dcpRespF$D_OUT or
	  IF_dcpRespF_first__35_BIT_42_42_THEN_0x70_ELSE_ETC___d343)
  begin
    case (dcpRespF$D_OUT[44:43])
      2'd0:
	  CASE_dcpRespFD_OUT_BITS_44_TO_43_0_IF_dcpResp_ETC__q4 =
	      IF_dcpRespF_first__35_BIT_42_42_THEN_0x70_ELSE_ETC___d343;
      2'd1:
	  CASE_dcpRespFD_OUT_BITS_44_TO_43_0_IF_dcpResp_ETC__q4 =
	      dcpRespF$D_OUT[10] ? 8'h70 : 8'h30;
      default: CASE_dcpRespFD_OUT_BITS_44_TO_43_0_IF_dcpResp_ETC__q4 =
		   IF_dcpRespF_first__35_BIT_42_42_THEN_0x70_ELSE_ETC___d343;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        doInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	eDoReq <= `BSV_ASSIGNMENT_DELAY 1'd0;
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
    if (eDMH$EN) eDMH <= `BSV_ASSIGNMENT_DELAY eDMH$D_IN;
    if (eData$EN) eData <= `BSV_ASSIGNMENT_DELAY eData$D_IN;
    if (ePli$EN) ePli <= `BSV_ASSIGNMENT_DELAY ePli$D_IN;
    if (eeDat$EN) eeDat <= `BSV_ASSIGNMENT_DELAY eeDat$D_IN;
    if (eeDmh$EN) eeDmh <= `BSV_ASSIGNMENT_DELAY eeDmh$D_IN;
    if (eePli$EN) eePli <= `BSV_ASSIGNMENT_DELAY eePli$D_IN;
    if (isWrtResp$EN) isWrtResp <= `BSV_ASSIGNMENT_DELAY isWrtResp$D_IN;
    if (lastResp$EN) lastResp <= `BSV_ASSIGNMENT_DELAY lastResp$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    doInFlight = 1'h0;
    eAddr = 32'hAAAAAAAA;
    eDMH = 32'hAAAAAAAA;
    eData = 32'hAAAAAAAA;
    eDoReq = 1'h0;
    ePli = 16'hAAAA;
    edpFsm_start_reg = 1'h0;
    edpFsm_start_reg_1 = 1'h0;
    edpFsm_state_can_overlap = 1'h0;
    edpFsm_state_fired = 1'h0;
    edpFsm_state_mkFSMstate = 4'hA;
    eeDat = 32'hAAAAAAAA;
    eeDmh = 32'hAAAAAAAA;
    eePli = 16'hAAAA;
    isWrtResp = 1'h0;
    lastResp = 45'h0AAAAAAAAAAA;
    lastTag = 9'h0AA;
    ptr = 4'hA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rx_sim_dcp && eDMH[13:12] == 2'd0)
	begin
	  v__h3777 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rx_sim_dcp && eDMH[13:12] == 2'd0)
	$display("[%0d]: rx_sim_dcp REQUEST: NOP ", v__h3777);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rx_sim_dcp && eDMH[13:12] == 2'b01)
	begin
	  v__h3791 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rx_sim_dcp && eDMH[13:12] == 2'b01)
	$display("[%0d]: rx_sim_dcp REQUEST: WRITE Addr:0x%0x Data:0x%0x",
		 v__h3791,
		 eAddr,
		 eData);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rx_sim_dcp && eDMH[13:12] == 2'd2)
	begin
	  v__h3805 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rx_sim_dcp && eDMH[13:12] == 2'd2)
	$display("[%0d]: rx_sim_dcp REQUEST: READ  Addr:0x%0x ",
		 v__h3805,
		 eAddr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_dcp_to_cp_request && dcpReqF$D_OUT[78:77] == 2'd1 &&
	  dcpReqF_first__33_BITS_71_TO_64_38_EQ_IF_lastT_ETC___d143 &&
	  lastTag[8] &&
	  !dcpReqF$D_OUT[76])
	begin
	  v__h4532 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_dcp_to_cp_request && dcpReqF$D_OUT[78:77] == 2'd1 &&
	  dcpReqF_first__33_BITS_71_TO_64_38_EQ_IF_lastT_ETC___d143 &&
	  lastTag[8] &&
	  !dcpReqF$D_OUT[76])
	$display("[%0d]: dcp_to_cp_request ***TAG MATCH IN DCP WRITE*** (Not Forwarding Write Request to OCCP)",
		 v__h4532);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_dcp_to_cp_request &&
	  NOT_dcpReqF_first__33_BITS_78_TO_77_34_EQ_0_35_ETC___d221)
	begin
	  v__h5089 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_dcp_to_cp_request &&
	  NOT_dcpReqF_first__33_BITS_78_TO_77_34_EQ_0_35_ETC___d221)
	$display("[%0d]: dcp_to_cp_request ***TAG MATCH IN DCP READ*** (Returning Previous Response)",
		 v__h5089);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l221c14 &&
	  (WILL_FIRE_RL_edpFsm_action_l222c14 ||
	   WILL_FIRE_RL_edpFsm_action_l223c14 ||
	   WILL_FIRE_RL_edpFsm_action_l224c14 ||
	   WILL_FIRE_RL_edpFsm_action_l225c14 ||
	   WILL_FIRE_RL_edpFsm_action_l227c16 ||
	   WILL_FIRE_RL_edpFsm_action_l228c16 ||
	   WILL_FIRE_RL_edpFsm_action_l229c16 ||
	   WILL_FIRE_RL_edpFsm_action_l230c16))
	$display("Error: \"bsv/eth/SimDCP.bsv\", line 221, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l221c14] and\n  [RL_edpFsm_action_l222c14, RL_edpFsm_action_l223c14,\n  RL_edpFsm_action_l224c14, RL_edpFsm_action_l225c14,\n  RL_edpFsm_action_l227c16, RL_edpFsm_action_l228c16,\n  RL_edpFsm_action_l229c16, RL_edpFsm_action_l230c16] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l222c14 &&
	  (WILL_FIRE_RL_edpFsm_action_l223c14 ||
	   WILL_FIRE_RL_edpFsm_action_l224c14 ||
	   WILL_FIRE_RL_edpFsm_action_l225c14 ||
	   WILL_FIRE_RL_edpFsm_action_l227c16 ||
	   WILL_FIRE_RL_edpFsm_action_l228c16 ||
	   WILL_FIRE_RL_edpFsm_action_l229c16 ||
	   WILL_FIRE_RL_edpFsm_action_l230c16))
	$display("Error: \"bsv/eth/SimDCP.bsv\", line 222, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l222c14] and\n  [RL_edpFsm_action_l223c14, RL_edpFsm_action_l224c14,\n  RL_edpFsm_action_l225c14, RL_edpFsm_action_l227c16,\n  RL_edpFsm_action_l228c16, RL_edpFsm_action_l229c16,\n  RL_edpFsm_action_l230c16] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l223c14 &&
	  (WILL_FIRE_RL_edpFsm_action_l224c14 ||
	   WILL_FIRE_RL_edpFsm_action_l225c14 ||
	   WILL_FIRE_RL_edpFsm_action_l227c16 ||
	   WILL_FIRE_RL_edpFsm_action_l228c16 ||
	   WILL_FIRE_RL_edpFsm_action_l229c16 ||
	   WILL_FIRE_RL_edpFsm_action_l230c16))
	$display("Error: \"bsv/eth/SimDCP.bsv\", line 223, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l223c14] and\n  [RL_edpFsm_action_l224c14, RL_edpFsm_action_l225c14,\n  RL_edpFsm_action_l227c16, RL_edpFsm_action_l228c16,\n  RL_edpFsm_action_l229c16, RL_edpFsm_action_l230c16] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l224c14 &&
	  (WILL_FIRE_RL_edpFsm_action_l225c14 ||
	   WILL_FIRE_RL_edpFsm_action_l227c16 ||
	   WILL_FIRE_RL_edpFsm_action_l228c16 ||
	   WILL_FIRE_RL_edpFsm_action_l229c16 ||
	   WILL_FIRE_RL_edpFsm_action_l230c16))
	$display("Error: \"bsv/eth/SimDCP.bsv\", line 224, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l224c14] and\n  [RL_edpFsm_action_l225c14, RL_edpFsm_action_l227c16,\n  RL_edpFsm_action_l228c16, RL_edpFsm_action_l229c16,\n  RL_edpFsm_action_l230c16] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l225c14 &&
	  (WILL_FIRE_RL_edpFsm_action_l227c16 ||
	   WILL_FIRE_RL_edpFsm_action_l228c16 ||
	   WILL_FIRE_RL_edpFsm_action_l229c16 ||
	   WILL_FIRE_RL_edpFsm_action_l230c16))
	$display("Error: \"bsv/eth/SimDCP.bsv\", line 225, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l225c14] and\n  [RL_edpFsm_action_l227c16, RL_edpFsm_action_l228c16,\n  RL_edpFsm_action_l229c16, RL_edpFsm_action_l230c16] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l228c16 &&
	  (WILL_FIRE_RL_edpFsm_action_l229c16 ||
	   WILL_FIRE_RL_edpFsm_action_l230c16))
	$display("Error: \"bsv/eth/SimDCP.bsv\", line 228, column 16: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l228c16] and\n  [RL_edpFsm_action_l229c16, RL_edpFsm_action_l230c16] ) fired in the same\n  clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l227c16 &&
	  (WILL_FIRE_RL_edpFsm_action_l228c16 ||
	   WILL_FIRE_RL_edpFsm_action_l229c16 ||
	   WILL_FIRE_RL_edpFsm_action_l230c16))
	$display("Error: \"bsv/eth/SimDCP.bsv\", line 227, column 16: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l227c16] and\n  [RL_edpFsm_action_l228c16, RL_edpFsm_action_l229c16,\n  RL_edpFsm_action_l230c16] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l229c16 &&
	  WILL_FIRE_RL_edpFsm_action_l230c16)
	$display("Error: \"bsv/eth/SimDCP.bsv\", line 229, column 16: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l229c16] and\n  [RL_edpFsm_action_l230c16] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edpFsm_action_l220c14 &&
	  (WILL_FIRE_RL_edpFsm_action_l221c14 ||
	   WILL_FIRE_RL_edpFsm_action_l222c14 ||
	   WILL_FIRE_RL_edpFsm_action_l223c14 ||
	   WILL_FIRE_RL_edpFsm_action_l224c14 ||
	   WILL_FIRE_RL_edpFsm_action_l225c14 ||
	   WILL_FIRE_RL_edpFsm_action_l227c16 ||
	   WILL_FIRE_RL_edpFsm_action_l228c16 ||
	   WILL_FIRE_RL_edpFsm_action_l229c16 ||
	   WILL_FIRE_RL_edpFsm_action_l230c16))
	$display("Error: \"bsv/eth/SimDCP.bsv\", line 220, column 14: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edpFsm_action_l220c14] and\n  [RL_edpFsm_action_l221c14, RL_edpFsm_action_l222c14,\n  RL_edpFsm_action_l223c14, RL_edpFsm_action_l224c14,\n  RL_edpFsm_action_l225c14, RL_edpFsm_action_l227c16,\n  RL_edpFsm_action_l228c16, RL_edpFsm_action_l229c16,\n  RL_edpFsm_action_l230c16] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_sim_egress && dcpRespF$D_OUT[44:43] == 2'd0)
	begin
	  v__h26988 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_sim_egress && dcpRespF$D_OUT[44:43] == 2'd0)
	$display("[%0d]: sim_egress NOP_RESPONSE", v__h26988);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_sim_egress && dcpRespF$D_OUT[44:43] == 2'd1)
	begin
	  v__h27142 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_sim_egress && dcpRespF$D_OUT[44:43] == 2'd1)
	$display("[%0d]: sim_egress WRITE_RESPONSE", v__h27142);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_sim_egress && dcpRespF$D_OUT[44:43] != 2'd0 &&
	  dcpRespF$D_OUT[44:43] != 2'd1)
	begin
	  v__h27335 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_sim_egress && dcpRespF$D_OUT[44:43] != 2'd0 &&
	  dcpRespF$D_OUT[44:43] != 2'd1)
	$display("[%0d]: sim_egress READ_RESPONSE Data:0x%0x ",
		 v__h27335,
		 dcpRespF$D_OUT[41:10]);
  end
  // synopsys translate_on
endmodule