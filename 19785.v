module outputs
  wire [39 : 0] client0_request_get,
		client1_request_get,
		client2_request_get,
		server_response_get;
  wire RDY_client0_request_get,
       RDY_client0_response_put,
       RDY_client1_request_get,
       RDY_client1_response_put,
       RDY_client2_request_get,
       RDY_client2_response_put,
       RDY_server_request_put,
       RDY_server_response_get;
  // register fork0_decided
  reg fork0_decided;
  wire fork0_decided_D_IN, fork0_decided_EN;
  // register fork0_match0
  reg fork0_match0;
  wire fork0_match0_D_IN, fork0_match0_EN;
  // register fork0_ptr
  reg [2 : 0] fork0_ptr;
  reg [2 : 0] fork0_ptr_D_IN;
  wire fork0_ptr_EN;
  // register fork0_sr
  reg [119 : 0] fork0_sr;
  wire [119 : 0] fork0_sr_D_IN;
  wire fork0_sr_EN;
  // register fork0_stageSent
  reg fork0_stageSent;
  wire fork0_stageSent_D_IN, fork0_stageSent_EN;
  // register fork0_staged
  reg fork0_staged;
  wire fork0_staged_D_IN, fork0_staged_EN;
  // register fork1_decided
  reg fork1_decided;
  wire fork1_decided_D_IN, fork1_decided_EN;
  // register fork1_match0
  reg fork1_match0;
  wire fork1_match0_D_IN, fork1_match0_EN;
  // register fork1_ptr
  reg [2 : 0] fork1_ptr;
  reg [2 : 0] fork1_ptr_D_IN;
  wire fork1_ptr_EN;
  // register fork1_sr
  reg [119 : 0] fork1_sr;
  wire [119 : 0] fork1_sr_D_IN;
  wire fork1_sr_EN;
  // register fork1_stageSent
  reg fork1_stageSent;
  wire fork1_stageSent_D_IN, fork1_stageSent_EN;
  // register fork1_staged
  reg fork1_staged;
  wire fork1_staged_D_IN, fork1_staged_EN;
  // register merge0_fi0Active
  reg merge0_fi0Active;
  wire merge0_fi0Active_D_IN, merge0_fi0Active_EN;
  // register merge0_fi0HasPrio
  reg merge0_fi0HasPrio;
  reg merge0_fi0HasPrio_D_IN;
  wire merge0_fi0HasPrio_EN;
  // register merge0_fi1Active
  reg merge0_fi1Active;
  wire merge0_fi1Active_D_IN, merge0_fi1Active_EN;
  // register merge1_fi0Active
  reg merge1_fi0Active;
  wire merge1_fi0Active_D_IN, merge1_fi0Active_EN;
  // register merge1_fi0HasPrio
  reg merge1_fi0HasPrio;
  reg merge1_fi0HasPrio_D_IN;
  wire merge1_fi0HasPrio_EN;
  // register merge1_fi1Active
  reg merge1_fi1Active;
  wire merge1_fi1Active_D_IN, merge1_fi1Active_EN;
  // ports of submodule fork0_d0F
  wire [39 : 0] fork0_d0F_D_IN, fork0_d0F_D_OUT;
  wire fork0_d0F_CLR,
       fork0_d0F_DEQ,
       fork0_d0F_EMPTY_N,
       fork0_d0F_ENQ,
       fork0_d0F_FULL_N;
  // ports of submodule fork0_d1F
  wire [39 : 0] fork0_d1F_D_IN, fork0_d1F_D_OUT;
  wire fork0_d1F_CLR,
       fork0_d1F_DEQ,
       fork0_d1F_EMPTY_N,
       fork0_d1F_ENQ,
       fork0_d1F_FULL_N;
  // ports of submodule fork0_srcF
  wire [39 : 0] fork0_srcF_D_IN, fork0_srcF_D_OUT;
  wire fork0_srcF_CLR,
       fork0_srcF_DEQ,
       fork0_srcF_EMPTY_N,
       fork0_srcF_ENQ,
       fork0_srcF_FULL_N;
  // ports of submodule fork1_d0F
  wire [39 : 0] fork1_d0F_D_IN, fork1_d0F_D_OUT;
  wire fork1_d0F_CLR,
       fork1_d0F_DEQ,
       fork1_d0F_EMPTY_N,
       fork1_d0F_ENQ,
       fork1_d0F_FULL_N;
  // ports of submodule fork1_d1F
  wire [39 : 0] fork1_d1F_D_IN, fork1_d1F_D_OUT;
  wire fork1_d1F_CLR,
       fork1_d1F_DEQ,
       fork1_d1F_EMPTY_N,
       fork1_d1F_ENQ,
       fork1_d1F_FULL_N;
  // ports of submodule fork1_srcF
  wire [39 : 0] fork1_srcF_D_IN, fork1_srcF_D_OUT;
  wire fork1_srcF_CLR,
       fork1_srcF_DEQ,
       fork1_srcF_EMPTY_N,
       fork1_srcF_ENQ,
       fork1_srcF_FULL_N;
  // ports of submodule merge0_fi0
  wire [39 : 0] merge0_fi0_D_IN, merge0_fi0_D_OUT;
  wire merge0_fi0_CLR,
       merge0_fi0_DEQ,
       merge0_fi0_EMPTY_N,
       merge0_fi0_ENQ,
       merge0_fi0_FULL_N;
  // ports of submodule merge0_fi1
  wire [39 : 0] merge0_fi1_D_IN, merge0_fi1_D_OUT;
  wire merge0_fi1_CLR,
       merge0_fi1_DEQ,
       merge0_fi1_EMPTY_N,
       merge0_fi1_ENQ,
       merge0_fi1_FULL_N;
  // ports of submodule merge0_fo
  reg [39 : 0] merge0_fo_D_IN;
  wire [39 : 0] merge0_fo_D_OUT;
  wire merge0_fo_CLR,
       merge0_fo_DEQ,
       merge0_fo_EMPTY_N,
       merge0_fo_ENQ,
       merge0_fo_FULL_N;
  // ports of submodule merge1_fi0
  wire [39 : 0] merge1_fi0_D_IN, merge1_fi0_D_OUT;
  wire merge1_fi0_CLR,
       merge1_fi0_DEQ,
       merge1_fi0_EMPTY_N,
       merge1_fi0_ENQ,
       merge1_fi0_FULL_N;
  // ports of submodule merge1_fi1
  wire [39 : 0] merge1_fi1_D_IN, merge1_fi1_D_OUT;
  wire merge1_fi1_CLR,
       merge1_fi1_DEQ,
       merge1_fi1_EMPTY_N,
       merge1_fi1_ENQ,
       merge1_fi1_FULL_N;
  // ports of submodule merge1_fo
  reg [39 : 0] merge1_fo_D_IN;
  wire [39 : 0] merge1_fo_D_OUT;
  wire merge1_fo_CLR,
       merge1_fo_DEQ,
       merge1_fo_EMPTY_N,
       merge1_fo_ENQ,
       merge1_fo_FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_fork0_decide,
       WILL_FIRE_RL_fork0_egress,
       WILL_FIRE_RL_fork0_stage,
       WILL_FIRE_RL_fork1_decide,
       WILL_FIRE_RL_fork1_egress,
       WILL_FIRE_RL_fork1_stage,
       WILL_FIRE_RL_merge0_arbitrate,
       WILL_FIRE_RL_merge0_fi0_advance,
       WILL_FIRE_RL_merge0_fi1_advance,
       WILL_FIRE_RL_merge1_arbitrate,
       WILL_FIRE_RL_merge1_fi0_advance,
       WILL_FIRE_RL_merge1_fi1_advance;
  // inputs to muxes for submodule ports
  wire [39 : 0] MUX_merge0_fo_enq_1__VAL_1,
		MUX_merge0_fo_enq_1__VAL_2,
		MUX_merge0_fo_enq_1__VAL_3,
		MUX_merge1_fo_enq_1__VAL_1,
		MUX_merge1_fo_enq_1__VAL_2,
		MUX_merge1_fo_enq_1__VAL_3;
  wire [2 : 0] MUX_fork0_ptr_write_1__VAL_1,
	       MUX_fork0_ptr_write_1__VAL_2,
	       MUX_fork1_ptr_write_1__VAL_1,
	       MUX_fork1_ptr_write_1__VAL_2;
  wire MUX_fork0_decided_write_1__SEL_1,
       MUX_fork0_ptr_write_1__SEL_1,
       MUX_fork1_decided_write_1__SEL_1,
       MUX_fork1_ptr_write_1__SEL_1,
       MUX_merge0_fi0Active_write_1__SEL_1,
       MUX_merge0_fi0Active_write_1__VAL_1,
       MUX_merge0_fi0Active_write_1__VAL_2,
       MUX_merge0_fi1Active_write_1__SEL_1,
       MUX_merge0_fi1Active_write_1__VAL_2,
       MUX_merge1_fi0Active_write_1__SEL_1,
       MUX_merge1_fi0Active_write_1__VAL_1,
       MUX_merge1_fi0Active_write_1__VAL_2,
       MUX_merge1_fi1Active_write_1__SEL_1,
       MUX_merge1_fi1Active_write_1__VAL_2;
  // remaining internal signals
  reg [7 : 0] SEL_ARR_fork0_sr_94_BITS_17_TO_10_51_fork0_sr__ETC___d553,
	      SEL_ARR_fork0_sr_94_BITS_27_TO_20_31_fork0_sr__ETC___d533,
	      SEL_ARR_fork0_sr_94_BITS_37_TO_30_12_fork0_sr__ETC___d514,
	      SEL_ARR_fork0_sr_94_BITS_7_TO_0_70_fork0_sr_94_ETC___d572,
	      SEL_ARR_fork1_sr_43_BITS_17_TO_10_00_fork1_sr__ETC___d802,
	      SEL_ARR_fork1_sr_43_BITS_27_TO_20_80_fork1_sr__ETC___d782,
	      SEL_ARR_fork1_sr_43_BITS_37_TO_30_61_fork1_sr__ETC___d763,
	      SEL_ARR_fork1_sr_43_BITS_7_TO_0_19_fork1_sr_43_ETC___d821;
  reg [1 : 0] CASE_client0_response_put_BITS_19_TO_18_0_clie_ETC__q91,
	      CASE_client0_response_put_BITS_29_TO_28_0_clie_ETC__q90,
	      CASE_client0_response_put_BITS_39_TO_38_0_clie_ETC__q89,
	      CASE_client0_response_put_BITS_9_TO_8_0_client_ETC__q92,
	      CASE_client1_response_put_BITS_19_TO_18_0_clie_ETC__q99,
	      CASE_client1_response_put_BITS_29_TO_28_0_clie_ETC__q98,
	      CASE_client1_response_put_BITS_39_TO_38_0_clie_ETC__q97,
	      CASE_client1_response_put_BITS_9_TO_8_0_client_ETC__q100,
	      CASE_client2_response_put_BITS_19_TO_18_0_clie_ETC__q103,
	      CASE_client2_response_put_BITS_29_TO_28_0_clie_ETC__q102,
	      CASE_client2_response_put_BITS_39_TO_38_0_clie_ETC__q101,
	      CASE_client2_response_put_BITS_9_TO_8_0_client_ETC__q104,
	      CASE_fork0_d0FD_OUT_BITS_19_TO_18_0_fork0_d0F_ETC__q7,
	      CASE_fork0_d0FD_OUT_BITS_29_TO_28_0_fork0_d0F_ETC__q6,
	      CASE_fork0_d0FD_OUT_BITS_39_TO_38_0_fork0_d0F_ETC__q5,
	      CASE_fork0_d0FD_OUT_BITS_9_TO_8_0_fork0_d0FD_ETC__q8,
	      CASE_fork0_d1FD_OUT_BITS_19_TO_18_0_fork0_d1F_ETC__q87,
	      CASE_fork0_d1FD_OUT_BITS_29_TO_28_0_fork0_d1F_ETC__q86,
	      CASE_fork0_d1FD_OUT_BITS_39_TO_38_0_fork0_d1F_ETC__q85,
	      CASE_fork0_d1FD_OUT_BITS_9_TO_8_0_fork0_d1FD_ETC__q88,
	      CASE_fork0_sr_BITS_109_TO_108_0_fork0_sr_BITS__ETC__q66,
	      CASE_fork0_sr_BITS_119_TO_118_0_fork0_sr_BITS__ETC__q65,
	      CASE_fork0_sr_BITS_49_TO_48_0_fork0_sr_BITS_49_ETC__q72,
	      CASE_fork0_sr_BITS_59_TO_58_0_fork0_sr_BITS_59_ETC__q71,
	      CASE_fork0_sr_BITS_69_TO_68_0_fork0_sr_BITS_69_ETC__q70,
	      CASE_fork0_sr_BITS_79_TO_78_0_fork0_sr_BITS_79_ETC__q69,
	      CASE_fork0_sr_BITS_89_TO_88_0_fork0_sr_BITS_89_ETC__q68,
	      CASE_fork0_sr_BITS_99_TO_98_0_fork0_sr_BITS_99_ETC__q67,
	      CASE_fork0_srcFD_OUT_BITS_19_TO_18_0_fork0_sr_ETC__q29,
	      CASE_fork0_srcFD_OUT_BITS_29_TO_28_0_fork0_sr_ETC__q28,
	      CASE_fork0_srcFD_OUT_BITS_39_TO_38_0_fork0_sr_ETC__q27,
	      CASE_fork0_srcFD_OUT_BITS_9_TO_8_0_fork0_srcF_ETC__q30,
	      CASE_fork1_d0FD_OUT_BITS_19_TO_18_0_fork1_d0F_ETC__q3,
	      CASE_fork1_d0FD_OUT_BITS_29_TO_28_0_fork1_d0F_ETC__q2,
	      CASE_fork1_d0FD_OUT_BITS_39_TO_38_0_fork1_d0F_ETC__q1,
	      CASE_fork1_d0FD_OUT_BITS_9_TO_8_0_fork1_d0FD_ETC__q4,
	      CASE_fork1_d1FD_OUT_BITS_19_TO_18_0_fork1_d1F_ETC__q15,
	      CASE_fork1_d1FD_OUT_BITS_29_TO_28_0_fork1_d1F_ETC__q14,
	      CASE_fork1_d1FD_OUT_BITS_39_TO_38_0_fork1_d1F_ETC__q13,
	      CASE_fork1_d1FD_OUT_BITS_9_TO_8_0_fork1_d1FD_ETC__q16,
	      CASE_fork1_sr_BITS_109_TO_108_0_fork1_sr_BITS__ETC__q78,
	      CASE_fork1_sr_BITS_119_TO_118_0_fork1_sr_BITS__ETC__q77,
	      CASE_fork1_sr_BITS_49_TO_48_0_fork1_sr_BITS_49_ETC__q84,
	      CASE_fork1_sr_BITS_59_TO_58_0_fork1_sr_BITS_59_ETC__q83,
	      CASE_fork1_sr_BITS_69_TO_68_0_fork1_sr_BITS_69_ETC__q82,
	      CASE_fork1_sr_BITS_79_TO_78_0_fork1_sr_BITS_79_ETC__q81,
	      CASE_fork1_sr_BITS_89_TO_88_0_fork1_sr_BITS_89_ETC__q80,
	      CASE_fork1_sr_BITS_99_TO_98_0_fork1_sr_BITS_99_ETC__q79,
	      CASE_fork1_srcFD_OUT_BITS_19_TO_18_0_fork1_sr_ETC__q25,
	      CASE_fork1_srcFD_OUT_BITS_29_TO_28_0_fork1_sr_ETC__q24,
	      CASE_fork1_srcFD_OUT_BITS_39_TO_38_0_fork1_sr_ETC__q23,
	      CASE_fork1_srcFD_OUT_BITS_9_TO_8_0_fork1_srcF_ETC__q26,
	      CASE_merge0_fi0D_OUT_BITS_19_TO_18_0_merge0_f_ETC__q51,
	      CASE_merge0_fi0D_OUT_BITS_29_TO_28_0_merge0_f_ETC__q50,
	      CASE_merge0_fi0D_OUT_BITS_39_TO_38_0_merge0_f_ETC__q49,
	      CASE_merge0_fi0D_OUT_BITS_9_TO_8_0_merge0_fi0_ETC__q52,
	      CASE_merge0_fi1D_OUT_BITS_19_TO_18_0_merge0_f_ETC__q55,
	      CASE_merge0_fi1D_OUT_BITS_29_TO_28_0_merge0_f_ETC__q54,
	      CASE_merge0_fi1D_OUT_BITS_39_TO_38_0_merge0_f_ETC__q53,
	      CASE_merge0_fi1D_OUT_BITS_9_TO_8_0_merge0_fi1_ETC__q56,
	      CASE_merge0_foD_OUT_BITS_19_TO_18_0_merge0_fo_ETC__q11,
	      CASE_merge0_foD_OUT_BITS_29_TO_28_0_merge0_fo_ETC__q10,
	      CASE_merge0_foD_OUT_BITS_39_TO_38_0_merge0_fo_ETC__q9,
	      CASE_merge0_foD_OUT_BITS_9_TO_8_0_merge0_foD_ETC__q12,
	      CASE_merge1_fi0D_OUT_BITS_19_TO_18_0_merge1_f_ETC__q59,
	      CASE_merge1_fi0D_OUT_BITS_29_TO_28_0_merge1_f_ETC__q58,
	      CASE_merge1_fi0D_OUT_BITS_39_TO_38_0_merge1_f_ETC__q57,
	      CASE_merge1_fi0D_OUT_BITS_9_TO_8_0_merge1_fi0_ETC__q60,
	      CASE_merge1_fi1D_OUT_BITS_19_TO_18_0_merge1_f_ETC__q63,
	      CASE_merge1_fi1D_OUT_BITS_29_TO_28_0_merge1_f_ETC__q62,
	      CASE_merge1_fi1D_OUT_BITS_39_TO_38_0_merge1_f_ETC__q61,
	      CASE_merge1_fi1D_OUT_BITS_9_TO_8_0_merge1_fi1_ETC__q64,
	      CASE_merge1_foD_OUT_BITS_19_TO_18_0_merge1_fo_ETC__q95,
	      CASE_merge1_foD_OUT_BITS_29_TO_28_0_merge1_fo_ETC__q94,
	      CASE_merge1_foD_OUT_BITS_39_TO_38_0_merge1_fo_ETC__q93,
	      CASE_merge1_foD_OUT_BITS_9_TO_8_0_merge1_foD_ETC__q96,
	      CASE_server_request_put_BITS_19_TO_18_0_server_ETC__q75,
	      CASE_server_request_put_BITS_29_TO_28_0_server_ETC__q74,
	      CASE_server_request_put_BITS_39_TO_38_0_server_ETC__q73,
	      CASE_server_request_put_BITS_9_TO_8_0_server_r_ETC__q76;
  reg CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_0_1_ETC__q39,
      CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_1_1_ETC__q38,
      CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_2_1_ETC__q37,
      CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_0_1_ETC__q22,
      CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_1_1_ETC__q21,
      CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_2_1_ETC__q20,
      CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_0_1_ETC__q19,
      CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_1_1_ETC__q18,
      CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_2_1_ETC__q17,
      CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q42,
      CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q41,
      CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q40,
      CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_0_1_ETC__q45,
      CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_1_1_ETC__q44,
      CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_2_1_ETC__q43,
      CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_0_1_ETC__q36,
      CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_1_1_ETC__q35,
      CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_2_1_ETC__q34,
      CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_0_1_ETC__q33,
      CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_1_1_ETC__q32,
      CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_2_1_ETC__q31,
      CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q48,
      CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q47,
      CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q46;
  wire [39 : 0] IF_fork0_srcF_first__50_BITS_39_TO_38_51_EQ_0__ETC___d393,
		IF_fork1_srcF_first__99_BITS_39_TO_38_00_EQ_0__ETC___d642;
  wire [19 : 0] IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d147,
		IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d318;
  wire [15 : 0] seen__h14989, seen__h24820;
  wire [9 : 0] IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d135,
	       IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d145,
	       IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d156,
	       IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d166,
	       IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d306,
	       IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d316,
	       IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d327,
	       IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d337,
	       IF_SEL_ARR_fork0_sr_94_BITS_19_TO_18_47_EQ_0_4_ETC___d565,
	       IF_SEL_ARR_fork0_sr_94_BITS_19_TO_18_47_EQ_1_5_ETC___d564,
	       IF_SEL_ARR_fork0_sr_94_BITS_19_TO_18_47_EQ_2_5_ETC___d563,
	       IF_SEL_ARR_fork0_sr_94_BITS_29_TO_28_27_EQ_0_2_ETC___d545,
	       IF_SEL_ARR_fork0_sr_94_BITS_29_TO_28_27_EQ_1_3_ETC___d544,
	       IF_SEL_ARR_fork0_sr_94_BITS_29_TO_28_27_EQ_2_3_ETC___d543,
	       IF_SEL_ARR_fork0_sr_94_BITS_39_TO_38_08_EQ_0_0_ETC___d526,
	       IF_SEL_ARR_fork0_sr_94_BITS_39_TO_38_08_EQ_1_1_ETC___d525,
	       IF_SEL_ARR_fork0_sr_94_BITS_39_TO_38_08_EQ_2_2_ETC___d524,
	       IF_SEL_ARR_fork0_sr_94_BITS_9_TO_8_66_EQ_0_67__ETC___d584,
	       IF_SEL_ARR_fork0_sr_94_BITS_9_TO_8_66_EQ_1_74__ETC___d583,
	       IF_SEL_ARR_fork0_sr_94_BITS_9_TO_8_66_EQ_2_78__ETC___d582,
	       IF_SEL_ARR_fork1_sr_43_BITS_19_TO_18_96_EQ_0_9_ETC___d814,
	       IF_SEL_ARR_fork1_sr_43_BITS_19_TO_18_96_EQ_1_0_ETC___d813,
	       IF_SEL_ARR_fork1_sr_43_BITS_19_TO_18_96_EQ_2_0_ETC___d812,
	       IF_SEL_ARR_fork1_sr_43_BITS_29_TO_28_76_EQ_0_7_ETC___d794,
	       IF_SEL_ARR_fork1_sr_43_BITS_29_TO_28_76_EQ_1_8_ETC___d793,
	       IF_SEL_ARR_fork1_sr_43_BITS_29_TO_28_76_EQ_2_8_ETC___d792,
	       IF_SEL_ARR_fork1_sr_43_BITS_39_TO_38_57_EQ_0_5_ETC___d775,
	       IF_SEL_ARR_fork1_sr_43_BITS_39_TO_38_57_EQ_1_6_ETC___d774,
	       IF_SEL_ARR_fork1_sr_43_BITS_39_TO_38_57_EQ_2_6_ETC___d773,
	       IF_SEL_ARR_fork1_sr_43_BITS_9_TO_8_15_EQ_0_16__ETC___d833,
	       IF_SEL_ARR_fork1_sr_43_BITS_9_TO_8_15_EQ_1_23__ETC___d832,
	       IF_SEL_ARR_fork1_sr_43_BITS_9_TO_8_15_EQ_2_27__ETC___d831;
  wire [7 : 0] IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d128,
	       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d138,
	       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d149,
	       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d159,
	       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d299,
	       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d309,
	       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d320,
	       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d330;
  wire [2 : 0] fork0_ptr_90_PLUS_1___d491, fork1_ptr_39_PLUS_1___d740;
  wire [1 : 0] IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d133,
	       IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d143,
	       IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d154,
	       IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d164,
	       IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d304,
	       IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d314,
	       IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d325,
	       IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d335;
  wire IF_merge0_fi0HasPrio_06_THEN_NOT_merge0_fi0_i__ETC___d113,
       IF_merge0_fi0HasPrio_06_THEN_NOT_merge0_fi0_i__ETC___d115,
       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d127,
       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d137,
       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d148,
       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d158,
       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_i_notE_ETC___d118,
       IF_merge1_fi0HasPrio_77_THEN_NOT_merge1_fi0_i__ETC___d284,
       IF_merge1_fi0HasPrio_77_THEN_NOT_merge1_fi0_i__ETC___d286,
       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d298,
       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d308,
       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d319,
       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d329,
       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_i_notE_ETC___d289,
       NOT_fork0_stageSent_98_99_OR_fork0_srcF_i_notE_ETC___d505,
       NOT_fork1_stageSent_47_48_OR_fork1_srcF_i_notE_ETC___d754;
  // action method server_request_put
  assign RDY_server_request_put = fork0_srcF_FULL_N ;
  // actionvalue method server_response_get
  assign server_response_get =
	     { CASE_merge0_foD_OUT_BITS_39_TO_38_0_merge0_fo_ETC__q9,
	       merge0_fo_D_OUT[37:30],
	       CASE_merge0_foD_OUT_BITS_29_TO_28_0_merge0_fo_ETC__q10,
	       merge0_fo_D_OUT[27:20],
	       CASE_merge0_foD_OUT_BITS_19_TO_18_0_merge0_fo_ETC__q11,
	       merge0_fo_D_OUT[17:10],
	       CASE_merge0_foD_OUT_BITS_9_TO_8_0_merge0_foD_ETC__q12,
	       merge0_fo_D_OUT[7:0] } ;
  assign RDY_server_response_get = merge0_fo_EMPTY_N ;
  // actionvalue method client0_request_get
  assign client0_request_get =
	     { CASE_fork0_d0FD_OUT_BITS_39_TO_38_0_fork0_d0F_ETC__q5,
	       fork0_d0F_D_OUT[37:30],
	       CASE_fork0_d0FD_OUT_BITS_29_TO_28_0_fork0_d0F_ETC__q6,
	       fork0_d0F_D_OUT[27:20],
	       CASE_fork0_d0FD_OUT_BITS_19_TO_18_0_fork0_d0F_ETC__q7,
	       fork0_d0F_D_OUT[17:10],
	       CASE_fork0_d0FD_OUT_BITS_9_TO_8_0_fork0_d0FD_ETC__q8,
	       fork0_d0F_D_OUT[7:0] } ;
  assign RDY_client0_request_get = fork0_d0F_EMPTY_N ;
  // action method client0_response_put
  assign RDY_client0_response_put = merge0_fi0_FULL_N ;
  // actionvalue method client1_request_get
  assign client1_request_get =
	     { CASE_fork1_d0FD_OUT_BITS_39_TO_38_0_fork1_d0F_ETC__q1,
	       fork1_d0F_D_OUT[37:30],
	       CASE_fork1_d0FD_OUT_BITS_29_TO_28_0_fork1_d0F_ETC__q2,
	       fork1_d0F_D_OUT[27:20],
	       CASE_fork1_d0FD_OUT_BITS_19_TO_18_0_fork1_d0F_ETC__q3,
	       fork1_d0F_D_OUT[17:10],
	       CASE_fork1_d0FD_OUT_BITS_9_TO_8_0_fork1_d0FD_ETC__q4,
	       fork1_d0F_D_OUT[7:0] } ;
  assign RDY_client1_request_get = fork1_d0F_EMPTY_N ;
  // action method client1_response_put
  assign RDY_client1_response_put = merge1_fi0_FULL_N ;
  // actionvalue method client2_request_get
  assign client2_request_get =
	     { CASE_fork1_d1FD_OUT_BITS_39_TO_38_0_fork1_d1F_ETC__q13,
	       fork1_d1F_D_OUT[37:30],
	       CASE_fork1_d1FD_OUT_BITS_29_TO_28_0_fork1_d1F_ETC__q14,
	       fork1_d1F_D_OUT[27:20],
	       CASE_fork1_d1FD_OUT_BITS_19_TO_18_0_fork1_d1F_ETC__q15,
	       fork1_d1F_D_OUT[17:10],
	       CASE_fork1_d1FD_OUT_BITS_9_TO_8_0_fork1_d1FD_ETC__q16,
	       fork1_d1F_D_OUT[7:0] } ;
  assign RDY_client2_request_get = fork1_d1F_EMPTY_N ;
  // action method client2_response_put
  assign RDY_client2_response_put = merge1_fi1_FULL_N ;
  // submodule fork0_d0F
  FIFO2 #(.width(32'd40), .guarded(32'd1)) fork0_d0F(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(fork0_d0F_D_IN),
						     .ENQ(fork0_d0F_ENQ),
						     .DEQ(fork0_d0F_DEQ),
						     .CLR(fork0_d0F_CLR),
						     .D_OUT(fork0_d0F_D_OUT),
						     .FULL_N(fork0_d0F_FULL_N),
						     .EMPTY_N(fork0_d0F_EMPTY_N));
  // submodule fork0_d1F
  FIFO2 #(.width(32'd40), .guarded(32'd1)) fork0_d1F(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(fork0_d1F_D_IN),
						     .ENQ(fork0_d1F_ENQ),
						     .DEQ(fork0_d1F_DEQ),
						     .CLR(fork0_d1F_CLR),
						     .D_OUT(fork0_d1F_D_OUT),
						     .FULL_N(fork0_d1F_FULL_N),
						     .EMPTY_N(fork0_d1F_EMPTY_N));
  // submodule fork0_srcF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) fork0_srcF(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(fork0_srcF_D_IN),
						      .ENQ(fork0_srcF_ENQ),
						      .DEQ(fork0_srcF_DEQ),
						      .CLR(fork0_srcF_CLR),
						      .D_OUT(fork0_srcF_D_OUT),
						      .FULL_N(fork0_srcF_FULL_N),
						      .EMPTY_N(fork0_srcF_EMPTY_N));
  // submodule fork1_d0F
  FIFO2 #(.width(32'd40), .guarded(32'd1)) fork1_d0F(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(fork1_d0F_D_IN),
						     .ENQ(fork1_d0F_ENQ),
						     .DEQ(fork1_d0F_DEQ),
						     .CLR(fork1_d0F_CLR),
						     .D_OUT(fork1_d0F_D_OUT),
						     .FULL_N(fork1_d0F_FULL_N),
						     .EMPTY_N(fork1_d0F_EMPTY_N));
  // submodule fork1_d1F
  FIFO2 #(.width(32'd40), .guarded(32'd1)) fork1_d1F(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(fork1_d1F_D_IN),
						     .ENQ(fork1_d1F_ENQ),
						     .DEQ(fork1_d1F_DEQ),
						     .CLR(fork1_d1F_CLR),
						     .D_OUT(fork1_d1F_D_OUT),
						     .FULL_N(fork1_d1F_FULL_N),
						     .EMPTY_N(fork1_d1F_EMPTY_N));
  // submodule fork1_srcF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) fork1_srcF(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(fork1_srcF_D_IN),
						      .ENQ(fork1_srcF_ENQ),
						      .DEQ(fork1_srcF_DEQ),
						      .CLR(fork1_srcF_CLR),
						      .D_OUT(fork1_srcF_D_OUT),
						      .FULL_N(fork1_srcF_FULL_N),
						      .EMPTY_N(fork1_srcF_EMPTY_N));
  // submodule merge0_fi0
  FIFO2 #(.width(32'd40), .guarded(32'd1)) merge0_fi0(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(merge0_fi0_D_IN),
						      .ENQ(merge0_fi0_ENQ),
						      .DEQ(merge0_fi0_DEQ),
						      .CLR(merge0_fi0_CLR),
						      .D_OUT(merge0_fi0_D_OUT),
						      .FULL_N(merge0_fi0_FULL_N),
						      .EMPTY_N(merge0_fi0_EMPTY_N));
  // submodule merge0_fi1
  FIFO2 #(.width(32'd40), .guarded(32'd1)) merge0_fi1(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(merge0_fi1_D_IN),
						      .ENQ(merge0_fi1_ENQ),
						      .DEQ(merge0_fi1_DEQ),
						      .CLR(merge0_fi1_CLR),
						      .D_OUT(merge0_fi1_D_OUT),
						      .FULL_N(merge0_fi1_FULL_N),
						      .EMPTY_N(merge0_fi1_EMPTY_N));
  // submodule merge0_fo
  FIFO2 #(.width(32'd40), .guarded(32'd1)) merge0_fo(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(merge0_fo_D_IN),
						     .ENQ(merge0_fo_ENQ),
						     .DEQ(merge0_fo_DEQ),
						     .CLR(merge0_fo_CLR),
						     .D_OUT(merge0_fo_D_OUT),
						     .FULL_N(merge0_fo_FULL_N),
						     .EMPTY_N(merge0_fo_EMPTY_N));
  // submodule merge1_fi0
  FIFO2 #(.width(32'd40), .guarded(32'd1)) merge1_fi0(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(merge1_fi0_D_IN),
						      .ENQ(merge1_fi0_ENQ),
						      .DEQ(merge1_fi0_DEQ),
						      .CLR(merge1_fi0_CLR),
						      .D_OUT(merge1_fi0_D_OUT),
						      .FULL_N(merge1_fi0_FULL_N),
						      .EMPTY_N(merge1_fi0_EMPTY_N));
  // submodule merge1_fi1
  FIFO2 #(.width(32'd40), .guarded(32'd1)) merge1_fi1(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(merge1_fi1_D_IN),
						      .ENQ(merge1_fi1_ENQ),
						      .DEQ(merge1_fi1_DEQ),
						      .CLR(merge1_fi1_CLR),
						      .D_OUT(merge1_fi1_D_OUT),
						      .FULL_N(merge1_fi1_FULL_N),
						      .EMPTY_N(merge1_fi1_EMPTY_N));
  // submodule merge1_fo
  FIFO2 #(.width(32'd40), .guarded(32'd1)) merge1_fo(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(merge1_fo_D_IN),
						     .ENQ(merge1_fo_ENQ),
						     .DEQ(merge1_fo_DEQ),
						     .CLR(merge1_fo_CLR),
						     .D_OUT(merge1_fo_D_OUT),
						     .FULL_N(merge1_fo_FULL_N),
						     .EMPTY_N(merge1_fo_EMPTY_N));
  // rule RL_merge0_fi0_advance
  assign WILL_FIRE_RL_merge0_fi0_advance =
	     merge0_fi0_EMPTY_N && merge0_fo_FULL_N && !merge0_fi1Active &&
	     !WILL_FIRE_RL_merge0_arbitrate ;
  // rule RL_merge0_fi1_advance
  assign WILL_FIRE_RL_merge0_fi1_advance =
	     merge0_fo_FULL_N && merge0_fi1_EMPTY_N && !merge0_fi0Active &&
	     !WILL_FIRE_RL_merge0_fi0_advance &&
	     !WILL_FIRE_RL_merge0_arbitrate ;
  // rule RL_merge0_arbitrate
  assign WILL_FIRE_RL_merge0_arbitrate =
	     merge0_fo_FULL_N &&
	     IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_i_notE_ETC___d118 &&
	     merge0_fi0_EMPTY_N &&
	     merge0_fi1_EMPTY_N &&
	     !merge0_fi0Active &&
	     !merge0_fi1Active ;
  // rule RL_merge1_fi0_advance
  assign WILL_FIRE_RL_merge1_fi0_advance =
	     merge1_fi0_EMPTY_N && merge1_fo_FULL_N && !merge1_fi1Active &&
	     !WILL_FIRE_RL_merge1_arbitrate ;
  // rule RL_merge1_fi1_advance
  assign WILL_FIRE_RL_merge1_fi1_advance =
	     merge1_fo_FULL_N && merge1_fi1_EMPTY_N && !merge1_fi0Active &&
	     !WILL_FIRE_RL_merge1_fi0_advance &&
	     !WILL_FIRE_RL_merge1_arbitrate ;
  // rule RL_merge1_arbitrate
  assign WILL_FIRE_RL_merge1_arbitrate =
	     merge1_fo_FULL_N &&
	     IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_i_notE_ETC___d289 &&
	     merge1_fi0_EMPTY_N &&
	     merge1_fi1_EMPTY_N &&
	     !merge1_fi0Active &&
	     !merge1_fi1Active ;
  // rule RL_fork0_stage
  assign WILL_FIRE_RL_fork0_stage =
	     fork0_srcF_EMPTY_N && !fork0_staged && !fork0_decided ;
  // rule RL_fork0_decide
  assign WILL_FIRE_RL_fork0_decide =
	     fork0_srcF_EMPTY_N && fork0_staged && !fork0_decided ;
  // rule RL_fork0_egress
  assign WILL_FIRE_RL_fork0_egress =
	     NOT_fork0_stageSent_98_99_OR_fork0_srcF_i_notE_ETC___d505 &&
	     fork0_staged &&
	     fork0_decided ;
  // rule RL_fork1_stage
  assign WILL_FIRE_RL_fork1_stage =
	     fork1_srcF_EMPTY_N && !fork1_staged && !fork1_decided ;
  // rule RL_fork1_decide
  assign WILL_FIRE_RL_fork1_decide =
	     fork1_srcF_EMPTY_N && fork1_staged && !fork1_decided ;
  // rule RL_fork1_egress
  assign WILL_FIRE_RL_fork1_egress =
	     NOT_fork1_stageSent_47_48_OR_fork1_srcF_i_notE_ETC___d754 &&
	     fork1_staged &&
	     fork1_decided ;
  // inputs to muxes for submodule ports
  assign MUX_fork0_decided_write_1__SEL_1 =
	     WILL_FIRE_RL_fork0_egress && fork0_stageSent &&
	     (fork0_srcF_D_OUT[9:8] != 2'd0 ||
	      fork0_srcF_D_OUT[19:18] != 2'd0 ||
	      fork0_srcF_D_OUT[29:28] != 2'd0 ||
	      fork0_srcF_D_OUT[39:38] != 2'd0) ;
  assign MUX_fork0_ptr_write_1__SEL_1 =
	     WILL_FIRE_RL_fork0_egress &&
	     (fork0_srcF_D_OUT[9:8] != 2'd0 ||
	      fork0_srcF_D_OUT[19:18] != 2'd0 ||
	      fork0_srcF_D_OUT[29:28] != 2'd0 ||
	      fork0_srcF_D_OUT[39:38] != 2'd0 ||
	      !fork0_stageSent) ;
  assign MUX_fork1_decided_write_1__SEL_1 =
	     WILL_FIRE_RL_fork1_egress && fork1_stageSent &&
	     (fork1_srcF_D_OUT[9:8] != 2'd0 ||
	      fork1_srcF_D_OUT[19:18] != 2'd0 ||
	      fork1_srcF_D_OUT[29:28] != 2'd0 ||
	      fork1_srcF_D_OUT[39:38] != 2'd0) ;
  assign MUX_fork1_ptr_write_1__SEL_1 =
	     WILL_FIRE_RL_fork1_egress &&
	     (fork1_srcF_D_OUT[9:8] != 2'd0 ||
	      fork1_srcF_D_OUT[19:18] != 2'd0 ||
	      fork1_srcF_D_OUT[29:28] != 2'd0 ||
	      fork1_srcF_D_OUT[39:38] != 2'd0 ||
	      !fork1_stageSent) ;
  assign MUX_merge0_fi0Active_write_1__SEL_1 =
	     WILL_FIRE_RL_merge0_arbitrate && merge0_fi0HasPrio ;
  assign MUX_merge0_fi1Active_write_1__SEL_1 =
	     WILL_FIRE_RL_merge0_arbitrate && !merge0_fi0HasPrio ;
  assign MUX_merge1_fi0Active_write_1__SEL_1 =
	     WILL_FIRE_RL_merge1_arbitrate && merge1_fi0HasPrio ;
  assign MUX_merge1_fi1Active_write_1__SEL_1 =
	     WILL_FIRE_RL_merge1_arbitrate && !merge1_fi0HasPrio ;
  assign MUX_fork0_ptr_write_1__VAL_1 =
	     fork0_stageSent ? 3'd0 : fork0_ptr_90_PLUS_1___d491 ;
  assign MUX_fork0_ptr_write_1__VAL_2 =
	     (fork0_srcF_D_OUT[9:8] != 2'd0 ||
	      fork0_srcF_D_OUT[19:18] != 2'd0 ||
	      fork0_srcF_D_OUT[29:28] != 2'd0 ||
	      fork0_srcF_D_OUT[39:38] != 2'd0) ?
	       3'd0 :
	       fork0_ptr_90_PLUS_1___d491 ;
  assign MUX_fork1_ptr_write_1__VAL_1 =
	     fork1_stageSent ? 3'd0 : fork1_ptr_39_PLUS_1___d740 ;
  assign MUX_fork1_ptr_write_1__VAL_2 =
	     (fork1_srcF_D_OUT[9:8] != 2'd0 ||
	      fork1_srcF_D_OUT[19:18] != 2'd0 ||
	      fork1_srcF_D_OUT[29:28] != 2'd0 ||
	      fork1_srcF_D_OUT[39:38] != 2'd0) ?
	       3'd0 :
	       fork1_ptr_39_PLUS_1___d740 ;
  assign MUX_merge0_fi0Active_write_1__VAL_1 =
	     IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d158 &&
	     IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d148 &&
	     IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d137 &&
	     IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d127 ;
  assign MUX_merge0_fi0Active_write_1__VAL_2 =
	     merge0_fi0_D_OUT[9:8] == 2'd0 &&
	     merge0_fi0_D_OUT[19:18] == 2'd0 &&
	     merge0_fi0_D_OUT[29:28] == 2'd0 &&
	     merge0_fi0_D_OUT[39:38] == 2'd0 ;
  assign MUX_merge0_fi1Active_write_1__VAL_2 =
	     merge0_fi1_D_OUT[9:8] == 2'd0 &&
	     merge0_fi1_D_OUT[19:18] == 2'd0 &&
	     merge0_fi1_D_OUT[29:28] == 2'd0 &&
	     merge0_fi1_D_OUT[39:38] == 2'd0 ;
  assign MUX_merge0_fo_enq_1__VAL_1 =
	     { CASE_merge0_fi0D_OUT_BITS_39_TO_38_0_merge0_f_ETC__q49,
	       merge0_fi0_D_OUT[37:30],
	       CASE_merge0_fi0D_OUT_BITS_29_TO_28_0_merge0_f_ETC__q50,
	       merge0_fi0_D_OUT[27:20],
	       CASE_merge0_fi0D_OUT_BITS_19_TO_18_0_merge0_f_ETC__q51,
	       merge0_fi0_D_OUT[17:10],
	       CASE_merge0_fi0D_OUT_BITS_9_TO_8_0_merge0_fi0_ETC__q52,
	       merge0_fi0_D_OUT[7:0] } ;
  assign MUX_merge0_fo_enq_1__VAL_2 =
	     { CASE_merge0_fi1D_OUT_BITS_39_TO_38_0_merge0_f_ETC__q53,
	       merge0_fi1_D_OUT[37:30],
	       CASE_merge0_fi1D_OUT_BITS_29_TO_28_0_merge0_f_ETC__q54,
	       merge0_fi1_D_OUT[27:20],
	       CASE_merge0_fi1D_OUT_BITS_19_TO_18_0_merge0_f_ETC__q55,
	       merge0_fi1_D_OUT[17:10],
	       CASE_merge0_fi1D_OUT_BITS_9_TO_8_0_merge0_fi1_ETC__q56,
	       merge0_fi1_D_OUT[7:0] } ;
  assign MUX_merge0_fo_enq_1__VAL_3 =
	     { IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d147,
	       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d148 ?
		 { 2'd0,
		   IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d149 } :
		 IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d156,
	       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d158 ?
		 { 2'd0,
		   IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d159 } :
		 IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d166 } ;
  assign MUX_merge1_fi0Active_write_1__VAL_1 =
	     IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d329 &&
	     IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d319 &&
	     IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d308 &&
	     IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d298 ;
  assign MUX_merge1_fi0Active_write_1__VAL_2 =
	     merge1_fi0_D_OUT[9:8] == 2'd0 &&
	     merge1_fi0_D_OUT[19:18] == 2'd0 &&
	     merge1_fi0_D_OUT[29:28] == 2'd0 &&
	     merge1_fi0_D_OUT[39:38] == 2'd0 ;
  assign MUX_merge1_fi1Active_write_1__VAL_2 =
	     merge1_fi1_D_OUT[9:8] == 2'd0 &&
	     merge1_fi1_D_OUT[19:18] == 2'd0 &&
	     merge1_fi1_D_OUT[29:28] == 2'd0 &&
	     merge1_fi1_D_OUT[39:38] == 2'd0 ;
  assign MUX_merge1_fo_enq_1__VAL_1 =
	     { CASE_merge1_fi0D_OUT_BITS_39_TO_38_0_merge1_f_ETC__q57,
	       merge1_fi0_D_OUT[37:30],
	       CASE_merge1_fi0D_OUT_BITS_29_TO_28_0_merge1_f_ETC__q58,
	       merge1_fi0_D_OUT[27:20],
	       CASE_merge1_fi0D_OUT_BITS_19_TO_18_0_merge1_f_ETC__q59,
	       merge1_fi0_D_OUT[17:10],
	       CASE_merge1_fi0D_OUT_BITS_9_TO_8_0_merge1_fi0_ETC__q60,
	       merge1_fi0_D_OUT[7:0] } ;
  assign MUX_merge1_fo_enq_1__VAL_2 =
	     { CASE_merge1_fi1D_OUT_BITS_39_TO_38_0_merge1_f_ETC__q61,
	       merge1_fi1_D_OUT[37:30],
	       CASE_merge1_fi1D_OUT_BITS_29_TO_28_0_merge1_f_ETC__q62,
	       merge1_fi1_D_OUT[27:20],
	       CASE_merge1_fi1D_OUT_BITS_19_TO_18_0_merge1_f_ETC__q63,
	       merge1_fi1_D_OUT[17:10],
	       CASE_merge1_fi1D_OUT_BITS_9_TO_8_0_merge1_fi1_ETC__q64,
	       merge1_fi1_D_OUT[7:0] } ;
  assign MUX_merge1_fo_enq_1__VAL_3 =
	     { IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d318,
	       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d319 ?
		 { 2'd0,
		   IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d320 } :
		 IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d327,
	       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d329 ?
		 { 2'd0,
		   IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d330 } :
		 IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d337 } ;
  // register fork0_decided
  assign fork0_decided_D_IN = !MUX_fork0_decided_write_1__SEL_1 ;
  assign fork0_decided_EN =
	     WILL_FIRE_RL_fork0_egress && fork0_stageSent &&
	     (fork0_srcF_D_OUT[9:8] != 2'd0 ||
	      fork0_srcF_D_OUT[19:18] != 2'd0 ||
	      fork0_srcF_D_OUT[29:28] != 2'd0 ||
	      fork0_srcF_D_OUT[39:38] != 2'd0) ||
	     WILL_FIRE_RL_fork0_decide ;
  // register fork0_match0
  assign fork0_match0_D_IN = et0 == seen__h14989 ;
  assign fork0_match0_EN = WILL_FIRE_RL_fork0_decide ;
  // register fork0_ptr
  always@(MUX_fork0_ptr_write_1__SEL_1 or
	  MUX_fork0_ptr_write_1__VAL_1 or
	  WILL_FIRE_RL_fork0_stage or
	  MUX_fork0_ptr_write_1__VAL_2 or WILL_FIRE_RL_fork0_decide)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fork0_ptr_write_1__SEL_1:
	  fork0_ptr_D_IN = MUX_fork0_ptr_write_1__VAL_1;
      WILL_FIRE_RL_fork0_stage: fork0_ptr_D_IN = MUX_fork0_ptr_write_1__VAL_2;
      WILL_FIRE_RL_fork0_decide: fork0_ptr_D_IN = 3'd0;
      default: fork0_ptr_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fork0_ptr_EN =
	     WILL_FIRE_RL_fork0_egress &&
	     (fork0_srcF_D_OUT[9:8] != 2'd0 ||
	      fork0_srcF_D_OUT[19:18] != 2'd0 ||
	      fork0_srcF_D_OUT[29:28] != 2'd0 ||
	      fork0_srcF_D_OUT[39:38] != 2'd0 ||
	      !fork0_stageSent) ||
	     WILL_FIRE_RL_fork0_stage ||
	     WILL_FIRE_RL_fork0_decide ;
  // register fork0_sr
  assign fork0_sr_D_IN =
	     { IF_fork0_srcF_first__50_BITS_39_TO_38_51_EQ_0__ETC___d393,
	       CASE_fork0_sr_BITS_119_TO_118_0_fork0_sr_BITS__ETC__q65,
	       fork0_sr[117:110],
	       CASE_fork0_sr_BITS_109_TO_108_0_fork0_sr_BITS__ETC__q66,
	       fork0_sr[107:100],
	       CASE_fork0_sr_BITS_99_TO_98_0_fork0_sr_BITS_99_ETC__q67,
	       fork0_sr[97:90],
	       CASE_fork0_sr_BITS_89_TO_88_0_fork0_sr_BITS_89_ETC__q68,
	       fork0_sr[87:80],
	       CASE_fork0_sr_BITS_79_TO_78_0_fork0_sr_BITS_79_ETC__q69,
	       fork0_sr[77:70],
	       CASE_fork0_sr_BITS_69_TO_68_0_fork0_sr_BITS_69_ETC__q70,
	       fork0_sr[67:60],
	       CASE_fork0_sr_BITS_59_TO_58_0_fork0_sr_BITS_59_ETC__q71,
	       fork0_sr[57:50],
	       CASE_fork0_sr_BITS_49_TO_48_0_fork0_sr_BITS_49_ETC__q72,
	       fork0_sr[47:40] } ;
  assign fork0_sr_EN = WILL_FIRE_RL_fork0_stage ;
  // register fork0_stageSent
  assign fork0_stageSent_D_IN = !fork0_stageSent && fork0_ptr == 3'd2 ;
  assign fork0_stageSent_EN = MUX_fork0_ptr_write_1__SEL_1 ;
  // register fork0_staged
  assign fork0_staged_D_IN =
	     !MUX_fork0_decided_write_1__SEL_1 && fork0_ptr == 3'd2 ;
  assign fork0_staged_EN =
	     WILL_FIRE_RL_fork0_egress && fork0_stageSent &&
	     (fork0_srcF_D_OUT[9:8] != 2'd0 ||
	      fork0_srcF_D_OUT[19:18] != 2'd0 ||
	      fork0_srcF_D_OUT[29:28] != 2'd0 ||
	      fork0_srcF_D_OUT[39:38] != 2'd0) ||
	     WILL_FIRE_RL_fork0_stage ;
  // register fork1_decided
  assign fork1_decided_D_IN = !MUX_fork1_decided_write_1__SEL_1 ;
  assign fork1_decided_EN =
	     WILL_FIRE_RL_fork1_egress && fork1_stageSent &&
	     (fork1_srcF_D_OUT[9:8] != 2'd0 ||
	      fork1_srcF_D_OUT[19:18] != 2'd0 ||
	      fork1_srcF_D_OUT[29:28] != 2'd0 ||
	      fork1_srcF_D_OUT[39:38] != 2'd0) ||
	     WILL_FIRE_RL_fork1_decide ;
  // register fork1_match0
  assign fork1_match0_D_IN = did == seen__h24820 ;
  assign fork1_match0_EN = WILL_FIRE_RL_fork1_decide ;
  // register fork1_ptr
  always@(MUX_fork1_ptr_write_1__SEL_1 or
	  MUX_fork1_ptr_write_1__VAL_1 or
	  WILL_FIRE_RL_fork1_stage or
	  MUX_fork1_ptr_write_1__VAL_2 or WILL_FIRE_RL_fork1_decide)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fork1_ptr_write_1__SEL_1:
	  fork1_ptr_D_IN = MUX_fork1_ptr_write_1__VAL_1;
      WILL_FIRE_RL_fork1_stage: fork1_ptr_D_IN = MUX_fork1_ptr_write_1__VAL_2;
      WILL_FIRE_RL_fork1_decide: fork1_ptr_D_IN = 3'd0;
      default: fork1_ptr_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fork1_ptr_EN =
	     WILL_FIRE_RL_fork1_egress &&
	     (fork1_srcF_D_OUT[9:8] != 2'd0 ||
	      fork1_srcF_D_OUT[19:18] != 2'd0 ||
	      fork1_srcF_D_OUT[29:28] != 2'd0 ||
	      fork1_srcF_D_OUT[39:38] != 2'd0 ||
	      !fork1_stageSent) ||
	     WILL_FIRE_RL_fork1_stage ||
	     WILL_FIRE_RL_fork1_decide ;
  // register fork1_sr
  assign fork1_sr_D_IN =
	     { IF_fork1_srcF_first__99_BITS_39_TO_38_00_EQ_0__ETC___d642,
	       CASE_fork1_sr_BITS_119_TO_118_0_fork1_sr_BITS__ETC__q77,
	       fork1_sr[117:110],
	       CASE_fork1_sr_BITS_109_TO_108_0_fork1_sr_BITS__ETC__q78,
	       fork1_sr[107:100],
	       CASE_fork1_sr_BITS_99_TO_98_0_fork1_sr_BITS_99_ETC__q79,
	       fork1_sr[97:90],
	       CASE_fork1_sr_BITS_89_TO_88_0_fork1_sr_BITS_89_ETC__q80,
	       fork1_sr[87:80],
	       CASE_fork1_sr_BITS_79_TO_78_0_fork1_sr_BITS_79_ETC__q81,
	       fork1_sr[77:70],
	       CASE_fork1_sr_BITS_69_TO_68_0_fork1_sr_BITS_69_ETC__q82,
	       fork1_sr[67:60],
	       CASE_fork1_sr_BITS_59_TO_58_0_fork1_sr_BITS_59_ETC__q83,
	       fork1_sr[57:50],
	       CASE_fork1_sr_BITS_49_TO_48_0_fork1_sr_BITS_49_ETC__q84,
	       fork1_sr[47:40] } ;
  assign fork1_sr_EN = WILL_FIRE_RL_fork1_stage ;
  // register fork1_stageSent
  assign fork1_stageSent_D_IN = !fork1_stageSent && fork1_ptr == 3'd2 ;
  assign fork1_stageSent_EN = MUX_fork1_ptr_write_1__SEL_1 ;
  // register fork1_staged
  assign fork1_staged_D_IN =
	     !MUX_fork1_decided_write_1__SEL_1 && fork1_ptr == 3'd2 ;
  assign fork1_staged_EN =
	     WILL_FIRE_RL_fork1_egress && fork1_stageSent &&
	     (fork1_srcF_D_OUT[9:8] != 2'd0 ||
	      fork1_srcF_D_OUT[19:18] != 2'd0 ||
	      fork1_srcF_D_OUT[29:28] != 2'd0 ||
	      fork1_srcF_D_OUT[39:38] != 2'd0) ||
	     WILL_FIRE_RL_fork1_stage ;
  // register merge0_fi0Active
  assign merge0_fi0Active_D_IN =
	     MUX_merge0_fi0Active_write_1__SEL_1 ?
	       MUX_merge0_fi0Active_write_1__VAL_1 :
	       MUX_merge0_fi0Active_write_1__VAL_2 ;
  assign merge0_fi0Active_EN =
	     WILL_FIRE_RL_merge0_arbitrate && merge0_fi0HasPrio ||
	     WILL_FIRE_RL_merge0_fi0_advance ;
  // register merge0_fi0HasPrio
  always@(WILL_FIRE_RL_merge0_arbitrate or
	  merge0_fi0HasPrio or
	  WILL_FIRE_RL_merge0_fi0_advance or WILL_FIRE_RL_merge0_fi1_advance)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_merge0_arbitrate:
	  merge0_fi0HasPrio_D_IN = !merge0_fi0HasPrio;
      WILL_FIRE_RL_merge0_fi0_advance: merge0_fi0HasPrio_D_IN = 1'd0;
      WILL_FIRE_RL_merge0_fi1_advance: merge0_fi0HasPrio_D_IN = 1'd1;
      default: merge0_fi0HasPrio_D_IN = 1'b0 /* unspecified value */ ;
    endcase
  end
  assign merge0_fi0HasPrio_EN =
	     WILL_FIRE_RL_merge0_arbitrate ||
	     WILL_FIRE_RL_merge0_fi0_advance ||
	     WILL_FIRE_RL_merge0_fi1_advance ;
  // register merge0_fi1Active
  assign merge0_fi1Active_D_IN =
	     MUX_merge0_fi1Active_write_1__SEL_1 ?
	       MUX_merge0_fi0Active_write_1__VAL_1 :
	       MUX_merge0_fi1Active_write_1__VAL_2 ;
  assign merge0_fi1Active_EN =
	     WILL_FIRE_RL_merge0_arbitrate && !merge0_fi0HasPrio ||
	     WILL_FIRE_RL_merge0_fi1_advance ;
  // register merge1_fi0Active
  assign merge1_fi0Active_D_IN =
	     MUX_merge1_fi0Active_write_1__SEL_1 ?
	       MUX_merge1_fi0Active_write_1__VAL_1 :
	       MUX_merge1_fi0Active_write_1__VAL_2 ;
  assign merge1_fi0Active_EN =
	     WILL_FIRE_RL_merge1_arbitrate && merge1_fi0HasPrio ||
	     WILL_FIRE_RL_merge1_fi0_advance ;
  // register merge1_fi0HasPrio
  always@(WILL_FIRE_RL_merge1_arbitrate or
	  merge1_fi0HasPrio or
	  WILL_FIRE_RL_merge1_fi0_advance or WILL_FIRE_RL_merge1_fi1_advance)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_merge1_arbitrate:
	  merge1_fi0HasPrio_D_IN = !merge1_fi0HasPrio;
      WILL_FIRE_RL_merge1_fi0_advance: merge1_fi0HasPrio_D_IN = 1'd0;
      WILL_FIRE_RL_merge1_fi1_advance: merge1_fi0HasPrio_D_IN = 1'd1;
      default: merge1_fi0HasPrio_D_IN = 1'b0 /* unspecified value */ ;
    endcase
  end
  assign merge1_fi0HasPrio_EN =
	     WILL_FIRE_RL_merge1_arbitrate ||
	     WILL_FIRE_RL_merge1_fi0_advance ||
	     WILL_FIRE_RL_merge1_fi1_advance ;
  // register merge1_fi1Active
  assign merge1_fi1Active_D_IN =
	     MUX_merge1_fi1Active_write_1__SEL_1 ?
	       MUX_merge1_fi0Active_write_1__VAL_1 :
	       MUX_merge1_fi1Active_write_1__VAL_2 ;
  assign merge1_fi1Active_EN =
	     WILL_FIRE_RL_merge1_arbitrate && !merge1_fi0HasPrio ||
	     WILL_FIRE_RL_merge1_fi1_advance ;
  // submodule fork0_d0F
  assign fork0_d0F_D_IN =
	     fork0_stageSent ?
	       IF_fork0_srcF_first__50_BITS_39_TO_38_51_EQ_0__ETC___d393 :
	       { IF_SEL_ARR_fork0_sr_94_BITS_39_TO_38_08_EQ_0_0_ETC___d526,
		 IF_SEL_ARR_fork0_sr_94_BITS_29_TO_28_27_EQ_0_2_ETC___d545,
		 IF_SEL_ARR_fork0_sr_94_BITS_19_TO_18_47_EQ_0_4_ETC___d565,
		 IF_SEL_ARR_fork0_sr_94_BITS_9_TO_8_66_EQ_0_67__ETC___d584 } ;
  assign fork0_d0F_ENQ = WILL_FIRE_RL_fork0_egress && fork0_match0 ;
  assign fork0_d0F_DEQ = EN_client0_request_get ;
  assign fork0_d0F_CLR = 1'b0 ;
  // submodule fork0_d1F
  assign fork0_d1F_D_IN = fork0_d0F_D_IN ;
  assign fork0_d1F_ENQ = WILL_FIRE_RL_fork0_egress && !fork0_match0 ;
  assign fork0_d1F_DEQ = fork0_d1F_EMPTY_N && fork1_srcF_FULL_N ;
  assign fork0_d1F_CLR = 1'b0 ;
  // submodule fork0_srcF
  assign fork0_srcF_D_IN =
	     { CASE_server_request_put_BITS_39_TO_38_0_server_ETC__q73,
	       server_request_put[37:30],
	       CASE_server_request_put_BITS_29_TO_28_0_server_ETC__q74,
	       server_request_put[27:20],
	       CASE_server_request_put_BITS_19_TO_18_0_server_ETC__q75,
	       server_request_put[17:10],
	       CASE_server_request_put_BITS_9_TO_8_0_server_r_ETC__q76,
	       server_request_put[7:0] } ;
  assign fork0_srcF_ENQ = EN_server_request_put ;
  assign fork0_srcF_DEQ =
	     WILL_FIRE_RL_fork0_egress && fork0_stageSent ||
	     WILL_FIRE_RL_fork0_stage ;
  assign fork0_srcF_CLR = 1'b0 ;
  // submodule fork1_d0F
  assign fork1_d0F_D_IN =
	     fork1_stageSent ?
	       IF_fork1_srcF_first__99_BITS_39_TO_38_00_EQ_0__ETC___d642 :
	       { IF_SEL_ARR_fork1_sr_43_BITS_39_TO_38_57_EQ_0_5_ETC___d775,
		 IF_SEL_ARR_fork1_sr_43_BITS_29_TO_28_76_EQ_0_7_ETC___d794,
		 IF_SEL_ARR_fork1_sr_43_BITS_19_TO_18_96_EQ_0_9_ETC___d814,
		 IF_SEL_ARR_fork1_sr_43_BITS_9_TO_8_15_EQ_0_16__ETC___d833 } ;
  assign fork1_d0F_ENQ = WILL_FIRE_RL_fork1_egress && fork1_match0 ;
  assign fork1_d0F_DEQ = EN_client1_request_get ;
  assign fork1_d0F_CLR = 1'b0 ;
  // submodule fork1_d1F
  assign fork1_d1F_D_IN = fork1_d0F_D_IN ;
  assign fork1_d1F_ENQ = WILL_FIRE_RL_fork1_egress && !fork1_match0 ;
  assign fork1_d1F_DEQ = EN_client2_request_get ;
  assign fork1_d1F_CLR = 1'b0 ;
  // submodule fork1_srcF
  assign fork1_srcF_D_IN =
	     { CASE_fork0_d1FD_OUT_BITS_39_TO_38_0_fork0_d1F_ETC__q85,
	       fork0_d1F_D_OUT[37:30],
	       CASE_fork0_d1FD_OUT_BITS_29_TO_28_0_fork0_d1F_ETC__q86,
	       fork0_d1F_D_OUT[27:20],
	       CASE_fork0_d1FD_OUT_BITS_19_TO_18_0_fork0_d1F_ETC__q87,
	       fork0_d1F_D_OUT[17:10],
	       CASE_fork0_d1FD_OUT_BITS_9_TO_8_0_fork0_d1FD_ETC__q88,
	       fork0_d1F_D_OUT[7:0] } ;
  assign fork1_srcF_ENQ = fork0_d1F_EMPTY_N && fork1_srcF_FULL_N ;
  assign fork1_srcF_DEQ =
	     WILL_FIRE_RL_fork1_egress && fork1_stageSent ||
	     WILL_FIRE_RL_fork1_stage ;
  assign fork1_srcF_CLR = 1'b0 ;
  // submodule merge0_fi0
  assign merge0_fi0_D_IN =
	     { CASE_client0_response_put_BITS_39_TO_38_0_clie_ETC__q89,
	       client0_response_put[37:30],
	       CASE_client0_response_put_BITS_29_TO_28_0_clie_ETC__q90,
	       client0_response_put[27:20],
	       CASE_client0_response_put_BITS_19_TO_18_0_clie_ETC__q91,
	       client0_response_put[17:10],
	       CASE_client0_response_put_BITS_9_TO_8_0_client_ETC__q92,
	       client0_response_put[7:0] } ;
  assign merge0_fi0_ENQ = EN_client0_response_put ;
  assign merge0_fi0_DEQ =
	     WILL_FIRE_RL_merge0_arbitrate && merge0_fi0HasPrio ||
	     WILL_FIRE_RL_merge0_fi0_advance ;
  assign merge0_fi0_CLR = 1'b0 ;
  // submodule merge0_fi1
  assign merge0_fi1_D_IN =
	     { CASE_merge1_foD_OUT_BITS_39_TO_38_0_merge1_fo_ETC__q93,
	       merge1_fo_D_OUT[37:30],
	       CASE_merge1_foD_OUT_BITS_29_TO_28_0_merge1_fo_ETC__q94,
	       merge1_fo_D_OUT[27:20],
	       CASE_merge1_foD_OUT_BITS_19_TO_18_0_merge1_fo_ETC__q95,
	       merge1_fo_D_OUT[17:10],
	       CASE_merge1_foD_OUT_BITS_9_TO_8_0_merge1_foD_ETC__q96,
	       merge1_fo_D_OUT[7:0] } ;
  assign merge0_fi1_ENQ = merge1_fo_EMPTY_N && merge0_fi1_FULL_N ;
  assign merge0_fi1_DEQ =
	     WILL_FIRE_RL_merge0_arbitrate && !merge0_fi0HasPrio ||
	     WILL_FIRE_RL_merge0_fi1_advance ;
  assign merge0_fi1_CLR = 1'b0 ;
  // submodule merge0_fo
  always@(WILL_FIRE_RL_merge0_fi0_advance or
	  MUX_merge0_fo_enq_1__VAL_1 or
	  WILL_FIRE_RL_merge0_fi1_advance or
	  MUX_merge0_fo_enq_1__VAL_2 or
	  WILL_FIRE_RL_merge0_arbitrate or MUX_merge0_fo_enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_merge0_fi0_advance:
	  merge0_fo_D_IN = MUX_merge0_fo_enq_1__VAL_1;
      WILL_FIRE_RL_merge0_fi1_advance:
	  merge0_fo_D_IN = MUX_merge0_fo_enq_1__VAL_2;
      WILL_FIRE_RL_merge0_arbitrate:
	  merge0_fo_D_IN = MUX_merge0_fo_enq_1__VAL_3;
      default: merge0_fo_D_IN = 40'hAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign merge0_fo_ENQ =
	     WILL_FIRE_RL_merge0_fi0_advance ||
	     WILL_FIRE_RL_merge0_fi1_advance ||
	     WILL_FIRE_RL_merge0_arbitrate ;
  assign merge0_fo_DEQ = EN_server_response_get ;
  assign merge0_fo_CLR = 1'b0 ;
  // submodule merge1_fi0
  assign merge1_fi0_D_IN =
	     { CASE_client1_response_put_BITS_39_TO_38_0_clie_ETC__q97,
	       client1_response_put[37:30],
	       CASE_client1_response_put_BITS_29_TO_28_0_clie_ETC__q98,
	       client1_response_put[27:20],
	       CASE_client1_response_put_BITS_19_TO_18_0_clie_ETC__q99,
	       client1_response_put[17:10],
	       CASE_client1_response_put_BITS_9_TO_8_0_client_ETC__q100,
	       client1_response_put[7:0] } ;
  assign merge1_fi0_ENQ = EN_client1_response_put ;
  assign merge1_fi0_DEQ =
	     WILL_FIRE_RL_merge1_arbitrate && merge1_fi0HasPrio ||
	     WILL_FIRE_RL_merge1_fi0_advance ;
  assign merge1_fi0_CLR = 1'b0 ;
  // submodule merge1_fi1
  assign merge1_fi1_D_IN =
	     { CASE_client2_response_put_BITS_39_TO_38_0_clie_ETC__q101,
	       client2_response_put[37:30],
	       CASE_client2_response_put_BITS_29_TO_28_0_clie_ETC__q102,
	       client2_response_put[27:20],
	       CASE_client2_response_put_BITS_19_TO_18_0_clie_ETC__q103,
	       client2_response_put[17:10],
	       CASE_client2_response_put_BITS_9_TO_8_0_client_ETC__q104,
	       client2_response_put[7:0] } ;
  assign merge1_fi1_ENQ = EN_client2_response_put ;
  assign merge1_fi1_DEQ =
	     WILL_FIRE_RL_merge1_arbitrate && !merge1_fi0HasPrio ||
	     WILL_FIRE_RL_merge1_fi1_advance ;
  assign merge1_fi1_CLR = 1'b0 ;
  // submodule merge1_fo
  always@(WILL_FIRE_RL_merge1_fi0_advance or
	  MUX_merge1_fo_enq_1__VAL_1 or
	  WILL_FIRE_RL_merge1_fi1_advance or
	  MUX_merge1_fo_enq_1__VAL_2 or
	  WILL_FIRE_RL_merge1_arbitrate or MUX_merge1_fo_enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_merge1_fi0_advance:
	  merge1_fo_D_IN = MUX_merge1_fo_enq_1__VAL_1;
      WILL_FIRE_RL_merge1_fi1_advance:
	  merge1_fo_D_IN = MUX_merge1_fo_enq_1__VAL_2;
      WILL_FIRE_RL_merge1_arbitrate:
	  merge1_fo_D_IN = MUX_merge1_fo_enq_1__VAL_3;
      default: merge1_fo_D_IN = 40'hAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign merge1_fo_ENQ =
	     WILL_FIRE_RL_merge1_fi0_advance ||
	     WILL_FIRE_RL_merge1_fi1_advance ||
	     WILL_FIRE_RL_merge1_arbitrate ;
  assign merge1_fo_DEQ = merge1_fo_EMPTY_N && merge0_fi1_FULL_N ;
  assign merge1_fo_CLR = 1'b0 ;
  // remaining internal signals
  assign IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d133 =
	     (merge0_fi0HasPrio ?
		merge0_fi0_D_OUT[39:38] == 2'd2 :
		merge0_fi1_D_OUT[39:38] == 2'd2) ?
	       2'd2 :
	       2'd3 ;
  assign IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d135 =
	     (merge0_fi0HasPrio ?
		merge0_fi0_D_OUT[39:38] == 2'd1 :
		merge0_fi1_D_OUT[39:38] == 2'd1) ?
	       { 2'd1,
		 IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d128 } :
	       { IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d133,
		 IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d128 } ;
  assign IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d143 =
	     (merge0_fi0HasPrio ?
		merge0_fi0_D_OUT[29:28] == 2'd2 :
		merge0_fi1_D_OUT[29:28] == 2'd2) ?
	       2'd2 :
	       2'd3 ;
  assign IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d145 =
	     (merge0_fi0HasPrio ?
		merge0_fi0_D_OUT[29:28] == 2'd1 :
		merge0_fi1_D_OUT[29:28] == 2'd1) ?
	       { 2'd1,
		 IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d138 } :
	       { IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d143,
		 IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d138 } ;
  assign IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d147 =
	     { IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d127 ?
		 { 2'd0,
		   IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d128 } :
		 IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d135,
	       IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d137 ?
		 { 2'd0,
		   IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d138 } :
		 IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d145 } ;
  assign IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d154 =
	     (merge0_fi0HasPrio ?
		merge0_fi0_D_OUT[19:18] == 2'd2 :
		merge0_fi1_D_OUT[19:18] == 2'd2) ?
	       2'd2 :
	       2'd3 ;
  assign IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d156 =
	     (merge0_fi0HasPrio ?
		merge0_fi0_D_OUT[19:18] == 2'd1 :
		merge0_fi1_D_OUT[19:18] == 2'd1) ?
	       { 2'd1,
		 IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d149 } :
	       { IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d154,
		 IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d149 } ;
  assign IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d164 =
	     (merge0_fi0HasPrio ?
		merge0_fi0_D_OUT[9:8] == 2'd2 :
		merge0_fi1_D_OUT[9:8] == 2'd2) ?
	       2'd2 :
	       2'd3 ;
  assign IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d166 =
	     (merge0_fi0HasPrio ?
		merge0_fi0_D_OUT[9:8] == 2'd1 :
		merge0_fi1_D_OUT[9:8] == 2'd1) ?
	       { 2'd1,
		 IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d159 } :
	       { IF_IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_fir_ETC___d164,
		 IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d159 } ;
  assign IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d304 =
	     (merge1_fi0HasPrio ?
		merge1_fi0_D_OUT[39:38] == 2'd2 :
		merge1_fi1_D_OUT[39:38] == 2'd2) ?
	       2'd2 :
	       2'd3 ;
  assign IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d306 =
	     (merge1_fi0HasPrio ?
		merge1_fi0_D_OUT[39:38] == 2'd1 :
		merge1_fi1_D_OUT[39:38] == 2'd1) ?
	       { 2'd1,
		 IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d299 } :
	       { IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d304,
		 IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d299 } ;
  assign IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d314 =
	     (merge1_fi0HasPrio ?
		merge1_fi0_D_OUT[29:28] == 2'd2 :
		merge1_fi1_D_OUT[29:28] == 2'd2) ?
	       2'd2 :
	       2'd3 ;
  assign IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d316 =
	     (merge1_fi0HasPrio ?
		merge1_fi0_D_OUT[29:28] == 2'd1 :
		merge1_fi1_D_OUT[29:28] == 2'd1) ?
	       { 2'd1,
		 IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d309 } :
	       { IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d314,
		 IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d309 } ;
  assign IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d318 =
	     { IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d298 ?
		 { 2'd0,
		   IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d299 } :
		 IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d306,
	       IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d308 ?
		 { 2'd0,
		   IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d309 } :
		 IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d316 } ;
  assign IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d325 =
	     (merge1_fi0HasPrio ?
		merge1_fi0_D_OUT[19:18] == 2'd2 :
		merge1_fi1_D_OUT[19:18] == 2'd2) ?
	       2'd2 :
	       2'd3 ;
  assign IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d327 =
	     (merge1_fi0HasPrio ?
		merge1_fi0_D_OUT[19:18] == 2'd1 :
		merge1_fi1_D_OUT[19:18] == 2'd1) ?
	       { 2'd1,
		 IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d320 } :
	       { IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d325,
		 IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d320 } ;
  assign IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d335 =
	     (merge1_fi0HasPrio ?
		merge1_fi0_D_OUT[9:8] == 2'd2 :
		merge1_fi1_D_OUT[9:8] == 2'd2) ?
	       2'd2 :
	       2'd3 ;
  assign IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d337 =
	     (merge1_fi0HasPrio ?
		merge1_fi0_D_OUT[9:8] == 2'd1 :
		merge1_fi1_D_OUT[9:8] == 2'd1) ?
	       { 2'd1,
		 IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d330 } :
	       { IF_IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_fir_ETC___d335,
		 IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d330 } ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_19_TO_18_47_EQ_0_4_ETC___d565 =
	     CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_0_1_ETC__q39 ?
	       { 2'd0,
		 SEL_ARR_fork0_sr_94_BITS_17_TO_10_51_fork0_sr__ETC___d553 } :
	       IF_SEL_ARR_fork0_sr_94_BITS_19_TO_18_47_EQ_1_5_ETC___d564 ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_19_TO_18_47_EQ_1_5_ETC___d564 =
	     CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_1_1_ETC__q38 ?
	       { 2'd1,
		 SEL_ARR_fork0_sr_94_BITS_17_TO_10_51_fork0_sr__ETC___d553 } :
	       IF_SEL_ARR_fork0_sr_94_BITS_19_TO_18_47_EQ_2_5_ETC___d563 ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_19_TO_18_47_EQ_2_5_ETC___d563 =
	     { CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_2_1_ETC__q37 ?
		 2'd2 :
		 2'd3,
	       SEL_ARR_fork0_sr_94_BITS_17_TO_10_51_fork0_sr__ETC___d553 } ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_29_TO_28_27_EQ_0_2_ETC___d545 =
	     CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_0_1_ETC__q22 ?
	       { 2'd0,
		 SEL_ARR_fork0_sr_94_BITS_27_TO_20_31_fork0_sr__ETC___d533 } :
	       IF_SEL_ARR_fork0_sr_94_BITS_29_TO_28_27_EQ_1_3_ETC___d544 ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_29_TO_28_27_EQ_1_3_ETC___d544 =
	     CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_1_1_ETC__q21 ?
	       { 2'd1,
		 SEL_ARR_fork0_sr_94_BITS_27_TO_20_31_fork0_sr__ETC___d533 } :
	       IF_SEL_ARR_fork0_sr_94_BITS_29_TO_28_27_EQ_2_3_ETC___d543 ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_29_TO_28_27_EQ_2_3_ETC___d543 =
	     { CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_2_1_ETC__q20 ?
		 2'd2 :
		 2'd3,
	       SEL_ARR_fork0_sr_94_BITS_27_TO_20_31_fork0_sr__ETC___d533 } ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_39_TO_38_08_EQ_0_0_ETC___d526 =
	     CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_0_1_ETC__q19 ?
	       { 2'd0,
		 SEL_ARR_fork0_sr_94_BITS_37_TO_30_12_fork0_sr__ETC___d514 } :
	       IF_SEL_ARR_fork0_sr_94_BITS_39_TO_38_08_EQ_1_1_ETC___d525 ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_39_TO_38_08_EQ_1_1_ETC___d525 =
	     CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_1_1_ETC__q18 ?
	       { 2'd1,
		 SEL_ARR_fork0_sr_94_BITS_37_TO_30_12_fork0_sr__ETC___d514 } :
	       IF_SEL_ARR_fork0_sr_94_BITS_39_TO_38_08_EQ_2_2_ETC___d524 ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_39_TO_38_08_EQ_2_2_ETC___d524 =
	     { CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_2_1_ETC__q17 ?
		 2'd2 :
		 2'd3,
	       SEL_ARR_fork0_sr_94_BITS_37_TO_30_12_fork0_sr__ETC___d514 } ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_9_TO_8_66_EQ_0_67__ETC___d584 =
	     CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q42 ?
	       { 2'd0,
		 SEL_ARR_fork0_sr_94_BITS_7_TO_0_70_fork0_sr_94_ETC___d572 } :
	       IF_SEL_ARR_fork0_sr_94_BITS_9_TO_8_66_EQ_1_74__ETC___d583 ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_9_TO_8_66_EQ_1_74__ETC___d583 =
	     CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q41 ?
	       { 2'd1,
		 SEL_ARR_fork0_sr_94_BITS_7_TO_0_70_fork0_sr_94_ETC___d572 } :
	       IF_SEL_ARR_fork0_sr_94_BITS_9_TO_8_66_EQ_2_78__ETC___d582 ;
  assign IF_SEL_ARR_fork0_sr_94_BITS_9_TO_8_66_EQ_2_78__ETC___d582 =
	     { CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q40 ?
		 2'd2 :
		 2'd3,
	       SEL_ARR_fork0_sr_94_BITS_7_TO_0_70_fork0_sr_94_ETC___d572 } ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_19_TO_18_96_EQ_0_9_ETC___d814 =
	     CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_0_1_ETC__q45 ?
	       { 2'd0,
		 SEL_ARR_fork1_sr_43_BITS_17_TO_10_00_fork1_sr__ETC___d802 } :
	       IF_SEL_ARR_fork1_sr_43_BITS_19_TO_18_96_EQ_1_0_ETC___d813 ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_19_TO_18_96_EQ_1_0_ETC___d813 =
	     CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_1_1_ETC__q44 ?
	       { 2'd1,
		 SEL_ARR_fork1_sr_43_BITS_17_TO_10_00_fork1_sr__ETC___d802 } :
	       IF_SEL_ARR_fork1_sr_43_BITS_19_TO_18_96_EQ_2_0_ETC___d812 ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_19_TO_18_96_EQ_2_0_ETC___d812 =
	     { CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_2_1_ETC__q43 ?
		 2'd2 :
		 2'd3,
	       SEL_ARR_fork1_sr_43_BITS_17_TO_10_00_fork1_sr__ETC___d802 } ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_29_TO_28_76_EQ_0_7_ETC___d794 =
	     CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_0_1_ETC__q36 ?
	       { 2'd0,
		 SEL_ARR_fork1_sr_43_BITS_27_TO_20_80_fork1_sr__ETC___d782 } :
	       IF_SEL_ARR_fork1_sr_43_BITS_29_TO_28_76_EQ_1_8_ETC___d793 ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_29_TO_28_76_EQ_1_8_ETC___d793 =
	     CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_1_1_ETC__q35 ?
	       { 2'd1,
		 SEL_ARR_fork1_sr_43_BITS_27_TO_20_80_fork1_sr__ETC___d782 } :
	       IF_SEL_ARR_fork1_sr_43_BITS_29_TO_28_76_EQ_2_8_ETC___d792 ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_29_TO_28_76_EQ_2_8_ETC___d792 =
	     { CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_2_1_ETC__q34 ?
		 2'd2 :
		 2'd3,
	       SEL_ARR_fork1_sr_43_BITS_27_TO_20_80_fork1_sr__ETC___d782 } ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_39_TO_38_57_EQ_0_5_ETC___d775 =
	     CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_0_1_ETC__q33 ?
	       { 2'd0,
		 SEL_ARR_fork1_sr_43_BITS_37_TO_30_61_fork1_sr__ETC___d763 } :
	       IF_SEL_ARR_fork1_sr_43_BITS_39_TO_38_57_EQ_1_6_ETC___d774 ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_39_TO_38_57_EQ_1_6_ETC___d774 =
	     CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_1_1_ETC__q32 ?
	       { 2'd1,
		 SEL_ARR_fork1_sr_43_BITS_37_TO_30_61_fork1_sr__ETC___d763 } :
	       IF_SEL_ARR_fork1_sr_43_BITS_39_TO_38_57_EQ_2_6_ETC___d773 ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_39_TO_38_57_EQ_2_6_ETC___d773 =
	     { CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_2_1_ETC__q31 ?
		 2'd2 :
		 2'd3,
	       SEL_ARR_fork1_sr_43_BITS_37_TO_30_61_fork1_sr__ETC___d763 } ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_9_TO_8_15_EQ_0_16__ETC___d833 =
	     CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q48 ?
	       { 2'd0,
		 SEL_ARR_fork1_sr_43_BITS_7_TO_0_19_fork1_sr_43_ETC___d821 } :
	       IF_SEL_ARR_fork1_sr_43_BITS_9_TO_8_15_EQ_1_23__ETC___d832 ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_9_TO_8_15_EQ_1_23__ETC___d832 =
	     CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q47 ?
	       { 2'd1,
		 SEL_ARR_fork1_sr_43_BITS_7_TO_0_19_fork1_sr_43_ETC___d821 } :
	       IF_SEL_ARR_fork1_sr_43_BITS_9_TO_8_15_EQ_2_27__ETC___d831 ;
  assign IF_SEL_ARR_fork1_sr_43_BITS_9_TO_8_15_EQ_2_27__ETC___d831 =
	     { CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q46 ?
		 2'd2 :
		 2'd3,
	       SEL_ARR_fork1_sr_43_BITS_7_TO_0_19_fork1_sr_43_ETC___d821 } ;
  assign IF_fork0_srcF_first__50_BITS_39_TO_38_51_EQ_0__ETC___d393 =
	     { CASE_fork0_srcFD_OUT_BITS_39_TO_38_0_fork0_sr_ETC__q27,
	       fork0_srcF_D_OUT[37:30],
	       CASE_fork0_srcFD_OUT_BITS_29_TO_28_0_fork0_sr_ETC__q28,
	       fork0_srcF_D_OUT[27:20],
	       CASE_fork0_srcFD_OUT_BITS_19_TO_18_0_fork0_sr_ETC__q29,
	       fork0_srcF_D_OUT[17:10],
	       CASE_fork0_srcFD_OUT_BITS_9_TO_8_0_fork0_srcF_ETC__q30,
	       fork0_srcF_D_OUT[7:0] } ;
  assign IF_fork1_srcF_first__99_BITS_39_TO_38_00_EQ_0__ETC___d642 =
	     { CASE_fork1_srcFD_OUT_BITS_39_TO_38_0_fork1_sr_ETC__q23,
	       fork1_srcF_D_OUT[37:30],
	       CASE_fork1_srcFD_OUT_BITS_29_TO_28_0_fork1_sr_ETC__q24,
	       fork1_srcF_D_OUT[27:20],
	       CASE_fork1_srcFD_OUT_BITS_19_TO_18_0_fork1_sr_ETC__q25,
	       fork1_srcF_D_OUT[17:10],
	       CASE_fork1_srcFD_OUT_BITS_9_TO_8_0_fork1_srcF_ETC__q26,
	       fork1_srcF_D_OUT[7:0] } ;
  assign IF_merge0_fi0HasPrio_06_THEN_NOT_merge0_fi0_i__ETC___d113 =
	     merge0_fi0HasPrio ?
	       !merge0_fi0_EMPTY_N || merge0_fi0_D_OUT[9:8] != 2'd0 :
	       !merge0_fi1_EMPTY_N || merge0_fi1_D_OUT[9:8] != 2'd0 ;
  assign IF_merge0_fi0HasPrio_06_THEN_NOT_merge0_fi0_i__ETC___d115 =
	     IF_merge0_fi0HasPrio_06_THEN_NOT_merge0_fi0_i__ETC___d113 ||
	     (merge0_fi0HasPrio ? merge0_fi0_EMPTY_N : merge0_fi1_EMPTY_N) ;
  assign IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d127 =
	     merge0_fi0HasPrio ?
	       merge0_fi0_D_OUT[39:38] == 2'd0 :
	       merge0_fi1_D_OUT[39:38] == 2'd0 ;
  assign IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d128 =
	     merge0_fi0HasPrio ?
	       merge0_fi0_D_OUT[37:30] :
	       merge0_fi1_D_OUT[37:30] ;
  assign IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d137 =
	     merge0_fi0HasPrio ?
	       merge0_fi0_D_OUT[29:28] == 2'd0 :
	       merge0_fi1_D_OUT[29:28] == 2'd0 ;
  assign IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d138 =
	     merge0_fi0HasPrio ?
	       merge0_fi0_D_OUT[27:20] :
	       merge0_fi1_D_OUT[27:20] ;
  assign IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d148 =
	     merge0_fi0HasPrio ?
	       merge0_fi0_D_OUT[19:18] == 2'd0 :
	       merge0_fi1_D_OUT[19:18] == 2'd0 ;
  assign IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d149 =
	     merge0_fi0HasPrio ?
	       merge0_fi0_D_OUT[17:10] :
	       merge0_fi1_D_OUT[17:10] ;
  assign IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d158 =
	     merge0_fi0HasPrio ?
	       merge0_fi0_D_OUT[9:8] == 2'd0 :
	       merge0_fi1_D_OUT[9:8] == 2'd0 ;
  assign IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_first__ETC___d159 =
	     merge0_fi0HasPrio ?
	       merge0_fi0_D_OUT[7:0] :
	       merge0_fi1_D_OUT[7:0] ;
  assign IF_merge0_fi0HasPrio_06_THEN_merge0_fi0_i_notE_ETC___d118 =
	     merge0_fi0HasPrio ?
	       merge0_fi0_EMPTY_N &&
	       IF_merge0_fi0HasPrio_06_THEN_NOT_merge0_fi0_i__ETC___d115 :
	       merge0_fi1_EMPTY_N &&
	       IF_merge0_fi0HasPrio_06_THEN_NOT_merge0_fi0_i__ETC___d115 ;
  assign IF_merge1_fi0HasPrio_77_THEN_NOT_merge1_fi0_i__ETC___d284 =
	     merge1_fi0HasPrio ?
	       !merge1_fi0_EMPTY_N || merge1_fi0_D_OUT[9:8] != 2'd0 :
	       !merge1_fi1_EMPTY_N || merge1_fi1_D_OUT[9:8] != 2'd0 ;
  assign IF_merge1_fi0HasPrio_77_THEN_NOT_merge1_fi0_i__ETC___d286 =
	     IF_merge1_fi0HasPrio_77_THEN_NOT_merge1_fi0_i__ETC___d284 ||
	     (merge1_fi0HasPrio ? merge1_fi0_EMPTY_N : merge1_fi1_EMPTY_N) ;
  assign IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d298 =
	     merge1_fi0HasPrio ?
	       merge1_fi0_D_OUT[39:38] == 2'd0 :
	       merge1_fi1_D_OUT[39:38] == 2'd0 ;
  assign IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d299 =
	     merge1_fi0HasPrio ?
	       merge1_fi0_D_OUT[37:30] :
	       merge1_fi1_D_OUT[37:30] ;
  assign IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d308 =
	     merge1_fi0HasPrio ?
	       merge1_fi0_D_OUT[29:28] == 2'd0 :
	       merge1_fi1_D_OUT[29:28] == 2'd0 ;
  assign IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d309 =
	     merge1_fi0HasPrio ?
	       merge1_fi0_D_OUT[27:20] :
	       merge1_fi1_D_OUT[27:20] ;
  assign IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d319 =
	     merge1_fi0HasPrio ?
	       merge1_fi0_D_OUT[19:18] == 2'd0 :
	       merge1_fi1_D_OUT[19:18] == 2'd0 ;
  assign IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d320 =
	     merge1_fi0HasPrio ?
	       merge1_fi0_D_OUT[17:10] :
	       merge1_fi1_D_OUT[17:10] ;
  assign IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d329 =
	     merge1_fi0HasPrio ?
	       merge1_fi0_D_OUT[9:8] == 2'd0 :
	       merge1_fi1_D_OUT[9:8] == 2'd0 ;
  assign IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_first__ETC___d330 =
	     merge1_fi0HasPrio ?
	       merge1_fi0_D_OUT[7:0] :
	       merge1_fi1_D_OUT[7:0] ;
  assign IF_merge1_fi0HasPrio_77_THEN_merge1_fi0_i_notE_ETC___d289 =
	     merge1_fi0HasPrio ?
	       merge1_fi0_EMPTY_N &&
	       IF_merge1_fi0HasPrio_77_THEN_NOT_merge1_fi0_i__ETC___d286 :
	       merge1_fi1_EMPTY_N &&
	       IF_merge1_fi0HasPrio_77_THEN_NOT_merge1_fi0_i__ETC___d286 ;
  assign NOT_fork0_stageSent_98_99_OR_fork0_srcF_i_notE_ETC___d505 =
	     (!fork0_stageSent || fork0_srcF_EMPTY_N) &&
	     (fork0_match0 ? fork0_d0F_FULL_N : fork0_d1F_FULL_N) ;
  assign NOT_fork1_stageSent_47_48_OR_fork1_srcF_i_notE_ETC___d754 =
	     (!fork1_stageSent || fork1_srcF_EMPTY_N) &&
	     (fork1_match0 ? fork1_d0F_FULL_N : fork1_d1F_FULL_N) ;
  assign fork0_ptr_90_PLUS_1___d491 = fork0_ptr + 3'd1 ;
  assign fork1_ptr_39_PLUS_1___d740 = fork1_ptr + 3'd1 ;
  assign seen__h14989 = { fork0_srcF_D_OUT[7:0], fork0_srcF_D_OUT[17:10] } ;
  assign seen__h24820 = { fork1_srcF_D_OUT[27:20], fork1_srcF_D_OUT[37:30] } ;
  always@(fork1_d0F_D_OUT)
  begin
    case (fork1_d0F_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_d0FD_OUT_BITS_39_TO_38_0_fork1_d0F_ETC__q1 =
	      fork1_d0F_D_OUT[39:38];
      2'd3: CASE_fork1_d0FD_OUT_BITS_39_TO_38_0_fork1_d0F_ETC__q1 = 2'd3;
    endcase
  end
  always@(fork1_d0F_D_OUT)
  begin
    case (fork1_d0F_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_d0FD_OUT_BITS_29_TO_28_0_fork1_d0F_ETC__q2 =
	      fork1_d0F_D_OUT[29:28];
      2'd3: CASE_fork1_d0FD_OUT_BITS_29_TO_28_0_fork1_d0F_ETC__q2 = 2'd3;
    endcase
  end
  always@(fork1_d0F_D_OUT)
  begin
    case (fork1_d0F_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_d0FD_OUT_BITS_19_TO_18_0_fork1_d0F_ETC__q3 =
	      fork1_d0F_D_OUT[19:18];
      2'd3: CASE_fork1_d0FD_OUT_BITS_19_TO_18_0_fork1_d0F_ETC__q3 = 2'd3;
    endcase
  end
  always@(fork1_d0F_D_OUT)
  begin
    case (fork1_d0F_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_d0FD_OUT_BITS_9_TO_8_0_fork1_d0FD_ETC__q4 =
	      fork1_d0F_D_OUT[9:8];
      2'd3: CASE_fork1_d0FD_OUT_BITS_9_TO_8_0_fork1_d0FD_ETC__q4 = 2'd3;
    endcase
  end
  always@(fork0_d0F_D_OUT)
  begin
    case (fork0_d0F_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_d0FD_OUT_BITS_39_TO_38_0_fork0_d0F_ETC__q5 =
	      fork0_d0F_D_OUT[39:38];
      2'd3: CASE_fork0_d0FD_OUT_BITS_39_TO_38_0_fork0_d0F_ETC__q5 = 2'd3;
    endcase
  end
  always@(fork0_d0F_D_OUT)
  begin
    case (fork0_d0F_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_d0FD_OUT_BITS_29_TO_28_0_fork0_d0F_ETC__q6 =
	      fork0_d0F_D_OUT[29:28];
      2'd3: CASE_fork0_d0FD_OUT_BITS_29_TO_28_0_fork0_d0F_ETC__q6 = 2'd3;
    endcase
  end
  always@(fork0_d0F_D_OUT)
  begin
    case (fork0_d0F_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_d0FD_OUT_BITS_19_TO_18_0_fork0_d0F_ETC__q7 =
	      fork0_d0F_D_OUT[19:18];
      2'd3: CASE_fork0_d0FD_OUT_BITS_19_TO_18_0_fork0_d0F_ETC__q7 = 2'd3;
    endcase
  end
  always@(fork0_d0F_D_OUT)
  begin
    case (fork0_d0F_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_d0FD_OUT_BITS_9_TO_8_0_fork0_d0FD_ETC__q8 =
	      fork0_d0F_D_OUT[9:8];
      2'd3: CASE_fork0_d0FD_OUT_BITS_9_TO_8_0_fork0_d0FD_ETC__q8 = 2'd3;
    endcase
  end
  always@(merge0_fo_D_OUT)
  begin
    case (merge0_fo_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_foD_OUT_BITS_39_TO_38_0_merge0_fo_ETC__q9 =
	      merge0_fo_D_OUT[39:38];
      2'd3: CASE_merge0_foD_OUT_BITS_39_TO_38_0_merge0_fo_ETC__q9 = 2'd3;
    endcase
  end
  always@(merge0_fo_D_OUT)
  begin
    case (merge0_fo_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_foD_OUT_BITS_29_TO_28_0_merge0_fo_ETC__q10 =
	      merge0_fo_D_OUT[29:28];
      2'd3: CASE_merge0_foD_OUT_BITS_29_TO_28_0_merge0_fo_ETC__q10 = 2'd3;
    endcase
  end
  always@(merge0_fo_D_OUT)
  begin
    case (merge0_fo_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_foD_OUT_BITS_19_TO_18_0_merge0_fo_ETC__q11 =
	      merge0_fo_D_OUT[19:18];
      2'd3: CASE_merge0_foD_OUT_BITS_19_TO_18_0_merge0_fo_ETC__q11 = 2'd3;
    endcase
  end
  always@(merge0_fo_D_OUT)
  begin
    case (merge0_fo_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_foD_OUT_BITS_9_TO_8_0_merge0_foD_ETC__q12 =
	      merge0_fo_D_OUT[9:8];
      2'd3: CASE_merge0_foD_OUT_BITS_9_TO_8_0_merge0_foD_ETC__q12 = 2'd3;
    endcase
  end
  always@(fork1_d1F_D_OUT)
  begin
    case (fork1_d1F_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_d1FD_OUT_BITS_39_TO_38_0_fork1_d1F_ETC__q13 =
	      fork1_d1F_D_OUT[39:38];
      2'd3: CASE_fork1_d1FD_OUT_BITS_39_TO_38_0_fork1_d1F_ETC__q13 = 2'd3;
    endcase
  end
  always@(fork1_d1F_D_OUT)
  begin
    case (fork1_d1F_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_d1FD_OUT_BITS_29_TO_28_0_fork1_d1F_ETC__q14 =
	      fork1_d1F_D_OUT[29:28];
      2'd3: CASE_fork1_d1FD_OUT_BITS_29_TO_28_0_fork1_d1F_ETC__q14 = 2'd3;
    endcase
  end
  always@(fork1_d1F_D_OUT)
  begin
    case (fork1_d1F_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_d1FD_OUT_BITS_19_TO_18_0_fork1_d1F_ETC__q15 =
	      fork1_d1F_D_OUT[19:18];
      2'd3: CASE_fork1_d1FD_OUT_BITS_19_TO_18_0_fork1_d1F_ETC__q15 = 2'd3;
    endcase
  end
  always@(fork1_d1F_D_OUT)
  begin
    case (fork1_d1F_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_d1FD_OUT_BITS_9_TO_8_0_fork1_d1FD_ETC__q16 =
	      fork1_d1F_D_OUT[9:8];
      2'd3: CASE_fork1_d1FD_OUT_BITS_9_TO_8_0_fork1_d1FD_ETC__q16 = 2'd3;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  SEL_ARR_fork0_sr_94_BITS_37_TO_30_12_fork0_sr__ETC___d514 =
	      fork0_sr[37:30];
      3'd1:
	  SEL_ARR_fork0_sr_94_BITS_37_TO_30_12_fork0_sr__ETC___d514 =
	      fork0_sr[77:70];
      3'd2:
	  SEL_ARR_fork0_sr_94_BITS_37_TO_30_12_fork0_sr__ETC___d514 =
	      fork0_sr[117:110];
      default: SEL_ARR_fork0_sr_94_BITS_37_TO_30_12_fork0_sr__ETC___d514 =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  SEL_ARR_fork0_sr_94_BITS_27_TO_20_31_fork0_sr__ETC___d533 =
	      fork0_sr[27:20];
      3'd1:
	  SEL_ARR_fork0_sr_94_BITS_27_TO_20_31_fork0_sr__ETC___d533 =
	      fork0_sr[67:60];
      3'd2:
	  SEL_ARR_fork0_sr_94_BITS_27_TO_20_31_fork0_sr__ETC___d533 =
	      fork0_sr[107:100];
      default: SEL_ARR_fork0_sr_94_BITS_27_TO_20_31_fork0_sr__ETC___d533 =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_2_1_ETC__q17 =
	      fork0_sr[39:38] == 2'd2;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_2_1_ETC__q17 =
	      fork0_sr[79:78] == 2'd2;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_2_1_ETC__q17 =
	      fork0_sr[119:118] == 2'd2;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_2_1_ETC__q17 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_1_1_ETC__q18 =
	      fork0_sr[39:38] == 2'd1;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_1_1_ETC__q18 =
	      fork0_sr[79:78] == 2'd1;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_1_1_ETC__q18 =
	      fork0_sr[119:118] == 2'd1;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_1_1_ETC__q18 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_0_1_ETC__q19 =
	      fork0_sr[39:38] == 2'd0;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_0_1_ETC__q19 =
	      fork0_sr[79:78] == 2'd0;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_0_1_ETC__q19 =
	      fork0_sr[119:118] == 2'd0;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_39_TO_38_EQ_0_1_ETC__q19 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  SEL_ARR_fork0_sr_94_BITS_17_TO_10_51_fork0_sr__ETC___d553 =
	      fork0_sr[17:10];
      3'd1:
	  SEL_ARR_fork0_sr_94_BITS_17_TO_10_51_fork0_sr__ETC___d553 =
	      fork0_sr[57:50];
      3'd2:
	  SEL_ARR_fork0_sr_94_BITS_17_TO_10_51_fork0_sr__ETC___d553 =
	      fork0_sr[97:90];
      default: SEL_ARR_fork0_sr_94_BITS_17_TO_10_51_fork0_sr__ETC___d553 =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  SEL_ARR_fork0_sr_94_BITS_7_TO_0_70_fork0_sr_94_ETC___d572 =
	      fork0_sr[7:0];
      3'd1:
	  SEL_ARR_fork0_sr_94_BITS_7_TO_0_70_fork0_sr_94_ETC___d572 =
	      fork0_sr[47:40];
      3'd2:
	  SEL_ARR_fork0_sr_94_BITS_7_TO_0_70_fork0_sr_94_ETC___d572 =
	      fork0_sr[87:80];
      default: SEL_ARR_fork0_sr_94_BITS_7_TO_0_70_fork0_sr_94_ETC___d572 =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_2_1_ETC__q20 =
	      fork0_sr[29:28] == 2'd2;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_2_1_ETC__q20 =
	      fork0_sr[69:68] == 2'd2;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_2_1_ETC__q20 =
	      fork0_sr[109:108] == 2'd2;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_2_1_ETC__q20 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_1_1_ETC__q21 =
	      fork0_sr[29:28] == 2'd1;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_1_1_ETC__q21 =
	      fork0_sr[69:68] == 2'd1;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_1_1_ETC__q21 =
	      fork0_sr[109:108] == 2'd1;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_1_1_ETC__q21 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_0_1_ETC__q22 =
	      fork0_sr[29:28] == 2'd0;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_0_1_ETC__q22 =
	      fork0_sr[69:68] == 2'd0;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_0_1_ETC__q22 =
	      fork0_sr[109:108] == 2'd0;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_29_TO_28_EQ_0_1_ETC__q22 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_srcF_D_OUT)
  begin
    case (fork1_srcF_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_srcFD_OUT_BITS_39_TO_38_0_fork1_sr_ETC__q23 =
	      fork1_srcF_D_OUT[39:38];
      2'd3: CASE_fork1_srcFD_OUT_BITS_39_TO_38_0_fork1_sr_ETC__q23 = 2'd3;
    endcase
  end
  always@(fork1_srcF_D_OUT)
  begin
    case (fork1_srcF_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_srcFD_OUT_BITS_29_TO_28_0_fork1_sr_ETC__q24 =
	      fork1_srcF_D_OUT[29:28];
      2'd3: CASE_fork1_srcFD_OUT_BITS_29_TO_28_0_fork1_sr_ETC__q24 = 2'd3;
    endcase
  end
  always@(fork1_srcF_D_OUT)
  begin
    case (fork1_srcF_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_srcFD_OUT_BITS_19_TO_18_0_fork1_sr_ETC__q25 =
	      fork1_srcF_D_OUT[19:18];
      2'd3: CASE_fork1_srcFD_OUT_BITS_19_TO_18_0_fork1_sr_ETC__q25 = 2'd3;
    endcase
  end
  always@(fork1_srcF_D_OUT)
  begin
    case (fork1_srcF_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_srcFD_OUT_BITS_9_TO_8_0_fork1_srcF_ETC__q26 =
	      fork1_srcF_D_OUT[9:8];
      2'd3: CASE_fork1_srcFD_OUT_BITS_9_TO_8_0_fork1_srcF_ETC__q26 = 2'd3;
    endcase
  end
  always@(fork0_srcF_D_OUT)
  begin
    case (fork0_srcF_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_srcFD_OUT_BITS_39_TO_38_0_fork0_sr_ETC__q27 =
	      fork0_srcF_D_OUT[39:38];
      2'd3: CASE_fork0_srcFD_OUT_BITS_39_TO_38_0_fork0_sr_ETC__q27 = 2'd3;
    endcase
  end
  always@(fork0_srcF_D_OUT)
  begin
    case (fork0_srcF_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_srcFD_OUT_BITS_29_TO_28_0_fork0_sr_ETC__q28 =
	      fork0_srcF_D_OUT[29:28];
      2'd3: CASE_fork0_srcFD_OUT_BITS_29_TO_28_0_fork0_sr_ETC__q28 = 2'd3;
    endcase
  end
  always@(fork0_srcF_D_OUT)
  begin
    case (fork0_srcF_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_srcFD_OUT_BITS_19_TO_18_0_fork0_sr_ETC__q29 =
	      fork0_srcF_D_OUT[19:18];
      2'd3: CASE_fork0_srcFD_OUT_BITS_19_TO_18_0_fork0_sr_ETC__q29 = 2'd3;
    endcase
  end
  always@(fork0_srcF_D_OUT)
  begin
    case (fork0_srcF_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_srcFD_OUT_BITS_9_TO_8_0_fork0_srcF_ETC__q30 =
	      fork0_srcF_D_OUT[9:8];
      2'd3: CASE_fork0_srcFD_OUT_BITS_9_TO_8_0_fork0_srcF_ETC__q30 = 2'd3;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  SEL_ARR_fork1_sr_43_BITS_27_TO_20_80_fork1_sr__ETC___d782 =
	      fork1_sr[27:20];
      3'd1:
	  SEL_ARR_fork1_sr_43_BITS_27_TO_20_80_fork1_sr__ETC___d782 =
	      fork1_sr[67:60];
      3'd2:
	  SEL_ARR_fork1_sr_43_BITS_27_TO_20_80_fork1_sr__ETC___d782 =
	      fork1_sr[107:100];
      default: SEL_ARR_fork1_sr_43_BITS_27_TO_20_80_fork1_sr__ETC___d782 =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  SEL_ARR_fork1_sr_43_BITS_37_TO_30_61_fork1_sr__ETC___d763 =
	      fork1_sr[37:30];
      3'd1:
	  SEL_ARR_fork1_sr_43_BITS_37_TO_30_61_fork1_sr__ETC___d763 =
	      fork1_sr[77:70];
      3'd2:
	  SEL_ARR_fork1_sr_43_BITS_37_TO_30_61_fork1_sr__ETC___d763 =
	      fork1_sr[117:110];
      default: SEL_ARR_fork1_sr_43_BITS_37_TO_30_61_fork1_sr__ETC___d763 =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_2_1_ETC__q31 =
	      fork1_sr[39:38] == 2'd2;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_2_1_ETC__q31 =
	      fork1_sr[79:78] == 2'd2;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_2_1_ETC__q31 =
	      fork1_sr[119:118] == 2'd2;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_2_1_ETC__q31 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_1_1_ETC__q32 =
	      fork1_sr[39:38] == 2'd1;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_1_1_ETC__q32 =
	      fork1_sr[79:78] == 2'd1;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_1_1_ETC__q32 =
	      fork1_sr[119:118] == 2'd1;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_1_1_ETC__q32 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_0_1_ETC__q33 =
	      fork1_sr[39:38] == 2'd0;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_0_1_ETC__q33 =
	      fork1_sr[79:78] == 2'd0;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_0_1_ETC__q33 =
	      fork1_sr[119:118] == 2'd0;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_39_TO_38_EQ_0_1_ETC__q33 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  SEL_ARR_fork1_sr_43_BITS_17_TO_10_00_fork1_sr__ETC___d802 =
	      fork1_sr[17:10];
      3'd1:
	  SEL_ARR_fork1_sr_43_BITS_17_TO_10_00_fork1_sr__ETC___d802 =
	      fork1_sr[57:50];
      3'd2:
	  SEL_ARR_fork1_sr_43_BITS_17_TO_10_00_fork1_sr__ETC___d802 =
	      fork1_sr[97:90];
      default: SEL_ARR_fork1_sr_43_BITS_17_TO_10_00_fork1_sr__ETC___d802 =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  SEL_ARR_fork1_sr_43_BITS_7_TO_0_19_fork1_sr_43_ETC___d821 =
	      fork1_sr[7:0];
      3'd1:
	  SEL_ARR_fork1_sr_43_BITS_7_TO_0_19_fork1_sr_43_ETC___d821 =
	      fork1_sr[47:40];
      3'd2:
	  SEL_ARR_fork1_sr_43_BITS_7_TO_0_19_fork1_sr_43_ETC___d821 =
	      fork1_sr[87:80];
      default: SEL_ARR_fork1_sr_43_BITS_7_TO_0_19_fork1_sr_43_ETC___d821 =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_2_1_ETC__q34 =
	      fork1_sr[29:28] == 2'd2;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_2_1_ETC__q34 =
	      fork1_sr[69:68] == 2'd2;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_2_1_ETC__q34 =
	      fork1_sr[109:108] == 2'd2;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_2_1_ETC__q34 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_1_1_ETC__q35 =
	      fork1_sr[29:28] == 2'd1;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_1_1_ETC__q35 =
	      fork1_sr[69:68] == 2'd1;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_1_1_ETC__q35 =
	      fork1_sr[109:108] == 2'd1;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_1_1_ETC__q35 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_0_1_ETC__q36 =
	      fork1_sr[29:28] == 2'd0;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_0_1_ETC__q36 =
	      fork1_sr[69:68] == 2'd0;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_0_1_ETC__q36 =
	      fork1_sr[109:108] == 2'd0;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_29_TO_28_EQ_0_1_ETC__q36 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_2_1_ETC__q37 =
	      fork0_sr[19:18] == 2'd2;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_2_1_ETC__q37 =
	      fork0_sr[59:58] == 2'd2;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_2_1_ETC__q37 =
	      fork0_sr[99:98] == 2'd2;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_2_1_ETC__q37 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_1_1_ETC__q38 =
	      fork0_sr[19:18] == 2'd1;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_1_1_ETC__q38 =
	      fork0_sr[59:58] == 2'd1;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_1_1_ETC__q38 =
	      fork0_sr[99:98] == 2'd1;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_1_1_ETC__q38 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_0_1_ETC__q39 =
	      fork0_sr[19:18] == 2'd0;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_0_1_ETC__q39 =
	      fork0_sr[59:58] == 2'd0;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_0_1_ETC__q39 =
	      fork0_sr[99:98] == 2'd0;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_19_TO_18_EQ_0_1_ETC__q39 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q40 =
	      fork0_sr[9:8] == 2'd2;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q40 =
	      fork0_sr[49:48] == 2'd2;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q40 =
	      fork0_sr[89:88] == 2'd2;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q40 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q41 =
	      fork0_sr[9:8] == 2'd1;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q41 =
	      fork0_sr[49:48] == 2'd1;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q41 =
	      fork0_sr[89:88] == 2'd1;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q41 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork0_ptr or fork0_sr)
  begin
    case (fork0_ptr)
      3'd0:
	  CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q42 =
	      fork0_sr[9:8] == 2'd0;
      3'd1:
	  CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q42 =
	      fork0_sr[49:48] == 2'd0;
      3'd2:
	  CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q42 =
	      fork0_sr[89:88] == 2'd0;
      default: CASE_fork0_ptr_0_fork0_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q42 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_2_1_ETC__q43 =
	      fork1_sr[19:18] == 2'd2;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_2_1_ETC__q43 =
	      fork1_sr[59:58] == 2'd2;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_2_1_ETC__q43 =
	      fork1_sr[99:98] == 2'd2;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_2_1_ETC__q43 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_1_1_ETC__q44 =
	      fork1_sr[19:18] == 2'd1;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_1_1_ETC__q44 =
	      fork1_sr[59:58] == 2'd1;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_1_1_ETC__q44 =
	      fork1_sr[99:98] == 2'd1;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_1_1_ETC__q44 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_0_1_ETC__q45 =
	      fork1_sr[19:18] == 2'd0;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_0_1_ETC__q45 =
	      fork1_sr[59:58] == 2'd0;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_0_1_ETC__q45 =
	      fork1_sr[99:98] == 2'd0;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_19_TO_18_EQ_0_1_ETC__q45 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q46 =
	      fork1_sr[9:8] == 2'd2;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q46 =
	      fork1_sr[49:48] == 2'd2;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q46 =
	      fork1_sr[89:88] == 2'd2;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_2_1_f_ETC__q46 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q47 =
	      fork1_sr[9:8] == 2'd1;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q47 =
	      fork1_sr[49:48] == 2'd1;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q47 =
	      fork1_sr[89:88] == 2'd1;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_1_1_f_ETC__q47 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(fork1_ptr or fork1_sr)
  begin
    case (fork1_ptr)
      3'd0:
	  CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q48 =
	      fork1_sr[9:8] == 2'd0;
      3'd1:
	  CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q48 =
	      fork1_sr[49:48] == 2'd0;
      3'd2:
	  CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q48 =
	      fork1_sr[89:88] == 2'd0;
      default: CASE_fork1_ptr_0_fork1_sr_BITS_9_TO_8_EQ_0_1_f_ETC__q48 =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  always@(merge0_fi0_D_OUT)
  begin
    case (merge0_fi0_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_fi0D_OUT_BITS_39_TO_38_0_merge0_f_ETC__q49 =
	      merge0_fi0_D_OUT[39:38];
      2'd3: CASE_merge0_fi0D_OUT_BITS_39_TO_38_0_merge0_f_ETC__q49 = 2'd3;
    endcase
  end
  always@(merge0_fi0_D_OUT)
  begin
    case (merge0_fi0_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_fi0D_OUT_BITS_29_TO_28_0_merge0_f_ETC__q50 =
	      merge0_fi0_D_OUT[29:28];
      2'd3: CASE_merge0_fi0D_OUT_BITS_29_TO_28_0_merge0_f_ETC__q50 = 2'd3;
    endcase
  end
  always@(merge0_fi0_D_OUT)
  begin
    case (merge0_fi0_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_fi0D_OUT_BITS_19_TO_18_0_merge0_f_ETC__q51 =
	      merge0_fi0_D_OUT[19:18];
      2'd3: CASE_merge0_fi0D_OUT_BITS_19_TO_18_0_merge0_f_ETC__q51 = 2'd3;
    endcase
  end
  always@(merge0_fi0_D_OUT)
  begin
    case (merge0_fi0_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_fi0D_OUT_BITS_9_TO_8_0_merge0_fi0_ETC__q52 =
	      merge0_fi0_D_OUT[9:8];
      2'd3: CASE_merge0_fi0D_OUT_BITS_9_TO_8_0_merge0_fi0_ETC__q52 = 2'd3;
    endcase
  end
  always@(merge0_fi1_D_OUT)
  begin
    case (merge0_fi1_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_fi1D_OUT_BITS_39_TO_38_0_merge0_f_ETC__q53 =
	      merge0_fi1_D_OUT[39:38];
      2'd3: CASE_merge0_fi1D_OUT_BITS_39_TO_38_0_merge0_f_ETC__q53 = 2'd3;
    endcase
  end
  always@(merge0_fi1_D_OUT)
  begin
    case (merge0_fi1_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_fi1D_OUT_BITS_29_TO_28_0_merge0_f_ETC__q54 =
	      merge0_fi1_D_OUT[29:28];
      2'd3: CASE_merge0_fi1D_OUT_BITS_29_TO_28_0_merge0_f_ETC__q54 = 2'd3;
    endcase
  end
  always@(merge0_fi1_D_OUT)
  begin
    case (merge0_fi1_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_fi1D_OUT_BITS_19_TO_18_0_merge0_f_ETC__q55 =
	      merge0_fi1_D_OUT[19:18];
      2'd3: CASE_merge0_fi1D_OUT_BITS_19_TO_18_0_merge0_f_ETC__q55 = 2'd3;
    endcase
  end
  always@(merge0_fi1_D_OUT)
  begin
    case (merge0_fi1_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_merge0_fi1D_OUT_BITS_9_TO_8_0_merge0_fi1_ETC__q56 =
	      merge0_fi1_D_OUT[9:8];
      2'd3: CASE_merge0_fi1D_OUT_BITS_9_TO_8_0_merge0_fi1_ETC__q56 = 2'd3;
    endcase
  end
  always@(merge1_fi0_D_OUT)
  begin
    case (merge1_fi0_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_fi0D_OUT_BITS_39_TO_38_0_merge1_f_ETC__q57 =
	      merge1_fi0_D_OUT[39:38];
      2'd3: CASE_merge1_fi0D_OUT_BITS_39_TO_38_0_merge1_f_ETC__q57 = 2'd3;
    endcase
  end
  always@(merge1_fi0_D_OUT)
  begin
    case (merge1_fi0_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_fi0D_OUT_BITS_29_TO_28_0_merge1_f_ETC__q58 =
	      merge1_fi0_D_OUT[29:28];
      2'd3: CASE_merge1_fi0D_OUT_BITS_29_TO_28_0_merge1_f_ETC__q58 = 2'd3;
    endcase
  end
  always@(merge1_fi0_D_OUT)
  begin
    case (merge1_fi0_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_fi0D_OUT_BITS_19_TO_18_0_merge1_f_ETC__q59 =
	      merge1_fi0_D_OUT[19:18];
      2'd3: CASE_merge1_fi0D_OUT_BITS_19_TO_18_0_merge1_f_ETC__q59 = 2'd3;
    endcase
  end
  always@(merge1_fi0_D_OUT)
  begin
    case (merge1_fi0_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_fi0D_OUT_BITS_9_TO_8_0_merge1_fi0_ETC__q60 =
	      merge1_fi0_D_OUT[9:8];
      2'd3: CASE_merge1_fi0D_OUT_BITS_9_TO_8_0_merge1_fi0_ETC__q60 = 2'd3;
    endcase
  end
  always@(merge1_fi1_D_OUT)
  begin
    case (merge1_fi1_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_fi1D_OUT_BITS_39_TO_38_0_merge1_f_ETC__q61 =
	      merge1_fi1_D_OUT[39:38];
      2'd3: CASE_merge1_fi1D_OUT_BITS_39_TO_38_0_merge1_f_ETC__q61 = 2'd3;
    endcase
  end
  always@(merge1_fi1_D_OUT)
  begin
    case (merge1_fi1_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_fi1D_OUT_BITS_29_TO_28_0_merge1_f_ETC__q62 =
	      merge1_fi1_D_OUT[29:28];
      2'd3: CASE_merge1_fi1D_OUT_BITS_29_TO_28_0_merge1_f_ETC__q62 = 2'd3;
    endcase
  end
  always@(merge1_fi1_D_OUT)
  begin
    case (merge1_fi1_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_fi1D_OUT_BITS_19_TO_18_0_merge1_f_ETC__q63 =
	      merge1_fi1_D_OUT[19:18];
      2'd3: CASE_merge1_fi1D_OUT_BITS_19_TO_18_0_merge1_f_ETC__q63 = 2'd3;
    endcase
  end
  always@(merge1_fi1_D_OUT)
  begin
    case (merge1_fi1_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_fi1D_OUT_BITS_9_TO_8_0_merge1_fi1_ETC__q64 =
	      merge1_fi1_D_OUT[9:8];
      2'd3: CASE_merge1_fi1D_OUT_BITS_9_TO_8_0_merge1_fi1_ETC__q64 = 2'd3;
    endcase
  end
  always@(fork0_sr)
  begin
    case (fork0_sr[119:118])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_sr_BITS_119_TO_118_0_fork0_sr_BITS__ETC__q65 =
	      fork0_sr[119:118];
      2'd3: CASE_fork0_sr_BITS_119_TO_118_0_fork0_sr_BITS__ETC__q65 = 2'd3;
    endcase
  end
  always@(fork0_sr)
  begin
    case (fork0_sr[109:108])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_sr_BITS_109_TO_108_0_fork0_sr_BITS__ETC__q66 =
	      fork0_sr[109:108];
      2'd3: CASE_fork0_sr_BITS_109_TO_108_0_fork0_sr_BITS__ETC__q66 = 2'd3;
    endcase
  end
  always@(fork0_sr)
  begin
    case (fork0_sr[99:98])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_sr_BITS_99_TO_98_0_fork0_sr_BITS_99_ETC__q67 =
	      fork0_sr[99:98];
      2'd3: CASE_fork0_sr_BITS_99_TO_98_0_fork0_sr_BITS_99_ETC__q67 = 2'd3;
    endcase
  end
  always@(fork0_sr)
  begin
    case (fork0_sr[89:88])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_sr_BITS_89_TO_88_0_fork0_sr_BITS_89_ETC__q68 =
	      fork0_sr[89:88];
      2'd3: CASE_fork0_sr_BITS_89_TO_88_0_fork0_sr_BITS_89_ETC__q68 = 2'd3;
    endcase
  end
  always@(fork0_sr)
  begin
    case (fork0_sr[79:78])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_sr_BITS_79_TO_78_0_fork0_sr_BITS_79_ETC__q69 =
	      fork0_sr[79:78];
      2'd3: CASE_fork0_sr_BITS_79_TO_78_0_fork0_sr_BITS_79_ETC__q69 = 2'd3;
    endcase
  end
  always@(fork0_sr)
  begin
    case (fork0_sr[69:68])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_sr_BITS_69_TO_68_0_fork0_sr_BITS_69_ETC__q70 =
	      fork0_sr[69:68];
      2'd3: CASE_fork0_sr_BITS_69_TO_68_0_fork0_sr_BITS_69_ETC__q70 = 2'd3;
    endcase
  end
  always@(fork0_sr)
  begin
    case (fork0_sr[59:58])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_sr_BITS_59_TO_58_0_fork0_sr_BITS_59_ETC__q71 =
	      fork0_sr[59:58];
      2'd3: CASE_fork0_sr_BITS_59_TO_58_0_fork0_sr_BITS_59_ETC__q71 = 2'd3;
    endcase
  end
  always@(fork0_sr)
  begin
    case (fork0_sr[49:48])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_sr_BITS_49_TO_48_0_fork0_sr_BITS_49_ETC__q72 =
	      fork0_sr[49:48];
      2'd3: CASE_fork0_sr_BITS_49_TO_48_0_fork0_sr_BITS_49_ETC__q72 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_39_TO_38_0_server_ETC__q73 =
	      server_request_put[39:38];
      2'd3: CASE_server_request_put_BITS_39_TO_38_0_server_ETC__q73 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_29_TO_28_0_server_ETC__q74 =
	      server_request_put[29:28];
      2'd3: CASE_server_request_put_BITS_29_TO_28_0_server_ETC__q74 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_19_TO_18_0_server_ETC__q75 =
	      server_request_put[19:18];
      2'd3: CASE_server_request_put_BITS_19_TO_18_0_server_ETC__q75 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_9_TO_8_0_server_r_ETC__q76 =
	      server_request_put[9:8];
      2'd3: CASE_server_request_put_BITS_9_TO_8_0_server_r_ETC__q76 = 2'd3;
    endcase
  end
  always@(fork1_sr)
  begin
    case (fork1_sr[119:118])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_sr_BITS_119_TO_118_0_fork1_sr_BITS__ETC__q77 =
	      fork1_sr[119:118];
      2'd3: CASE_fork1_sr_BITS_119_TO_118_0_fork1_sr_BITS__ETC__q77 = 2'd3;
    endcase
  end
  always@(fork1_sr)
  begin
    case (fork1_sr[109:108])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_sr_BITS_109_TO_108_0_fork1_sr_BITS__ETC__q78 =
	      fork1_sr[109:108];
      2'd3: CASE_fork1_sr_BITS_109_TO_108_0_fork1_sr_BITS__ETC__q78 = 2'd3;
    endcase
  end
  always@(fork1_sr)
  begin
    case (fork1_sr[99:98])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_sr_BITS_99_TO_98_0_fork1_sr_BITS_99_ETC__q79 =
	      fork1_sr[99:98];
      2'd3: CASE_fork1_sr_BITS_99_TO_98_0_fork1_sr_BITS_99_ETC__q79 = 2'd3;
    endcase
  end
  always@(fork1_sr)
  begin
    case (fork1_sr[89:88])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_sr_BITS_89_TO_88_0_fork1_sr_BITS_89_ETC__q80 =
	      fork1_sr[89:88];
      2'd3: CASE_fork1_sr_BITS_89_TO_88_0_fork1_sr_BITS_89_ETC__q80 = 2'd3;
    endcase
  end
  always@(fork1_sr)
  begin
    case (fork1_sr[79:78])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_sr_BITS_79_TO_78_0_fork1_sr_BITS_79_ETC__q81 =
	      fork1_sr[79:78];
      2'd3: CASE_fork1_sr_BITS_79_TO_78_0_fork1_sr_BITS_79_ETC__q81 = 2'd3;
    endcase
  end
  always@(fork1_sr)
  begin
    case (fork1_sr[69:68])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_sr_BITS_69_TO_68_0_fork1_sr_BITS_69_ETC__q82 =
	      fork1_sr[69:68];
      2'd3: CASE_fork1_sr_BITS_69_TO_68_0_fork1_sr_BITS_69_ETC__q82 = 2'd3;
    endcase
  end
  always@(fork1_sr)
  begin
    case (fork1_sr[59:58])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_sr_BITS_59_TO_58_0_fork1_sr_BITS_59_ETC__q83 =
	      fork1_sr[59:58];
      2'd3: CASE_fork1_sr_BITS_59_TO_58_0_fork1_sr_BITS_59_ETC__q83 = 2'd3;
    endcase
  end
  always@(fork1_sr)
  begin
    case (fork1_sr[49:48])
      2'd0, 2'd1, 2'd2:
	  CASE_fork1_sr_BITS_49_TO_48_0_fork1_sr_BITS_49_ETC__q84 =
	      fork1_sr[49:48];
      2'd3: CASE_fork1_sr_BITS_49_TO_48_0_fork1_sr_BITS_49_ETC__q84 = 2'd3;
    endcase
  end
  always@(fork0_d1F_D_OUT)
  begin
    case (fork0_d1F_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_d1FD_OUT_BITS_39_TO_38_0_fork0_d1F_ETC__q85 =
	      fork0_d1F_D_OUT[39:38];
      2'd3: CASE_fork0_d1FD_OUT_BITS_39_TO_38_0_fork0_d1F_ETC__q85 = 2'd3;
    endcase
  end
  always@(fork0_d1F_D_OUT)
  begin
    case (fork0_d1F_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_d1FD_OUT_BITS_29_TO_28_0_fork0_d1F_ETC__q86 =
	      fork0_d1F_D_OUT[29:28];
      2'd3: CASE_fork0_d1FD_OUT_BITS_29_TO_28_0_fork0_d1F_ETC__q86 = 2'd3;
    endcase
  end
  always@(fork0_d1F_D_OUT)
  begin
    case (fork0_d1F_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_d1FD_OUT_BITS_19_TO_18_0_fork0_d1F_ETC__q87 =
	      fork0_d1F_D_OUT[19:18];
      2'd3: CASE_fork0_d1FD_OUT_BITS_19_TO_18_0_fork0_d1F_ETC__q87 = 2'd3;
    endcase
  end
  always@(fork0_d1F_D_OUT)
  begin
    case (fork0_d1F_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_fork0_d1FD_OUT_BITS_9_TO_8_0_fork0_d1FD_ETC__q88 =
	      fork0_d1F_D_OUT[9:8];
      2'd3: CASE_fork0_d1FD_OUT_BITS_9_TO_8_0_fork0_d1FD_ETC__q88 = 2'd3;
    endcase
  end
  always@(client0_response_put)
  begin
    case (client0_response_put[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_client0_response_put_BITS_39_TO_38_0_clie_ETC__q89 =
	      client0_response_put[39:38];
      2'd3: CASE_client0_response_put_BITS_39_TO_38_0_clie_ETC__q89 = 2'd3;
    endcase
  end
  always@(client0_response_put)
  begin
    case (client0_response_put[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_client0_response_put_BITS_29_TO_28_0_clie_ETC__q90 =
	      client0_response_put[29:28];
      2'd3: CASE_client0_response_put_BITS_29_TO_28_0_clie_ETC__q90 = 2'd3;
    endcase
  end
  always@(client0_response_put)
  begin
    case (client0_response_put[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_client0_response_put_BITS_19_TO_18_0_clie_ETC__q91 =
	      client0_response_put[19:18];
      2'd3: CASE_client0_response_put_BITS_19_TO_18_0_clie_ETC__q91 = 2'd3;
    endcase
  end
  always@(client0_response_put)
  begin
    case (client0_response_put[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_client0_response_put_BITS_9_TO_8_0_client_ETC__q92 =
	      client0_response_put[9:8];
      2'd3: CASE_client0_response_put_BITS_9_TO_8_0_client_ETC__q92 = 2'd3;
    endcase
  end
  always@(merge1_fo_D_OUT)
  begin
    case (merge1_fo_D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_foD_OUT_BITS_39_TO_38_0_merge1_fo_ETC__q93 =
	      merge1_fo_D_OUT[39:38];
      2'd3: CASE_merge1_foD_OUT_BITS_39_TO_38_0_merge1_fo_ETC__q93 = 2'd3;
    endcase
  end
  always@(merge1_fo_D_OUT)
  begin
    case (merge1_fo_D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_foD_OUT_BITS_29_TO_28_0_merge1_fo_ETC__q94 =
	      merge1_fo_D_OUT[29:28];
      2'd3: CASE_merge1_foD_OUT_BITS_29_TO_28_0_merge1_fo_ETC__q94 = 2'd3;
    endcase
  end
  always@(merge1_fo_D_OUT)
  begin
    case (merge1_fo_D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_foD_OUT_BITS_19_TO_18_0_merge1_fo_ETC__q95 =
	      merge1_fo_D_OUT[19:18];
      2'd3: CASE_merge1_foD_OUT_BITS_19_TO_18_0_merge1_fo_ETC__q95 = 2'd3;
    endcase
  end
  always@(merge1_fo_D_OUT)
  begin
    case (merge1_fo_D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_merge1_foD_OUT_BITS_9_TO_8_0_merge1_foD_ETC__q96 =
	      merge1_fo_D_OUT[9:8];
      2'd3: CASE_merge1_foD_OUT_BITS_9_TO_8_0_merge1_foD_ETC__q96 = 2'd3;
    endcase
  end
  always@(client1_response_put)
  begin
    case (client1_response_put[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_client1_response_put_BITS_39_TO_38_0_clie_ETC__q97 =
	      client1_response_put[39:38];
      2'd3: CASE_client1_response_put_BITS_39_TO_38_0_clie_ETC__q97 = 2'd3;
    endcase
  end
  always@(client1_response_put)
  begin
    case (client1_response_put[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_client1_response_put_BITS_29_TO_28_0_clie_ETC__q98 =
	      client1_response_put[29:28];
      2'd3: CASE_client1_response_put_BITS_29_TO_28_0_clie_ETC__q98 = 2'd3;
    endcase
  end
  always@(client1_response_put)
  begin
    case (client1_response_put[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_client1_response_put_BITS_19_TO_18_0_clie_ETC__q99 =
	      client1_response_put[19:18];
      2'd3: CASE_client1_response_put_BITS_19_TO_18_0_clie_ETC__q99 = 2'd3;
    endcase
  end
  always@(client1_response_put)
  begin
    case (client1_response_put[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_client1_response_put_BITS_9_TO_8_0_client_ETC__q100 =
	      client1_response_put[9:8];
      2'd3: CASE_client1_response_put_BITS_9_TO_8_0_client_ETC__q100 = 2'd3;
    endcase
  end
  always@(client2_response_put)
  begin
    case (client2_response_put[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_client2_response_put_BITS_39_TO_38_0_clie_ETC__q101 =
	      client2_response_put[39:38];
      2'd3: CASE_client2_response_put_BITS_39_TO_38_0_clie_ETC__q101 = 2'd3;
    endcase
  end
  always@(client2_response_put)
  begin
    case (client2_response_put[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_client2_response_put_BITS_29_TO_28_0_clie_ETC__q102 =
	      client2_response_put[29:28];
      2'd3: CASE_client2_response_put_BITS_29_TO_28_0_clie_ETC__q102 = 2'd3;
    endcase
  end
  always@(client2_response_put)
  begin
    case (client2_response_put[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_client2_response_put_BITS_19_TO_18_0_clie_ETC__q103 =
	      client2_response_put[19:18];
      2'd3: CASE_client2_response_put_BITS_19_TO_18_0_clie_ETC__q103 = 2'd3;
    endcase
  end
  always@(client2_response_put)
  begin
    case (client2_response_put[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_client2_response_put_BITS_9_TO_8_0_client_ETC__q104 =
	      client2_response_put[9:8];
      2'd3: CASE_client2_response_put_BITS_9_TO_8_0_client_ETC__q104 = 2'd3;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        fork0_decided <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fork0_match0 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fork0_ptr <= `BSV_ASSIGNMENT_DELAY 3'd0;
	fork0_stageSent <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fork0_staged <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fork1_decided <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fork1_match0 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fork1_ptr <= `BSV_ASSIGNMENT_DELAY 3'd0;
	fork1_stageSent <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fork1_staged <= `BSV_ASSIGNMENT_DELAY 1'd0;
	merge0_fi0Active <= `BSV_ASSIGNMENT_DELAY 1'd0;
	merge0_fi0HasPrio <= `BSV_ASSIGNMENT_DELAY 1'd1;
	merge0_fi1Active <= `BSV_ASSIGNMENT_DELAY 1'd0;
	merge1_fi0Active <= `BSV_ASSIGNMENT_DELAY 1'd0;
	merge1_fi0HasPrio <= `BSV_ASSIGNMENT_DELAY 1'd1;
	merge1_fi1Active <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (fork0_decided_EN)
	  fork0_decided <= `BSV_ASSIGNMENT_DELAY fork0_decided_D_IN;
	if (fork0_match0_EN)
	  fork0_match0 <= `BSV_ASSIGNMENT_DELAY fork0_match0_D_IN;
	if (fork0_ptr_EN) fork0_ptr <= `BSV_ASSIGNMENT_DELAY fork0_ptr_D_IN;
	if (fork0_stageSent_EN)
	  fork0_stageSent <= `BSV_ASSIGNMENT_DELAY fork0_stageSent_D_IN;
	if (fork0_staged_EN)
	  fork0_staged <= `BSV_ASSIGNMENT_DELAY fork0_staged_D_IN;
	if (fork1_decided_EN)
	  fork1_decided <= `BSV_ASSIGNMENT_DELAY fork1_decided_D_IN;
	if (fork1_match0_EN)
	  fork1_match0 <= `BSV_ASSIGNMENT_DELAY fork1_match0_D_IN;
	if (fork1_ptr_EN) fork1_ptr <= `BSV_ASSIGNMENT_DELAY fork1_ptr_D_IN;
	if (fork1_stageSent_EN)
	  fork1_stageSent <= `BSV_ASSIGNMENT_DELAY fork1_stageSent_D_IN;
	if (fork1_staged_EN)
	  fork1_staged <= `BSV_ASSIGNMENT_DELAY fork1_staged_D_IN;
	if (merge0_fi0Active_EN)
	  merge0_fi0Active <= `BSV_ASSIGNMENT_DELAY merge0_fi0Active_D_IN;
	if (merge0_fi0HasPrio_EN)
	  merge0_fi0HasPrio <= `BSV_ASSIGNMENT_DELAY merge0_fi0HasPrio_D_IN;
	if (merge0_fi1Active_EN)
	  merge0_fi1Active <= `BSV_ASSIGNMENT_DELAY merge0_fi1Active_D_IN;
	if (merge1_fi0Active_EN)
	  merge1_fi0Active <= `BSV_ASSIGNMENT_DELAY merge1_fi0Active_D_IN;
	if (merge1_fi0HasPrio_EN)
	  merge1_fi0HasPrio <= `BSV_ASSIGNMENT_DELAY merge1_fi0HasPrio_D_IN;
	if (merge1_fi1Active_EN)
	  merge1_fi1Active <= `BSV_ASSIGNMENT_DELAY merge1_fi1Active_D_IN;
      end
    if (fork0_sr_EN) fork0_sr <= `BSV_ASSIGNMENT_DELAY fork0_sr_D_IN;
    if (fork1_sr_EN) fork1_sr <= `BSV_ASSIGNMENT_DELAY fork1_sr_D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    fork0_decided = 1'h0;
    fork0_match0 = 1'h0;
    fork0_ptr = 3'h2;
    fork0_sr = 120'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    fork0_stageSent = 1'h0;
    fork0_staged = 1'h0;
    fork1_decided = 1'h0;
    fork1_match0 = 1'h0;
    fork1_ptr = 3'h2;
    fork1_sr = 120'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    fork1_stageSent = 1'h0;
    fork1_staged = 1'h0;
    merge0_fi0Active = 1'h0;
    merge0_fi0HasPrio = 1'h0;
    merge0_fi1Active = 1'h0;
    merge1_fi0Active = 1'h0;
    merge1_fi0HasPrio = 1'h0;
    merge1_fi1Active = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule