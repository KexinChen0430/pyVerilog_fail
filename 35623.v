module outputs
  wire [47 : 0] l2Dst;
  wire [31 : 0] wciS0_SData;
  wire [15 : 0] l2Typ;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire RDY_dgdpEgressCnt, wciS0_SThreadBusy;
  // inlined wires
  wire [71 : 0] wci_wslv_wciReq$wget;
  wire [33 : 0] wci_wslv_respF_x_wire$wget;
  wire [31 : 0] dgdpEgressCnt_w$wget,
		wci_wci_Es_mAddr_w$wget,
		wci_wci_Es_mData_w$wget;
  wire [3 : 0] wci_wci_Es_mByteEn_w$wget;
  wire [2 : 0] wci_wci_Es_mCmd_w$wget, wci_wslv_wEdge$wget;
  wire dgdpEgressCnt_w$whas,
       wci_wci_Es_mAddrSpace_w$wget,
       wci_wci_Es_mAddrSpace_w$whas,
       wci_wci_Es_mAddr_w$whas,
       wci_wci_Es_mByteEn_w$whas,
       wci_wci_Es_mCmd_w$whas,
       wci_wci_Es_mData_w$whas,
       wci_wslv_ctlAckReg_1$wget,
       wci_wslv_ctlAckReg_1$whas,
       wci_wslv_reqF_r_clr$whas,
       wci_wslv_reqF_r_deq$whas,
       wci_wslv_reqF_r_enq$whas,
       wci_wslv_respF_dequeueing$whas,
       wci_wslv_respF_enqueueing$whas,
       wci_wslv_respF_x_wire$whas,
       wci_wslv_sFlagReg_1$wget,
       wci_wslv_sFlagReg_1$whas,
       wci_wslv_sThreadBusy_pw$whas,
       wci_wslv_wEdge$whas,
       wci_wslv_wciReq$whas,
       wci_wslv_wci_cfrd_pw$whas,
       wci_wslv_wci_cfwr_pw$whas,
       wci_wslv_wci_ctrl_pw$whas;
  // register ctlReg
  reg [31 : 0] ctlReg;
  wire [31 : 0] ctlReg$D_IN;
  wire ctlReg$EN;
  // register r10
  reg [31 : 0] r10;
  wire [31 : 0] r10$D_IN;
  wire r10$EN;
  // register r14
  reg [31 : 0] r14;
  wire [31 : 0] r14$D_IN;
  wire r14$EN;
  // register wci_wslv_cEdge
  reg [2 : 0] wci_wslv_cEdge;
  wire [2 : 0] wci_wslv_cEdge$D_IN;
  wire wci_wslv_cEdge$EN;
  // register wci_wslv_cState
  reg [2 : 0] wci_wslv_cState;
  wire [2 : 0] wci_wslv_cState$D_IN;
  wire wci_wslv_cState$EN;
  // register wci_wslv_ctlAckReg
  reg wci_wslv_ctlAckReg;
  wire wci_wslv_ctlAckReg$D_IN, wci_wslv_ctlAckReg$EN;
  // register wci_wslv_ctlOpActive
  reg wci_wslv_ctlOpActive;
  wire wci_wslv_ctlOpActive$D_IN, wci_wslv_ctlOpActive$EN;
  // register wci_wslv_illegalEdge
  reg wci_wslv_illegalEdge;
  wire wci_wslv_illegalEdge$D_IN, wci_wslv_illegalEdge$EN;
  // register wci_wslv_isReset_isInReset
  reg wci_wslv_isReset_isInReset;
  wire wci_wslv_isReset_isInReset$D_IN, wci_wslv_isReset_isInReset$EN;
  // register wci_wslv_nState
  reg [2 : 0] wci_wslv_nState;
  reg [2 : 0] wci_wslv_nState$D_IN;
  wire wci_wslv_nState$EN;
  // register wci_wslv_reqF_countReg
  reg [1 : 0] wci_wslv_reqF_countReg;
  wire [1 : 0] wci_wslv_reqF_countReg$D_IN;
  wire wci_wslv_reqF_countReg$EN;
  // register wci_wslv_respF_c_r
  reg [1 : 0] wci_wslv_respF_c_r;
  wire [1 : 0] wci_wslv_respF_c_r$D_IN;
  wire wci_wslv_respF_c_r$EN;
  // register wci_wslv_respF_q_0
  reg [33 : 0] wci_wslv_respF_q_0;
  reg [33 : 0] wci_wslv_respF_q_0$D_IN;
  wire wci_wslv_respF_q_0$EN;
  // register wci_wslv_respF_q_1
  reg [33 : 0] wci_wslv_respF_q_1;
  reg [33 : 0] wci_wslv_respF_q_1$D_IN;
  wire wci_wslv_respF_q_1$EN;
  // register wci_wslv_sFlagReg
  reg wci_wslv_sFlagReg;
  wire wci_wslv_sFlagReg$D_IN, wci_wslv_sFlagReg$EN;
  // register wci_wslv_sThreadBusy_d
  reg wci_wslv_sThreadBusy_d;
  wire wci_wslv_sThreadBusy_d$D_IN, wci_wslv_sThreadBusy_d$EN;
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF$D_IN, wci_wslv_reqF$D_OUT;
  wire wci_wslv_reqF$CLR,
       wci_wslv_reqF$DEQ,
       wci_wslv_reqF$EMPTY_N,
       wci_wslv_reqF$ENQ;
  // rule scheduling signals
  wire WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
       WILL_FIRE_RL_wci_ctrl_EiI,
       WILL_FIRE_RL_wci_ctrl_IsO,
       WILL_FIRE_RL_wci_ctrl_OrE,
       WILL_FIRE_RL_wci_wslv_ctl_op_complete,
       WILL_FIRE_RL_wci_wslv_ctl_op_start,
       WILL_FIRE_RL_wci_wslv_respF_both,
       WILL_FIRE_RL_wci_wslv_respF_decCtr,
       WILL_FIRE_RL_wci_wslv_respF_incCtr;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_2;
  wire [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_1,
		MUX_wci_wslv_respF_q_1$write_1__VAL_1,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_2;
  wire [1 : 0] MUX_wci_wslv_respF_c_r$write_1__VAL_1,
	       MUX_wci_wslv_respF_c_r$write_1__VAL_2;
  wire MUX_wci_wslv_illegalEdge$write_1__SEL_1,
       MUX_wci_wslv_illegalEdge$write_1__SEL_2,
       MUX_wci_wslv_illegalEdge$write_1__VAL_2,
       MUX_wci_wslv_respF_q_0$write_1__SEL_2,
       MUX_wci_wslv_respF_q_1$write_1__SEL_2;
  // remaining internal signals
  reg [63 : 0] v__h3696, v__h3871, v__h4015;
  reg [31 : 0] g_data__h5221;
  // value method wciS0_sResp
  assign wciS0_SResp = wci_wslv_respF_q_0[33:32] ;
  // value method wciS0_sData
  assign wciS0_SData = wci_wslv_respF_q_0[31:0] ;
  // value method wciS0_sThreadBusy
  assign wciS0_SThreadBusy =
	     wci_wslv_reqF_countReg > 2'd1 || wci_wslv_isReset_isInReset ;
  // value method wciS0_sFlag
  assign wciS0_SFlag = { 1'd1, wci_wslv_sFlagReg } ;
  // value method l2Dst
  assign l2Dst =
	     { r10[7:0],
	       r10[15:8],
	       r10[23:16],
	       r10[31:24],
	       r14[7:0],
	       r14[15:8] } ;
  // value method l2Typ
  assign l2Typ = r14[31:16] ;
  // action method dgdpEgressCnt
  assign RDY_dgdpEgressCnt = 1'd1 ;
  // submodule wci_wslv_reqF
  SizedFIFO #(.p1width(32'd72),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wci_wslv_reqF(.RST(wciS0_MReset_n),
					     .CLK(wciS0_Clk),
					     .D_IN(wci_wslv_reqF$D_IN),
					     .ENQ(wci_wslv_reqF$ENQ),
					     .DEQ(wci_wslv_reqF$DEQ),
					     .CLR(wci_wslv_reqF$CLR),
					     .D_OUT(wci_wslv_reqF$D_OUT),
					     .FULL_N(),
					     .EMPTY_N(wci_wslv_reqF$EMPTY_N));
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_wslv_respF_c_r != 2'd2 && wci_wslv_reqF$EMPTY_N &&
	     wci_wslv_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_cfrd
  assign WILL_FIRE_RL_wci_cfrd =
	     wci_wslv_respF_c_r != 2'd2 && wci_wslv_reqF$EMPTY_N &&
	     wci_wslv_wci_cfrd_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_wslv_ctl_op_start
  assign WILL_FIRE_RL_wci_wslv_ctl_op_start =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_wci_ctrl_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_ctrl_IsO
  assign WILL_FIRE_RL_wci_ctrl_IsO =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd1 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_ctrl_EiI
  assign WILL_FIRE_RL_wci_ctrl_EiI =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd0 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd0 ;
  // rule RL_wci_ctrl_OrE
  assign WILL_FIRE_RL_wci_ctrl_OrE =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd2 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd3 ;
  // rule RL_wci_wslv_ctl_op_complete
  assign WILL_FIRE_RL_wci_wslv_ctl_op_complete =
	     wci_wslv_respF_c_r != 2'd2 && wci_wslv_ctlOpActive &&
	     wci_wslv_ctlAckReg ;
  // rule RL_wci_wslv_respF_incCtr
  assign WILL_FIRE_RL_wci_wslv_respF_incCtr =
	     ((wci_wslv_respF_c_r == 2'd0) ?
		wci_wslv_respF_x_wire$whas :
		wci_wslv_respF_c_r != 2'd1 || wci_wslv_respF_x_wire$whas) &&
	     wci_wslv_respF_enqueueing$whas &&
	     !(wci_wslv_respF_c_r != 2'd0) ;
  // rule RL_wci_wslv_respF_decCtr
  assign WILL_FIRE_RL_wci_wslv_respF_decCtr =
	     wci_wslv_respF_c_r != 2'd0 && !wci_wslv_respF_enqueueing$whas ;
  // rule RL_wci_wslv_respF_both
  assign WILL_FIRE_RL_wci_wslv_respF_both =
	     ((wci_wslv_respF_c_r == 2'd1) ?
		wci_wslv_respF_x_wire$whas :
		wci_wslv_respF_c_r != 2'd2 || wci_wslv_respF_x_wire$whas) &&
	     wci_wslv_respF_c_r != 2'd0 &&
	     wci_wslv_respF_enqueueing$whas ;
  // inputs to muxes for submodule ports
  assign MUX_wci_wslv_illegalEdge$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge ;
  assign MUX_wci_wslv_illegalEdge$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     (wci_wslv_reqF$D_OUT[36:34] == 3'd0 && wci_wslv_cState != 3'd0 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd1 && wci_wslv_cState != 3'd1 &&
	      wci_wslv_cState != 3'd3 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd2 && wci_wslv_cState != 3'd2 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd3 && wci_wslv_cState != 3'd3 &&
	      wci_wslv_cState != 3'd2 &&
	      wci_wslv_cState != 3'd1 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd4 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd5 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd6 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd7) ;
  assign MUX_wci_wslv_respF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd0 ;
  assign MUX_wci_wslv_respF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd1 ;
  assign MUX_wci_wslv_illegalEdge$write_1__VAL_2 =
	     wci_wslv_reqF$D_OUT[36:34] != 3'd4 &&
	     wci_wslv_reqF$D_OUT[36:34] != 3'd5 &&
	     wci_wslv_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_wslv_respF_c_r$write_1__VAL_1 = wci_wslv_respF_c_r + 2'd1 ;
  assign MUX_wci_wslv_respF_c_r$write_1__VAL_2 = wci_wslv_respF_c_r - 2'd1 ;
  assign MUX_wci_wslv_respF_q_0$write_1__VAL_1 =
	     (wci_wslv_respF_c_r == 2'd1) ?
	       MUX_wci_wslv_respF_q_0$write_1__VAL_2 :
	       wci_wslv_respF_q_1 ;
  always@(WILL_FIRE_RL_wci_wslv_ctl_op_complete or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_wci_cfrd or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_wslv_ctl_op_complete:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_wci_cfrd:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_2;
      WILL_FIRE_RL_wci_cfwr:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 = 34'h1C0DE4201;
      default: MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_wci_wslv_respF_q_1$write_1__VAL_1 =
	     (wci_wslv_respF_c_r == 2'd2) ?
	       MUX_wci_wslv_respF_q_0$write_1__VAL_2 :
	       34'h0AAAAAAAA ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_1 =
	     wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 = { 2'd1, g_data__h5221 } ;
  // inlined wires
  assign wci_wslv_wciReq$wget =
	     { wciS0_MCmd,
	       wciS0_MAddrSpace,
	       wciS0_MByteEn,
	       wciS0_MAddr,
	       wciS0_MData } ;
  assign wci_wslv_wciReq$whas = 1'd1 ;
  assign wci_wslv_respF_x_wire$wget = MUX_wci_wslv_respF_q_0$write_1__VAL_2 ;
  assign wci_wslv_respF_x_wire$whas =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete || WILL_FIRE_RL_wci_cfrd ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wslv_wEdge$wget = wci_wslv_reqF$D_OUT[36:34] ;
  assign wci_wslv_wEdge$whas = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_sFlagReg_1$wget = 1'b0 ;
  assign wci_wslv_sFlagReg_1$whas = 1'b0 ;
  assign wci_wslv_ctlAckReg_1$wget = 1'd1 ;
  assign wci_wslv_ctlAckReg_1$whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  assign wci_wci_Es_mCmd_w$wget = wciS0_MCmd ;
  assign wci_wci_Es_mCmd_w$whas = 1'd1 ;
  assign wci_wci_Es_mAddrSpace_w$wget = wciS0_MAddrSpace ;
  assign wci_wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign wci_wci_Es_mByteEn_w$wget = wciS0_MByteEn ;
  assign wci_wci_Es_mByteEn_w$whas = 1'd1 ;
  assign wci_wci_Es_mAddr_w$wget = wciS0_MAddr ;
  assign wci_wci_Es_mAddr_w$whas = 1'd1 ;
  assign wci_wci_Es_mData_w$wget = wciS0_MData ;
  assign wci_wci_Es_mData_w$whas = 1'd1 ;
  assign dgdpEgressCnt_w$wget = dgdpEgressCnt_arg ;
  assign dgdpEgressCnt_w$whas = EN_dgdpEgressCnt ;
  assign wci_wslv_reqF_r_enq$whas = wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_r_deq$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_reqF_r_clr$whas = 1'b0 ;
  assign wci_wslv_respF_enqueueing$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign wci_wslv_respF_dequeueing$whas = wci_wslv_respF_c_r != 2'd0 ;
  assign wci_wslv_sThreadBusy_pw$whas = 1'b0 ;
  assign wci_wslv_wci_cfwr_pw$whas =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_reqF$D_OUT[68] &&
	     wci_wslv_reqF$D_OUT[71:69] == 3'd1 ;
  assign wci_wslv_wci_cfrd_pw$whas =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_reqF$D_OUT[68] &&
	     wci_wslv_reqF$D_OUT[71:69] == 3'd2 ;
  assign wci_wslv_wci_ctrl_pw$whas =
	     wci_wslv_reqF$EMPTY_N && !wci_wslv_reqF$D_OUT[68] &&
	     wci_wslv_reqF$D_OUT[71:69] == 3'd2 ;
  // register ctlReg
  assign ctlReg$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign ctlReg$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[39:32] == 8'h0 ;
  // register r10
  assign r10$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign r10$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[39:32] == 8'h10 ;
  // register r14
  assign r14$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign r14$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[39:32] == 8'h14 ;
  // register wci_wslv_cEdge
  assign wci_wslv_cEdge$D_IN = wci_wslv_reqF$D_OUT[36:34] ;
  assign wci_wslv_cEdge$EN = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  // register wci_wslv_cState
  assign wci_wslv_cState$D_IN = wci_wslv_nState ;
  assign wci_wslv_cState$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge ;
  // register wci_wslv_ctlAckReg
  assign wci_wslv_ctlAckReg$D_IN = wci_wslv_ctlAckReg_1$whas ;
  assign wci_wslv_ctlAckReg$EN = 1'd1 ;
  // register wci_wslv_ctlOpActive
  assign wci_wslv_ctlOpActive$D_IN = !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign wci_wslv_ctlOpActive$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  // register wci_wslv_illegalEdge
  assign wci_wslv_illegalEdge$D_IN =
	     !MUX_wci_wslv_illegalEdge$write_1__SEL_1 &&
	     MUX_wci_wslv_illegalEdge$write_1__VAL_2 ;
  assign wci_wslv_illegalEdge$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge ||
	     MUX_wci_wslv_illegalEdge$write_1__SEL_2 ;
  // register wci_wslv_isReset_isInReset
  assign wci_wslv_isReset_isInReset$D_IN = 1'd0 ;
  assign wci_wslv_isReset_isInReset$EN = wci_wslv_isReset_isInReset ;
  // register wci_wslv_nState
  always@(wci_wslv_reqF$D_OUT)
  begin
    case (wci_wslv_reqF$D_OUT[36:34])
      3'd0: wci_wslv_nState$D_IN = 3'd1;
      3'd1: wci_wslv_nState$D_IN = 3'd2;
      3'd2: wci_wslv_nState$D_IN = 3'd3;
      default: wci_wslv_nState$D_IN = 3'd0;
    endcase
  end
  assign wci_wslv_nState$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     (wci_wslv_reqF$D_OUT[36:34] == 3'd0 && wci_wslv_cState == 3'd0 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd1 &&
	      (wci_wslv_cState == 3'd1 || wci_wslv_cState == 3'd3) ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd2 && wci_wslv_cState == 3'd2 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd3 &&
	      (wci_wslv_cState == 3'd3 || wci_wslv_cState == 3'd2 ||
	       wci_wslv_cState == 3'd1)) ;
  // register wci_wslv_reqF_countReg
  assign wci_wslv_reqF_countReg$D_IN =
	     (wci_wslv_wciReq$wget[71:69] != 3'd0) ?
	       wci_wslv_reqF_countReg + 2'd1 :
	       wci_wslv_reqF_countReg - 2'd1 ;
  assign wci_wslv_reqF_countReg$EN =
	     (wci_wslv_wciReq$wget[71:69] != 3'd0) !=
	     wci_wslv_reqF_r_deq$whas ;
  // register wci_wslv_respF_c_r
  assign wci_wslv_respF_c_r$D_IN =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr ?
	       MUX_wci_wslv_respF_c_r$write_1__VAL_1 :
	       MUX_wci_wslv_respF_c_r$write_1__VAL_2 ;
  assign wci_wslv_respF_c_r$EN =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_respF_q_0
  always@(WILL_FIRE_RL_wci_wslv_respF_both or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 or
	  MUX_wci_wslv_respF_q_0$write_1__SEL_2 or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_respF_decCtr or wci_wslv_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_wslv_respF_both:
	  wci_wslv_respF_q_0$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_1;
      MUX_wci_wslv_respF_q_0$write_1__SEL_2:
	  wci_wslv_respF_q_0$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_respF_decCtr:
	  wci_wslv_respF_q_0$D_IN = wci_wslv_respF_q_1;
      default: wci_wslv_respF_q_0$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_wslv_respF_q_0$EN =
	     WILL_FIRE_RL_wci_wslv_respF_both ||
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_respF_q_1
  always@(WILL_FIRE_RL_wci_wslv_respF_both or
	  MUX_wci_wslv_respF_q_1$write_1__VAL_1 or
	  MUX_wci_wslv_respF_q_1$write_1__SEL_2 or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_wslv_respF_both:
	  wci_wslv_respF_q_1$D_IN = MUX_wci_wslv_respF_q_1$write_1__VAL_1;
      MUX_wci_wslv_respF_q_1$write_1__SEL_2:
	  wci_wslv_respF_q_1$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_respF_decCtr:
	  wci_wslv_respF_q_1$D_IN = 34'h0AAAAAAAA;
      default: wci_wslv_respF_q_1$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_wslv_respF_q_1$EN =
	     WILL_FIRE_RL_wci_wslv_respF_both ||
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_sFlagReg
  assign wci_wslv_sFlagReg$D_IN = 1'b0 ;
  assign wci_wslv_sFlagReg$EN = 1'd1 ;
  // register wci_wslv_sThreadBusy_d
  assign wci_wslv_sThreadBusy_d$D_IN = 1'b0 ;
  assign wci_wslv_sThreadBusy_d$EN = 1'd1 ;
  // submodule wci_wslv_reqF
  assign wci_wslv_reqF$D_IN = wci_wslv_wciReq$wget ;
  assign wci_wslv_reqF$ENQ = wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF$DEQ = wci_wslv_reqF_r_deq$whas ;
  assign wci_wslv_reqF$CLR = 1'b0 ;
  // remaining internal signals
  always@(wci_wslv_reqF$D_OUT or ctlReg or dgdpEgressCnt_arg or r10 or r14)
  begin
    case (wci_wslv_reqF$D_OUT[39:32])
      8'h0: g_data__h5221 = ctlReg;
      8'h0C: g_data__h5221 = dgdpEgressCnt_arg;
      8'h10: g_data__h5221 = r10;
      8'h14: g_data__h5221 = r14;
      default: g_data__h5221 = 32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        r10 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	r14 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wci_wslv_cEdge <= `BSV_ASSIGNMENT_DELAY 3'h2;
	wci_wslv_cState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_wslv_ctlAckReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_ctlOpActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_illegalEdge <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_nState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_wslv_reqF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_wslv_respF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (r10$EN) r10 <= `BSV_ASSIGNMENT_DELAY r10$D_IN;
	if (r14$EN) r14 <= `BSV_ASSIGNMENT_DELAY r14$D_IN;
	if (wci_wslv_cEdge$EN)
	  wci_wslv_cEdge <= `BSV_ASSIGNMENT_DELAY wci_wslv_cEdge$D_IN;
	if (wci_wslv_cState$EN)
	  wci_wslv_cState <= `BSV_ASSIGNMENT_DELAY wci_wslv_cState$D_IN;
	if (wci_wslv_ctlAckReg$EN)
	  wci_wslv_ctlAckReg <= `BSV_ASSIGNMENT_DELAY wci_wslv_ctlAckReg$D_IN;
	if (wci_wslv_ctlOpActive$EN)
	  wci_wslv_ctlOpActive <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_ctlOpActive$D_IN;
	if (wci_wslv_illegalEdge$EN)
	  wci_wslv_illegalEdge <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_illegalEdge$D_IN;
	if (wci_wslv_nState$EN)
	  wci_wslv_nState <= `BSV_ASSIGNMENT_DELAY wci_wslv_nState$D_IN;
	if (wci_wslv_reqF_countReg$EN)
	  wci_wslv_reqF_countReg <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_reqF_countReg$D_IN;
	if (wci_wslv_respF_c_r$EN)
	  wci_wslv_respF_c_r <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_c_r$D_IN;
	if (wci_wslv_respF_q_0$EN)
	  wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_q_0$D_IN;
	if (wci_wslv_respF_q_1$EN)
	  wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_q_1$D_IN;
	if (wci_wslv_sFlagReg$EN)
	  wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY wci_wslv_sFlagReg$D_IN;
	if (wci_wslv_sThreadBusy_d$EN)
	  wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_sThreadBusy_d$D_IN;
      end
    if (ctlReg$EN) ctlReg <= `BSV_ASSIGNMENT_DELAY ctlReg$D_IN;
  end
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (wci_wslv_isReset_isInReset$EN)
	wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_wslv_isReset_isInReset$D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    ctlReg = 32'hAAAAAAAA;
    r10 = 32'hAAAAAAAA;
    r14 = 32'hAAAAAAAA;
    wci_wslv_cEdge = 3'h2;
    wci_wslv_cState = 3'h2;
    wci_wslv_ctlAckReg = 1'h0;
    wci_wslv_ctlOpActive = 1'h0;
    wci_wslv_illegalEdge = 1'h0;
    wci_wslv_isReset_isInReset = 1'h0;
    wci_wslv_nState = 3'h2;
    wci_wslv_reqF_countReg = 2'h2;
    wci_wslv_respF_c_r = 2'h2;
    wci_wslv_respF_q_0 = 34'h2AAAAAAAA;
    wci_wslv_respF_q_1 = 34'h2AAAAAAAA;
    wci_wslv_sFlagReg = 1'h0;
    wci_wslv_sThreadBusy_d = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge wciS0_Clk)
  begin
    #0;
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	begin
	  v__h3696 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3696,
		 wci_wslv_reqF$D_OUT[36:34],
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/eth/GbeWrk.bsv\", line 43, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/eth/GbeWrk.bsv\", line 43, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/eth/GbeWrk.bsv\", line 43, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/eth/GbeWrk.bsv\", line 43, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/eth/GbeWrk.bsv\", line 43, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/eth/GbeWrk.bsv\", line 43, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/eth/GbeWrk.bsv\", line 43, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/eth/GbeWrk.bsv\", line 43, column 62: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/eth/GbeWrk.bsv\", line 43, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/eth/GbeWrk.bsv\", line 43, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	begin
	  v__h4015 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h4015,
		 wci_wslv_cEdge,
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	begin
	  v__h3871 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3871,
		 wci_wslv_cEdge,
		 wci_wslv_cState,
		 wci_wslv_nState);
  end
  // synopsys translate_on
endmodule