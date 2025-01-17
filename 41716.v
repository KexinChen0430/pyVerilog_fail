module outputs
  wire [49 : 0] chan_req;
  wire [33 : 0] wci_s_resp;
  wire [1 : 0] wci_s_SFlag;
  wire dif_SThreadBusy, wci_s_SThreadBusy;
  // inlined wires
  wire [52 : 0] wci_wciReq$wget;
  wire [49 : 0] wsiM_reqFifo_x_wire$wget;
  wire [45 : 0] lcbReq_1$wget;
  wire [35 : 0] wsiS_wsiReq$wget;
  wire [33 : 0] wci_respF_x_wire$wget;
  wire [19 : 0] rinF_x_wire$wget;
  wire [2 : 0] wci_wEdge$wget;
  wire coreReset_1$wget,
       coreReset_1$whas,
       lcbReq_1$whas,
       rinF_dequeueing$whas,
       rinF_enqueueing$whas,
       rinF_x_wire$whas,
       wci_ctlAckReg_1$wget,
       wci_ctlAckReg_1$whas,
       wci_reqF_r_clr$whas,
       wci_reqF_r_deq$whas,
       wci_reqF_r_enq$whas,
       wci_respF_dequeueing$whas,
       wci_respF_enqueueing$whas,
       wci_respF_x_wire$whas,
       wci_sFlagReg_1$wget,
       wci_sFlagReg_1$whas,
       wci_sThreadBusy_pw$whas,
       wci_wEdge$whas,
       wci_wciReq$whas,
       wci_wci_cfrd_pw$whas,
       wci_wci_cfwr_pw$whas,
       wci_wci_ctrl_pw$whas,
       wsiM_reqFifo_dequeueing$whas,
       wsiM_reqFifo_enqueueing$whas,
       wsiM_reqFifo_x_wire$whas,
       wsiM_sThreadBusy_pw$whas,
       wsiS_reqFifo_r_clr$whas,
       wsiS_reqFifo_r_deq$whas,
       wsiS_reqFifo_r_enq$whas,
       wsiS_wsiReq$whas;
  // register coreReset
  reg coreReset;
  wire coreReset$D_IN, coreReset$EN;
  // register lcbReq
  reg [45 : 0] lcbReq;
  wire [45 : 0] lcbReq$D_IN;
  wire lcbReq$EN;
  // register rinF_c_r
  reg [1 : 0] rinF_c_r;
  wire [1 : 0] rinF_c_r$D_IN;
  wire rinF_c_r$EN;
  // register rinF_q_0
  reg [19 : 0] rinF_q_0;
  wire [19 : 0] rinF_q_0$D_IN;
  wire rinF_q_0$EN;
  // register rinF_q_1
  reg [19 : 0] rinF_q_1;
  wire [19 : 0] rinF_q_1$D_IN;
  wire rinF_q_1$EN;
  // register wci_cEdge
  reg [2 : 0] wci_cEdge;
  wire [2 : 0] wci_cEdge$D_IN;
  wire wci_cEdge$EN;
  // register wci_cState
  reg [2 : 0] wci_cState;
  wire [2 : 0] wci_cState$D_IN;
  wire wci_cState$EN;
  // register wci_ctlAckReg
  reg wci_ctlAckReg;
  wire wci_ctlAckReg$D_IN, wci_ctlAckReg$EN;
  // register wci_ctlOpActive
  reg wci_ctlOpActive;
  wire wci_ctlOpActive$D_IN, wci_ctlOpActive$EN;
  // register wci_illegalEdge
  reg wci_illegalEdge;
  wire wci_illegalEdge$D_IN, wci_illegalEdge$EN;
  // register wci_isReset
  reg wci_isReset;
  wire wci_isReset$D_IN, wci_isReset$EN;
  // register wci_nState
  reg [2 : 0] wci_nState;
  reg [2 : 0] wci_nState$D_IN;
  wire wci_nState$EN;
  // register wci_reqF_countReg
  reg [1 : 0] wci_reqF_countReg;
  wire [1 : 0] wci_reqF_countReg$D_IN;
  wire wci_reqF_countReg$EN;
  // register wci_respF_c_r
  reg [1 : 0] wci_respF_c_r;
  wire [1 : 0] wci_respF_c_r$D_IN;
  wire wci_respF_c_r$EN;
  // register wci_respF_q_0
  reg [33 : 0] wci_respF_q_0;
  reg [33 : 0] wci_respF_q_0$D_IN;
  wire wci_respF_q_0$EN;
  // register wci_respF_q_1
  reg [33 : 0] wci_respF_q_1;
  reg [33 : 0] wci_respF_q_1$D_IN;
  wire wci_respF_q_1$EN;
  // register wci_sFlagReg
  reg wci_sFlagReg;
  wire wci_sFlagReg$D_IN, wci_sFlagReg$EN;
  // register wci_sThreadBusy_d
  reg wci_sThreadBusy_d;
  wire wci_sThreadBusy_d$D_IN, wci_sThreadBusy_d$EN;
  // register wsiM_reqFifo_c_r
  reg [1 : 0] wsiM_reqFifo_c_r;
  wire [1 : 0] wsiM_reqFifo_c_r$D_IN;
  wire wsiM_reqFifo_c_r$EN;
  // register wsiM_reqFifo_q_0
  reg [49 : 0] wsiM_reqFifo_q_0;
  reg [49 : 0] wsiM_reqFifo_q_0$D_IN;
  wire wsiM_reqFifo_q_0$EN;
  // register wsiM_reqFifo_q_1
  reg [49 : 0] wsiM_reqFifo_q_1;
  reg [49 : 0] wsiM_reqFifo_q_1$D_IN;
  wire wsiM_reqFifo_q_1$EN;
  // register wsiM_sThreadBusy_d
  reg wsiM_sThreadBusy_d;
  wire wsiM_sThreadBusy_d$D_IN, wsiM_sThreadBusy_d$EN;
  // register wsiS_ocpOvf
  reg wsiS_ocpOvf;
  wire wsiS_ocpOvf$D_IN, wsiS_ocpOvf$EN;
  // register wsiS_reqFifo_countReg
  reg [2 : 0] wsiS_reqFifo_countReg;
  wire [2 : 0] wsiS_reqFifo_countReg$D_IN;
  wire wsiS_reqFifo_countReg$EN;
  // ports of submodule ewr
  wire [31 : 0] ewr$ldi, ewr$ldo;
  wire [17 : 0] ewr$adin;
  wire [15 : 0] ewr$iout, ewr$qout;
  wire [10 : 0] ewr$ladr;
  wire ewr$clrn,
       ewr$dvout,
       ewr$lcs,
       ewr$ldv,
       ewr$lrd,
       ewr$lwr,
       ewr$sia,
       ewr$sib,
       ewr$tagin,
       ewr$tagout;
  // ports of submodule routF
  wire [31 : 0] routF$D_IN, routF$D_OUT;
  wire routF$CLR, routF$DEQ, routF$EMPTY_N, routF$ENQ, routF$FULL_N;
  // ports of submodule wciOperate
  wire wciOperate$dD_OUT, wciOperate$sD_IN, wciOperate$sEN;
  // ports of submodule wci_reqF
  wire [52 : 0] wci_reqF$D_IN, wci_reqF$D_OUT;
  wire wci_reqF$CLR, wci_reqF$DEQ, wci_reqF$EMPTY_N, wci_reqF$ENQ;
  // ports of submodule wsiS_reqFifo
  wire [35 : 0] wsiS_reqFifo$D_IN, wsiS_reqFifo$D_OUT;
  wire wsiS_reqFifo$CLR,
       wsiS_reqFifo$DEQ,
       wsiS_reqFifo$EMPTY_N,
       wsiS_reqFifo$ENQ,
       wsiS_reqFifo$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_coreReset__dreg_update,
       CAN_FIRE_RL_drive_lcb,
       CAN_FIRE_RL_drive_reset,
       CAN_FIRE_RL_inputToRcvr,
       CAN_FIRE_RL_lcbReq__dreg_update,
       CAN_FIRE_RL_lcb_read_response,
       CAN_FIRE_RL_operate_transfer,
       CAN_FIRE_RL_outputFromRcvr,
       CAN_FIRE_RL_rcvrProduce,
       CAN_FIRE_RL_rinF_both,
       CAN_FIRE_RL_rinF_decCtr,
       CAN_FIRE_RL_rinF_egress,
       CAN_FIRE_RL_rinF_incCtr,
       CAN_FIRE_RL_wci_cfrd,
       CAN_FIRE_RL_wci_cfwr,
       CAN_FIRE_RL_wci_ctlAckReg__dreg_update,
       CAN_FIRE_RL_wci_ctl_op_complete,
       CAN_FIRE_RL_wci_ctl_op_start,
       CAN_FIRE_RL_wci_ctrl_EiI,
       CAN_FIRE_RL_wci_ctrl_IsO,
       CAN_FIRE_RL_wci_ctrl_OrE,
       CAN_FIRE_RL_wci_reqF__updateLevelCounter,
       CAN_FIRE_RL_wci_reqF_enq,
       CAN_FIRE_RL_wci_request_decode,
       CAN_FIRE_RL_wci_respF_both,
       CAN_FIRE_RL_wci_respF_decCtr,
       CAN_FIRE_RL_wci_respF_deq,
       CAN_FIRE_RL_wci_respF_incCtr,
       CAN_FIRE_RL_wci_sFlagReg__dreg_update,
       CAN_FIRE_RL_wci_sThreadBusy_reg,
       CAN_FIRE_RL_wsiM_reqFifo_both,
       CAN_FIRE_RL_wsiM_reqFifo_decCtr,
       CAN_FIRE_RL_wsiM_reqFifo_deq,
       CAN_FIRE_RL_wsiM_reqFifo_incCtr,
       CAN_FIRE_RL_wsiM_sThreadBusy_reg,
       CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter,
       CAN_FIRE_RL_wsiS_reqFifo_enq,
       CAN_FIRE_chan_sThreadBusy,
       CAN_FIRE_dif_put,
       CAN_FIRE_wci_s_mFlag,
       CAN_FIRE_wci_s_putreq,
       WILL_FIRE_RL_coreReset__dreg_update,
       WILL_FIRE_RL_drive_lcb,
       WILL_FIRE_RL_drive_reset,
       WILL_FIRE_RL_inputToRcvr,
       WILL_FIRE_RL_lcbReq__dreg_update,
       WILL_FIRE_RL_lcb_read_response,
       WILL_FIRE_RL_operate_transfer,
       WILL_FIRE_RL_outputFromRcvr,
       WILL_FIRE_RL_rcvrProduce,
       WILL_FIRE_RL_rinF_both,
       WILL_FIRE_RL_rinF_decCtr,
       WILL_FIRE_RL_rinF_egress,
       WILL_FIRE_RL_rinF_incCtr,
       WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
       WILL_FIRE_RL_wci_ctlAckReg__dreg_update,
       WILL_FIRE_RL_wci_ctl_op_complete,
       WILL_FIRE_RL_wci_ctl_op_start,
       WILL_FIRE_RL_wci_ctrl_EiI,
       WILL_FIRE_RL_wci_ctrl_IsO,
       WILL_FIRE_RL_wci_ctrl_OrE,
       WILL_FIRE_RL_wci_reqF__updateLevelCounter,
       WILL_FIRE_RL_wci_reqF_enq,
       WILL_FIRE_RL_wci_request_decode,
       WILL_FIRE_RL_wci_respF_both,
       WILL_FIRE_RL_wci_respF_decCtr,
       WILL_FIRE_RL_wci_respF_deq,
       WILL_FIRE_RL_wci_respF_incCtr,
       WILL_FIRE_RL_wci_sFlagReg__dreg_update,
       WILL_FIRE_RL_wci_sThreadBusy_reg,
       WILL_FIRE_RL_wsiM_reqFifo_both,
       WILL_FIRE_RL_wsiM_reqFifo_decCtr,
       WILL_FIRE_RL_wsiM_reqFifo_deq,
       WILL_FIRE_RL_wsiM_reqFifo_incCtr,
       WILL_FIRE_RL_wsiM_sThreadBusy_reg,
       WILL_FIRE_RL_wsiS_reqFifo__updateLevelCounter,
       WILL_FIRE_RL_wsiS_reqFifo_enq,
       WILL_FIRE_chan_sThreadBusy,
       WILL_FIRE_dif_put,
       WILL_FIRE_wci_s_mFlag,
       WILL_FIRE_wci_s_putreq;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_respF_q_0$write_1__VAL_1;
  wire [49 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_1,
		MUX_wsiM_reqFifo_q_0$write_1__VAL_2,
		MUX_wsiM_reqFifo_q_1$write_1__VAL_2;
  wire [45 : 0] MUX_lcbReq_1$wset_1__VAL_1, MUX_lcbReq_1$wset_1__VAL_2;
  wire [33 : 0] MUX_wci_respF_q_0$write_1__VAL_2,
		MUX_wci_respF_q_1$write_1__VAL_2,
		MUX_wci_respF_x_wire$wset_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_2;
  wire [19 : 0] MUX_rinF_q_0$write_1__VAL_1;
  wire [1 : 0] MUX_rinF_c_r$write_1__VAL_2,
	       MUX_wci_respF_c_r$write_1__VAL_1,
	       MUX_wci_respF_c_r$write_1__VAL_2,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2;
  wire MUX_rinF_q_0$write_1__SEL_1,
       MUX_rinF_q_1$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_2,
       MUX_wci_respF_q_0$write_1__SEL_1,
       MUX_wci_respF_q_1$write_1__SEL_1,
       MUX_wsiM_reqFifo_q_0$write_1__SEL_1,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h2638, v__h2785, v__h3684, v__h8298, v__h8503, v__h8670;
  wire [11 : 0] x_mas_get_burstLength__h9454;
  // action method wci_s_putreq
  assign CAN_FIRE_wci_s_putreq = 1'd1 ;
  assign WILL_FIRE_wci_s_putreq = 1'd1 ;
  // value method wci_s_resp
  assign wci_s_resp = wci_respF_q_0 ;
  // value method wci_s_sThreadBusy
  assign wci_s_SThreadBusy = wci_reqF_countReg > 2'd1 ;
  // value method wci_s_sFlag
  assign wci_s_SFlag = { 1'd1, wci_sFlagReg } ;
  // action method wci_s_mFlag
  assign CAN_FIRE_wci_s_mFlag = 1'd1 ;
  assign WILL_FIRE_wci_s_mFlag = 1'd1 ;
  // action method dif_put
  assign CAN_FIRE_dif_put = 1'd1 ;
  assign WILL_FIRE_dif_put = 1'd1 ;
  // value method dif_sThreadBusy
  assign dif_SThreadBusy = wsiS_reqFifo_countReg > 3'd1 ;
  // value method chan_get
  assign chan_req =
	     { wsiM_sThreadBusy_d ? 3'd0 : wsiM_reqFifo_q_0[49:47],
	       !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[46],
	       !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[45],
	       x_mas_get_burstLength__h9454,
	       wsiM_reqFifo_q_0[32:1],
	       !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[0] } ;
  // action method chan_sThreadBusy
  assign CAN_FIRE_chan_sThreadBusy = 1'd1 ;
  assign WILL_FIRE_chan_sThreadBusy = chan_SThreadBusy ;
  // submodule ewr
  wb_rcvr_2to16_V5 ewr(.lclk(control_Clk),
		       .clk(dif_Clk),
		       .adin(ewr$adin),
		       .clrn(ewr$clrn),
		       .ladr(ewr$ladr),
		       .lcs(ewr$lcs),
		       .ldi(ewr$ldi),
		       .lrd(ewr$lrd),
		       .lwr(ewr$lwr),
		       .sia(ewr$sia),
		       .sib(ewr$sib),
		       .tagin(ewr$tagin),
		       .ldv(ewr$ldv),
		       .ldo(ewr$ldo),
		       .dvout(ewr$dvout),
		       .iout(ewr$iout),
		       .qout(ewr$qout),
		       .tagout(ewr$tagout));
  // submodule routF
  FIFO2 #( /*width*/ 32'd32,
	   /*guarded*/ 32'd1) routF(.RST_N(dif_m2s_MReset_n),
				    .CLK(dif_Clk),
				    .D_IN(routF$D_IN),
				    .ENQ(routF$ENQ),
				    .DEQ(routF$DEQ),
				    .CLR(routF$CLR),
				    .D_OUT(routF$D_OUT),
				    .FULL_N(routF$FULL_N),
				    .EMPTY_N(routF$EMPTY_N));
  // submodule wciOperate
  SyncBit #( /*init*/ 32'd0) wciOperate(.sCLK(control_Clk),
					.dCLK(dif_Clk),
					.sRST_N(control_m2s_MReset_n),
					.sD_IN(wciOperate$sD_IN),
					.sEN(wciOperate$sEN),
					.dD_OUT(wciOperate$dD_OUT));
  // submodule wci_reqF
  SizedFIFO #( /*p1width*/ 32'd53,
	       /*p2depth*/ 32'd3,
	       /*p3cntr_width*/ 32'd1,
	       /*guarded*/ 32'd1) wci_reqF(.RST_N(control_m2s_MReset_n),
					   .CLK(control_Clk),
					   .D_IN(wci_reqF$D_IN),
					   .ENQ(wci_reqF$ENQ),
					   .DEQ(wci_reqF$DEQ),
					   .CLR(wci_reqF$CLR),
					   .D_OUT(wci_reqF$D_OUT),
					   .FULL_N(),
					   .EMPTY_N(wci_reqF$EMPTY_N));
  // submodule wsiS_reqFifo
  SizedFIFO #( /*p1width*/ 32'd36,
	       /*p2depth*/ 32'd4,
	       /*p3cntr_width*/ 32'd2,
	       /*guarded*/ 32'd1) wsiS_reqFifo(.RST_N(dif_m2s_MReset_n),
					       .CLK(dif_Clk),
					       .D_IN(wsiS_reqFifo$D_IN),
					       .ENQ(wsiS_reqFifo$ENQ),
					       .DEQ(wsiS_reqFifo$DEQ),
					       .CLR(wsiS_reqFifo$CLR),
					       .D_OUT(wsiS_reqFifo$D_OUT),
					       .FULL_N(wsiS_reqFifo$FULL_N),
					       .EMPTY_N(wsiS_reqFifo$EMPTY_N));
  // rule RL_wci_request_decode
  assign CAN_FIRE_RL_wci_request_decode = wci_reqF$EMPTY_N ;
  assign WILL_FIRE_RL_wci_request_decode = wci_reqF$EMPTY_N ;
  // rule RL_wci_ctl_op_start
  assign CAN_FIRE_RL_wci_ctl_op_start =
	     wci_reqF$EMPTY_N && wci_wci_ctrl_pw$whas ;
  assign WILL_FIRE_RL_wci_ctl_op_start =
	     CAN_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_lcb_read_response
  assign CAN_FIRE_RL_lcb_read_response = wci_respF_c_r != 2'd2 && ewr$ldv ;
  assign WILL_FIRE_RL_lcb_read_response =
	     CAN_FIRE_RL_lcb_read_response &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_cfwr
  assign CAN_FIRE_RL_wci_cfwr =
	     wci_reqF$EMPTY_N && wci_respF_c_r != 2'd2 &&
	     wci_wci_cfwr_pw$whas ;
  assign WILL_FIRE_RL_wci_cfwr =
	     CAN_FIRE_RL_wci_cfwr && !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_lcb_read_response &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_cfrd
  assign CAN_FIRE_RL_wci_cfrd = wci_reqF$EMPTY_N && wci_wci_cfrd_pw$whas ;
  assign WILL_FIRE_RL_wci_cfrd =
	     CAN_FIRE_RL_wci_cfrd && !WILL_FIRE_RL_wci_ctl_op_start ;
  // rule RL_wci_ctrl_EiI
  assign CAN_FIRE_RL_wci_ctrl_EiI =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd0 &&
	     wci_reqF$D_OUT[36:34] == 3'd0 ;
  assign WILL_FIRE_RL_wci_ctrl_EiI = CAN_FIRE_RL_wci_ctrl_EiI ;
  // rule RL_wci_ctrl_OrE
  assign CAN_FIRE_RL_wci_ctrl_OrE =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd2 &&
	     wci_reqF$D_OUT[36:34] == 3'd3 ;
  assign WILL_FIRE_RL_wci_ctrl_OrE = CAN_FIRE_RL_wci_ctrl_OrE ;
  // rule RL_wci_ctrl_IsO
  assign CAN_FIRE_RL_wci_ctrl_IsO =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd1 &&
	     wci_reqF$D_OUT[36:34] == 3'd1 ;
  assign WILL_FIRE_RL_wci_ctrl_IsO = CAN_FIRE_RL_wci_ctrl_IsO ;
  // rule RL_rcvrProduce
  assign CAN_FIRE_RL_rcvrProduce = routF$FULL_N && ewr$dvout && ewr$tagout ;
  assign WILL_FIRE_RL_rcvrProduce = CAN_FIRE_RL_rcvrProduce ;
  // rule RL_drive_lcb
  assign CAN_FIRE_RL_drive_lcb = 1'd1 ;
  assign WILL_FIRE_RL_drive_lcb = 1'd1 ;
  // rule RL_drive_reset
  assign CAN_FIRE_RL_drive_reset = 1'd1 ;
  assign WILL_FIRE_RL_drive_reset = 1'd1 ;
  // rule RL_outputFromRcvr
  assign CAN_FIRE_RL_outputFromRcvr =
	     wsiM_reqFifo_c_r != 2'd2 && routF$EMPTY_N && wciOperate$dD_OUT ;
  assign WILL_FIRE_RL_outputFromRcvr = CAN_FIRE_RL_outputFromRcvr ;
  // rule RL_rinF_egress
  assign CAN_FIRE_RL_rinF_egress = 1'd1 ;
  assign WILL_FIRE_RL_rinF_egress = 1'd1 ;
  // rule RL_operate_transfer
  assign CAN_FIRE_RL_operate_transfer = 1'd1 ;
  assign WILL_FIRE_RL_operate_transfer = 1'd1 ;
  // rule RL_wci_ctl_op_complete
  assign CAN_FIRE_RL_wci_ctl_op_complete =
	     wci_respF_c_r != 2'd2 && wci_ctlOpActive && wci_ctlAckReg ;
  assign WILL_FIRE_RL_wci_ctl_op_complete = CAN_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_lcbReq__dreg_update
  assign CAN_FIRE_RL_lcbReq__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_lcbReq__dreg_update = 1'd1 ;
  // rule RL_coreReset__dreg_update
  assign CAN_FIRE_RL_coreReset__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_coreReset__dreg_update = 1'd1 ;
  // rule RL_wsiM_reqFifo_deq
  assign CAN_FIRE_RL_wsiM_reqFifo_deq =
	     wsiM_reqFifo_c_r != 2'd0 && !wsiM_sThreadBusy_d ;
  assign WILL_FIRE_RL_wsiM_reqFifo_deq = CAN_FIRE_RL_wsiM_reqFifo_deq ;
  // rule RL_wsiM_sThreadBusy_reg
  assign CAN_FIRE_RL_wsiM_sThreadBusy_reg = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_sThreadBusy_reg = 1'd1 ;
  // rule RL_wsiM_reqFifo_both
  assign CAN_FIRE_RL_wsiM_reqFifo_both =
	     ((wsiM_reqFifo_c_r == 2'd1) ?
		CAN_FIRE_RL_outputFromRcvr :
		wsiM_reqFifo_c_r != 2'd2 || CAN_FIRE_RL_outputFromRcvr) &&
	     CAN_FIRE_RL_wsiM_reqFifo_deq &&
	     CAN_FIRE_RL_outputFromRcvr ;
  assign WILL_FIRE_RL_wsiM_reqFifo_both = CAN_FIRE_RL_wsiM_reqFifo_both ;
  // rule RL_wsiM_reqFifo_incCtr
  assign CAN_FIRE_RL_wsiM_reqFifo_incCtr =
	     ((wsiM_reqFifo_c_r == 2'd0) ?
		CAN_FIRE_RL_outputFromRcvr :
		wsiM_reqFifo_c_r != 2'd1 || CAN_FIRE_RL_outputFromRcvr) &&
	     CAN_FIRE_RL_outputFromRcvr &&
	     !CAN_FIRE_RL_wsiM_reqFifo_deq ;
  assign WILL_FIRE_RL_wsiM_reqFifo_incCtr = CAN_FIRE_RL_wsiM_reqFifo_incCtr ;
  // rule RL_wsiM_reqFifo_decCtr
  assign CAN_FIRE_RL_wsiM_reqFifo_decCtr =
	     CAN_FIRE_RL_wsiM_reqFifo_deq && !CAN_FIRE_RL_outputFromRcvr ;
  assign WILL_FIRE_RL_wsiM_reqFifo_decCtr = CAN_FIRE_RL_wsiM_reqFifo_decCtr ;
  // rule RL_wsiS_reqFifo_enq
  assign CAN_FIRE_RL_wsiS_reqFifo_enq = dif_req[35:33] == 3'd1 ;
  assign WILL_FIRE_RL_wsiS_reqFifo_enq = CAN_FIRE_RL_wsiS_reqFifo_enq ;
  // rule RL_inputToRcvr
  assign CAN_FIRE_RL_inputToRcvr =
	     wsiS_reqFifo$EMPTY_N && rinF_c_r != 2'd2 && wciOperate$dD_OUT ;
  assign WILL_FIRE_RL_inputToRcvr = CAN_FIRE_RL_inputToRcvr ;
  // rule RL_rinF_both
  assign CAN_FIRE_RL_rinF_both = 1'b0 ;
  assign WILL_FIRE_RL_rinF_both = 1'b0 ;
  // rule RL_rinF_decCtr
  assign CAN_FIRE_RL_rinF_decCtr = 1'b0 ;
  assign WILL_FIRE_RL_rinF_decCtr = 1'b0 ;
  // rule RL_rinF_incCtr
  assign CAN_FIRE_RL_rinF_incCtr =
	     ((rinF_c_r == 2'd0) ?
		CAN_FIRE_RL_inputToRcvr :
		rinF_c_r != 2'd1 || CAN_FIRE_RL_inputToRcvr) &&
	     CAN_FIRE_RL_inputToRcvr ;
  assign WILL_FIRE_RL_rinF_incCtr = CAN_FIRE_RL_rinF_incCtr ;
  // rule RL_wsiS_reqFifo__updateLevelCounter
  assign CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter =
	     (dif_req[35:33] == 3'd1) != CAN_FIRE_RL_inputToRcvr ;
  assign WILL_FIRE_RL_wsiS_reqFifo__updateLevelCounter =
	     CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter ;
  // rule RL_wci_respF_deq
  assign CAN_FIRE_RL_wci_respF_deq = 1'd1 ;
  assign WILL_FIRE_RL_wci_respF_deq = 1'd1 ;
  // rule RL_wci_reqF_enq
  assign CAN_FIRE_RL_wci_reqF_enq = wci_s_req[52:50] != 3'd0 ;
  assign WILL_FIRE_RL_wci_reqF_enq = CAN_FIRE_RL_wci_reqF_enq ;
  // rule RL_wci_ctlAckReg__dreg_update
  assign CAN_FIRE_RL_wci_ctlAckReg__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wci_ctlAckReg__dreg_update = 1'd1 ;
  // rule RL_wci_sThreadBusy_reg
  assign CAN_FIRE_RL_wci_sThreadBusy_reg = 1'd1 ;
  assign WILL_FIRE_RL_wci_sThreadBusy_reg = 1'd1 ;
  // rule RL_wci_sFlagReg__dreg_update
  assign CAN_FIRE_RL_wci_sFlagReg__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wci_sFlagReg__dreg_update = 1'd1 ;
  // rule RL_wci_respF_both
  assign CAN_FIRE_RL_wci_respF_both =
	     ((wci_respF_c_r == 2'd1) ?
		wci_respF_x_wire$whas :
		wci_respF_c_r != 2'd2 || wci_respF_x_wire$whas) &&
	     wci_respF_c_r != 2'd0 &&
	     wci_respF_enqueueing$whas ;
  assign WILL_FIRE_RL_wci_respF_both = CAN_FIRE_RL_wci_respF_both ;
  // rule RL_wci_respF_decCtr
  assign CAN_FIRE_RL_wci_respF_decCtr =
	     wci_respF_c_r != 2'd0 && !wci_respF_enqueueing$whas ;
  assign WILL_FIRE_RL_wci_respF_decCtr = CAN_FIRE_RL_wci_respF_decCtr ;
  // rule RL_wci_respF_incCtr
  assign CAN_FIRE_RL_wci_respF_incCtr =
	     ((wci_respF_c_r == 2'd0) ?
		wci_respF_x_wire$whas :
		wci_respF_c_r != 2'd1 || wci_respF_x_wire$whas) &&
	     wci_respF_enqueueing$whas &&
	     !(wci_respF_c_r != 2'd0) ;
  assign WILL_FIRE_RL_wci_respF_incCtr = CAN_FIRE_RL_wci_respF_incCtr ;
  // rule RL_wci_reqF__updateLevelCounter
  assign CAN_FIRE_RL_wci_reqF__updateLevelCounter =
	     (wci_s_req[52:50] != 3'd0) != wci_reqF_r_deq$whas ;
  assign WILL_FIRE_RL_wci_reqF__updateLevelCounter =
	     CAN_FIRE_RL_wci_reqF__updateLevelCounter ;
  // inputs to muxes for submodule ports
  assign MUX_rinF_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_rinF_incCtr && rinF_c_r == 2'd0 ;
  assign MUX_rinF_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_rinF_incCtr && rinF_c_r == 2'd1 ;
  assign MUX_wci_illegalEdge$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge ;
  assign MUX_wsiM_reqFifo_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ;
  assign MUX_rinF_q_0$write_1__VAL_1 = { wsiS_reqFifo$D_OUT[18:1], 2'd2 } ;
  assign MUX_lcbReq_1$wset_1__VAL_1 =
	     { 3'd6, wci_reqF$D_OUT[44:34], wci_reqF$D_OUT[31:0] } ;
  assign MUX_lcbReq_1$wset_1__VAL_2 = { 3'd5, wci_reqF$D_OUT[44:34], 32'd0 } ;
  assign MUX_rinF_c_r$write_1__VAL_2 = rinF_c_r + 2'd1 ;
  assign MUX_wci_respF_c_r$write_1__VAL_1 = wci_respF_c_r - 2'd1 ;
  assign MUX_wci_respF_c_r$write_1__VAL_2 = wci_respF_c_r + 2'd1 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_1 =
	     wci_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_2 = { 2'd1, ewr$ldo } ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	     { 17'h08AAA, routF$D_OUT, 1'h0 } ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_2 =
	     (wsiM_reqFifo_c_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_1 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_2 =
	     (wsiM_reqFifo_c_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_1 :
	       50'h0000155555554 ;
  assign MUX_wci_illegalEdge$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_ctl_op_start &&
	     (wci_reqF$D_OUT[36:34] == 3'd0 && wci_cState != 3'd0 ||
	      wci_reqF$D_OUT[36:34] == 3'd1 && wci_cState != 3'd1 &&
	      wci_cState != 3'd3 ||
	      wci_reqF$D_OUT[36:34] == 3'd2 && wci_cState != 3'd2 ||
	      wci_reqF$D_OUT[36:34] == 3'd3 && wci_cState != 3'd3 &&
	      wci_cState != 3'd2 &&
	      wci_cState != 3'd1 ||
	      wci_reqF$D_OUT[36:34] == 3'd4 ||
	      wci_reqF$D_OUT[36:34] == 3'd5 ||
	      wci_reqF$D_OUT[36:34] == 3'd6 ||
	      wci_reqF$D_OUT[36:34] == 3'd7) ;
  always@(WILL_FIRE_RL_wci_ctl_op_complete or
	  MUX_wci_respF_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_lcb_read_response or
	  MUX_wci_respF_x_wire$wset_1__VAL_2 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_ctl_op_complete:
	  MUX_wci_respF_q_0$write_1__VAL_1 =
	      MUX_wci_respF_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_lcb_read_response:
	  MUX_wci_respF_q_0$write_1__VAL_1 =
	      MUX_wci_respF_x_wire$wset_1__VAL_2;
      WILL_FIRE_RL_wci_cfwr: MUX_wci_respF_q_0$write_1__VAL_1 = 34'h1C0DE4201;
      default: MUX_wci_respF_q_0$write_1__VAL_1 =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_wci_respF_q_0$write_1__VAL_2 =
	     (wci_respF_c_r == 2'd1) ?
	       MUX_wci_respF_q_0$write_1__VAL_1 :
	       wci_respF_q_1 ;
  assign MUX_wci_respF_q_1$write_1__VAL_2 =
	     (wci_respF_c_r == 2'd2) ?
	       MUX_wci_respF_q_0$write_1__VAL_1 :
	       34'h0AAAAAAAA ;
  assign MUX_wci_respF_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd0 ;
  assign MUX_wci_respF_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd1 ;
  // inlined wires
  assign wci_wciReq$wget = wci_s_req ;
  assign wci_wciReq$whas = 1'd1 ;
  assign wci_reqF_r_enq$whas = CAN_FIRE_RL_wci_reqF_enq ;
  assign wci_reqF_r_clr$whas = 1'b0 ;
  assign wci_respF_dequeueing$whas = wci_respF_c_r != 2'd0 ;
  assign wci_wEdge$wget = wci_reqF$D_OUT[36:34] ;
  assign wci_sThreadBusy_pw$whas = 1'b0 ;
  assign wci_sFlagReg_1$wget = 1'b0 ;
  assign wci_sFlagReg_1$whas = 1'b0 ;
  assign wci_wci_cfwr_pw$whas =
	     wci_reqF$EMPTY_N && wci_reqF$D_OUT[49] &&
	     wci_reqF$D_OUT[52:50] == 3'd1 ;
  assign wci_wci_cfrd_pw$whas =
	     wci_reqF$EMPTY_N && wci_reqF$D_OUT[49] &&
	     wci_reqF$D_OUT[52:50] == 3'd2 ;
  assign wci_wci_ctrl_pw$whas =
	     wci_reqF$EMPTY_N && !wci_reqF$D_OUT[49] &&
	     wci_reqF$D_OUT[52:50] == 3'd2 ;
  assign wci_reqF_r_deq$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_ctl_op_start ;
  assign wci_respF_enqueueing$whas =
	     WILL_FIRE_RL_wci_cfwr || WILL_FIRE_RL_lcb_read_response ||
	     WILL_FIRE_RL_wci_ctl_op_complete ;
  assign wci_respF_x_wire$wget = MUX_wci_respF_q_0$write_1__VAL_1 ;
  assign wci_respF_x_wire$whas =
	     WILL_FIRE_RL_wci_ctl_op_complete ||
	     WILL_FIRE_RL_lcb_read_response ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wEdge$whas = WILL_FIRE_RL_wci_ctl_op_start ;
  assign wci_ctlAckReg_1$wget = 1'd1 ;
  assign wci_ctlAckReg_1$whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  assign wsiS_wsiReq$wget = dif_req ;
  assign wsiS_wsiReq$whas = 1'd1 ;
  assign wsiS_reqFifo_r_enq$whas = CAN_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_r_deq$whas = CAN_FIRE_RL_inputToRcvr ;
  assign wsiS_reqFifo_r_clr$whas = 1'b0 ;
  assign wsiM_reqFifo_enqueueing$whas = CAN_FIRE_RL_outputFromRcvr ;
  assign wsiM_reqFifo_x_wire$whas = CAN_FIRE_RL_outputFromRcvr ;
  assign wsiM_reqFifo_x_wire$wget = MUX_wsiM_reqFifo_q_0$write_1__VAL_1 ;
  assign wsiM_reqFifo_dequeueing$whas = CAN_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw$whas = chan_SThreadBusy ;
  assign rinF_enqueueing$whas = CAN_FIRE_RL_inputToRcvr ;
  assign rinF_x_wire$wget = MUX_rinF_q_0$write_1__VAL_1 ;
  assign rinF_x_wire$whas = CAN_FIRE_RL_inputToRcvr ;
  assign rinF_dequeueing$whas = 1'b0 ;
  assign coreReset_1$wget = 1'd1 ;
  assign coreReset_1$whas = CAN_FIRE_RL_wci_ctrl_EiI ;
  assign lcbReq_1$whas = WILL_FIRE_RL_wci_cfwr || WILL_FIRE_RL_wci_cfrd ;
  assign lcbReq_1$wget =
	     WILL_FIRE_RL_wci_cfwr ?
	       MUX_lcbReq_1$wset_1__VAL_1 :
	       MUX_lcbReq_1$wset_1__VAL_2 ;
  // register coreReset
  assign coreReset$D_IN = CAN_FIRE_RL_wci_ctrl_EiI ;
  assign coreReset$EN = 1'd1 ;
  // register lcbReq
  assign lcbReq$D_IN = lcbReq_1$whas ? lcbReq_1$wget : 46'd0 ;
  assign lcbReq$EN = 1'd1 ;
  // register rinF_c_r
  assign rinF_c_r$D_IN = MUX_rinF_c_r$write_1__VAL_2 ;
  assign rinF_c_r$EN = WILL_FIRE_RL_rinF_incCtr ;
  // register rinF_q_0
  assign rinF_q_0$D_IN = MUX_rinF_q_0$write_1__VAL_1 ;
  assign rinF_q_0$EN = MUX_rinF_q_0$write_1__SEL_1 ;
  // register rinF_q_1
  assign rinF_q_1$D_IN = MUX_rinF_q_0$write_1__VAL_1 ;
  assign rinF_q_1$EN = MUX_rinF_q_1$write_1__SEL_1 ;
  // register wci_cEdge
  assign wci_cEdge$D_IN = wci_reqF$D_OUT[36:34] ;
  assign wci_cEdge$EN = WILL_FIRE_RL_wci_ctl_op_start ;
  // register wci_cState
  assign wci_cState$D_IN = wci_nState ;
  assign wci_cState$EN =
	     WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge ;
  // register wci_ctlAckReg
  assign wci_ctlAckReg$D_IN = wci_ctlAckReg_1$whas ;
  assign wci_ctlAckReg$EN = 1'd1 ;
  // register wci_ctlOpActive
  assign wci_ctlOpActive$D_IN = !WILL_FIRE_RL_wci_ctl_op_complete ;
  assign wci_ctlOpActive$EN =
	     WILL_FIRE_RL_wci_ctl_op_complete ||
	     WILL_FIRE_RL_wci_ctl_op_start ;
  // register wci_illegalEdge
  assign wci_illegalEdge$D_IN = !MUX_wci_illegalEdge$write_1__SEL_1 ;
  assign wci_illegalEdge$EN =
	     WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge ||
	     MUX_wci_illegalEdge$write_1__SEL_2 ;
  // register wci_isReset
  assign wci_isReset$D_IN = 1'b0 ;
  assign wci_isReset$EN = 1'b0 ;
  // register wci_nState
  always@(wci_reqF$D_OUT)
  begin
    case (wci_reqF$D_OUT[36:34])
      3'd0: wci_nState$D_IN = 3'd1;
      3'd1: wci_nState$D_IN = 3'd2;
      3'd2: wci_nState$D_IN = 3'd3;
      default: wci_nState$D_IN = 3'd0;
    endcase
  end
  assign wci_nState$EN =
	     WILL_FIRE_RL_wci_ctl_op_start &&
	     (wci_reqF$D_OUT[36:34] == 3'd0 && wci_cState == 3'd0 ||
	      wci_reqF$D_OUT[36:34] == 3'd1 &&
	      (wci_cState == 3'd1 || wci_cState == 3'd3) ||
	      wci_reqF$D_OUT[36:34] == 3'd2 && wci_cState == 3'd2 ||
	      wci_reqF$D_OUT[36:34] == 3'd3 &&
	      (wci_cState == 3'd3 || wci_cState == 3'd2 ||
	       wci_cState == 3'd1)) ;
  // register wci_reqF_countReg
  assign wci_reqF_countReg$D_IN =
	     (wci_s_req[52:50] != 3'd0) ?
	       wci_reqF_countReg + 2'd1 :
	       wci_reqF_countReg - 2'd1 ;
  assign wci_reqF_countReg$EN = CAN_FIRE_RL_wci_reqF__updateLevelCounter ;
  // register wci_respF_c_r
  assign wci_respF_c_r$D_IN =
	     WILL_FIRE_RL_wci_respF_decCtr ?
	       MUX_wci_respF_c_r$write_1__VAL_1 :
	       MUX_wci_respF_c_r$write_1__VAL_2 ;
  assign wci_respF_c_r$EN =
	     WILL_FIRE_RL_wci_respF_decCtr || WILL_FIRE_RL_wci_respF_incCtr ;
  // register wci_respF_q_0
  always@(MUX_wci_respF_q_0$write_1__SEL_1 or
	  MUX_wci_respF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wci_respF_both or
	  MUX_wci_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_respF_decCtr or wci_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_respF_q_0$write_1__SEL_1:
	  wci_respF_q_0$D_IN = MUX_wci_respF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wci_respF_both:
	  wci_respF_q_0$D_IN = MUX_wci_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_respF_decCtr: wci_respF_q_0$D_IN = wci_respF_q_1;
      default: wci_respF_q_0$D_IN = 34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_respF_q_0$EN =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wci_respF_both ||
	     WILL_FIRE_RL_wci_respF_decCtr ;
  // register wci_respF_q_1
  always@(MUX_wci_respF_q_1$write_1__SEL_1 or
	  MUX_wci_respF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wci_respF_both or
	  MUX_wci_respF_q_1$write_1__VAL_2 or WILL_FIRE_RL_wci_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_respF_q_1$write_1__SEL_1:
	  wci_respF_q_1$D_IN = MUX_wci_respF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wci_respF_both:
	  wci_respF_q_1$D_IN = MUX_wci_respF_q_1$write_1__VAL_2;
      WILL_FIRE_RL_wci_respF_decCtr: wci_respF_q_1$D_IN = 34'h0AAAAAAAA;
      default: wci_respF_q_1$D_IN = 34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_respF_q_1$EN =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wci_respF_both ||
	     WILL_FIRE_RL_wci_respF_decCtr ;
  // register wci_sFlagReg
  assign wci_sFlagReg$D_IN = 1'b0 ;
  assign wci_sFlagReg$EN = 1'd1 ;
  // register wci_sThreadBusy_d
  assign wci_sThreadBusy_d$D_IN = 1'b0 ;
  assign wci_sThreadBusy_d$EN = 1'd1 ;
  // register wsiM_reqFifo_c_r
  assign wsiM_reqFifo_c_r$D_IN =
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ?
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1 :
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2 ;
  assign wsiM_reqFifo_c_r$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr ;
  // register wsiM_reqFifo_q_0
  always@(MUX_wsiM_reqFifo_q_0$write_1__SEL_1 or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wsiM_reqFifo_both or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr or wsiM_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wsiM_reqFifo_q_0$write_1__SEL_1:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_0$D_IN = wsiM_reqFifo_q_1;
      default: wsiM_reqFifo_q_0$D_IN =
		   50'h2AAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_0$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ||
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  // register wsiM_reqFifo_q_1
  always@(MUX_wsiM_reqFifo_q_1$write_1__SEL_1 or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wsiM_reqFifo_both or
	  MUX_wsiM_reqFifo_q_1$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wsiM_reqFifo_q_1$write_1__SEL_1:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_1$write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_1$D_IN = 50'h0000155555554;
      default: wsiM_reqFifo_q_1$D_IN =
		   50'h2AAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_1$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ||
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  // register wsiM_sThreadBusy_d
  assign wsiM_sThreadBusy_d$D_IN = chan_SThreadBusy ;
  assign wsiM_sThreadBusy_d$EN = 1'd1 ;
  // register wsiS_ocpOvf
  assign wsiS_ocpOvf$D_IN = 1'd1 ;
  assign wsiS_ocpOvf$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && !wsiS_reqFifo$FULL_N ;
  // register wsiS_reqFifo_countReg
  assign wsiS_reqFifo_countReg$D_IN =
	     (dif_req[35:33] == 3'd1) ?
	       wsiS_reqFifo_countReg + 3'd1 :
	       wsiS_reqFifo_countReg - 3'd1 ;
  assign wsiS_reqFifo_countReg$EN =
	     CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter ;
  // submodule ewr
  assign ewr$adin = rinF_q_0[19:2] ;
  assign ewr$sia = rinF_q_0[1] ;
  assign ewr$sib = rinF_q_0[0] ;
  assign ewr$tagin = rinF_c_r != 2'd0 ;
  assign ewr$ladr = lcbReq[42:32] ;
  assign ewr$clrn = !coreReset ;
  assign ewr$lcs = lcbReq[45] ;
  assign ewr$ldi = lcbReq[31:0] ;
  assign ewr$lrd = lcbReq[43] ;
  assign ewr$lwr = lcbReq[44] ;
  // submodule routF
  assign routF$D_IN = { ewr$iout, ewr$qout } ;
  assign routF$DEQ = CAN_FIRE_RL_outputFromRcvr ;
  assign routF$ENQ = CAN_FIRE_RL_rcvrProduce ;
  assign routF$CLR = 1'b0 ;
  // submodule wciOperate
  assign wciOperate$sD_IN = wci_cState == 3'd2 ;
  assign wciOperate$sEN = 1'd1 ;
  // submodule wci_reqF
  assign wci_reqF$D_IN = wci_s_req ;
  assign wci_reqF$DEQ = wci_reqF_r_deq$whas ;
  assign wci_reqF$ENQ = CAN_FIRE_RL_wci_reqF_enq ;
  assign wci_reqF$CLR = 1'b0 ;
  // submodule wsiS_reqFifo
  assign wsiS_reqFifo$D_IN = dif_req ;
  assign wsiS_reqFifo$ENQ = CAN_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo$DEQ = CAN_FIRE_RL_inputToRcvr ;
  assign wsiS_reqFifo$CLR = 1'b0 ;
  // remaining internal signals
  assign x_mas_get_burstLength__h9454 =
	     wsiM_sThreadBusy_d ? 12'd0 : wsiM_reqFifo_q_0[44:33] ;
  // handling of inlined registers
  always@(posedge dif_Clk)
  begin
    if (!dif_m2s_MReset_n)
      begin
        rinF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	rinF_q_0 <= `BSV_ASSIGNMENT_DELAY 20'd0;
	rinF_q_1 <= `BSV_ASSIGNMENT_DELAY 20'd0;
	wsiM_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY 50'h0000155555554;
	wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY 50'h0000155555554;
	wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsiS_ocpOvf <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY 3'd0;
      end
    else
      begin
        if (rinF_c_r$EN) rinF_c_r <= `BSV_ASSIGNMENT_DELAY rinF_c_r$D_IN;
	if (rinF_q_0$EN) rinF_q_0 <= `BSV_ASSIGNMENT_DELAY rinF_q_0$D_IN;
	if (rinF_q_1$EN) rinF_q_1 <= `BSV_ASSIGNMENT_DELAY rinF_q_1$D_IN;
	if (wsiM_reqFifo_c_r$EN)
	  wsiM_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_c_r$D_IN;
	if (wsiM_reqFifo_q_0$EN)
	  wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_q_0$D_IN;
	if (wsiM_reqFifo_q_1$EN)
	  wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_q_1$D_IN;
	if (wsiM_sThreadBusy_d$EN)
	  wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY wsiM_sThreadBusy_d$D_IN;
	if (wsiS_ocpOvf$EN)
	  wsiS_ocpOvf <= `BSV_ASSIGNMENT_DELAY wsiS_ocpOvf$D_IN;
	if (wsiS_reqFifo_countReg$EN)
	  wsiS_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY
	      wsiS_reqFifo_countReg$D_IN;
      end
  end
  always@(posedge control_Clk)
  begin
    if (!control_m2s_MReset_n)
      begin
        coreReset <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lcbReq <= `BSV_ASSIGNMENT_DELAY 46'd0;
	wci_cEdge <= `BSV_ASSIGNMENT_DELAY 3'd7;
	wci_cState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_ctlAckReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_ctlOpActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_illegalEdge <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_isReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wci_nState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_reqF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_respF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_respF_q_0 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_respF_q_1 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_sFlagReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (coreReset$EN) coreReset <= `BSV_ASSIGNMENT_DELAY coreReset$D_IN;
	if (lcbReq$EN) lcbReq <= `BSV_ASSIGNMENT_DELAY lcbReq$D_IN;
	if (wci_cEdge$EN) wci_cEdge <= `BSV_ASSIGNMENT_DELAY wci_cEdge$D_IN;
	if (wci_cState$EN)
	  wci_cState <= `BSV_ASSIGNMENT_DELAY wci_cState$D_IN;
	if (wci_ctlAckReg$EN)
	  wci_ctlAckReg <= `BSV_ASSIGNMENT_DELAY wci_ctlAckReg$D_IN;
	if (wci_ctlOpActive$EN)
	  wci_ctlOpActive <= `BSV_ASSIGNMENT_DELAY wci_ctlOpActive$D_IN;
	if (wci_illegalEdge$EN)
	  wci_illegalEdge <= `BSV_ASSIGNMENT_DELAY wci_illegalEdge$D_IN;
	if (wci_isReset$EN)
	  wci_isReset <= `BSV_ASSIGNMENT_DELAY wci_isReset$D_IN;
	if (wci_nState$EN)
	  wci_nState <= `BSV_ASSIGNMENT_DELAY wci_nState$D_IN;
	if (wci_reqF_countReg$EN)
	  wci_reqF_countReg <= `BSV_ASSIGNMENT_DELAY wci_reqF_countReg$D_IN;
	if (wci_respF_c_r$EN)
	  wci_respF_c_r <= `BSV_ASSIGNMENT_DELAY wci_respF_c_r$D_IN;
	if (wci_respF_q_0$EN)
	  wci_respF_q_0 <= `BSV_ASSIGNMENT_DELAY wci_respF_q_0$D_IN;
	if (wci_respF_q_1$EN)
	  wci_respF_q_1 <= `BSV_ASSIGNMENT_DELAY wci_respF_q_1$D_IN;
	if (wci_sFlagReg$EN)
	  wci_sFlagReg <= `BSV_ASSIGNMENT_DELAY wci_sFlagReg$D_IN;
	if (wci_sThreadBusy_d$EN)
	  wci_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY wci_sThreadBusy_d$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    coreReset = 1'h0;
    lcbReq = 46'h2AAAAAAAAAAA;
    rinF_c_r = 2'h2;
    rinF_q_0 = 20'hAAAAA;
    rinF_q_1 = 20'hAAAAA;
    wci_cEdge = 3'h2;
    wci_cState = 3'h2;
    wci_ctlAckReg = 1'h0;
    wci_ctlOpActive = 1'h0;
    wci_illegalEdge = 1'h0;
    wci_isReset = 1'h0;
    wci_nState = 3'h2;
    wci_reqF_countReg = 2'h2;
    wci_respF_c_r = 2'h2;
    wci_respF_q_0 = 34'h2AAAAAAAA;
    wci_respF_q_1 = 34'h2AAAAAAAA;
    wci_sFlagReg = 1'h0;
    wci_sThreadBusy_d = 1'h0;
    wsiM_reqFifo_c_r = 2'h2;
    wsiM_reqFifo_q_0 = 50'h2AAAAAAAAAAAA;
    wsiM_reqFifo_q_1 = 50'h2AAAAAAAAAAAA;
    wsiM_sThreadBusy_d = 1'h0;
    wsiS_ocpOvf = 1'h0;
    wsiS_reqFifo_countReg = 3'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge control_Clk)
  begin
    #0;
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	begin
	  v__h3684 = $time;
	  #0;
	end
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3684,
		 wci_reqF$D_OUT[36:34],
		 wci_cState);
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_lcb_read_response)
	begin
	  v__h8298 = $time;
	  #0;
	end
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_lcb_read_response)
	$display("[%0d]: %m: WCI CONFIG READ RESPONSE Data:%0x",
		 v__h8298,
		 ewr$ldo);
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h8670 = $time;
	  #0;
	end
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h8670,
		 wci_reqF$D_OUT[44:32],
		 wci_reqF$D_OUT[48:45],
		 wci_reqF$D_OUT[31:0]);
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd)
	begin
	  v__h8503 = $time;
	  #0;
	end
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd)
	$display("[%0d]: %m: WCI CONFIG READ REQUEST Addr:%0x BE:%0x",
		 v__h8503,
		 wci_reqF$D_OUT[44:32],
		 wci_reqF$D_OUT[48:45]);
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_cfwr)
	$display("Error: \"bsv/RcvrWorker.bsv\", line 177, column 8: (R0001)\n  Mutually exclusive rules RL_wci_cfrd and RL_wci_cfwr fired in the same clock\n  cycle.\n");
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/RcvrWorker.bsv\", line 189, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_EiI and RL_wci_cfrd fired in the same\n  clock cycle.\n");
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_cfwr)
	$display("Error: \"bsv/RcvrWorker.bsv\", line 189, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_EiI and RL_wci_cfwr fired in the same\n  clock cycle.\n");
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/RcvrWorker.bsv\", line 205, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_OrE and RL_wci_ctrl_EiI fired in the\n  same clock cycle.\n");
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/RcvrWorker.bsv\", line 205, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_OrE and RL_wci_cfrd fired in the same\n  clock cycle.\n");
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_wci_cfwr)
	$display("Error: \"bsv/RcvrWorker.bsv\", line 205, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_OrE and RL_wci_cfwr fired in the same\n  clock cycle.\n");
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/RcvrWorker.bsv\", line 204, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_ctrl_OrE fired in the\n  same clock cycle.\n");
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/RcvrWorker.bsv\", line 204, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_ctrl_EiI fired in the\n  same clock cycle.\n");
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/RcvrWorker.bsv\", line 204, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_cfrd fired in the same\n  clock cycle.\n");
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_cfwr)
	$display("Error: \"bsv/RcvrWorker.bsv\", line 204, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_cfwr fired in the same\n  clock cycle.\n");
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	begin
	  v__h2785 = $time;
	  #0;
	end
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h2785,
		 wci_cEdge,
		 wci_cState);
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	begin
	  v__h2638 = $time;
	  #0;
	end
    if (control_m2s_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h2638,
		 wci_cEdge,
		 wci_cState,
		 wci_nState);
  end
  // synopsys translate_on
endmodule