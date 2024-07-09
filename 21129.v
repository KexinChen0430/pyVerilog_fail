module outputs
  wire [152 : 0] server_response_get;
  wire [58 : 0] client_request_get;
  wire RDY_client_request_get,
       RDY_client_response_put,
       RDY_server_request_put,
       RDY_server_response_get;
  // register cmpActive
  reg cmpActive;
  wire cmpActive_D_IN, cmpActive_EN;
  // register cmpDWRemain
  reg [9 : 0] cmpDWRemain;
  wire [9 : 0] cmpDWRemain_D_IN;
  wire cmpDWRemain_EN;
  // register rdp
  reg [1 : 0] rdp;
  wire [1 : 0] rdp_D_IN;
  wire rdp_EN;
  // register rdv
  reg [127 : 0] rdv;
  wire [127 : 0] rdv_D_IN;
  wire rdv_EN;
  // register rss
  reg [1 : 0] rss;
  wire [1 : 0] rss_D_IN;
  wire rss_EN;
  // register tlpActive
  reg tlpActive;
  wire tlpActive_D_IN, tlpActive_EN;
  // register tlpDW
  reg [31 : 0] tlpDW;
  wire [31 : 0] tlpDW_D_IN;
  wire tlpDW_EN;
  // register tlpDWAddr
  reg [29 : 0] tlpDWAddr;
  wire [29 : 0] tlpDWAddr_D_IN;
  wire tlpDWAddr_EN;
  // register tlpDWp
  reg [1 : 0] tlpDWp;
  wire [1 : 0] tlpDWp_D_IN;
  wire tlpDWp_EN;
  // register tlpFirst
  reg tlpFirst;
  wire tlpFirst_D_IN, tlpFirst_EN;
  // register tlpReq
  reg [63 : 0] tlpReq;
  wire [63 : 0] tlpReq_D_IN;
  wire tlpReq_EN;
  // register tlpUnroll
  reg [9 : 0] tlpUnroll;
  wire [9 : 0] tlpUnroll_D_IN;
  wire tlpUnroll_EN;
  // ports of submodule cmpF
  wire [55 : 0] cmpF_D_IN, cmpF_D_OUT;
  wire cmpF_CLR, cmpF_DEQ, cmpF_EMPTY_N, cmpF_ENQ, cmpF_FULL_N;
  // ports of submodule cpReqF
  wire [58 : 0] cpReqF_D_IN, cpReqF_D_OUT;
  wire cpReqF_CLR, cpReqF_DEQ, cpReqF_EMPTY_N, cpReqF_ENQ, cpReqF_FULL_N;
  // ports of submodule cpRespF
  wire [39 : 0] cpRespF_D_IN, cpRespF_D_OUT;
  wire cpRespF_CLR, cpRespF_DEQ, cpRespF_EMPTY_N, cpRespF_ENQ, cpRespF_FULL_N;
  // ports of submodule inF
  wire [152 : 0] inF_D_IN, inF_D_OUT;
  wire inF_CLR, inF_DEQ, inF_EMPTY_N, inF_ENQ, inF_FULL_N;
  // ports of submodule outF
  wire [152 : 0] outF_D_IN, outF_D_OUT;
  wire outF_CLR, outF_DEQ, outF_EMPTY_N, outF_ENQ, outF_FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_tlpFirstComplWord,
       WILL_FIRE_RL_tlpFirstRcv,
       WILL_FIRE_RL_tlpNextComplWord,
       WILL_FIRE_RL_tlpReqGen,
       WILL_FIRE_RL_tlpStageNextWord;
  // inputs to muxes for submodule ports
  wire [152 : 0] MUX_outF_enq_1__VAL_1, MUX_outF_enq_1__VAL_2;
  wire [29 : 0] MUX_tlpDWAddr_write_1__VAL_2;
  wire [9 : 0] MUX_cmpDWRemain_write_1__VAL_1,
	       MUX_cmpDWRemain_write_1__VAL_2,
	       MUX_tlpUnroll_write_1__VAL_2;
  wire [1 : 0] MUX_rdp_write_1__VAL_1,
	       MUX_rss_write_1__VAL_2,
	       MUX_tlpDWp_write_1__VAL_1;
  wire MUX_cmpActive_write_1__SEL_1,
       MUX_tlpActive_write_1__SEL_1,
       MUX_tlpDWAddr_write_1__SEL_1,
       MUX_tlpDWp_write_1__SEL_1;
  // remaining internal signals
  reg [31 : 0] v__h2549;
  reg [15 : 0] lastRema__h7245;
  reg [1 : 0] lowAddr10__h2074, x__h2304, x__h2327;
  wire [127 : 0] pkt__h4230, pw_data__h7278;
  wire [57 : 0] IF_tlpReq_3_BIT_62_4_THEN_tlpDWAddr_8_BITS_21__ETC___d113;
  wire [31 : 0] IF_tlpReq_3_BIT_62_4_AND_NOT_tlpFirst_6_4_5_TH_ETC___d102,
		wreq_data__h3050;
  wire [15 : 0] pw_be__h7277;
  wire [11 : 0] byteCount__h2076, x__h2295, x__h2297, y__h2296, y__h2298;
  wire [6 : 0] lowAddr__h2075;
  wire [3 : 0] _theResult_____2__h2491;
  wire [2 : 0] x__h7701;
  wire cpReqF_i_notFull__2_AND_NOT_tlpReq_3_BIT_62_4__ETC___d82;
  // action method server_request_put
  assign RDY_server_request_put = inF_FULL_N ;
  // actionvalue method server_response_get
  assign server_response_get = outF_D_OUT ;
  assign RDY_server_response_get = outF_EMPTY_N ;
  // actionvalue method client_request_get
  assign client_request_get = cpReqF_D_OUT ;
  assign RDY_client_request_get = cpReqF_EMPTY_N ;
  // action method client_response_put
  assign RDY_client_response_put = cpRespF_FULL_N ;
  // submodule cmpF
  FIFO2 #(.width(32'd56), .guarded(32'd1)) cmpF(.RST(RST_N),
						.CLK(CLK),
						.D_IN(cmpF_D_IN),
						.ENQ(cmpF_ENQ),
						.DEQ(cmpF_DEQ),
						.CLR(cmpF_CLR),
						.D_OUT(cmpF_D_OUT),
						.FULL_N(cmpF_FULL_N),
						.EMPTY_N(cmpF_EMPTY_N));
  // submodule cpReqF
  FIFO2 #(.width(32'd59), .guarded(32'd1)) cpReqF(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(cpReqF_D_IN),
						  .ENQ(cpReqF_ENQ),
						  .DEQ(cpReqF_DEQ),
						  .CLR(cpReqF_CLR),
						  .D_OUT(cpReqF_D_OUT),
						  .FULL_N(cpReqF_FULL_N),
						  .EMPTY_N(cpReqF_EMPTY_N));
  // submodule cpRespF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) cpRespF(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(cpRespF_D_IN),
						   .ENQ(cpRespF_ENQ),
						   .DEQ(cpRespF_DEQ),
						   .CLR(cpRespF_CLR),
						   .D_OUT(cpRespF_D_OUT),
						   .FULL_N(cpRespF_FULL_N),
						   .EMPTY_N(cpRespF_EMPTY_N));
  // submodule inF
  FIFO2 #(.width(32'd153), .guarded(32'd1)) inF(.RST(RST_N),
						.CLK(CLK),
						.D_IN(inF_D_IN),
						.ENQ(inF_ENQ),
						.DEQ(inF_DEQ),
						.CLR(inF_CLR),
						.D_OUT(inF_D_OUT),
						.FULL_N(inF_FULL_N),
						.EMPTY_N(inF_EMPTY_N));
  // submodule outF
  FIFO2 #(.width(32'd153), .guarded(32'd1)) outF(.RST(RST_N),
						 .CLK(CLK),
						 .D_IN(outF_D_IN),
						 .ENQ(outF_ENQ),
						 .DEQ(outF_DEQ),
						 .CLR(outF_CLR),
						 .D_OUT(outF_D_OUT),
						 .FULL_N(outF_FULL_N),
						 .EMPTY_N(outF_EMPTY_N));
  // rule RL_tlpFirstRcv
  assign WILL_FIRE_RL_tlpFirstRcv =
	     inF_EMPTY_N &&
	     (!inF_D_OUT[152] || inF_D_OUT[110] || inF_D_OUT[125] ||
	      inF_D_OUT[124:120] != 5'b0 ||
	      inF_D_OUT[126] ||
	      cmpF_FULL_N) &&
	     !tlpActive ;
  // rule RL_tlpReqGen
  assign WILL_FIRE_RL_tlpReqGen =
	     cpReqF_i_notFull__2_AND_NOT_tlpReq_3_BIT_62_4__ETC___d82 &&
	     tlpActive ;
  // rule RL_tlpFirstComplWord
  assign WILL_FIRE_RL_tlpFirstComplWord =
	     cmpF_EMPTY_N && cpRespF_EMPTY_N && outF_FULL_N && !cmpActive ;
  // rule RL_tlpStageNextWord
  assign WILL_FIRE_RL_tlpStageNextWord =
	     cpRespF_EMPTY_N && cmpActive && cmpDWRemain != 10'd0 &&
	     !WILL_FIRE_RL_tlpNextComplWord ;
  // rule RL_tlpNextComplWord
  assign WILL_FIRE_RL_tlpNextComplWord =
	     outF_FULL_N && cmpActive && rss != 2'd0 ;
  // inputs to muxes for submodule ports
  assign MUX_cmpActive_write_1__SEL_1 =
	     WILL_FIRE_RL_tlpNextComplWord && rss == 2'd2 ;
  assign MUX_tlpActive_write_1__SEL_1 =
	     WILL_FIRE_RL_tlpReqGen && tlpUnroll == 10'd1 ;
  assign MUX_tlpDWAddr_write_1__SEL_1 =
	     WILL_FIRE_RL_tlpFirstRcv && inF_D_OUT[152] && !inF_D_OUT[110] &&
	     !inF_D_OUT[125] &&
	     inF_D_OUT[124:120] == 5'b0 ;
  assign MUX_tlpDWp_write_1__SEL_1 =
	     WILL_FIRE_RL_tlpReqGen && tlpReq[62] && !tlpFirst ;
  assign MUX_cmpDWRemain_write_1__VAL_1 = cmpF_D_OUT[21:12] - 10'd1 ;
  assign MUX_cmpDWRemain_write_1__VAL_2 = cmpDWRemain - 10'd1 ;
  assign MUX_outF_enq_1__VAL_1 =
	     { 1'd1, cmpF_D_OUT[21:12] == 10'd1, 23'h2AFFFF, pkt__h4230 } ;
  assign MUX_outF_enq_1__VAL_2 =
	     { 1'd0, rss == 2'd2, 7'h2A, pw_be__h7277, pw_data__h7278 } ;
  assign MUX_rdp_write_1__VAL_1 = rdp + 2'd1 ;
  assign MUX_rss_write_1__VAL_2 = (cmpDWRemain == 10'd1) ? 2'd2 : 2'd1 ;
  assign MUX_tlpDWAddr_write_1__VAL_2 = tlpDWAddr + 30'd1 ;
  assign MUX_tlpDWp_write_1__VAL_1 = tlpDWp - 2'd1 ;
  assign MUX_tlpUnroll_write_1__VAL_2 = tlpUnroll - 10'd1 ;
  // register cmpActive
  assign cmpActive_D_IN = !MUX_cmpActive_write_1__SEL_1 ;
  assign cmpActive_EN =
	     WILL_FIRE_RL_tlpNextComplWord && rss == 2'd2 ||
	     WILL_FIRE_RL_tlpFirstComplWord && cmpF_D_OUT[21:12] != 10'd1 ;
  // register cmpDWRemain
  assign cmpDWRemain_D_IN =
	     WILL_FIRE_RL_tlpFirstComplWord ?
	       MUX_cmpDWRemain_write_1__VAL_1 :
	       MUX_cmpDWRemain_write_1__VAL_2 ;
  assign cmpDWRemain_EN =
	     WILL_FIRE_RL_tlpFirstComplWord || WILL_FIRE_RL_tlpStageNextWord ;
  // register rdp
  assign rdp_D_IN =
	     WILL_FIRE_RL_tlpStageNextWord ? MUX_rdp_write_1__VAL_1 : 2'd0 ;
  assign rdp_EN =
	     WILL_FIRE_RL_tlpStageNextWord || WILL_FIRE_RL_tlpNextComplWord ;
  // register rdv
  assign rdv_D_IN =
	     { rdv[95:0],
	       cpRespF_D_OUT[7:0],
	       cpRespF_D_OUT[15:8],
	       cpRespF_D_OUT[23:16],
	       cpRespF_D_OUT[31:24] } ;
  assign rdv_EN = WILL_FIRE_RL_tlpStageNextWord ;
  // register rss
  assign rss_D_IN =
	     MUX_cmpActive_write_1__SEL_1 ? 2'd0 : MUX_rss_write_1__VAL_2 ;
  assign rss_EN =
	     WILL_FIRE_RL_tlpNextComplWord && rss == 2'd2 ||
	     WILL_FIRE_RL_tlpStageNextWord &&
	     (cmpDWRemain == 10'd1 || rdp == 2'd3) ;
  // register tlpActive
  assign tlpActive_D_IN = !MUX_tlpActive_write_1__SEL_1 ;
  assign tlpActive_EN =
	     WILL_FIRE_RL_tlpReqGen && tlpUnroll == 10'd1 ||
	     WILL_FIRE_RL_tlpFirstRcv ;
  // register tlpDW
  assign tlpDW_D_IN = inF_D_OUT[31:0] ;
  assign tlpDW_EN = MUX_tlpDWAddr_write_1__SEL_1 ;
  // register tlpDWAddr
  assign tlpDWAddr_D_IN =
	     MUX_tlpDWAddr_write_1__SEL_1 ?
	       inF_D_OUT[63:34] :
	       MUX_tlpDWAddr_write_1__VAL_2 ;
  assign tlpDWAddr_EN =
	     WILL_FIRE_RL_tlpFirstRcv && inF_D_OUT[152] && !inF_D_OUT[110] &&
	     !inF_D_OUT[125] &&
	     inF_D_OUT[124:120] == 5'b0 ||
	     WILL_FIRE_RL_tlpReqGen ;
  // register tlpDWp
  assign tlpDWp_D_IN =
	     MUX_tlpDWp_write_1__SEL_1 ? MUX_tlpDWp_write_1__VAL_1 : 2'd3 ;
  assign tlpDWp_EN =
	     WILL_FIRE_RL_tlpReqGen && tlpReq[62] && !tlpFirst ||
	     WILL_FIRE_RL_tlpFirstRcv && inF_D_OUT[152] && !inF_D_OUT[110] &&
	     !inF_D_OUT[125] &&
	     inF_D_OUT[124:120] == 5'b0 ;
  // register tlpFirst
  assign tlpFirst_D_IN = MUX_tlpDWAddr_write_1__SEL_1 ;
  assign tlpFirst_EN =
	     WILL_FIRE_RL_tlpFirstRcv && inF_D_OUT[152] && !inF_D_OUT[110] &&
	     !inF_D_OUT[125] &&
	     inF_D_OUT[124:120] == 5'b0 ||
	     WILL_FIRE_RL_tlpReqGen ;
  // register tlpReq
  assign tlpReq_D_IN =
	     { 1'b0,
	       inF_D_OUT[126:120],
	       1'b0,
	       inF_D_OUT[118:116],
	       4'b0,
	       inF_D_OUT[111:108],
	       2'b0,
	       inF_D_OUT[105:64] } ;
  assign tlpReq_EN = MUX_tlpDWAddr_write_1__SEL_1 ;
  // register tlpUnroll
  assign tlpUnroll_D_IN =
	     MUX_tlpDWAddr_write_1__SEL_1 ?
	       inF_D_OUT[105:96] :
	       MUX_tlpUnroll_write_1__VAL_2 ;
  assign tlpUnroll_EN =
	     WILL_FIRE_RL_tlpFirstRcv && inF_D_OUT[152] && !inF_D_OUT[110] &&
	     !inF_D_OUT[125] &&
	     inF_D_OUT[124:120] == 5'b0 ||
	     WILL_FIRE_RL_tlpReqGen ;
  // submodule cmpF
  assign cmpF_D_IN =
	     { inF_D_OUT[95:80],
	       inF_D_OUT[118:116],
	       inF_D_OUT[79:72],
	       lowAddr__h2075,
	       inF_D_OUT[105:96],
	       byteCount__h2076 } ;
  assign cmpF_ENQ =
	     WILL_FIRE_RL_tlpFirstRcv && inF_D_OUT[152] && !inF_D_OUT[110] &&
	     !inF_D_OUT[125] &&
	     inF_D_OUT[124:120] == 5'b0 &&
	     !inF_D_OUT[126] ;
  assign cmpF_DEQ = WILL_FIRE_RL_tlpFirstComplWord ;
  assign cmpF_CLR = 1'b0 ;
  // submodule cpReqF
  assign cpReqF_D_IN =
	     { !tlpReq[62],
	       IF_tlpReq_3_BIT_62_4_THEN_tlpDWAddr_8_BITS_21__ETC___d113 } ;
  assign cpReqF_ENQ =
	     cpReqF_i_notFull__2_AND_NOT_tlpReq_3_BIT_62_4__ETC___d82 &&
	     tlpActive ;
  assign cpReqF_DEQ = EN_client_request_get ;
  assign cpReqF_CLR = 1'b0 ;
  // submodule cpRespF
  assign cpRespF_D_IN = client_response_put ;
  assign cpRespF_ENQ = EN_client_response_put ;
  assign cpRespF_DEQ =
	     WILL_FIRE_RL_tlpFirstComplWord || WILL_FIRE_RL_tlpStageNextWord ;
  assign cpRespF_CLR = 1'b0 ;
  // submodule inF
  assign inF_D_IN = server_request_put ;
  assign inF_ENQ = EN_server_request_put ;
  assign inF_DEQ =
	     WILL_FIRE_RL_tlpReqGen && tlpReq[62] && !tlpFirst ||
	     WILL_FIRE_RL_tlpFirstRcv ;
  assign inF_CLR = 1'b0 ;
  // submodule outF
  assign outF_D_IN =
	     WILL_FIRE_RL_tlpFirstComplWord ?
	       MUX_outF_enq_1__VAL_1 :
	       MUX_outF_enq_1__VAL_2 ;
  assign outF_ENQ =
	     WILL_FIRE_RL_tlpFirstComplWord || WILL_FIRE_RL_tlpNextComplWord ;
  assign outF_DEQ = EN_server_response_get ;
  assign outF_CLR = 1'b0 ;
  // remaining internal signals
  assign IF_tlpReq_3_BIT_62_4_AND_NOT_tlpFirst_6_4_5_TH_ETC___d102 =
	     (tlpReq[62] && !tlpFirst) ? v__h2549 : tlpDW ;
  assign IF_tlpReq_3_BIT_62_4_THEN_tlpDWAddr_8_BITS_21__ETC___d113 =
	     tlpReq[62] ?
	       { tlpDWAddr[21:0],
		 _theResult_____2__h2491,
		 wreq_data__h3050 } :
	       { 24'hAAAAAA,
		 tlpReq[15:8],
		 tlpDWAddr[21:0],
		 _theResult_____2__h2491 } ;
  assign _theResult_____2__h2491 =
	     tlpFirst ?
	       tlpReq[3:0] :
	       ((tlpUnroll == 10'd1) ? tlpReq[7:4] : 4'hF) ;
  assign byteCount__h2076 = x__h2295 - y__h2296 ;
  assign cpReqF_i_notFull__2_AND_NOT_tlpReq_3_BIT_62_4__ETC___d82 =
	     cpReqF_FULL_N && (!tlpReq[62] || tlpFirst || inF_EMPTY_N) ;
  assign lowAddr__h2075 = { inF_D_OUT[38:34], lowAddr10__h2074 } ;
  assign pkt__h4230 =
	     { 9'd148,
	       cmpF_D_OUT[39:37],
	       10'd0,
	       cmpF_D_OUT[21:12],
	       pciDevice,
	       4'd0,
	       cmpF_D_OUT[11:0],
	       cmpF_D_OUT[55:40],
	       cmpF_D_OUT[36:29],
	       1'b0,
	       cmpF_D_OUT[28:22],
	       cpRespF_D_OUT[7:0],
	       cpRespF_D_OUT[15:8],
	       cpRespF_D_OUT[23:16],
	       cpRespF_D_OUT[31:24] } ;
  assign pw_be__h7277 = (rss == 2'd2) ? lastRema__h7245 : 16'd65535 ;
  assign pw_data__h7278 =
	     x__h7701[1] ?
	       (x__h7701[0] ?
		  { rdv[31:0], rdv[127:32] } :
		  { rdv[63:0], rdv[127:64] }) :
	       (x__h7701[0] ? { rdv[95:0], rdv[127:96] } : rdv) ;
  assign wreq_data__h3050 =
	     { IF_tlpReq_3_BIT_62_4_AND_NOT_tlpFirst_6_4_5_TH_ETC___d102[7:0],
	       IF_tlpReq_3_BIT_62_4_AND_NOT_tlpFirst_6_4_5_TH_ETC___d102[15:8],
	       IF_tlpReq_3_BIT_62_4_AND_NOT_tlpFirst_6_4_5_TH_ETC___d102[23:16],
	       IF_tlpReq_3_BIT_62_4_AND_NOT_tlpFirst_6_4_5_TH_ETC___d102[31:24] } ;
  assign x__h2295 = x__h2297 - y__h2298 ;
  assign x__h2297 = { inF_D_OUT[105:96], 2'b0 } ;
  assign x__h7701 = 3'h4 - { 1'd0, rdp } ;
  assign y__h2296 =
	     (inF_D_OUT[105:96] == 10'd1) ? 12'd0 : { 10'd0, x__h2327 } ;
  assign y__h2298 = { 10'd0, x__h2304 } ;
  always@(inF_D_OUT)
  begin
    case (inF_D_OUT[67:64])
      4'b1100: x__h2304 = 2'b10;
      4'b1110: x__h2304 = 2'b01;
      4'b1111: x__h2304 = 2'b0;
      default: x__h2304 = 2'b11;
    endcase
  end
  always@(inF_D_OUT)
  begin
    case (inF_D_OUT[71:68])
      4'b1100: x__h2327 = 2'b10;
      4'b1110: x__h2327 = 2'b01;
      4'b1111: x__h2327 = 2'b0;
      default: x__h2327 = 2'b11;
    endcase
  end
  always@(tlpDWp or inF_D_OUT)
  begin
    case (tlpDWp)
      2'd0: v__h2549 = inF_D_OUT[31:0];
      2'd1: v__h2549 = inF_D_OUT[63:32];
      2'd2: v__h2549 = inF_D_OUT[95:64];
      2'd3: v__h2549 = inF_D_OUT[127:96];
    endcase
  end
  always@(rdp)
  begin
    case (rdp)
      2'b0: lastRema__h7245 = 16'hFFFF;
      2'b01: lastRema__h7245 = 16'hF000;
      2'b10: lastRema__h7245 = 16'hFF00;
      2'd3: lastRema__h7245 = 16'hFFF0;
    endcase
  end
  always@(inF_D_OUT)
  begin
    case (inF_D_OUT[67:64])
      4'b1000: lowAddr10__h2074 = 2'b11;
      4'b1100: lowAddr10__h2074 = 2'b10;
      4'b1110: lowAddr10__h2074 = 2'b01;
      default: lowAddr10__h2074 = 2'b0;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cmpActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rdp <= `BSV_ASSIGNMENT_DELAY 2'd0;
	rss <= `BSV_ASSIGNMENT_DELAY 2'd0;
	tlpActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (cmpActive_EN) cmpActive <= `BSV_ASSIGNMENT_DELAY cmpActive_D_IN;
	if (rdp_EN) rdp <= `BSV_ASSIGNMENT_DELAY rdp_D_IN;
	if (rss_EN) rss <= `BSV_ASSIGNMENT_DELAY rss_D_IN;
	if (tlpActive_EN) tlpActive <= `BSV_ASSIGNMENT_DELAY tlpActive_D_IN;
      end
    if (cmpDWRemain_EN) cmpDWRemain <= `BSV_ASSIGNMENT_DELAY cmpDWRemain_D_IN;
    if (rdv_EN) rdv <= `BSV_ASSIGNMENT_DELAY rdv_D_IN;
    if (tlpDW_EN) tlpDW <= `BSV_ASSIGNMENT_DELAY tlpDW_D_IN;
    if (tlpDWAddr_EN) tlpDWAddr <= `BSV_ASSIGNMENT_DELAY tlpDWAddr_D_IN;
    if (tlpDWp_EN) tlpDWp <= `BSV_ASSIGNMENT_DELAY tlpDWp_D_IN;
    if (tlpFirst_EN) tlpFirst <= `BSV_ASSIGNMENT_DELAY tlpFirst_D_IN;
    if (tlpReq_EN) tlpReq <= `BSV_ASSIGNMENT_DELAY tlpReq_D_IN;
    if (tlpUnroll_EN) tlpUnroll <= `BSV_ASSIGNMENT_DELAY tlpUnroll_D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cmpActive = 1'h0;
    cmpDWRemain = 10'h2AA;
    rdp = 2'h2;
    rdv = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    rss = 2'h2;
    tlpActive = 1'h0;
    tlpDW = 32'hAAAAAAAA;
    tlpDWAddr = 30'h2AAAAAAA;
    tlpDWp = 2'h2;
    tlpFirst = 1'h0;
    tlpReq = 64'hAAAAAAAAAAAAAAAA;
    tlpUnroll = 10'h2AA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule