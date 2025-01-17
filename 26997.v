module outputs
  wire [31 : 0] pmem_MData;
  wire [11 : 0] pmem_MBurstLength;
  wire [7 : 0] pmem_MReqInfo;
  wire [3 : 0] pmem_MByteEn;
  wire [2 : 0] pmem_MCmd;
  wire pmem_MBurstPrecise, pmem_MReqLast, pmem_MReset_n;
  // inlined wires
  wire [95 : 0] pmsender_wsiM_extStatusW_wget;
  wire [60 : 0] pmsender_wsiM_reqFifo_x_wire_wget;
  wire observer_r_sThreadBusy_1_wget,
       observer_r_sThreadBusy_1_whas,
       pmsender_wsiM_operateD_1_wget,
       pmsender_wsiM_operateD_1_whas,
       pmsender_wsiM_peerIsReady_1_wget,
       pmsender_wsiM_peerIsReady_1_whas,
       pmsender_wsiM_reqFifo_dequeueing_whas,
       pmsender_wsiM_reqFifo_enqueueing_whas,
       pmsender_wsiM_reqFifo_x_wire_whas,
       pmsender_wsiM_sThreadBusy_pw_whas;
  // register observer_r_mAddr
  reg [31 : 0] observer_r_mAddr;
  wire [31 : 0] observer_r_mAddr_D_IN;
  wire observer_r_mAddr_EN;
  // register observer_r_mAddrSpace
  reg observer_r_mAddrSpace;
  wire observer_r_mAddrSpace_D_IN, observer_r_mAddrSpace_EN;
  // register observer_r_mByteEn
  reg [3 : 0] observer_r_mByteEn;
  wire [3 : 0] observer_r_mByteEn_D_IN;
  wire observer_r_mByteEn_EN;
  // register observer_r_mCmd
  reg [2 : 0] observer_r_mCmd;
  wire [2 : 0] observer_r_mCmd_D_IN;
  wire observer_r_mCmd_EN;
  // register observer_r_mCmdD
  reg [2 : 0] observer_r_mCmdD;
  wire [2 : 0] observer_r_mCmdD_D_IN;
  wire observer_r_mCmdD_EN;
  // register observer_r_mData
  reg [31 : 0] observer_r_mData;
  wire [31 : 0] observer_r_mData_D_IN;
  wire observer_r_mData_EN;
  // register observer_r_mFlag
  reg [1 : 0] observer_r_mFlag;
  wire [1 : 0] observer_r_mFlag_D_IN;
  wire observer_r_mFlag_EN;
  // register observer_r_mResetn
  reg observer_r_mResetn;
  wire observer_r_mResetn_D_IN, observer_r_mResetn_EN;
  // register observer_r_mResetnD
  reg observer_r_mResetnD;
  wire observer_r_mResetnD_D_IN, observer_r_mResetnD_EN;
  // register observer_r_sData
  reg [31 : 0] observer_r_sData;
  wire [31 : 0] observer_r_sData_D_IN;
  wire observer_r_sData_EN;
  // register observer_r_sFlag
  reg [1 : 0] observer_r_sFlag;
  wire [1 : 0] observer_r_sFlag_D_IN;
  wire observer_r_sFlag_EN;
  // register observer_r_sResp
  reg [1 : 0] observer_r_sResp;
  wire [1 : 0] observer_r_sResp_D_IN;
  wire observer_r_sResp_EN;
  // register observer_r_sRespD
  reg [1 : 0] observer_r_sRespD;
  wire [1 : 0] observer_r_sRespD_D_IN;
  wire observer_r_sRespD_EN;
  // register observer_r_sThreadBusy
  reg observer_r_sThreadBusy;
  wire observer_r_sThreadBusy_D_IN, observer_r_sThreadBusy_EN;
  // register observer_readInFlight
  reg observer_readInFlight;
  wire observer_readInFlight_D_IN, observer_readInFlight_EN;
  // register pmsender_idx
  reg [2 : 0] pmsender_idx;
  wire [2 : 0] pmsender_idx_D_IN;
  wire pmsender_idx_EN;
  // register pmsender_isHead
  reg pmsender_isHead;
  wire pmsender_isHead_D_IN, pmsender_isHead_EN;
  // register pmsender_srcTag
  reg [7 : 0] pmsender_srcTag;
  wire [7 : 0] pmsender_srcTag_D_IN;
  wire pmsender_srcTag_EN;
  // register pmsender_wsiM_burstKind
  reg [1 : 0] pmsender_wsiM_burstKind;
  wire [1 : 0] pmsender_wsiM_burstKind_D_IN;
  wire pmsender_wsiM_burstKind_EN;
  // register pmsender_wsiM_errorSticky
  reg pmsender_wsiM_errorSticky;
  wire pmsender_wsiM_errorSticky_D_IN, pmsender_wsiM_errorSticky_EN;
  // register pmsender_wsiM_iMesgCount
  reg [31 : 0] pmsender_wsiM_iMesgCount;
  wire [31 : 0] pmsender_wsiM_iMesgCount_D_IN;
  wire pmsender_wsiM_iMesgCount_EN;
  // register pmsender_wsiM_isReset_isInReset
  reg pmsender_wsiM_isReset_isInReset;
  wire pmsender_wsiM_isReset_isInReset_D_IN,
       pmsender_wsiM_isReset_isInReset_EN;
  // register pmsender_wsiM_operateD
  reg pmsender_wsiM_operateD;
  wire pmsender_wsiM_operateD_D_IN, pmsender_wsiM_operateD_EN;
  // register pmsender_wsiM_pMesgCount
  reg [31 : 0] pmsender_wsiM_pMesgCount;
  wire [31 : 0] pmsender_wsiM_pMesgCount_D_IN;
  wire pmsender_wsiM_pMesgCount_EN;
  // register pmsender_wsiM_peerIsReady
  reg pmsender_wsiM_peerIsReady;
  wire pmsender_wsiM_peerIsReady_D_IN, pmsender_wsiM_peerIsReady_EN;
  // register pmsender_wsiM_reqFifo_cntr_r
  reg [1 : 0] pmsender_wsiM_reqFifo_cntr_r;
  wire [1 : 0] pmsender_wsiM_reqFifo_cntr_r_D_IN;
  wire pmsender_wsiM_reqFifo_cntr_r_EN;
  // register pmsender_wsiM_reqFifo_q_0
  reg [60 : 0] pmsender_wsiM_reqFifo_q_0;
  reg [60 : 0] pmsender_wsiM_reqFifo_q_0_D_IN;
  wire pmsender_wsiM_reqFifo_q_0_EN;
  // register pmsender_wsiM_reqFifo_q_1
  reg [60 : 0] pmsender_wsiM_reqFifo_q_1;
  reg [60 : 0] pmsender_wsiM_reqFifo_q_1_D_IN;
  wire pmsender_wsiM_reqFifo_q_1_EN;
  // register pmsender_wsiM_sThreadBusy_d
  reg pmsender_wsiM_sThreadBusy_d;
  wire pmsender_wsiM_sThreadBusy_d_D_IN, pmsender_wsiM_sThreadBusy_d_EN;
  // register pmsender_wsiM_statusR
  reg [7 : 0] pmsender_wsiM_statusR;
  wire [7 : 0] pmsender_wsiM_statusR_D_IN;
  wire pmsender_wsiM_statusR_EN;
  // register pmsender_wsiM_tBusyCount
  reg [31 : 0] pmsender_wsiM_tBusyCount;
  wire [31 : 0] pmsender_wsiM_tBusyCount_D_IN;
  wire pmsender_wsiM_tBusyCount_EN;
  // register pmsender_wsiM_trafficSticky
  reg pmsender_wsiM_trafficSticky;
  wire pmsender_wsiM_trafficSticky_D_IN, pmsender_wsiM_trafficSticky_EN;
  // ports of submodule observer_evF
  reg [98 : 0] observer_evF_D_IN;
  wire [98 : 0] observer_evF_D_OUT;
  wire observer_evF_CLR,
       observer_evF_DEQ,
       observer_evF_EMPTY_N,
       observer_evF_ENQ,
       observer_evF_FULL_N;
  // ports of submodule pmsender_evF
  wire [98 : 0] pmsender_evF_D_IN, pmsender_evF_D_OUT;
  wire pmsender_evF_CLR,
       pmsender_evF_DEQ,
       pmsender_evF_EMPTY_N,
       pmsender_evF_ENQ,
       pmsender_evF_FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_observer_request_detected,
       WILL_FIRE_RL_observer_reset_changed,
       WILL_FIRE_RL_observer_response_detected,
       WILL_FIRE_RL_pmsender_serialize_message,
       WILL_FIRE_RL_pmsender_wsiM_reqFifo_both,
       WILL_FIRE_RL_pmsender_wsiM_reqFifo_decCtr,
       WILL_FIRE_RL_pmsender_wsiM_reqFifo_deq,
       WILL_FIRE_RL_pmsender_wsiM_reqFifo_incCtr;
  // inputs to muxes for submodule ports
  wire [98 : 0] MUX_observer_evF_enq_1__VAL_1,
		MUX_observer_evF_enq_1__VAL_2,
		MUX_observer_evF_enq_1__VAL_3;
  wire [60 : 0] MUX_pmsender_wsiM_reqFifo_q_0_write_1__VAL_1,
		MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_1,
		MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_2;
  wire [1 : 0] MUX_pmsender_wsiM_reqFifo_cntr_r_write_1__VAL_2;
  wire MUX_observer_evF_enq_1__SEL_1,
       MUX_observer_evF_enq_1__SEL_2,
       MUX_pmsender_wsiM_reqFifo_q_0_write_1__SEL_1,
       MUX_pmsender_wsiM_reqFifo_q_0_write_1__SEL_2,
       MUX_pmsender_wsiM_reqFifo_q_1_write_1__SEL_1,
       MUX_pmsender_wsiM_reqFifo_q_1_write_1__SEL_2;
  // remaining internal signals
  reg [95 : 0] CASE_observer_evFD_OUT_BITS_98_TO_96_0_0xAAAA_ETC__q10;
  reg [63 : 0] v__h1590, v__h1613;
  reg [31 : 0] x_data__h4786;
  reg [7 : 0] CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5,
	      CASE_observer_evFD_OUT_BITS_39_TO_32_0_observ_ETC__q9,
	      CASE_observer_evFD_OUT_BITS_71_TO_64_0_observ_ETC__q6,
	      CASE_observer_evFD_OUT_BITS_7_TO_0_0_observer_ETC__q8,
	      x__h5780;
  reg [4 : 0] CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3,
	      CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1,
	      CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2,
	      CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CASE_p_ETC__q4;
  reg [2 : 0] CASE_observer_evFD_OUT_BITS_98_TO_96_0_observ_ETC__q7,
	      len__h4717;
  wire [95 : 0] DONTCARE_CONCAT_IF_observer_evF_first__00_BITS_ETC___d588;
  wire [11 : 0] x_burstLength__h4785;
  wire [1 : 0] pmsender_wsiM_reqFifo_cntr_r_7_MINUS_1___d67;
  wire _dfoo1,
       _dfoo3,
       pmsender_idx_27_EQ_IF_pmsender_evF_first__28_B_ETC___d136;
  // value method pmem_mCmd
  assign pmem_MCmd =
	     pmsender_wsiM_sThreadBusy_d ?
	       3'd0 :
	       pmsender_wsiM_reqFifo_q_0[60:58] ;
  // value method pmem_mReqLast
  assign pmem_MReqLast =
	     !pmsender_wsiM_sThreadBusy_d && pmsender_wsiM_reqFifo_q_0[57] ;
  // value method pmem_mBurstPrecise
  assign pmem_MBurstPrecise =
	     !pmsender_wsiM_sThreadBusy_d && pmsender_wsiM_reqFifo_q_0[56] ;
  // value method pmem_mBurstLength
  assign pmem_MBurstLength =
	     pmsender_wsiM_sThreadBusy_d ?
	       12'd0 :
	       pmsender_wsiM_reqFifo_q_0[55:44] ;
  // value method pmem_mData
  assign pmem_MData = pmsender_wsiM_reqFifo_q_0[43:12] ;
  // value method pmem_mByteEn
  assign pmem_MByteEn = pmsender_wsiM_reqFifo_q_0[11:8] ;
  // value method pmem_mReqInfo
  assign pmem_MReqInfo =
	     pmsender_wsiM_sThreadBusy_d ?
	       8'd0 :
	       pmsender_wsiM_reqFifo_q_0[7:0] ;
  // value method pmem_mReset_n
  assign pmem_MReset_n =
	     !pmsender_wsiM_isReset_isInReset && pmsender_wsiM_operateD ;
  // submodule observer_evF
  FIFO2 #(.width(32'd99), .guarded(32'd1)) observer_evF(.RST(RST_N),
							.CLK(CLK),
							.D_IN(observer_evF_D_IN),
							.ENQ(observer_evF_ENQ),
							.DEQ(observer_evF_DEQ),
							.CLR(observer_evF_CLR),
							.D_OUT(observer_evF_D_OUT),
							.FULL_N(observer_evF_FULL_N),
							.EMPTY_N(observer_evF_EMPTY_N));
  // submodule pmsender_evF
  FIFO2 #(.width(32'd99), .guarded(32'd1)) pmsender_evF(.RST(RST_N),
							.CLK(CLK),
							.D_IN(pmsender_evF_D_IN),
							.ENQ(pmsender_evF_ENQ),
							.DEQ(pmsender_evF_DEQ),
							.CLR(pmsender_evF_CLR),
							.D_OUT(pmsender_evF_D_OUT),
							.FULL_N(pmsender_evF_FULL_N),
							.EMPTY_N(pmsender_evF_EMPTY_N));
  // rule RL_observer_request_detected
  assign WILL_FIRE_RL_observer_request_detected =
	     ((observer_r_mCmd == 3'd1) ?
		observer_evF_FULL_N :
		observer_r_mCmd != 3'd2 || observer_evF_FULL_N) &&
	     observer_r_mCmdD == 3'd0 &&
	     observer_r_mCmd != 3'd0 ;
  // rule RL_observer_response_detected
  assign WILL_FIRE_RL_observer_response_detected =
	     (observer_r_sResp != 2'd1 || observer_evF_FULL_N) &&
	     observer_r_sRespD == 2'd0 &&
	     observer_r_sResp != 2'd0 &&
	     !WILL_FIRE_RL_observer_request_detected ;
  // rule RL_observer_reset_changed
  assign WILL_FIRE_RL_observer_reset_changed =
	     observer_evF_FULL_N &&
	     observer_r_mResetnD ^ observer_r_mResetn &&
	     !WILL_FIRE_RL_observer_response_detected &&
	     !WILL_FIRE_RL_observer_request_detected ;
  // rule RL_pmsender_serialize_message
  assign WILL_FIRE_RL_pmsender_serialize_message =
	     pmsender_wsiM_reqFifo_cntr_r != 2'd2 && pmsender_evF_EMPTY_N ;
  // rule RL_pmsender_wsiM_reqFifo_deq
  assign WILL_FIRE_RL_pmsender_wsiM_reqFifo_deq =
	     pmsender_wsiM_reqFifo_cntr_r != 2'd0 &&
	     !pmsender_wsiM_sThreadBusy_d ;
  // rule RL_pmsender_wsiM_reqFifo_incCtr
  assign WILL_FIRE_RL_pmsender_wsiM_reqFifo_incCtr =
	     WILL_FIRE_RL_pmsender_serialize_message &&
	     WILL_FIRE_RL_pmsender_serialize_message &&
	     !WILL_FIRE_RL_pmsender_wsiM_reqFifo_deq ;
  // rule RL_pmsender_wsiM_reqFifo_decCtr
  assign WILL_FIRE_RL_pmsender_wsiM_reqFifo_decCtr =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_deq &&
	     !WILL_FIRE_RL_pmsender_serialize_message ;
  // rule RL_pmsender_wsiM_reqFifo_both
  assign WILL_FIRE_RL_pmsender_wsiM_reqFifo_both =
	     WILL_FIRE_RL_pmsender_serialize_message &&
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_deq &&
	     WILL_FIRE_RL_pmsender_serialize_message ;
  // inputs to muxes for submodule ports
  assign MUX_observer_evF_enq_1__SEL_1 =
	     WILL_FIRE_RL_observer_response_detected &&
	     observer_r_sResp == 2'd1 ;
  assign MUX_observer_evF_enq_1__SEL_2 =
	     WILL_FIRE_RL_observer_request_detected &&
	     (observer_r_mCmd == 3'd1 || observer_r_mCmd == 3'd2) ;
  assign MUX_pmsender_wsiM_reqFifo_q_0_write_1__SEL_1 =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_both && _dfoo3 ;
  assign MUX_pmsender_wsiM_reqFifo_q_0_write_1__SEL_2 =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_incCtr &&
	     pmsender_wsiM_reqFifo_cntr_r == 2'd0 ;
  assign MUX_pmsender_wsiM_reqFifo_q_1_write_1__SEL_1 =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_both && _dfoo1 ;
  assign MUX_pmsender_wsiM_reqFifo_q_1_write_1__SEL_2 =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_incCtr &&
	     pmsender_wsiM_reqFifo_cntr_r == 2'd1 ;
  assign MUX_observer_evF_enq_1__VAL_1 =
	     { 59'h1AAAAAAAAAAAAAA,
	       observer_readInFlight ? 8'd64 : 8'd48,
	       observer_r_sData } ;
  assign MUX_observer_evF_enq_1__VAL_2 =
	     (observer_r_mCmd == 3'd1) ?
	       { 35'h2AAAAAA10, observer_r_mAddr, observer_r_mData } :
	       { 67'h1AAAAAAAAAAAAAA20, observer_r_mAddr } ;
  assign MUX_observer_evF_enq_1__VAL_3 =
	     { 91'h0AAAAAAAAAAAAAAAAAAAAAA,
	       observer_r_mResetn ? 8'd1 : 8'd2 } ;
  assign MUX_pmsender_wsiM_reqFifo_cntr_r_write_1__VAL_2 =
	     pmsender_wsiM_reqFifo_cntr_r + 2'd1 ;
  assign MUX_pmsender_wsiM_reqFifo_q_0_write_1__VAL_1 =
	     (pmsender_wsiM_reqFifo_cntr_r == 2'd1) ?
	       MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_2 :
	       pmsender_wsiM_reqFifo_q_1 ;
  assign MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_1 =
	     (pmsender_wsiM_reqFifo_cntr_r == 2'd2) ?
	       MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_2 :
	       61'h00000AAAAAAAAA00 ;
  assign MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_2 =
	     { 3'd1,
	       pmsender_idx_27_EQ_IF_pmsender_evF_first__28_B_ETC___d136,
	       1'd0,
	       x_burstLength__h4785,
	       x_data__h4786,
	       12'd3840 } ;
  // inlined wires
  assign observer_r_sThreadBusy_1_wget = 1'b1 ;
  assign observer_r_sThreadBusy_1_whas = observe_SThreadBusy ;
  assign pmsender_wsiM_reqFifo_x_wire_wget =
	     MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_2 ;
  assign pmsender_wsiM_reqFifo_x_wire_whas =
	     WILL_FIRE_RL_pmsender_serialize_message ;
  assign pmsender_wsiM_operateD_1_wget = 1'd1 ;
  assign pmsender_wsiM_operateD_1_whas = 1'd1 ;
  assign pmsender_wsiM_peerIsReady_1_wget = 1'd1 ;
  assign pmsender_wsiM_peerIsReady_1_whas = pmem_SReset_n ;
  assign pmsender_wsiM_reqFifo_enqueueing_whas =
	     WILL_FIRE_RL_pmsender_serialize_message ;
  assign pmsender_wsiM_reqFifo_dequeueing_whas =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_deq ;
  assign pmsender_wsiM_sThreadBusy_pw_whas = pmem_SThreadBusy ;
  assign pmsender_wsiM_extStatusW_wget =
	     { pmsender_wsiM_pMesgCount,
	       pmsender_wsiM_iMesgCount,
	       pmsender_wsiM_tBusyCount } ;
  // register observer_r_mAddr
  assign observer_r_mAddr_D_IN = observe_MAddr ;
  assign observer_r_mAddr_EN = 1'd1 ;
  // register observer_r_mAddrSpace
  assign observer_r_mAddrSpace_D_IN = observe_MAddrSpace ;
  assign observer_r_mAddrSpace_EN = 1'd1 ;
  // register observer_r_mByteEn
  assign observer_r_mByteEn_D_IN = observe_MByteEn ;
  assign observer_r_mByteEn_EN = 1'd1 ;
  // register observer_r_mCmd
  assign observer_r_mCmd_D_IN = observe_MCmd ;
  assign observer_r_mCmd_EN = 1'd1 ;
  // register observer_r_mCmdD
  assign observer_r_mCmdD_D_IN = observer_r_mCmd ;
  assign observer_r_mCmdD_EN = 1'd1 ;
  // register observer_r_mData
  assign observer_r_mData_D_IN = observe_MData ;
  assign observer_r_mData_EN = 1'd1 ;
  // register observer_r_mFlag
  assign observer_r_mFlag_D_IN = observe_MFlag ;
  assign observer_r_mFlag_EN = 1'd1 ;
  // register observer_r_mResetn
  assign observer_r_mResetn_D_IN = observe_MReset_n ;
  assign observer_r_mResetn_EN = 1'd1 ;
  // register observer_r_mResetnD
  assign observer_r_mResetnD_D_IN = observer_r_mResetn ;
  assign observer_r_mResetnD_EN = 1'd1 ;
  // register observer_r_sData
  assign observer_r_sData_D_IN = observe_SData ;
  assign observer_r_sData_EN = 1'd1 ;
  // register observer_r_sFlag
  assign observer_r_sFlag_D_IN = observe_SFlag ;
  assign observer_r_sFlag_EN = 1'd1 ;
  // register observer_r_sResp
  assign observer_r_sResp_D_IN = observe_SResp ;
  assign observer_r_sResp_EN = 1'd1 ;
  // register observer_r_sRespD
  assign observer_r_sRespD_D_IN = observer_r_sResp ;
  assign observer_r_sRespD_EN = 1'd1 ;
  // register observer_r_sThreadBusy
  assign observer_r_sThreadBusy_D_IN = observe_SThreadBusy ;
  assign observer_r_sThreadBusy_EN = 1'd1 ;
  // register observer_readInFlight
  assign observer_readInFlight_D_IN =
	     WILL_FIRE_RL_observer_request_detected &&
	     observer_r_mCmd == 3'd2 ;
  assign observer_readInFlight_EN =
	     WILL_FIRE_RL_observer_request_detected ||
	     WILL_FIRE_RL_observer_response_detected ;
  // register pmsender_idx
  assign pmsender_idx_D_IN =
	     pmsender_idx_27_EQ_IF_pmsender_evF_first__28_B_ETC___d136 ?
	       3'd1 :
	       pmsender_idx + 3'd1 ;
  assign pmsender_idx_EN = WILL_FIRE_RL_pmsender_serialize_message ;
  // register pmsender_isHead
  assign pmsender_isHead_D_IN = 1'b0 ;
  assign pmsender_isHead_EN = 1'b0 ;
  // register pmsender_srcTag
  assign pmsender_srcTag_D_IN = pmsender_srcTag + 8'd1 ;
  assign pmsender_srcTag_EN =
	     WILL_FIRE_RL_pmsender_serialize_message &&
	     pmsender_idx_27_EQ_IF_pmsender_evF_first__28_B_ETC___d136 ;
  // register pmsender_wsiM_burstKind
  assign pmsender_wsiM_burstKind_D_IN =
	     (pmsender_wsiM_burstKind == 2'd0) ?
	       (pmsender_wsiM_reqFifo_q_0[56] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign pmsender_wsiM_burstKind_EN =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_deq &&
	     pmsender_wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     (pmsender_wsiM_burstKind == 2'd0 ||
	      (pmsender_wsiM_burstKind == 2'd1 ||
	       pmsender_wsiM_burstKind == 2'd2) &&
	      pmsender_wsiM_reqFifo_q_0[57]) ;
  // register pmsender_wsiM_errorSticky
  assign pmsender_wsiM_errorSticky_D_IN = 1'b0 ;
  assign pmsender_wsiM_errorSticky_EN = 1'b0 ;
  // register pmsender_wsiM_iMesgCount
  assign pmsender_wsiM_iMesgCount_D_IN = pmsender_wsiM_iMesgCount + 32'd1 ;
  assign pmsender_wsiM_iMesgCount_EN =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_deq &&
	     pmsender_wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     pmsender_wsiM_burstKind == 2'd2 &&
	     pmsender_wsiM_reqFifo_q_0[57] ;
  // register pmsender_wsiM_isReset_isInReset
  assign pmsender_wsiM_isReset_isInReset_D_IN = 1'd0 ;
  assign pmsender_wsiM_isReset_isInReset_EN =
	     pmsender_wsiM_isReset_isInReset ;
  // register pmsender_wsiM_operateD
  assign pmsender_wsiM_operateD_D_IN = 1'b1 ;
  assign pmsender_wsiM_operateD_EN = 1'd1 ;
  // register pmsender_wsiM_pMesgCount
  assign pmsender_wsiM_pMesgCount_D_IN = pmsender_wsiM_pMesgCount + 32'd1 ;
  assign pmsender_wsiM_pMesgCount_EN =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_deq &&
	     pmsender_wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     pmsender_wsiM_burstKind == 2'd1 &&
	     pmsender_wsiM_reqFifo_q_0[57] ;
  // register pmsender_wsiM_peerIsReady
  assign pmsender_wsiM_peerIsReady_D_IN = pmem_SReset_n ;
  assign pmsender_wsiM_peerIsReady_EN = 1'd1 ;
  // register pmsender_wsiM_reqFifo_cntr_r
  assign pmsender_wsiM_reqFifo_cntr_r_D_IN =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_decCtr ?
	       pmsender_wsiM_reqFifo_cntr_r_7_MINUS_1___d67 :
	       MUX_pmsender_wsiM_reqFifo_cntr_r_write_1__VAL_2 ;
  assign pmsender_wsiM_reqFifo_cntr_r_EN =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_decCtr ||
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_incCtr ;
  // register pmsender_wsiM_reqFifo_q_0
  always@(MUX_pmsender_wsiM_reqFifo_q_0_write_1__SEL_1 or
	  MUX_pmsender_wsiM_reqFifo_q_0_write_1__VAL_1 or
	  MUX_pmsender_wsiM_reqFifo_q_0_write_1__SEL_2 or
	  MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_2 or
	  WILL_FIRE_RL_pmsender_wsiM_reqFifo_decCtr or
	  pmsender_wsiM_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_pmsender_wsiM_reqFifo_q_0_write_1__SEL_1:
	  pmsender_wsiM_reqFifo_q_0_D_IN =
	      MUX_pmsender_wsiM_reqFifo_q_0_write_1__VAL_1;
      MUX_pmsender_wsiM_reqFifo_q_0_write_1__SEL_2:
	  pmsender_wsiM_reqFifo_q_0_D_IN =
	      MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_2;
      WILL_FIRE_RL_pmsender_wsiM_reqFifo_decCtr:
	  pmsender_wsiM_reqFifo_q_0_D_IN = pmsender_wsiM_reqFifo_q_1;
      default: pmsender_wsiM_reqFifo_q_0_D_IN =
		   61'h0AAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign pmsender_wsiM_reqFifo_q_0_EN =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_both && _dfoo3 ||
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_incCtr &&
	     pmsender_wsiM_reqFifo_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_decCtr ;
  // register pmsender_wsiM_reqFifo_q_1
  always@(MUX_pmsender_wsiM_reqFifo_q_1_write_1__SEL_1 or
	  MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_1 or
	  MUX_pmsender_wsiM_reqFifo_q_1_write_1__SEL_2 or
	  MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_2 or
	  WILL_FIRE_RL_pmsender_wsiM_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_pmsender_wsiM_reqFifo_q_1_write_1__SEL_1:
	  pmsender_wsiM_reqFifo_q_1_D_IN =
	      MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_1;
      MUX_pmsender_wsiM_reqFifo_q_1_write_1__SEL_2:
	  pmsender_wsiM_reqFifo_q_1_D_IN =
	      MUX_pmsender_wsiM_reqFifo_q_1_write_1__VAL_2;
      WILL_FIRE_RL_pmsender_wsiM_reqFifo_decCtr:
	  pmsender_wsiM_reqFifo_q_1_D_IN = 61'h00000AAAAAAAAA00;
      default: pmsender_wsiM_reqFifo_q_1_D_IN =
		   61'h0AAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign pmsender_wsiM_reqFifo_q_1_EN =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_both && _dfoo1 ||
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_incCtr &&
	     pmsender_wsiM_reqFifo_cntr_r == 2'd1 ||
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_decCtr ;
  // register pmsender_wsiM_sThreadBusy_d
  assign pmsender_wsiM_sThreadBusy_d_D_IN = pmem_SThreadBusy ;
  assign pmsender_wsiM_sThreadBusy_d_EN = 1'd1 ;
  // register pmsender_wsiM_statusR
  assign pmsender_wsiM_statusR_D_IN =
	     { pmsender_wsiM_isReset_isInReset,
	       !pmsender_wsiM_peerIsReady,
	       !pmsender_wsiM_operateD,
	       pmsender_wsiM_errorSticky,
	       pmsender_wsiM_burstKind != 2'd0,
	       pmsender_wsiM_sThreadBusy_d,
	       1'd0,
	       pmsender_wsiM_trafficSticky } ;
  assign pmsender_wsiM_statusR_EN = 1'd1 ;
  // register pmsender_wsiM_tBusyCount
  assign pmsender_wsiM_tBusyCount_D_IN = pmsender_wsiM_tBusyCount + 32'd1 ;
  assign pmsender_wsiM_tBusyCount_EN =
	     pmsender_wsiM_operateD && pmsender_wsiM_peerIsReady &&
	     pmsender_wsiM_sThreadBusy_d ;
  // register pmsender_wsiM_trafficSticky
  assign pmsender_wsiM_trafficSticky_D_IN = 1'd1 ;
  assign pmsender_wsiM_trafficSticky_EN =
	     WILL_FIRE_RL_pmsender_wsiM_reqFifo_deq &&
	     pmsender_wsiM_reqFifo_q_0[60:58] == 3'd1 ;
  // submodule observer_evF
  always@(MUX_observer_evF_enq_1__SEL_1 or
	  MUX_observer_evF_enq_1__VAL_1 or
	  MUX_observer_evF_enq_1__SEL_2 or
	  MUX_observer_evF_enq_1__VAL_2 or
	  WILL_FIRE_RL_observer_reset_changed or
	  MUX_observer_evF_enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_observer_evF_enq_1__SEL_1:
	  observer_evF_D_IN = MUX_observer_evF_enq_1__VAL_1;
      MUX_observer_evF_enq_1__SEL_2:
	  observer_evF_D_IN = MUX_observer_evF_enq_1__VAL_2;
      WILL_FIRE_RL_observer_reset_changed:
	  observer_evF_D_IN = MUX_observer_evF_enq_1__VAL_3;
      default: observer_evF_D_IN =
		   99'h2AAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign observer_evF_ENQ =
	     WILL_FIRE_RL_observer_response_detected &&
	     observer_r_sResp == 2'd1 ||
	     WILL_FIRE_RL_observer_request_detected &&
	     (observer_r_mCmd == 3'd1 || observer_r_mCmd == 3'd2) ||
	     WILL_FIRE_RL_observer_reset_changed ;
  assign observer_evF_DEQ = observer_evF_EMPTY_N && pmsender_evF_FULL_N ;
  assign observer_evF_CLR = 1'b0 ;
  // submodule pmsender_evF
  assign pmsender_evF_D_IN =
	     { CASE_observer_evFD_OUT_BITS_98_TO_96_0_observ_ETC__q7,
	       CASE_observer_evFD_OUT_BITS_98_TO_96_0_0xAAAA_ETC__q10 } ;
  assign pmsender_evF_ENQ = observer_evF_EMPTY_N && pmsender_evF_FULL_N ;
  assign pmsender_evF_DEQ =
	     WILL_FIRE_RL_pmsender_serialize_message &&
	     pmsender_idx_27_EQ_IF_pmsender_evF_first__28_B_ETC___d136 ;
  assign pmsender_evF_CLR = 1'b0 ;
  // remaining internal signals
  assign DONTCARE_CONCAT_IF_observer_evF_first__00_BITS_ETC___d588 =
	     { 24'hAAAAAA,
	       CASE_observer_evFD_OUT_BITS_71_TO_64_0_observ_ETC__q6,
	       observer_evF_D_OUT[63:0] } ;
  assign _dfoo1 =
	     pmsender_wsiM_reqFifo_cntr_r != 2'd2 ||
	     pmsender_wsiM_reqFifo_cntr_r_7_MINUS_1___d67 == 2'd1 ;
  assign _dfoo3 =
	     pmsender_wsiM_reqFifo_cntr_r != 2'd1 ||
	     pmsender_wsiM_reqFifo_cntr_r_7_MINUS_1___d67 == 2'd0 ;
  assign pmsender_idx_27_EQ_IF_pmsender_evF_first__28_B_ETC___d136 =
	     pmsender_idx == len__h4717 ;
  assign pmsender_wsiM_reqFifo_cntr_r_7_MINUS_1___d67 =
	     pmsender_wsiM_reqFifo_cntr_r - 2'd1 ;
  assign x_burstLength__h4785 = { 9'd0, len__h4717 } ;
  always@(pmsender_evF_D_OUT)
  begin
    case (pmsender_evF_D_OUT[98:96])
      3'd0: len__h4717 = 3'd1;
      3'd1: len__h4717 = 3'd2;
      3'd2: len__h4717 = 3'd3;
      default: len__h4717 = 3'd7;
    endcase
  end
  always@(pmsender_evF_D_OUT)
  begin
    case (pmsender_evF_D_OUT[98:96])
      3'd0: x__h5780 = 8'd1;
      3'd1: x__h5780 = 8'd2;
      3'd2: x__h5780 = 8'd3;
      3'd3: x__h5780 = 8'd4;
      3'd4: x__h5780 = 8'd5;
      default: x__h5780 = 8'd6;
    endcase
  end
  always@(pmsender_evF_D_OUT)
  begin
    case (pmsender_evF_D_OUT[71:64])
      8'd0: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd0;
      8'd1: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd1;
      8'd2: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd2;
      8'd3: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd3;
      8'd4: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd4;
      8'd5: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd5;
      8'd6: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd6;
      8'd7: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd7;
      8'd8: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd8;
      8'd9: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd9;
      8'd10: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd10;
      8'd11: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd11;
      8'd12: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd12;
      8'd13: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd13;
      8'd14: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd14;
      8'd16: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd15;
      8'd32: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd16;
      8'd48: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd17;
      8'd64: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd18;
      8'd80: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd19;
      8'd96: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd20;
      8'd97: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd21;
      8'd128: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd22;
      8'd144: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd23;
      8'd160: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd24;
      8'd176: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd25;
      8'd192: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd26;
      8'd208: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd27;
      default: CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 = 5'd28;
    endcase
  end
  always@(pmsender_evF_D_OUT)
  begin
    case (pmsender_evF_D_OUT[7:0])
      8'd0: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd0;
      8'd1: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd1;
      8'd2: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd2;
      8'd3: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd3;
      8'd4: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd4;
      8'd5: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd5;
      8'd6: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd6;
      8'd7: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd7;
      8'd8: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd8;
      8'd9: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd9;
      8'd10: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd10;
      8'd11: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd11;
      8'd12: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd12;
      8'd13: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd13;
      8'd14: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd14;
      8'd16: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd15;
      8'd32: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd16;
      8'd48: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd17;
      8'd64: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd18;
      8'd80: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd19;
      8'd96: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd20;
      8'd97: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd21;
      8'd128: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd22;
      8'd144: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd23;
      8'd160: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd24;
      8'd176: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd25;
      8'd192: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd26;
      8'd208: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd27;
      default: CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 = 5'd28;
    endcase
  end
  always@(pmsender_evF_D_OUT)
  begin
    case (pmsender_evF_D_OUT[39:32])
      8'd0: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd0;
      8'd1: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd1;
      8'd2: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd2;
      8'd3: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd3;
      8'd4: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd4;
      8'd5: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd5;
      8'd6: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd6;
      8'd7: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd7;
      8'd8: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd8;
      8'd9: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd9;
      8'd10: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd10;
      8'd11: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd11;
      8'd12: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd12;
      8'd13: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd13;
      8'd14: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd14;
      8'd16: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd15;
      8'd32: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd16;
      8'd48: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd17;
      8'd64: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd18;
      8'd80: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd19;
      8'd96: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd20;
      8'd97: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd21;
      8'd128: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd22;
      8'd144: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd23;
      8'd160: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd24;
      8'd176: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd25;
      8'd192: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd26;
      8'd208: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd27;
      default: CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3 = 5'd28;
    endcase
  end
  always@(pmsender_evF_D_OUT or
	  CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1 or
	  CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2 or
	  CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3)
  begin
    case (pmsender_evF_D_OUT[98:96])
      3'd0:
	  CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CASE_p_ETC__q4 =
	      CASE_pmsender_evFD_OUT_BITS_7_TO_0_0_0_1_1_2__ETC__q2;
      3'd1:
	  CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CASE_p_ETC__q4 =
	      CASE_pmsender_evFD_OUT_BITS_39_TO_32_0_0_1_1__ETC__q3;
      default: CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CASE_p_ETC__q4 =
		   CASE_pmsender_evFD_OUT_BITS_71_TO_64_0_0_1_1__ETC__q1;
    endcase
  end
  always@(CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CASE_p_ETC__q4)
  begin
    case (CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CASE_p_ETC__q4)
      5'd0: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd0;
      5'd1: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd1;
      5'd2: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd2;
      5'd3: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd3;
      5'd4: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd4;
      5'd5: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd5;
      5'd6: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd6;
      5'd7: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd7;
      5'd8: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd8;
      5'd9: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd9;
      5'd10: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd10;
      5'd11: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd11;
      5'd12: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd12;
      5'd13: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd13;
      5'd14: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd14;
      5'd15: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd16;
      5'd16: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd32;
      5'd17: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd48;
      5'd18: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd64;
      5'd19: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd80;
      5'd20: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd96;
      5'd21: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd97;
      5'd22: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd128;
      5'd23: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd144;
      5'd24: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd160;
      5'd25: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd176;
      5'd26: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd192;
      5'd27: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 = 8'd208;
      default: CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 =
		   8'd255;
    endcase
  end
  always@(pmsender_idx or
	  pmsender_evF_D_OUT or
	  monId or
	  CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5 or
	  pmsender_srcTag or x__h5780)
  begin
    case (pmsender_idx)
      3'd1:
	  x_data__h4786 =
	      { monId,
		CASE_CASE_pmsender_evFD_OUT_BITS_98_TO_96_0_CA_ETC__q5,
		pmsender_srcTag,
		x__h5780 };
      3'd2:
	  x_data__h4786 =
	      (pmsender_evF_D_OUT[98:96] == 3'd1) ?
		pmsender_evF_D_OUT[31:0] :
		pmsender_evF_D_OUT[63:32];
      default: x_data__h4786 = pmsender_evF_D_OUT[31:0];
    endcase
  end
  always@(observer_evF_D_OUT)
  begin
    case (observer_evF_D_OUT[71:64])
      8'd0,
      8'd1,
      8'd2,
      8'd3,
      8'd4,
      8'd5,
      8'd6,
      8'd7,
      8'd8,
      8'd9,
      8'd10,
      8'd11,
      8'd12,
      8'd13,
      8'd14,
      8'd16,
      8'd32,
      8'd48,
      8'd64,
      8'd80,
      8'd96,
      8'd97,
      8'd128,
      8'd144,
      8'd160,
      8'd176,
      8'd192,
      8'd208:
	  CASE_observer_evFD_OUT_BITS_71_TO_64_0_observ_ETC__q6 =
	      observer_evF_D_OUT[71:64];
      default: CASE_observer_evFD_OUT_BITS_71_TO_64_0_observ_ETC__q6 = 8'd255;
    endcase
  end
  always@(observer_evF_D_OUT)
  begin
    case (observer_evF_D_OUT[98:96])
      3'd0, 3'd1, 3'd2, 3'd3, 3'd4:
	  CASE_observer_evFD_OUT_BITS_98_TO_96_0_observ_ETC__q7 =
	      observer_evF_D_OUT[98:96];
      default: CASE_observer_evFD_OUT_BITS_98_TO_96_0_observ_ETC__q7 = 3'd5;
    endcase
  end
  always@(observer_evF_D_OUT)
  begin
    case (observer_evF_D_OUT[7:0])
      8'd0,
      8'd1,
      8'd2,
      8'd3,
      8'd4,
      8'd5,
      8'd6,
      8'd7,
      8'd8,
      8'd9,
      8'd10,
      8'd11,
      8'd12,
      8'd13,
      8'd14,
      8'd16,
      8'd32,
      8'd48,
      8'd64,
      8'd80,
      8'd96,
      8'd97,
      8'd128,
      8'd144,
      8'd160,
      8'd176,
      8'd192,
      8'd208:
	  CASE_observer_evFD_OUT_BITS_7_TO_0_0_observer_ETC__q8 =
	      observer_evF_D_OUT[7:0];
      default: CASE_observer_evFD_OUT_BITS_7_TO_0_0_observer_ETC__q8 = 8'd255;
    endcase
  end
  always@(observer_evF_D_OUT)
  begin
    case (observer_evF_D_OUT[39:32])
      8'd0,
      8'd1,
      8'd2,
      8'd3,
      8'd4,
      8'd5,
      8'd6,
      8'd7,
      8'd8,
      8'd9,
      8'd10,
      8'd11,
      8'd12,
      8'd13,
      8'd14,
      8'd16,
      8'd32,
      8'd48,
      8'd64,
      8'd80,
      8'd96,
      8'd97,
      8'd128,
      8'd144,
      8'd160,
      8'd176,
      8'd192,
      8'd208:
	  CASE_observer_evFD_OUT_BITS_39_TO_32_0_observ_ETC__q9 =
	      observer_evF_D_OUT[39:32];
      default: CASE_observer_evFD_OUT_BITS_39_TO_32_0_observ_ETC__q9 = 8'd255;
    endcase
  end
  always@(observer_evF_D_OUT or
	  CASE_observer_evFD_OUT_BITS_7_TO_0_0_observer_ETC__q8 or
	  CASE_observer_evFD_OUT_BITS_39_TO_32_0_observ_ETC__q9 or
	  DONTCARE_CONCAT_IF_observer_evF_first__00_BITS_ETC___d588)
  begin
    case (observer_evF_D_OUT[98:96])
      3'd0:
	  CASE_observer_evFD_OUT_BITS_98_TO_96_0_0xAAAA_ETC__q10 =
	      { 88'hAAAAAAAAAAAAAAAAAAAAAA,
		CASE_observer_evFD_OUT_BITS_7_TO_0_0_observer_ETC__q8 };
      3'd1:
	  CASE_observer_evFD_OUT_BITS_98_TO_96_0_0xAAAA_ETC__q10 =
	      { 56'hAAAAAAAAAAAAAA,
		CASE_observer_evFD_OUT_BITS_39_TO_32_0_observ_ETC__q9,
		observer_evF_D_OUT[31:0] };
      3'd2, 3'd3:
	  CASE_observer_evFD_OUT_BITS_98_TO_96_0_0xAAAA_ETC__q10 =
	      DONTCARE_CONCAT_IF_observer_evF_first__00_BITS_ETC___d588;
      default: CASE_observer_evFD_OUT_BITS_98_TO_96_0_0xAAAA_ETC__q10 =
		   observer_evF_D_OUT[95:0];
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        observer_r_mAddr <= `BSV_ASSIGNMENT_DELAY 32'd0;
	observer_r_mAddrSpace <= `BSV_ASSIGNMENT_DELAY 1'd0;
	observer_r_mByteEn <= `BSV_ASSIGNMENT_DELAY 4'd0;
	observer_r_mCmd <= `BSV_ASSIGNMENT_DELAY 3'd0;
	observer_r_mCmdD <= `BSV_ASSIGNMENT_DELAY 3'd0;
	observer_r_mData <= `BSV_ASSIGNMENT_DELAY 32'd0;
	observer_r_mFlag <= `BSV_ASSIGNMENT_DELAY 2'd0;
	observer_r_mResetn <= `BSV_ASSIGNMENT_DELAY 1'd0;
	observer_r_mResetnD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	observer_r_sData <= `BSV_ASSIGNMENT_DELAY 32'd0;
	observer_r_sFlag <= `BSV_ASSIGNMENT_DELAY 2'd0;
	observer_r_sResp <= `BSV_ASSIGNMENT_DELAY 2'd0;
	observer_r_sRespD <= `BSV_ASSIGNMENT_DELAY 2'd0;
	observer_r_sThreadBusy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	observer_readInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pmsender_idx <= `BSV_ASSIGNMENT_DELAY 3'd1;
	pmsender_isHead <= `BSV_ASSIGNMENT_DELAY 1'd1;
	pmsender_srcTag <= `BSV_ASSIGNMENT_DELAY 8'd0;
	pmsender_wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	pmsender_wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pmsender_wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	pmsender_wsiM_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pmsender_wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	pmsender_wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pmsender_wsiM_reqFifo_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	pmsender_wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY
	    61'h00000AAAAAAAAA00;
	pmsender_wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY
	    61'h00000AAAAAAAAA00;
	pmsender_wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	pmsender_wsiM_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	pmsender_wsiM_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (observer_r_mAddr_EN)
	  observer_r_mAddr <= `BSV_ASSIGNMENT_DELAY observer_r_mAddr_D_IN;
	if (observer_r_mAddrSpace_EN)
	  observer_r_mAddrSpace <= `BSV_ASSIGNMENT_DELAY
	      observer_r_mAddrSpace_D_IN;
	if (observer_r_mByteEn_EN)
	  observer_r_mByteEn <= `BSV_ASSIGNMENT_DELAY observer_r_mByteEn_D_IN;
	if (observer_r_mCmd_EN)
	  observer_r_mCmd <= `BSV_ASSIGNMENT_DELAY observer_r_mCmd_D_IN;
	if (observer_r_mCmdD_EN)
	  observer_r_mCmdD <= `BSV_ASSIGNMENT_DELAY observer_r_mCmdD_D_IN;
	if (observer_r_mData_EN)
	  observer_r_mData <= `BSV_ASSIGNMENT_DELAY observer_r_mData_D_IN;
	if (observer_r_mFlag_EN)
	  observer_r_mFlag <= `BSV_ASSIGNMENT_DELAY observer_r_mFlag_D_IN;
	if (observer_r_mResetn_EN)
	  observer_r_mResetn <= `BSV_ASSIGNMENT_DELAY observer_r_mResetn_D_IN;
	if (observer_r_mResetnD_EN)
	  observer_r_mResetnD <= `BSV_ASSIGNMENT_DELAY
	      observer_r_mResetnD_D_IN;
	if (observer_r_sData_EN)
	  observer_r_sData <= `BSV_ASSIGNMENT_DELAY observer_r_sData_D_IN;
	if (observer_r_sFlag_EN)
	  observer_r_sFlag <= `BSV_ASSIGNMENT_DELAY observer_r_sFlag_D_IN;
	if (observer_r_sResp_EN)
	  observer_r_sResp <= `BSV_ASSIGNMENT_DELAY observer_r_sResp_D_IN;
	if (observer_r_sRespD_EN)
	  observer_r_sRespD <= `BSV_ASSIGNMENT_DELAY observer_r_sRespD_D_IN;
	if (observer_r_sThreadBusy_EN)
	  observer_r_sThreadBusy <= `BSV_ASSIGNMENT_DELAY
	      observer_r_sThreadBusy_D_IN;
	if (observer_readInFlight_EN)
	  observer_readInFlight <= `BSV_ASSIGNMENT_DELAY
	      observer_readInFlight_D_IN;
	if (pmsender_idx_EN)
	  pmsender_idx <= `BSV_ASSIGNMENT_DELAY pmsender_idx_D_IN;
	if (pmsender_isHead_EN)
	  pmsender_isHead <= `BSV_ASSIGNMENT_DELAY pmsender_isHead_D_IN;
	if (pmsender_srcTag_EN)
	  pmsender_srcTag <= `BSV_ASSIGNMENT_DELAY pmsender_srcTag_D_IN;
	if (pmsender_wsiM_burstKind_EN)
	  pmsender_wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_burstKind_D_IN;
	if (pmsender_wsiM_errorSticky_EN)
	  pmsender_wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_errorSticky_D_IN;
	if (pmsender_wsiM_iMesgCount_EN)
	  pmsender_wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_iMesgCount_D_IN;
	if (pmsender_wsiM_operateD_EN)
	  pmsender_wsiM_operateD <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_operateD_D_IN;
	if (pmsender_wsiM_pMesgCount_EN)
	  pmsender_wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_pMesgCount_D_IN;
	if (pmsender_wsiM_peerIsReady_EN)
	  pmsender_wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_peerIsReady_D_IN;
	if (pmsender_wsiM_reqFifo_cntr_r_EN)
	  pmsender_wsiM_reqFifo_cntr_r <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_reqFifo_cntr_r_D_IN;
	if (pmsender_wsiM_reqFifo_q_0_EN)
	  pmsender_wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_reqFifo_q_0_D_IN;
	if (pmsender_wsiM_reqFifo_q_1_EN)
	  pmsender_wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_reqFifo_q_1_D_IN;
	if (pmsender_wsiM_sThreadBusy_d_EN)
	  pmsender_wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_sThreadBusy_d_D_IN;
	if (pmsender_wsiM_tBusyCount_EN)
	  pmsender_wsiM_tBusyCount <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_tBusyCount_D_IN;
	if (pmsender_wsiM_trafficSticky_EN)
	  pmsender_wsiM_trafficSticky <= `BSV_ASSIGNMENT_DELAY
	      pmsender_wsiM_trafficSticky_D_IN;
      end
    if (pmsender_wsiM_statusR_EN)
      pmsender_wsiM_statusR <= `BSV_ASSIGNMENT_DELAY
	  pmsender_wsiM_statusR_D_IN;
  end
  always@(posedge CLK or `BSV_RESET_EDGE RST_N)
  if (RST_N == `BSV_RESET_VALUE)
    begin
      pmsender_wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (pmsender_wsiM_isReset_isInReset_EN)
	pmsender_wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    pmsender_wsiM_isReset_isInReset_D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    observer_r_mAddr = 32'hAAAAAAAA;
    observer_r_mAddrSpace = 1'h0;
    observer_r_mByteEn = 4'hA;
    observer_r_mCmd = 3'h2;
    observer_r_mCmdD = 3'h2;
    observer_r_mData = 32'hAAAAAAAA;
    observer_r_mFlag = 2'h2;
    observer_r_mResetn = 1'h0;
    observer_r_mResetnD = 1'h0;
    observer_r_sData = 32'hAAAAAAAA;
    observer_r_sFlag = 2'h2;
    observer_r_sResp = 2'h2;
    observer_r_sRespD = 2'h2;
    observer_r_sThreadBusy = 1'h0;
    observer_readInFlight = 1'h0;
    pmsender_idx = 3'h2;
    pmsender_isHead = 1'h0;
    pmsender_srcTag = 8'hAA;
    pmsender_wsiM_burstKind = 2'h2;
    pmsender_wsiM_errorSticky = 1'h0;
    pmsender_wsiM_iMesgCount = 32'hAAAAAAAA;
    pmsender_wsiM_isReset_isInReset = 1'h0;
    pmsender_wsiM_operateD = 1'h0;
    pmsender_wsiM_pMesgCount = 32'hAAAAAAAA;
    pmsender_wsiM_peerIsReady = 1'h0;
    pmsender_wsiM_reqFifo_cntr_r = 2'h2;
    pmsender_wsiM_reqFifo_q_0 = 61'h0AAAAAAAAAAAAAAA;
    pmsender_wsiM_reqFifo_q_1 = 61'h0AAAAAAAAAAAAAAA;
    pmsender_wsiM_sThreadBusy_d = 1'h0;
    pmsender_wsiM_statusR = 8'hAA;
    pmsender_wsiM_tBusyCount = 32'hAAAAAAAA;
    pmsender_wsiM_trafficSticky = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_observer_reset_changed && observer_r_mResetn)
	begin
	  v__h1590 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_observer_reset_changed && observer_r_mResetn)
	$display("[%0d]: %m: WCI reset DE-ASSERTED", v__h1590);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_observer_reset_changed && !observer_r_mResetn)
	begin
	  v__h1613 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_observer_reset_changed && !observer_r_mResetn)
	$display("[%0d]: %m: WCI reset IS-ASSERTED", v__h1613);
  end
  // synopsys translate_on
endmodule