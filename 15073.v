module outputs
  wire [63 : 0] word_fst;
  wire [4 : 0] word_snd;
  wire RDY_set_verbosity, valid;
  // inlined wires
  reg [68 : 0] dw_result$wget;
  wire dw_valid$wget, dw_valid$whas;
  // register cfg_verbosity
  reg [3 : 0] cfg_verbosity;
  wire [3 : 0] cfg_verbosity$D_IN;
  wire cfg_verbosity$EN;
  // register requestR
  reg [214 : 0] requestR;
  wire [214 : 0] requestR$D_IN;
  wire requestR$EN;
  // register resultR
  reg [69 : 0] resultR;
  reg [69 : 0] resultR$D_IN;
  wire resultR$EN;
  // register stateR
  reg [1 : 0] stateR;
  reg [1 : 0] stateR$D_IN;
  wire stateR$EN;
  // ports of submodule fpu
  reg [201 : 0] fpu$request_put;
  wire [69 : 0] fpu$response_get;
  wire fpu$EN_request_put,
       fpu$EN_response_get,
       fpu$RDY_request_put,
       fpu$RDY_response_get;
  // ports of submodule frmFpuF
  wire frmFpuF$CLR, frmFpuF$DEQ, frmFpuF$D_IN, frmFpuF$ENQ;
  // rule scheduling signals
  wire CAN_FIRE_RL_doFADD_D,
       CAN_FIRE_RL_doFADD_S,
       CAN_FIRE_RL_doFCLASS_D,
       CAN_FIRE_RL_doFCLASS_S,
       CAN_FIRE_RL_doFCVT_D_S,
       CAN_FIRE_RL_doFCVT_D_W,
       CAN_FIRE_RL_doFCVT_D_WU,
       CAN_FIRE_RL_doFCVT_S_D,
       CAN_FIRE_RL_doFCVT_S_W,
       CAN_FIRE_RL_doFCVT_S_WU,
       CAN_FIRE_RL_doFCVT_WU_D,
       CAN_FIRE_RL_doFCVT_WU_S,
       CAN_FIRE_RL_doFCVT_W_D,
       CAN_FIRE_RL_doFCVT_W_S,
       CAN_FIRE_RL_doFEQ_D,
       CAN_FIRE_RL_doFEQ_S,
       CAN_FIRE_RL_doFLE_D,
       CAN_FIRE_RL_doFLE_S,
       CAN_FIRE_RL_doFLT_D,
       CAN_FIRE_RL_doFLT_S,
       CAN_FIRE_RL_doFMADD_D,
       CAN_FIRE_RL_doFMADD_S,
       CAN_FIRE_RL_doFMAX_D,
       CAN_FIRE_RL_doFMAX_S,
       CAN_FIRE_RL_doFMIN_D,
       CAN_FIRE_RL_doFMIN_S,
       CAN_FIRE_RL_doFMSUB_D,
       CAN_FIRE_RL_doFMSUB_S,
       CAN_FIRE_RL_doFMUL_D,
       CAN_FIRE_RL_doFMUL_S,
       CAN_FIRE_RL_doFMV_D_X,
       CAN_FIRE_RL_doFMV_W_X,
       CAN_FIRE_RL_doFMV_X_D,
       CAN_FIRE_RL_doFMV_X_W,
       CAN_FIRE_RL_doFNMADD_D,
       CAN_FIRE_RL_doFNMADD_S,
       CAN_FIRE_RL_doFNMSUB_D,
       CAN_FIRE_RL_doFNMSUB_S,
       CAN_FIRE_RL_doFSGNJN_D,
       CAN_FIRE_RL_doFSGNJN_S,
       CAN_FIRE_RL_doFSGNJX_D,
       CAN_FIRE_RL_doFSGNJX_S,
       CAN_FIRE_RL_doFSGNJ_D,
       CAN_FIRE_RL_doFSGNJ_S,
       CAN_FIRE_RL_doFSUB_D,
       CAN_FIRE_RL_doFSUB_S,
       CAN_FIRE_RL_rl_drive_fpu_result,
       CAN_FIRE_RL_rl_get_fpu_result,
       CAN_FIRE_req,
       CAN_FIRE_set_verbosity,
       WILL_FIRE_RL_doFADD_D,
       WILL_FIRE_RL_doFADD_S,
       WILL_FIRE_RL_doFCLASS_D,
       WILL_FIRE_RL_doFCLASS_S,
       WILL_FIRE_RL_doFCVT_D_S,
       WILL_FIRE_RL_doFCVT_D_W,
       WILL_FIRE_RL_doFCVT_D_WU,
       WILL_FIRE_RL_doFCVT_S_D,
       WILL_FIRE_RL_doFCVT_S_W,
       WILL_FIRE_RL_doFCVT_S_WU,
       WILL_FIRE_RL_doFCVT_WU_D,
       WILL_FIRE_RL_doFCVT_WU_S,
       WILL_FIRE_RL_doFCVT_W_D,
       WILL_FIRE_RL_doFCVT_W_S,
       WILL_FIRE_RL_doFEQ_D,
       WILL_FIRE_RL_doFEQ_S,
       WILL_FIRE_RL_doFLE_D,
       WILL_FIRE_RL_doFLE_S,
       WILL_FIRE_RL_doFLT_D,
       WILL_FIRE_RL_doFLT_S,
       WILL_FIRE_RL_doFMADD_D,
       WILL_FIRE_RL_doFMADD_S,
       WILL_FIRE_RL_doFMAX_D,
       WILL_FIRE_RL_doFMAX_S,
       WILL_FIRE_RL_doFMIN_D,
       WILL_FIRE_RL_doFMIN_S,
       WILL_FIRE_RL_doFMSUB_D,
       WILL_FIRE_RL_doFMSUB_S,
       WILL_FIRE_RL_doFMUL_D,
       WILL_FIRE_RL_doFMUL_S,
       WILL_FIRE_RL_doFMV_D_X,
       WILL_FIRE_RL_doFMV_W_X,
       WILL_FIRE_RL_doFMV_X_D,
       WILL_FIRE_RL_doFMV_X_W,
       WILL_FIRE_RL_doFNMADD_D,
       WILL_FIRE_RL_doFNMADD_S,
       WILL_FIRE_RL_doFNMSUB_D,
       WILL_FIRE_RL_doFNMSUB_S,
       WILL_FIRE_RL_doFSGNJN_D,
       WILL_FIRE_RL_doFSGNJN_S,
       WILL_FIRE_RL_doFSGNJX_D,
       WILL_FIRE_RL_doFSGNJX_S,
       WILL_FIRE_RL_doFSGNJ_D,
       WILL_FIRE_RL_doFSGNJ_S,
       WILL_FIRE_RL_doFSUB_D,
       WILL_FIRE_RL_doFSUB_S,
       WILL_FIRE_RL_rl_drive_fpu_result,
       WILL_FIRE_RL_rl_get_fpu_result,
       WILL_FIRE_req,
       WILL_FIRE_set_verbosity;
  // inputs to muxes for submodule ports
  wire [201 : 0] MUX_fpu$request_put_1__VAL_1,
		 MUX_fpu$request_put_1__VAL_10,
		 MUX_fpu$request_put_1__VAL_11,
		 MUX_fpu$request_put_1__VAL_12,
		 MUX_fpu$request_put_1__VAL_13,
		 MUX_fpu$request_put_1__VAL_14,
		 MUX_fpu$request_put_1__VAL_2,
		 MUX_fpu$request_put_1__VAL_3,
		 MUX_fpu$request_put_1__VAL_4,
		 MUX_fpu$request_put_1__VAL_5,
		 MUX_fpu$request_put_1__VAL_6,
		 MUX_fpu$request_put_1__VAL_7,
		 MUX_fpu$request_put_1__VAL_8,
		 MUX_fpu$request_put_1__VAL_9;
  wire [69 : 0] MUX_resultR$write_1__VAL_10,
		MUX_resultR$write_1__VAL_11,
		MUX_resultR$write_1__VAL_12,
		MUX_resultR$write_1__VAL_13,
		MUX_resultR$write_1__VAL_14,
		MUX_resultR$write_1__VAL_15,
		MUX_resultR$write_1__VAL_16,
		MUX_resultR$write_1__VAL_17,
		MUX_resultR$write_1__VAL_18,
		MUX_resultR$write_1__VAL_19,
		MUX_resultR$write_1__VAL_2,
		MUX_resultR$write_1__VAL_20,
		MUX_resultR$write_1__VAL_21,
		MUX_resultR$write_1__VAL_22,
		MUX_resultR$write_1__VAL_23,
		MUX_resultR$write_1__VAL_24,
		MUX_resultR$write_1__VAL_25,
		MUX_resultR$write_1__VAL_26,
		MUX_resultR$write_1__VAL_27,
		MUX_resultR$write_1__VAL_28,
		MUX_resultR$write_1__VAL_29,
		MUX_resultR$write_1__VAL_3,
		MUX_resultR$write_1__VAL_30,
		MUX_resultR$write_1__VAL_31,
		MUX_resultR$write_1__VAL_32,
		MUX_resultR$write_1__VAL_33,
		MUX_resultR$write_1__VAL_34,
		MUX_resultR$write_1__VAL_4,
		MUX_resultR$write_1__VAL_6,
		MUX_resultR$write_1__VAL_7,
		MUX_resultR$write_1__VAL_8,
		MUX_resultR$write_1__VAL_9;
  wire [68 : 0] MUX_dw_result$wset_1__VAL_1,
		MUX_dw_result$wset_1__VAL_10,
		MUX_dw_result$wset_1__VAL_11,
		MUX_dw_result$wset_1__VAL_12,
		MUX_dw_result$wset_1__VAL_13,
		MUX_dw_result$wset_1__VAL_14,
		MUX_dw_result$wset_1__VAL_15,
		MUX_dw_result$wset_1__VAL_16,
		MUX_dw_result$wset_1__VAL_17,
		MUX_dw_result$wset_1__VAL_18,
		MUX_dw_result$wset_1__VAL_19,
		MUX_dw_result$wset_1__VAL_2,
		MUX_dw_result$wset_1__VAL_20,
		MUX_dw_result$wset_1__VAL_21,
		MUX_dw_result$wset_1__VAL_22,
		MUX_dw_result$wset_1__VAL_23,
		MUX_dw_result$wset_1__VAL_24,
		MUX_dw_result$wset_1__VAL_25,
		MUX_dw_result$wset_1__VAL_26,
		MUX_dw_result$wset_1__VAL_27,
		MUX_dw_result$wset_1__VAL_28,
		MUX_dw_result$wset_1__VAL_29,
		MUX_dw_result$wset_1__VAL_3,
		MUX_dw_result$wset_1__VAL_30,
		MUX_dw_result$wset_1__VAL_31,
		MUX_dw_result$wset_1__VAL_32,
		MUX_dw_result$wset_1__VAL_4,
		MUX_dw_result$wset_1__VAL_5,
		MUX_dw_result$wset_1__VAL_6,
		MUX_dw_result$wset_1__VAL_7,
		MUX_dw_result$wset_1__VAL_8,
		MUX_dw_result$wset_1__VAL_9;
  wire MUX_dw_result$wset_1__SEL_1,
       MUX_dw_result$wset_1__SEL_2,
       MUX_dw_result$wset_1__SEL_30;
  // remaining internal signals
  reg [51 : 0] CASE_guard11304_0b0_theResult___snd19216_BITS__ETC__q114,
	       CASE_guard11304_0b0_theResult___snd19216_BITS__ETC__q115,
	       CASE_guard20612_0b0_sfdin28832_BITS_56_TO_5_0b_ETC__q116,
	       CASE_guard20612_0b0_sfdin28832_BITS_56_TO_5_0b_ETC__q117,
	       CASE_guard29679_0b0_theResult___snd37615_BITS__ETC__q118,
	       CASE_guard29679_0b0_theResult___snd37615_BITS__ETC__q119,
	       CASE_guard5468_0b0_sfd___35458_BITS_54_TO_3_0b_ETC__q56,
	       CASE_guard5468_0b0_sfd___35458_BITS_54_TO_3_0b_ETC__q57,
	       CASE_guard5772_0b0_sfd___35762_BITS_54_TO_3_0b_ETC__q45,
	       CASE_guard5772_0b0_sfd___35762_BITS_54_TO_3_0b_ETC__q46,
	       CASE_guard6197_0b0_sfd___35458_BITS_53_TO_2_0b_ETC__q54,
	       CASE_guard6197_0b0_sfd___35458_BITS_53_TO_2_0b_ETC__q55,
	       CASE_guard6502_0b0_sfd___35762_BITS_53_TO_2_0b_ETC__q41,
	       CASE_guard6502_0b0_sfd___35762_BITS_53_TO_2_0b_ETC__q42,
	       CASE_requestR_BITS_194_TO_192_0x1_450359962737_ETC__q5,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1362,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1380,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1548,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1563,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3561,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3588,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3607;
  reg [22 : 0] CASE_guard0288_0b0_theResult___snd8287_BITS_56_ETC__q80,
	       CASE_guard0288_0b0_theResult___snd8287_BITS_56_ETC__q81,
	       CASE_guard136_0b0_sfd___3126_BITS_31_TO_9_0b1__ETC__q16,
	       CASE_guard136_0b0_sfd___3126_BITS_31_TO_9_0b1__ETC__q17,
	       CASE_guard1553_0b0_sfdin9644_BITS_56_TO_34_0b1_ETC__q78,
	       CASE_guard1553_0b0_sfdin9644_BITS_56_TO_34_0b1_ETC__q79,
	       CASE_guard3313_0b0_sfd___33303_BITS_31_TO_9_0b_ETC__q29,
	       CASE_guard3313_0b0_sfd___33303_BITS_31_TO_9_0b_ETC__q30,
	       CASE_guard3839_0b0_sfd___33303_BITS_30_TO_8_0b_ETC__q27,
	       CASE_guard3839_0b0_sfd___33303_BITS_30_TO_8_0b_ETC__q28,
	       CASE_guard666_0b0_sfd___3126_BITS_30_TO_8_0b1__ETC__q18,
	       CASE_guard666_0b0_sfd___3126_BITS_30_TO_8_0b1__ETC__q19,
	       CASE_guard8141_0b0_theResult___snd6164_BITS_56_ETC__q84,
	       CASE_guard8141_0b0_theResult___snd6164_BITS_56_ETC__q85,
	       CASE_guard9277_0b0_sfdin7497_BITS_56_TO_34_0b1_ETC__q82,
	       CASE_guard9277_0b0_sfdin7497_BITS_56_TO_34_0b1_ETC__q83,
	       CASE_requestR_BITS_194_TO_192_0x1_8388607_0x2__ETC__q3,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2726,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2745,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2772,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2791,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d402,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d420,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d720,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d735;
  reg [10 : 0] CASE_guard11304_0b0_theResult___fst_exp19265_0_ETC__q102,
	       CASE_guard11304_0b0_theResult___fst_exp19265_0_ETC__q103,
	       CASE_guard20612_0b0_theResult___fst_exp28838_0_ETC__q104,
	       CASE_guard20612_0b0_theResult___fst_exp28838_0_ETC__q105,
	       CASE_guard29679_0b0_theResult___fst_exp37669_0_ETC__q106,
	       CASE_guard29679_0b0_theResult___fst_exp37669_0_ETC__q107,
	       CASE_guard5468_0b0_0_0b1_0_0b10_out_exp6087_0b_ETC__q49,
	       CASE_guard5468_0b0_0_0b1_theResult___exp6084_0_ETC__q50,
	       CASE_guard5772_0b0_0_0b1_0_0b10_out_exp6391_0b_ETC__q44,
	       CASE_guard5772_0b0_0_0b1_theResult___exp6388_0_ETC__q43,
	       CASE_guard6197_0b0_x6212_BITS_10_TO_0_0b1_theR_ETC__q52,
	       CASE_guard6197_0b0_x6212_BITS_10_TO_0_0b1_x621_ETC__q53,
	       CASE_guard6502_0b0_x6517_BITS_10_TO_0_0b1_theR_ETC__q39,
	       CASE_guard6502_0b0_x6517_BITS_10_TO_0_0b1_x651_ETC__q40,
	       CASE_requestR_BITS_194_TO_192_0x1_2046_0x2_IF__ETC__q4,
	       CASE_requestR_BITS_194_TO_192_0x3_IF_guard5468_ETC__q51,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1310,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1339,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1526,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3134,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3459,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3528;
  reg [7 : 0] CASE_guard0288_0b0_theResult___fst_exp8336_0b1_ETC__q72,
	      CASE_guard0288_0b0_theResult___fst_exp8336_0b1_ETC__q73,
	      CASE_guard136_0b0_0_0b1_0_0b10_out_exp555_0b11_ETC__q13,
	      CASE_guard136_0b0_0_0b1_theResult___exp552_0b1_ETC__q12,
	      CASE_guard1553_0b0_theResult___fst_exp9650_0b1_ETC__q70,
	      CASE_guard1553_0b0_theResult___fst_exp9650_0b1_ETC__q71,
	      CASE_guard3313_0b0_0_0b1_0_0b10_out_exp3729_0b_ETC__q22,
	      CASE_guard3313_0b0_0_0b1_theResult___exp3726_0_ETC__q23,
	      CASE_guard3839_0b0_x3854_BITS_7_TO_0_0b1_theRe_ETC__q25,
	      CASE_guard3839_0b0_x3854_BITS_7_TO_0_0b1_x3854_ETC__q26,
	      CASE_guard666_0b0_x681_BITS_7_TO_0_0b1_theResu_ETC__q14,
	      CASE_guard666_0b0_x681_BITS_7_TO_0_0b1_x681_BI_ETC__q15,
	      CASE_guard8141_0b0_theResult___fst_exp6218_0b1_ETC__q76,
	      CASE_guard8141_0b0_theResult___fst_exp6218_0b1_ETC__q77,
	      CASE_guard9277_0b0_theResult___fst_exp7503_0b1_ETC__q74,
	      CASE_guard9277_0b0_theResult___fst_exp7503_0b1_ETC__q75,
	      CASE_requestR_BITS_194_TO_192_0x1_254_0x2_IF_r_ETC__q2,
	      CASE_requestR_BITS_194_TO_192_0x3_IF_guard3313_ETC__q24,
	      IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2139,
	      IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2296,
	      IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2623,
	      IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2692,
	      IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d350,
	      IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d379,
	      IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d697;
  reg [2 : 0] IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40;
  reg CASE_guard0288_0b0_requestR_BIT_191_0b1_reques_ETC__q88,
      CASE_guard11304_0b0_requestR_BITS_191_TO_160_E_ETC__q108,
      CASE_guard136_0b0_requestR_BIT_159_0b1_request_ETC__q8,
      CASE_guard1553_0b0_requestR_BIT_191_0b1_reques_ETC__q86,
      CASE_guard20612_0b0_requestR_BITS_191_TO_160_E_ETC__q110,
      CASE_guard29679_0b0_requestR_BITS_191_TO_160_E_ETC__q112,
      CASE_guard5772_0b0_requestR_BIT_159_0b1_reques_ETC__q35,
      CASE_guard6502_0b0_requestR_BIT_159_0b1_reques_ETC__q37,
      CASE_guard666_0b0_requestR_BIT_159_0b1_request_ETC__q10,
      CASE_guard8141_0b0_requestR_BIT_191_0b1_reques_ETC__q92,
      CASE_guard9277_0b0_requestR_BIT_191_0b1_reques_ETC__q90,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q109,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q11,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q111,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q113,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q36,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q38,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q87,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q89,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q9,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q91,
      CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q93;
  wire [85 : 0] IF_requestR_BIT_191_186_THEN_NEG_0b0_CONCAT_NO_ETC___d1618,
		b__h47607,
		x__h48283,
		x__h49361;
  wire [68 : 0] ab__h156914;
  wire [64 : 0] _1_CONCAT_DONTCARE_CONCAT_requestR_BITS_63_TO_3_ETC___d68;
  wire [63 : 0] IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1035,
		IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1051,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1034,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1036,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1050,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1052,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1122,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1123,
		IF_requestR_BITS_126_TO_116_745_EQ_2047_746_AN_ETC___d3793,
		IF_requestR_BITS_190_TO_180_596_EQ_0_607_AND_r_ETC___d3807,
		IF_requestR_BITS_190_TO_180_596_EQ_0_607_AND_r_ETC___d3878,
		res___1__h155823,
		res___1__h156261,
		res___1__h156271,
		res___1__h156290,
		res___1__h26221,
		res___1__h26457,
		res___1__h26467,
		res___1__h26486,
		res__h139089,
		res__h143531,
		res__h148079,
		res__h150783,
		res__h153478,
		res__h155355,
		res__h156306,
		res__h156487,
		res__h17825,
		res__h18062,
		res__h23434,
		res__h24917,
		res__h25986,
		res__h26502,
		res__h97284,
		x__h140114,
		x__h144662,
		x__h14804,
		x__h149106,
		x__h151801,
		x__h153678,
		x__h155805,
		x__h156455,
		x__h16397,
		x__h17147,
		x__h1773,
		x__h1919,
		x__h19781,
		x__h2053,
		x__h2201,
		x__h22306,
		x__h22427,
		x__h22565,
		x__h24048,
		x__h25117,
		x__h26203,
		x__h27370,
		x__h27492,
		x__h27616,
		x__h27746,
		x__h37694,
		x__h47361,
		x__h48937,
		x__h49683,
		x__h8662,
		x__h98388;
  wire [56 : 0] IF_0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_ETC__q60,
		IF_0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR__ETC__q97,
		IF_0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BIT_ETC__q65,
		IF_0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_E_ETC__q100,
		IF_0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_E_ETC__q94,
		IF_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_ETC__q62,
		IF_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_ETC__q68,
		IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d827,
		_0b0_CONCAT_NOT_IF_requestR_BITS_191_TO_160_4_E_ETC___d3152,
		_0b0_CONCAT_NOT_requestR_BITS_190_TO_180_596_EQ_ETC___d2318,
		_theResult____h120602,
		_theResult____h61543,
		_theResult____h79267,
		_theResult___snd__h119216,
		_theResult___snd__h119218,
		_theResult___snd__h119225,
		_theResult___snd__h119231,
		_theResult___snd__h119254,
		_theResult___snd__h128849,
		_theResult___snd__h128860,
		_theResult___snd__h128862,
		_theResult___snd__h128872,
		_theResult___snd__h128878,
		_theResult___snd__h128901,
		_theResult___snd__h137615,
		_theResult___snd__h137629,
		_theResult___snd__h137635,
		_theResult___snd__h137653,
		_theResult___snd__h69661,
		_theResult___snd__h69672,
		_theResult___snd__h69674,
		_theResult___snd__h69684,
		_theResult___snd__h69690,
		_theResult___snd__h69713,
		_theResult___snd__h78287,
		_theResult___snd__h78289,
		_theResult___snd__h78296,
		_theResult___snd__h78302,
		_theResult___snd__h78325,
		_theResult___snd__h87514,
		_theResult___snd__h87525,
		_theResult___snd__h87527,
		_theResult___snd__h87537,
		_theResult___snd__h87543,
		_theResult___snd__h87566,
		_theResult___snd__h96164,
		_theResult___snd__h96178,
		_theResult___snd__h96184,
		_theResult___snd__h96202,
		b__h15050,
		result__h121215,
		result__h79880,
		sfd__h53913,
		sfdin__h128832,
		sfdin__h69644,
		sfdin__h87497,
		x__h121310,
		x__h15726,
		x__h16821,
		x__h79975;
  wire [54 : 0] sfd___3__h35762, sfd___3__h45458, sfd__h27761, sfd__h37706;
  wire [53 : 0] sfd__h119283,
		sfd__h128930,
		sfd__h137688,
		sfd__h35789,
		sfd__h36532,
		sfd__h45485,
		sfd__h46227,
		value__h47609;
  wire [51 : 0] IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3582,
		IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3584,
		IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3555,
		IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3557,
		IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3601,
		IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3603,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1356,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1358,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1374,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1376,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3614,
		IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d1384,
		IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d1567,
		_theResult___fst_sfd__h104193,
		_theResult___fst_sfd__h120019,
		_theResult___fst_sfd__h120022,
		_theResult___fst_sfd__h129666,
		_theResult___fst_sfd__h129669,
		_theResult___fst_sfd__h138448,
		_theResult___fst_sfd__h138451,
		_theResult___fst_sfd__h138460,
		_theResult___fst_sfd__h138466,
		_theResult___fst_sfd__h36486,
		_theResult___fst_sfd__h37242,
		_theResult___fst_sfd__h37245,
		_theResult___fst_sfd__h46181,
		_theResult___fst_sfd__h46936,
		_theResult___fst_sfd__h46939,
		_theResult___fst_sfd__h50209,
		_theResult___sfd__h119921,
		_theResult___sfd__h129568,
		_theResult___sfd__h138350,
		_theResult___sfd__h36389,
		_theResult___sfd__h37145,
		_theResult___sfd__h46085,
		_theResult___sfd__h46840,
		_theResult___snd_fst_sfd__h100339,
		_theResult___snd_fst_sfd__h120025,
		_theResult___snd_fst_sfd__h138454,
		_theResult___snd_fst_sfd__h37248,
		_theResult___snd_fst_sfd__h46942,
		out___1_sfd__h98453,
		out_sfd__h119924,
		out_sfd__h129571,
		out_sfd__h138353,
		out_sfd__h36392,
		out_sfd__h37148,
		out_sfd__h46088,
		out_sfd__h46843,
		value__h49752;
  wire [32 : 0] _theResult_____2__h14985,
		_theResult_____2__h47542,
		out1___1__h15477,
		out1___1__h48034;
  wire [31 : 0] IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1031,
		IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1045,
		IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1047,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1032,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1048,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d886,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d946,
		IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d882,
		IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d884,
		IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d944,
		IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1673,
		IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1675,
		IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1735,
		IF_NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFF_ETC___d1029,
		IF_NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFF_ETC___d1044,
		IF_requestR_BITS_190_TO_180_596_EQ_0_607_AND_r_ETC___d1737,
		IF_requestR_BITS_190_TO_180_596_EQ_2047_597_AN_ETC___d1677,
		IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d815,
		IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d948,
		IF_requestR_BIT_191_186_THEN_2147483648_ELSE_2_ETC___d1606,
		requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28,
		requestR_BITS_159_TO_128__q1,
		sfd___3__h13303,
		sfd___3__h7126,
		sfd__h2222,
		x__h14807,
		x__h16400,
		x__h1779,
		x__h1925,
		x__h2059,
		x__h2207,
		x__h47364,
		x__h48940,
		x__h97290;
  wire [30 : 0] IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19;
  wire [24 : 0] sfd__h13330,
		sfd__h13869,
		sfd__h69742,
		sfd__h7153,
		sfd__h7696,
		sfd__h78354,
		sfd__h87595,
		sfd__h96237,
		value__h15052;
  wire [23 : 0] NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1611,
		NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1643,
		NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1644,
		NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1708;
  wire [22 : 0] IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2720,
		IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2722,
		IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2766,
		IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2768,
		IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2739,
		IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2741,
		IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2785,
		IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2787,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d396,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d398,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d414,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d416,
		IF_requestR_BITS_190_TO_180_596_EQ_2047_597_AN_ETC___d2798,
		_theResult___fst_sfd__h13823,
		_theResult___fst_sfd__h14375,
		_theResult___fst_sfd__h14378,
		_theResult___fst_sfd__h61526,
		_theResult___fst_sfd__h70275,
		_theResult___fst_sfd__h70278,
		_theResult___fst_sfd__h7650,
		_theResult___fst_sfd__h78887,
		_theResult___fst_sfd__h78890,
		_theResult___fst_sfd__h8203,
		_theResult___fst_sfd__h8206,
		_theResult___fst_sfd__h88128,
		_theResult___fst_sfd__h88131,
		_theResult___fst_sfd__h96794,
		_theResult___fst_sfd__h96797,
		_theResult___fst_sfd__h96806,
		_theResult___fst_sfd__h96812,
		_theResult___fst_sfd__h98711,
		_theResult___sfd__h13727,
		_theResult___sfd__h14279,
		_theResult___sfd__h70177,
		_theResult___sfd__h7553,
		_theResult___sfd__h78789,
		_theResult___sfd__h8106,
		_theResult___sfd__h88030,
		_theResult___sfd__h96696,
		_theResult___snd_fst_sfd__h14381,
		_theResult___snd_fst_sfd__h53867,
		_theResult___snd_fst_sfd__h78893,
		_theResult___snd_fst_sfd__h8209,
		_theResult___snd_fst_sfd__h96800,
		out_sfd__h13730,
		out_sfd__h14282,
		out_sfd__h70180,
		out_sfd__h7556,
		out_sfd__h78792,
		out_sfd__h8109,
		out_sfd__h88033,
		out_sfd__h96699,
		sV1_sfd__h816,
		sV2_sfd__h919,
		value__h98456;
  wire [19 : 0] NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d820,
		NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d852,
		NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d853,
		NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d917;
  wire [11 : 0] IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3468,
		SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3145,
		SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q96,
		SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_609___d2311,
		SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q64,
		_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1840,
		_3074_MINUS_SEXT_IF_requestR_BITS_191_TO_160_4__ETC___d3148,
		_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1230,
		_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1445,
		_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3002,
		_3970_MINUS_SEXT_requestR_BITS_190_TO_180_596_M_ETC___d2314,
		x__h121343,
		x__h36517,
		x__h46212,
		x__h80008;
  wire [10 : 0] IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3453,
		IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3455,
		IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3128,
		IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3130,
		IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3522,
		IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3524,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1307,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1333,
		IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1335,
		SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q99,
		_theResult___exp__h119920,
		_theResult___exp__h129567,
		_theResult___exp__h138349,
		_theResult___exp__h36388,
		_theResult___exp__h37144,
		_theResult___exp__h46084,
		_theResult___exp__h46839,
		_theResult___fst_exp__h104192,
		_theResult___fst_exp__h119256,
		_theResult___fst_exp__h119262,
		_theResult___fst_exp__h119265,
		_theResult___fst_exp__h120018,
		_theResult___fst_exp__h120021,
		_theResult___fst_exp__h128838,
		_theResult___fst_exp__h128903,
		_theResult___fst_exp__h128909,
		_theResult___fst_exp__h128912,
		_theResult___fst_exp__h129665,
		_theResult___fst_exp__h129668,
		_theResult___fst_exp__h137621,
		_theResult___fst_exp__h137660,
		_theResult___fst_exp__h137666,
		_theResult___fst_exp__h137669,
		_theResult___fst_exp__h138447,
		_theResult___fst_exp__h138450,
		_theResult___fst_exp__h138459,
		_theResult___fst_exp__h138462,
		_theResult___fst_exp__h36485,
		_theResult___fst_exp__h37241,
		_theResult___fst_exp__h37244,
		_theResult___fst_exp__h46180,
		_theResult___fst_exp__h46935,
		_theResult___fst_exp__h46938,
		_theResult___snd_fst_exp__h120024,
		_theResult___snd_fst_exp__h138453,
		_theResult___snd_fst_exp__h37247,
		_theResult___snd_fst_exp__h37250,
		_theResult___snd_fst_exp__h37253,
		_theResult___snd_fst_exp__h46941,
		_theResult___snd_fst_exp__h46944,
		_theResult___snd_fst_exp__h46947,
		din_inc___2_exp__h138485,
		din_inc___2_exp__h138515,
		din_inc___2_exp__h138539,
		din_inc___2_exp__h37287,
		din_inc___2_exp__h46977,
		out_exp__h119923,
		out_exp__h129570,
		out_exp__h138352,
		out_exp__h36391,
		out_exp__h37147,
		out_exp__h46087,
		out_exp__h46842,
		requestR_BITS_190_TO_180_596_MINUS_1023___d1609,
		x__h98397;
  wire [8 : 0] IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2632,
	       _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d258,
	       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d616,
	       x__h13854,
	       x__h7681;
  wire [7 : 0] IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2133,
	       IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2135,
	       IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2617,
	       IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2619,
	       IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2290,
	       IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2292,
	       IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2686,
	       IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2688,
	       IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d347,
	       IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d373,
	       IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d375,
	       IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d385,
	       IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d703,
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d818,
	       SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q67,
	       _theResult___exp__h13726,
	       _theResult___exp__h14278,
	       _theResult___exp__h70176,
	       _theResult___exp__h7552,
	       _theResult___exp__h78788,
	       _theResult___exp__h8105,
	       _theResult___exp__h88029,
	       _theResult___exp__h96695,
	       _theResult___fst_exp__h13822,
	       _theResult___fst_exp__h14374,
	       _theResult___fst_exp__h14377,
	       _theResult___fst_exp__h61525,
	       _theResult___fst_exp__h69650,
	       _theResult___fst_exp__h69715,
	       _theResult___fst_exp__h69721,
	       _theResult___fst_exp__h69724,
	       _theResult___fst_exp__h70274,
	       _theResult___fst_exp__h70277,
	       _theResult___fst_exp__h7649,
	       _theResult___fst_exp__h78327,
	       _theResult___fst_exp__h78333,
	       _theResult___fst_exp__h78336,
	       _theResult___fst_exp__h78886,
	       _theResult___fst_exp__h78889,
	       _theResult___fst_exp__h8202,
	       _theResult___fst_exp__h8205,
	       _theResult___fst_exp__h87503,
	       _theResult___fst_exp__h87568,
	       _theResult___fst_exp__h87574,
	       _theResult___fst_exp__h87577,
	       _theResult___fst_exp__h88127,
	       _theResult___fst_exp__h88130,
	       _theResult___fst_exp__h96170,
	       _theResult___fst_exp__h96209,
	       _theResult___fst_exp__h96215,
	       _theResult___fst_exp__h96218,
	       _theResult___fst_exp__h96793,
	       _theResult___fst_exp__h96796,
	       _theResult___fst_exp__h96805,
	       _theResult___fst_exp__h96808,
	       _theResult___snd_fst_exp__h14380,
	       _theResult___snd_fst_exp__h14383,
	       _theResult___snd_fst_exp__h14386,
	       _theResult___snd_fst_exp__h78892,
	       _theResult___snd_fst_exp__h8208,
	       _theResult___snd_fst_exp__h8211,
	       _theResult___snd_fst_exp__h8214,
	       _theResult___snd_fst_exp__h96799,
	       din_inc___2_exp__h14416,
	       din_inc___2_exp__h8248,
	       din_inc___2_exp__h96827,
	       din_inc___2_exp__h96851,
	       din_inc___2_exp__h96881,
	       din_inc___2_exp__h96905,
	       out_exp__h13729,
	       out_exp__h14281,
	       out_exp__h70179,
	       out_exp__h7555,
	       out_exp__h78791,
	       out_exp__h8108,
	       out_exp__h88032,
	       out_exp__h96698,
	       sV1_exp__h815,
	       sV2_exp__h918,
	       x__h49692;
  wire [5 : 0] IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_TO_180__ETC___d2074,
	       IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_191_TO__ETC___d3394,
	       IF_IF_3970_MINUS_SEXT_requestR_BITS_190_TO_180_ETC___d2558,
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3074,
	       IF_IF_requestR_BIT_159_6_THEN_NEG_requestR_BIT_ETC___d1227,
	       IF_IF_requestR_BIT_159_6_THEN_NEG_requestR_BIT_ETC___d255,
	       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2236,
	       IF_requestR_BIT_159_6_THEN_0_ELSE_IF_requestR__ETC___d1442,
	       IF_requestR_BIT_159_6_THEN_0_ELSE_IF_requestR__ETC___d613;
  wire [4 : 0] _0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2858,
	       _0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3681,
	       _0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2887,
	       _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3664,
	       _0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2870,
	       x__h139191,
	       x__h143663,
	       x__h14520,
	       x__h153497,
	       x__h16140,
	       x__h16899,
	       x__h19186,
	       x__h24936,
	       x__h37409,
	       x__h47077,
	       x__h48680,
	       x__h49439,
	       x__h8374,
	       x__h97405;
  wire [1 : 0] IF_sfd___3126_BIT_7_THEN_2_ELSE_0__q7,
	       IF_sfd___3126_BIT_8_THEN_2_ELSE_0__q6,
	       IF_sfd___33303_BIT_7_THEN_2_ELSE_0__q21,
	       IF_sfd___33303_BIT_8_THEN_2_ELSE_0__q20,
	       IF_sfd___35458_BIT_1_THEN_2_ELSE_0__q48,
	       IF_sfd___35458_BIT_2_THEN_2_ELSE_0__q47,
	       IF_sfd___35762_BIT_1_THEN_2_ELSE_0__q34,
	       IF_sfd___35762_BIT_2_THEN_2_ELSE_0__q33,
	       IF_sfdin28832_BIT_4_THEN_2_ELSE_0__q98,
	       IF_sfdin7497_BIT_33_THEN_2_ELSE_0__q66,
	       IF_sfdin9644_BIT_33_THEN_2_ELSE_0__q61,
	       IF_theResult___snd19216_BIT_4_THEN_2_ELSE_0__q95,
	       IF_theResult___snd37615_BIT_4_THEN_2_ELSE_0__q101,
	       IF_theResult___snd6164_BIT_33_THEN_2_ELSE_0__q69,
	       IF_theResult___snd8287_BIT_33_THEN_2_ELSE_0__q63,
	       IF_x5726_BIT_24_THEN_2_ELSE_0__q31,
	       IF_x6821_BIT_24_THEN_2_ELSE_0__q32,
	       IF_x8283_BIT_53_THEN_2_ELSE_0__q58,
	       IF_x9361_BIT_53_THEN_2_ELSE_0__q59,
	       guard__h111304,
	       guard__h120612,
	       guard__h129679,
	       guard__h13313,
	       guard__h13839,
	       guard__h14983,
	       guard__h15537,
	       guard__h16600,
	       guard__h35772,
	       guard__h36502,
	       guard__h45468,
	       guard__h46197,
	       guard__h47540,
	       guard__h48094,
	       guard__h49140,
	       guard__h61553,
	       guard__h70288,
	       guard__h7136,
	       guard__h7666,
	       guard__h79277,
	       guard__h88141;
  wire IF_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_ETC___d2820,
       IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d1286,
       IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d1401,
       IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d325,
       IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d475,
       IF_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THE_ETC___d1584,
       IF_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THE_ETC___d789,
       IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_191__ETC___d3638,
       IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFF_ETC___d3646,
       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3650,
       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3685,
       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3688,
       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3695,
       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3709,
       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3721,
       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3733,
       IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d908,
       IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1699,
       IF_NOT_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_15_ETC___d1287,
       IF_NOT_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_ETC___d3630,
       IF_NOT_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1024,
       IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3648,
       IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3707,
       IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3719,
       IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3731,
       IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2838,
       IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2916,
       IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2929,
       IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2942,
       IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_T_ETC___d1004,
       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2840,
       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2891,
       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2902,
       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2918,
       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2931,
       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2944,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1000,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1013,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1014,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1015,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1018,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1020,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1038,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1075,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1086,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1090,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d814,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d956,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d967,
       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d990,
       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1635,
       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1667,
       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1729,
       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d844,
       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d876,
       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d938,
       IF_requestR_BIT_159_6_THEN_NEG_requestR_BITS_1_ETC___d466,
       IF_requestR_BIT_159_6_THEN_NEG_requestR_BITS_1_ETC___d469,
       IF_requestR_BIT_159_6_THEN_NEG_requestR_BITS_1_ETC___d478,
       IF_requestR_BIT_191_186_THEN_NOT_requestR_BITS_ETC___d3786,
       NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d855,
       NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d919,
       NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1646,
       NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1710,
       NOT_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_76_ETC___d2910,
       NOT_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_76_ETC___d2938,
       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1027,
       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1028,
       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1085,
       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1091,
       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1109,
       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d3047,
       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d897,
       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d961,
       NOT_IF_requestR_BIT_159_6_THEN_NEG_requestR_BI_ETC___d263,
       NOT_requestR_BITS_159_TO_128_24_EQ_0_25_26_AND_ETC___d781,
       NOT_requestR_BITS_190_TO_180_596_EQ_0_607_613__ETC___d1688,
       NOT_requestR_BITS_190_TO_180_596_EQ_0_607_613__ETC___d1752,
       NOT_requestR_BITS_190_TO_180_596_EQ_2047_597_6_ETC___d3790,
       NOT_requestR_BITS_190_TO_180_596_EQ_2047_597_6_ETC___d3855,
       NOT_requestR_BITS_190_TO_180_596_ULT_requestR__ETC___d3832,
       NOT_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5_ETC___d1089,
       NOT_requestR_BIT_158_88_89_AND_NOT_requestR_BI_ETC___d579,
       NOT_requestR_BIT_179_767_142_AND_NOT_requestR__ETC___d2181,
       SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3146,
       SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3147,
       SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2312,
       SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2313,
       _0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2076,
       _0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3396,
       _0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2560,
       _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3076,
       _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3469,
       _0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2238,
       _0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2633,
       _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1841,
       _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1842,
       _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d2873,
       _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d2898,
       _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d2925,
       _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1231,
       _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1233,
       _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1235,
       _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d259,
       _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d261,
       _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d264,
       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1446,
       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1447,
       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1448,
       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d617,
       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d618,
       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d619,
       _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3003,
       _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3004,
       guard__h121210,
       guard__h79875,
       requestR_BITS_126_TO_116_745_EQ_0_759_AND_requ_ETC___d3766,
       requestR_BITS_179_TO_128_598_ULE_requestR_BITS_ETC___d3778,
       requestR_BITS_179_TO_128_598_ULT_requestR_BITS_ETC___d3783,
       requestR_BITS_190_TO_180_596_EQ_0_607_AND_requ_ETC___d3762,
       requestR_BITS_190_TO_180_596_EQ_0_607_AND_requ_ETC___d3836,
       requestR_BITS_190_TO_180_596_EQ_2047_597_AND_0_ETC___d1747,
       requestR_BITS_190_TO_180_596_EQ_2047_597_AND_0_ETC___d1758,
       requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3754,
       requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3799,
       requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3821,
       requestR_BITS_190_TO_180_596_EQ_requestR_BITS__ETC___d3777,
       requestR_BITS_190_TO_180_596_ULE_requestR_BITS_ETC___d3775,
       requestR_BITS_190_TO_180_596_ULE_requestR_BITS_ETC___d3831,
       requestR_BITS_190_TO_180_596_ULT_requestR_BITS_ETC___d3782,
       requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5_AND_ETC___d1026,
       requestR_BIT_158_88_OR_requestR_BIT_157_90_OR__ETC___d770,
       requestR_BIT_159_6_OR_requestR_BIT_158_88_OR_r_ETC___d792;
  // action method set_verbosity
  assign RDY_set_verbosity = 1'd1 ;
  assign CAN_FIRE_set_verbosity = 1'd1 ;
  assign WILL_FIRE_set_verbosity = EN_set_verbosity ;
  // action method req
  assign CAN_FIRE_req = 1'd1 ;
  assign WILL_FIRE_req = EN_req ;
  // value method valid
  assign valid = dw_valid$whas && dw_valid$wget ;
  // value method word_fst
  assign word_fst = ab__h156914[68:5] ;
  // value method word_snd
  assign word_snd = ab__h156914[4:0] ;
  // submodule fpu
  mkFPU fpu(.CLK(CLK),
	    .RST_N(RST_N),
	    .request_put(fpu$request_put),
	    .EN_request_put(fpu$EN_request_put),
	    .EN_response_get(fpu$EN_response_get),
	    .RDY_request_put(fpu$RDY_request_put),
	    .response_get(fpu$response_get),
	    .RDY_response_get(fpu$RDY_response_get));
  // submodule frmFpuF
  FIFO2 #(.width(32'd1), .guarded(32'd1)) frmFpuF(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(frmFpuF$D_IN),
						  .ENQ(frmFpuF$ENQ),
						  .DEQ(frmFpuF$DEQ),
						  .CLR(frmFpuF$CLR),
						  .D_OUT(),
						  .FULL_N(),
						  .EMPTY_N());
  // rule RL_doFADD_S
  assign CAN_FIRE_RL_doFADD_S =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h0 ;
  assign WILL_FIRE_RL_doFADD_S = CAN_FIRE_RL_doFADD_S ;
  // rule RL_doFSUB_S
  assign CAN_FIRE_RL_doFSUB_S =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h04 ;
  assign WILL_FIRE_RL_doFSUB_S = CAN_FIRE_RL_doFSUB_S ;
  // rule RL_doFMUL_S
  assign CAN_FIRE_RL_doFMUL_S =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h08 ;
  assign WILL_FIRE_RL_doFMUL_S = CAN_FIRE_RL_doFMUL_S ;
  // rule RL_doFMADD_S
  assign CAN_FIRE_RL_doFMADD_S =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1000011 &&
	     requestR[201:200] == 2'd0 ;
  assign WILL_FIRE_RL_doFMADD_S = CAN_FIRE_RL_doFMADD_S ;
  // rule RL_doFMSUB_S
  assign CAN_FIRE_RL_doFMSUB_S =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1000111 &&
	     requestR[201:200] == 2'd0 ;
  assign WILL_FIRE_RL_doFMSUB_S = CAN_FIRE_RL_doFMSUB_S ;
  // rule RL_doFNMADD_S
  assign CAN_FIRE_RL_doFNMADD_S =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1001111 &&
	     requestR[201:200] == 2'd0 ;
  assign WILL_FIRE_RL_doFNMADD_S = CAN_FIRE_RL_doFNMADD_S ;
  // rule RL_doFNMSUB_S
  assign CAN_FIRE_RL_doFNMSUB_S =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1001011 &&
	     requestR[201:200] == 2'd0 ;
  assign WILL_FIRE_RL_doFNMSUB_S = CAN_FIRE_RL_doFNMSUB_S ;
  // rule RL_doFSGNJ_S
  assign CAN_FIRE_RL_doFSGNJ_S = MUX_dw_result$wset_1__SEL_2 ;
  assign WILL_FIRE_RL_doFSGNJ_S = MUX_dw_result$wset_1__SEL_2 ;
  // rule RL_doFSGNJN_S
  assign CAN_FIRE_RL_doFSGNJN_S = MUX_dw_result$wset_1__SEL_1 ;
  assign WILL_FIRE_RL_doFSGNJN_S = MUX_dw_result$wset_1__SEL_1 ;
  // rule RL_doFSGNJX_S
  assign CAN_FIRE_RL_doFSGNJX_S =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h10 &&
	     requestR[194:192] == 3'h2 ;
  assign WILL_FIRE_RL_doFSGNJX_S = CAN_FIRE_RL_doFSGNJX_S ;
  // rule RL_doFCVT_S_W
  assign CAN_FIRE_RL_doFCVT_S_W =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h68 &&
	     requestR[199:195] == 5'd0 ;
  assign WILL_FIRE_RL_doFCVT_S_W = CAN_FIRE_RL_doFCVT_S_W ;
  // rule RL_doFCVT_S_WU
  assign CAN_FIRE_RL_doFCVT_S_WU =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h68 &&
	     requestR[199:195] == 5'd1 ;
  assign WILL_FIRE_RL_doFCVT_S_WU = CAN_FIRE_RL_doFCVT_S_WU ;
  // rule RL_doFCVT_W_S
  assign CAN_FIRE_RL_doFCVT_W_S =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h60 &&
	     requestR[199:195] == 5'd0 ;
  assign WILL_FIRE_RL_doFCVT_W_S = CAN_FIRE_RL_doFCVT_W_S ;
  // rule RL_doFCVT_WU_S
  assign CAN_FIRE_RL_doFCVT_WU_S =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h60 &&
	     requestR[199:195] == 5'd1 ;
  assign WILL_FIRE_RL_doFCVT_WU_S = CAN_FIRE_RL_doFCVT_WU_S ;
  // rule RL_doFMIN_S
  assign CAN_FIRE_RL_doFMIN_S =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h14 &&
	     requestR[194:192] == 3'h0 ;
  assign WILL_FIRE_RL_doFMIN_S = CAN_FIRE_RL_doFMIN_S ;
  // rule RL_doFMAX_S
  assign CAN_FIRE_RL_doFMAX_S =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h14 &&
	     requestR[194:192] == 3'h1 ;
  assign WILL_FIRE_RL_doFMAX_S = CAN_FIRE_RL_doFMAX_S ;
  // rule RL_doFMV_W_X
  assign CAN_FIRE_RL_doFMV_W_X =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h78 &&
	     requestR[194:192] == 3'h0 ;
  assign WILL_FIRE_RL_doFMV_W_X = CAN_FIRE_RL_doFMV_W_X ;
  // rule RL_doFMV_X_W
  assign CAN_FIRE_RL_doFMV_X_W =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h70 &&
	     requestR[194:192] == 3'h0 ;
  assign WILL_FIRE_RL_doFMV_X_W = CAN_FIRE_RL_doFMV_X_W ;
  // rule RL_doFEQ_S
  assign CAN_FIRE_RL_doFEQ_S =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h50 &&
	     requestR[194:192] == 3'h2 ;
  assign WILL_FIRE_RL_doFEQ_S = CAN_FIRE_RL_doFEQ_S ;
  // rule RL_doFLT_S
  assign CAN_FIRE_RL_doFLT_S =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h50 &&
	     requestR[194:192] == 3'h1 ;
  assign WILL_FIRE_RL_doFLT_S = CAN_FIRE_RL_doFLT_S ;
  // rule RL_doFLE_S
  assign CAN_FIRE_RL_doFLE_S =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h50 &&
	     requestR[194:192] == 3'h0 ;
  assign WILL_FIRE_RL_doFLE_S = CAN_FIRE_RL_doFLE_S ;
  // rule RL_doFCLASS_S
  assign CAN_FIRE_RL_doFCLASS_S =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h70 &&
	     requestR[194:192] == 3'h1 ;
  assign WILL_FIRE_RL_doFCLASS_S = CAN_FIRE_RL_doFCLASS_S ;
  // rule RL_doFADD_D
  assign CAN_FIRE_RL_doFADD_D =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h01 ;
  assign WILL_FIRE_RL_doFADD_D = CAN_FIRE_RL_doFADD_D ;
  // rule RL_doFSUB_D
  assign CAN_FIRE_RL_doFSUB_D =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h05 ;
  assign WILL_FIRE_RL_doFSUB_D = CAN_FIRE_RL_doFSUB_D ;
  // rule RL_doFMUL_D
  assign CAN_FIRE_RL_doFMUL_D =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h09 ;
  assign WILL_FIRE_RL_doFMUL_D = CAN_FIRE_RL_doFMUL_D ;
  // rule RL_doFMADD_D
  assign CAN_FIRE_RL_doFMADD_D =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1000011 &&
	     requestR[201:200] == 2'd1 ;
  assign WILL_FIRE_RL_doFMADD_D = CAN_FIRE_RL_doFMADD_D ;
  // rule RL_doFMSUB_D
  assign CAN_FIRE_RL_doFMSUB_D =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1000111 &&
	     requestR[201:200] == 2'd1 ;
  assign WILL_FIRE_RL_doFMSUB_D = CAN_FIRE_RL_doFMSUB_D ;
  // rule RL_doFNMADD_D
  assign CAN_FIRE_RL_doFNMADD_D =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1001111 &&
	     requestR[201:200] == 2'd1 ;
  assign WILL_FIRE_RL_doFNMADD_D = CAN_FIRE_RL_doFNMADD_D ;
  // rule RL_doFNMSUB_D
  assign CAN_FIRE_RL_doFNMSUB_D =
	     fpu$RDY_request_put && requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1001011 &&
	     requestR[201:200] == 2'd1 ;
  assign WILL_FIRE_RL_doFNMSUB_D = CAN_FIRE_RL_doFNMSUB_D ;
  // rule RL_doFSGNJ_D
  assign CAN_FIRE_RL_doFSGNJ_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h11 &&
	     requestR[194:192] == 3'h0 ;
  assign WILL_FIRE_RL_doFSGNJ_D = CAN_FIRE_RL_doFSGNJ_D ;
  // rule RL_doFSGNJN_D
  assign CAN_FIRE_RL_doFSGNJN_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h11 &&
	     requestR[194:192] == 3'h1 ;
  assign WILL_FIRE_RL_doFSGNJN_D = CAN_FIRE_RL_doFSGNJN_D ;
  // rule RL_doFSGNJX_D
  assign CAN_FIRE_RL_doFSGNJX_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h11 &&
	     requestR[194:192] == 3'h2 ;
  assign WILL_FIRE_RL_doFSGNJX_D = CAN_FIRE_RL_doFSGNJX_D ;
  // rule RL_doFCVT_D_W
  assign CAN_FIRE_RL_doFCVT_D_W =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h69 &&
	     requestR[199:195] == 5'd0 ;
  assign WILL_FIRE_RL_doFCVT_D_W = CAN_FIRE_RL_doFCVT_D_W ;
  // rule RL_doFCVT_D_WU
  assign CAN_FIRE_RL_doFCVT_D_WU =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h69 &&
	     requestR[199:195] == 5'd1 ;
  assign WILL_FIRE_RL_doFCVT_D_WU = CAN_FIRE_RL_doFCVT_D_WU ;
  // rule RL_doFCVT_W_D
  assign CAN_FIRE_RL_doFCVT_W_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h61 &&
	     requestR[199:195] == 5'd0 ;
  assign WILL_FIRE_RL_doFCVT_W_D = CAN_FIRE_RL_doFCVT_W_D ;
  // rule RL_doFCVT_WU_D
  assign CAN_FIRE_RL_doFCVT_WU_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h61 &&
	     requestR[199:195] == 5'd1 ;
  assign WILL_FIRE_RL_doFCVT_WU_D = CAN_FIRE_RL_doFCVT_WU_D ;
  // rule RL_doFCVT_S_D
  assign CAN_FIRE_RL_doFCVT_S_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h20 &&
	     requestR[199:195] == 5'd1 ;
  assign WILL_FIRE_RL_doFCVT_S_D = CAN_FIRE_RL_doFCVT_S_D ;
  // rule RL_doFCVT_D_S
  assign CAN_FIRE_RL_doFCVT_D_S =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h21 &&
	     requestR[199:195] == 5'd0 ;
  assign WILL_FIRE_RL_doFCVT_D_S = CAN_FIRE_RL_doFCVT_D_S ;
  // rule RL_doFMIN_D
  assign CAN_FIRE_RL_doFMIN_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h15 &&
	     requestR[194:192] == 3'h0 ;
  assign WILL_FIRE_RL_doFMIN_D = CAN_FIRE_RL_doFMIN_D ;
  // rule RL_doFMAX_D
  assign CAN_FIRE_RL_doFMAX_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h15 &&
	     requestR[194:192] == 3'h1 ;
  assign WILL_FIRE_RL_doFMAX_D = CAN_FIRE_RL_doFMAX_D ;
  // rule RL_doFEQ_D
  assign CAN_FIRE_RL_doFEQ_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h51 &&
	     requestR[194:192] == 3'h2 ;
  assign WILL_FIRE_RL_doFEQ_D = CAN_FIRE_RL_doFEQ_D ;
  // rule RL_doFLT_D
  assign CAN_FIRE_RL_doFLT_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h51 &&
	     requestR[194:192] == 3'h1 ;
  assign WILL_FIRE_RL_doFLT_D = CAN_FIRE_RL_doFLT_D ;
  // rule RL_doFLE_D
  assign CAN_FIRE_RL_doFLE_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h51 &&
	     requestR[194:192] == 3'h0 ;
  assign WILL_FIRE_RL_doFLE_D = CAN_FIRE_RL_doFLE_D ;
  // rule RL_doFMV_D_X
  assign CAN_FIRE_RL_doFMV_D_X =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h79 &&
	     requestR[194:192] == 3'h0 ;
  assign WILL_FIRE_RL_doFMV_D_X = CAN_FIRE_RL_doFMV_D_X ;
  // rule RL_doFMV_X_D
  assign CAN_FIRE_RL_doFMV_X_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h71 &&
	     requestR[194:192] == 3'h0 ;
  assign WILL_FIRE_RL_doFMV_X_D = CAN_FIRE_RL_doFMV_X_D ;
  // rule RL_doFCLASS_D
  assign CAN_FIRE_RL_doFCLASS_D =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h71 &&
	     requestR[194:192] == 3'h1 ;
  assign WILL_FIRE_RL_doFCLASS_D = CAN_FIRE_RL_doFCLASS_D ;
  // rule RL_rl_get_fpu_result
  assign CAN_FIRE_RL_rl_get_fpu_result =
	     fpu$RDY_response_get && stateR == 2'd1 ;
  assign WILL_FIRE_RL_rl_get_fpu_result = CAN_FIRE_RL_rl_get_fpu_result ;
  // rule RL_rl_drive_fpu_result
  assign CAN_FIRE_RL_rl_drive_fpu_result = stateR == 2'd2 ;
  assign WILL_FIRE_RL_rl_drive_fpu_result = stateR == 2'd2 ;
  // inputs to muxes for submodule ports
  assign MUX_dw_result$wset_1__SEL_1 =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h10 &&
	     requestR[194:192] == 3'h1 ;
  assign MUX_dw_result$wset_1__SEL_2 =
	     requestR[214] && stateR == 2'd0 &&
	     requestR[213:207] == 7'b1010011 &&
	     requestR[206:200] == 7'h10 &&
	     requestR[194:192] == 3'h0 ;
  assign MUX_dw_result$wset_1__SEL_30 =
	     WILL_FIRE_RL_doFMV_X_D || WILL_FIRE_RL_doFMV_D_X ;
  assign MUX_dw_result$wset_1__VAL_1 = { x__h1919, 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_2 = { x__h1773, 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_3 = { x__h2053, 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_4 = { x__h2201, x__h8374 } ;
  assign MUX_dw_result$wset_1__VAL_5 = { x__h8662, x__h14520 } ;
  assign MUX_dw_result$wset_1__VAL_6 = { x__h14804, x__h16140 } ;
  assign MUX_dw_result$wset_1__VAL_7 = { x__h16397, x__h16899 } ;
  assign MUX_dw_result$wset_1__VAL_8 = { x__h17147, x__h19186 } ;
  assign MUX_dw_result$wset_1__VAL_9 = { x__h19781, x__h19186 } ;
  assign MUX_dw_result$wset_1__VAL_10 = { x__h22306, 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_11 = { x__h22427, 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_12 = { x__h22565, x__h19186 } ;
  assign MUX_dw_result$wset_1__VAL_13 = { x__h24048, x__h24936 } ;
  assign MUX_dw_result$wset_1__VAL_14 = { x__h25117, x__h24936 } ;
  assign MUX_dw_result$wset_1__VAL_15 = { x__h26203, 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_16 = { x__h27370, 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_17 = { x__h27492, 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_18 = { x__h27616, 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_19 = { x__h27746, x__h37409 } ;
  assign MUX_dw_result$wset_1__VAL_20 = { x__h37694, x__h47077 } ;
  assign MUX_dw_result$wset_1__VAL_21 = { x__h47361, x__h48680 } ;
  assign MUX_dw_result$wset_1__VAL_22 = { x__h48937, x__h49439 } ;
  assign MUX_dw_result$wset_1__VAL_23 = { x__h49683, x__h97405 } ;
  assign MUX_dw_result$wset_1__VAL_24 = { x__h98388, x__h139191 } ;
  assign MUX_dw_result$wset_1__VAL_25 = { x__h140114, x__h143663 } ;
  assign MUX_dw_result$wset_1__VAL_26 = { x__h144662, x__h143663 } ;
  assign MUX_dw_result$wset_1__VAL_27 = { x__h149106, x__h143663 } ;
  assign MUX_dw_result$wset_1__VAL_28 = { x__h151801, x__h153497 } ;
  assign MUX_dw_result$wset_1__VAL_29 = { x__h153678, x__h153497 } ;
  assign MUX_dw_result$wset_1__VAL_30 = { requestR[191:128], 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_31 = { x__h155805, 5'd0 } ;
  assign MUX_dw_result$wset_1__VAL_32 =
	     { x__h156455, fpu$response_get[4:0] } ;
  assign MUX_fpu$request_put_1__VAL_1 =
	     { 33'h1AAAAAAAA,
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159],
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19,
	       33'h1AAAAAAAA,
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28,
	       65'h0AAAAAAAAAAAAAAAA,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd0 } ;
  assign MUX_fpu$request_put_1__VAL_2 =
	     { 33'h1AAAAAAAA,
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159],
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19,
	       33'h1AAAAAAAA,
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28,
	       65'h0AAAAAAAAAAAAAAAA,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd1 } ;
  assign MUX_fpu$request_put_1__VAL_3 =
	     { 33'h1AAAAAAAA,
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159],
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19,
	       33'h1AAAAAAAA,
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28,
	       65'h0AAAAAAAAAAAAAAAA,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd2 } ;
  assign MUX_fpu$request_put_1__VAL_4 =
	     { 33'h1AAAAAAAA,
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159],
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19,
	       33'h1AAAAAAAA,
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28,
	       _1_CONCAT_DONTCARE_CONCAT_requestR_BITS_63_TO_3_ETC___d68,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd5 } ;
  assign MUX_fpu$request_put_1__VAL_5 =
	     { 33'h1AAAAAAAA,
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159],
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19,
	       33'h1AAAAAAAA,
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28,
	       _1_CONCAT_DONTCARE_CONCAT_requestR_BITS_63_TO_3_ETC___d68,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd6 } ;
  assign MUX_fpu$request_put_1__VAL_6 =
	     { 33'h1AAAAAAAA,
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159],
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19,
	       33'h1AAAAAAAA,
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28,
	       _1_CONCAT_DONTCARE_CONCAT_requestR_BITS_63_TO_3_ETC___d68,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd7 } ;
  assign MUX_fpu$request_put_1__VAL_7 =
	     { 33'h1AAAAAAAA,
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159],
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19,
	       33'h1AAAAAAAA,
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28,
	       _1_CONCAT_DONTCARE_CONCAT_requestR_BITS_63_TO_3_ETC___d68,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd8 } ;
  assign MUX_fpu$request_put_1__VAL_8 =
	     { 1'd0,
	       requestR[191:128],
	       1'd0,
	       requestR[127:64],
	       65'h0AAAAAAAAAAAAAAAA,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd0 } ;
  assign MUX_fpu$request_put_1__VAL_9 =
	     { 1'd0,
	       requestR[191:128],
	       1'd0,
	       requestR[127:64],
	       65'h0AAAAAAAAAAAAAAAA,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd1 } ;
  assign MUX_fpu$request_put_1__VAL_10 =
	     { 1'd0,
	       requestR[191:128],
	       1'd0,
	       requestR[127:64],
	       65'h0AAAAAAAAAAAAAAAA,
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd2 } ;
  assign MUX_fpu$request_put_1__VAL_11 =
	     { 1'd0,
	       requestR[191:128],
	       1'd0,
	       requestR[127:64],
	       1'd0,
	       requestR[63:0],
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd5 } ;
  assign MUX_fpu$request_put_1__VAL_12 =
	     { 1'd0,
	       requestR[191:128],
	       1'd0,
	       requestR[127:64],
	       1'd0,
	       requestR[63:0],
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd6 } ;
  assign MUX_fpu$request_put_1__VAL_13 =
	     { 1'd0,
	       requestR[191:128],
	       1'd0,
	       requestR[127:64],
	       1'd0,
	       requestR[63:0],
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd7 } ;
  assign MUX_fpu$request_put_1__VAL_14 =
	     { 1'd0,
	       requestR[191:128],
	       1'd0,
	       requestR[127:64],
	       1'd0,
	       requestR[63:0],
	       IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40,
	       4'd8 } ;
  assign MUX_resultR$write_1__VAL_2 =
	     { 1'd1, x__h156455, fpu$response_get[4:0] } ;
  assign MUX_resultR$write_1__VAL_3 = { 1'd1, x__h155805, 5'd0 } ;
  assign MUX_resultR$write_1__VAL_4 = { 1'd1, requestR[191:128], 5'd0 } ;
  assign MUX_resultR$write_1__VAL_6 = { 1'd1, x__h153678, x__h153497 } ;
  assign MUX_resultR$write_1__VAL_7 = { 1'd1, x__h151801, x__h153497 } ;
  assign MUX_resultR$write_1__VAL_8 = { 1'd1, x__h149106, x__h143663 } ;
  assign MUX_resultR$write_1__VAL_9 = { 1'd1, x__h144662, x__h143663 } ;
  assign MUX_resultR$write_1__VAL_10 = { 1'd1, x__h140114, x__h143663 } ;
  assign MUX_resultR$write_1__VAL_11 = { 1'd1, x__h98388, x__h139191 } ;
  assign MUX_resultR$write_1__VAL_12 = { 1'd1, x__h49683, x__h97405 } ;
  assign MUX_resultR$write_1__VAL_13 = { 1'd1, x__h48937, x__h49439 } ;
  assign MUX_resultR$write_1__VAL_14 = { 1'd1, x__h47361, x__h48680 } ;
  assign MUX_resultR$write_1__VAL_15 = { 1'd1, x__h37694, x__h47077 } ;
  assign MUX_resultR$write_1__VAL_16 = { 1'd1, x__h27746, x__h37409 } ;
  assign MUX_resultR$write_1__VAL_17 = { 1'd1, x__h27616, 5'd0 } ;
  assign MUX_resultR$write_1__VAL_18 = { 1'd1, x__h27492, 5'd0 } ;
  assign MUX_resultR$write_1__VAL_19 = { 1'd1, x__h27370, 5'd0 } ;
  assign MUX_resultR$write_1__VAL_20 = { 1'd1, x__h26203, 5'd0 } ;
  assign MUX_resultR$write_1__VAL_21 = { 1'd1, x__h25117, x__h24936 } ;
  assign MUX_resultR$write_1__VAL_22 = { 1'd1, x__h24048, x__h24936 } ;
  assign MUX_resultR$write_1__VAL_23 = { 1'd1, x__h22565, x__h19186 } ;
  assign MUX_resultR$write_1__VAL_24 = { 1'd1, x__h22427, 5'd0 } ;
  assign MUX_resultR$write_1__VAL_25 = { 1'd1, x__h22306, 5'd0 } ;
  assign MUX_resultR$write_1__VAL_26 = { 1'd1, x__h19781, x__h19186 } ;
  assign MUX_resultR$write_1__VAL_27 = { 1'd1, x__h17147, x__h19186 } ;
  assign MUX_resultR$write_1__VAL_28 = { 1'd1, x__h16397, x__h16899 } ;
  assign MUX_resultR$write_1__VAL_29 = { 1'd1, x__h14804, x__h16140 } ;
  assign MUX_resultR$write_1__VAL_30 = { 1'd1, x__h8662, x__h14520 } ;
  assign MUX_resultR$write_1__VAL_31 = { 1'd1, x__h2201, x__h8374 } ;
  assign MUX_resultR$write_1__VAL_32 = { 1'd1, x__h2053, 5'd0 } ;
  assign MUX_resultR$write_1__VAL_33 = { 1'd1, x__h1919, 5'd0 } ;
  assign MUX_resultR$write_1__VAL_34 = { 1'd1, x__h1773, 5'd0 } ;
  // inlined wires
  assign dw_valid$wget = !WILL_FIRE_RL_rl_drive_fpu_result || resultR[69] ;
  assign dw_valid$whas =
	     WILL_FIRE_RL_rl_drive_fpu_result ||
	     WILL_FIRE_RL_rl_get_fpu_result ||
	     WILL_FIRE_RL_doFCLASS_D ||
	     WILL_FIRE_RL_doFMV_X_D ||
	     WILL_FIRE_RL_doFMV_D_X ||
	     WILL_FIRE_RL_doFLE_D ||
	     WILL_FIRE_RL_doFLT_D ||
	     WILL_FIRE_RL_doFEQ_D ||
	     WILL_FIRE_RL_doFMAX_D ||
	     WILL_FIRE_RL_doFMIN_D ||
	     WILL_FIRE_RL_doFCVT_D_S ||
	     WILL_FIRE_RL_doFCVT_S_D ||
	     WILL_FIRE_RL_doFCVT_WU_D ||
	     WILL_FIRE_RL_doFCVT_W_D ||
	     WILL_FIRE_RL_doFCVT_D_WU ||
	     WILL_FIRE_RL_doFCVT_D_W ||
	     WILL_FIRE_RL_doFSGNJX_D ||
	     WILL_FIRE_RL_doFSGNJN_D ||
	     WILL_FIRE_RL_doFSGNJ_D ||
	     WILL_FIRE_RL_doFCLASS_S ||
	     WILL_FIRE_RL_doFLE_S ||
	     WILL_FIRE_RL_doFLT_S ||
	     WILL_FIRE_RL_doFEQ_S ||
	     WILL_FIRE_RL_doFMV_X_W ||
	     WILL_FIRE_RL_doFMV_W_X ||
	     WILL_FIRE_RL_doFMAX_S ||
	     WILL_FIRE_RL_doFMIN_S ||
	     WILL_FIRE_RL_doFCVT_WU_S ||
	     WILL_FIRE_RL_doFCVT_W_S ||
	     WILL_FIRE_RL_doFCVT_S_WU ||
	     WILL_FIRE_RL_doFCVT_S_W ||
	     WILL_FIRE_RL_doFSGNJX_S ||
	     WILL_FIRE_RL_doFSGNJN_S ||
	     WILL_FIRE_RL_doFSGNJ_S ;
  always@(WILL_FIRE_RL_doFSGNJN_S or
	  MUX_dw_result$wset_1__VAL_1 or
	  WILL_FIRE_RL_doFSGNJ_S or
	  MUX_dw_result$wset_1__VAL_2 or
	  WILL_FIRE_RL_doFSGNJX_S or
	  MUX_dw_result$wset_1__VAL_3 or
	  WILL_FIRE_RL_doFCVT_S_W or
	  MUX_dw_result$wset_1__VAL_4 or
	  WILL_FIRE_RL_doFCVT_S_WU or
	  MUX_dw_result$wset_1__VAL_5 or
	  WILL_FIRE_RL_doFCVT_W_S or
	  MUX_dw_result$wset_1__VAL_6 or
	  WILL_FIRE_RL_doFCVT_WU_S or
	  MUX_dw_result$wset_1__VAL_7 or
	  WILL_FIRE_RL_doFMIN_S or
	  MUX_dw_result$wset_1__VAL_8 or
	  WILL_FIRE_RL_doFMAX_S or
	  MUX_dw_result$wset_1__VAL_9 or
	  WILL_FIRE_RL_doFMV_W_X or
	  MUX_dw_result$wset_1__VAL_10 or
	  WILL_FIRE_RL_doFMV_X_W or
	  MUX_dw_result$wset_1__VAL_11 or
	  WILL_FIRE_RL_doFEQ_S or
	  MUX_dw_result$wset_1__VAL_12 or
	  WILL_FIRE_RL_doFLT_S or
	  MUX_dw_result$wset_1__VAL_13 or
	  WILL_FIRE_RL_doFLE_S or
	  MUX_dw_result$wset_1__VAL_14 or
	  WILL_FIRE_RL_doFCLASS_S or
	  MUX_dw_result$wset_1__VAL_15 or
	  WILL_FIRE_RL_doFSGNJ_D or
	  MUX_dw_result$wset_1__VAL_16 or
	  WILL_FIRE_RL_doFSGNJN_D or
	  MUX_dw_result$wset_1__VAL_17 or
	  WILL_FIRE_RL_doFSGNJX_D or
	  MUX_dw_result$wset_1__VAL_18 or
	  WILL_FIRE_RL_doFCVT_D_W or
	  MUX_dw_result$wset_1__VAL_19 or
	  WILL_FIRE_RL_doFCVT_D_WU or
	  MUX_dw_result$wset_1__VAL_20 or
	  WILL_FIRE_RL_doFCVT_W_D or
	  MUX_dw_result$wset_1__VAL_21 or
	  WILL_FIRE_RL_doFCVT_WU_D or
	  MUX_dw_result$wset_1__VAL_22 or
	  WILL_FIRE_RL_doFCVT_S_D or
	  MUX_dw_result$wset_1__VAL_23 or
	  WILL_FIRE_RL_doFCVT_D_S or
	  MUX_dw_result$wset_1__VAL_24 or
	  WILL_FIRE_RL_doFMIN_D or
	  MUX_dw_result$wset_1__VAL_25 or
	  WILL_FIRE_RL_doFMAX_D or
	  MUX_dw_result$wset_1__VAL_26 or
	  WILL_FIRE_RL_doFEQ_D or
	  MUX_dw_result$wset_1__VAL_27 or
	  WILL_FIRE_RL_doFLT_D or
	  MUX_dw_result$wset_1__VAL_28 or
	  WILL_FIRE_RL_doFLE_D or
	  MUX_dw_result$wset_1__VAL_29 or
	  MUX_dw_result$wset_1__SEL_30 or
	  MUX_dw_result$wset_1__VAL_30 or
	  WILL_FIRE_RL_doFCLASS_D or
	  MUX_dw_result$wset_1__VAL_31 or
	  WILL_FIRE_RL_rl_get_fpu_result or
	  MUX_dw_result$wset_1__VAL_32 or
	  WILL_FIRE_RL_rl_drive_fpu_result or resultR)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_doFSGNJN_S: dw_result$wget = MUX_dw_result$wset_1__VAL_1;
      WILL_FIRE_RL_doFSGNJ_S: dw_result$wget = MUX_dw_result$wset_1__VAL_2;
      WILL_FIRE_RL_doFSGNJX_S: dw_result$wget = MUX_dw_result$wset_1__VAL_3;
      WILL_FIRE_RL_doFCVT_S_W: dw_result$wget = MUX_dw_result$wset_1__VAL_4;
      WILL_FIRE_RL_doFCVT_S_WU: dw_result$wget = MUX_dw_result$wset_1__VAL_5;
      WILL_FIRE_RL_doFCVT_W_S: dw_result$wget = MUX_dw_result$wset_1__VAL_6;
      WILL_FIRE_RL_doFCVT_WU_S: dw_result$wget = MUX_dw_result$wset_1__VAL_7;
      WILL_FIRE_RL_doFMIN_S: dw_result$wget = MUX_dw_result$wset_1__VAL_8;
      WILL_FIRE_RL_doFMAX_S: dw_result$wget = MUX_dw_result$wset_1__VAL_9;
      WILL_FIRE_RL_doFMV_W_X: dw_result$wget = MUX_dw_result$wset_1__VAL_10;
      WILL_FIRE_RL_doFMV_X_W: dw_result$wget = MUX_dw_result$wset_1__VAL_11;
      WILL_FIRE_RL_doFEQ_S: dw_result$wget = MUX_dw_result$wset_1__VAL_12;
      WILL_FIRE_RL_doFLT_S: dw_result$wget = MUX_dw_result$wset_1__VAL_13;
      WILL_FIRE_RL_doFLE_S: dw_result$wget = MUX_dw_result$wset_1__VAL_14;
      WILL_FIRE_RL_doFCLASS_S: dw_result$wget = MUX_dw_result$wset_1__VAL_15;
      WILL_FIRE_RL_doFSGNJ_D: dw_result$wget = MUX_dw_result$wset_1__VAL_16;
      WILL_FIRE_RL_doFSGNJN_D: dw_result$wget = MUX_dw_result$wset_1__VAL_17;
      WILL_FIRE_RL_doFSGNJX_D: dw_result$wget = MUX_dw_result$wset_1__VAL_18;
      WILL_FIRE_RL_doFCVT_D_W: dw_result$wget = MUX_dw_result$wset_1__VAL_19;
      WILL_FIRE_RL_doFCVT_D_WU: dw_result$wget = MUX_dw_result$wset_1__VAL_20;
      WILL_FIRE_RL_doFCVT_W_D: dw_result$wget = MUX_dw_result$wset_1__VAL_21;
      WILL_FIRE_RL_doFCVT_WU_D: dw_result$wget = MUX_dw_result$wset_1__VAL_22;
      WILL_FIRE_RL_doFCVT_S_D: dw_result$wget = MUX_dw_result$wset_1__VAL_23;
      WILL_FIRE_RL_doFCVT_D_S: dw_result$wget = MUX_dw_result$wset_1__VAL_24;
      WILL_FIRE_RL_doFMIN_D: dw_result$wget = MUX_dw_result$wset_1__VAL_25;
      WILL_FIRE_RL_doFMAX_D: dw_result$wget = MUX_dw_result$wset_1__VAL_26;
      WILL_FIRE_RL_doFEQ_D: dw_result$wget = MUX_dw_result$wset_1__VAL_27;
      WILL_FIRE_RL_doFLT_D: dw_result$wget = MUX_dw_result$wset_1__VAL_28;
      WILL_FIRE_RL_doFLE_D: dw_result$wget = MUX_dw_result$wset_1__VAL_29;
      MUX_dw_result$wset_1__SEL_30:
	  dw_result$wget = MUX_dw_result$wset_1__VAL_30;
      WILL_FIRE_RL_doFCLASS_D: dw_result$wget = MUX_dw_result$wset_1__VAL_31;
      WILL_FIRE_RL_rl_get_fpu_result:
	  dw_result$wget = MUX_dw_result$wset_1__VAL_32;
      WILL_FIRE_RL_rl_drive_fpu_result: dw_result$wget = resultR[68:0];
      default: dw_result$wget =
		   69'h0AAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = set_verbosity_verbosity ;
  assign cfg_verbosity$EN = EN_set_verbosity ;
  // register requestR
  assign requestR$D_IN =
	     { 1'd1,
	       req_opcode,
	       req_f7,
	       req_rs2,
	       req_rm,
	       req_v1,
	       req_v2,
	       req_v3 } ;
  assign requestR$EN = EN_req ;
  // register resultR
  always@(EN_req or
	  WILL_FIRE_RL_rl_get_fpu_result or
	  MUX_resultR$write_1__VAL_2 or
	  WILL_FIRE_RL_doFCLASS_D or
	  MUX_resultR$write_1__VAL_3 or
	  WILL_FIRE_RL_doFMV_X_D or
	  MUX_resultR$write_1__VAL_4 or
	  WILL_FIRE_RL_doFMV_D_X or
	  WILL_FIRE_RL_doFLE_D or
	  MUX_resultR$write_1__VAL_6 or
	  WILL_FIRE_RL_doFLT_D or
	  MUX_resultR$write_1__VAL_7 or
	  WILL_FIRE_RL_doFEQ_D or
	  MUX_resultR$write_1__VAL_8 or
	  WILL_FIRE_RL_doFMAX_D or
	  MUX_resultR$write_1__VAL_9 or
	  WILL_FIRE_RL_doFMIN_D or
	  MUX_resultR$write_1__VAL_10 or
	  WILL_FIRE_RL_doFCVT_D_S or
	  MUX_resultR$write_1__VAL_11 or
	  WILL_FIRE_RL_doFCVT_S_D or
	  MUX_resultR$write_1__VAL_12 or
	  WILL_FIRE_RL_doFCVT_WU_D or
	  MUX_resultR$write_1__VAL_13 or
	  WILL_FIRE_RL_doFCVT_W_D or
	  MUX_resultR$write_1__VAL_14 or
	  WILL_FIRE_RL_doFCVT_D_WU or
	  MUX_resultR$write_1__VAL_15 or
	  WILL_FIRE_RL_doFCVT_D_W or
	  MUX_resultR$write_1__VAL_16 or
	  WILL_FIRE_RL_doFSGNJX_D or
	  MUX_resultR$write_1__VAL_17 or
	  WILL_FIRE_RL_doFSGNJN_D or
	  MUX_resultR$write_1__VAL_18 or
	  WILL_FIRE_RL_doFSGNJ_D or
	  MUX_resultR$write_1__VAL_19 or
	  WILL_FIRE_RL_doFCLASS_S or
	  MUX_resultR$write_1__VAL_20 or
	  WILL_FIRE_RL_doFLE_S or
	  MUX_resultR$write_1__VAL_21 or
	  WILL_FIRE_RL_doFLT_S or
	  MUX_resultR$write_1__VAL_22 or
	  WILL_FIRE_RL_doFEQ_S or
	  MUX_resultR$write_1__VAL_23 or
	  WILL_FIRE_RL_doFMV_X_W or
	  MUX_resultR$write_1__VAL_24 or
	  WILL_FIRE_RL_doFMV_W_X or
	  MUX_resultR$write_1__VAL_25 or
	  WILL_FIRE_RL_doFMAX_S or
	  MUX_resultR$write_1__VAL_26 or
	  WILL_FIRE_RL_doFMIN_S or
	  MUX_resultR$write_1__VAL_27 or
	  WILL_FIRE_RL_doFCVT_WU_S or
	  MUX_resultR$write_1__VAL_28 or
	  WILL_FIRE_RL_doFCVT_W_S or
	  MUX_resultR$write_1__VAL_29 or
	  WILL_FIRE_RL_doFCVT_S_WU or
	  MUX_resultR$write_1__VAL_30 or
	  WILL_FIRE_RL_doFCVT_S_W or
	  MUX_resultR$write_1__VAL_31 or
	  WILL_FIRE_RL_doFSGNJX_S or
	  MUX_resultR$write_1__VAL_32 or
	  WILL_FIRE_RL_doFSGNJN_S or
	  MUX_resultR$write_1__VAL_33 or
	  WILL_FIRE_RL_doFSGNJ_S or MUX_resultR$write_1__VAL_34)
  case (1'b1)
    EN_req: resultR$D_IN = 70'h0AAAAAAAAAAAAAAAAA;
    WILL_FIRE_RL_rl_get_fpu_result: resultR$D_IN = MUX_resultR$write_1__VAL_2;
    WILL_FIRE_RL_doFCLASS_D: resultR$D_IN = MUX_resultR$write_1__VAL_3;
    WILL_FIRE_RL_doFMV_X_D: resultR$D_IN = MUX_resultR$write_1__VAL_4;
    WILL_FIRE_RL_doFMV_D_X: resultR$D_IN = MUX_resultR$write_1__VAL_4;
    WILL_FIRE_RL_doFLE_D: resultR$D_IN = MUX_resultR$write_1__VAL_6;
    WILL_FIRE_RL_doFLT_D: resultR$D_IN = MUX_resultR$write_1__VAL_7;
    WILL_FIRE_RL_doFEQ_D: resultR$D_IN = MUX_resultR$write_1__VAL_8;
    WILL_FIRE_RL_doFMAX_D: resultR$D_IN = MUX_resultR$write_1__VAL_9;
    WILL_FIRE_RL_doFMIN_D: resultR$D_IN = MUX_resultR$write_1__VAL_10;
    WILL_FIRE_RL_doFCVT_D_S: resultR$D_IN = MUX_resultR$write_1__VAL_11;
    WILL_FIRE_RL_doFCVT_S_D: resultR$D_IN = MUX_resultR$write_1__VAL_12;
    WILL_FIRE_RL_doFCVT_WU_D: resultR$D_IN = MUX_resultR$write_1__VAL_13;
    WILL_FIRE_RL_doFCVT_W_D: resultR$D_IN = MUX_resultR$write_1__VAL_14;
    WILL_FIRE_RL_doFCVT_D_WU: resultR$D_IN = MUX_resultR$write_1__VAL_15;
    WILL_FIRE_RL_doFCVT_D_W: resultR$D_IN = MUX_resultR$write_1__VAL_16;
    WILL_FIRE_RL_doFSGNJX_D: resultR$D_IN = MUX_resultR$write_1__VAL_17;
    WILL_FIRE_RL_doFSGNJN_D: resultR$D_IN = MUX_resultR$write_1__VAL_18;
    WILL_FIRE_RL_doFSGNJ_D: resultR$D_IN = MUX_resultR$write_1__VAL_19;
    WILL_FIRE_RL_doFCLASS_S: resultR$D_IN = MUX_resultR$write_1__VAL_20;
    WILL_FIRE_RL_doFLE_S: resultR$D_IN = MUX_resultR$write_1__VAL_21;
    WILL_FIRE_RL_doFLT_S: resultR$D_IN = MUX_resultR$write_1__VAL_22;
    WILL_FIRE_RL_doFEQ_S: resultR$D_IN = MUX_resultR$write_1__VAL_23;
    WILL_FIRE_RL_doFMV_X_W: resultR$D_IN = MUX_resultR$write_1__VAL_24;
    WILL_FIRE_RL_doFMV_W_X: resultR$D_IN = MUX_resultR$write_1__VAL_25;
    WILL_FIRE_RL_doFMAX_S: resultR$D_IN = MUX_resultR$write_1__VAL_26;
    WILL_FIRE_RL_doFMIN_S: resultR$D_IN = MUX_resultR$write_1__VAL_27;
    WILL_FIRE_RL_doFCVT_WU_S: resultR$D_IN = MUX_resultR$write_1__VAL_28;
    WILL_FIRE_RL_doFCVT_W_S: resultR$D_IN = MUX_resultR$write_1__VAL_29;
    WILL_FIRE_RL_doFCVT_S_WU: resultR$D_IN = MUX_resultR$write_1__VAL_30;
    WILL_FIRE_RL_doFCVT_S_W: resultR$D_IN = MUX_resultR$write_1__VAL_31;
    WILL_FIRE_RL_doFSGNJX_S: resultR$D_IN = MUX_resultR$write_1__VAL_32;
    WILL_FIRE_RL_doFSGNJN_S: resultR$D_IN = MUX_resultR$write_1__VAL_33;
    WILL_FIRE_RL_doFSGNJ_S: resultR$D_IN = MUX_resultR$write_1__VAL_34;
    default: resultR$D_IN = 70'h2AAAAAAAAAAAAAAAAA /* unspecified value */ ;
  endcase
  assign resultR$EN =
	     EN_req || WILL_FIRE_RL_doFMV_X_D || WILL_FIRE_RL_doFMV_D_X ||
	     WILL_FIRE_RL_doFSGNJ_S ||
	     WILL_FIRE_RL_doFSGNJN_S ||
	     WILL_FIRE_RL_doFSGNJX_S ||
	     WILL_FIRE_RL_doFCVT_S_W ||
	     WILL_FIRE_RL_doFCVT_S_WU ||
	     WILL_FIRE_RL_doFCVT_W_S ||
	     WILL_FIRE_RL_doFCVT_WU_S ||
	     WILL_FIRE_RL_doFMIN_S ||
	     WILL_FIRE_RL_doFMAX_S ||
	     WILL_FIRE_RL_doFMV_W_X ||
	     WILL_FIRE_RL_doFMV_X_W ||
	     WILL_FIRE_RL_doFEQ_S ||
	     WILL_FIRE_RL_doFLT_S ||
	     WILL_FIRE_RL_doFLE_S ||
	     WILL_FIRE_RL_doFCLASS_S ||
	     WILL_FIRE_RL_doFSGNJ_D ||
	     WILL_FIRE_RL_doFSGNJN_D ||
	     WILL_FIRE_RL_doFSGNJX_D ||
	     WILL_FIRE_RL_doFCVT_D_W ||
	     WILL_FIRE_RL_doFCVT_D_WU ||
	     WILL_FIRE_RL_doFCVT_W_D ||
	     WILL_FIRE_RL_doFCVT_WU_D ||
	     WILL_FIRE_RL_doFCVT_S_D ||
	     WILL_FIRE_RL_doFCVT_D_S ||
	     WILL_FIRE_RL_doFMIN_D ||
	     WILL_FIRE_RL_doFMAX_D ||
	     WILL_FIRE_RL_doFEQ_D ||
	     WILL_FIRE_RL_doFLT_D ||
	     WILL_FIRE_RL_doFLE_D ||
	     WILL_FIRE_RL_doFCLASS_D ||
	     WILL_FIRE_RL_rl_get_fpu_result ;
  // register stateR
  always@(EN_req or
	  WILL_FIRE_RL_rl_get_fpu_result or
	  WILL_FIRE_RL_doFCLASS_D or
	  WILL_FIRE_RL_doFMV_X_D or
	  WILL_FIRE_RL_doFMV_D_X or
	  WILL_FIRE_RL_doFLE_D or
	  WILL_FIRE_RL_doFLT_D or
	  WILL_FIRE_RL_doFEQ_D or
	  WILL_FIRE_RL_doFMAX_D or
	  WILL_FIRE_RL_doFMIN_D or
	  WILL_FIRE_RL_doFCVT_D_S or
	  WILL_FIRE_RL_doFCVT_S_D or
	  WILL_FIRE_RL_doFCVT_WU_D or
	  WILL_FIRE_RL_doFCVT_W_D or
	  WILL_FIRE_RL_doFCVT_D_WU or
	  WILL_FIRE_RL_doFCVT_D_W or
	  WILL_FIRE_RL_doFSGNJX_D or
	  WILL_FIRE_RL_doFSGNJN_D or
	  WILL_FIRE_RL_doFSGNJ_D or
	  WILL_FIRE_RL_doFNMSUB_D or
	  WILL_FIRE_RL_doFNMADD_D or
	  WILL_FIRE_RL_doFMSUB_D or
	  WILL_FIRE_RL_doFMADD_D or
	  WILL_FIRE_RL_doFMUL_D or
	  WILL_FIRE_RL_doFSUB_D or
	  WILL_FIRE_RL_doFADD_D or
	  WILL_FIRE_RL_doFCLASS_S or
	  WILL_FIRE_RL_doFLE_S or
	  WILL_FIRE_RL_doFLT_S or
	  WILL_FIRE_RL_doFEQ_S or
	  WILL_FIRE_RL_doFMV_X_W or
	  WILL_FIRE_RL_doFMV_W_X or
	  WILL_FIRE_RL_doFMAX_S or
	  WILL_FIRE_RL_doFMIN_S or
	  WILL_FIRE_RL_doFCVT_WU_S or
	  WILL_FIRE_RL_doFCVT_W_S or
	  WILL_FIRE_RL_doFCVT_S_WU or
	  WILL_FIRE_RL_doFCVT_S_W or
	  WILL_FIRE_RL_doFSGNJX_S or
	  WILL_FIRE_RL_doFSGNJN_S or
	  WILL_FIRE_RL_doFSGNJ_S or
	  WILL_FIRE_RL_doFNMSUB_S or
	  WILL_FIRE_RL_doFNMADD_S or
	  WILL_FIRE_RL_doFMSUB_S or
	  WILL_FIRE_RL_doFMADD_S or
	  WILL_FIRE_RL_doFMUL_S or
	  WILL_FIRE_RL_doFSUB_S or WILL_FIRE_RL_doFADD_S)
  case (1'b1)
    EN_req: stateR$D_IN = 2'd0;
    WILL_FIRE_RL_rl_get_fpu_result || WILL_FIRE_RL_doFCLASS_D ||
    WILL_FIRE_RL_doFMV_X_D ||
    WILL_FIRE_RL_doFMV_D_X ||
    WILL_FIRE_RL_doFLE_D ||
    WILL_FIRE_RL_doFLT_D ||
    WILL_FIRE_RL_doFEQ_D ||
    WILL_FIRE_RL_doFMAX_D ||
    WILL_FIRE_RL_doFMIN_D ||
    WILL_FIRE_RL_doFCVT_D_S ||
    WILL_FIRE_RL_doFCVT_S_D ||
    WILL_FIRE_RL_doFCVT_WU_D ||
    WILL_FIRE_RL_doFCVT_W_D ||
    WILL_FIRE_RL_doFCVT_D_WU ||
    WILL_FIRE_RL_doFCVT_D_W ||
    WILL_FIRE_RL_doFSGNJX_D ||
    WILL_FIRE_RL_doFSGNJN_D ||
    WILL_FIRE_RL_doFSGNJ_D:
	stateR$D_IN = 2'd2;
    WILL_FIRE_RL_doFNMSUB_D || WILL_FIRE_RL_doFNMADD_D ||
    WILL_FIRE_RL_doFMSUB_D ||
    WILL_FIRE_RL_doFMADD_D ||
    WILL_FIRE_RL_doFMUL_D ||
    WILL_FIRE_RL_doFSUB_D ||
    WILL_FIRE_RL_doFADD_D:
	stateR$D_IN = 2'd1;
    WILL_FIRE_RL_doFCLASS_S || WILL_FIRE_RL_doFLE_S || WILL_FIRE_RL_doFLT_S ||
    WILL_FIRE_RL_doFEQ_S ||
    WILL_FIRE_RL_doFMV_X_W ||
    WILL_FIRE_RL_doFMV_W_X ||
    WILL_FIRE_RL_doFMAX_S ||
    WILL_FIRE_RL_doFMIN_S ||
    WILL_FIRE_RL_doFCVT_WU_S ||
    WILL_FIRE_RL_doFCVT_W_S ||
    WILL_FIRE_RL_doFCVT_S_WU ||
    WILL_FIRE_RL_doFCVT_S_W ||
    WILL_FIRE_RL_doFSGNJX_S ||
    WILL_FIRE_RL_doFSGNJN_S ||
    WILL_FIRE_RL_doFSGNJ_S:
	stateR$D_IN = 2'd2;
    WILL_FIRE_RL_doFNMSUB_S || WILL_FIRE_RL_doFNMADD_S ||
    WILL_FIRE_RL_doFMSUB_S ||
    WILL_FIRE_RL_doFMADD_S ||
    WILL_FIRE_RL_doFMUL_S ||
    WILL_FIRE_RL_doFSUB_S ||
    WILL_FIRE_RL_doFADD_S:
	stateR$D_IN = 2'd1;
    default: stateR$D_IN = 2'b10 /* unspecified value */ ;
  endcase
  assign stateR$EN =
	     EN_req || WILL_FIRE_RL_doFNMSUB_D || WILL_FIRE_RL_doFNMADD_D ||
	     WILL_FIRE_RL_doFMSUB_D ||
	     WILL_FIRE_RL_doFMADD_D ||
	     WILL_FIRE_RL_doFMUL_D ||
	     WILL_FIRE_RL_doFSUB_D ||
	     WILL_FIRE_RL_doFADD_D ||
	     WILL_FIRE_RL_doFNMSUB_S ||
	     WILL_FIRE_RL_doFNMADD_S ||
	     WILL_FIRE_RL_doFMSUB_S ||
	     WILL_FIRE_RL_doFMADD_S ||
	     WILL_FIRE_RL_doFMUL_S ||
	     WILL_FIRE_RL_doFSUB_S ||
	     WILL_FIRE_RL_doFADD_S ||
	     WILL_FIRE_RL_rl_get_fpu_result ||
	     WILL_FIRE_RL_doFCLASS_D ||
	     WILL_FIRE_RL_doFMV_X_D ||
	     WILL_FIRE_RL_doFMV_D_X ||
	     WILL_FIRE_RL_doFLE_D ||
	     WILL_FIRE_RL_doFLT_D ||
	     WILL_FIRE_RL_doFEQ_D ||
	     WILL_FIRE_RL_doFMAX_D ||
	     WILL_FIRE_RL_doFMIN_D ||
	     WILL_FIRE_RL_doFCVT_D_S ||
	     WILL_FIRE_RL_doFCVT_S_D ||
	     WILL_FIRE_RL_doFCVT_WU_D ||
	     WILL_FIRE_RL_doFCVT_W_D ||
	     WILL_FIRE_RL_doFCVT_D_WU ||
	     WILL_FIRE_RL_doFCVT_D_W ||
	     WILL_FIRE_RL_doFSGNJX_D ||
	     WILL_FIRE_RL_doFSGNJN_D ||
	     WILL_FIRE_RL_doFSGNJ_D ||
	     WILL_FIRE_RL_doFCLASS_S ||
	     WILL_FIRE_RL_doFLE_S ||
	     WILL_FIRE_RL_doFLT_S ||
	     WILL_FIRE_RL_doFEQ_S ||
	     WILL_FIRE_RL_doFMV_X_W ||
	     WILL_FIRE_RL_doFMV_W_X ||
	     WILL_FIRE_RL_doFMAX_S ||
	     WILL_FIRE_RL_doFMIN_S ||
	     WILL_FIRE_RL_doFCVT_WU_S ||
	     WILL_FIRE_RL_doFCVT_W_S ||
	     WILL_FIRE_RL_doFCVT_S_WU ||
	     WILL_FIRE_RL_doFCVT_S_W ||
	     WILL_FIRE_RL_doFSGNJX_S ||
	     WILL_FIRE_RL_doFSGNJN_S ||
	     WILL_FIRE_RL_doFSGNJ_S ;
  // submodule fpu
  always@(WILL_FIRE_RL_doFADD_S or
	  MUX_fpu$request_put_1__VAL_1 or
	  WILL_FIRE_RL_doFSUB_S or
	  MUX_fpu$request_put_1__VAL_2 or
	  WILL_FIRE_RL_doFMUL_S or
	  MUX_fpu$request_put_1__VAL_3 or
	  WILL_FIRE_RL_doFMADD_S or
	  MUX_fpu$request_put_1__VAL_4 or
	  WILL_FIRE_RL_doFMSUB_S or
	  MUX_fpu$request_put_1__VAL_5 or
	  WILL_FIRE_RL_doFNMADD_S or
	  MUX_fpu$request_put_1__VAL_6 or
	  WILL_FIRE_RL_doFNMSUB_S or
	  MUX_fpu$request_put_1__VAL_7 or
	  WILL_FIRE_RL_doFADD_D or
	  MUX_fpu$request_put_1__VAL_8 or
	  WILL_FIRE_RL_doFSUB_D or
	  MUX_fpu$request_put_1__VAL_9 or
	  WILL_FIRE_RL_doFMUL_D or
	  MUX_fpu$request_put_1__VAL_10 or
	  WILL_FIRE_RL_doFMADD_D or
	  MUX_fpu$request_put_1__VAL_11 or
	  WILL_FIRE_RL_doFMSUB_D or
	  MUX_fpu$request_put_1__VAL_12 or
	  WILL_FIRE_RL_doFNMADD_D or
	  MUX_fpu$request_put_1__VAL_13 or
	  WILL_FIRE_RL_doFNMSUB_D or MUX_fpu$request_put_1__VAL_14)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_doFADD_S: fpu$request_put = MUX_fpu$request_put_1__VAL_1;
      WILL_FIRE_RL_doFSUB_S: fpu$request_put = MUX_fpu$request_put_1__VAL_2;
      WILL_FIRE_RL_doFMUL_S: fpu$request_put = MUX_fpu$request_put_1__VAL_3;
      WILL_FIRE_RL_doFMADD_S: fpu$request_put = MUX_fpu$request_put_1__VAL_4;
      WILL_FIRE_RL_doFMSUB_S: fpu$request_put = MUX_fpu$request_put_1__VAL_5;
      WILL_FIRE_RL_doFNMADD_S: fpu$request_put = MUX_fpu$request_put_1__VAL_6;
      WILL_FIRE_RL_doFNMSUB_S: fpu$request_put = MUX_fpu$request_put_1__VAL_7;
      WILL_FIRE_RL_doFADD_D: fpu$request_put = MUX_fpu$request_put_1__VAL_8;
      WILL_FIRE_RL_doFSUB_D: fpu$request_put = MUX_fpu$request_put_1__VAL_9;
      WILL_FIRE_RL_doFMUL_D: fpu$request_put = MUX_fpu$request_put_1__VAL_10;
      WILL_FIRE_RL_doFMADD_D: fpu$request_put = MUX_fpu$request_put_1__VAL_11;
      WILL_FIRE_RL_doFMSUB_D: fpu$request_put = MUX_fpu$request_put_1__VAL_12;
      WILL_FIRE_RL_doFNMADD_D:
	  fpu$request_put = MUX_fpu$request_put_1__VAL_13;
      WILL_FIRE_RL_doFNMSUB_D:
	  fpu$request_put = MUX_fpu$request_put_1__VAL_14;
      default: fpu$request_put =
		   202'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fpu$EN_request_put =
	     WILL_FIRE_RL_doFADD_S || WILL_FIRE_RL_doFSUB_S ||
	     WILL_FIRE_RL_doFMUL_S ||
	     WILL_FIRE_RL_doFMADD_S ||
	     WILL_FIRE_RL_doFMSUB_S ||
	     WILL_FIRE_RL_doFNMADD_S ||
	     WILL_FIRE_RL_doFNMSUB_S ||
	     WILL_FIRE_RL_doFADD_D ||
	     WILL_FIRE_RL_doFSUB_D ||
	     WILL_FIRE_RL_doFMUL_D ||
	     WILL_FIRE_RL_doFMADD_D ||
	     WILL_FIRE_RL_doFMSUB_D ||
	     WILL_FIRE_RL_doFNMADD_D ||
	     WILL_FIRE_RL_doFNMSUB_D ;
  assign fpu$EN_response_get = CAN_FIRE_RL_rl_get_fpu_result ;
  // submodule frmFpuF
  assign frmFpuF$D_IN = 1'b0 ;
  assign frmFpuF$ENQ = 1'b0 ;
  assign frmFpuF$DEQ = 1'b0 ;
  assign frmFpuF$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_ETC__q60 =
	     _0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2076 ?
	       _theResult___snd__h69713 :
	       _theResult____h61543 ;
  assign IF_0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR__ETC__q97 =
	     _0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3396 ?
	       _theResult___snd__h128901 :
	       _theResult____h120602 ;
  assign IF_0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BIT_ETC__q65 =
	     _0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2560 ?
	       _theResult___snd__h87566 :
	       _theResult____h79267 ;
  assign IF_0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_E_ETC__q100 =
	     _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3469 ?
	       _theResult___snd__h119254 :
	       _theResult___snd__h137653 ;
  assign IF_0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_E_ETC__q94 =
	     _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3076 ?
	       _theResult___snd__h119254 :
	       57'd0 ;
  assign IF_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_ETC__q62 =
	     _0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2238 ?
	       _theResult___snd__h78325 :
	       57'd0 ;
  assign IF_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_ETC__q68 =
	     _0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2633 ?
	       _theResult___snd__h78325 :
	       _theResult___snd__h96202 ;
  assign IF_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_ETC___d2820 =
	     _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1842 ?
	       ((_theResult___fst_exp__h69650 == 8'd255) ?
		  requestR[191] :
		  ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		    requestR[194:192] != 3'h3 &&
		    requestR[194:192] != 3'h4) ?
		     CASE_guard1553_0b0_requestR_BIT_191_0b1_reques_ETC__q86 :
		     CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q87)) :
	       ((_theResult___fst_exp__h78336 == 8'd255) ?
		  requestR[191] :
		  ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		    requestR[194:192] != 3'h3 &&
		    requestR[194:192] != 3'h4) ?
		     CASE_guard0288_0b0_requestR_BIT_191_0b1_reques_ETC__q88 :
		     CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q89)) ;
  assign IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d1286 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1235 ?
	       ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		 requestR[194:192] != 3'h3 &&
		 requestR[194:192] != 3'h4) ?
		  CASE_guard5772_0b0_requestR_BIT_159_0b1_reques_ETC__q35 :
		  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q36) :
	       ((x__h36517[10:0] == 11'd2047) ?
		  requestR[159] :
		  ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		    requestR[194:192] != 3'h3 &&
		    requestR[194:192] != 3'h4) ?
		     CASE_guard6502_0b0_requestR_BIT_159_0b1_reques_ETC__q37 :
		     CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q38)) ;
  assign IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d1401 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1235 ?
	       guard__h35772 != 2'b0 :
	       x__h36517[10:0] != 11'd2047 && guard__h36502 != 2'b0 ;
  assign IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d325 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d264 ?
	       ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		 requestR[194:192] != 3'h3 &&
		 requestR[194:192] != 3'h4) ?
		  CASE_guard136_0b0_requestR_BIT_159_0b1_request_ETC__q8 :
		  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q9) :
	       ((x__h7681[7:0] == 8'd255) ?
		  requestR[159] :
		  ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		    requestR[194:192] != 3'h3 &&
		    requestR[194:192] != 3'h4) ?
		     CASE_guard666_0b0_requestR_BIT_159_0b1_request_ETC__q10 :
		     CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q11)) ;
  assign IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d475 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d264 ?
	       guard__h7136 != 2'b0 :
	       x__h7681[7:0] != 8'd255 && guard__h7666 != 2'b0 ;
  assign IF_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THE_ETC___d1584 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1448 ?
	       guard__h45468 != 2'b0 :
	       x__h46212[10:0] != 11'd2047 && guard__h46197 != 2'b0 ;
  assign IF_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THE_ETC___d789 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d619 ?
	       guard__h13313 != 2'b0 :
	       x__h13854[7:0] != 8'd255 && guard__h13839 != 2'b0 ;
  assign IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_TO_180__ETC___d2074 =
	     (_theResult____h61543[56] ?
		6'd0 :
		(_theResult____h61543[55] ?
		   6'd1 :
		   (_theResult____h61543[54] ?
		      6'd2 :
		      (_theResult____h61543[53] ?
			 6'd3 :
			 (_theResult____h61543[52] ?
			    6'd4 :
			    (_theResult____h61543[51] ?
			       6'd5 :
			       (_theResult____h61543[50] ?
				  6'd6 :
				  (_theResult____h61543[49] ?
				     6'd7 :
				     (_theResult____h61543[48] ?
					6'd8 :
					(_theResult____h61543[47] ?
					   6'd9 :
					   (_theResult____h61543[46] ?
					      6'd10 :
					      (_theResult____h61543[45] ?
						 6'd11 :
						 (_theResult____h61543[44] ?
						    6'd12 :
						    (_theResult____h61543[43] ?
						       6'd13 :
						       (_theResult____h61543[42] ?
							  6'd14 :
							  (_theResult____h61543[41] ?
							     6'd15 :
							     (_theResult____h61543[40] ?
								6'd16 :
								(_theResult____h61543[39] ?
								   6'd17 :
								   (_theResult____h61543[38] ?
								      6'd18 :
								      (_theResult____h61543[37] ?
									 6'd19 :
									 (_theResult____h61543[36] ?
									    6'd20 :
									    (_theResult____h61543[35] ?
									       6'd21 :
									       (_theResult____h61543[34] ?
										  6'd22 :
										  (_theResult____h61543[33] ?
										     6'd23 :
										     (_theResult____h61543[32] ?
											6'd24 :
											(_theResult____h61543[31] ?
											   6'd25 :
											   (_theResult____h61543[30] ?
											      6'd26 :
											      (_theResult____h61543[29] ?
												 6'd27 :
												 (_theResult____h61543[28] ?
												    6'd28 :
												    (_theResult____h61543[27] ?
												       6'd29 :
												       (_theResult____h61543[26] ?
													  6'd30 :
													  (_theResult____h61543[25] ?
													     6'd31 :
													     (_theResult____h61543[24] ?
														6'd32 :
														(_theResult____h61543[23] ?
														   6'd33 :
														   (_theResult____h61543[22] ?
														      6'd34 :
														      (_theResult____h61543[21] ?
															 6'd35 :
															 (_theResult____h61543[20] ?
															    6'd36 :
															    (_theResult____h61543[19] ?
															       6'd37 :
															       (_theResult____h61543[18] ?
																  6'd38 :
																  (_theResult____h61543[17] ?
																     6'd39 :
																     (_theResult____h61543[16] ?
																	6'd40 :
																	(_theResult____h61543[15] ?
																	   6'd41 :
																	   (_theResult____h61543[14] ?
																	      6'd42 :
																	      (_theResult____h61543[13] ?
																		 6'd43 :
																		 (_theResult____h61543[12] ?
																		    6'd44 :
																		    (_theResult____h61543[11] ?
																		       6'd45 :
																		       (_theResult____h61543[10] ?
																			  6'd46 :
																			  (_theResult____h61543[9] ?
																			     6'd47 :
																			     (_theResult____h61543[8] ?
																				6'd48 :
																				(_theResult____h61543[7] ?
																				   6'd49 :
																				   (_theResult____h61543[6] ?
																				      6'd50 :
																				      (_theResult____h61543[5] ?
																					 6'd51 :
																					 (_theResult____h61543[4] ?
																					    6'd52 :
																					    (_theResult____h61543[3] ?
																					       6'd53 :
																					       (_theResult____h61543[2] ?
																						  6'd54 :
																						  (_theResult____h61543[1] ?
																						     6'd55 :
																						     (_theResult____h61543[0] ?
																							6'd56 :
																							6'd57))))))))))))))))))))))))))))))))))))))))))))))))))))))))) -
	     6'd1 ;
  assign IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_191_TO__ETC___d3394 =
	     (_theResult____h120602[56] ?
		6'd0 :
		(_theResult____h120602[55] ?
		   6'd1 :
		   (_theResult____h120602[54] ?
		      6'd2 :
		      (_theResult____h120602[53] ?
			 6'd3 :
			 (_theResult____h120602[52] ?
			    6'd4 :
			    (_theResult____h120602[51] ?
			       6'd5 :
			       (_theResult____h120602[50] ?
				  6'd6 :
				  (_theResult____h120602[49] ?
				     6'd7 :
				     (_theResult____h120602[48] ?
					6'd8 :
					(_theResult____h120602[47] ?
					   6'd9 :
					   (_theResult____h120602[46] ?
					      6'd10 :
					      (_theResult____h120602[45] ?
						 6'd11 :
						 (_theResult____h120602[44] ?
						    6'd12 :
						    (_theResult____h120602[43] ?
						       6'd13 :
						       (_theResult____h120602[42] ?
							  6'd14 :
							  (_theResult____h120602[41] ?
							     6'd15 :
							     (_theResult____h120602[40] ?
								6'd16 :
								(_theResult____h120602[39] ?
								   6'd17 :
								   (_theResult____h120602[38] ?
								      6'd18 :
								      (_theResult____h120602[37] ?
									 6'd19 :
									 (_theResult____h120602[36] ?
									    6'd20 :
									    (_theResult____h120602[35] ?
									       6'd21 :
									       (_theResult____h120602[34] ?
										  6'd22 :
										  (_theResult____h120602[33] ?
										     6'd23 :
										     (_theResult____h120602[32] ?
											6'd24 :
											(_theResult____h120602[31] ?
											   6'd25 :
											   (_theResult____h120602[30] ?
											      6'd26 :
											      (_theResult____h120602[29] ?
												 6'd27 :
												 (_theResult____h120602[28] ?
												    6'd28 :
												    (_theResult____h120602[27] ?
												       6'd29 :
												       (_theResult____h120602[26] ?
													  6'd30 :
													  (_theResult____h120602[25] ?
													     6'd31 :
													     (_theResult____h120602[24] ?
														6'd32 :
														(_theResult____h120602[23] ?
														   6'd33 :
														   (_theResult____h120602[22] ?
														      6'd34 :
														      (_theResult____h120602[21] ?
															 6'd35 :
															 (_theResult____h120602[20] ?
															    6'd36 :
															    (_theResult____h120602[19] ?
															       6'd37 :
															       (_theResult____h120602[18] ?
																  6'd38 :
																  (_theResult____h120602[17] ?
																     6'd39 :
																     (_theResult____h120602[16] ?
																	6'd40 :
																	(_theResult____h120602[15] ?
																	   6'd41 :
																	   (_theResult____h120602[14] ?
																	      6'd42 :
																	      (_theResult____h120602[13] ?
																		 6'd43 :
																		 (_theResult____h120602[12] ?
																		    6'd44 :
																		    (_theResult____h120602[11] ?
																		       6'd45 :
																		       (_theResult____h120602[10] ?
																			  6'd46 :
																			  (_theResult____h120602[9] ?
																			     6'd47 :
																			     (_theResult____h120602[8] ?
																				6'd48 :
																				(_theResult____h120602[7] ?
																				   6'd49 :
																				   (_theResult____h120602[6] ?
																				      6'd50 :
																				      (_theResult____h120602[5] ?
																					 6'd51 :
																					 (_theResult____h120602[4] ?
																					    6'd52 :
																					    (_theResult____h120602[3] ?
																					       6'd53 :
																					       (_theResult____h120602[2] ?
																						  6'd54 :
																						  (_theResult____h120602[1] ?
																						     6'd55 :
																						     (_theResult____h120602[0] ?
																							6'd56 :
																							6'd57))))))))))))))))))))))))))))))))))))))))))))))))))))))))) -
	     6'd1 ;
  assign IF_IF_3970_MINUS_SEXT_requestR_BITS_190_TO_180_ETC___d2558 =
	     (_theResult____h79267[56] ?
		6'd0 :
		(_theResult____h79267[55] ?
		   6'd1 :
		   (_theResult____h79267[54] ?
		      6'd2 :
		      (_theResult____h79267[53] ?
			 6'd3 :
			 (_theResult____h79267[52] ?
			    6'd4 :
			    (_theResult____h79267[51] ?
			       6'd5 :
			       (_theResult____h79267[50] ?
				  6'd6 :
				  (_theResult____h79267[49] ?
				     6'd7 :
				     (_theResult____h79267[48] ?
					6'd8 :
					(_theResult____h79267[47] ?
					   6'd9 :
					   (_theResult____h79267[46] ?
					      6'd10 :
					      (_theResult____h79267[45] ?
						 6'd11 :
						 (_theResult____h79267[44] ?
						    6'd12 :
						    (_theResult____h79267[43] ?
						       6'd13 :
						       (_theResult____h79267[42] ?
							  6'd14 :
							  (_theResult____h79267[41] ?
							     6'd15 :
							     (_theResult____h79267[40] ?
								6'd16 :
								(_theResult____h79267[39] ?
								   6'd17 :
								   (_theResult____h79267[38] ?
								      6'd18 :
								      (_theResult____h79267[37] ?
									 6'd19 :
									 (_theResult____h79267[36] ?
									    6'd20 :
									    (_theResult____h79267[35] ?
									       6'd21 :
									       (_theResult____h79267[34] ?
										  6'd22 :
										  (_theResult____h79267[33] ?
										     6'd23 :
										     (_theResult____h79267[32] ?
											6'd24 :
											(_theResult____h79267[31] ?
											   6'd25 :
											   (_theResult____h79267[30] ?
											      6'd26 :
											      (_theResult____h79267[29] ?
												 6'd27 :
												 (_theResult____h79267[28] ?
												    6'd28 :
												    (_theResult____h79267[27] ?
												       6'd29 :
												       (_theResult____h79267[26] ?
													  6'd30 :
													  (_theResult____h79267[25] ?
													     6'd31 :
													     (_theResult____h79267[24] ?
														6'd32 :
														(_theResult____h79267[23] ?
														   6'd33 :
														   (_theResult____h79267[22] ?
														      6'd34 :
														      (_theResult____h79267[21] ?
															 6'd35 :
															 (_theResult____h79267[20] ?
															    6'd36 :
															    (_theResult____h79267[19] ?
															       6'd37 :
															       (_theResult____h79267[18] ?
																  6'd38 :
																  (_theResult____h79267[17] ?
																     6'd39 :
																     (_theResult____h79267[16] ?
																	6'd40 :
																	(_theResult____h79267[15] ?
																	   6'd41 :
																	   (_theResult____h79267[14] ?
																	      6'd42 :
																	      (_theResult____h79267[13] ?
																		 6'd43 :
																		 (_theResult____h79267[12] ?
																		    6'd44 :
																		    (_theResult____h79267[11] ?
																		       6'd45 :
																		       (_theResult____h79267[10] ?
																			  6'd46 :
																			  (_theResult____h79267[9] ?
																			     6'd47 :
																			     (_theResult____h79267[8] ?
																				6'd48 :
																				(_theResult____h79267[7] ?
																				   6'd49 :
																				   (_theResult____h79267[6] ?
																				      6'd50 :
																				      (_theResult____h79267[5] ?
																					 6'd51 :
																					 (_theResult____h79267[4] ?
																					    6'd52 :
																					    (_theResult____h79267[3] ?
																					       6'd53 :
																					       (_theResult____h79267[2] ?
																						  6'd54 :
																						  (_theResult____h79267[1] ?
																						     6'd55 :
																						     (_theResult____h79267[0] ?
																							6'd56 :
																							6'd57))))))))))))))))))))))))))))))))))))))))))))))))))))))))) -
	     6'd1 ;
  assign IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_191__ETC___d3638 =
	     (_theResult___fst_exp__h128838 == 11'd2047) ?
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159] :
	       ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		 requestR[194:192] != 3'h3 &&
		 requestR[194:192] != 3'h4) ?
		  CASE_guard20612_0b0_requestR_BITS_191_TO_160_E_ETC__q110 :
		  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q111) ;
  assign IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2133 =
	     (guard__h61553 == 2'b0 || requestR[191]) ?
	       _theResult___fst_exp__h69650 :
	       _theResult___exp__h70176 ;
  assign IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2135 =
	     (guard__h61553 == 2'b0) ?
	       _theResult___fst_exp__h69650 :
	       (requestR[191] ?
		  _theResult___exp__h70176 :
		  _theResult___fst_exp__h69650) ;
  assign IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2720 =
	     (guard__h61553 == 2'b0 || requestR[191]) ?
	       sfdin__h69644[56:34] :
	       _theResult___sfd__h70177 ;
  assign IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2722 =
	     (guard__h61553 == 2'b0) ?
	       sfdin__h69644[56:34] :
	       (requestR[191] ?
		  _theResult___sfd__h70177 :
		  sfdin__h69644[56:34]) ;
  assign IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3453 =
	     (guard__h120612 == 2'b0 ||
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       _theResult___fst_exp__h128838 :
	       _theResult___exp__h129567 ;
  assign IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3455 =
	     (guard__h120612 == 2'b0) ?
	       _theResult___fst_exp__h128838 :
	       ((requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		  _theResult___exp__h129567 :
		  _theResult___fst_exp__h128838) ;
  assign IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3582 =
	     (guard__h120612 == 2'b0 ||
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       sfdin__h128832[56:5] :
	       _theResult___sfd__h129568 ;
  assign IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3584 =
	     (guard__h120612 == 2'b0) ?
	       sfdin__h128832[56:5] :
	       ((requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		  _theResult___sfd__h129568 :
		  sfdin__h128832[56:5]) ;
  assign IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2617 =
	     (guard__h79277 == 2'b0 || requestR[191]) ?
	       _theResult___fst_exp__h87503 :
	       _theResult___exp__h88029 ;
  assign IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2619 =
	     (guard__h79277 == 2'b0) ?
	       _theResult___fst_exp__h87503 :
	       (requestR[191] ?
		  _theResult___exp__h88029 :
		  _theResult___fst_exp__h87503) ;
  assign IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2766 =
	     (guard__h79277 == 2'b0 || requestR[191]) ?
	       sfdin__h87497[56:34] :
	       _theResult___sfd__h88030 ;
  assign IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2768 =
	     (guard__h79277 == 2'b0) ?
	       sfdin__h87497[56:34] :
	       (requestR[191] ?
		  _theResult___sfd__h88030 :
		  sfdin__h87497[56:34]) ;
  assign IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3128 =
	     (guard__h111304 == 2'b0 ||
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       _theResult___fst_exp__h119265 :
	       _theResult___exp__h119920 ;
  assign IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3130 =
	     (guard__h111304 == 2'b0) ?
	       _theResult___fst_exp__h119265 :
	       ((requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		  _theResult___exp__h119920 :
		  _theResult___fst_exp__h119265) ;
  assign IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3522 =
	     (guard__h129679 == 2'b0 ||
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       _theResult___fst_exp__h137669 :
	       _theResult___exp__h138349 ;
  assign IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3524 =
	     (guard__h129679 == 2'b0) ?
	       _theResult___fst_exp__h137669 :
	       ((requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		  _theResult___exp__h138349 :
		  _theResult___fst_exp__h137669) ;
  assign IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3555 =
	     (guard__h111304 == 2'b0 ||
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       _theResult___snd__h119216[56:5] :
	       _theResult___sfd__h119921 ;
  assign IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3557 =
	     (guard__h111304 == 2'b0) ?
	       _theResult___snd__h119216[56:5] :
	       ((requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		  _theResult___sfd__h119921 :
		  _theResult___snd__h119216[56:5]) ;
  assign IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3601 =
	     (guard__h129679 == 2'b0 ||
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       _theResult___snd__h137615[56:5] :
	       _theResult___sfd__h138350 ;
  assign IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3603 =
	     (guard__h129679 == 2'b0) ?
	       _theResult___snd__h137615[56:5] :
	       ((requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		  _theResult___sfd__h138350 :
		  _theResult___snd__h137615[56:5]) ;
  assign IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2290 =
	     (guard__h70288 == 2'b0 || requestR[191]) ?
	       _theResult___fst_exp__h78336 :
	       _theResult___exp__h78788 ;
  assign IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2292 =
	     (guard__h70288 == 2'b0) ?
	       _theResult___fst_exp__h78336 :
	       (requestR[191] ?
		  _theResult___exp__h78788 :
		  _theResult___fst_exp__h78336) ;
  assign IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2686 =
	     (guard__h88141 == 2'b0 || requestR[191]) ?
	       _theResult___fst_exp__h96218 :
	       _theResult___exp__h96695 ;
  assign IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2688 =
	     (guard__h88141 == 2'b0) ?
	       _theResult___fst_exp__h96218 :
	       (requestR[191] ?
		  _theResult___exp__h96695 :
		  _theResult___fst_exp__h96218) ;
  assign IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2739 =
	     (guard__h70288 == 2'b0 || requestR[191]) ?
	       _theResult___snd__h78287[56:34] :
	       _theResult___sfd__h78789 ;
  assign IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2741 =
	     (guard__h70288 == 2'b0) ?
	       _theResult___snd__h78287[56:34] :
	       (requestR[191] ?
		  _theResult___sfd__h78789 :
		  _theResult___snd__h78287[56:34]) ;
  assign IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2785 =
	     (guard__h88141 == 2'b0 || requestR[191]) ?
	       _theResult___snd__h96164[56:34] :
	       _theResult___sfd__h96696 ;
  assign IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2787 =
	     (guard__h88141 == 2'b0) ?
	       _theResult___snd__h96164[56:34] :
	       (requestR[191] ?
		  _theResult___sfd__h96696 :
		  _theResult___snd__h96164[56:34]) ;
  assign IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFF_ETC___d3646 =
	     (_theResult___fst_exp__h137669 == 11'd2047) ?
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159] :
	       ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		 requestR[194:192] != 3'h3 &&
		 requestR[194:192] != 3'h4) ?
		  CASE_guard29679_0b0_requestR_BITS_191_TO_160_E_ETC__q112 :
		  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q113) ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1307 =
	     (guard__h35772 == 2'b0) ?
	       11'd0 :
	       (requestR[159] ? _theResult___exp__h36388 : 11'd0) ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1333 =
	     (guard__h36502 == 2'b0 || requestR[159]) ?
	       x__h36517[10:0] :
	       _theResult___exp__h37144 ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1335 =
	     (guard__h36502 == 2'b0) ?
	       x__h36517[10:0] :
	       (requestR[159] ? _theResult___exp__h37144 : x__h36517[10:0]) ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1356 =
	     (guard__h35772 == 2'b0 || requestR[159]) ?
	       sfd___3__h35762[54:3] :
	       _theResult___sfd__h36389 ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1358 =
	     (guard__h35772 == 2'b0) ?
	       sfd___3__h35762[54:3] :
	       (requestR[159] ?
		  _theResult___sfd__h36389 :
		  sfd___3__h35762[54:3]) ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1374 =
	     (guard__h36502 == 2'b0 || requestR[159]) ?
	       sfd___3__h35762[53:2] :
	       _theResult___sfd__h37145 ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1376 =
	     (guard__h36502 == 2'b0) ?
	       sfd___3__h35762[53:2] :
	       (requestR[159] ?
		  _theResult___sfd__h37145 :
		  sfd___3__h35762[53:2]) ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d347 =
	     (guard__h7136 == 2'b0) ?
	       8'd0 :
	       (requestR[159] ? _theResult___exp__h7552 : 8'd0) ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d373 =
	     (guard__h7666 == 2'b0 || requestR[159]) ?
	       x__h7681[7:0] :
	       _theResult___exp__h8105 ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d375 =
	     (guard__h7666 == 2'b0) ?
	       x__h7681[7:0] :
	       (requestR[159] ? _theResult___exp__h8105 : x__h7681[7:0]) ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d396 =
	     (guard__h7136 == 2'b0 || requestR[159]) ?
	       sfd___3__h7126[31:9] :
	       _theResult___sfd__h7553 ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d398 =
	     (guard__h7136 == 2'b0) ?
	       sfd___3__h7126[31:9] :
	       (requestR[159] ?
		  _theResult___sfd__h7553 :
		  sfd___3__h7126[31:9]) ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d414 =
	     (guard__h7666 == 2'b0 || requestR[159]) ?
	       sfd___3__h7126[30:8] :
	       _theResult___sfd__h8106 ;
  assign IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d416 =
	     (guard__h7666 == 2'b0) ?
	       sfd___3__h7126[30:8] :
	       (requestR[159] ?
		  _theResult___sfd__h8106 :
		  sfd___3__h7126[30:8]) ;
  assign IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1031 =
	     (sV2_exp__h918 == 8'd255 && sV2_sfd__h919[22] ||
	      IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1000) ?
	       { requestR[191:160] == 32'hFFFFFFFF && requestR[159],
		 IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19 } :
	       (IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_T_ETC___d1004 ?
		  requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28 :
		  IF_NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFF_ETC___d1029) ;
  assign IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1035 =
	     (sV2_exp__h918 == 8'd255 && sV2_sfd__h919 != 23'd0 &&
	      !sV2_sfd__h919[22]) ?
	       res__h18062 :
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1034 ;
  assign IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1045 =
	     IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_T_ETC___d1004 ?
	       { requestR[191:160] == 32'hFFFFFFFF && requestR[159],
		 IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19 } :
	       IF_NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFF_ETC___d1044 ;
  assign IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1047 =
	     (sV2_exp__h918 == 8'd255 && sV2_sfd__h919[22]) ?
	       { requestR[191:160] == 32'hFFFFFFFF && requestR[159],
		 IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19 } :
	       (IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1000 ?
		  requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28 :
		  IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1045) ;
  assign IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1051 =
	     (sV2_exp__h918 == 8'd255 && sV2_sfd__h919 != 23'd0 &&
	      !sV2_sfd__h919[22]) ?
	       res__h18062 :
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1050 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1032 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816[22]) ?
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28 :
	       IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1031 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1034 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816[22] &&
	      sV2_exp__h918 == 8'd255 &&
	      sV2_sfd__h919[22]) ?
	       64'hFFFFFFFF7FC00000 :
	       { 32'hFFFFFFFF,
		 IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1032 } ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1036 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 &&
	      !sV1_sfd__h816[22]) ?
	       res__h17825 :
	       IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1035 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1048 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816[22]) ?
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28 :
	       IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1047 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1050 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816[22] &&
	      sV2_exp__h918 == 8'd255 &&
	      sV2_sfd__h919[22]) ?
	       64'hFFFFFFFF7FC00000 :
	       { 32'hFFFFFFFF,
		 IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1048 } ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1052 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 &&
	      !sV1_sfd__h816[22]) ?
	       res__h17825 :
	       IF_IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF__ETC___d1051 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1122 =
	     (sV1_exp__h815 == 8'd0 && sV1_sfd__h816 == 23'd0) ?
	       res___1__h26467 :
	       ((sV1_exp__h815 == 8'd0) ? res___1__h26486 : res__h26502) ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1123 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816 == 23'd0) ?
	       res___1__h26457 :
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1122 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3074 =
	     ((sV1_exp__h815 == 8'd0) ?
		(sV1_sfd__h816[22] ?
		   6'd2 :
		   (sV1_sfd__h816[21] ?
		      6'd3 :
		      (sV1_sfd__h816[20] ?
			 6'd4 :
			 (sV1_sfd__h816[19] ?
			    6'd5 :
			    (sV1_sfd__h816[18] ?
			       6'd6 :
			       (sV1_sfd__h816[17] ?
				  6'd7 :
				  (sV1_sfd__h816[16] ?
				     6'd8 :
				     (sV1_sfd__h816[15] ?
					6'd9 :
					(sV1_sfd__h816[14] ?
					   6'd10 :
					   (sV1_sfd__h816[13] ?
					      6'd11 :
					      (sV1_sfd__h816[12] ?
						 6'd12 :
						 (sV1_sfd__h816[11] ?
						    6'd13 :
						    (sV1_sfd__h816[10] ?
						       6'd14 :
						       (sV1_sfd__h816[9] ?
							  6'd15 :
							  (sV1_sfd__h816[8] ?
							     6'd16 :
							     (sV1_sfd__h816[7] ?
								6'd17 :
								(sV1_sfd__h816[6] ?
								   6'd18 :
								   (sV1_sfd__h816[5] ?
								      6'd19 :
								      (sV1_sfd__h816[4] ?
									 6'd20 :
									 (sV1_sfd__h816[3] ?
									    6'd21 :
									    (sV1_sfd__h816[2] ?
									       6'd22 :
									       (sV1_sfd__h816[1] ?
										  6'd23 :
										  (sV1_sfd__h816[0] ?
										     6'd24 :
										     6'd57))))))))))))))))))))))) :
		6'd1) -
	     6'd1 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3614 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0) ?
	       _theResult___snd_fst_sfd__h100339 :
	       _theResult___fst_sfd__h138466 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3650 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 ||
	      (sV1_exp__h815 == 8'd255 || sV1_exp__h815 == 8'd0) &&
	      sV1_sfd__h816 == 23'd0) ?
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159] :
	       ((sV1_exp__h815 == 8'd0) ?
		  IF_NOT_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_ETC___d3630 :
		  IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3648) ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3685 =
	     (sV1_exp__h815 == 8'd0) ?
	       _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3003 &&
	       !_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3004 &&
	       _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3664[4] :
	       SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3146 &&
	       SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3147 &&
	       _0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3681[4] ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3688 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0) ?
	       sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 &&
	       !sV1_sfd__h816[22] :
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 != 23'd0) &&
	       (sV1_exp__h815 != 8'd0 || sV1_sfd__h816 != 23'd0) &&
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3685 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3695 =
	     (sV1_exp__h815 == 8'd0) ?
	       _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3003 &&
	       !_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3004 &&
	       _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3664[3] :
	       SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3146 &&
	       SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3147 &&
	       _0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3681[3] ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3709 =
	     (sV1_exp__h815 == 8'd0) ?
	       !_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3003 ||
	       !_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3004 &&
	       _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3664[2] :
	       !SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3146 ||
	       IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3707 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3721 =
	     (sV1_exp__h815 == 8'd0) ?
	       _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3003 &&
	       (_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3004 ||
		_0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3664[1]) :
	       SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3146 &&
	       IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3719 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3733 =
	     (sV1_exp__h815 == 8'd0) ?
	       !_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3003 ||
	       !_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3004 &&
	       _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3664[0] :
	       !SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3146 ||
	       IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3731 ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d886 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816 == 23'd0) ?
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d815 :
	       ((sV1_exp__h815 == 8'd0 && sV1_sfd__h816 == 23'd0) ?
		  32'd0 :
		  IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d884) ;
  assign IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d946 =
	     (sV1_exp__h815 == 8'd0 && sV1_sfd__h816 == 23'd0) ?
	       32'd0 :
	       (NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d917[19] ?
		  32'hFFFFFFFF :
		  IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d944) ;
  assign IF_IF_requestR_BIT_159_6_THEN_NEG_requestR_BIT_ETC___d1227 =
	     sfd__h2222[31] ?
	       6'd0 :
	       (sfd__h2222[30] ?
		  6'd1 :
		  (sfd__h2222[29] ?
		     6'd2 :
		     (sfd__h2222[28] ?
			6'd3 :
			(sfd__h2222[27] ?
			   6'd4 :
			   (sfd__h2222[26] ?
			      6'd5 :
			      (sfd__h2222[25] ?
				 6'd6 :
				 (sfd__h2222[24] ?
				    6'd7 :
				    (sfd__h2222[23] ?
				       6'd8 :
				       (sfd__h2222[22] ?
					  6'd9 :
					  (sfd__h2222[21] ?
					     6'd10 :
					     (sfd__h2222[20] ?
						6'd11 :
						(sfd__h2222[19] ?
						   6'd12 :
						   (sfd__h2222[18] ?
						      6'd13 :
						      (sfd__h2222[17] ?
							 6'd14 :
							 (sfd__h2222[16] ?
							    6'd15 :
							    (sfd__h2222[15] ?
							       6'd16 :
							       (sfd__h2222[14] ?
								  6'd17 :
								  (sfd__h2222[13] ?
								     6'd18 :
								     (sfd__h2222[12] ?
									6'd19 :
									(sfd__h2222[11] ?
									   6'd20 :
									   (sfd__h2222[10] ?
									      6'd21 :
									      (sfd__h2222[9] ?
										 6'd22 :
										 (sfd__h2222[8] ?
										    6'd23 :
										    (sfd__h2222[7] ?
										       6'd24 :
										       (sfd__h2222[6] ?
											  6'd25 :
											  (sfd__h2222[5] ?
											     6'd26 :
											     (sfd__h2222[4] ?
												6'd27 :
												(sfd__h2222[3] ?
												   6'd28 :
												   (sfd__h2222[2] ?
												      6'd29 :
												      (sfd__h2222[1] ?
													 6'd30 :
													 (sfd__h2222[0] ?
													    6'd31 :
													    6'd55))))))))))))))))))))))))))))))) ;
  assign IF_IF_requestR_BIT_159_6_THEN_NEG_requestR_BIT_ETC___d255 =
	     sfd__h2222[31] ?
	       6'd0 :
	       (sfd__h2222[30] ?
		  6'd1 :
		  (sfd__h2222[29] ?
		     6'd2 :
		     (sfd__h2222[28] ?
			6'd3 :
			(sfd__h2222[27] ?
			   6'd4 :
			   (sfd__h2222[26] ?
			      6'd5 :
			      (sfd__h2222[25] ?
				 6'd6 :
				 (sfd__h2222[24] ?
				    6'd7 :
				    (sfd__h2222[23] ?
				       6'd8 :
				       (sfd__h2222[22] ?
					  6'd9 :
					  (sfd__h2222[21] ?
					     6'd10 :
					     (sfd__h2222[20] ?
						6'd11 :
						(sfd__h2222[19] ?
						   6'd12 :
						   (sfd__h2222[18] ?
						      6'd13 :
						      (sfd__h2222[17] ?
							 6'd14 :
							 (sfd__h2222[16] ?
							    6'd15 :
							    (sfd__h2222[15] ?
							       6'd16 :
							       (sfd__h2222[14] ?
								  6'd17 :
								  (sfd__h2222[13] ?
								     6'd18 :
								     (sfd__h2222[12] ?
									6'd19 :
									(sfd__h2222[11] ?
									   6'd20 :
									   (sfd__h2222[10] ?
									      6'd21 :
									      (sfd__h2222[9] ?
										 6'd22 :
										 (sfd__h2222[8] ?
										    6'd23 :
										    (sfd__h2222[7] ?
										       6'd24 :
										       (sfd__h2222[6] ?
											  6'd25 :
											  (sfd__h2222[5] ?
											     6'd26 :
											     (sfd__h2222[4] ?
												6'd27 :
												(sfd__h2222[3] ?
												   6'd28 :
												   (sfd__h2222[2] ?
												      6'd29 :
												      (sfd__h2222[1] ?
													 6'd30 :
													 (sfd__h2222[0] ?
													    6'd31 :
													    6'd32))))))))))))))))))))))))))))))) ;
  assign IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d882 =
	     NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d855 ?
	       (IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d876 ?
		  ((x__h15726[56:25] == 32'h7FFFFFFF) ?
		     x__h15726[56:25] :
		     x__h15726[56:25] + 32'd1) :
		  x__h15726[56:25]) :
	       32'd0 ;
  assign IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d884 =
	     (NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d820 ==
	      20'd1048545) ?
	       ((_theResult_____2__h14985[32:31] == 2'b11) ?
		  _theResult_____2__h14985[31:0] :
		  IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d815) :
	       (NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d853[19] ?
		  IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d815 :
		  IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d882) ;
  assign IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d908 =
	     (NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d820 ==
	      20'd1048545) ?
	       _theResult_____2__h14985[32:31] == 2'b11 &&
	       guard__h14983 != 2'd0 :
	       !NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d853[19] &&
	       (!NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d855 ||
		guard__h15537 != 2'd0) ;
  assign IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d944 =
	     NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d919 ?
	       (IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d938 ?
		  ((x__h16821[56:25] == 32'hFFFFFFFF) ?
		     x__h16821[56:25] :
		     x__h16821[56:25] + 32'd1) :
		  x__h16821[56:25]) :
	       32'd0 ;
  assign IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1673 =
	     NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1646 ?
	       (IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1667 ?
		  ((x__h48283[85:54] == 32'h7FFFFFFF) ?
		     x__h48283[85:54] :
		     x__h48283[85:54] + 32'd1) :
		  x__h48283[85:54]) :
	       32'd0 ;
  assign IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1675 =
	     (NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1611 ==
	      24'd16777185) ?
	       ((_theResult_____2__h47542[32:31] == 2'b11) ?
		  _theResult_____2__h47542[31:0] :
		  IF_requestR_BIT_191_186_THEN_2147483648_ELSE_2_ETC___d1606) :
	       (NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1644[23] ?
		  IF_requestR_BIT_191_186_THEN_2147483648_ELSE_2_ETC___d1606 :
		  IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1673) ;
  assign IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1699 =
	     (NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1611 ==
	      24'd16777185) ?
	       _theResult_____2__h47542[32:31] == 2'b11 &&
	       guard__h47540 != 2'd0 :
	       !NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1644[23] &&
	       (!NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1646 ||
		guard__h48094 != 2'd0) ;
  assign IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1735 =
	     NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1710 ?
	       (IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1729 ?
		  ((x__h49361[85:54] == 32'hFFFFFFFF) ?
		     x__h49361[85:54] :
		     x__h49361[85:54] + 32'd1) :
		  x__h49361[85:54]) :
	       32'd0 ;
  assign IF_NOT_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_15_ETC___d1287 =
	     (!_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1231 ||
	      _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1233) ?
	       requestR[159] :
	       IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d1286 ;
  assign IF_NOT_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_ETC___d3630 =
	     (!_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3003 ||
	      _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3004 ||
	      _theResult___fst_exp__h119265 == 11'd2047) ?
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159] :
	       ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		 requestR[194:192] != 3'h3 &&
		 requestR[194:192] != 3'h4) ?
		  CASE_guard11304_0b0_requestR_BITS_191_TO_160_E_ETC__q108 :
		  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q109) ;
  assign IF_NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFF_ETC___d1029 =
	     NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1028 ?
	       { requestR[191:160] == 32'hFFFFFFFF && requestR[159],
		 IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19 } :
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28 ;
  assign IF_NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFF_ETC___d1044 =
	     NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1028 ?
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28 :
	       { requestR[191:160] == 32'hFFFFFFFF && requestR[159],
		 IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19 } ;
  assign IF_NOT_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1024 =
	     (requestR[191:160] != 32'hFFFFFFFF || !requestR[159]) ?
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1013 ||
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1014 &&
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1015 :
	       !IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1018 ||
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1014 &&
	       !IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1020 ;
  assign IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3468 =
	     ((SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q96[10:0] ==
	       11'd0) ?
		12'd3074 :
		{ SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q99[10],
		  SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q99 }) -
	     12'd3074 ;
  assign IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3648 =
	     SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3146 ?
	       (SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3147 ?
		  IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_191__ETC___d3638 :
		  IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFF_ETC___d3646) :
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159] ;
  assign IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3707 =
	     SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3147 ?
	       _0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3681[2] :
	       _theResult___fst_exp__h138450 == 11'd2047 &&
	       _theResult___fst_sfd__h138451 == 52'd0 ;
  assign IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3719 =
	     SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3147 ?
	       _0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3681[1] :
	       _theResult___fst_exp__h137669 == 11'd0 &&
	       guard__h129679 != 2'b0 ;
  assign IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3731 =
	     SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3147 ?
	       _0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3681[0] :
	       _theResult___fst_exp__h137669 != 11'd2047 &&
	       guard__h129679 != 2'b0 ;
  assign IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2632 =
	     ((SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q64[7:0] ==
	       8'd0) ?
		9'd386 :
		{ SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q67[7],
		  SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q67 }) -
	     9'd386 ;
  assign IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2838 =
	     SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2313 ?
	       ((_theResult___fst_exp__h87503 == 8'd255) ?
		  requestR[191] :
		  ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		    requestR[194:192] != 3'h3 &&
		    requestR[194:192] != 3'h4) ?
		     CASE_guard9277_0b0_requestR_BIT_191_0b1_reques_ETC__q90 :
		     CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q91)) :
	       ((_theResult___fst_exp__h96218 == 8'd255) ?
		  requestR[191] :
		  ((requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
		    requestR[194:192] != 3'h3 &&
		    requestR[194:192] != 3'h4) ?
		     CASE_guard8141_0b0_requestR_BIT_191_0b1_reques_ETC__q92 :
		     CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q93)) ;
  assign IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2916 =
	     SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2313 ?
	       _0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2887[2] :
	       _theResult___fst_exp__h96796 == 8'd255 &&
	       _theResult___fst_sfd__h96797 == 23'd0 ;
  assign IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2929 =
	     SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2313 ?
	       _0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2887[1] :
	       _theResult___fst_exp__h96218 == 8'd0 && guard__h88141 != 2'b0 ;
  assign IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2942 =
	     SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2313 ?
	       _0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2887[0] :
	       _theResult___fst_exp__h96218 != 8'd255 &&
	       guard__h88141 != 2'b0 ;
  assign IF_requestR_BITS_126_TO_116_745_EQ_2047_746_AN_ETC___d3793 =
	     (requestR[126:116] == 11'd2047 && requestR[115] ||
	      requestR_BITS_190_TO_180_596_EQ_0_607_AND_requ_ETC___d3762) ?
	       requestR[191:128] :
	       (requestR_BITS_126_TO_116_745_EQ_0_759_AND_requ_ETC___d3766 ?
		  requestR[127:64] :
		  res__h143531) ;
  assign IF_requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_T_ETC___d1004 =
	     sV2_exp__h918 == 8'd0 && sV2_sfd__h919 == 23'd0 &&
	     requestR[127:96] == 32'hFFFFFFFF &&
	     requestR[95] &&
	     sV1_exp__h815 == 8'd0 &&
	     sV1_sfd__h816 == 23'd0 &&
	     (requestR[191:160] != 32'hFFFFFFFF || !requestR[159]) ;
  assign IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d1384 =
	     (requestR[159:128] == 32'd0 ||
	      !_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1231 ||
	      _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1233) ?
	       52'd0 :
	       _theResult___snd_fst_sfd__h37248 ;
  assign IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d1567 =
	     (requestR[159:128] == 32'd0 ||
	      !_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1446 ||
	      _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1447) ?
	       52'd0 :
	       _theResult___snd_fst_sfd__h46942 ;
  assign IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d385 =
	     (requestR[159:128] == 32'd0 ||
	      !sfd__h2222[31] && !sfd__h2222[30] && !sfd__h2222[29] &&
	      !sfd__h2222[28] &&
	      !sfd__h2222[27] &&
	      !sfd__h2222[26] &&
	      !sfd__h2222[25] &&
	      !sfd__h2222[24] &&
	      !sfd__h2222[23] &&
	      !sfd__h2222[22] &&
	      !sfd__h2222[21] &&
	      !sfd__h2222[20] &&
	      !sfd__h2222[19] &&
	      !sfd__h2222[18] &&
	      !sfd__h2222[17] &&
	      !sfd__h2222[16] &&
	      !sfd__h2222[15] &&
	      !sfd__h2222[14] &&
	      !sfd__h2222[13] &&
	      !sfd__h2222[12] &&
	      !sfd__h2222[11] &&
	      !sfd__h2222[10] &&
	      !sfd__h2222[9] &&
	      !sfd__h2222[8] &&
	      !sfd__h2222[7] &&
	      !sfd__h2222[6] &&
	      !sfd__h2222[5] &&
	      !sfd__h2222[4] &&
	      !sfd__h2222[3] &&
	      !sfd__h2222[2] &&
	      !sfd__h2222[1] &&
	      !sfd__h2222[0]) ?
	       8'd0 :
	       _theResult___snd_fst_exp__h8214 ;
  assign IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d703 =
	     (requestR[159:128] == 32'd0 ||
	      !requestR[159] &&
	      NOT_requestR_BIT_158_88_89_AND_NOT_requestR_BI_ETC___d579) ?
	       8'd0 :
	       _theResult___snd_fst_exp__h14386 ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_0_607_AND_r_ETC___d1737 =
	     (requestR[190:180] == 11'd0 && requestR[179:128] == 52'd0) ?
	       32'd0 :
	       (NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1708[23] ?
		  32'hFFFFFFFF :
		  IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1735) ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_0_607_AND_r_ETC___d3807 =
	     requestR_BITS_190_TO_180_596_EQ_0_607_AND_requ_ETC___d3762 ?
	       requestR[127:64] :
	       (requestR_BITS_126_TO_116_745_EQ_0_759_AND_requ_ETC___d3766 ?
		  requestR[191:128] :
		  res__h148079) ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_0_607_AND_r_ETC___d3878 =
	     (requestR[190:180] == 11'd0 && requestR[179:128] == 52'd0) ?
	       res___1__h156271 :
	       ((requestR[190:180] == 11'd0) ?
		  res___1__h156290 :
		  res__h156306) ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2236 =
	     ((requestR[190:180] == 11'd0) ?
		(requestR[179] ?
		   6'd2 :
		   (requestR[178] ?
		      6'd3 :
		      (requestR[177] ?
			 6'd4 :
			 (requestR[176] ?
			    6'd5 :
			    (requestR[175] ?
			       6'd6 :
			       (requestR[174] ?
				  6'd7 :
				  (requestR[173] ?
				     6'd8 :
				     (requestR[172] ?
					6'd9 :
					(requestR[171] ?
					   6'd10 :
					   (requestR[170] ?
					      6'd11 :
					      (requestR[169] ?
						 6'd12 :
						 (requestR[168] ?
						    6'd13 :
						    (requestR[167] ?
						       6'd14 :
						       (requestR[166] ?
							  6'd15 :
							  (requestR[165] ?
							     6'd16 :
							     (requestR[164] ?
								6'd17 :
								(requestR[163] ?
								   6'd18 :
								   (requestR[162] ?
								      6'd19 :
								      (requestR[161] ?
									 6'd20 :
									 (requestR[160] ?
									    6'd21 :
									    (requestR[159] ?
									       6'd22 :
									       (requestR[158] ?
										  6'd23 :
										  (requestR[157] ?
										     6'd24 :
										     (requestR[156] ?
											6'd25 :
											(requestR[155] ?
											   6'd26 :
											   (requestR[154] ?
											      6'd27 :
											      (requestR[153] ?
												 6'd28 :
												 (requestR[152] ?
												    6'd29 :
												    (requestR[151] ?
												       6'd30 :
												       (requestR[150] ?
													  6'd31 :
													  (requestR[149] ?
													     6'd32 :
													     (requestR[148] ?
														6'd33 :
														(requestR[147] ?
														   6'd34 :
														   (requestR[146] ?
														      6'd35 :
														      (requestR[145] ?
															 6'd36 :
															 (requestR[144] ?
															    6'd37 :
															    (requestR[143] ?
															       6'd38 :
															       (requestR[142] ?
																  6'd39 :
																  (requestR[141] ?
																     6'd40 :
																     (requestR[140] ?
																	6'd41 :
																	(requestR[139] ?
																	   6'd42 :
																	   (requestR[138] ?
																	      6'd43 :
																	      (requestR[137] ?
																		 6'd44 :
																		 (requestR[136] ?
																		    6'd45 :
																		    (requestR[135] ?
																		       6'd46 :
																		       (requestR[134] ?
																			  6'd47 :
																			  (requestR[133] ?
																			     6'd48 :
																			     (requestR[132] ?
																				6'd49 :
																				(requestR[131] ?
																				   6'd50 :
																				   (requestR[130] ?
																				      6'd51 :
																				      (requestR[129] ?
																					 6'd52 :
																					 (requestR[128] ?
																					    6'd53 :
																					    6'd57)))))))))))))))))))))))))))))))))))))))))))))))))))) :
		6'd1) -
	     6'd1 ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2840 =
	     (requestR[190:180] == 11'd0) ?
	       (_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1841 ?
		  IF_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_ETC___d2820 :
		  requestR[191]) :
	       (SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2312 ?
		  IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2838 :
		  requestR[191]) ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2891 =
	     (requestR[190:180] == 11'd0) ?
	       _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d2873 :
	       SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2312 &&
	       SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2313 &&
	       _0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2887[4] ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2902 =
	     (requestR[190:180] == 11'd0) ?
	       _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d2898 :
	       SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2312 &&
	       SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2313 &&
	       _0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2887[3] ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2918 =
	     (requestR[190:180] == 11'd0) ?
	       NOT_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_76_ETC___d2910 :
	       !SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2312 ||
	       IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2916 ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2931 =
	     (requestR[190:180] == 11'd0) ?
	       _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d2925 :
	       SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2312 &&
	       IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2929 ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2944 =
	     (requestR[190:180] == 11'd0) ?
	       NOT_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_76_ETC___d2938 :
	       !SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2312 ||
	       IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2942 ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_2047_597_AN_ETC___d1677 =
	     (requestR[190:180] == 11'd2047 && requestR[179:128] == 52'd0) ?
	       IF_requestR_BIT_191_186_THEN_2147483648_ELSE_2_ETC___d1606 :
	       ((requestR[190:180] == 11'd0 && requestR[179:128] == 52'd0) ?
		  32'd0 :
		  IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1675) ;
  assign IF_requestR_BITS_190_TO_180_596_EQ_2047_597_AN_ETC___d2798 =
	     (requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0) ?
	       _theResult___snd_fst_sfd__h53867 :
	       _theResult___fst_sfd__h96812 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1000 =
	     sV1_exp__h815 == 8'd0 && sV1_sfd__h816 == 23'd0 &&
	     requestR[191:160] == 32'hFFFFFFFF &&
	     requestR[159] &&
	     sV2_exp__h918 == 8'd0 &&
	     sV2_sfd__h919 == 23'd0 &&
	     (requestR[127:96] != 32'hFFFFFFFF || !requestR[95]) ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1013 =
	     sV1_exp__h815 < sV2_exp__h918 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1014 =
	     sV1_exp__h815 == sV2_exp__h918 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1015 =
	     sV1_sfd__h816 < sV2_sfd__h919 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1018 =
	     sV1_exp__h815 <= sV2_exp__h918 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1020 =
	     sV1_sfd__h816 <= sV2_sfd__h919 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1038 =
	     sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 &&
	     !sV1_sfd__h816[22] ||
	     sV2_exp__h918 == 8'd255 && sV2_sfd__h919 != 23'd0 &&
	     !sV2_sfd__h919[22] ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1075 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1038 ||
	     sV1_exp__h815 == 8'd255 && sV1_sfd__h816[22] ||
	     sV2_exp__h918 == 8'd255 && sV2_sfd__h919[22] ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1086 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1018 &&
	     (!IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1014 ||
	      IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1020) &&
	     !IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1013 &&
	     (!IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1014 ||
	      !IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1015) ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1090 =
	     sV1_exp__h815 == 8'd0 && sV1_sfd__h816 == 23'd0 &&
	     sV2_exp__h918 == 8'd0 &&
	     sV2_sfd__h919 == 23'd0 ||
	     NOT_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5_ETC___d1089 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19 =
	     (requestR[191:160] == 32'hFFFFFFFF) ?
	       requestR[158:128] :
	       31'h7FC00000 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d814 =
	     sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 ||
	     (requestR[191:160] != 32'hFFFFFFFF || !requestR[159]) &&
	     sV1_exp__h815 == 8'd255 &&
	     sV1_sfd__h816 == 23'd0 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d815 =
	     (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       32'h80000000 :
	       32'h7FFFFFFF ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d818 =
	     sV1_exp__h815 - 8'd127 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d827 =
	     (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       -b__h15050 :
	       b__h15050 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d948 =
	     (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       32'd0 :
	       ((sV1_exp__h815 == 8'd255 && sV1_sfd__h816 == 23'd0) ?
		  32'hFFFFFFFF :
		  IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d946) ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d956 =
	     sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 ||
	     sV1_exp__h815 == 8'd255 && sV1_sfd__h816 == 23'd0 ||
	     (sV1_exp__h815 != 8'd0 || sV1_sfd__h816 != 23'd0) &&
	     (NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d917[19] ||
	      NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d919 &&
	      IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d938 &&
	      x__h16821[56:25] == 32'hFFFFFFFF) ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d967 =
	     { IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d956,
	       3'd0,
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 == 23'd0) &&
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 != 23'd0) &&
	       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d961 } ==
	     5'd0 ||
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d956 ;
  assign IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d990 =
	     sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 &&
	     !sV1_sfd__h816[22] &&
	     sV2_exp__h918 == 8'd255 &&
	     sV2_sfd__h919 != 23'd0 &&
	     !sV2_sfd__h919[22] ;
  assign IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1635 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       ((guard__h47540 == 2'b10) ?
		  IF_requestR_BIT_191_186_THEN_NEG_0b0_CONCAT_NO_ETC___d1618[53] :
		  guard__h47540 == 2'b11) :
	       ((requestR[194:192] == 3'h3) ?
		  guard__h47540 != 2'd0 :
		  requestR[194:192] == 3'h1 &&
		  IF_requestR_BIT_191_186_THEN_NEG_0b0_CONCAT_NO_ETC___d1618[85] &&
		  guard__h47540 != 2'd0) ;
  assign IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1667 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       ((guard__h48094 == 2'b10) ?
		  x__h48283[54] :
		  guard__h48094 == 2'b11) :
	       ((requestR[194:192] == 3'h3) ?
		  guard__h48094 != 2'd0 :
		  requestR[194:192] == 3'h1 && x__h48283[85] &&
		  guard__h48094 != 2'd0) ;
  assign IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1729 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       ((guard__h49140 == 2'b10) ?
		  x__h49361[54] :
		  guard__h49140 == 2'b11) :
	       requestR[194:192] == 3'h3 && guard__h49140 != 2'd0 ;
  assign IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d844 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       ((guard__h14983 == 2'b10) ?
		  IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d827[24] :
		  guard__h14983 == 2'b11) :
	       ((requestR[194:192] == 3'h3) ?
		  guard__h14983 != 2'd0 :
		  requestR[194:192] == 3'h1 &&
		  IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d827[56] &&
		  guard__h14983 != 2'd0) ;
  assign IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d876 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       ((guard__h15537 == 2'b10) ?
		  x__h15726[25] :
		  guard__h15537 == 2'b11) :
	       ((requestR[194:192] == 3'h3) ?
		  guard__h15537 != 2'd0 :
		  requestR[194:192] == 3'h1 && x__h15726[56] &&
		  guard__h15537 != 2'd0) ;
  assign IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d938 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       ((guard__h16600 == 2'b10) ?
		  x__h16821[25] :
		  guard__h16600 == 2'b11) :
	       requestR[194:192] == 3'h3 && guard__h16600 != 2'd0 ;
  assign IF_requestR_BIT_159_6_THEN_0_ELSE_IF_requestR__ETC___d1442 =
	     requestR[159] ?
	       6'd0 :
	       (requestR[158] ?
		  6'd1 :
		  (requestR[157] ?
		     6'd2 :
		     (requestR[156] ?
			6'd3 :
			(requestR[155] ?
			   6'd4 :
			   (requestR[154] ?
			      6'd5 :
			      (requestR[153] ?
				 6'd6 :
				 (requestR[152] ?
				    6'd7 :
				    (requestR[151] ?
				       6'd8 :
				       (requestR[150] ?
					  6'd9 :
					  (requestR[149] ?
					     6'd10 :
					     (requestR[148] ?
						6'd11 :
						(requestR[147] ?
						   6'd12 :
						   (requestR[146] ?
						      6'd13 :
						      (requestR[145] ?
							 6'd14 :
							 (requestR[144] ?
							    6'd15 :
							    (requestR[143] ?
							       6'd16 :
							       (requestR[142] ?
								  6'd17 :
								  (requestR[141] ?
								     6'd18 :
								     (requestR[140] ?
									6'd19 :
									(requestR[139] ?
									   6'd20 :
									   (requestR[138] ?
									      6'd21 :
									      (requestR[137] ?
										 6'd22 :
										 (requestR[136] ?
										    6'd23 :
										    (requestR[135] ?
										       6'd24 :
										       (requestR[134] ?
											  6'd25 :
											  (requestR[133] ?
											     6'd26 :
											     (requestR[132] ?
												6'd27 :
												(requestR[131] ?
												   6'd28 :
												   (requestR[130] ?
												      6'd29 :
												      (requestR[129] ?
													 6'd30 :
													 (requestR[128] ?
													    6'd31 :
													    6'd55))))))))))))))))))))))))))))))) ;
  assign IF_requestR_BIT_159_6_THEN_0_ELSE_IF_requestR__ETC___d613 =
	     requestR[159] ?
	       6'd0 :
	       (requestR[158] ?
		  6'd1 :
		  (requestR[157] ?
		     6'd2 :
		     (requestR[156] ?
			6'd3 :
			(requestR[155] ?
			   6'd4 :
			   (requestR[154] ?
			      6'd5 :
			      (requestR[153] ?
				 6'd6 :
				 (requestR[152] ?
				    6'd7 :
				    (requestR[151] ?
				       6'd8 :
				       (requestR[150] ?
					  6'd9 :
					  (requestR[149] ?
					     6'd10 :
					     (requestR[148] ?
						6'd11 :
						(requestR[147] ?
						   6'd12 :
						   (requestR[146] ?
						      6'd13 :
						      (requestR[145] ?
							 6'd14 :
							 (requestR[144] ?
							    6'd15 :
							    (requestR[143] ?
							       6'd16 :
							       (requestR[142] ?
								  6'd17 :
								  (requestR[141] ?
								     6'd18 :
								     (requestR[140] ?
									6'd19 :
									(requestR[139] ?
									   6'd20 :
									   (requestR[138] ?
									      6'd21 :
									      (requestR[137] ?
										 6'd22 :
										 (requestR[136] ?
										    6'd23 :
										    (requestR[135] ?
										       6'd24 :
										       (requestR[134] ?
											  6'd25 :
											  (requestR[133] ?
											     6'd26 :
											     (requestR[132] ?
												6'd27 :
												(requestR[131] ?
												   6'd28 :
												   (requestR[130] ?
												      6'd29 :
												      (requestR[129] ?
													 6'd30 :
													 (requestR[128] ?
													    6'd31 :
													    6'd32))))))))))))))))))))))))))))))) ;
  assign IF_requestR_BIT_159_6_THEN_NEG_requestR_BITS_1_ETC___d466 =
	     (sfd__h2222[31] || sfd__h2222[30] || sfd__h2222[29] ||
	      sfd__h2222[28] ||
	      sfd__h2222[27] ||
	      sfd__h2222[26] ||
	      sfd__h2222[25] ||
	      sfd__h2222[24] ||
	      sfd__h2222[23] ||
	      sfd__h2222[22] ||
	      sfd__h2222[21] ||
	      sfd__h2222[20] ||
	      sfd__h2222[19] ||
	      sfd__h2222[18] ||
	      sfd__h2222[17] ||
	      sfd__h2222[16] ||
	      sfd__h2222[15] ||
	      sfd__h2222[14] ||
	      sfd__h2222[13] ||
	      sfd__h2222[12] ||
	      sfd__h2222[11] ||
	      sfd__h2222[10] ||
	      sfd__h2222[9] ||
	      sfd__h2222[8] ||
	      sfd__h2222[7] ||
	      sfd__h2222[6] ||
	      sfd__h2222[5] ||
	      sfd__h2222[4] ||
	      sfd__h2222[3] ||
	      sfd__h2222[2] ||
	      sfd__h2222[1] ||
	      sfd__h2222[0]) &&
	     (!_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d259 ||
	      !_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d261 &&
	      !_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d264 &&
	      _theResult___fst_exp__h8205 == 8'd255 &&
	      _theResult___fst_sfd__h8206 == 23'd0) ;
  assign IF_requestR_BIT_159_6_THEN_NEG_requestR_BITS_1_ETC___d469 =
	     (sfd__h2222[31] || sfd__h2222[30] || sfd__h2222[29] ||
	      sfd__h2222[28] ||
	      sfd__h2222[27] ||
	      sfd__h2222[26] ||
	      sfd__h2222[25] ||
	      sfd__h2222[24] ||
	      sfd__h2222[23] ||
	      sfd__h2222[22] ||
	      sfd__h2222[21] ||
	      sfd__h2222[20] ||
	      sfd__h2222[19] ||
	      sfd__h2222[18] ||
	      sfd__h2222[17] ||
	      sfd__h2222[16] ||
	      sfd__h2222[15] ||
	      sfd__h2222[14] ||
	      sfd__h2222[13] ||
	      sfd__h2222[12] ||
	      sfd__h2222[11] ||
	      sfd__h2222[10] ||
	      sfd__h2222[9] ||
	      sfd__h2222[8] ||
	      sfd__h2222[7] ||
	      sfd__h2222[6] ||
	      sfd__h2222[5] ||
	      sfd__h2222[4] ||
	      sfd__h2222[3] ||
	      sfd__h2222[2] ||
	      sfd__h2222[1] ||
	      sfd__h2222[0]) &&
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d259 &&
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d261 ;
  assign IF_requestR_BIT_159_6_THEN_NEG_requestR_BITS_1_ETC___d478 =
	     (sfd__h2222[31] || sfd__h2222[30] || sfd__h2222[29] ||
	      sfd__h2222[28] ||
	      sfd__h2222[27] ||
	      sfd__h2222[26] ||
	      sfd__h2222[25] ||
	      sfd__h2222[24] ||
	      sfd__h2222[23] ||
	      sfd__h2222[22] ||
	      sfd__h2222[21] ||
	      sfd__h2222[20] ||
	      sfd__h2222[19] ||
	      sfd__h2222[18] ||
	      sfd__h2222[17] ||
	      sfd__h2222[16] ||
	      sfd__h2222[15] ||
	      sfd__h2222[14] ||
	      sfd__h2222[13] ||
	      sfd__h2222[12] ||
	      sfd__h2222[11] ||
	      sfd__h2222[10] ||
	      sfd__h2222[9] ||
	      sfd__h2222[8] ||
	      sfd__h2222[7] ||
	      sfd__h2222[6] ||
	      sfd__h2222[5] ||
	      sfd__h2222[4] ||
	      sfd__h2222[3] ||
	      sfd__h2222[2] ||
	      sfd__h2222[1] ||
	      sfd__h2222[0]) &&
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d259 &&
	     !_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d261 &&
	     IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d475 ;
  assign IF_requestR_BIT_191_186_THEN_2147483648_ELSE_2_ETC___d1606 =
	     requestR[191] ? 32'h80000000 : 32'h7FFFFFFF ;
  assign IF_requestR_BIT_191_186_THEN_NEG_0b0_CONCAT_NO_ETC___d1618 =
	     requestR[191] ? -b__h47607 : b__h47607 ;
  assign IF_requestR_BIT_191_186_THEN_NOT_requestR_BITS_ETC___d3786 =
	     requestR[191] ?
	       !requestR_BITS_190_TO_180_596_ULE_requestR_BITS_ETC___d3775 ||
	       requestR_BITS_190_TO_180_596_EQ_requestR_BITS__ETC___d3777 &&
	       !requestR_BITS_179_TO_128_598_ULE_requestR_BITS_ETC___d3778 :
	       requestR_BITS_190_TO_180_596_ULT_requestR_BITS_ETC___d3782 ||
	       requestR_BITS_190_TO_180_596_EQ_requestR_BITS__ETC___d3777 &&
	       requestR_BITS_179_TO_128_598_ULT_requestR_BITS_ETC___d3783 ;
  assign IF_sfd___3126_BIT_7_THEN_2_ELSE_0__q7 =
	     sfd___3__h7126[7] ? 2'd2 : 2'd0 ;
  assign IF_sfd___3126_BIT_8_THEN_2_ELSE_0__q6 =
	     sfd___3__h7126[8] ? 2'd2 : 2'd0 ;
  assign IF_sfd___33303_BIT_7_THEN_2_ELSE_0__q21 =
	     sfd___3__h13303[7] ? 2'd2 : 2'd0 ;
  assign IF_sfd___33303_BIT_8_THEN_2_ELSE_0__q20 =
	     sfd___3__h13303[8] ? 2'd2 : 2'd0 ;
  assign IF_sfd___35458_BIT_1_THEN_2_ELSE_0__q48 =
	     sfd___3__h45458[1] ? 2'd2 : 2'd0 ;
  assign IF_sfd___35458_BIT_2_THEN_2_ELSE_0__q47 =
	     sfd___3__h45458[2] ? 2'd2 : 2'd0 ;
  assign IF_sfd___35762_BIT_1_THEN_2_ELSE_0__q34 =
	     sfd___3__h35762[1] ? 2'd2 : 2'd0 ;
  assign IF_sfd___35762_BIT_2_THEN_2_ELSE_0__q33 =
	     sfd___3__h35762[2] ? 2'd2 : 2'd0 ;
  assign IF_sfdin28832_BIT_4_THEN_2_ELSE_0__q98 =
	     sfdin__h128832[4] ? 2'd2 : 2'd0 ;
  assign IF_sfdin7497_BIT_33_THEN_2_ELSE_0__q66 =
	     sfdin__h87497[33] ? 2'd2 : 2'd0 ;
  assign IF_sfdin9644_BIT_33_THEN_2_ELSE_0__q61 =
	     sfdin__h69644[33] ? 2'd2 : 2'd0 ;
  assign IF_theResult___snd19216_BIT_4_THEN_2_ELSE_0__q95 =
	     _theResult___snd__h119216[4] ? 2'd2 : 2'd0 ;
  assign IF_theResult___snd37615_BIT_4_THEN_2_ELSE_0__q101 =
	     _theResult___snd__h137615[4] ? 2'd2 : 2'd0 ;
  assign IF_theResult___snd6164_BIT_33_THEN_2_ELSE_0__q69 =
	     _theResult___snd__h96164[33] ? 2'd2 : 2'd0 ;
  assign IF_theResult___snd8287_BIT_33_THEN_2_ELSE_0__q63 =
	     _theResult___snd__h78287[33] ? 2'd2 : 2'd0 ;
  assign IF_x5726_BIT_24_THEN_2_ELSE_0__q31 = x__h15726[24] ? 2'd2 : 2'd0 ;
  assign IF_x6821_BIT_24_THEN_2_ELSE_0__q32 = x__h16821[24] ? 2'd2 : 2'd0 ;
  assign IF_x8283_BIT_53_THEN_2_ELSE_0__q58 = x__h48283[53] ? 2'd2 : 2'd0 ;
  assign IF_x9361_BIT_53_THEN_2_ELSE_0__q59 = x__h49361[53] ? 2'd2 : 2'd0 ;
  assign NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d820 =
	     -{ {12{IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d818[7]}},
		IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d818 } ;
  assign NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d852 =
	     NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d820 +
	     20'd32 ;
  assign NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d853 =
	     NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d852 -
	     20'd2 ;
  assign NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d855 =
	     (NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d853 ^
	      20'h80000) <=
	     20'd524320 ;
  assign NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d917 =
	     NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d852 -
	     20'd1 ;
  assign NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d919 =
	     (NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d917 ^
	      20'h80000) <=
	     20'd524320 ;
  assign NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1611 =
	     -{ {13{requestR_BITS_190_TO_180_596_MINUS_1023___d1609[10]}},
		requestR_BITS_190_TO_180_596_MINUS_1023___d1609 } ;
  assign NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1643 =
	     NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1611 +
	     24'd32 ;
  assign NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1644 =
	     NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1643 -
	     24'd2 ;
  assign NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1646 =
	     (NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1644 ^
	      24'h800000) <=
	     24'd8388640 ;
  assign NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1708 =
	     NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1643 -
	     24'd1 ;
  assign NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1710 =
	     (NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1708 ^
	      24'h800000) <=
	     24'd8388640 ;
  assign NOT_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_76_ETC___d2910 =
	     !_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1841 ||
	     (_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1842 ?
		_0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2858[2] :
		_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2870[2]) ;
  assign NOT_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_76_ETC___d2938 =
	     !_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1841 ||
	     (_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1842 ?
		_0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2858[0] :
		_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2870[0]) ;
  assign NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1027 =
	     (sV1_exp__h815 != 8'd0 || sV1_sfd__h816 != 23'd0 ||
	      sV2_exp__h918 != 8'd0 ||
	      sV2_sfd__h919 != 23'd0) &&
	     requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5_AND_ETC___d1026 ;
  assign NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1028 =
	     (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 == 23'd0) &&
	     (sV2_exp__h918 != 8'd255 || sV2_sfd__h919 == 23'd0) &&
	     NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1027 ;
  assign NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1085 =
	     !IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1013 &&
	     (!IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1014 ||
	      !IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1015) &&
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1018 &&
	     (!IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1014 ||
	      IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1020) ;
  assign NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1091 =
	     (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 == 23'd0) &&
	     (sV2_exp__h918 != 8'd255 || sV2_sfd__h919 == 23'd0) &&
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1090 ;
  assign NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1109 =
	     (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 == 23'd0) &&
	     (sV2_exp__h918 != 8'd255 || sV2_sfd__h919 == 23'd0) &&
	     (requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5_AND_ETC___d1026 ||
	      IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1090) ;
  assign NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d3047 =
	     !sV1_sfd__h816[21] && !sV1_sfd__h816[20] && !sV1_sfd__h816[19] &&
	     !sV1_sfd__h816[18] &&
	     !sV1_sfd__h816[17] &&
	     !sV1_sfd__h816[16] &&
	     !sV1_sfd__h816[15] &&
	     !sV1_sfd__h816[14] &&
	     !sV1_sfd__h816[13] &&
	     !sV1_sfd__h816[12] &&
	     !sV1_sfd__h816[11] &&
	     !sV1_sfd__h816[10] &&
	     !sV1_sfd__h816[9] &&
	     !sV1_sfd__h816[8] &&
	     !sV1_sfd__h816[7] &&
	     !sV1_sfd__h816[6] &&
	     !sV1_sfd__h816[5] &&
	     !sV1_sfd__h816[4] &&
	     !sV1_sfd__h816[3] &&
	     !sV1_sfd__h816[2] &&
	     !sV1_sfd__h816[1] &&
	     !sV1_sfd__h816[0] ;
  assign NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d897 =
	     (sV1_exp__h815 != 8'd0 || sV1_sfd__h816 != 23'd0) &&
	     ((NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d820 ==
	       20'd1048545) ?
		_theResult_____2__h14985[32:31] != 2'b11 :
		NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d853[19] ||
		NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d855 &&
		IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d876 &&
		x__h15726[56:25] == 32'h7FFFFFFF) ;
  assign NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d961 =
	     (sV1_exp__h815 != 8'd0 || sV1_sfd__h816 != 23'd0) &&
	     !NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d917[19] &&
	     (!NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d919 ||
	      guard__h16600 != 2'd0) ;
  assign NOT_IF_requestR_BIT_159_6_THEN_NEG_requestR_BI_ETC___d263 =
	     !sfd__h2222[31] && !sfd__h2222[30] && !sfd__h2222[29] &&
	     !sfd__h2222[28] &&
	     !sfd__h2222[27] &&
	     !sfd__h2222[26] &&
	     !sfd__h2222[25] &&
	     !sfd__h2222[24] &&
	     !sfd__h2222[23] &&
	     !sfd__h2222[22] &&
	     !sfd__h2222[21] &&
	     !sfd__h2222[20] &&
	     !sfd__h2222[19] &&
	     !sfd__h2222[18] &&
	     !sfd__h2222[17] &&
	     !sfd__h2222[16] &&
	     !sfd__h2222[15] &&
	     !sfd__h2222[14] &&
	     !sfd__h2222[13] &&
	     !sfd__h2222[12] &&
	     !sfd__h2222[11] &&
	     !sfd__h2222[10] &&
	     !sfd__h2222[9] &&
	     !sfd__h2222[8] &&
	     !sfd__h2222[7] &&
	     !sfd__h2222[6] &&
	     !sfd__h2222[5] &&
	     !sfd__h2222[4] &&
	     !sfd__h2222[3] &&
	     !sfd__h2222[2] &&
	     !sfd__h2222[1] &&
	     !sfd__h2222[0] ||
	     !_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d259 ||
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d261 ;
  assign NOT_requestR_BITS_159_TO_128_24_EQ_0_25_26_AND_ETC___d781 =
	     requestR[159:128] != 32'd0 &&
	     (requestR[159] ||
	      requestR_BIT_158_88_OR_requestR_BIT_157_90_OR__ETC___d770) &&
	     (!_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d617 ||
	      !_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d618 &&
	      !_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d619 &&
	      _theResult___fst_exp__h14377 == 8'd255 &&
	      _theResult___fst_sfd__h14378 == 23'd0) ;
  assign NOT_requestR_BITS_190_TO_180_596_EQ_0_607_613__ETC___d1688 =
	     (requestR[190:180] != 11'd0 || requestR[179:128] != 52'd0) &&
	     ((NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1611 ==
	       24'd16777185) ?
		_theResult_____2__h47542[32:31] != 2'b11 :
		NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1644[23] ||
		NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1646 &&
		IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1667 &&
		x__h48283[85:54] == 32'h7FFFFFFF) ;
  assign NOT_requestR_BITS_190_TO_180_596_EQ_0_607_613__ETC___d1752 =
	     (requestR[190:180] != 11'd0 || requestR[179:128] != 52'd0) &&
	     !NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1708[23] &&
	     (!NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1710 ||
	      guard__h49140 != 2'd0) ;
  assign NOT_requestR_BITS_190_TO_180_596_EQ_2047_597_6_ETC___d3790 =
	     (requestR[190:180] != 11'd2047 || requestR[179:128] == 52'd0) &&
	     (requestR[126:116] != 11'd2047 || requestR[115:64] == 52'd0) &&
	     (requestR[190:180] != 11'd0 || requestR[179:128] != 52'd0 ||
	      requestR[126:116] != 11'd0 ||
	      requestR[115:64] != 52'd0) &&
	     (requestR[191] && !requestR[127] ||
	      (requestR[191] || !requestR[127]) &&
	      IF_requestR_BIT_191_186_THEN_NOT_requestR_BITS_ETC___d3786) ;
  assign NOT_requestR_BITS_190_TO_180_596_EQ_2047_597_6_ETC___d3855 =
	     (requestR[190:180] != 11'd2047 || requestR[179:128] == 52'd0) &&
	     (requestR[126:116] != 11'd2047 || requestR[115:64] == 52'd0) &&
	     (requestR[191] && !requestR[127] ||
	      (requestR[191] || !requestR[127]) &&
	      IF_requestR_BIT_191_186_THEN_NOT_requestR_BITS_ETC___d3786 ||
	      requestR_BITS_190_TO_180_596_EQ_0_607_AND_requ_ETC___d3836) ;
  assign NOT_requestR_BITS_190_TO_180_596_ULT_requestR__ETC___d3832 =
	     !requestR_BITS_190_TO_180_596_ULT_requestR_BITS_ETC___d3782 &&
	     (!requestR_BITS_190_TO_180_596_EQ_requestR_BITS__ETC___d3777 ||
	      !requestR_BITS_179_TO_128_598_ULT_requestR_BITS_ETC___d3783) &&
	     requestR_BITS_190_TO_180_596_ULE_requestR_BITS_ETC___d3775 &&
	     (!requestR_BITS_190_TO_180_596_EQ_requestR_BITS__ETC___d3777 ||
	      requestR_BITS_179_TO_128_598_ULE_requestR_BITS_ETC___d3778) ;
  assign NOT_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5_ETC___d1089 =
	     (requestR[191:160] != 32'hFFFFFFFF || !requestR[159] ||
	      requestR[127:96] == 32'hFFFFFFFF && requestR[95]) &&
	     (requestR[191:160] == 32'hFFFFFFFF && requestR[159] ||
	      requestR[127:96] != 32'hFFFFFFFF ||
	      !requestR[95]) &&
	     ((requestR[191:160] != 32'hFFFFFFFF || !requestR[159]) ?
		NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1085 :
		IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1086) ;
  assign NOT_requestR_BIT_158_88_89_AND_NOT_requestR_BI_ETC___d579 =
	     !requestR[158] && !requestR[157] && !requestR[156] &&
	     !requestR[155] &&
	     !requestR[154] &&
	     !requestR[153] &&
	     !requestR[152] &&
	     !requestR[151] &&
	     !requestR[150] &&
	     !requestR[149] &&
	     !requestR[148] &&
	     !requestR[147] &&
	     !requestR[146] &&
	     !requestR[145] &&
	     !requestR[144] &&
	     !requestR[143] &&
	     !requestR[142] &&
	     !requestR[141] &&
	     !requestR[140] &&
	     !requestR[139] &&
	     !requestR[138] &&
	     !requestR[137] &&
	     !requestR[136] &&
	     !requestR[135] &&
	     !requestR[134] &&
	     !requestR[133] &&
	     !requestR[132] &&
	     !requestR[131] &&
	     !requestR[130] &&
	     !requestR[129] &&
	     !requestR[128] ;
  assign NOT_requestR_BIT_179_767_142_AND_NOT_requestR__ETC___d2181 =
	     !requestR[179] && !requestR[178] && !requestR[177] &&
	     !requestR[176] &&
	     !requestR[175] &&
	     !requestR[174] &&
	     !requestR[173] &&
	     !requestR[172] &&
	     !requestR[171] &&
	     !requestR[170] &&
	     !requestR[169] &&
	     !requestR[168] &&
	     !requestR[167] &&
	     !requestR[166] &&
	     !requestR[165] &&
	     !requestR[164] &&
	     !requestR[163] &&
	     !requestR[162] &&
	     !requestR[161] &&
	     !requestR[160] &&
	     !requestR[159] &&
	     NOT_requestR_BIT_158_88_89_AND_NOT_requestR_BI_ETC___d579 ;
  assign SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3145 =
	     { {4{IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d818[7]}},
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d818 } ;
  assign SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3146 =
	     (SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3145 ^
	      12'h800) <=
	     12'd3071 ;
  assign SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3147 =
	     (SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3145 ^
	      12'h800) <
	     12'd1026 ;
  assign SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q96 =
	     SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3145 +
	     12'd1023 ;
  assign SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q99 =
	     SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q96[10:0] -
	     11'd1023 ;
  assign SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_609___d2311 =
	     { requestR_BITS_190_TO_180_596_MINUS_1023___d1609[10],
	       requestR_BITS_190_TO_180_596_MINUS_1023___d1609 } ;
  assign SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2312 =
	     (SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_609___d2311 ^
	      12'h800) <=
	     12'd2175 ;
  assign SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2313 =
	     (SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_609___d2311 ^
	      12'h800) <
	     12'd1922 ;
  assign SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q64 =
	     SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_609___d2311 +
	     12'd127 ;
  assign SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q67 =
	     SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q64[7:0] -
	     8'd127 ;
  assign _0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2076 =
	     ({ 3'd0,
		IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_TO_180__ETC___d2074 } ^
	      9'h100) <=
	     9'd256 ;
  assign _0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2858 =
	     { 3'd0,
	       _theResult___fst_exp__h69650 == 8'd0 &&
	       (sfdin__h69644[56:34] == 23'd0 || guard__h61553 != 2'b0),
	       1'd0 } |
	     { 2'd0,
	       _theResult___fst_exp__h70277 == 8'd255 &&
	       _theResult___fst_sfd__h70278 == 23'd0,
	       1'd0,
	       _theResult___fst_exp__h69650 != 8'd255 &&
	       guard__h61553 != 2'b0 } ;
  assign _0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3396 =
	     ({ 6'd0,
		IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_191_TO__ETC___d3394 } ^
	      12'h800) <=
	     12'd2048 ;
  assign _0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3681 =
	     { 3'd0,
	       _theResult___fst_exp__h128838 == 11'd0 &&
	       (sfdin__h128832[56:5] == 52'd0 || guard__h120612 != 2'b0),
	       1'd0 } |
	     { 2'd0,
	       _theResult___fst_exp__h129668 == 11'd2047 &&
	       _theResult___fst_sfd__h129669 == 52'd0,
	       1'd0,
	       _theResult___fst_exp__h128838 != 11'd2047 &&
	       guard__h120612 != 2'b0 } ;
  assign _0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2560 =
	     ({ 3'd0,
		IF_IF_3970_MINUS_SEXT_requestR_BITS_190_TO_180_ETC___d2558 } ^
	      9'h100) <=
	     9'd256 ;
  assign _0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2887 =
	     { 3'd0,
	       _theResult___fst_exp__h87503 == 8'd0 &&
	       (sfdin__h87497[56:34] == 23'd0 || guard__h79277 != 2'b0),
	       1'd0 } |
	     { 2'd0,
	       _theResult___fst_exp__h88130 == 8'd255 &&
	       _theResult___fst_sfd__h88131 == 23'd0,
	       1'd0,
	       _theResult___fst_exp__h87503 != 8'd255 &&
	       guard__h79277 != 2'b0 } ;
  assign _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3076 =
	     ({ 6'd0,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3074 } ^
	      12'h800) <=
	     12'd2944 ;
  assign _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3469 =
	     ({ 6'd0,
		IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3074 } ^
	      12'h800) <=
	     (IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3468 ^
	      12'h800) ;
  assign _0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3664 =
	     { 3'd0,
	       _theResult___fst_exp__h119265 == 11'd0 &&
	       guard__h111304 != 2'b0,
	       1'd0 } |
	     { 2'd0,
	       _theResult___fst_exp__h120021 == 11'd2047 &&
	       _theResult___fst_sfd__h120022 == 52'd0,
	       1'd0,
	       _theResult___fst_exp__h119265 != 11'd2047 &&
	       guard__h111304 != 2'b0 } ;
  assign _0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2238 =
	     ({ 3'd0,
		IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2236 } ^
	      9'h100) <=
	     9'd384 ;
  assign _0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2633 =
	     ({ 3'd0,
		IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2236 } ^
	      9'h100) <=
	     (IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2632 ^
	      9'h100) ;
  assign _0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2870 =
	     { 3'd0,
	       _theResult___fst_exp__h78336 == 8'd0 && guard__h70288 != 2'b0,
	       1'd0 } |
	     { 2'd0,
	       _theResult___fst_exp__h78889 == 8'd255 &&
	       _theResult___fst_sfd__h78890 == 23'd0,
	       1'd0,
	       _theResult___fst_exp__h78336 != 8'd255 &&
	       guard__h70288 != 2'b0 } ;
  assign _0b0_CONCAT_NOT_IF_requestR_BITS_191_TO_160_4_E_ETC___d3152 =
	     b__h15050 >>
	     _3074_MINUS_SEXT_IF_requestR_BITS_191_TO_160_4__ETC___d3148 ;
  assign _0b0_CONCAT_NOT_requestR_BITS_190_TO_180_596_EQ_ETC___d2318 =
	     sfd__h53913 >>
	     _3970_MINUS_SEXT_requestR_BITS_190_TO_180_596_M_ETC___d2314 ;
  assign _1_CONCAT_DONTCARE_CONCAT_requestR_BITS_63_TO_3_ETC___d68 =
	     { 33'h1AAAAAAAA,
	       requestR[63:32] == 32'hFFFFFFFF && requestR[31],
	       (requestR[63:32] == 32'hFFFFFFFF) ?
		 requestR[30:0] :
		 31'h7FC00000 } ;
  assign _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1840 =
	     12'd3074 -
	     { 6'd0,
	       requestR[179] ?
		 6'd0 :
		 (requestR[178] ?
		    6'd1 :
		    (requestR[177] ?
		       6'd2 :
		       (requestR[176] ?
			  6'd3 :
			  (requestR[175] ?
			     6'd4 :
			     (requestR[174] ?
				6'd5 :
				(requestR[173] ?
				   6'd6 :
				   (requestR[172] ?
				      6'd7 :
				      (requestR[171] ?
					 6'd8 :
					 (requestR[170] ?
					    6'd9 :
					    (requestR[169] ?
					       6'd10 :
					       (requestR[168] ?
						  6'd11 :
						  (requestR[167] ?
						     6'd12 :
						     (requestR[166] ?
							6'd13 :
							(requestR[165] ?
							   6'd14 :
							   (requestR[164] ?
							      6'd15 :
							      (requestR[163] ?
								 6'd16 :
								 (requestR[162] ?
								    6'd17 :
								    (requestR[161] ?
								       6'd18 :
								       (requestR[160] ?
									  6'd19 :
									  (requestR[159] ?
									     6'd20 :
									     (requestR[158] ?
										6'd21 :
										(requestR[157] ?
										   6'd22 :
										   (requestR[156] ?
										      6'd23 :
										      (requestR[155] ?
											 6'd24 :
											 (requestR[154] ?
											    6'd25 :
											    (requestR[153] ?
											       6'd26 :
											       (requestR[152] ?
												  6'd27 :
												  (requestR[151] ?
												     6'd28 :
												     (requestR[150] ?
													6'd29 :
													(requestR[149] ?
													   6'd30 :
													   (requestR[148] ?
													      6'd31 :
													      (requestR[147] ?
														 6'd32 :
														 (requestR[146] ?
														    6'd33 :
														    (requestR[145] ?
														       6'd34 :
														       (requestR[144] ?
															  6'd35 :
															  (requestR[143] ?
															     6'd36 :
															     (requestR[142] ?
																6'd37 :
																(requestR[141] ?
																   6'd38 :
																   (requestR[140] ?
																      6'd39 :
																      (requestR[139] ?
																	 6'd40 :
																	 (requestR[138] ?
																	    6'd41 :
																	    (requestR[137] ?
																	       6'd42 :
																	       (requestR[136] ?
																		  6'd43 :
																		  (requestR[135] ?
																		     6'd44 :
																		     (requestR[134] ?
																			6'd45 :
																			(requestR[133] ?
																			   6'd46 :
																			   (requestR[132] ?
																			      6'd47 :
																			      (requestR[131] ?
																				 6'd48 :
																				 (requestR[130] ?
																				    6'd49 :
																				    (requestR[129] ?
																				       6'd50 :
																				       (requestR[128] ?
																					  6'd51 :
																					  6'd52))))))))))))))))))))))))))))))))))))))))))))))))))) } ;
  assign _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1841 =
	     (_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1840 ^
	      12'h800) <=
	     12'd2175 ;
  assign _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1842 =
	     (_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1840 ^
	      12'h800) <
	     12'd1922 ;
  assign _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d2873 =
	     _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1841 &&
	     (_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1842 ?
		_0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2858[4] :
		_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2870[4]) ;
  assign _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d2898 =
	     _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1841 &&
	     (_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1842 ?
		_0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2858[3] :
		_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2870[3]) ;
  assign _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d2925 =
	     _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1841 &&
	     (_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1842 ?
		_0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2858[1] :
		_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2870[1]) ;
  assign _3074_MINUS_SEXT_IF_requestR_BITS_191_TO_160_4__ETC___d3148 =
	     12'd3074 -
	     SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3145 ;
  assign _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1230 =
	     (12'd32 -
	      { 6'd0,
		IF_IF_requestR_BIT_159_6_THEN_NEG_requestR_BIT_ETC___d1227 }) -
	     12'd1 ;
  assign _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1231 =
	     (_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1230 ^
	      12'h800) <=
	     12'd3071 ;
  assign _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1233 =
	     (_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1230 ^
	      12'h800) <
	     12'd974 ;
  assign _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1235 =
	     (_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1230 ^
	      12'h800) <
	     12'd1026 ;
  assign _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d258 =
	     (9'd32 -
	      { 3'd0,
		IF_IF_requestR_BIT_159_6_THEN_NEG_requestR_BIT_ETC___d255 }) -
	     9'd1 ;
  assign _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d259 =
	     (_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d258 ^
	      9'h100) <=
	     9'd383 ;
  assign _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d261 =
	     (_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d258 ^
	      9'h100) <
	     9'd107 ;
  assign _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d264 =
	     (_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d258 ^
	      9'h100) <
	     9'd130 ;
  assign _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1445 =
	     (12'd32 -
	      { 6'd0,
		IF_requestR_BIT_159_6_THEN_0_ELSE_IF_requestR__ETC___d1442 }) -
	     12'd1 ;
  assign _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1446 =
	     (_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1445 ^
	      12'h800) <=
	     12'd3071 ;
  assign _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1447 =
	     (_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1445 ^
	      12'h800) <
	     12'd974 ;
  assign _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1448 =
	     (_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1445 ^
	      12'h800) <
	     12'd1026 ;
  assign _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d616 =
	     (9'd32 -
	      { 3'd0,
		IF_requestR_BIT_159_6_THEN_0_ELSE_IF_requestR__ETC___d613 }) -
	     9'd1 ;
  assign _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d617 =
	     (_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d616 ^
	      9'h100) <=
	     9'd383 ;
  assign _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d618 =
	     (_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d616 ^
	      9'h100) <
	     9'd107 ;
  assign _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d619 =
	     (_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d616 ^
	      9'h100) <
	     9'd130 ;
  assign _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3002 =
	     12'd3970 -
	     { 7'd0,
	       sV1_sfd__h816[22] ?
		 5'd0 :
		 (sV1_sfd__h816[21] ?
		    5'd1 :
		    (sV1_sfd__h816[20] ?
		       5'd2 :
		       (sV1_sfd__h816[19] ?
			  5'd3 :
			  (sV1_sfd__h816[18] ?
			     5'd4 :
			     (sV1_sfd__h816[17] ?
				5'd5 :
				(sV1_sfd__h816[16] ?
				   5'd6 :
				   (sV1_sfd__h816[15] ?
				      5'd7 :
				      (sV1_sfd__h816[14] ?
					 5'd8 :
					 (sV1_sfd__h816[13] ?
					    5'd9 :
					    (sV1_sfd__h816[12] ?
					       5'd10 :
					       (sV1_sfd__h816[11] ?
						  5'd11 :
						  (sV1_sfd__h816[10] ?
						     5'd12 :
						     (sV1_sfd__h816[9] ?
							5'd13 :
							(sV1_sfd__h816[8] ?
							   5'd14 :
							   (sV1_sfd__h816[7] ?
							      5'd15 :
							      (sV1_sfd__h816[6] ?
								 5'd16 :
								 (sV1_sfd__h816[5] ?
								    5'd17 :
								    (sV1_sfd__h816[4] ?
								       5'd18 :
								       (sV1_sfd__h816[3] ?
									  5'd19 :
									  (sV1_sfd__h816[2] ?
									     5'd20 :
									     (sV1_sfd__h816[1] ?
										5'd21 :
										(sV1_sfd__h816[0] ?
										   5'd22 :
										   5'd23)))))))))))))))))))))) } ;
  assign _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3003 =
	     (_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3002 ^
	      12'h800) <=
	     12'd3071 ;
  assign _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3004 =
	     (_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3002 ^
	      12'h800) <
	     12'd1026 ;
  assign _3970_MINUS_SEXT_requestR_BITS_190_TO_180_596_M_ETC___d2314 =
	     12'd3970 -
	     SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_609___d2311 ;
  assign _theResult_____2__h14985 =
	     IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d844 ?
	       out1___1__h15477 :
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d827[56:24] ;
  assign _theResult_____2__h47542 =
	     IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1635 ?
	       out1___1__h48034 :
	       IF_requestR_BIT_191_186_THEN_NEG_0b0_CONCAT_NO_ETC___d1618[85:53] ;
  assign _theResult____h120602 =
	     ((_3074_MINUS_SEXT_IF_requestR_BITS_191_TO_160_4__ETC___d3148 ^
	       12'h800) <
	      12'd2105) ?
	       result__h121215 :
	       ((value__h15052 == 25'd0) ? b__h15050 : 57'd1) ;
  assign _theResult____h61543 =
	     (value__h47609 == 54'd0) ? sfd__h53913 : 57'd1 ;
  assign _theResult____h79267 =
	     ((_3970_MINUS_SEXT_requestR_BITS_190_TO_180_596_M_ETC___d2314 ^
	       12'h800) <
	      12'd2105) ?
	       result__h79880 :
	       _theResult____h61543 ;
  assign _theResult___exp__h119920 =
	     sfd__h119283[53] ?
	       ((_theResult___fst_exp__h119265 == 11'd2046) ?
		  11'd2047 :
		  din_inc___2_exp__h138485) :
	       ((_theResult___fst_exp__h119265 == 11'd0 &&
		 sfd__h119283[53:52] == 2'b01) ?
		  11'd1 :
		  _theResult___fst_exp__h119265) ;
  assign _theResult___exp__h129567 =
	     sfd__h128930[53] ?
	       ((_theResult___fst_exp__h128838 == 11'd2046) ?
		  11'd2047 :
		  din_inc___2_exp__h138515) :
	       ((_theResult___fst_exp__h128838 == 11'd0 &&
		 sfd__h128930[53:52] == 2'b01) ?
		  11'd1 :
		  _theResult___fst_exp__h128838) ;
  assign _theResult___exp__h13726 =
	     (sfd__h13330[24] || sfd__h13330[24:23] == 2'b01) ? 8'd1 : 8'd0 ;
  assign _theResult___exp__h138349 =
	     sfd__h137688[53] ?
	       ((_theResult___fst_exp__h137669 == 11'd2046) ?
		  11'd2047 :
		  din_inc___2_exp__h138539) :
	       ((_theResult___fst_exp__h137669 == 11'd0 &&
		 sfd__h137688[53:52] == 2'b01) ?
		  11'd1 :
		  _theResult___fst_exp__h137669) ;
  assign _theResult___exp__h14278 =
	     sfd__h13869[24] ?
	       ((x__h13854[7:0] == 8'd254) ?
		  8'd255 :
		  din_inc___2_exp__h14416) :
	       ((x__h13854[7:0] == 8'd0 && sfd__h13869[24:23] == 2'b01) ?
		  8'd1 :
		  x__h13854[7:0]) ;
  assign _theResult___exp__h36388 =
	     (sfd__h35789[53] || sfd__h35789[53:52] == 2'b01) ?
	       11'd1 :
	       11'd0 ;
  assign _theResult___exp__h37144 =
	     sfd__h36532[53] ?
	       ((x__h36517[10:0] == 11'd2046) ?
		  11'd2047 :
		  din_inc___2_exp__h37287) :
	       ((x__h36517[10:0] == 11'd0 && sfd__h36532[53:52] == 2'b01) ?
		  11'd1 :
		  x__h36517[10:0]) ;
  assign _theResult___exp__h46084 =
	     (sfd__h45485[53] || sfd__h45485[53:52] == 2'b01) ?
	       11'd1 :
	       11'd0 ;
  assign _theResult___exp__h46839 =
	     sfd__h46227[53] ?
	       ((x__h46212[10:0] == 11'd2046) ?
		  11'd2047 :
		  din_inc___2_exp__h46977) :
	       ((x__h46212[10:0] == 11'd0 && sfd__h46227[53:52] == 2'b01) ?
		  11'd1 :
		  x__h46212[10:0]) ;
  assign _theResult___exp__h70176 =
	     sfd__h69742[24] ?
	       ((_theResult___fst_exp__h69650 == 8'd254) ?
		  8'd255 :
		  din_inc___2_exp__h96827) :
	       ((_theResult___fst_exp__h69650 == 8'd0 &&
		 sfd__h69742[24:23] == 2'b01) ?
		  8'd1 :
		  _theResult___fst_exp__h69650) ;
  assign _theResult___exp__h7552 =
	     (sfd__h7153[24] || sfd__h7153[24:23] == 2'b01) ? 8'd1 : 8'd0 ;
  assign _theResult___exp__h78788 =
	     sfd__h78354[24] ?
	       ((_theResult___fst_exp__h78336 == 8'd254) ?
		  8'd255 :
		  din_inc___2_exp__h96851) :
	       ((_theResult___fst_exp__h78336 == 8'd0 &&
		 sfd__h78354[24:23] == 2'b01) ?
		  8'd1 :
		  _theResult___fst_exp__h78336) ;
  assign _theResult___exp__h8105 =
	     sfd__h7696[24] ?
	       ((x__h7681[7:0] == 8'd254) ? 8'd255 : din_inc___2_exp__h8248) :
	       ((x__h7681[7:0] == 8'd0 && sfd__h7696[24:23] == 2'b01) ?
		  8'd1 :
		  x__h7681[7:0]) ;
  assign _theResult___exp__h88029 =
	     sfd__h87595[24] ?
	       ((_theResult___fst_exp__h87503 == 8'd254) ?
		  8'd255 :
		  din_inc___2_exp__h96881) :
	       ((_theResult___fst_exp__h87503 == 8'd0 &&
		 sfd__h87595[24:23] == 2'b01) ?
		  8'd1 :
		  _theResult___fst_exp__h87503) ;
  assign _theResult___exp__h96695 =
	     sfd__h96237[24] ?
	       ((_theResult___fst_exp__h96218 == 8'd254) ?
		  8'd255 :
		  din_inc___2_exp__h96905) :
	       ((_theResult___fst_exp__h96218 == 8'd0 &&
		 sfd__h96237[24:23] == 2'b01) ?
		  8'd1 :
		  _theResult___fst_exp__h96218) ;
  assign _theResult___fst_exp__h104192 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3) ?
	       11'd2047 :
	       CASE_requestR_BITS_194_TO_192_0x1_2046_0x2_IF__ETC__q4 ;
  assign _theResult___fst_exp__h119256 =
	     11'd897 -
	     { 5'd0,
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3074 } ;
  assign _theResult___fst_exp__h119262 =
	     (sV1_exp__h815 == 8'd0 && !sV1_sfd__h816[22] &&
	      NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d3047 ||
	      !_0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3076) ?
	       11'd0 :
	       _theResult___fst_exp__h119256 ;
  assign _theResult___fst_exp__h119265 =
	     (sV1_exp__h815 == 8'd0) ?
	       _theResult___fst_exp__h119262 :
	       11'd897 ;
  assign _theResult___fst_exp__h120018 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard11304_0b0_theResult___fst_exp19265_0_ETC__q103 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3134 ;
  assign _theResult___fst_exp__h120021 =
	     (_theResult___fst_exp__h119265 == 11'd2047) ?
	       _theResult___fst_exp__h119265 :
	       _theResult___fst_exp__h120018 ;
  assign _theResult___fst_exp__h128838 =
	     _theResult____h120602[56] ?
	       11'd2 :
	       _theResult___fst_exp__h128912 ;
  assign _theResult___fst_exp__h128903 =
	     11'd0 -
	     { 5'd0,
	       IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_191_TO__ETC___d3394 } ;
  assign _theResult___fst_exp__h128909 =
	     (!_theResult____h120602[56] && !_theResult____h120602[55] &&
	      !_theResult____h120602[54] &&
	      !_theResult____h120602[53] &&
	      !_theResult____h120602[52] &&
	      !_theResult____h120602[51] &&
	      !_theResult____h120602[50] &&
	      !_theResult____h120602[49] &&
	      !_theResult____h120602[48] &&
	      !_theResult____h120602[47] &&
	      !_theResult____h120602[46] &&
	      !_theResult____h120602[45] &&
	      !_theResult____h120602[44] &&
	      !_theResult____h120602[43] &&
	      !_theResult____h120602[42] &&
	      !_theResult____h120602[41] &&
	      !_theResult____h120602[40] &&
	      !_theResult____h120602[39] &&
	      !_theResult____h120602[38] &&
	      !_theResult____h120602[37] &&
	      !_theResult____h120602[36] &&
	      !_theResult____h120602[35] &&
	      !_theResult____h120602[34] &&
	      !_theResult____h120602[33] &&
	      !_theResult____h120602[32] &&
	      !_theResult____h120602[31] &&
	      !_theResult____h120602[30] &&
	      !_theResult____h120602[29] &&
	      !_theResult____h120602[28] &&
	      !_theResult____h120602[27] &&
	      !_theResult____h120602[26] &&
	      !_theResult____h120602[25] &&
	      !_theResult____h120602[24] &&
	      !_theResult____h120602[23] &&
	      !_theResult____h120602[22] &&
	      !_theResult____h120602[21] &&
	      !_theResult____h120602[20] &&
	      !_theResult____h120602[19] &&
	      !_theResult____h120602[18] &&
	      !_theResult____h120602[17] &&
	      !_theResult____h120602[16] &&
	      !_theResult____h120602[15] &&
	      !_theResult____h120602[14] &&
	      !_theResult____h120602[13] &&
	      !_theResult____h120602[12] &&
	      !_theResult____h120602[11] &&
	      !_theResult____h120602[10] &&
	      !_theResult____h120602[9] &&
	      !_theResult____h120602[8] &&
	      !_theResult____h120602[7] &&
	      !_theResult____h120602[6] &&
	      !_theResult____h120602[5] &&
	      !_theResult____h120602[4] &&
	      !_theResult____h120602[3] &&
	      !_theResult____h120602[2] &&
	      !_theResult____h120602[1] &&
	      !_theResult____h120602[0] ||
	      !_0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR_BIT_ETC___d3396) ?
	       11'd0 :
	       _theResult___fst_exp__h128903 ;
  assign _theResult___fst_exp__h128912 =
	     (!_theResult____h120602[56] && _theResult____h120602[55]) ?
	       11'd1 :
	       _theResult___fst_exp__h128909 ;
  assign _theResult___fst_exp__h129665 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard20612_0b0_theResult___fst_exp28838_0_ETC__q105 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3459 ;
  assign _theResult___fst_exp__h129668 =
	     (_theResult___fst_exp__h128838 == 11'd2047) ?
	       _theResult___fst_exp__h128838 :
	       _theResult___fst_exp__h129665 ;
  assign _theResult___fst_exp__h137621 =
	     (SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q96[10:0] ==
	      11'd0) ?
	       11'd1 :
	       SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q96[10:0] ;
  assign _theResult___fst_exp__h137660 =
	     SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC__q96[10:0] -
	     { 5'd0,
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3074 } ;
  assign _theResult___fst_exp__h137666 =
	     (sV1_exp__h815 == 8'd0 && !sV1_sfd__h816[22] &&
	      NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d3047 ||
	      !_0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d3469) ?
	       11'd0 :
	       _theResult___fst_exp__h137660 ;
  assign _theResult___fst_exp__h137669 =
	     (sV1_exp__h815 == 8'd0) ?
	       _theResult___fst_exp__h137666 :
	       _theResult___fst_exp__h137621 ;
  assign _theResult___fst_exp__h13822 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard3313_0b0_0_0b1_0_0b10_out_exp3729_0b_ETC__q22 :
	       CASE_requestR_BITS_194_TO_192_0x3_IF_guard3313_ETC__q24 ;
  assign _theResult___fst_exp__h138447 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard29679_0b0_theResult___fst_exp37669_0_ETC__q107 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3528 ;
  assign _theResult___fst_exp__h138450 =
	     (_theResult___fst_exp__h137669 == 11'd2047) ?
	       _theResult___fst_exp__h137669 :
	       _theResult___fst_exp__h138447 ;
  assign _theResult___fst_exp__h138459 =
	     (sV1_exp__h815 == 8'd0) ?
	       (_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3003 ?
		  _theResult___snd_fst_exp__h120024 :
		  _theResult___fst_exp__h104192) :
	       (SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3146 ?
		  _theResult___snd_fst_exp__h138453 :
		  _theResult___fst_exp__h104192) ;
  assign _theResult___fst_exp__h138462 =
	     (sV1_exp__h815 == 8'd0 && sV1_sfd__h816 == 23'd0) ?
	       11'd0 :
	       _theResult___fst_exp__h138459 ;
  assign _theResult___fst_exp__h14374 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard3839_0b0_x3854_BITS_7_TO_0_0b1_x3854_ETC__q26 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d697 ;
  assign _theResult___fst_exp__h14377 =
	     (x__h13854[7:0] == 8'd255) ?
	       x__h13854[7:0] :
	       _theResult___fst_exp__h14374 ;
  assign _theResult___fst_exp__h36485 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard5772_0b0_0_0b1_0_0b10_out_exp6391_0b_ETC__q44 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1310 ;
  assign _theResult___fst_exp__h37241 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard6502_0b0_x6517_BITS_10_TO_0_0b1_x651_ETC__q40 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1339 ;
  assign _theResult___fst_exp__h37244 =
	     (x__h36517[10:0] == 11'd2047) ?
	       x__h36517[10:0] :
	       _theResult___fst_exp__h37241 ;
  assign _theResult___fst_exp__h46180 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard5468_0b0_0_0b1_0_0b10_out_exp6087_0b_ETC__q49 :
	       CASE_requestR_BITS_194_TO_192_0x3_IF_guard5468_ETC__q51 ;
  assign _theResult___fst_exp__h46935 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard6197_0b0_x6212_BITS_10_TO_0_0b1_x621_ETC__q53 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1526 ;
  assign _theResult___fst_exp__h46938 =
	     (x__h46212[10:0] == 11'd2047) ?
	       x__h46212[10:0] :
	       _theResult___fst_exp__h46935 ;
  assign _theResult___fst_exp__h61525 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3) ?
	       8'd255 :
	       CASE_requestR_BITS_194_TO_192_0x1_254_0x2_IF_r_ETC__q2 ;
  assign _theResult___fst_exp__h69650 =
	     _theResult____h61543[56] ? 8'd2 : _theResult___fst_exp__h69724 ;
  assign _theResult___fst_exp__h69715 =
	     8'd0 -
	     { 2'd0,
	       IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_TO_180__ETC___d2074 } ;
  assign _theResult___fst_exp__h69721 =
	     (!_theResult____h61543[56] && !_theResult____h61543[55] &&
	      !_theResult____h61543[54] &&
	      !_theResult____h61543[53] &&
	      !_theResult____h61543[52] &&
	      !_theResult____h61543[51] &&
	      !_theResult____h61543[50] &&
	      !_theResult____h61543[49] &&
	      !_theResult____h61543[48] &&
	      !_theResult____h61543[47] &&
	      !_theResult____h61543[46] &&
	      !_theResult____h61543[45] &&
	      !_theResult____h61543[44] &&
	      !_theResult____h61543[43] &&
	      !_theResult____h61543[42] &&
	      !_theResult____h61543[41] &&
	      !_theResult____h61543[40] &&
	      !_theResult____h61543[39] &&
	      !_theResult____h61543[38] &&
	      !_theResult____h61543[37] &&
	      !_theResult____h61543[36] &&
	      !_theResult____h61543[35] &&
	      !_theResult____h61543[34] &&
	      !_theResult____h61543[33] &&
	      !_theResult____h61543[32] &&
	      !_theResult____h61543[31] &&
	      !_theResult____h61543[30] &&
	      !_theResult____h61543[29] &&
	      !_theResult____h61543[28] &&
	      !_theResult____h61543[27] &&
	      !_theResult____h61543[26] &&
	      !_theResult____h61543[25] &&
	      !_theResult____h61543[24] &&
	      !_theResult____h61543[23] &&
	      !_theResult____h61543[22] &&
	      !_theResult____h61543[21] &&
	      !_theResult____h61543[20] &&
	      !_theResult____h61543[19] &&
	      !_theResult____h61543[18] &&
	      !_theResult____h61543[17] &&
	      !_theResult____h61543[16] &&
	      !_theResult____h61543[15] &&
	      !_theResult____h61543[14] &&
	      !_theResult____h61543[13] &&
	      !_theResult____h61543[12] &&
	      !_theResult____h61543[11] &&
	      !_theResult____h61543[10] &&
	      !_theResult____h61543[9] &&
	      !_theResult____h61543[8] &&
	      !_theResult____h61543[7] &&
	      !_theResult____h61543[6] &&
	      !_theResult____h61543[5] &&
	      !_theResult____h61543[4] &&
	      !_theResult____h61543[3] &&
	      !_theResult____h61543[2] &&
	      !_theResult____h61543[1] &&
	      !_theResult____h61543[0] ||
	      !_0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_19_ETC___d2076) ?
	       8'd0 :
	       _theResult___fst_exp__h69715 ;
  assign _theResult___fst_exp__h69724 =
	     (!_theResult____h61543[56] && _theResult____h61543[55]) ?
	       8'd1 :
	       _theResult___fst_exp__h69721 ;
  assign _theResult___fst_exp__h70274 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard1553_0b0_theResult___fst_exp9650_0b1_ETC__q71 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2139 ;
  assign _theResult___fst_exp__h70277 =
	     (_theResult___fst_exp__h69650 == 8'd255) ?
	       _theResult___fst_exp__h69650 :
	       _theResult___fst_exp__h70274 ;
  assign _theResult___fst_exp__h7649 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard136_0b0_0_0b1_0_0b10_out_exp555_0b11_ETC__q13 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d350 ;
  assign _theResult___fst_exp__h78327 =
	     8'd129 -
	     { 2'd0,
	       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2236 } ;
  assign _theResult___fst_exp__h78333 =
	     (requestR[190:180] == 11'd0 &&
	      NOT_requestR_BIT_179_767_142_AND_NOT_requestR__ETC___d2181 ||
	      !_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2238) ?
	       8'd0 :
	       _theResult___fst_exp__h78327 ;
  assign _theResult___fst_exp__h78336 =
	     (requestR[190:180] == 11'd0) ?
	       _theResult___fst_exp__h78333 :
	       8'd129 ;
  assign _theResult___fst_exp__h78886 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard0288_0b0_theResult___fst_exp8336_0b1_ETC__q73 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2296 ;
  assign _theResult___fst_exp__h78889 =
	     (_theResult___fst_exp__h78336 == 8'd255) ?
	       _theResult___fst_exp__h78336 :
	       _theResult___fst_exp__h78886 ;
  assign _theResult___fst_exp__h8202 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard666_0b0_x681_BITS_7_TO_0_0b1_x681_BI_ETC__q15 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d379 ;
  assign _theResult___fst_exp__h8205 =
	     (x__h7681[7:0] == 8'd255) ?
	       x__h7681[7:0] :
	       _theResult___fst_exp__h8202 ;
  assign _theResult___fst_exp__h87503 =
	     _theResult____h79267[56] ? 8'd2 : _theResult___fst_exp__h87577 ;
  assign _theResult___fst_exp__h87568 =
	     8'd0 -
	     { 2'd0,
	       IF_IF_3970_MINUS_SEXT_requestR_BITS_190_TO_180_ETC___d2558 } ;
  assign _theResult___fst_exp__h87574 =
	     (!_theResult____h79267[56] && !_theResult____h79267[55] &&
	      !_theResult____h79267[54] &&
	      !_theResult____h79267[53] &&
	      !_theResult____h79267[52] &&
	      !_theResult____h79267[51] &&
	      !_theResult____h79267[50] &&
	      !_theResult____h79267[49] &&
	      !_theResult____h79267[48] &&
	      !_theResult____h79267[47] &&
	      !_theResult____h79267[46] &&
	      !_theResult____h79267[45] &&
	      !_theResult____h79267[44] &&
	      !_theResult____h79267[43] &&
	      !_theResult____h79267[42] &&
	      !_theResult____h79267[41] &&
	      !_theResult____h79267[40] &&
	      !_theResult____h79267[39] &&
	      !_theResult____h79267[38] &&
	      !_theResult____h79267[37] &&
	      !_theResult____h79267[36] &&
	      !_theResult____h79267[35] &&
	      !_theResult____h79267[34] &&
	      !_theResult____h79267[33] &&
	      !_theResult____h79267[32] &&
	      !_theResult____h79267[31] &&
	      !_theResult____h79267[30] &&
	      !_theResult____h79267[29] &&
	      !_theResult____h79267[28] &&
	      !_theResult____h79267[27] &&
	      !_theResult____h79267[26] &&
	      !_theResult____h79267[25] &&
	      !_theResult____h79267[24] &&
	      !_theResult____h79267[23] &&
	      !_theResult____h79267[22] &&
	      !_theResult____h79267[21] &&
	      !_theResult____h79267[20] &&
	      !_theResult____h79267[19] &&
	      !_theResult____h79267[18] &&
	      !_theResult____h79267[17] &&
	      !_theResult____h79267[16] &&
	      !_theResult____h79267[15] &&
	      !_theResult____h79267[14] &&
	      !_theResult____h79267[13] &&
	      !_theResult____h79267[12] &&
	      !_theResult____h79267[11] &&
	      !_theResult____h79267[10] &&
	      !_theResult____h79267[9] &&
	      !_theResult____h79267[8] &&
	      !_theResult____h79267[7] &&
	      !_theResult____h79267[6] &&
	      !_theResult____h79267[5] &&
	      !_theResult____h79267[4] &&
	      !_theResult____h79267[3] &&
	      !_theResult____h79267[2] &&
	      !_theResult____h79267[1] &&
	      !_theResult____h79267[0] ||
	      !_0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BITS_1_ETC___d2560) ?
	       8'd0 :
	       _theResult___fst_exp__h87568 ;
  assign _theResult___fst_exp__h87577 =
	     (!_theResult____h79267[56] && _theResult____h79267[55]) ?
	       8'd1 :
	       _theResult___fst_exp__h87574 ;
  assign _theResult___fst_exp__h88127 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard9277_0b0_theResult___fst_exp7503_0b1_ETC__q75 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2623 ;
  assign _theResult___fst_exp__h88130 =
	     (_theResult___fst_exp__h87503 == 8'd255) ?
	       _theResult___fst_exp__h87503 :
	       _theResult___fst_exp__h88127 ;
  assign _theResult___fst_exp__h96170 =
	     (SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q64[7:0] ==
	      8'd0) ?
	       8'd1 :
	       SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q64[7:0] ;
  assign _theResult___fst_exp__h96209 =
	     SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC__q64[7:0] -
	     { 2'd0,
	       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2236 } ;
  assign _theResult___fst_exp__h96215 =
	     (requestR[190:180] == 11'd0 &&
	      NOT_requestR_BIT_179_767_142_AND_NOT_requestR__ETC___d2181 ||
	      !_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_0__ETC___d2633) ?
	       8'd0 :
	       _theResult___fst_exp__h96209 ;
  assign _theResult___fst_exp__h96218 =
	     (requestR[190:180] == 11'd0) ?
	       _theResult___fst_exp__h96215 :
	       _theResult___fst_exp__h96170 ;
  assign _theResult___fst_exp__h96793 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard8141_0b0_theResult___fst_exp6218_0b1_ETC__q77 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2692 ;
  assign _theResult___fst_exp__h96796 =
	     (_theResult___fst_exp__h96218 == 8'd255) ?
	       _theResult___fst_exp__h96218 :
	       _theResult___fst_exp__h96793 ;
  assign _theResult___fst_exp__h96805 =
	     (requestR[190:180] == 11'd0) ?
	       (_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1841 ?
		  _theResult___snd_fst_exp__h78892 :
		  _theResult___fst_exp__h61525) :
	       (SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2312 ?
		  _theResult___snd_fst_exp__h96799 :
		  _theResult___fst_exp__h61525) ;
  assign _theResult___fst_exp__h96808 =
	     (requestR[190:180] == 11'd0 && requestR[179:128] == 52'd0) ?
	       8'd0 :
	       _theResult___fst_exp__h96805 ;
  assign _theResult___fst_sfd__h104193 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3) ?
	       52'd0 :
	       CASE_requestR_BITS_194_TO_192_0x1_450359962737_ETC__q5 ;
  assign _theResult___fst_sfd__h120019 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard11304_0b0_theResult___snd19216_BITS__ETC__q115 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3561 ;
  assign _theResult___fst_sfd__h120022 =
	     (_theResult___fst_exp__h119265 == 11'd2047) ?
	       _theResult___snd__h119216[56:5] :
	       _theResult___fst_sfd__h120019 ;
  assign _theResult___fst_sfd__h129666 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard20612_0b0_sfdin28832_BITS_56_TO_5_0b_ETC__q117 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3588 ;
  assign _theResult___fst_sfd__h129669 =
	     (_theResult___fst_exp__h128838 == 11'd2047) ?
	       sfdin__h128832[56:5] :
	       _theResult___fst_sfd__h129666 ;
  assign _theResult___fst_sfd__h13823 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard3313_0b0_sfd___33303_BITS_31_TO_9_0b_ETC__q30 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d720 ;
  assign _theResult___fst_sfd__h138448 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard29679_0b0_theResult___snd37615_BITS__ETC__q119 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3607 ;
  assign _theResult___fst_sfd__h138451 =
	     (_theResult___fst_exp__h137669 == 11'd2047) ?
	       _theResult___snd__h137615[56:5] :
	       _theResult___fst_sfd__h138448 ;
  assign _theResult___fst_sfd__h138460 =
	     (sV1_exp__h815 == 8'd0) ?
	       (_3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3003 ?
		  _theResult___snd_fst_sfd__h120025 :
		  _theResult___fst_sfd__h104193) :
	       (SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3146 ?
		  _theResult___snd_fst_sfd__h138454 :
		  _theResult___fst_sfd__h104193) ;
  assign _theResult___fst_sfd__h138466 =
	     ((sV1_exp__h815 == 8'd255 || sV1_exp__h815 == 8'd0) &&
	      sV1_sfd__h816 == 23'd0) ?
	       52'd0 :
	       _theResult___fst_sfd__h138460 ;
  assign _theResult___fst_sfd__h14375 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard3839_0b0_sfd___33303_BITS_30_TO_8_0b_ETC__q28 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d735 ;
  assign _theResult___fst_sfd__h14378 =
	     (x__h13854[7:0] == 8'd255) ?
	       sfd___3__h13303[30:8] :
	       _theResult___fst_sfd__h14375 ;
  assign _theResult___fst_sfd__h36486 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard5772_0b0_sfd___35762_BITS_54_TO_3_0b_ETC__q46 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1362 ;
  assign _theResult___fst_sfd__h37242 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard6502_0b0_sfd___35762_BITS_53_TO_2_0b_ETC__q42 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1380 ;
  assign _theResult___fst_sfd__h37245 =
	     (x__h36517[10:0] == 11'd2047) ?
	       sfd___3__h35762[53:2] :
	       _theResult___fst_sfd__h37242 ;
  assign _theResult___fst_sfd__h46181 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard5468_0b0_sfd___35458_BITS_54_TO_3_0b_ETC__q57 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1548 ;
  assign _theResult___fst_sfd__h46936 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard6197_0b0_sfd___35458_BITS_53_TO_2_0b_ETC__q55 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1563 ;
  assign _theResult___fst_sfd__h46939 =
	     (x__h46212[10:0] == 11'd2047) ?
	       sfd___3__h45458[53:2] :
	       _theResult___fst_sfd__h46936 ;
  assign _theResult___fst_sfd__h50209 = { 1'd1, requestR[178:128] } ;
  assign _theResult___fst_sfd__h61526 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3) ?
	       23'd0 :
	       CASE_requestR_BITS_194_TO_192_0x1_8388607_0x2__ETC__q3 ;
  assign _theResult___fst_sfd__h70275 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard1553_0b0_sfdin9644_BITS_56_TO_34_0b1_ETC__q79 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2726 ;
  assign _theResult___fst_sfd__h70278 =
	     (_theResult___fst_exp__h69650 == 8'd255) ?
	       sfdin__h69644[56:34] :
	       _theResult___fst_sfd__h70275 ;
  assign _theResult___fst_sfd__h7650 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard136_0b0_sfd___3126_BITS_31_TO_9_0b1__ETC__q17 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d402 ;
  assign _theResult___fst_sfd__h78887 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard0288_0b0_theResult___snd8287_BITS_56_ETC__q81 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2745 ;
  assign _theResult___fst_sfd__h78890 =
	     (_theResult___fst_exp__h78336 == 8'd255) ?
	       _theResult___snd__h78287[56:34] :
	       _theResult___fst_sfd__h78887 ;
  assign _theResult___fst_sfd__h8203 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard666_0b0_sfd___3126_BITS_30_TO_8_0b1__ETC__q19 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d420 ;
  assign _theResult___fst_sfd__h8206 =
	     (x__h7681[7:0] == 8'd255) ?
	       sfd___3__h7126[30:8] :
	       _theResult___fst_sfd__h8203 ;
  assign _theResult___fst_sfd__h88128 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard9277_0b0_sfdin7497_BITS_56_TO_34_0b1_ETC__q83 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2772 ;
  assign _theResult___fst_sfd__h88131 =
	     (_theResult___fst_exp__h87503 == 8'd255) ?
	       sfdin__h87497[56:34] :
	       _theResult___fst_sfd__h88128 ;
  assign _theResult___fst_sfd__h96794 =
	     (requestR[194:192] != 3'h1 && requestR[194:192] != 3'h2 &&
	      requestR[194:192] != 3'h3 &&
	      requestR[194:192] != 3'h4) ?
	       CASE_guard8141_0b0_theResult___snd6164_BITS_56_ETC__q85 :
	       IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2791 ;
  assign _theResult___fst_sfd__h96797 =
	     (_theResult___fst_exp__h96218 == 8'd255) ?
	       _theResult___snd__h96164[56:34] :
	       _theResult___fst_sfd__h96794 ;
  assign _theResult___fst_sfd__h96806 =
	     (requestR[190:180] == 11'd0) ?
	       (_3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1841 ?
		  _theResult___snd_fst_sfd__h78893 :
		  _theResult___fst_sfd__h61526) :
	       (SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2312 ?
		  _theResult___snd_fst_sfd__h96800 :
		  _theResult___fst_sfd__h61526) ;
  assign _theResult___fst_sfd__h96812 =
	     ((requestR[190:180] == 11'd2047 || requestR[190:180] == 11'd0) &&
	      requestR[179:128] == 52'd0) ?
	       23'd0 :
	       _theResult___fst_sfd__h96806 ;
  assign _theResult___fst_sfd__h98711 = { 1'd1, sV1_sfd__h816[21:0] } ;
  assign _theResult___sfd__h119921 =
	     sfd__h119283[53] ?
	       ((_theResult___fst_exp__h119265 == 11'd2046) ?
		  52'd0 :
		  sfd__h119283[52:1]) :
	       sfd__h119283[51:0] ;
  assign _theResult___sfd__h129568 =
	     sfd__h128930[53] ?
	       ((_theResult___fst_exp__h128838 == 11'd2046) ?
		  52'd0 :
		  sfd__h128930[52:1]) :
	       sfd__h128930[51:0] ;
  assign _theResult___sfd__h13727 =
	     sfd__h13330[24] ? sfd__h13330[23:1] : sfd__h13330[22:0] ;
  assign _theResult___sfd__h138350 =
	     sfd__h137688[53] ?
	       ((_theResult___fst_exp__h137669 == 11'd2046) ?
		  52'd0 :
		  sfd__h137688[52:1]) :
	       sfd__h137688[51:0] ;
  assign _theResult___sfd__h14279 =
	     sfd__h13869[24] ?
	       ((x__h13854[7:0] == 8'd254) ? 23'd0 : sfd__h13869[23:1]) :
	       sfd__h13869[22:0] ;
  assign _theResult___sfd__h36389 =
	     sfd__h35789[53] ? sfd__h35789[52:1] : sfd__h35789[51:0] ;
  assign _theResult___sfd__h37145 =
	     sfd__h36532[53] ?
	       ((x__h36517[10:0] == 11'd2046) ? 52'd0 : sfd__h36532[52:1]) :
	       sfd__h36532[51:0] ;
  assign _theResult___sfd__h46085 =
	     sfd__h45485[53] ? sfd__h45485[52:1] : sfd__h45485[51:0] ;
  assign _theResult___sfd__h46840 =
	     sfd__h46227[53] ?
	       ((x__h46212[10:0] == 11'd2046) ? 52'd0 : sfd__h46227[52:1]) :
	       sfd__h46227[51:0] ;
  assign _theResult___sfd__h70177 =
	     sfd__h69742[24] ?
	       ((_theResult___fst_exp__h69650 == 8'd254) ?
		  23'd0 :
		  sfd__h69742[23:1]) :
	       sfd__h69742[22:0] ;
  assign _theResult___sfd__h7553 =
	     sfd__h7153[24] ? sfd__h7153[23:1] : sfd__h7153[22:0] ;
  assign _theResult___sfd__h78789 =
	     sfd__h78354[24] ?
	       ((_theResult___fst_exp__h78336 == 8'd254) ?
		  23'd0 :
		  sfd__h78354[23:1]) :
	       sfd__h78354[22:0] ;
  assign _theResult___sfd__h8106 =
	     sfd__h7696[24] ?
	       ((x__h7681[7:0] == 8'd254) ? 23'd0 : sfd__h7696[23:1]) :
	       sfd__h7696[22:0] ;
  assign _theResult___sfd__h88030 =
	     sfd__h87595[24] ?
	       ((_theResult___fst_exp__h87503 == 8'd254) ?
		  23'd0 :
		  sfd__h87595[23:1]) :
	       sfd__h87595[22:0] ;
  assign _theResult___sfd__h96696 =
	     sfd__h96237[24] ?
	       ((_theResult___fst_exp__h96218 == 8'd254) ?
		  23'd0 :
		  sfd__h96237[23:1]) :
	       sfd__h96237[22:0] ;
  assign _theResult___snd__h119216 =
	     (sV1_exp__h815 == 8'd0) ?
	       _theResult___snd__h119225 :
	       _theResult___snd__h119218 ;
  assign _theResult___snd__h119218 = { sV1_sfd__h816, 34'd0 } ;
  assign _theResult___snd__h119225 =
	     (sV1_exp__h815 == 8'd0 && !sV1_sfd__h816[22] &&
	      NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d3047) ?
	       b__h15050 :
	       _theResult___snd__h119231 ;
  assign _theResult___snd__h119231 =
	     { IF_0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_E_ETC__q94[54:0],
	       2'd0 } ;
  assign _theResult___snd__h119254 =
	     b__h15050 <<
	     IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3074 ;
  assign _theResult___snd__h128849 = { _theResult____h120602[55:0], 1'd0 } ;
  assign _theResult___snd__h128860 =
	     (!_theResult____h120602[56] && _theResult____h120602[55]) ?
	       _theResult___snd__h128862 :
	       _theResult___snd__h128872 ;
  assign _theResult___snd__h128862 = { _theResult____h120602[54:0], 2'd0 } ;
  assign _theResult___snd__h128872 =
	     (!_theResult____h120602[56] && !_theResult____h120602[55] &&
	      !_theResult____h120602[54] &&
	      !_theResult____h120602[53] &&
	      !_theResult____h120602[52] &&
	      !_theResult____h120602[51] &&
	      !_theResult____h120602[50] &&
	      !_theResult____h120602[49] &&
	      !_theResult____h120602[48] &&
	      !_theResult____h120602[47] &&
	      !_theResult____h120602[46] &&
	      !_theResult____h120602[45] &&
	      !_theResult____h120602[44] &&
	      !_theResult____h120602[43] &&
	      !_theResult____h120602[42] &&
	      !_theResult____h120602[41] &&
	      !_theResult____h120602[40] &&
	      !_theResult____h120602[39] &&
	      !_theResult____h120602[38] &&
	      !_theResult____h120602[37] &&
	      !_theResult____h120602[36] &&
	      !_theResult____h120602[35] &&
	      !_theResult____h120602[34] &&
	      !_theResult____h120602[33] &&
	      !_theResult____h120602[32] &&
	      !_theResult____h120602[31] &&
	      !_theResult____h120602[30] &&
	      !_theResult____h120602[29] &&
	      !_theResult____h120602[28] &&
	      !_theResult____h120602[27] &&
	      !_theResult____h120602[26] &&
	      !_theResult____h120602[25] &&
	      !_theResult____h120602[24] &&
	      !_theResult____h120602[23] &&
	      !_theResult____h120602[22] &&
	      !_theResult____h120602[21] &&
	      !_theResult____h120602[20] &&
	      !_theResult____h120602[19] &&
	      !_theResult____h120602[18] &&
	      !_theResult____h120602[17] &&
	      !_theResult____h120602[16] &&
	      !_theResult____h120602[15] &&
	      !_theResult____h120602[14] &&
	      !_theResult____h120602[13] &&
	      !_theResult____h120602[12] &&
	      !_theResult____h120602[11] &&
	      !_theResult____h120602[10] &&
	      !_theResult____h120602[9] &&
	      !_theResult____h120602[8] &&
	      !_theResult____h120602[7] &&
	      !_theResult____h120602[6] &&
	      !_theResult____h120602[5] &&
	      !_theResult____h120602[4] &&
	      !_theResult____h120602[3] &&
	      !_theResult____h120602[2] &&
	      !_theResult____h120602[1] &&
	      !_theResult____h120602[0]) ?
	       _theResult____h120602 :
	       _theResult___snd__h128878 ;
  assign _theResult___snd__h128878 =
	     { IF_0_CONCAT_IF_IF_3074_MINUS_SEXT_IF_requestR__ETC__q97[54:0],
	       2'd0 } ;
  assign _theResult___snd__h128901 =
	     _theResult____h120602 <<
	     IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_191_TO__ETC___d3394 ;
  assign _theResult___snd__h137615 =
	     (sV1_exp__h815 == 8'd0) ?
	       _theResult___snd__h137629 :
	       _theResult___snd__h119218 ;
  assign _theResult___snd__h137629 =
	     (sV1_exp__h815 == 8'd0 && !sV1_sfd__h816[22] &&
	      NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d3047) ?
	       b__h15050 :
	       _theResult___snd__h137635 ;
  assign _theResult___snd__h137635 =
	     { IF_0_CONCAT_IF_IF_requestR_BITS_191_TO_160_4_E_ETC__q100[54:0],
	       2'd0 } ;
  assign _theResult___snd__h137653 =
	     b__h15050 <<
	     IF_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFF_ETC___d3468 ;
  assign _theResult___snd__h69661 = { _theResult____h61543[55:0], 1'd0 } ;
  assign _theResult___snd__h69672 =
	     (!_theResult____h61543[56] && _theResult____h61543[55]) ?
	       _theResult___snd__h69674 :
	       _theResult___snd__h69684 ;
  assign _theResult___snd__h69674 = { _theResult____h61543[54:0], 2'd0 } ;
  assign _theResult___snd__h69684 =
	     (!_theResult____h61543[56] && !_theResult____h61543[55] &&
	      !_theResult____h61543[54] &&
	      !_theResult____h61543[53] &&
	      !_theResult____h61543[52] &&
	      !_theResult____h61543[51] &&
	      !_theResult____h61543[50] &&
	      !_theResult____h61543[49] &&
	      !_theResult____h61543[48] &&
	      !_theResult____h61543[47] &&
	      !_theResult____h61543[46] &&
	      !_theResult____h61543[45] &&
	      !_theResult____h61543[44] &&
	      !_theResult____h61543[43] &&
	      !_theResult____h61543[42] &&
	      !_theResult____h61543[41] &&
	      !_theResult____h61543[40] &&
	      !_theResult____h61543[39] &&
	      !_theResult____h61543[38] &&
	      !_theResult____h61543[37] &&
	      !_theResult____h61543[36] &&
	      !_theResult____h61543[35] &&
	      !_theResult____h61543[34] &&
	      !_theResult____h61543[33] &&
	      !_theResult____h61543[32] &&
	      !_theResult____h61543[31] &&
	      !_theResult____h61543[30] &&
	      !_theResult____h61543[29] &&
	      !_theResult____h61543[28] &&
	      !_theResult____h61543[27] &&
	      !_theResult____h61543[26] &&
	      !_theResult____h61543[25] &&
	      !_theResult____h61543[24] &&
	      !_theResult____h61543[23] &&
	      !_theResult____h61543[22] &&
	      !_theResult____h61543[21] &&
	      !_theResult____h61543[20] &&
	      !_theResult____h61543[19] &&
	      !_theResult____h61543[18] &&
	      !_theResult____h61543[17] &&
	      !_theResult____h61543[16] &&
	      !_theResult____h61543[15] &&
	      !_theResult____h61543[14] &&
	      !_theResult____h61543[13] &&
	      !_theResult____h61543[12] &&
	      !_theResult____h61543[11] &&
	      !_theResult____h61543[10] &&
	      !_theResult____h61543[9] &&
	      !_theResult____h61543[8] &&
	      !_theResult____h61543[7] &&
	      !_theResult____h61543[6] &&
	      !_theResult____h61543[5] &&
	      !_theResult____h61543[4] &&
	      !_theResult____h61543[3] &&
	      !_theResult____h61543[2] &&
	      !_theResult____h61543[1] &&
	      !_theResult____h61543[0]) ?
	       _theResult____h61543 :
	       _theResult___snd__h69690 ;
  assign _theResult___snd__h69690 =
	     { IF_0_CONCAT_IF_IF_0b0_CONCAT_NOT_requestR_BITS_ETC__q60[54:0],
	       2'd0 } ;
  assign _theResult___snd__h69713 =
	     _theResult____h61543 <<
	     IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_TO_180__ETC___d2074 ;
  assign _theResult___snd__h78287 =
	     (requestR[190:180] == 11'd0) ?
	       _theResult___snd__h78296 :
	       _theResult___snd__h78289 ;
  assign _theResult___snd__h78289 = { requestR[179:128], 5'd0 } ;
  assign _theResult___snd__h78296 =
	     (requestR[190:180] == 11'd0 &&
	      NOT_requestR_BIT_179_767_142_AND_NOT_requestR__ETC___d2181) ?
	       sfd__h53913 :
	       _theResult___snd__h78302 ;
  assign _theResult___snd__h78302 =
	     { IF_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_ETC__q62[54:0],
	       2'd0 } ;
  assign _theResult___snd__h78325 =
	     sfd__h53913 <<
	     IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2236 ;
  assign _theResult___snd__h87514 = { _theResult____h79267[55:0], 1'd0 } ;
  assign _theResult___snd__h87525 =
	     (!_theResult____h79267[56] && _theResult____h79267[55]) ?
	       _theResult___snd__h87527 :
	       _theResult___snd__h87537 ;
  assign _theResult___snd__h87527 = { _theResult____h79267[54:0], 2'd0 } ;
  assign _theResult___snd__h87537 =
	     (!_theResult____h79267[56] && !_theResult____h79267[55] &&
	      !_theResult____h79267[54] &&
	      !_theResult____h79267[53] &&
	      !_theResult____h79267[52] &&
	      !_theResult____h79267[51] &&
	      !_theResult____h79267[50] &&
	      !_theResult____h79267[49] &&
	      !_theResult____h79267[48] &&
	      !_theResult____h79267[47] &&
	      !_theResult____h79267[46] &&
	      !_theResult____h79267[45] &&
	      !_theResult____h79267[44] &&
	      !_theResult____h79267[43] &&
	      !_theResult____h79267[42] &&
	      !_theResult____h79267[41] &&
	      !_theResult____h79267[40] &&
	      !_theResult____h79267[39] &&
	      !_theResult____h79267[38] &&
	      !_theResult____h79267[37] &&
	      !_theResult____h79267[36] &&
	      !_theResult____h79267[35] &&
	      !_theResult____h79267[34] &&
	      !_theResult____h79267[33] &&
	      !_theResult____h79267[32] &&
	      !_theResult____h79267[31] &&
	      !_theResult____h79267[30] &&
	      !_theResult____h79267[29] &&
	      !_theResult____h79267[28] &&
	      !_theResult____h79267[27] &&
	      !_theResult____h79267[26] &&
	      !_theResult____h79267[25] &&
	      !_theResult____h79267[24] &&
	      !_theResult____h79267[23] &&
	      !_theResult____h79267[22] &&
	      !_theResult____h79267[21] &&
	      !_theResult____h79267[20] &&
	      !_theResult____h79267[19] &&
	      !_theResult____h79267[18] &&
	      !_theResult____h79267[17] &&
	      !_theResult____h79267[16] &&
	      !_theResult____h79267[15] &&
	      !_theResult____h79267[14] &&
	      !_theResult____h79267[13] &&
	      !_theResult____h79267[12] &&
	      !_theResult____h79267[11] &&
	      !_theResult____h79267[10] &&
	      !_theResult____h79267[9] &&
	      !_theResult____h79267[8] &&
	      !_theResult____h79267[7] &&
	      !_theResult____h79267[6] &&
	      !_theResult____h79267[5] &&
	      !_theResult____h79267[4] &&
	      !_theResult____h79267[3] &&
	      !_theResult____h79267[2] &&
	      !_theResult____h79267[1] &&
	      !_theResult____h79267[0]) ?
	       _theResult____h79267 :
	       _theResult___snd__h87543 ;
  assign _theResult___snd__h87543 =
	     { IF_0_CONCAT_IF_IF_3970_MINUS_SEXT_requestR_BIT_ETC__q65[54:0],
	       2'd0 } ;
  assign _theResult___snd__h87566 =
	     _theResult____h79267 <<
	     IF_IF_3970_MINUS_SEXT_requestR_BITS_190_TO_180_ETC___d2558 ;
  assign _theResult___snd__h96164 =
	     (requestR[190:180] == 11'd0) ?
	       _theResult___snd__h96178 :
	       _theResult___snd__h78289 ;
  assign _theResult___snd__h96178 =
	     (requestR[190:180] == 11'd0 &&
	      NOT_requestR_BIT_179_767_142_AND_NOT_requestR__ETC___d2181) ?
	       sfd__h53913 :
	       _theResult___snd__h96184 ;
  assign _theResult___snd__h96184 =
	     { IF_0_CONCAT_IF_requestR_BITS_190_TO_180_596_EQ_ETC__q68[54:0],
	       2'd0 } ;
  assign _theResult___snd__h96202 =
	     sfd__h53913 <<
	     IF_SEXT_requestR_BITS_190_TO_180_596_MINUS_102_ETC___d2632 ;
  assign _theResult___snd_fst_exp__h120024 =
	     _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3004 ?
	       11'd0 :
	       _theResult___fst_exp__h120021 ;
  assign _theResult___snd_fst_exp__h138453 =
	     SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3147 ?
	       _theResult___fst_exp__h129668 :
	       _theResult___fst_exp__h138450 ;
  assign _theResult___snd_fst_exp__h14380 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d619 ?
	       _theResult___fst_exp__h13822 :
	       _theResult___fst_exp__h14377 ;
  assign _theResult___snd_fst_exp__h14383 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d618 ?
	       8'd0 :
	       _theResult___snd_fst_exp__h14380 ;
  assign _theResult___snd_fst_exp__h14386 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d617 ?
	       _theResult___snd_fst_exp__h14383 :
	       8'd255 ;
  assign _theResult___snd_fst_exp__h37247 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1235 ?
	       _theResult___fst_exp__h36485 :
	       _theResult___fst_exp__h37244 ;
  assign _theResult___snd_fst_exp__h37250 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1233 ?
	       11'd0 :
	       _theResult___snd_fst_exp__h37247 ;
  assign _theResult___snd_fst_exp__h37253 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1231 ?
	       _theResult___snd_fst_exp__h37250 :
	       11'd2047 ;
  assign _theResult___snd_fst_exp__h46941 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1448 ?
	       _theResult___fst_exp__h46180 :
	       _theResult___fst_exp__h46938 ;
  assign _theResult___snd_fst_exp__h46944 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1447 ?
	       11'd0 :
	       _theResult___snd_fst_exp__h46941 ;
  assign _theResult___snd_fst_exp__h46947 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1446 ?
	       _theResult___snd_fst_exp__h46944 :
	       11'd2047 ;
  assign _theResult___snd_fst_exp__h78892 =
	     _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1842 ?
	       _theResult___fst_exp__h70277 :
	       _theResult___fst_exp__h78889 ;
  assign _theResult___snd_fst_exp__h8208 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d264 ?
	       _theResult___fst_exp__h7649 :
	       _theResult___fst_exp__h8205 ;
  assign _theResult___snd_fst_exp__h8211 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d261 ?
	       8'd0 :
	       _theResult___snd_fst_exp__h8208 ;
  assign _theResult___snd_fst_exp__h8214 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d259 ?
	       _theResult___snd_fst_exp__h8211 :
	       8'd255 ;
  assign _theResult___snd_fst_exp__h96799 =
	     SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2313 ?
	       _theResult___fst_exp__h88130 :
	       _theResult___fst_exp__h96796 ;
  assign _theResult___snd_fst_sfd__h100339 =
	     (value__h98456 == 23'd0) ?
	       52'h4000000000000 :
	       out___1_sfd__h98453 ;
  assign _theResult___snd_fst_sfd__h120025 =
	     _3970_MINUS_0_CONCAT_IF_IF_requestR_BITS_191_TO_ETC___d3004 ?
	       52'd0 :
	       _theResult___fst_sfd__h120022 ;
  assign _theResult___snd_fst_sfd__h138454 =
	     SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFF_ETC___d3147 ?
	       _theResult___fst_sfd__h129669 :
	       _theResult___fst_sfd__h138451 ;
  assign _theResult___snd_fst_sfd__h14381 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d619 ?
	       _theResult___fst_sfd__h13823 :
	       _theResult___fst_sfd__h14378 ;
  assign _theResult___snd_fst_sfd__h37248 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1235 ?
	       _theResult___fst_sfd__h36486 :
	       _theResult___fst_sfd__h37245 ;
  assign _theResult___snd_fst_sfd__h46942 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1448 ?
	       _theResult___fst_sfd__h46181 :
	       _theResult___fst_sfd__h46939 ;
  assign _theResult___snd_fst_sfd__h53867 =
	     (value__h49752[51:29] == 23'd0) ?
	       23'd2097152 :
	       value__h49752[51:29] ;
  assign _theResult___snd_fst_sfd__h78893 =
	     _3074_MINUS_0_CONCAT_IF_requestR_BIT_179_767_TH_ETC___d1842 ?
	       _theResult___fst_sfd__h70278 :
	       _theResult___fst_sfd__h78890 ;
  assign _theResult___snd_fst_sfd__h8209 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d264 ?
	       _theResult___fst_sfd__h7650 :
	       _theResult___fst_sfd__h8206 ;
  assign _theResult___snd_fst_sfd__h96800 =
	     SEXT_requestR_BITS_190_TO_180_596_MINUS_1023_6_ETC___d2313 ?
	       _theResult___fst_sfd__h88131 :
	       _theResult___fst_sfd__h96797 ;
  assign ab__h156914 = dw_result$wget ;
  assign b__h15050 = { value__h15052, 32'd0 } ;
  assign b__h47607 = { value__h47609, 32'd0 } ;
  assign din_inc___2_exp__h138485 = _theResult___fst_exp__h119265 + 11'd1 ;
  assign din_inc___2_exp__h138515 = _theResult___fst_exp__h128838 + 11'd1 ;
  assign din_inc___2_exp__h138539 = _theResult___fst_exp__h137669 + 11'd1 ;
  assign din_inc___2_exp__h14416 = x__h13854[7:0] + 8'd1 ;
  assign din_inc___2_exp__h37287 = x__h36517[10:0] + 11'd1 ;
  assign din_inc___2_exp__h46977 = x__h46212[10:0] + 11'd1 ;
  assign din_inc___2_exp__h8248 = x__h7681[7:0] + 8'd1 ;
  assign din_inc___2_exp__h96827 = _theResult___fst_exp__h69650 + 8'd1 ;
  assign din_inc___2_exp__h96851 = _theResult___fst_exp__h78336 + 8'd1 ;
  assign din_inc___2_exp__h96881 = _theResult___fst_exp__h87503 + 8'd1 ;
  assign din_inc___2_exp__h96905 = _theResult___fst_exp__h96218 + 8'd1 ;
  assign guard__h111304 =
	     { IF_theResult___snd19216_BIT_4_THEN_2_ELSE_0__q95[1],
	       { _theResult___snd__h119216[3:0], 52'd0 } != 56'd0 } ;
  assign guard__h120612 =
	     { IF_sfdin28832_BIT_4_THEN_2_ELSE_0__q98[1],
	       { sfdin__h128832[3:0], 52'd0 } != 56'd0 } ;
  assign guard__h121210 = x__h121310 != 57'd0 ;
  assign guard__h129679 =
	     { IF_theResult___snd37615_BIT_4_THEN_2_ELSE_0__q101[1],
	       { _theResult___snd__h137615[3:0], 52'd0 } != 56'd0 } ;
  assign guard__h13313 =
	     { IF_sfd___33303_BIT_8_THEN_2_ELSE_0__q20[1],
	       { sfd___3__h13303[7:0], 23'd0 } != 31'd0 } ;
  assign guard__h13839 =
	     { IF_sfd___33303_BIT_7_THEN_2_ELSE_0__q21[1],
	       { sfd___3__h13303[6:0], 24'd0 } != 31'd0 } ;
  assign guard__h14983 =
	     { IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d827[23],
	       { IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d827[22:0],
		 33'd0 } !=
	       56'd0 } ;
  assign guard__h15537 =
	     { IF_x5726_BIT_24_THEN_2_ELSE_0__q31[1],
	       { x__h15726[23:0], 32'd0 } != 56'd0 } ;
  assign guard__h16600 =
	     { IF_x6821_BIT_24_THEN_2_ELSE_0__q32[1],
	       { x__h16821[23:0], 32'd0 } != 56'd0 } ;
  assign guard__h35772 =
	     { IF_sfd___35762_BIT_2_THEN_2_ELSE_0__q33[1],
	       { sfd___3__h35762[1:0], 52'd0 } != 54'd0 } ;
  assign guard__h36502 =
	     { IF_sfd___35762_BIT_1_THEN_2_ELSE_0__q34[1],
	       { sfd___3__h35762[0], 53'd0 } != 54'd0 } ;
  assign guard__h45468 =
	     { IF_sfd___35458_BIT_2_THEN_2_ELSE_0__q47[1],
	       { sfd___3__h45458[1:0], 52'd0 } != 54'd0 } ;
  assign guard__h46197 =
	     { IF_sfd___35458_BIT_1_THEN_2_ELSE_0__q48[1],
	       { sfd___3__h45458[0], 53'd0 } != 54'd0 } ;
  assign guard__h47540 =
	     { IF_requestR_BIT_191_186_THEN_NEG_0b0_CONCAT_NO_ETC___d1618[52],
	       { IF_requestR_BIT_191_186_THEN_NEG_0b0_CONCAT_NO_ETC___d1618[51:0],
		 33'd0 } !=
	       85'd0 } ;
  assign guard__h48094 =
	     { IF_x8283_BIT_53_THEN_2_ELSE_0__q58[1],
	       { x__h48283[52:0], 32'd0 } != 85'd0 } ;
  assign guard__h49140 =
	     { IF_x9361_BIT_53_THEN_2_ELSE_0__q59[1],
	       { x__h49361[52:0], 32'd0 } != 85'd0 } ;
  assign guard__h61553 =
	     { IF_sfdin9644_BIT_33_THEN_2_ELSE_0__q61[1],
	       { sfdin__h69644[32:0], 23'd0 } != 56'd0 } ;
  assign guard__h70288 =
	     { IF_theResult___snd8287_BIT_33_THEN_2_ELSE_0__q63[1],
	       { _theResult___snd__h78287[32:0], 23'd0 } != 56'd0 } ;
  assign guard__h7136 =
	     { IF_sfd___3126_BIT_8_THEN_2_ELSE_0__q6[1],
	       { sfd___3__h7126[7:0], 23'd0 } != 31'd0 } ;
  assign guard__h7666 =
	     { IF_sfd___3126_BIT_7_THEN_2_ELSE_0__q7[1],
	       { sfd___3__h7126[6:0], 24'd0 } != 31'd0 } ;
  assign guard__h79277 =
	     { IF_sfdin7497_BIT_33_THEN_2_ELSE_0__q66[1],
	       { sfdin__h87497[32:0], 23'd0 } != 56'd0 } ;
  assign guard__h79875 = x__h79975 != 57'd0 ;
  assign guard__h88141 =
	     { IF_theResult___snd6164_BIT_33_THEN_2_ELSE_0__q69[1],
	       { _theResult___snd__h96164[32:0], 23'd0 } != 56'd0 } ;
  assign out1___1__h15477 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d827[56:24] +
	     33'd1 ;
  assign out1___1__h48034 =
	     IF_requestR_BIT_191_186_THEN_NEG_0b0_CONCAT_NO_ETC___d1618[85:53] +
	     33'd1 ;
  assign out___1_sfd__h98453 = { value__h98456, 29'd0 } ;
  assign out_exp__h119923 =
	     _theResult___snd__h119216[5] ?
	       _theResult___exp__h119920 :
	       _theResult___fst_exp__h119265 ;
  assign out_exp__h129570 =
	     sfdin__h128832[5] ?
	       _theResult___exp__h129567 :
	       _theResult___fst_exp__h128838 ;
  assign out_exp__h13729 =
	     sfd___3__h13303[9] ? _theResult___exp__h13726 : 8'd0 ;
  assign out_exp__h138352 =
	     _theResult___snd__h137615[5] ?
	       _theResult___exp__h138349 :
	       _theResult___fst_exp__h137669 ;
  assign out_exp__h14281 =
	     sfd___3__h13303[8] ? _theResult___exp__h14278 : x__h13854[7:0] ;
  assign out_exp__h36391 =
	     sfd___3__h35762[3] ? _theResult___exp__h36388 : 11'd0 ;
  assign out_exp__h37147 =
	     sfd___3__h35762[2] ? _theResult___exp__h37144 : x__h36517[10:0] ;
  assign out_exp__h46087 =
	     sfd___3__h45458[3] ? _theResult___exp__h46084 : 11'd0 ;
  assign out_exp__h46842 =
	     sfd___3__h45458[2] ? _theResult___exp__h46839 : x__h46212[10:0] ;
  assign out_exp__h70179 =
	     sfdin__h69644[34] ?
	       _theResult___exp__h70176 :
	       _theResult___fst_exp__h69650 ;
  assign out_exp__h7555 = sfd___3__h7126[9] ? _theResult___exp__h7552 : 8'd0 ;
  assign out_exp__h78791 =
	     _theResult___snd__h78287[34] ?
	       _theResult___exp__h78788 :
	       _theResult___fst_exp__h78336 ;
  assign out_exp__h8108 =
	     sfd___3__h7126[8] ? _theResult___exp__h8105 : x__h7681[7:0] ;
  assign out_exp__h88032 =
	     sfdin__h87497[34] ?
	       _theResult___exp__h88029 :
	       _theResult___fst_exp__h87503 ;
  assign out_exp__h96698 =
	     _theResult___snd__h96164[34] ?
	       _theResult___exp__h96695 :
	       _theResult___fst_exp__h96218 ;
  assign out_sfd__h119924 =
	     _theResult___snd__h119216[5] ?
	       _theResult___sfd__h119921 :
	       _theResult___snd__h119216[56:5] ;
  assign out_sfd__h129571 =
	     sfdin__h128832[5] ?
	       _theResult___sfd__h129568 :
	       sfdin__h128832[56:5] ;
  assign out_sfd__h13730 =
	     sfd___3__h13303[9] ?
	       _theResult___sfd__h13727 :
	       sfd___3__h13303[31:9] ;
  assign out_sfd__h138353 =
	     _theResult___snd__h137615[5] ?
	       _theResult___sfd__h138350 :
	       _theResult___snd__h137615[56:5] ;
  assign out_sfd__h14282 =
	     sfd___3__h13303[8] ?
	       _theResult___sfd__h14279 :
	       sfd___3__h13303[30:8] ;
  assign out_sfd__h36392 =
	     sfd___3__h35762[3] ?
	       _theResult___sfd__h36389 :
	       sfd___3__h35762[54:3] ;
  assign out_sfd__h37148 =
	     sfd___3__h35762[2] ?
	       _theResult___sfd__h37145 :
	       sfd___3__h35762[53:2] ;
  assign out_sfd__h46088 =
	     sfd___3__h45458[3] ?
	       _theResult___sfd__h46085 :
	       sfd___3__h45458[54:3] ;
  assign out_sfd__h46843 =
	     sfd___3__h45458[2] ?
	       _theResult___sfd__h46840 :
	       sfd___3__h45458[53:2] ;
  assign out_sfd__h70180 =
	     sfdin__h69644[34] ?
	       _theResult___sfd__h70177 :
	       sfdin__h69644[56:34] ;
  assign out_sfd__h7556 =
	     sfd___3__h7126[9] ?
	       _theResult___sfd__h7553 :
	       sfd___3__h7126[31:9] ;
  assign out_sfd__h78792 =
	     _theResult___snd__h78287[34] ?
	       _theResult___sfd__h78789 :
	       _theResult___snd__h78287[56:34] ;
  assign out_sfd__h8109 =
	     sfd___3__h7126[8] ?
	       _theResult___sfd__h8106 :
	       sfd___3__h7126[30:8] ;
  assign out_sfd__h88033 =
	     sfdin__h87497[34] ?
	       _theResult___sfd__h88030 :
	       sfdin__h87497[56:34] ;
  assign out_sfd__h96699 =
	     _theResult___snd__h96164[34] ?
	       _theResult___sfd__h96696 :
	       _theResult___snd__h96164[56:34] ;
  assign requestR_BITS_126_TO_116_745_EQ_0_759_AND_requ_ETC___d3766 =
	     requestR[126:116] == 11'd0 && requestR[115:64] == 52'd0 &&
	     requestR[127] &&
	     requestR[190:180] == 11'd0 &&
	     requestR[179:128] == 52'd0 &&
	     !requestR[191] ;
  assign requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28 =
	     { requestR[127:96] == 32'hFFFFFFFF && requestR[95],
	       (requestR[127:96] == 32'hFFFFFFFF) ?
		 requestR[94:64] :
		 31'h7FC00000 } ;
  assign requestR_BITS_159_TO_128__q1 = requestR[159:128] ;
  assign requestR_BITS_179_TO_128_598_ULE_requestR_BITS_ETC___d3778 =
	     requestR[179:128] <= requestR[115:64] ;
  assign requestR_BITS_179_TO_128_598_ULT_requestR_BITS_ETC___d3783 =
	     requestR[179:128] < requestR[115:64] ;
  assign requestR_BITS_190_TO_180_596_EQ_0_607_AND_requ_ETC___d3762 =
	     requestR[190:180] == 11'd0 && requestR[179:128] == 52'd0 &&
	     requestR[191] &&
	     requestR[126:116] == 11'd0 &&
	     requestR[115:64] == 52'd0 &&
	     !requestR[127] ;
  assign requestR_BITS_190_TO_180_596_EQ_0_607_AND_requ_ETC___d3836 =
	     requestR[190:180] == 11'd0 && requestR[179:128] == 52'd0 &&
	     requestR[126:116] == 11'd0 &&
	     requestR[115:64] == 52'd0 ||
	     (!requestR[191] || requestR[127]) &&
	     (requestR[191] || !requestR[127]) &&
	     (requestR[191] ?
		requestR_BITS_190_TO_180_596_ULE_requestR_BITS_ETC___d3831 :
		NOT_requestR_BITS_190_TO_180_596_ULT_requestR__ETC___d3832) ;
  assign requestR_BITS_190_TO_180_596_EQ_2047_597_AND_0_ETC___d1747 =
	     requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0 ||
	     requestR[190:180] == 11'd2047 && requestR[179:128] == 52'd0 ||
	     (requestR[190:180] != 11'd0 || requestR[179:128] != 52'd0) &&
	     (NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1708[23] ||
	      NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1710 &&
	      IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_OR_NOT__ETC___d1729 &&
	      x__h49361[85:54] == 32'hFFFFFFFF) ;
  assign requestR_BITS_190_TO_180_596_EQ_2047_597_AND_0_ETC___d1758 =
	     { requestR_BITS_190_TO_180_596_EQ_2047_597_AND_0_ETC___d1747,
	       3'd0,
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] == 52'd0) &&
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] != 52'd0) &&
	       NOT_requestR_BITS_190_TO_180_596_EQ_0_607_613__ETC___d1752 } ==
	     5'd0 ||
	     requestR_BITS_190_TO_180_596_EQ_2047_597_AND_0_ETC___d1747 ;
  assign requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3754 =
	     requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0 &&
	     !requestR[179] &&
	     requestR[126:116] == 11'd2047 &&
	     requestR[115:64] != 52'd0 &&
	     !requestR[115] ;
  assign requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3799 =
	     requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0 &&
	     !requestR[179] ||
	     requestR[126:116] == 11'd2047 && requestR[115:64] != 52'd0 &&
	     !requestR[115] ;
  assign requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3821 =
	     requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3799 ||
	     requestR[190:180] == 11'd2047 && requestR[179] ||
	     requestR[126:116] == 11'd2047 && requestR[115] ;
  assign requestR_BITS_190_TO_180_596_EQ_requestR_BITS__ETC___d3777 =
	     requestR[190:180] == requestR[126:116] ;
  assign requestR_BITS_190_TO_180_596_MINUS_1023___d1609 =
	     requestR[190:180] - 11'd1023 ;
  assign requestR_BITS_190_TO_180_596_ULE_requestR_BITS_ETC___d3775 =
	     requestR[190:180] <= requestR[126:116] ;
  assign requestR_BITS_190_TO_180_596_ULE_requestR_BITS_ETC___d3831 =
	     requestR_BITS_190_TO_180_596_ULE_requestR_BITS_ETC___d3775 &&
	     (!requestR_BITS_190_TO_180_596_EQ_requestR_BITS__ETC___d3777 ||
	      requestR_BITS_179_TO_128_598_ULE_requestR_BITS_ETC___d3778) &&
	     !requestR_BITS_190_TO_180_596_ULT_requestR_BITS_ETC___d3782 &&
	     (!requestR_BITS_190_TO_180_596_EQ_requestR_BITS__ETC___d3777 ||
	      !requestR_BITS_179_TO_128_598_ULT_requestR_BITS_ETC___d3783) ;
  assign requestR_BITS_190_TO_180_596_ULT_requestR_BITS_ETC___d3782 =
	     requestR[190:180] < requestR[126:116] ;
  assign requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5_AND_ETC___d1026 =
	     requestR[191:160] == 32'hFFFFFFFF && requestR[159] &&
	     (requestR[127:96] != 32'hFFFFFFFF || !requestR[95]) ||
	     (requestR[191:160] == 32'hFFFFFFFF && requestR[159] ||
	      requestR[127:96] != 32'hFFFFFFFF ||
	      !requestR[95]) &&
	     IF_NOT_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1024 ;
  assign requestR_BIT_158_88_OR_requestR_BIT_157_90_OR__ETC___d770 =
	     requestR[158] || requestR[157] || requestR[156] ||
	     requestR[155] ||
	     requestR[154] ||
	     requestR[153] ||
	     requestR[152] ||
	     requestR[151] ||
	     requestR[150] ||
	     requestR[149] ||
	     requestR[148] ||
	     requestR[147] ||
	     requestR[146] ||
	     requestR[145] ||
	     requestR[144] ||
	     requestR[143] ||
	     requestR[142] ||
	     requestR[141] ||
	     requestR[140] ||
	     requestR[139] ||
	     requestR[138] ||
	     requestR[137] ||
	     requestR[136] ||
	     requestR[135] ||
	     requestR[134] ||
	     requestR[133] ||
	     requestR[132] ||
	     requestR[131] ||
	     requestR[130] ||
	     requestR[129] ||
	     requestR[128] ;
  assign requestR_BIT_159_6_OR_requestR_BIT_158_88_OR_r_ETC___d792 =
	     (requestR[159] ||
	      requestR_BIT_158_88_OR_requestR_BIT_157_90_OR__ETC___d770) &&
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d617 &&
	     !_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d618 &&
	     IF_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THE_ETC___d789 ;
  assign res___1__h155823 =
	     (requestR[190:180] == 11'd2047 && requestR[179]) ?
	       64'd512 :
	       64'd256 ;
  assign res___1__h156261 = requestR[191] ? 64'd1 : 64'd128 ;
  assign res___1__h156271 = requestR[191] ? 64'd8 : 64'd16 ;
  assign res___1__h156290 = requestR[191] ? 64'd4 : 64'd32 ;
  assign res___1__h26221 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816[22]) ?
	       64'd512 :
	       64'd256 ;
  assign res___1__h26457 =
	     (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       64'd1 :
	       64'd128 ;
  assign res___1__h26467 =
	     (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       64'd8 :
	       64'd16 ;
  assign res___1__h26486 =
	     (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       64'd4 :
	       64'd32 ;
  assign res__h139089 =
	     { IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3650,
	       x__h98397,
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3614 } ;
  assign res__h143531 =
	     NOT_requestR_BITS_190_TO_180_596_EQ_2047_597_6_ETC___d3790 ?
	       requestR[191:128] :
	       requestR[127:64] ;
  assign res__h148079 =
	     NOT_requestR_BITS_190_TO_180_596_EQ_2047_597_6_ETC___d3790 ?
	       requestR[127:64] :
	       requestR[191:128] ;
  assign res__h150783 =
	     ((requestR[190:180] != 11'd2047 || requestR[179:128] == 52'd0) &&
	      (requestR[126:116] != 11'd2047 || requestR[115:64] == 52'd0) &&
	      requestR_BITS_190_TO_180_596_EQ_0_607_AND_requ_ETC___d3836) ?
	       64'd1 :
	       64'd0 ;
  assign res__h153478 =
	     NOT_requestR_BITS_190_TO_180_596_EQ_2047_597_6_ETC___d3790 ?
	       64'd1 :
	       64'd0 ;
  assign res__h155355 =
	     NOT_requestR_BITS_190_TO_180_596_EQ_2047_597_6_ETC___d3855 ?
	       64'd1 :
	       64'd0 ;
  assign res__h156306 = requestR[191] ? 64'd2 : 64'd64 ;
  assign res__h156487 = { 32'hFFFFFFFF, fpu$response_get[36:5] } ;
  assign res__h17825 =
	     { 32'hFFFFFFFF,
	       requestR_BITS_127_TO_96_2_EQ_0xFFFFFFFF_3_AND__ETC___d28 } ;
  assign res__h18062 =
	     { 32'hFFFFFFFF,
	       requestR[191:160] == 32'hFFFFFFFF && requestR[159],
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19 } ;
  assign res__h23434 =
	     NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1091 ?
	       64'd1 :
	       64'd0 ;
  assign res__h24917 =
	     NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1028 ?
	       64'd1 :
	       64'd0 ;
  assign res__h25986 =
	     NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d1109 ?
	       64'd1 :
	       64'd0 ;
  assign res__h26502 =
	     (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
	       64'd2 :
	       64'd64 ;
  assign res__h97284 = { 32'hFFFFFFFF, x__h97290 } ;
  assign result__h121215 =
	     { _0b0_CONCAT_NOT_IF_requestR_BITS_191_TO_160_4_E_ETC___d3152[56:1],
	       _0b0_CONCAT_NOT_IF_requestR_BITS_191_TO_160_4_E_ETC___d3152[0] |
	       guard__h121210 } ;
  assign result__h79880 =
	     { _0b0_CONCAT_NOT_requestR_BITS_190_TO_180_596_EQ_ETC___d2318[56:1],
	       _0b0_CONCAT_NOT_requestR_BITS_190_TO_180_596_EQ_ETC___d2318[0] |
	       guard__h79875 } ;
  assign sV1_exp__h815 =
	     (requestR[191:160] == 32'hFFFFFFFF) ?
	       requestR[158:151] :
	       8'd255 ;
  assign sV1_sfd__h816 =
	     (requestR[191:160] == 32'hFFFFFFFF) ?
	       requestR[150:128] :
	       23'd4194304 ;
  assign sV2_exp__h918 =
	     (requestR[127:96] == 32'hFFFFFFFF) ? requestR[94:87] : 8'd255 ;
  assign sV2_sfd__h919 =
	     (requestR[127:96] == 32'hFFFFFFFF) ?
	       requestR[86:64] :
	       23'd4194304 ;
  assign sfd___3__h13303 =
	     requestR[159:128] <<
	     IF_requestR_BIT_159_6_THEN_0_ELSE_IF_requestR__ETC___d613 ;
  assign sfd___3__h35762 =
	     sfd__h27761 <<
	     IF_IF_requestR_BIT_159_6_THEN_NEG_requestR_BIT_ETC___d1227 ;
  assign sfd___3__h45458 =
	     sfd__h37706 <<
	     IF_requestR_BIT_159_6_THEN_0_ELSE_IF_requestR__ETC___d1442 ;
  assign sfd___3__h7126 =
	     sfd__h2222 <<
	     IF_IF_requestR_BIT_159_6_THEN_NEG_requestR_BIT_ETC___d255 ;
  assign sfd__h119283 =
	     { 1'b0,
	       _theResult___fst_exp__h119265 != 11'd0,
	       _theResult___snd__h119216[56:5] } +
	     54'd1 ;
  assign sfd__h128930 =
	     { 1'b0,
	       _theResult___fst_exp__h128838 != 11'd0,
	       sfdin__h128832[56:5] } +
	     54'd1 ;
  assign sfd__h13330 = { 2'd0, sfd___3__h13303[31:9] } + 25'd1 ;
  assign sfd__h137688 =
	     { 1'b0,
	       _theResult___fst_exp__h137669 != 11'd0,
	       _theResult___snd__h137615[56:5] } +
	     54'd1 ;
  assign sfd__h13869 =
	     { 1'b0, x__h13854[7:0] != 8'd0, sfd___3__h13303[30:8] } + 25'd1 ;
  assign sfd__h2222 = requestR[159] ? -requestR[159:128] : requestR[159:128] ;
  assign sfd__h27761 = { sfd__h2222, 23'd0 } ;
  assign sfd__h35789 = { 2'd0, sfd___3__h35762[54:3] } + 54'd1 ;
  assign sfd__h36532 =
	     { 1'b0, x__h36517[10:0] != 11'd0, sfd___3__h35762[53:2] } +
	     54'd1 ;
  assign sfd__h37706 = { requestR[159:128], 23'd0 } ;
  assign sfd__h45485 = { 2'd0, sfd___3__h45458[54:3] } + 54'd1 ;
  assign sfd__h46227 =
	     { 1'b0, x__h46212[10:0] != 11'd0, sfd___3__h45458[53:2] } +
	     54'd1 ;
  assign sfd__h53913 = { value__h47609, 3'd0 } ;
  assign sfd__h69742 =
	     { 1'b0,
	       _theResult___fst_exp__h69650 != 8'd0,
	       sfdin__h69644[56:34] } +
	     25'd1 ;
  assign sfd__h7153 = { 2'd0, sfd___3__h7126[31:9] } + 25'd1 ;
  assign sfd__h7696 =
	     { 1'b0, x__h7681[7:0] != 8'd0, sfd___3__h7126[30:8] } + 25'd1 ;
  assign sfd__h78354 =
	     { 1'b0,
	       _theResult___fst_exp__h78336 != 8'd0,
	       _theResult___snd__h78287[56:34] } +
	     25'd1 ;
  assign sfd__h87595 =
	     { 1'b0,
	       _theResult___fst_exp__h87503 != 8'd0,
	       sfdin__h87497[56:34] } +
	     25'd1 ;
  assign sfd__h96237 =
	     { 1'b0,
	       _theResult___fst_exp__h96218 != 8'd0,
	       _theResult___snd__h96164[56:34] } +
	     25'd1 ;
  assign sfdin__h128832 =
	     _theResult____h120602[56] ?
	       _theResult___snd__h128849 :
	       _theResult___snd__h128860 ;
  assign sfdin__h69644 =
	     _theResult____h61543[56] ?
	       _theResult___snd__h69661 :
	       _theResult___snd__h69672 ;
  assign sfdin__h87497 =
	     _theResult____h79267[56] ?
	       _theResult___snd__h87514 :
	       _theResult___snd__h87525 ;
  assign value__h15052 = { 1'b0, sV1_exp__h815 != 8'd0, sV1_sfd__h816 } ;
  assign value__h47609 =
	     { 1'b0, requestR[190:180] != 11'd0, requestR[179:128] } ;
  assign value__h49752 =
	     (requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0 &&
	      !requestR[179]) ?
	       _theResult___fst_sfd__h50209 :
	       requestR[179:128] ;
  assign value__h98456 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 &&
	      !sV1_sfd__h816[22]) ?
	       _theResult___fst_sfd__h98711 :
	       sV1_sfd__h816 ;
  assign x__h121310 = b__h15050 << x__h121343 ;
  assign x__h121343 =
	     12'd57 -
	     _3074_MINUS_SEXT_IF_requestR_BITS_191_TO_160_4__ETC___d3148 ;
  assign x__h13854 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d616 +
	     9'd127 ;
  assign x__h139191 =
	     { IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3688,
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 == 23'd0) &&
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 != 23'd0) &&
	       (sV1_exp__h815 != 8'd0 || sV1_sfd__h816 != 23'd0) &&
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3695,
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 == 23'd0) &&
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 != 23'd0) &&
	       (sV1_exp__h815 != 8'd0 || sV1_sfd__h816 != 23'd0) &&
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3709,
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 == 23'd0) &&
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 != 23'd0) &&
	       (sV1_exp__h815 != 8'd0 || sV1_sfd__h816 != 23'd0) &&
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3721,
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 == 23'd0) &&
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 != 23'd0) &&
	       (sV1_exp__h815 != 8'd0 || sV1_sfd__h816 != 23'd0) &&
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3733 } ;
  assign x__h140114 =
	     requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3754 ?
	       64'h7FF8000000000000 :
	       ((requestR[190:180] == 11'd2047 &&
		 requestR[179:128] != 52'd0 &&
		 !requestR[179]) ?
		  requestR[127:64] :
		  ((requestR[126:116] == 11'd2047 &&
		    requestR[115:64] != 52'd0 &&
		    !requestR[115]) ?
		     requestR[191:128] :
		     ((requestR[190:180] == 11'd2047 && requestR[179] &&
		       requestR[126:116] == 11'd2047 &&
		       requestR[115]) ?
			64'h7FF8000000000000 :
			((requestR[190:180] == 11'd2047 && requestR[179]) ?
			   requestR[127:64] :
			   IF_requestR_BITS_126_TO_116_745_EQ_2047_746_AN_ETC___d3793)))) ;
  assign x__h143663 =
	     { requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3799,
	       4'd0 } ;
  assign x__h144662 =
	     requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3754 ?
	       64'h7FF8000000000000 :
	       ((requestR[190:180] == 11'd2047 &&
		 requestR[179:128] != 52'd0 &&
		 !requestR[179]) ?
		  requestR[127:64] :
		  ((requestR[126:116] == 11'd2047 &&
		    requestR[115:64] != 52'd0 &&
		    !requestR[115]) ?
		     requestR[191:128] :
		     ((requestR[190:180] == 11'd2047 && requestR[179] &&
		       requestR[126:116] == 11'd2047 &&
		       requestR[115]) ?
			64'h7FF8000000000000 :
			((requestR[190:180] == 11'd2047 && requestR[179]) ?
			   requestR[127:64] :
			   ((requestR[126:116] == 11'd2047 && requestR[115]) ?
			      requestR[191:128] :
			      IF_requestR_BITS_190_TO_180_596_EQ_0_607_AND_r_ETC___d3807))))) ;
  assign x__h14520 =
	     { 2'd0,
	       NOT_requestR_BITS_159_TO_128_24_EQ_0_25_26_AND_ETC___d781,
	       requestR[159:128] != 32'd0 &&
	       (requestR[159] ||
		requestR_BIT_158_88_OR_requestR_BIT_157_90_OR__ETC___d770) &&
	       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d617 &&
	       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d618,
	       requestR[159:128] != 32'd0 &&
	       requestR_BIT_159_6_OR_requestR_BIT_158_88_OR_r_ETC___d792 } ;
  assign x__h14804 = { {32{x__h14807[31]}}, x__h14807 } ;
  assign x__h14807 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d814 ?
	       32'h7FFFFFFF :
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d886 ;
  assign x__h149106 =
	     requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3821 ?
	       64'd0 :
	       res__h150783 ;
  assign x__h151801 =
	     requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3821 ?
	       64'd0 :
	       res__h153478 ;
  assign x__h153497 =
	     { requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0 ||
	       requestR[126:116] == 11'd2047 && requestR[115:64] != 52'd0,
	       4'd0 } ;
  assign x__h153678 =
	     requestR_BITS_190_TO_180_596_EQ_2047_597_AND_N_ETC___d3821 ?
	       64'd0 :
	       res__h155355 ;
  assign x__h155805 =
	     (requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0) ?
	       res___1__h155823 :
	       ((requestR[190:180] == 11'd2047 &&
		 requestR[179:128] == 52'd0) ?
		  res___1__h156261 :
		  IF_requestR_BITS_190_TO_180_596_EQ_0_607_AND_r_ETC___d3878) ;
  assign x__h156455 =
	     fpu$response_get[69] ? res__h156487 : fpu$response_get[68:5] ;
  assign x__h15726 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d827 >>
	     NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d853 |
	     ~(57'h1FFFFFFFFFFFFFF >>
	       NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d853) &
	     {57{IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d827[56]}} ;
  assign x__h16140 =
	     { sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 ||
	       sV1_exp__h815 == 8'd255 && sV1_sfd__h816 == 23'd0 ||
	       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d897,
	       3'd0,
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 == 23'd0) &&
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 != 23'd0) &&
	       (sV1_exp__h815 != 8'd0 || sV1_sfd__h816 != 23'd0) &&
	       IF_NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0_ETC___d908 } ;
  assign x__h16397 = { {32{x__h16400[31]}}, x__h16400 } ;
  assign x__h16400 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d814 ?
	       32'hFFFFFFFF :
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d948 ;
  assign x__h16821 =
	     { sV1_exp__h815 != 8'd0, sV1_sfd__h816, 33'd0 } >>
	     NEG_SEXT_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d917 ;
  assign x__h16899 =
	     { (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		 IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d967 :
		 IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d956,
	       3'd0,
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 == 23'd0) &&
	       (sV1_exp__h815 != 8'd255 || sV1_sfd__h816 != 23'd0) &&
	       NOT_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFF_ETC___d961 } ;
  assign x__h17147 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d990 ?
	       64'hFFFFFFFF7FC00000 :
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1036 ;
  assign x__h1773 = { 32'hFFFFFFFF, x__h1779 } ;
  assign x__h1779 =
	     { requestR[127:96] == 32'hFFFFFFFF && requestR[95],
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19 } ;
  assign x__h19186 =
	     { IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1038,
	       4'd0 } ;
  assign x__h1919 = { 32'hFFFFFFFF, x__h1925 } ;
  assign x__h1925 =
	     { requestR[127:96] != 32'hFFFFFFFF || !requestR[95],
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19 } ;
  assign x__h19781 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d990 ?
	       64'hFFFFFFFF7FC00000 :
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1052 ;
  assign x__h2053 = { 32'hFFFFFFFF, x__h2059 } ;
  assign x__h2059 =
	     { (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) !=
	       (requestR[127:96] == 32'hFFFFFFFF && requestR[95]),
	       IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d19 } ;
  assign x__h2201 = { 32'hFFFFFFFF, x__h2207 } ;
  assign x__h2207 =
	     { requestR[159:128] != 32'd0 &&
	       (NOT_IF_requestR_BIT_159_6_THEN_NEG_requestR_BI_ETC___d263 ?
		  requestR[159] :
		  IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d325),
	       IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d385,
	       (requestR[159:128] == 32'd0 ||
		NOT_IF_requestR_BIT_159_6_THEN_NEG_requestR_BI_ETC___d263) ?
		 23'd0 :
		 _theResult___snd_fst_sfd__h8209 } ;
  assign x__h22306 = { 32'hFFFFFFFF, requestR[159:128] } ;
  assign x__h22427 =
	     { {32{requestR_BITS_159_TO_128__q1[31]}},
	       requestR_BITS_159_TO_128__q1 } ;
  assign x__h22565 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1075 ?
	       64'd0 :
	       res__h23434 ;
  assign x__h24048 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1075 ?
	       64'd0 :
	       res__h24917 ;
  assign x__h24936 =
	     { sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0 ||
	       sV2_exp__h918 == 8'd255 && sV2_sfd__h919 != 23'd0,
	       4'd0 } ;
  assign x__h25117 =
	     IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_5__ETC___d1075 ?
	       64'd0 :
	       res__h25986 ;
  assign x__h26203 =
	     (sV1_exp__h815 == 8'd255 && sV1_sfd__h816 != 23'd0) ?
	       res___1__h26221 :
	       IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d1123 ;
  assign x__h27370 = { requestR[127], requestR[190:128] } ;
  assign x__h27492 = { !requestR[127], requestR[190:128] } ;
  assign x__h27616 = { requestR[191] != requestR[127], requestR[190:128] } ;
  assign x__h27746 =
	     { requestR[159:128] != 32'd0 &&
	       IF_NOT_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_15_ETC___d1287,
	       (requestR[159:128] == 32'd0) ?
		 11'd0 :
		 _theResult___snd_fst_exp__h37253,
	       IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d1384 } ;
  assign x__h36517 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1230 +
	     12'd1023 ;
  assign x__h37409 =
	     { 2'd0,
	       requestR[159:128] != 32'd0 &&
	       (!_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1231 ||
		!_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1233 &&
		!_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1235 &&
		_theResult___fst_exp__h37244 == 11'd2047 &&
		_theResult___fst_sfd__h37245 == 52'd0),
	       requestR[159:128] != 32'd0 &&
	       _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1231 &&
	       _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1233,
	       requestR[159:128] != 32'd0 &&
	       _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1231 &&
	       !_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d1233 &&
	       IF_32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6__ETC___d1401 } ;
  assign x__h37694 =
	     { 1'd0,
	       (requestR[159:128] == 32'd0) ?
		 11'd0 :
		 _theResult___snd_fst_exp__h46947,
	       IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d1567 } ;
  assign x__h46212 =
	     _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1445 +
	     12'd1023 ;
  assign x__h47077 =
	     { 2'd0,
	       requestR[159:128] != 32'd0 &&
	       (!_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1446 ||
		!_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1447 &&
		!_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1448 &&
		_theResult___fst_exp__h46938 == 11'd2047 &&
		_theResult___fst_sfd__h46939 == 52'd0),
	       requestR[159:128] != 32'd0 &&
	       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1446 &&
	       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1447,
	       requestR[159:128] != 32'd0 &&
	       _32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1446 &&
	       !_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d1447 &&
	       IF_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THE_ETC___d1584 } ;
  assign x__h47361 = { {32{x__h47364[31]}}, x__h47364 } ;
  assign x__h47364 =
	     (requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0 ||
	      !requestR[191] && requestR[190:180] == 11'd2047 &&
	      requestR[179:128] == 52'd0) ?
	       32'h7FFFFFFF :
	       IF_requestR_BITS_190_TO_180_596_EQ_2047_597_AN_ETC___d1677 ;
  assign x__h48283 =
	     IF_requestR_BIT_191_186_THEN_NEG_0b0_CONCAT_NO_ETC___d1618 >>
	     NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1644 |
	     ~(86'h3FFFFFFFFFFFFFFFFFFFFF >>
	       NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1644) &
	     {86{IF_requestR_BIT_191_186_THEN_NEG_0b0_CONCAT_NO_ETC___d1618[85]}} ;
  assign x__h48680 =
	     { requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0 ||
	       requestR[190:180] == 11'd2047 && requestR[179:128] == 52'd0 ||
	       NOT_requestR_BITS_190_TO_180_596_EQ_0_607_613__ETC___d1688,
	       3'd0,
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] == 52'd0) &&
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] != 52'd0) &&
	       (requestR[190:180] != 11'd0 || requestR[179:128] != 52'd0) &&
	       IF_NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_ETC___d1699 } ;
  assign x__h48937 = { {32{x__h48940[31]}}, x__h48940 } ;
  assign x__h48940 =
	     (requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0 ||
	      !requestR[191] && requestR[190:180] == 11'd2047 &&
	      requestR[179:128] == 52'd0) ?
	       32'hFFFFFFFF :
	       (requestR[191] ?
		  32'd0 :
		  ((requestR[190:180] == 11'd2047 &&
		    requestR[179:128] == 52'd0) ?
		     32'hFFFFFFFF :
		     IF_requestR_BITS_190_TO_180_596_EQ_0_607_AND_r_ETC___d1737)) ;
  assign x__h49361 =
	     { requestR[190:180] != 11'd0, requestR[179:128], 33'd0 } >>
	     NEG_SEXT_requestR_BITS_190_TO_180_596_MINUS_10_ETC___d1708 ;
  assign x__h49439 =
	     { requestR[191] ?
		 requestR_BITS_190_TO_180_596_EQ_2047_597_AND_0_ETC___d1758 :
		 requestR_BITS_190_TO_180_596_EQ_2047_597_AND_0_ETC___d1747,
	       3'd0,
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] == 52'd0) &&
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] != 52'd0) &&
	       NOT_requestR_BITS_190_TO_180_596_EQ_0_607_613__ETC___d1752 } ;
  assign x__h49683 =
	     (x__h49692 == 8'd255 &&
	      IF_requestR_BITS_190_TO_180_596_EQ_2047_597_AN_ETC___d2798[22]) ?
	       64'hFFFFFFFF7FC00000 :
	       res__h97284 ;
  assign x__h49692 =
	     (requestR[190:180] == 11'd2047) ?
	       8'd255 :
	       _theResult___fst_exp__h96808 ;
  assign x__h7681 =
	     _32_MINUS_0_CONCAT_IF_IF_requestR_BIT_159_6_THE_ETC___d258 +
	     9'd127 ;
  assign x__h79975 = sfd__h53913 << x__h80008 ;
  assign x__h80008 =
	     12'd57 -
	     _3970_MINUS_SEXT_requestR_BITS_190_TO_180_596_M_ETC___d2314 ;
  assign x__h8374 =
	     { 2'd0,
	       requestR[159:128] != 32'd0 &&
	       IF_requestR_BIT_159_6_THEN_NEG_requestR_BITS_1_ETC___d466,
	       requestR[159:128] != 32'd0 &&
	       IF_requestR_BIT_159_6_THEN_NEG_requestR_BITS_1_ETC___d469,
	       requestR[159:128] != 32'd0 &&
	       IF_requestR_BIT_159_6_THEN_NEG_requestR_BITS_1_ETC___d478 } ;
  assign x__h8662 =
	     { 33'h1FFFFFFFE,
	       IF_requestR_BITS_159_TO_128_24_EQ_0_25_OR_NOT__ETC___d703,
	       (requestR[159:128] == 32'd0 ||
		!requestR[159] &&
		NOT_requestR_BIT_158_88_89_AND_NOT_requestR_BI_ETC___d579 ||
		!_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d617 ||
		_32_MINUS_0_CONCAT_IF_requestR_BIT_159_6_THEN_0_ETC___d618) ?
		 23'd0 :
		 _theResult___snd_fst_sfd__h14381 } ;
  assign x__h97290 =
	     { (requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0 ||
		(requestR[190:180] == 11'd2047 ||
		 requestR[190:180] == 11'd0) &&
		requestR[179:128] == 52'd0) ?
		 requestR[191] :
		 IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2840,
	       x__h49692,
	       IF_requestR_BITS_190_TO_180_596_EQ_2047_597_AN_ETC___d2798 } ;
  assign x__h97405 =
	     { (requestR[190:180] == 11'd2047 && requestR[179:128] != 52'd0) ?
		 requestR[190:180] == 11'd2047 &&
		 requestR[179:128] != 52'd0 &&
		 !requestR[179] :
		 (requestR[190:180] != 11'd2047 ||
		  requestR[179:128] != 52'd0) &&
		 (requestR[190:180] != 11'd0 || requestR[179:128] != 52'd0) &&
		 IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2891,
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] == 52'd0) &&
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] != 52'd0) &&
	       (requestR[190:180] != 11'd0 || requestR[179:128] != 52'd0) &&
	       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2902,
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] == 52'd0) &&
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] != 52'd0) &&
	       (requestR[190:180] != 11'd0 || requestR[179:128] != 52'd0) &&
	       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2918,
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] == 52'd0) &&
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] != 52'd0) &&
	       (requestR[190:180] != 11'd0 || requestR[179:128] != 52'd0) &&
	       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2931,
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] == 52'd0) &&
	       (requestR[190:180] != 11'd2047 ||
		requestR[179:128] != 52'd0) &&
	       (requestR[190:180] != 11'd0 || requestR[179:128] != 52'd0) &&
	       IF_requestR_BITS_190_TO_180_596_EQ_0_607_THEN__ETC___d2944 } ;
  assign x__h98388 =
	     (x__h98397 == 11'd2047 &&
	      IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFFFFFFFF_ETC___d3614[51]) ?
	       64'h7FF8000000000000 :
	       res__h139089 ;
  assign x__h98397 =
	     (sV1_exp__h815 == 8'd255) ?
	       11'd2047 :
	       _theResult___fst_exp__h138462 ;
  always@(requestR)
  begin
    case (requestR[194:192])
      3'h1: CASE_requestR_BITS_194_TO_192_0x1_254_0x2_IF_r_ETC__q2 = 8'd254;
      3'h2:
	  CASE_requestR_BITS_194_TO_192_0x1_254_0x2_IF_r_ETC__q2 =
	      requestR[191] ? 8'd255 : 8'd254;
      3'h3:
	  CASE_requestR_BITS_194_TO_192_0x1_254_0x2_IF_r_ETC__q2 =
	      requestR[191] ? 8'd254 : 8'd255;
      default: CASE_requestR_BITS_194_TO_192_0x1_254_0x2_IF_r_ETC__q2 = 8'd0;
    endcase
  end
  always@(requestR)
  begin
    case (requestR[194:192])
      3'h1:
	  CASE_requestR_BITS_194_TO_192_0x1_8388607_0x2__ETC__q3 =
	      23'd8388607;
      3'h2:
	  CASE_requestR_BITS_194_TO_192_0x1_8388607_0x2__ETC__q3 =
	      requestR[191] ? 23'd0 : 23'd8388607;
      3'h3:
	  CASE_requestR_BITS_194_TO_192_0x1_8388607_0x2__ETC__q3 =
	      requestR[191] ? 23'd8388607 : 23'd0;
      default: CASE_requestR_BITS_194_TO_192_0x1_8388607_0x2__ETC__q3 = 23'd0;
    endcase
  end
  always@(requestR)
  begin
    case (requestR[194:192])
      3'h1: CASE_requestR_BITS_194_TO_192_0x1_2046_0x2_IF__ETC__q4 = 11'd2046;
      3'h2:
	  CASE_requestR_BITS_194_TO_192_0x1_2046_0x2_IF__ETC__q4 =
	      (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		11'd2047 :
		11'd2046;
      3'h3:
	  CASE_requestR_BITS_194_TO_192_0x1_2046_0x2_IF__ETC__q4 =
	      (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		11'd2046 :
		11'd2047;
      default: CASE_requestR_BITS_194_TO_192_0x1_2046_0x2_IF__ETC__q4 = 11'd0;
    endcase
  end
  always@(requestR)
  begin
    case (requestR[194:192])
      3'h1:
	  CASE_requestR_BITS_194_TO_192_0x1_450359962737_ETC__q5 =
	      52'hFFFFFFFFFFFFF;
      3'h2:
	  CASE_requestR_BITS_194_TO_192_0x1_450359962737_ETC__q5 =
	      (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		52'd0 :
		52'hFFFFFFFFFFFFF;
      3'h3:
	  CASE_requestR_BITS_194_TO_192_0x1_450359962737_ETC__q5 =
	      (requestR[191:160] == 32'hFFFFFFFF && requestR[159]) ?
		52'hFFFFFFFFFFFFF :
		52'd0;
      default: CASE_requestR_BITS_194_TO_192_0x1_450359962737_ETC__q5 = 52'd0;
    endcase
  end
  always@(requestR)
  begin
    case (requestR[194:192])
      3'h0:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40 =
	      requestR[194:192];
      3'h1: IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40 = 3'd4;
      3'h2: IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40 = 3'd3;
      3'h3: IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40 = 3'd2;
      3'h4: IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40 = 3'd1;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x0_1_THEN_re_ETC___d40 =
		   3'd0;
    endcase
  end
  always@(guard__h7136 or requestR)
  begin
    case (guard__h7136)
      2'b0, 2'b01, 2'b10:
	  CASE_guard136_0b0_requestR_BIT_159_0b1_request_ETC__q8 =
	      requestR[159];
      2'd3:
	  CASE_guard136_0b0_requestR_BIT_159_0b1_request_ETC__q8 =
	      guard__h7136 == 2'b11 && requestR[159];
    endcase
  end
  always@(requestR or guard__h7136)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q9 =
	      requestR[159];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q9 =
	      (guard__h7136 == 2'b0) ?
		requestR[159] :
		(guard__h7136 == 2'b01 || guard__h7136 == 2'b10 ||
		 guard__h7136 == 2'b11) &&
		requestR[159];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q9 =
		   requestR[194:192] == 3'h1 && requestR[159];
    endcase
  end
  always@(guard__h7666 or requestR)
  begin
    case (guard__h7666)
      2'b0, 2'b01, 2'b10:
	  CASE_guard666_0b0_requestR_BIT_159_0b1_request_ETC__q10 =
	      requestR[159];
      2'd3:
	  CASE_guard666_0b0_requestR_BIT_159_0b1_request_ETC__q10 =
	      guard__h7666 == 2'b11 && requestR[159];
    endcase
  end
  always@(requestR or guard__h7666)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q11 =
	      requestR[159];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q11 =
	      (guard__h7666 == 2'b0) ?
		requestR[159] :
		(guard__h7666 == 2'b01 || guard__h7666 == 2'b10 ||
		 guard__h7666 == 2'b11) &&
		requestR[159];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q11 =
		   requestR[194:192] == 3'h1 && requestR[159];
    endcase
  end
  always@(guard__h7136 or _theResult___exp__h7552)
  begin
    case (guard__h7136)
      2'b0: CASE_guard136_0b0_0_0b1_theResult___exp552_0b1_ETC__q12 = 8'd0;
      2'b01, 2'b10, 2'b11:
	  CASE_guard136_0b0_0_0b1_theResult___exp552_0b1_ETC__q12 =
	      _theResult___exp__h7552;
    endcase
  end
  always@(requestR or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d347 or
	  guard__h7136 or
	  _theResult___exp__h7552 or
	  CASE_guard136_0b0_0_0b1_theResult___exp552_0b1_ETC__q12)
  begin
    case (requestR[194:192])
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d350 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d347;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d350 =
	      (guard__h7136 == 2'b0 || requestR[159]) ?
		8'd0 :
		_theResult___exp__h7552;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d350 =
	      CASE_guard136_0b0_0_0b1_theResult___exp552_0b1_ETC__q12;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d350 =
		   8'd0;
    endcase
  end
  always@(guard__h7136 or out_exp__h7555 or _theResult___exp__h7552)
  begin
    case (guard__h7136)
      2'b0, 2'b01:
	  CASE_guard136_0b0_0_0b1_0_0b10_out_exp555_0b11_ETC__q13 = 8'd0;
      2'b10:
	  CASE_guard136_0b0_0_0b1_0_0b10_out_exp555_0b11_ETC__q13 =
	      out_exp__h7555;
      2'b11:
	  CASE_guard136_0b0_0_0b1_0_0b10_out_exp555_0b11_ETC__q13 =
	      _theResult___exp__h7552;
    endcase
  end
  always@(guard__h7666 or x__h7681 or _theResult___exp__h8105)
  begin
    case (guard__h7666)
      2'b0:
	  CASE_guard666_0b0_x681_BITS_7_TO_0_0b1_theResu_ETC__q14 =
	      x__h7681[7:0];
      2'b01, 2'b10, 2'b11:
	  CASE_guard666_0b0_x681_BITS_7_TO_0_0b1_theResu_ETC__q14 =
	      _theResult___exp__h8105;
    endcase
  end
  always@(requestR or
	  x__h7681 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d375 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d373 or
	  CASE_guard666_0b0_x681_BITS_7_TO_0_0b1_theResu_ETC__q14)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d379 =
	      x__h7681[7:0];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d379 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d375;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d379 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d373;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d379 =
	      CASE_guard666_0b0_x681_BITS_7_TO_0_0b1_theResu_ETC__q14;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d379 =
		   8'd0;
    endcase
  end
  always@(guard__h7666 or
	  x__h7681 or out_exp__h8108 or _theResult___exp__h8105)
  begin
    case (guard__h7666)
      2'b0, 2'b01:
	  CASE_guard666_0b0_x681_BITS_7_TO_0_0b1_x681_BI_ETC__q15 =
	      x__h7681[7:0];
      2'b10:
	  CASE_guard666_0b0_x681_BITS_7_TO_0_0b1_x681_BI_ETC__q15 =
	      out_exp__h8108;
      2'b11:
	  CASE_guard666_0b0_x681_BITS_7_TO_0_0b1_x681_BI_ETC__q15 =
	      _theResult___exp__h8105;
    endcase
  end
  always@(guard__h7136 or sfd___3__h7126 or _theResult___sfd__h7553)
  begin
    case (guard__h7136)
      2'b0:
	  CASE_guard136_0b0_sfd___3126_BITS_31_TO_9_0b1__ETC__q16 =
	      sfd___3__h7126[31:9];
      2'b01, 2'b10, 2'b11:
	  CASE_guard136_0b0_sfd___3126_BITS_31_TO_9_0b1__ETC__q16 =
	      _theResult___sfd__h7553;
    endcase
  end
  always@(requestR or
	  sfd___3__h7126 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d398 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d396 or
	  CASE_guard136_0b0_sfd___3126_BITS_31_TO_9_0b1__ETC__q16)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d402 =
	      sfd___3__h7126[31:9];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d402 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d398;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d402 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d396;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d402 =
	      CASE_guard136_0b0_sfd___3126_BITS_31_TO_9_0b1__ETC__q16;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d402 =
		   23'd0;
    endcase
  end
  always@(guard__h7136 or
	  sfd___3__h7126 or out_sfd__h7556 or _theResult___sfd__h7553)
  begin
    case (guard__h7136)
      2'b0, 2'b01:
	  CASE_guard136_0b0_sfd___3126_BITS_31_TO_9_0b1__ETC__q17 =
	      sfd___3__h7126[31:9];
      2'b10:
	  CASE_guard136_0b0_sfd___3126_BITS_31_TO_9_0b1__ETC__q17 =
	      out_sfd__h7556;
      2'b11:
	  CASE_guard136_0b0_sfd___3126_BITS_31_TO_9_0b1__ETC__q17 =
	      _theResult___sfd__h7553;
    endcase
  end
  always@(guard__h7666 or sfd___3__h7126 or _theResult___sfd__h8106)
  begin
    case (guard__h7666)
      2'b0:
	  CASE_guard666_0b0_sfd___3126_BITS_30_TO_8_0b1__ETC__q18 =
	      sfd___3__h7126[30:8];
      2'b01, 2'b10, 2'b11:
	  CASE_guard666_0b0_sfd___3126_BITS_30_TO_8_0b1__ETC__q18 =
	      _theResult___sfd__h8106;
    endcase
  end
  always@(requestR or
	  sfd___3__h7126 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d416 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d414 or
	  CASE_guard666_0b0_sfd___3126_BITS_30_TO_8_0b1__ETC__q18)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d420 =
	      sfd___3__h7126[30:8];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d420 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d416;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d420 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d414;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d420 =
	      CASE_guard666_0b0_sfd___3126_BITS_30_TO_8_0b1__ETC__q18;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d420 =
		   23'd0;
    endcase
  end
  always@(guard__h7666 or
	  sfd___3__h7126 or out_sfd__h8109 or _theResult___sfd__h8106)
  begin
    case (guard__h7666)
      2'b0, 2'b01:
	  CASE_guard666_0b0_sfd___3126_BITS_30_TO_8_0b1__ETC__q19 =
	      sfd___3__h7126[30:8];
      2'b10:
	  CASE_guard666_0b0_sfd___3126_BITS_30_TO_8_0b1__ETC__q19 =
	      out_sfd__h8109;
      2'b11:
	  CASE_guard666_0b0_sfd___3126_BITS_30_TO_8_0b1__ETC__q19 =
	      _theResult___sfd__h8106;
    endcase
  end
  always@(guard__h13313 or out_exp__h13729 or _theResult___exp__h13726)
  begin
    case (guard__h13313)
      2'b0, 2'b01:
	  CASE_guard3313_0b0_0_0b1_0_0b10_out_exp3729_0b_ETC__q22 = 8'd0;
      2'b10:
	  CASE_guard3313_0b0_0_0b1_0_0b10_out_exp3729_0b_ETC__q22 =
	      out_exp__h13729;
      2'b11:
	  CASE_guard3313_0b0_0_0b1_0_0b10_out_exp3729_0b_ETC__q22 =
	      _theResult___exp__h13726;
    endcase
  end
  always@(guard__h13313 or _theResult___exp__h13726)
  begin
    case (guard__h13313)
      2'b0: CASE_guard3313_0b0_0_0b1_theResult___exp3726_0_ETC__q23 = 8'd0;
      2'b01, 2'b10, 2'b11:
	  CASE_guard3313_0b0_0_0b1_theResult___exp3726_0_ETC__q23 =
	      _theResult___exp__h13726;
    endcase
  end
  always@(requestR or
	  guard__h13313 or
	  _theResult___exp__h13726 or
	  CASE_guard3313_0b0_0_0b1_theResult___exp3726_0_ETC__q23)
  begin
    case (requestR[194:192])
      3'h3:
	  CASE_requestR_BITS_194_TO_192_0x3_IF_guard3313_ETC__q24 =
	      (guard__h13313 == 2'b0) ? 8'd0 : _theResult___exp__h13726;
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x3_IF_guard3313_ETC__q24 =
	      CASE_guard3313_0b0_0_0b1_theResult___exp3726_0_ETC__q23;
      default: CASE_requestR_BITS_194_TO_192_0x3_IF_guard3313_ETC__q24 = 8'd0;
    endcase
  end
  always@(guard__h13839 or x__h13854 or _theResult___exp__h14278)
  begin
    case (guard__h13839)
      2'b0:
	  CASE_guard3839_0b0_x3854_BITS_7_TO_0_0b1_theRe_ETC__q25 =
	      x__h13854[7:0];
      2'b01, 2'b10, 2'b11:
	  CASE_guard3839_0b0_x3854_BITS_7_TO_0_0b1_theRe_ETC__q25 =
	      _theResult___exp__h14278;
    endcase
  end
  always@(requestR or
	  x__h13854 or
	  guard__h13839 or
	  _theResult___exp__h14278 or
	  CASE_guard3839_0b0_x3854_BITS_7_TO_0_0b1_theRe_ETC__q25)
  begin
    case (requestR[194:192])
      3'h1, 3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d697 =
	      x__h13854[7:0];
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d697 =
	      (guard__h13839 == 2'b0) ?
		x__h13854[7:0] :
		_theResult___exp__h14278;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d697 =
	      CASE_guard3839_0b0_x3854_BITS_7_TO_0_0b1_theRe_ETC__q25;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d697 =
		   8'd0;
    endcase
  end
  always@(guard__h13839 or
	  x__h13854 or out_exp__h14281 or _theResult___exp__h14278)
  begin
    case (guard__h13839)
      2'b0, 2'b01:
	  CASE_guard3839_0b0_x3854_BITS_7_TO_0_0b1_x3854_ETC__q26 =
	      x__h13854[7:0];
      2'b10:
	  CASE_guard3839_0b0_x3854_BITS_7_TO_0_0b1_x3854_ETC__q26 =
	      out_exp__h14281;
      2'b11:
	  CASE_guard3839_0b0_x3854_BITS_7_TO_0_0b1_x3854_ETC__q26 =
	      _theResult___exp__h14278;
    endcase
  end
  always@(guard__h13839 or sfd___3__h13303 or _theResult___sfd__h14279)
  begin
    case (guard__h13839)
      2'b0:
	  CASE_guard3839_0b0_sfd___33303_BITS_30_TO_8_0b_ETC__q27 =
	      sfd___3__h13303[30:8];
      2'b01, 2'b10, 2'b11:
	  CASE_guard3839_0b0_sfd___33303_BITS_30_TO_8_0b_ETC__q27 =
	      _theResult___sfd__h14279;
    endcase
  end
  always@(requestR or
	  sfd___3__h13303 or
	  guard__h13839 or
	  _theResult___sfd__h14279 or
	  CASE_guard3839_0b0_sfd___33303_BITS_30_TO_8_0b_ETC__q27)
  begin
    case (requestR[194:192])
      3'h1, 3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d735 =
	      sfd___3__h13303[30:8];
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d735 =
	      (guard__h13839 == 2'b0) ?
		sfd___3__h13303[30:8] :
		_theResult___sfd__h14279;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d735 =
	      CASE_guard3839_0b0_sfd___33303_BITS_30_TO_8_0b_ETC__q27;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d735 =
		   23'd0;
    endcase
  end
  always@(guard__h13839 or
	  sfd___3__h13303 or out_sfd__h14282 or _theResult___sfd__h14279)
  begin
    case (guard__h13839)
      2'b0, 2'b01:
	  CASE_guard3839_0b0_sfd___33303_BITS_30_TO_8_0b_ETC__q28 =
	      sfd___3__h13303[30:8];
      2'b10:
	  CASE_guard3839_0b0_sfd___33303_BITS_30_TO_8_0b_ETC__q28 =
	      out_sfd__h14282;
      2'b11:
	  CASE_guard3839_0b0_sfd___33303_BITS_30_TO_8_0b_ETC__q28 =
	      _theResult___sfd__h14279;
    endcase
  end
  always@(guard__h13313 or sfd___3__h13303 or _theResult___sfd__h13727)
  begin
    case (guard__h13313)
      2'b0:
	  CASE_guard3313_0b0_sfd___33303_BITS_31_TO_9_0b_ETC__q29 =
	      sfd___3__h13303[31:9];
      2'b01, 2'b10, 2'b11:
	  CASE_guard3313_0b0_sfd___33303_BITS_31_TO_9_0b_ETC__q29 =
	      _theResult___sfd__h13727;
    endcase
  end
  always@(requestR or
	  sfd___3__h13303 or
	  guard__h13313 or
	  _theResult___sfd__h13727 or
	  CASE_guard3313_0b0_sfd___33303_BITS_31_TO_9_0b_ETC__q29)
  begin
    case (requestR[194:192])
      3'h1, 3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d720 =
	      sfd___3__h13303[31:9];
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d720 =
	      (guard__h13313 == 2'b0) ?
		sfd___3__h13303[31:9] :
		_theResult___sfd__h13727;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d720 =
	      CASE_guard3313_0b0_sfd___33303_BITS_31_TO_9_0b_ETC__q29;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d720 =
		   23'd0;
    endcase
  end
  always@(guard__h13313 or
	  sfd___3__h13303 or out_sfd__h13730 or _theResult___sfd__h13727)
  begin
    case (guard__h13313)
      2'b0, 2'b01:
	  CASE_guard3313_0b0_sfd___33303_BITS_31_TO_9_0b_ETC__q30 =
	      sfd___3__h13303[31:9];
      2'b10:
	  CASE_guard3313_0b0_sfd___33303_BITS_31_TO_9_0b_ETC__q30 =
	      out_sfd__h13730;
      2'b11:
	  CASE_guard3313_0b0_sfd___33303_BITS_31_TO_9_0b_ETC__q30 =
	      _theResult___sfd__h13727;
    endcase
  end
  always@(guard__h35772 or requestR)
  begin
    case (guard__h35772)
      2'b0, 2'b01, 2'b10:
	  CASE_guard5772_0b0_requestR_BIT_159_0b1_reques_ETC__q35 =
	      requestR[159];
      2'd3:
	  CASE_guard5772_0b0_requestR_BIT_159_0b1_reques_ETC__q35 =
	      guard__h35772 == 2'b11 && requestR[159];
    endcase
  end
  always@(requestR or guard__h35772)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q36 =
	      requestR[159];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q36 =
	      (guard__h35772 == 2'b0) ?
		requestR[159] :
		(guard__h35772 == 2'b01 || guard__h35772 == 2'b10 ||
		 guard__h35772 == 2'b11) &&
		requestR[159];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q36 =
		   requestR[194:192] == 3'h1 && requestR[159];
    endcase
  end
  always@(guard__h36502 or requestR)
  begin
    case (guard__h36502)
      2'b0, 2'b01, 2'b10:
	  CASE_guard6502_0b0_requestR_BIT_159_0b1_reques_ETC__q37 =
	      requestR[159];
      2'd3:
	  CASE_guard6502_0b0_requestR_BIT_159_0b1_reques_ETC__q37 =
	      guard__h36502 == 2'b11 && requestR[159];
    endcase
  end
  always@(requestR or guard__h36502)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q38 =
	      requestR[159];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q38 =
	      (guard__h36502 == 2'b0) ?
		requestR[159] :
		(guard__h36502 == 2'b01 || guard__h36502 == 2'b10 ||
		 guard__h36502 == 2'b11) &&
		requestR[159];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q38 =
		   requestR[194:192] == 3'h1 && requestR[159];
    endcase
  end
  always@(guard__h36502 or x__h36517 or _theResult___exp__h37144)
  begin
    case (guard__h36502)
      2'b0:
	  CASE_guard6502_0b0_x6517_BITS_10_TO_0_0b1_theR_ETC__q39 =
	      x__h36517[10:0];
      2'b01, 2'b10, 2'b11:
	  CASE_guard6502_0b0_x6517_BITS_10_TO_0_0b1_theR_ETC__q39 =
	      _theResult___exp__h37144;
    endcase
  end
  always@(requestR or
	  x__h36517 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1335 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1333 or
	  CASE_guard6502_0b0_x6517_BITS_10_TO_0_0b1_theR_ETC__q39)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1339 =
	      x__h36517[10:0];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1339 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1335;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1339 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1333;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1339 =
	      CASE_guard6502_0b0_x6517_BITS_10_TO_0_0b1_theR_ETC__q39;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1339 =
		   11'd0;
    endcase
  end
  always@(guard__h36502 or
	  x__h36517 or out_exp__h37147 or _theResult___exp__h37144)
  begin
    case (guard__h36502)
      2'b0, 2'b01:
	  CASE_guard6502_0b0_x6517_BITS_10_TO_0_0b1_x651_ETC__q40 =
	      x__h36517[10:0];
      2'b10:
	  CASE_guard6502_0b0_x6517_BITS_10_TO_0_0b1_x651_ETC__q40 =
	      out_exp__h37147;
      2'b11:
	  CASE_guard6502_0b0_x6517_BITS_10_TO_0_0b1_x651_ETC__q40 =
	      _theResult___exp__h37144;
    endcase
  end
  always@(guard__h36502 or sfd___3__h35762 or _theResult___sfd__h37145)
  begin
    case (guard__h36502)
      2'b0:
	  CASE_guard6502_0b0_sfd___35762_BITS_53_TO_2_0b_ETC__q41 =
	      sfd___3__h35762[53:2];
      2'b01, 2'b10, 2'b11:
	  CASE_guard6502_0b0_sfd___35762_BITS_53_TO_2_0b_ETC__q41 =
	      _theResult___sfd__h37145;
    endcase
  end
  always@(requestR or
	  sfd___3__h35762 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1376 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1374 or
	  CASE_guard6502_0b0_sfd___35762_BITS_53_TO_2_0b_ETC__q41)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1380 =
	      sfd___3__h35762[53:2];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1380 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1376;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1380 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1374;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1380 =
	      CASE_guard6502_0b0_sfd___35762_BITS_53_TO_2_0b_ETC__q41;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1380 =
		   52'd0;
    endcase
  end
  always@(guard__h36502 or
	  sfd___3__h35762 or out_sfd__h37148 or _theResult___sfd__h37145)
  begin
    case (guard__h36502)
      2'b0, 2'b01:
	  CASE_guard6502_0b0_sfd___35762_BITS_53_TO_2_0b_ETC__q42 =
	      sfd___3__h35762[53:2];
      2'b10:
	  CASE_guard6502_0b0_sfd___35762_BITS_53_TO_2_0b_ETC__q42 =
	      out_sfd__h37148;
      2'b11:
	  CASE_guard6502_0b0_sfd___35762_BITS_53_TO_2_0b_ETC__q42 =
	      _theResult___sfd__h37145;
    endcase
  end
  always@(guard__h35772 or _theResult___exp__h36388)
  begin
    case (guard__h35772)
      2'b0: CASE_guard5772_0b0_0_0b1_theResult___exp6388_0_ETC__q43 = 11'd0;
      2'b01, 2'b10, 2'b11:
	  CASE_guard5772_0b0_0_0b1_theResult___exp6388_0_ETC__q43 =
	      _theResult___exp__h36388;
    endcase
  end
  always@(requestR or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1307 or
	  guard__h35772 or
	  _theResult___exp__h36388 or
	  CASE_guard5772_0b0_0_0b1_theResult___exp6388_0_ETC__q43)
  begin
    case (requestR[194:192])
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1310 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1307;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1310 =
	      (guard__h35772 == 2'b0 || requestR[159]) ?
		11'd0 :
		_theResult___exp__h36388;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1310 =
	      CASE_guard5772_0b0_0_0b1_theResult___exp6388_0_ETC__q43;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1310 =
		   11'd0;
    endcase
  end
  always@(guard__h35772 or out_exp__h36391 or _theResult___exp__h36388)
  begin
    case (guard__h35772)
      2'b0, 2'b01:
	  CASE_guard5772_0b0_0_0b1_0_0b10_out_exp6391_0b_ETC__q44 = 11'd0;
      2'b10:
	  CASE_guard5772_0b0_0_0b1_0_0b10_out_exp6391_0b_ETC__q44 =
	      out_exp__h36391;
      2'b11:
	  CASE_guard5772_0b0_0_0b1_0_0b10_out_exp6391_0b_ETC__q44 =
	      _theResult___exp__h36388;
    endcase
  end
  always@(guard__h35772 or sfd___3__h35762 or _theResult___sfd__h36389)
  begin
    case (guard__h35772)
      2'b0:
	  CASE_guard5772_0b0_sfd___35762_BITS_54_TO_3_0b_ETC__q45 =
	      sfd___3__h35762[54:3];
      2'b01, 2'b10, 2'b11:
	  CASE_guard5772_0b0_sfd___35762_BITS_54_TO_3_0b_ETC__q45 =
	      _theResult___sfd__h36389;
    endcase
  end
  always@(requestR or
	  sfd___3__h35762 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1358 or
	  IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1356 or
	  CASE_guard5772_0b0_sfd___35762_BITS_54_TO_3_0b_ETC__q45)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1362 =
	      sfd___3__h35762[54:3];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1362 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1358;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1362 =
	      IF_IF_IF_requestR_BIT_159_6_THEN_NEG_requestR__ETC___d1356;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1362 =
	      CASE_guard5772_0b0_sfd___35762_BITS_54_TO_3_0b_ETC__q45;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1362 =
		   52'd0;
    endcase
  end
  always@(guard__h35772 or
	  sfd___3__h35762 or out_sfd__h36392 or _theResult___sfd__h36389)
  begin
    case (guard__h35772)
      2'b0, 2'b01:
	  CASE_guard5772_0b0_sfd___35762_BITS_54_TO_3_0b_ETC__q46 =
	      sfd___3__h35762[54:3];
      2'b10:
	  CASE_guard5772_0b0_sfd___35762_BITS_54_TO_3_0b_ETC__q46 =
	      out_sfd__h36392;
      2'b11:
	  CASE_guard5772_0b0_sfd___35762_BITS_54_TO_3_0b_ETC__q46 =
	      _theResult___sfd__h36389;
    endcase
  end
  always@(guard__h45468 or out_exp__h46087 or _theResult___exp__h46084)
  begin
    case (guard__h45468)
      2'b0, 2'b01:
	  CASE_guard5468_0b0_0_0b1_0_0b10_out_exp6087_0b_ETC__q49 = 11'd0;
      2'b10:
	  CASE_guard5468_0b0_0_0b1_0_0b10_out_exp6087_0b_ETC__q49 =
	      out_exp__h46087;
      2'b11:
	  CASE_guard5468_0b0_0_0b1_0_0b10_out_exp6087_0b_ETC__q49 =
	      _theResult___exp__h46084;
    endcase
  end
  always@(guard__h45468 or _theResult___exp__h46084)
  begin
    case (guard__h45468)
      2'b0: CASE_guard5468_0b0_0_0b1_theResult___exp6084_0_ETC__q50 = 11'd0;
      2'b01, 2'b10, 2'b11:
	  CASE_guard5468_0b0_0_0b1_theResult___exp6084_0_ETC__q50 =
	      _theResult___exp__h46084;
    endcase
  end
  always@(requestR or
	  guard__h45468 or
	  _theResult___exp__h46084 or
	  CASE_guard5468_0b0_0_0b1_theResult___exp6084_0_ETC__q50)
  begin
    case (requestR[194:192])
      3'h3:
	  CASE_requestR_BITS_194_TO_192_0x3_IF_guard5468_ETC__q51 =
	      (guard__h45468 == 2'b0) ? 11'd0 : _theResult___exp__h46084;
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x3_IF_guard5468_ETC__q51 =
	      CASE_guard5468_0b0_0_0b1_theResult___exp6084_0_ETC__q50;
      default: CASE_requestR_BITS_194_TO_192_0x3_IF_guard5468_ETC__q51 =
		   11'd0;
    endcase
  end
  always@(guard__h46197 or x__h46212 or _theResult___exp__h46839)
  begin
    case (guard__h46197)
      2'b0:
	  CASE_guard6197_0b0_x6212_BITS_10_TO_0_0b1_theR_ETC__q52 =
	      x__h46212[10:0];
      2'b01, 2'b10, 2'b11:
	  CASE_guard6197_0b0_x6212_BITS_10_TO_0_0b1_theR_ETC__q52 =
	      _theResult___exp__h46839;
    endcase
  end
  always@(requestR or
	  x__h46212 or
	  guard__h46197 or
	  _theResult___exp__h46839 or
	  CASE_guard6197_0b0_x6212_BITS_10_TO_0_0b1_theR_ETC__q52)
  begin
    case (requestR[194:192])
      3'h1, 3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1526 =
	      x__h46212[10:0];
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1526 =
	      (guard__h46197 == 2'b0) ?
		x__h46212[10:0] :
		_theResult___exp__h46839;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1526 =
	      CASE_guard6197_0b0_x6212_BITS_10_TO_0_0b1_theR_ETC__q52;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1526 =
		   11'd0;
    endcase
  end
  always@(guard__h46197 or
	  x__h46212 or out_exp__h46842 or _theResult___exp__h46839)
  begin
    case (guard__h46197)
      2'b0, 2'b01:
	  CASE_guard6197_0b0_x6212_BITS_10_TO_0_0b1_x621_ETC__q53 =
	      x__h46212[10:0];
      2'b10:
	  CASE_guard6197_0b0_x6212_BITS_10_TO_0_0b1_x621_ETC__q53 =
	      out_exp__h46842;
      2'b11:
	  CASE_guard6197_0b0_x6212_BITS_10_TO_0_0b1_x621_ETC__q53 =
	      _theResult___exp__h46839;
    endcase
  end
  always@(guard__h46197 or sfd___3__h45458 or _theResult___sfd__h46840)
  begin
    case (guard__h46197)
      2'b0:
	  CASE_guard6197_0b0_sfd___35458_BITS_53_TO_2_0b_ETC__q54 =
	      sfd___3__h45458[53:2];
      2'b01, 2'b10, 2'b11:
	  CASE_guard6197_0b0_sfd___35458_BITS_53_TO_2_0b_ETC__q54 =
	      _theResult___sfd__h46840;
    endcase
  end
  always@(requestR or
	  sfd___3__h45458 or
	  guard__h46197 or
	  _theResult___sfd__h46840 or
	  CASE_guard6197_0b0_sfd___35458_BITS_53_TO_2_0b_ETC__q54)
  begin
    case (requestR[194:192])
      3'h1, 3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1563 =
	      sfd___3__h45458[53:2];
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1563 =
	      (guard__h46197 == 2'b0) ?
		sfd___3__h45458[53:2] :
		_theResult___sfd__h46840;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1563 =
	      CASE_guard6197_0b0_sfd___35458_BITS_53_TO_2_0b_ETC__q54;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1563 =
		   52'd0;
    endcase
  end
  always@(guard__h46197 or
	  sfd___3__h45458 or out_sfd__h46843 or _theResult___sfd__h46840)
  begin
    case (guard__h46197)
      2'b0, 2'b01:
	  CASE_guard6197_0b0_sfd___35458_BITS_53_TO_2_0b_ETC__q55 =
	      sfd___3__h45458[53:2];
      2'b10:
	  CASE_guard6197_0b0_sfd___35458_BITS_53_TO_2_0b_ETC__q55 =
	      out_sfd__h46843;
      2'b11:
	  CASE_guard6197_0b0_sfd___35458_BITS_53_TO_2_0b_ETC__q55 =
	      _theResult___sfd__h46840;
    endcase
  end
  always@(guard__h45468 or sfd___3__h45458 or _theResult___sfd__h46085)
  begin
    case (guard__h45468)
      2'b0:
	  CASE_guard5468_0b0_sfd___35458_BITS_54_TO_3_0b_ETC__q56 =
	      sfd___3__h45458[54:3];
      2'b01, 2'b10, 2'b11:
	  CASE_guard5468_0b0_sfd___35458_BITS_54_TO_3_0b_ETC__q56 =
	      _theResult___sfd__h46085;
    endcase
  end
  always@(requestR or
	  sfd___3__h45458 or
	  guard__h45468 or
	  _theResult___sfd__h46085 or
	  CASE_guard5468_0b0_sfd___35458_BITS_54_TO_3_0b_ETC__q56)
  begin
    case (requestR[194:192])
      3'h1, 3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1548 =
	      sfd___3__h45458[54:3];
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1548 =
	      (guard__h45468 == 2'b0) ?
		sfd___3__h45458[54:3] :
		_theResult___sfd__h46085;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1548 =
	      CASE_guard5468_0b0_sfd___35458_BITS_54_TO_3_0b_ETC__q56;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d1548 =
		   52'd0;
    endcase
  end
  always@(guard__h45468 or
	  sfd___3__h45458 or out_sfd__h46088 or _theResult___sfd__h46085)
  begin
    case (guard__h45468)
      2'b0, 2'b01:
	  CASE_guard5468_0b0_sfd___35458_BITS_54_TO_3_0b_ETC__q57 =
	      sfd___3__h45458[54:3];
      2'b10:
	  CASE_guard5468_0b0_sfd___35458_BITS_54_TO_3_0b_ETC__q57 =
	      out_sfd__h46088;
      2'b11:
	  CASE_guard5468_0b0_sfd___35458_BITS_54_TO_3_0b_ETC__q57 =
	      _theResult___sfd__h46085;
    endcase
  end
  always@(guard__h61553 or
	  _theResult___fst_exp__h69650 or _theResult___exp__h70176)
  begin
    case (guard__h61553)
      2'b0:
	  CASE_guard1553_0b0_theResult___fst_exp9650_0b1_ETC__q70 =
	      _theResult___fst_exp__h69650;
      2'b01, 2'b10, 2'b11:
	  CASE_guard1553_0b0_theResult___fst_exp9650_0b1_ETC__q70 =
	      _theResult___exp__h70176;
    endcase
  end
  always@(requestR or
	  _theResult___fst_exp__h69650 or
	  IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2135 or
	  IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2133 or
	  CASE_guard1553_0b0_theResult___fst_exp9650_0b1_ETC__q70)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2139 =
	      _theResult___fst_exp__h69650;
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2139 =
	      IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2135;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2139 =
	      IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2133;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2139 =
	      CASE_guard1553_0b0_theResult___fst_exp9650_0b1_ETC__q70;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2139 =
		   8'd0;
    endcase
  end
  always@(guard__h61553 or
	  _theResult___fst_exp__h69650 or
	  out_exp__h70179 or _theResult___exp__h70176)
  begin
    case (guard__h61553)
      2'b0, 2'b01:
	  CASE_guard1553_0b0_theResult___fst_exp9650_0b1_ETC__q71 =
	      _theResult___fst_exp__h69650;
      2'b10:
	  CASE_guard1553_0b0_theResult___fst_exp9650_0b1_ETC__q71 =
	      out_exp__h70179;
      2'b11:
	  CASE_guard1553_0b0_theResult___fst_exp9650_0b1_ETC__q71 =
	      _theResult___exp__h70176;
    endcase
  end
  always@(guard__h70288 or
	  _theResult___fst_exp__h78336 or _theResult___exp__h78788)
  begin
    case (guard__h70288)
      2'b0:
	  CASE_guard0288_0b0_theResult___fst_exp8336_0b1_ETC__q72 =
	      _theResult___fst_exp__h78336;
      2'b01, 2'b10, 2'b11:
	  CASE_guard0288_0b0_theResult___fst_exp8336_0b1_ETC__q72 =
	      _theResult___exp__h78788;
    endcase
  end
  always@(requestR or
	  _theResult___fst_exp__h78336 or
	  IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2292 or
	  IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2290 or
	  CASE_guard0288_0b0_theResult___fst_exp8336_0b1_ETC__q72)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2296 =
	      _theResult___fst_exp__h78336;
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2296 =
	      IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2292;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2296 =
	      IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2290;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2296 =
	      CASE_guard0288_0b0_theResult___fst_exp8336_0b1_ETC__q72;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2296 =
		   8'd0;
    endcase
  end
  always@(guard__h70288 or
	  _theResult___fst_exp__h78336 or
	  out_exp__h78791 or _theResult___exp__h78788)
  begin
    case (guard__h70288)
      2'b0, 2'b01:
	  CASE_guard0288_0b0_theResult___fst_exp8336_0b1_ETC__q73 =
	      _theResult___fst_exp__h78336;
      2'b10:
	  CASE_guard0288_0b0_theResult___fst_exp8336_0b1_ETC__q73 =
	      out_exp__h78791;
      2'b11:
	  CASE_guard0288_0b0_theResult___fst_exp8336_0b1_ETC__q73 =
	      _theResult___exp__h78788;
    endcase
  end
  always@(guard__h79277 or
	  _theResult___fst_exp__h87503 or _theResult___exp__h88029)
  begin
    case (guard__h79277)
      2'b0:
	  CASE_guard9277_0b0_theResult___fst_exp7503_0b1_ETC__q74 =
	      _theResult___fst_exp__h87503;
      2'b01, 2'b10, 2'b11:
	  CASE_guard9277_0b0_theResult___fst_exp7503_0b1_ETC__q74 =
	      _theResult___exp__h88029;
    endcase
  end
  always@(requestR or
	  _theResult___fst_exp__h87503 or
	  IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2619 or
	  IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2617 or
	  CASE_guard9277_0b0_theResult___fst_exp7503_0b1_ETC__q74)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2623 =
	      _theResult___fst_exp__h87503;
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2623 =
	      IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2619;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2623 =
	      IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2617;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2623 =
	      CASE_guard9277_0b0_theResult___fst_exp7503_0b1_ETC__q74;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2623 =
		   8'd0;
    endcase
  end
  always@(guard__h79277 or
	  _theResult___fst_exp__h87503 or
	  out_exp__h88032 or _theResult___exp__h88029)
  begin
    case (guard__h79277)
      2'b0, 2'b01:
	  CASE_guard9277_0b0_theResult___fst_exp7503_0b1_ETC__q75 =
	      _theResult___fst_exp__h87503;
      2'b10:
	  CASE_guard9277_0b0_theResult___fst_exp7503_0b1_ETC__q75 =
	      out_exp__h88032;
      2'b11:
	  CASE_guard9277_0b0_theResult___fst_exp7503_0b1_ETC__q75 =
	      _theResult___exp__h88029;
    endcase
  end
  always@(guard__h88141 or
	  _theResult___fst_exp__h96218 or _theResult___exp__h96695)
  begin
    case (guard__h88141)
      2'b0:
	  CASE_guard8141_0b0_theResult___fst_exp6218_0b1_ETC__q76 =
	      _theResult___fst_exp__h96218;
      2'b01, 2'b10, 2'b11:
	  CASE_guard8141_0b0_theResult___fst_exp6218_0b1_ETC__q76 =
	      _theResult___exp__h96695;
    endcase
  end
  always@(requestR or
	  _theResult___fst_exp__h96218 or
	  IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2688 or
	  IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2686 or
	  CASE_guard8141_0b0_theResult___fst_exp6218_0b1_ETC__q76)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2692 =
	      _theResult___fst_exp__h96218;
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2692 =
	      IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2688;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2692 =
	      IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2686;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2692 =
	      CASE_guard8141_0b0_theResult___fst_exp6218_0b1_ETC__q76;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2692 =
		   8'd0;
    endcase
  end
  always@(guard__h88141 or
	  _theResult___fst_exp__h96218 or
	  out_exp__h96698 or _theResult___exp__h96695)
  begin
    case (guard__h88141)
      2'b0, 2'b01:
	  CASE_guard8141_0b0_theResult___fst_exp6218_0b1_ETC__q77 =
	      _theResult___fst_exp__h96218;
      2'b10:
	  CASE_guard8141_0b0_theResult___fst_exp6218_0b1_ETC__q77 =
	      out_exp__h96698;
      2'b11:
	  CASE_guard8141_0b0_theResult___fst_exp6218_0b1_ETC__q77 =
	      _theResult___exp__h96695;
    endcase
  end
  always@(guard__h61553 or sfdin__h69644 or _theResult___sfd__h70177)
  begin
    case (guard__h61553)
      2'b0:
	  CASE_guard1553_0b0_sfdin9644_BITS_56_TO_34_0b1_ETC__q78 =
	      sfdin__h69644[56:34];
      2'b01, 2'b10, 2'b11:
	  CASE_guard1553_0b0_sfdin9644_BITS_56_TO_34_0b1_ETC__q78 =
	      _theResult___sfd__h70177;
    endcase
  end
  always@(requestR or
	  sfdin__h69644 or
	  IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2722 or
	  IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2720 or
	  CASE_guard1553_0b0_sfdin9644_BITS_56_TO_34_0b1_ETC__q78)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2726 =
	      sfdin__h69644[56:34];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2726 =
	      IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2722;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2726 =
	      IF_IF_IF_IF_0b0_CONCAT_NOT_requestR_BITS_190_T_ETC___d2720;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2726 =
	      CASE_guard1553_0b0_sfdin9644_BITS_56_TO_34_0b1_ETC__q78;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2726 =
		   23'd0;
    endcase
  end
  always@(guard__h61553 or
	  sfdin__h69644 or out_sfd__h70180 or _theResult___sfd__h70177)
  begin
    case (guard__h61553)
      2'b0, 2'b01:
	  CASE_guard1553_0b0_sfdin9644_BITS_56_TO_34_0b1_ETC__q79 =
	      sfdin__h69644[56:34];
      2'b10:
	  CASE_guard1553_0b0_sfdin9644_BITS_56_TO_34_0b1_ETC__q79 =
	      out_sfd__h70180;
      2'b11:
	  CASE_guard1553_0b0_sfdin9644_BITS_56_TO_34_0b1_ETC__q79 =
	      _theResult___sfd__h70177;
    endcase
  end
  always@(guard__h70288 or
	  _theResult___snd__h78287 or _theResult___sfd__h78789)
  begin
    case (guard__h70288)
      2'b0:
	  CASE_guard0288_0b0_theResult___snd8287_BITS_56_ETC__q80 =
	      _theResult___snd__h78287[56:34];
      2'b01, 2'b10, 2'b11:
	  CASE_guard0288_0b0_theResult___snd8287_BITS_56_ETC__q80 =
	      _theResult___sfd__h78789;
    endcase
  end
  always@(requestR or
	  _theResult___snd__h78287 or
	  IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2741 or
	  IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2739 or
	  CASE_guard0288_0b0_theResult___snd8287_BITS_56_ETC__q80)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2745 =
	      _theResult___snd__h78287[56:34];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2745 =
	      IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2741;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2745 =
	      IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2739;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2745 =
	      CASE_guard0288_0b0_theResult___snd8287_BITS_56_ETC__q80;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2745 =
		   23'd0;
    endcase
  end
  always@(guard__h70288 or
	  _theResult___snd__h78287 or
	  out_sfd__h78792 or _theResult___sfd__h78789)
  begin
    case (guard__h70288)
      2'b0, 2'b01:
	  CASE_guard0288_0b0_theResult___snd8287_BITS_56_ETC__q81 =
	      _theResult___snd__h78287[56:34];
      2'b10:
	  CASE_guard0288_0b0_theResult___snd8287_BITS_56_ETC__q81 =
	      out_sfd__h78792;
      2'b11:
	  CASE_guard0288_0b0_theResult___snd8287_BITS_56_ETC__q81 =
	      _theResult___sfd__h78789;
    endcase
  end
  always@(guard__h79277 or sfdin__h87497 or _theResult___sfd__h88030)
  begin
    case (guard__h79277)
      2'b0:
	  CASE_guard9277_0b0_sfdin7497_BITS_56_TO_34_0b1_ETC__q82 =
	      sfdin__h87497[56:34];
      2'b01, 2'b10, 2'b11:
	  CASE_guard9277_0b0_sfdin7497_BITS_56_TO_34_0b1_ETC__q82 =
	      _theResult___sfd__h88030;
    endcase
  end
  always@(requestR or
	  sfdin__h87497 or
	  IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2768 or
	  IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2766 or
	  CASE_guard9277_0b0_sfdin7497_BITS_56_TO_34_0b1_ETC__q82)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2772 =
	      sfdin__h87497[56:34];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2772 =
	      IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2768;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2772 =
	      IF_IF_IF_IF_3970_MINUS_SEXT_requestR_BITS_190__ETC___d2766;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2772 =
	      CASE_guard9277_0b0_sfdin7497_BITS_56_TO_34_0b1_ETC__q82;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2772 =
		   23'd0;
    endcase
  end
  always@(guard__h79277 or
	  sfdin__h87497 or out_sfd__h88033 or _theResult___sfd__h88030)
  begin
    case (guard__h79277)
      2'b0, 2'b01:
	  CASE_guard9277_0b0_sfdin7497_BITS_56_TO_34_0b1_ETC__q83 =
	      sfdin__h87497[56:34];
      2'b10:
	  CASE_guard9277_0b0_sfdin7497_BITS_56_TO_34_0b1_ETC__q83 =
	      out_sfd__h88033;
      2'b11:
	  CASE_guard9277_0b0_sfdin7497_BITS_56_TO_34_0b1_ETC__q83 =
	      _theResult___sfd__h88030;
    endcase
  end
  always@(guard__h88141 or
	  _theResult___snd__h96164 or _theResult___sfd__h96696)
  begin
    case (guard__h88141)
      2'b0:
	  CASE_guard8141_0b0_theResult___snd6164_BITS_56_ETC__q84 =
	      _theResult___snd__h96164[56:34];
      2'b01, 2'b10, 2'b11:
	  CASE_guard8141_0b0_theResult___snd6164_BITS_56_ETC__q84 =
	      _theResult___sfd__h96696;
    endcase
  end
  always@(requestR or
	  _theResult___snd__h96164 or
	  IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2787 or
	  IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2785 or
	  CASE_guard8141_0b0_theResult___snd6164_BITS_56_ETC__q84)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2791 =
	      _theResult___snd__h96164[56:34];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2791 =
	      IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2787;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2791 =
	      IF_IF_IF_requestR_BITS_190_TO_180_596_EQ_0_607_ETC___d2785;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2791 =
	      CASE_guard8141_0b0_theResult___snd6164_BITS_56_ETC__q84;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d2791 =
		   23'd0;
    endcase
  end
  always@(guard__h88141 or
	  _theResult___snd__h96164 or
	  out_sfd__h96699 or _theResult___sfd__h96696)
  begin
    case (guard__h88141)
      2'b0, 2'b01:
	  CASE_guard8141_0b0_theResult___snd6164_BITS_56_ETC__q85 =
	      _theResult___snd__h96164[56:34];
      2'b10:
	  CASE_guard8141_0b0_theResult___snd6164_BITS_56_ETC__q85 =
	      out_sfd__h96699;
      2'b11:
	  CASE_guard8141_0b0_theResult___snd6164_BITS_56_ETC__q85 =
	      _theResult___sfd__h96696;
    endcase
  end
  always@(guard__h61553 or requestR)
  begin
    case (guard__h61553)
      2'b0, 2'b01, 2'b10:
	  CASE_guard1553_0b0_requestR_BIT_191_0b1_reques_ETC__q86 =
	      requestR[191];
      2'd3:
	  CASE_guard1553_0b0_requestR_BIT_191_0b1_reques_ETC__q86 =
	      guard__h61553 == 2'b11 && requestR[191];
    endcase
  end
  always@(requestR or guard__h61553)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q87 =
	      requestR[191];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q87 =
	      (guard__h61553 == 2'b0) ?
		requestR[191] :
		(guard__h61553 == 2'b01 || guard__h61553 == 2'b10 ||
		 guard__h61553 == 2'b11) &&
		requestR[191];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q87 =
		   requestR[194:192] == 3'h1 && requestR[191];
    endcase
  end
  always@(guard__h70288 or requestR)
  begin
    case (guard__h70288)
      2'b0, 2'b01, 2'b10:
	  CASE_guard0288_0b0_requestR_BIT_191_0b1_reques_ETC__q88 =
	      requestR[191];
      2'd3:
	  CASE_guard0288_0b0_requestR_BIT_191_0b1_reques_ETC__q88 =
	      guard__h70288 == 2'b11 && requestR[191];
    endcase
  end
  always@(requestR or guard__h70288)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q89 =
	      requestR[191];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q89 =
	      (guard__h70288 == 2'b0) ?
		requestR[191] :
		(guard__h70288 == 2'b01 || guard__h70288 == 2'b10 ||
		 guard__h70288 == 2'b11) &&
		requestR[191];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q89 =
		   requestR[194:192] == 3'h1 && requestR[191];
    endcase
  end
  always@(guard__h79277 or requestR)
  begin
    case (guard__h79277)
      2'b0, 2'b01, 2'b10:
	  CASE_guard9277_0b0_requestR_BIT_191_0b1_reques_ETC__q90 =
	      requestR[191];
      2'd3:
	  CASE_guard9277_0b0_requestR_BIT_191_0b1_reques_ETC__q90 =
	      guard__h79277 == 2'b11 && requestR[191];
    endcase
  end
  always@(requestR or guard__h79277)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q91 =
	      requestR[191];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q91 =
	      (guard__h79277 == 2'b0) ?
		requestR[191] :
		(guard__h79277 == 2'b01 || guard__h79277 == 2'b10 ||
		 guard__h79277 == 2'b11) &&
		requestR[191];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q91 =
		   requestR[194:192] == 3'h1 && requestR[191];
    endcase
  end
  always@(guard__h88141 or requestR)
  begin
    case (guard__h88141)
      2'b0, 2'b01, 2'b10:
	  CASE_guard8141_0b0_requestR_BIT_191_0b1_reques_ETC__q92 =
	      requestR[191];
      2'd3:
	  CASE_guard8141_0b0_requestR_BIT_191_0b1_reques_ETC__q92 =
	      guard__h88141 == 2'b11 && requestR[191];
    endcase
  end
  always@(requestR or guard__h88141)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q93 =
	      requestR[191];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q93 =
	      (guard__h88141 == 2'b0) ?
		requestR[191] :
		(guard__h88141 == 2'b01 || guard__h88141 == 2'b10 ||
		 guard__h88141 == 2'b11) &&
		requestR[191];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q93 =
		   requestR[194:192] == 3'h1 && requestR[191];
    endcase
  end
  always@(guard__h111304 or
	  _theResult___fst_exp__h119265 or _theResult___exp__h119920)
  begin
    case (guard__h111304)
      2'b0:
	  CASE_guard11304_0b0_theResult___fst_exp19265_0_ETC__q102 =
	      _theResult___fst_exp__h119265;
      2'b01, 2'b10, 2'b11:
	  CASE_guard11304_0b0_theResult___fst_exp19265_0_ETC__q102 =
	      _theResult___exp__h119920;
    endcase
  end
  always@(requestR or
	  _theResult___fst_exp__h119265 or
	  IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3130 or
	  IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3128 or
	  CASE_guard11304_0b0_theResult___fst_exp19265_0_ETC__q102)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3134 =
	      _theResult___fst_exp__h119265;
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3134 =
	      IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3130;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3134 =
	      IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3128;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3134 =
	      CASE_guard11304_0b0_theResult___fst_exp19265_0_ETC__q102;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3134 =
		   11'd0;
    endcase
  end
  always@(guard__h111304 or
	  _theResult___fst_exp__h119265 or
	  out_exp__h119923 or _theResult___exp__h119920)
  begin
    case (guard__h111304)
      2'b0, 2'b01:
	  CASE_guard11304_0b0_theResult___fst_exp19265_0_ETC__q103 =
	      _theResult___fst_exp__h119265;
      2'b10:
	  CASE_guard11304_0b0_theResult___fst_exp19265_0_ETC__q103 =
	      out_exp__h119923;
      2'b11:
	  CASE_guard11304_0b0_theResult___fst_exp19265_0_ETC__q103 =
	      _theResult___exp__h119920;
    endcase
  end
  always@(guard__h120612 or
	  _theResult___fst_exp__h128838 or _theResult___exp__h129567)
  begin
    case (guard__h120612)
      2'b0:
	  CASE_guard20612_0b0_theResult___fst_exp28838_0_ETC__q104 =
	      _theResult___fst_exp__h128838;
      2'b01, 2'b10, 2'b11:
	  CASE_guard20612_0b0_theResult___fst_exp28838_0_ETC__q104 =
	      _theResult___exp__h129567;
    endcase
  end
  always@(requestR or
	  _theResult___fst_exp__h128838 or
	  IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3455 or
	  IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3453 or
	  CASE_guard20612_0b0_theResult___fst_exp28838_0_ETC__q104)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3459 =
	      _theResult___fst_exp__h128838;
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3459 =
	      IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3455;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3459 =
	      IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3453;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3459 =
	      CASE_guard20612_0b0_theResult___fst_exp28838_0_ETC__q104;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3459 =
		   11'd0;
    endcase
  end
  always@(guard__h120612 or
	  _theResult___fst_exp__h128838 or
	  out_exp__h129570 or _theResult___exp__h129567)
  begin
    case (guard__h120612)
      2'b0, 2'b01:
	  CASE_guard20612_0b0_theResult___fst_exp28838_0_ETC__q105 =
	      _theResult___fst_exp__h128838;
      2'b10:
	  CASE_guard20612_0b0_theResult___fst_exp28838_0_ETC__q105 =
	      out_exp__h129570;
      2'b11:
	  CASE_guard20612_0b0_theResult___fst_exp28838_0_ETC__q105 =
	      _theResult___exp__h129567;
    endcase
  end
  always@(guard__h129679 or
	  _theResult___fst_exp__h137669 or _theResult___exp__h138349)
  begin
    case (guard__h129679)
      2'b0:
	  CASE_guard29679_0b0_theResult___fst_exp37669_0_ETC__q106 =
	      _theResult___fst_exp__h137669;
      2'b01, 2'b10, 2'b11:
	  CASE_guard29679_0b0_theResult___fst_exp37669_0_ETC__q106 =
	      _theResult___exp__h138349;
    endcase
  end
  always@(requestR or
	  _theResult___fst_exp__h137669 or
	  IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3524 or
	  IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3522 or
	  CASE_guard29679_0b0_theResult___fst_exp37669_0_ETC__q106)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3528 =
	      _theResult___fst_exp__h137669;
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3528 =
	      IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3524;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3528 =
	      IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3522;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3528 =
	      CASE_guard29679_0b0_theResult___fst_exp37669_0_ETC__q106;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3528 =
		   11'd0;
    endcase
  end
  always@(guard__h129679 or
	  _theResult___fst_exp__h137669 or
	  out_exp__h138352 or _theResult___exp__h138349)
  begin
    case (guard__h129679)
      2'b0, 2'b01:
	  CASE_guard29679_0b0_theResult___fst_exp37669_0_ETC__q107 =
	      _theResult___fst_exp__h137669;
      2'b10:
	  CASE_guard29679_0b0_theResult___fst_exp37669_0_ETC__q107 =
	      out_exp__h138352;
      2'b11:
	  CASE_guard29679_0b0_theResult___fst_exp37669_0_ETC__q107 =
	      _theResult___exp__h138349;
    endcase
  end
  always@(guard__h111304 or requestR)
  begin
    case (guard__h111304)
      2'b0, 2'b01, 2'b10:
	  CASE_guard11304_0b0_requestR_BITS_191_TO_160_E_ETC__q108 =
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159];
      2'd3:
	  CASE_guard11304_0b0_requestR_BITS_191_TO_160_E_ETC__q108 =
	      guard__h111304 == 2'b11 && requestR[191:160] == 32'hFFFFFFFF &&
	      requestR[159];
    endcase
  end
  always@(requestR or guard__h111304)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q109 =
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q109 =
	      (guard__h111304 == 2'b0) ?
		requestR[191:160] == 32'hFFFFFFFF && requestR[159] :
		(guard__h111304 == 2'b01 || guard__h111304 == 2'b10 ||
		 guard__h111304 == 2'b11) &&
		requestR[191:160] == 32'hFFFFFFFF &&
		requestR[159];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q109 =
		   requestR[194:192] == 3'h1 &&
		   requestR[191:160] == 32'hFFFFFFFF &&
		   requestR[159];
    endcase
  end
  always@(guard__h120612 or requestR)
  begin
    case (guard__h120612)
      2'b0, 2'b01, 2'b10:
	  CASE_guard20612_0b0_requestR_BITS_191_TO_160_E_ETC__q110 =
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159];
      2'd3:
	  CASE_guard20612_0b0_requestR_BITS_191_TO_160_E_ETC__q110 =
	      guard__h120612 == 2'b11 && requestR[191:160] == 32'hFFFFFFFF &&
	      requestR[159];
    endcase
  end
  always@(requestR or guard__h120612)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q111 =
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q111 =
	      (guard__h120612 == 2'b0) ?
		requestR[191:160] == 32'hFFFFFFFF && requestR[159] :
		(guard__h120612 == 2'b01 || guard__h120612 == 2'b10 ||
		 guard__h120612 == 2'b11) &&
		requestR[191:160] == 32'hFFFFFFFF &&
		requestR[159];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q111 =
		   requestR[194:192] == 3'h1 &&
		   requestR[191:160] == 32'hFFFFFFFF &&
		   requestR[159];
    endcase
  end
  always@(guard__h129679 or requestR)
  begin
    case (guard__h129679)
      2'b0, 2'b01, 2'b10:
	  CASE_guard29679_0b0_requestR_BITS_191_TO_160_E_ETC__q112 =
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159];
      2'd3:
	  CASE_guard29679_0b0_requestR_BITS_191_TO_160_E_ETC__q112 =
	      guard__h129679 == 2'b11 && requestR[191:160] == 32'hFFFFFFFF &&
	      requestR[159];
    endcase
  end
  always@(requestR or guard__h129679)
  begin
    case (requestR[194:192])
      3'h2, 3'h3:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q113 =
	      requestR[191:160] == 32'hFFFFFFFF && requestR[159];
      3'h4:
	  CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q113 =
	      (guard__h129679 == 2'b0) ?
		requestR[191:160] == 32'hFFFFFFFF && requestR[159] :
		(guard__h129679 == 2'b01 || guard__h129679 == 2'b10 ||
		 guard__h129679 == 2'b11) &&
		requestR[191:160] == 32'hFFFFFFFF &&
		requestR[159];
      default: CASE_requestR_BITS_194_TO_192_0x2_requestR_BIT_ETC__q113 =
		   requestR[194:192] == 3'h1 &&
		   requestR[191:160] == 32'hFFFFFFFF &&
		   requestR[159];
    endcase
  end
  always@(guard__h111304 or
	  _theResult___snd__h119216 or _theResult___sfd__h119921)
  begin
    case (guard__h111304)
      2'b0:
	  CASE_guard11304_0b0_theResult___snd19216_BITS__ETC__q114 =
	      _theResult___snd__h119216[56:5];
      2'b01, 2'b10, 2'b11:
	  CASE_guard11304_0b0_theResult___snd19216_BITS__ETC__q114 =
	      _theResult___sfd__h119921;
    endcase
  end
  always@(requestR or
	  _theResult___snd__h119216 or
	  IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3557 or
	  IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3555 or
	  CASE_guard11304_0b0_theResult___snd19216_BITS__ETC__q114)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3561 =
	      _theResult___snd__h119216[56:5];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3561 =
	      IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3557;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3561 =
	      IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3555;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3561 =
	      CASE_guard11304_0b0_theResult___snd19216_BITS__ETC__q114;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3561 =
		   52'd0;
    endcase
  end
  always@(guard__h111304 or
	  _theResult___snd__h119216 or
	  out_sfd__h119924 or _theResult___sfd__h119921)
  begin
    case (guard__h111304)
      2'b0, 2'b01:
	  CASE_guard11304_0b0_theResult___snd19216_BITS__ETC__q115 =
	      _theResult___snd__h119216[56:5];
      2'b10:
	  CASE_guard11304_0b0_theResult___snd19216_BITS__ETC__q115 =
	      out_sfd__h119924;
      2'b11:
	  CASE_guard11304_0b0_theResult___snd19216_BITS__ETC__q115 =
	      _theResult___sfd__h119921;
    endcase
  end
  always@(guard__h120612 or sfdin__h128832 or _theResult___sfd__h129568)
  begin
    case (guard__h120612)
      2'b0:
	  CASE_guard20612_0b0_sfdin28832_BITS_56_TO_5_0b_ETC__q116 =
	      sfdin__h128832[56:5];
      2'b01, 2'b10, 2'b11:
	  CASE_guard20612_0b0_sfdin28832_BITS_56_TO_5_0b_ETC__q116 =
	      _theResult___sfd__h129568;
    endcase
  end
  always@(requestR or
	  sfdin__h128832 or
	  IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3584 or
	  IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3582 or
	  CASE_guard20612_0b0_sfdin28832_BITS_56_TO_5_0b_ETC__q116)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3588 =
	      sfdin__h128832[56:5];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3588 =
	      IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3584;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3588 =
	      IF_IF_IF_IF_3074_MINUS_SEXT_IF_requestR_BITS_1_ETC___d3582;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3588 =
	      CASE_guard20612_0b0_sfdin28832_BITS_56_TO_5_0b_ETC__q116;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3588 =
		   52'd0;
    endcase
  end
  always@(guard__h120612 or
	  sfdin__h128832 or out_sfd__h129571 or _theResult___sfd__h129568)
  begin
    case (guard__h120612)
      2'b0, 2'b01:
	  CASE_guard20612_0b0_sfdin28832_BITS_56_TO_5_0b_ETC__q117 =
	      sfdin__h128832[56:5];
      2'b10:
	  CASE_guard20612_0b0_sfdin28832_BITS_56_TO_5_0b_ETC__q117 =
	      out_sfd__h129571;
      2'b11:
	  CASE_guard20612_0b0_sfdin28832_BITS_56_TO_5_0b_ETC__q117 =
	      _theResult___sfd__h129568;
    endcase
  end
  always@(guard__h129679 or
	  _theResult___snd__h137615 or _theResult___sfd__h138350)
  begin
    case (guard__h129679)
      2'b0:
	  CASE_guard29679_0b0_theResult___snd37615_BITS__ETC__q118 =
	      _theResult___snd__h137615[56:5];
      2'b01, 2'b10, 2'b11:
	  CASE_guard29679_0b0_theResult___snd37615_BITS__ETC__q118 =
	      _theResult___sfd__h138350;
    endcase
  end
  always@(requestR or
	  _theResult___snd__h137615 or
	  IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3603 or
	  IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3601 or
	  CASE_guard29679_0b0_theResult___snd37615_BITS__ETC__q118)
  begin
    case (requestR[194:192])
      3'h1:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3607 =
	      _theResult___snd__h137615[56:5];
      3'h2:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3607 =
	      IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3603;
      3'h3:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3607 =
	      IF_IF_IF_IF_requestR_BITS_191_TO_160_4_EQ_0xFF_ETC___d3601;
      3'h4:
	  IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3607 =
	      CASE_guard29679_0b0_theResult___snd37615_BITS__ETC__q118;
      default: IF_requestR_BITS_194_TO_192_0_EQ_0x4_5_THEN_IF_ETC___d3607 =
		   52'd0;
    endcase
  end
  always@(guard__h129679 or
	  _theResult___snd__h137615 or
	  out_sfd__h138353 or _theResult___sfd__h138350)
  begin
    case (guard__h129679)
      2'b0, 2'b01:
	  CASE_guard29679_0b0_theResult___snd37615_BITS__ETC__q119 =
	      _theResult___snd__h137615[56:5];
      2'b10:
	  CASE_guard29679_0b0_theResult___snd37615_BITS__ETC__q119 =
	      out_sfd__h138353;
      2'b11:
	  CASE_guard29679_0b0_theResult___snd37615_BITS__ETC__q119 =
	      _theResult___sfd__h138350;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	requestR <= `BSV_ASSIGNMENT_DELAY
	    215'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	resultR <= `BSV_ASSIGNMENT_DELAY 70'h0AAAAAAAAAAAAAAAAA;
	stateR <= `BSV_ASSIGNMENT_DELAY 2'd0;
      end
    else
      begin
        if (cfg_verbosity$EN)
	  cfg_verbosity <= `BSV_ASSIGNMENT_DELAY cfg_verbosity$D_IN;
	if (requestR$EN) requestR <= `BSV_ASSIGNMENT_DELAY requestR$D_IN;
	if (resultR$EN) resultR <= `BSV_ASSIGNMENT_DELAY resultR$D_IN;
	if (stateR$EN) stateR <= `BSV_ASSIGNMENT_DELAY stateR$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cfg_verbosity = 4'hA;
    requestR = 215'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    resultR = 70'h2AAAAAAAAAAAAAAAAA;
    stateR = 2'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule