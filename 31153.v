module outputs
  wire [70 : 0] out_ports_0_getFlit,
		out_ports_1_getFlit,
		out_ports_2_getFlit,
		out_ports_3_getFlit,
		out_ports_4_getFlit;
  wire [1 : 0] in_ports_0_getNonFullVCs,
	       in_ports_1_getNonFullVCs,
	       in_ports_2_getNonFullVCs,
	       in_ports_3_getNonFullVCs,
	       in_ports_4_getNonFullVCs;
  // inlined wires
  wire [70 : 0] hasFlitsToSend_perIn$wget,
		hasFlitsToSend_perIn_1$wget,
		hasFlitsToSend_perIn_2$wget,
		hasFlitsToSend_perIn_3$wget,
		hasFlitsToSend_perIn_4$wget;
  // register activeVC_perIn_reg
  reg [1 : 0] activeVC_perIn_reg;
  wire [1 : 0] activeVC_perIn_reg$D_IN;
  wire activeVC_perIn_reg$EN;
  // register activeVC_perIn_reg_1
  reg [1 : 0] activeVC_perIn_reg_1;
  wire [1 : 0] activeVC_perIn_reg_1$D_IN;
  wire activeVC_perIn_reg_1$EN;
  // register activeVC_perIn_reg_2
  reg [1 : 0] activeVC_perIn_reg_2;
  wire [1 : 0] activeVC_perIn_reg_2$D_IN;
  wire activeVC_perIn_reg_2$EN;
  // register activeVC_perIn_reg_3
  reg [1 : 0] activeVC_perIn_reg_3;
  wire [1 : 0] activeVC_perIn_reg_3$D_IN;
  wire activeVC_perIn_reg_3$EN;
  // register activeVC_perIn_reg_4
  reg [1 : 0] activeVC_perIn_reg_4;
  wire [1 : 0] activeVC_perIn_reg_4$D_IN;
  wire activeVC_perIn_reg_4$EN;
  // register inPortVL_0
  reg [2 : 0] inPortVL_0;
  wire [2 : 0] inPortVL_0$D_IN;
  wire inPortVL_0$EN;
  // register inPortVL_0_1
  reg [2 : 0] inPortVL_0_1;
  wire [2 : 0] inPortVL_0_1$D_IN;
  wire inPortVL_0_1$EN;
  // register inPortVL_1
  reg [2 : 0] inPortVL_1;
  wire [2 : 0] inPortVL_1$D_IN;
  wire inPortVL_1$EN;
  // register inPortVL_1_1
  reg [2 : 0] inPortVL_1_1;
  wire [2 : 0] inPortVL_1_1$D_IN;
  wire inPortVL_1_1$EN;
  // register inPortVL_2
  reg [2 : 0] inPortVL_2;
  wire [2 : 0] inPortVL_2$D_IN;
  wire inPortVL_2$EN;
  // register inPortVL_2_1
  reg [2 : 0] inPortVL_2_1;
  wire [2 : 0] inPortVL_2_1$D_IN;
  wire inPortVL_2_1$EN;
  // register inPortVL_3
  reg [2 : 0] inPortVL_3;
  wire [2 : 0] inPortVL_3$D_IN;
  wire inPortVL_3$EN;
  // register inPortVL_3_1
  reg [2 : 0] inPortVL_3_1;
  wire [2 : 0] inPortVL_3_1$D_IN;
  wire inPortVL_3_1$EN;
  // register inPortVL_4
  reg [2 : 0] inPortVL_4;
  wire [2 : 0] inPortVL_4$D_IN;
  wire inPortVL_4$EN;
  // register inPortVL_4_1
  reg [2 : 0] inPortVL_4_1;
  wire [2 : 0] inPortVL_4_1$D_IN;
  wire inPortVL_4_1$EN;
  // register lockedVL_0
  reg lockedVL_0;
  wire lockedVL_0$D_IN, lockedVL_0$EN;
  // register lockedVL_0_1
  reg lockedVL_0_1;
  wire lockedVL_0_1$D_IN, lockedVL_0_1$EN;
  // register lockedVL_1
  reg lockedVL_1;
  wire lockedVL_1$D_IN, lockedVL_1$EN;
  // register lockedVL_1_1
  reg lockedVL_1_1;
  wire lockedVL_1_1$D_IN, lockedVL_1_1$EN;
  // register lockedVL_2
  reg lockedVL_2;
  wire lockedVL_2$D_IN, lockedVL_2$EN;
  // register lockedVL_2_1
  reg lockedVL_2_1;
  wire lockedVL_2_1$D_IN, lockedVL_2_1$EN;
  // register lockedVL_3
  reg lockedVL_3;
  wire lockedVL_3$D_IN, lockedVL_3$EN;
  // register lockedVL_3_1
  reg lockedVL_3_1;
  wire lockedVL_3_1$D_IN, lockedVL_3_1$EN;
  // register lockedVL_4
  reg lockedVL_4;
  wire lockedVL_4$D_IN, lockedVL_4$EN;
  // register lockedVL_4_1
  reg lockedVL_4_1;
  wire lockedVL_4_1$D_IN, lockedVL_4_1$EN;
  // register selectedIO_reg_0
  reg selectedIO_reg_0;
  wire selectedIO_reg_0$D_IN, selectedIO_reg_0$EN;
  // register selectedIO_reg_0_1
  reg selectedIO_reg_0_1;
  wire selectedIO_reg_0_1$D_IN, selectedIO_reg_0_1$EN;
  // register selectedIO_reg_0_2
  reg selectedIO_reg_0_2;
  wire selectedIO_reg_0_2$D_IN, selectedIO_reg_0_2$EN;
  // register selectedIO_reg_0_3
  reg selectedIO_reg_0_3;
  wire selectedIO_reg_0_3$D_IN, selectedIO_reg_0_3$EN;
  // register selectedIO_reg_0_4
  reg selectedIO_reg_0_4;
  wire selectedIO_reg_0_4$D_IN, selectedIO_reg_0_4$EN;
  // register selectedIO_reg_1
  reg selectedIO_reg_1;
  wire selectedIO_reg_1$D_IN, selectedIO_reg_1$EN;
  // register selectedIO_reg_1_1
  reg selectedIO_reg_1_1;
  wire selectedIO_reg_1_1$D_IN, selectedIO_reg_1_1$EN;
  // register selectedIO_reg_1_2
  reg selectedIO_reg_1_2;
  wire selectedIO_reg_1_2$D_IN, selectedIO_reg_1_2$EN;
  // register selectedIO_reg_1_3
  reg selectedIO_reg_1_3;
  wire selectedIO_reg_1_3$D_IN, selectedIO_reg_1_3$EN;
  // register selectedIO_reg_1_4
  reg selectedIO_reg_1_4;
  wire selectedIO_reg_1_4$D_IN, selectedIO_reg_1_4$EN;
  // register selectedIO_reg_2
  reg selectedIO_reg_2;
  wire selectedIO_reg_2$D_IN, selectedIO_reg_2$EN;
  // register selectedIO_reg_2_1
  reg selectedIO_reg_2_1;
  wire selectedIO_reg_2_1$D_IN, selectedIO_reg_2_1$EN;
  // register selectedIO_reg_2_2
  reg selectedIO_reg_2_2;
  wire selectedIO_reg_2_2$D_IN, selectedIO_reg_2_2$EN;
  // register selectedIO_reg_2_3
  reg selectedIO_reg_2_3;
  wire selectedIO_reg_2_3$D_IN, selectedIO_reg_2_3$EN;
  // register selectedIO_reg_2_4
  reg selectedIO_reg_2_4;
  wire selectedIO_reg_2_4$D_IN, selectedIO_reg_2_4$EN;
  // register selectedIO_reg_3
  reg selectedIO_reg_3;
  wire selectedIO_reg_3$D_IN, selectedIO_reg_3$EN;
  // register selectedIO_reg_3_1
  reg selectedIO_reg_3_1;
  wire selectedIO_reg_3_1$D_IN, selectedIO_reg_3_1$EN;
  // register selectedIO_reg_3_2
  reg selectedIO_reg_3_2;
  wire selectedIO_reg_3_2$D_IN, selectedIO_reg_3_2$EN;
  // register selectedIO_reg_3_3
  reg selectedIO_reg_3_3;
  wire selectedIO_reg_3_3$D_IN, selectedIO_reg_3_3$EN;
  // register selectedIO_reg_3_4
  reg selectedIO_reg_3_4;
  wire selectedIO_reg_3_4$D_IN, selectedIO_reg_3_4$EN;
  // register selectedIO_reg_4
  reg selectedIO_reg_4;
  wire selectedIO_reg_4$D_IN, selectedIO_reg_4$EN;
  // register selectedIO_reg_4_1
  reg selectedIO_reg_4_1;
  wire selectedIO_reg_4_1$D_IN, selectedIO_reg_4_1$EN;
  // register selectedIO_reg_4_2
  reg selectedIO_reg_4_2;
  wire selectedIO_reg_4_2$D_IN, selectedIO_reg_4_2$EN;
  // register selectedIO_reg_4_3
  reg selectedIO_reg_4_3;
  wire selectedIO_reg_4_3$D_IN, selectedIO_reg_4_3$EN;
  // register selectedIO_reg_4_4
  reg selectedIO_reg_4_4;
  wire selectedIO_reg_4_4$D_IN, selectedIO_reg_4_4$EN;
  // ports of submodule flitBuffers
  wire [69 : 0] flitBuffers$deq, flitBuffers$enq_data_in;
  wire [1 : 0] flitBuffers$notEmpty, flitBuffers$notFull;
  wire flitBuffers$EN_deq,
       flitBuffers$EN_enq,
       flitBuffers$deq_fifo_out,
       flitBuffers$enq_fifo_in;
  // ports of submodule flitBuffers_1
  wire [69 : 0] flitBuffers_1$deq, flitBuffers_1$enq_data_in;
  wire [1 : 0] flitBuffers_1$notEmpty, flitBuffers_1$notFull;
  wire flitBuffers_1$EN_deq,
       flitBuffers_1$EN_enq,
       flitBuffers_1$deq_fifo_out,
       flitBuffers_1$enq_fifo_in;
  // ports of submodule flitBuffers_2
  wire [69 : 0] flitBuffers_2$deq, flitBuffers_2$enq_data_in;
  wire [1 : 0] flitBuffers_2$notEmpty, flitBuffers_2$notFull;
  wire flitBuffers_2$EN_deq,
       flitBuffers_2$EN_enq,
       flitBuffers_2$deq_fifo_out,
       flitBuffers_2$enq_fifo_in;
  // ports of submodule flitBuffers_3
  wire [69 : 0] flitBuffers_3$deq, flitBuffers_3$enq_data_in;
  wire [1 : 0] flitBuffers_3$notEmpty, flitBuffers_3$notFull;
  wire flitBuffers_3$EN_deq,
       flitBuffers_3$EN_enq,
       flitBuffers_3$deq_fifo_out,
       flitBuffers_3$enq_fifo_in;
  // ports of submodule flitBuffers_4
  wire [69 : 0] flitBuffers_4$deq, flitBuffers_4$enq_data_in;
  wire [1 : 0] flitBuffers_4$notEmpty, flitBuffers_4$notFull;
  wire flitBuffers_4$EN_deq,
       flitBuffers_4$EN_enq,
       flitBuffers_4$deq_fifo_out,
       flitBuffers_4$enq_fifo_in;
  // ports of submodule outPortFIFOs_0
  wire [2 : 0] outPortFIFOs_0$enq_sendData, outPortFIFOs_0$first;
  wire outPortFIFOs_0$EN_clear, outPortFIFOs_0$EN_deq, outPortFIFOs_0$EN_enq;
  // ports of submodule outPortFIFOs_0_1
  wire [2 : 0] outPortFIFOs_0_1$enq_sendData, outPortFIFOs_0_1$first;
  wire outPortFIFOs_0_1$EN_clear,
       outPortFIFOs_0_1$EN_deq,
       outPortFIFOs_0_1$EN_enq;
  // ports of submodule outPortFIFOs_1
  wire [2 : 0] outPortFIFOs_1$enq_sendData, outPortFIFOs_1$first;
  wire outPortFIFOs_1$EN_clear, outPortFIFOs_1$EN_deq, outPortFIFOs_1$EN_enq;
  // ports of submodule outPortFIFOs_1_1
  wire [2 : 0] outPortFIFOs_1_1$enq_sendData, outPortFIFOs_1_1$first;
  wire outPortFIFOs_1_1$EN_clear,
       outPortFIFOs_1_1$EN_deq,
       outPortFIFOs_1_1$EN_enq;
  // ports of submodule outPortFIFOs_2
  wire [2 : 0] outPortFIFOs_2$enq_sendData, outPortFIFOs_2$first;
  wire outPortFIFOs_2$EN_clear, outPortFIFOs_2$EN_deq, outPortFIFOs_2$EN_enq;
  // ports of submodule outPortFIFOs_2_1
  wire [2 : 0] outPortFIFOs_2_1$enq_sendData, outPortFIFOs_2_1$first;
  wire outPortFIFOs_2_1$EN_clear,
       outPortFIFOs_2_1$EN_deq,
       outPortFIFOs_2_1$EN_enq;
  // ports of submodule outPortFIFOs_3
  wire [2 : 0] outPortFIFOs_3$enq_sendData, outPortFIFOs_3$first;
  wire outPortFIFOs_3$EN_clear, outPortFIFOs_3$EN_deq, outPortFIFOs_3$EN_enq;
  // ports of submodule outPortFIFOs_3_1
  wire [2 : 0] outPortFIFOs_3_1$enq_sendData, outPortFIFOs_3_1$first;
  wire outPortFIFOs_3_1$EN_clear,
       outPortFIFOs_3_1$EN_deq,
       outPortFIFOs_3_1$EN_enq;
  // ports of submodule outPortFIFOs_4
  wire [2 : 0] outPortFIFOs_4$enq_sendData, outPortFIFOs_4$first;
  wire outPortFIFOs_4$EN_clear, outPortFIFOs_4$EN_deq, outPortFIFOs_4$EN_enq;
  // ports of submodule outPortFIFOs_4_1
  wire [2 : 0] outPortFIFOs_4_1$enq_sendData, outPortFIFOs_4_1$first;
  wire outPortFIFOs_4_1$EN_clear,
       outPortFIFOs_4_1$EN_deq,
       outPortFIFOs_4_1$EN_enq;
  // ports of submodule routerAlloc
  wire [24 : 0] routerAlloc$allocate, routerAlloc$allocate_alloc_input;
  wire routerAlloc$EN_allocate, routerAlloc$EN_next;
  // remaining internal signals
  reg [69 : 0] IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1162,
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1163,
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1164,
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1165;
  reg IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1172,
      IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1173,
      IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1174,
      IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1175,
      IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d671,
      IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d735,
      IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d799,
      IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d863,
      IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033,
      IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_NOT_s_ETC___d304,
      IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_simpl_ETC___d952,
      IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026,
      IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_NOT_s_ETC___d339,
      IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_simpl_ETC___d950,
      IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019,
      IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_NOT_s_ETC___d374,
      IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_simpl_ETC___d948,
      IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013,
      IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_NOT_sim_ETC___d409,
      IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simple__ETC___d946,
      IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007,
      IF_outPortFIFOs_4_first_EQ_0_THEN_NOT_simple_c_ETC___d444,
      IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d944;
  wire [69 : 0] IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d1161,
		IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d612;
  wire [4 : 0] IF_IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_si_ETC___d235,
	       IF_IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_si_ETC___d194,
	       IF_IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_si_ETC___d152,
	       IF_IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simp_ETC___d111,
	       IF_IF_outPortFIFOs_4_first_EQ_0_THEN_simple_cr_ETC___d70,
	       IF_flitBuffers_1_notEmpty__55_BIT_0_56_THEN_IF_ETC___d195,
	       IF_flitBuffers_2_notEmpty__13_BIT_0_14_THEN_IF_ETC___d153,
	       IF_flitBuffers_3_notEmpty__2_BIT_0_3_THEN_IF_I_ETC___d112,
	       IF_flitBuffers_4_notEmpty_BIT_0_THEN_IF_IF_out_ETC___d71,
	       IF_flitBuffers_notEmpty__96_BIT_0_97_THEN_IF_I_ETC___d236;
  wire [3 : 0] outport_encoder___d1113,
	       outport_encoder___d1114,
	       outport_encoder___d1115,
	       outport_encoder___d1116,
	       outport_encoder___d1117;
  wire [2 : 0] IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d910,
	       IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d911,
	       IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d912,
	       IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d913,
	       IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d918,
	       IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d919,
	       IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d920,
	       IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d921,
	       IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d914,
	       IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d915,
	       IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d916,
	       IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d917,
	       active_in__h48706,
	       active_in__h50467,
	       active_in__h52228,
	       active_in__h53989;
  wire IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d1171,
       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d580,
       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d581,
       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d582,
       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d593,
       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d594,
       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d595,
       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d596,
       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1105,
       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1106,
       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1107,
       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1108,
       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1109,
       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d898,
       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d902,
       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d903,
       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1126,
       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1131,
       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1136,
       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1141,
       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1146,
       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d958,
       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d968,
       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d976,
       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d984,
       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d992,
       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1124,
       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1129,
       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1134,
       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1139,
       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1144,
       IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1047,
       IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1089,
       IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1090,
       IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1091,
       IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1046,
       IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1056,
       IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1058,
       IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1060,
       IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1062,
       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d901,
       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d907,
       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d955,
       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d966,
       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d974,
       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d982,
       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d990,
       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1125,
       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1130,
       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1135,
       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1140,
       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1145,
       fifo_out__h36476,
       fifo_out__h37661,
       fifo_out__h38207,
       fifo_out__h38753,
       fifo_out__h39299;
  // actionvalue method in_ports_0_getNonFullVCs
  assign in_ports_0_getNonFullVCs = flitBuffers$notFull ;
  // actionvalue method in_ports_1_getNonFullVCs
  assign in_ports_1_getNonFullVCs = flitBuffers_1$notFull ;
  // actionvalue method in_ports_2_getNonFullVCs
  assign in_ports_2_getNonFullVCs = flitBuffers_2$notFull ;
  // actionvalue method in_ports_3_getNonFullVCs
  assign in_ports_3_getNonFullVCs = flitBuffers_3$notFull ;
  // actionvalue method in_ports_4_getNonFullVCs
  assign in_ports_4_getNonFullVCs = flitBuffers_4$notFull ;
  // actionvalue method out_ports_0_getFlit
  assign out_ports_0_getFlit =
	     { IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1046 &&
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d596,
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d1161 } ;
  // actionvalue method out_ports_1_getFlit
  assign out_ports_1_getFlit =
	     { IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1056 &&
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d671,
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1162 } ;
  // actionvalue method out_ports_2_getFlit
  assign out_ports_2_getFlit =
	     { IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1058 &&
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d735,
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1163 } ;
  // actionvalue method out_ports_3_getFlit
  assign out_ports_3_getFlit =
	     { IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1060 &&
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d799,
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1164 } ;
  // actionvalue method out_ports_4_getFlit
  assign out_ports_4_getFlit =
	     { IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1062 &&
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d863,
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1165 } ;
  // submodule flitBuffers
  mkInputVCQueues flitBuffers(.CLK(CLK),
			      .RST_N(RST_N),
			      .deq_fifo_out(flitBuffers$deq_fifo_out),
			      .enq_data_in(flitBuffers$enq_data_in),
			      .enq_fifo_in(flitBuffers$enq_fifo_in),
			      .EN_enq(flitBuffers$EN_enq),
			      .EN_deq(flitBuffers$EN_deq),
			      .deq(flitBuffers$deq),
			      .notEmpty(flitBuffers$notEmpty),
			      .notFull(flitBuffers$notFull));
  // submodule flitBuffers_1
  mkInputVCQueues flitBuffers_1(.CLK(CLK),
				.RST_N(RST_N),
				.deq_fifo_out(flitBuffers_1$deq_fifo_out),
				.enq_data_in(flitBuffers_1$enq_data_in),
				.enq_fifo_in(flitBuffers_1$enq_fifo_in),
				.EN_enq(flitBuffers_1$EN_enq),
				.EN_deq(flitBuffers_1$EN_deq),
				.deq(flitBuffers_1$deq),
				.notEmpty(flitBuffers_1$notEmpty),
				.notFull(flitBuffers_1$notFull));
  // submodule flitBuffers_2
  mkInputVCQueues flitBuffers_2(.CLK(CLK),
				.RST_N(RST_N),
				.deq_fifo_out(flitBuffers_2$deq_fifo_out),
				.enq_data_in(flitBuffers_2$enq_data_in),
				.enq_fifo_in(flitBuffers_2$enq_fifo_in),
				.EN_enq(flitBuffers_2$EN_enq),
				.EN_deq(flitBuffers_2$EN_deq),
				.deq(flitBuffers_2$deq),
				.notEmpty(flitBuffers_2$notEmpty),
				.notFull(flitBuffers_2$notFull));
  // submodule flitBuffers_3
  mkInputVCQueues flitBuffers_3(.CLK(CLK),
				.RST_N(RST_N),
				.deq_fifo_out(flitBuffers_3$deq_fifo_out),
				.enq_data_in(flitBuffers_3$enq_data_in),
				.enq_fifo_in(flitBuffers_3$enq_fifo_in),
				.EN_enq(flitBuffers_3$EN_enq),
				.EN_deq(flitBuffers_3$EN_deq),
				.deq(flitBuffers_3$deq),
				.notEmpty(flitBuffers_3$notEmpty),
				.notFull(flitBuffers_3$notFull));
  // submodule flitBuffers_4
  mkInputVCQueues flitBuffers_4(.CLK(CLK),
				.RST_N(RST_N),
				.deq_fifo_out(flitBuffers_4$deq_fifo_out),
				.enq_data_in(flitBuffers_4$enq_data_in),
				.enq_fifo_in(flitBuffers_4$enq_fifo_in),
				.EN_enq(flitBuffers_4$EN_enq),
				.EN_deq(flitBuffers_4$EN_deq),
				.deq(flitBuffers_4$deq),
				.notEmpty(flitBuffers_4$notEmpty),
				.notFull(flitBuffers_4$notFull));
  // submodule outPortFIFOs_0
  mkOutPortFIFO outPortFIFOs_0(.CLK(CLK),
			       .RST_N(RST_N),
			       .enq_sendData(outPortFIFOs_0$enq_sendData),
			       .EN_enq(outPortFIFOs_0$EN_enq),
			       .EN_deq(outPortFIFOs_0$EN_deq),
			       .EN_clear(outPortFIFOs_0$EN_clear),
			       .RDY_enq(),
			       .RDY_deq(),
			       .first(outPortFIFOs_0$first),
			       .RDY_first(),
			       .notFull(),
			       .RDY_notFull(),
			       .notEmpty(),
			       .RDY_notEmpty(),
			       .count(),
			       .RDY_count(),
			       .RDY_clear());
  // submodule outPortFIFOs_0_1
  mkOutPortFIFO outPortFIFOs_0_1(.CLK(CLK),
				 .RST_N(RST_N),
				 .enq_sendData(outPortFIFOs_0_1$enq_sendData),
				 .EN_enq(outPortFIFOs_0_1$EN_enq),
				 .EN_deq(outPortFIFOs_0_1$EN_deq),
				 .EN_clear(outPortFIFOs_0_1$EN_clear),
				 .RDY_enq(),
				 .RDY_deq(),
				 .first(outPortFIFOs_0_1$first),
				 .RDY_first(),
				 .notFull(),
				 .RDY_notFull(),
				 .notEmpty(),
				 .RDY_notEmpty(),
				 .count(),
				 .RDY_count(),
				 .RDY_clear());
  // submodule outPortFIFOs_1
  mkOutPortFIFO outPortFIFOs_1(.CLK(CLK),
			       .RST_N(RST_N),
			       .enq_sendData(outPortFIFOs_1$enq_sendData),
			       .EN_enq(outPortFIFOs_1$EN_enq),
			       .EN_deq(outPortFIFOs_1$EN_deq),
			       .EN_clear(outPortFIFOs_1$EN_clear),
			       .RDY_enq(),
			       .RDY_deq(),
			       .first(outPortFIFOs_1$first),
			       .RDY_first(),
			       .notFull(),
			       .RDY_notFull(),
			       .notEmpty(),
			       .RDY_notEmpty(),
			       .count(),
			       .RDY_count(),
			       .RDY_clear());
  // submodule outPortFIFOs_1_1
  mkOutPortFIFO outPortFIFOs_1_1(.CLK(CLK),
				 .RST_N(RST_N),
				 .enq_sendData(outPortFIFOs_1_1$enq_sendData),
				 .EN_enq(outPortFIFOs_1_1$EN_enq),
				 .EN_deq(outPortFIFOs_1_1$EN_deq),
				 .EN_clear(outPortFIFOs_1_1$EN_clear),
				 .RDY_enq(),
				 .RDY_deq(),
				 .first(outPortFIFOs_1_1$first),
				 .RDY_first(),
				 .notFull(),
				 .RDY_notFull(),
				 .notEmpty(),
				 .RDY_notEmpty(),
				 .count(),
				 .RDY_count(),
				 .RDY_clear());
  // submodule outPortFIFOs_2
  mkOutPortFIFO outPortFIFOs_2(.CLK(CLK),
			       .RST_N(RST_N),
			       .enq_sendData(outPortFIFOs_2$enq_sendData),
			       .EN_enq(outPortFIFOs_2$EN_enq),
			       .EN_deq(outPortFIFOs_2$EN_deq),
			       .EN_clear(outPortFIFOs_2$EN_clear),
			       .RDY_enq(),
			       .RDY_deq(),
			       .first(outPortFIFOs_2$first),
			       .RDY_first(),
			       .notFull(),
			       .RDY_notFull(),
			       .notEmpty(),
			       .RDY_notEmpty(),
			       .count(),
			       .RDY_count(),
			       .RDY_clear());
  // submodule outPortFIFOs_2_1
  mkOutPortFIFO outPortFIFOs_2_1(.CLK(CLK),
				 .RST_N(RST_N),
				 .enq_sendData(outPortFIFOs_2_1$enq_sendData),
				 .EN_enq(outPortFIFOs_2_1$EN_enq),
				 .EN_deq(outPortFIFOs_2_1$EN_deq),
				 .EN_clear(outPortFIFOs_2_1$EN_clear),
				 .RDY_enq(),
				 .RDY_deq(),
				 .first(outPortFIFOs_2_1$first),
				 .RDY_first(),
				 .notFull(),
				 .RDY_notFull(),
				 .notEmpty(),
				 .RDY_notEmpty(),
				 .count(),
				 .RDY_count(),
				 .RDY_clear());
  // submodule outPortFIFOs_3
  mkOutPortFIFO outPortFIFOs_3(.CLK(CLK),
			       .RST_N(RST_N),
			       .enq_sendData(outPortFIFOs_3$enq_sendData),
			       .EN_enq(outPortFIFOs_3$EN_enq),
			       .EN_deq(outPortFIFOs_3$EN_deq),
			       .EN_clear(outPortFIFOs_3$EN_clear),
			       .RDY_enq(),
			       .RDY_deq(),
			       .first(outPortFIFOs_3$first),
			       .RDY_first(),
			       .notFull(),
			       .RDY_notFull(),
			       .notEmpty(),
			       .RDY_notEmpty(),
			       .count(),
			       .RDY_count(),
			       .RDY_clear());
  // submodule outPortFIFOs_3_1
  mkOutPortFIFO outPortFIFOs_3_1(.CLK(CLK),
				 .RST_N(RST_N),
				 .enq_sendData(outPortFIFOs_3_1$enq_sendData),
				 .EN_enq(outPortFIFOs_3_1$EN_enq),
				 .EN_deq(outPortFIFOs_3_1$EN_deq),
				 .EN_clear(outPortFIFOs_3_1$EN_clear),
				 .RDY_enq(),
				 .RDY_deq(),
				 .first(outPortFIFOs_3_1$first),
				 .RDY_first(),
				 .notFull(),
				 .RDY_notFull(),
				 .notEmpty(),
				 .RDY_notEmpty(),
				 .count(),
				 .RDY_count(),
				 .RDY_clear());
  // submodule outPortFIFOs_4
  mkOutPortFIFO outPortFIFOs_4(.CLK(CLK),
			       .RST_N(RST_N),
			       .enq_sendData(outPortFIFOs_4$enq_sendData),
			       .EN_enq(outPortFIFOs_4$EN_enq),
			       .EN_deq(outPortFIFOs_4$EN_deq),
			       .EN_clear(outPortFIFOs_4$EN_clear),
			       .RDY_enq(),
			       .RDY_deq(),
			       .first(outPortFIFOs_4$first),
			       .RDY_first(),
			       .notFull(),
			       .RDY_notFull(),
			       .notEmpty(),
			       .RDY_notEmpty(),
			       .count(),
			       .RDY_count(),
			       .RDY_clear());
  // submodule outPortFIFOs_4_1
  mkOutPortFIFO outPortFIFOs_4_1(.CLK(CLK),
				 .RST_N(RST_N),
				 .enq_sendData(outPortFIFOs_4_1$enq_sendData),
				 .EN_enq(outPortFIFOs_4_1$EN_enq),
				 .EN_deq(outPortFIFOs_4_1$EN_deq),
				 .EN_clear(outPortFIFOs_4_1$EN_clear),
				 .RDY_enq(),
				 .RDY_deq(),
				 .first(outPortFIFOs_4_1$first),
				 .RDY_first(),
				 .notFull(),
				 .RDY_notFull(),
				 .notEmpty(),
				 .RDY_notEmpty(),
				 .count(),
				 .RDY_count(),
				 .RDY_clear());
  // submodule routerAlloc
  mkSepRouterAllocator routerAlloc(.pipeline(1'd0),
				   .CLK(CLK),
				   .RST_N(RST_N),
				   .allocate_alloc_input(routerAlloc$allocate_alloc_input),
				   .EN_allocate(routerAlloc$EN_allocate),
				   .EN_next(routerAlloc$EN_next),
				   .allocate(routerAlloc$allocate));
  // inlined wires
  assign hasFlitsToSend_perIn$wget = { 1'd1, flitBuffers$deq } ;
  assign hasFlitsToSend_perIn_1$wget = { 1'd1, flitBuffers_1$deq } ;
  assign hasFlitsToSend_perIn_2$wget = { 1'd1, flitBuffers_2$deq } ;
  assign hasFlitsToSend_perIn_3$wget = { 1'd1, flitBuffers_3$deq } ;
  assign hasFlitsToSend_perIn_4$wget = { 1'd1, flitBuffers_4$deq } ;
  // register activeVC_perIn_reg
  assign activeVC_perIn_reg$D_IN = 2'h0 ;
  assign activeVC_perIn_reg$EN = 1'b0 ;
  // register activeVC_perIn_reg_1
  assign activeVC_perIn_reg_1$D_IN = 2'h0 ;
  assign activeVC_perIn_reg_1$EN = 1'b0 ;
  // register activeVC_perIn_reg_2
  assign activeVC_perIn_reg_2$D_IN = 2'h0 ;
  assign activeVC_perIn_reg_2$EN = 1'b0 ;
  // register activeVC_perIn_reg_3
  assign activeVC_perIn_reg_3$D_IN = 2'h0 ;
  assign activeVC_perIn_reg_3$EN = 1'b0 ;
  // register activeVC_perIn_reg_4
  assign activeVC_perIn_reg_4$D_IN = 2'h0 ;
  assign activeVC_perIn_reg_4$EN = 1'b0 ;
  // register inPortVL_0
  assign inPortVL_0$D_IN = 3'h0 ;
  assign inPortVL_0$EN = 1'b0 ;
  // register inPortVL_0_1
  assign inPortVL_0_1$D_IN = 3'h0 ;
  assign inPortVL_0_1$EN = 1'b0 ;
  // register inPortVL_1
  assign inPortVL_1$D_IN = 3'h0 ;
  assign inPortVL_1$EN = 1'b0 ;
  // register inPortVL_1_1
  assign inPortVL_1_1$D_IN = 3'h0 ;
  assign inPortVL_1_1$EN = 1'b0 ;
  // register inPortVL_2
  assign inPortVL_2$D_IN = 3'h0 ;
  assign inPortVL_2$EN = 1'b0 ;
  // register inPortVL_2_1
  assign inPortVL_2_1$D_IN = 3'h0 ;
  assign inPortVL_2_1$EN = 1'b0 ;
  // register inPortVL_3
  assign inPortVL_3$D_IN = 3'h0 ;
  assign inPortVL_3$EN = 1'b0 ;
  // register inPortVL_3_1
  assign inPortVL_3_1$D_IN = 3'h0 ;
  assign inPortVL_3_1$EN = 1'b0 ;
  // register inPortVL_4
  assign inPortVL_4$D_IN = 3'h0 ;
  assign inPortVL_4$EN = 1'b0 ;
  // register inPortVL_4_1
  assign inPortVL_4_1$D_IN = 3'h0 ;
  assign inPortVL_4_1$EN = 1'b0 ;
  // register lockedVL_0
  assign lockedVL_0$D_IN = 1'b0 ;
  assign lockedVL_0$EN = 1'b0 ;
  // register lockedVL_0_1
  assign lockedVL_0_1$D_IN = 1'b0 ;
  assign lockedVL_0_1$EN = 1'b0 ;
  // register lockedVL_1
  assign lockedVL_1$D_IN = 1'b0 ;
  assign lockedVL_1$EN = 1'b0 ;
  // register lockedVL_1_1
  assign lockedVL_1_1$D_IN = 1'b0 ;
  assign lockedVL_1_1$EN = 1'b0 ;
  // register lockedVL_2
  assign lockedVL_2$D_IN = 1'b0 ;
  assign lockedVL_2$EN = 1'b0 ;
  // register lockedVL_2_1
  assign lockedVL_2_1$D_IN = 1'b0 ;
  assign lockedVL_2_1$EN = 1'b0 ;
  // register lockedVL_3
  assign lockedVL_3$D_IN = 1'b0 ;
  assign lockedVL_3$EN = 1'b0 ;
  // register lockedVL_3_1
  assign lockedVL_3_1$D_IN = 1'b0 ;
  assign lockedVL_3_1$EN = 1'b0 ;
  // register lockedVL_4
  assign lockedVL_4$D_IN = 1'b0 ;
  assign lockedVL_4$EN = 1'b0 ;
  // register lockedVL_4_1
  assign lockedVL_4_1$D_IN = 1'b0 ;
  assign lockedVL_4_1$EN = 1'b0 ;
  // register selectedIO_reg_0
  assign selectedIO_reg_0$D_IN = 1'b0 ;
  assign selectedIO_reg_0$EN = 1'b0 ;
  // register selectedIO_reg_0_1
  assign selectedIO_reg_0_1$D_IN = 1'b0 ;
  assign selectedIO_reg_0_1$EN = 1'b0 ;
  // register selectedIO_reg_0_2
  assign selectedIO_reg_0_2$D_IN = 1'b0 ;
  assign selectedIO_reg_0_2$EN = 1'b0 ;
  // register selectedIO_reg_0_3
  assign selectedIO_reg_0_3$D_IN = 1'b0 ;
  assign selectedIO_reg_0_3$EN = 1'b0 ;
  // register selectedIO_reg_0_4
  assign selectedIO_reg_0_4$D_IN = 1'b0 ;
  assign selectedIO_reg_0_4$EN = 1'b0 ;
  // register selectedIO_reg_1
  assign selectedIO_reg_1$D_IN = 1'b0 ;
  assign selectedIO_reg_1$EN = 1'b0 ;
  // register selectedIO_reg_1_1
  assign selectedIO_reg_1_1$D_IN = 1'b0 ;
  assign selectedIO_reg_1_1$EN = 1'b0 ;
  // register selectedIO_reg_1_2
  assign selectedIO_reg_1_2$D_IN = 1'b0 ;
  assign selectedIO_reg_1_2$EN = 1'b0 ;
  // register selectedIO_reg_1_3
  assign selectedIO_reg_1_3$D_IN = 1'b0 ;
  assign selectedIO_reg_1_3$EN = 1'b0 ;
  // register selectedIO_reg_1_4
  assign selectedIO_reg_1_4$D_IN = 1'b0 ;
  assign selectedIO_reg_1_4$EN = 1'b0 ;
  // register selectedIO_reg_2
  assign selectedIO_reg_2$D_IN = 1'b0 ;
  assign selectedIO_reg_2$EN = 1'b0 ;
  // register selectedIO_reg_2_1
  assign selectedIO_reg_2_1$D_IN = 1'b0 ;
  assign selectedIO_reg_2_1$EN = 1'b0 ;
  // register selectedIO_reg_2_2
  assign selectedIO_reg_2_2$D_IN = 1'b0 ;
  assign selectedIO_reg_2_2$EN = 1'b0 ;
  // register selectedIO_reg_2_3
  assign selectedIO_reg_2_3$D_IN = 1'b0 ;
  assign selectedIO_reg_2_3$EN = 1'b0 ;
  // register selectedIO_reg_2_4
  assign selectedIO_reg_2_4$D_IN = 1'b0 ;
  assign selectedIO_reg_2_4$EN = 1'b0 ;
  // register selectedIO_reg_3
  assign selectedIO_reg_3$D_IN = 1'b0 ;
  assign selectedIO_reg_3$EN = 1'b0 ;
  // register selectedIO_reg_3_1
  assign selectedIO_reg_3_1$D_IN = 1'b0 ;
  assign selectedIO_reg_3_1$EN = 1'b0 ;
  // register selectedIO_reg_3_2
  assign selectedIO_reg_3_2$D_IN = 1'b0 ;
  assign selectedIO_reg_3_2$EN = 1'b0 ;
  // register selectedIO_reg_3_3
  assign selectedIO_reg_3_3$D_IN = 1'b0 ;
  assign selectedIO_reg_3_3$EN = 1'b0 ;
  // register selectedIO_reg_3_4
  assign selectedIO_reg_3_4$D_IN = 1'b0 ;
  assign selectedIO_reg_3_4$EN = 1'b0 ;
  // register selectedIO_reg_4
  assign selectedIO_reg_4$D_IN = 1'b0 ;
  assign selectedIO_reg_4$EN = 1'b0 ;
  // register selectedIO_reg_4_1
  assign selectedIO_reg_4_1$D_IN = 1'b0 ;
  assign selectedIO_reg_4_1$EN = 1'b0 ;
  // register selectedIO_reg_4_2
  assign selectedIO_reg_4_2$D_IN = 1'b0 ;
  assign selectedIO_reg_4_2$EN = 1'b0 ;
  // register selectedIO_reg_4_3
  assign selectedIO_reg_4_3$D_IN = 1'b0 ;
  assign selectedIO_reg_4_3$EN = 1'b0 ;
  // register selectedIO_reg_4_4
  assign selectedIO_reg_4_4$D_IN = 1'b0 ;
  assign selectedIO_reg_4_4$EN = 1'b0 ;
  // submodule flitBuffers
  assign flitBuffers$deq_fifo_out = fifo_out__h36476 ;
  assign flitBuffers$enq_data_in = in_ports_0_putRoutedFlit_flit_in[72:3] ;
  assign flitBuffers$enq_fifo_in = in_ports_0_putRoutedFlit_flit_in[67] ;
  assign flitBuffers$EN_enq =
	     EN_in_ports_0_putRoutedFlit &&
	     in_ports_0_putRoutedFlit_flit_in[73] ;
  assign flitBuffers$EN_deq = outport_encoder___d1117[3] ;
  // submodule flitBuffers_1
  assign flitBuffers_1$deq_fifo_out = fifo_out__h37661 ;
  assign flitBuffers_1$enq_data_in = in_ports_1_putRoutedFlit_flit_in[72:3] ;
  assign flitBuffers_1$enq_fifo_in = in_ports_1_putRoutedFlit_flit_in[67] ;
  assign flitBuffers_1$EN_enq =
	     EN_in_ports_1_putRoutedFlit &&
	     in_ports_1_putRoutedFlit_flit_in[73] ;
  assign flitBuffers_1$EN_deq = outport_encoder___d1116[3] ;
  // submodule flitBuffers_2
  assign flitBuffers_2$deq_fifo_out = fifo_out__h38207 ;
  assign flitBuffers_2$enq_data_in = in_ports_2_putRoutedFlit_flit_in[72:3] ;
  assign flitBuffers_2$enq_fifo_in = in_ports_2_putRoutedFlit_flit_in[67] ;
  assign flitBuffers_2$EN_enq =
	     EN_in_ports_2_putRoutedFlit &&
	     in_ports_2_putRoutedFlit_flit_in[73] ;
  assign flitBuffers_2$EN_deq = outport_encoder___d1115[3] ;
  // submodule flitBuffers_3
  assign flitBuffers_3$deq_fifo_out = fifo_out__h38753 ;
  assign flitBuffers_3$enq_data_in = in_ports_3_putRoutedFlit_flit_in[72:3] ;
  assign flitBuffers_3$enq_fifo_in = in_ports_3_putRoutedFlit_flit_in[67] ;
  assign flitBuffers_3$EN_enq =
	     EN_in_ports_3_putRoutedFlit &&
	     in_ports_3_putRoutedFlit_flit_in[73] ;
  assign flitBuffers_3$EN_deq = outport_encoder___d1114[3] ;
  // submodule flitBuffers_4
  assign flitBuffers_4$deq_fifo_out = fifo_out__h39299 ;
  assign flitBuffers_4$enq_data_in = in_ports_4_putRoutedFlit_flit_in[72:3] ;
  assign flitBuffers_4$enq_fifo_in = in_ports_4_putRoutedFlit_flit_in[67] ;
  assign flitBuffers_4$EN_enq =
	     EN_in_ports_4_putRoutedFlit &&
	     in_ports_4_putRoutedFlit_flit_in[73] ;
  assign flitBuffers_4$EN_deq = outport_encoder___d1113[3] ;
  // submodule outPortFIFOs_0
  assign outPortFIFOs_0$enq_sendData = in_ports_0_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_0$EN_enq =
	     EN_in_ports_0_putRoutedFlit &&
	     in_ports_0_putRoutedFlit_flit_in[73] &&
	     !in_ports_0_putRoutedFlit_flit_in[67] ;
  assign outPortFIFOs_0$EN_deq =
	     outport_encoder___d1117[3] && flitBuffers$notEmpty[0] &&
	     IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_simpl_ETC___d952 ;
  assign outPortFIFOs_0$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_0_1
  assign outPortFIFOs_0_1$enq_sendData =
	     in_ports_0_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_0_1$EN_enq =
	     EN_in_ports_0_putRoutedFlit &&
	     in_ports_0_putRoutedFlit_flit_in[73] &&
	     in_ports_0_putRoutedFlit_flit_in[67] ;
  assign outPortFIFOs_0_1$EN_deq =
	     outport_encoder___d1117[3] && fifo_out__h36476 ;
  assign outPortFIFOs_0_1$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_1
  assign outPortFIFOs_1$enq_sendData = in_ports_1_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_1$EN_enq =
	     EN_in_ports_1_putRoutedFlit &&
	     in_ports_1_putRoutedFlit_flit_in[73] &&
	     !in_ports_1_putRoutedFlit_flit_in[67] ;
  assign outPortFIFOs_1$EN_deq =
	     outport_encoder___d1116[3] && flitBuffers_1$notEmpty[0] &&
	     IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_simpl_ETC___d950 ;
  assign outPortFIFOs_1$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_1_1
  assign outPortFIFOs_1_1$enq_sendData =
	     in_ports_1_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_1_1$EN_enq =
	     EN_in_ports_1_putRoutedFlit &&
	     in_ports_1_putRoutedFlit_flit_in[73] &&
	     in_ports_1_putRoutedFlit_flit_in[67] ;
  assign outPortFIFOs_1_1$EN_deq =
	     outport_encoder___d1116[3] && fifo_out__h37661 ;
  assign outPortFIFOs_1_1$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_2
  assign outPortFIFOs_2$enq_sendData = in_ports_2_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_2$EN_enq =
	     EN_in_ports_2_putRoutedFlit &&
	     in_ports_2_putRoutedFlit_flit_in[73] &&
	     !in_ports_2_putRoutedFlit_flit_in[67] ;
  assign outPortFIFOs_2$EN_deq =
	     outport_encoder___d1115[3] && flitBuffers_2$notEmpty[0] &&
	     IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_simpl_ETC___d948 ;
  assign outPortFIFOs_2$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_2_1
  assign outPortFIFOs_2_1$enq_sendData =
	     in_ports_2_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_2_1$EN_enq =
	     EN_in_ports_2_putRoutedFlit &&
	     in_ports_2_putRoutedFlit_flit_in[73] &&
	     in_ports_2_putRoutedFlit_flit_in[67] ;
  assign outPortFIFOs_2_1$EN_deq =
	     outport_encoder___d1115[3] && fifo_out__h38207 ;
  assign outPortFIFOs_2_1$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_3
  assign outPortFIFOs_3$enq_sendData = in_ports_3_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_3$EN_enq =
	     EN_in_ports_3_putRoutedFlit &&
	     in_ports_3_putRoutedFlit_flit_in[73] &&
	     !in_ports_3_putRoutedFlit_flit_in[67] ;
  assign outPortFIFOs_3$EN_deq =
	     outport_encoder___d1114[3] && flitBuffers_3$notEmpty[0] &&
	     IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simple__ETC___d946 ;
  assign outPortFIFOs_3$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_3_1
  assign outPortFIFOs_3_1$enq_sendData =
	     in_ports_3_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_3_1$EN_enq =
	     EN_in_ports_3_putRoutedFlit &&
	     in_ports_3_putRoutedFlit_flit_in[73] &&
	     in_ports_3_putRoutedFlit_flit_in[67] ;
  assign outPortFIFOs_3_1$EN_deq =
	     outport_encoder___d1114[3] && fifo_out__h38753 ;
  assign outPortFIFOs_3_1$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_4
  assign outPortFIFOs_4$enq_sendData = in_ports_4_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_4$EN_enq =
	     EN_in_ports_4_putRoutedFlit &&
	     in_ports_4_putRoutedFlit_flit_in[73] &&
	     !in_ports_4_putRoutedFlit_flit_in[67] ;
  assign outPortFIFOs_4$EN_deq =
	     outport_encoder___d1113[3] && flitBuffers_4$notEmpty[0] &&
	     IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d944 ;
  assign outPortFIFOs_4$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_4_1
  assign outPortFIFOs_4_1$enq_sendData =
	     in_ports_4_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_4_1$EN_enq =
	     EN_in_ports_4_putRoutedFlit &&
	     in_ports_4_putRoutedFlit_flit_in[73] &&
	     in_ports_4_putRoutedFlit_flit_in[67] ;
  assign outPortFIFOs_4_1$EN_deq =
	     outport_encoder___d1113[3] && fifo_out__h39299 ;
  assign outPortFIFOs_4_1$EN_clear = 1'b0 ;
  // submodule routerAlloc
  assign routerAlloc$allocate_alloc_input =
	     { IF_flitBuffers_4_notEmpty_BIT_0_THEN_IF_IF_out_ETC___d71,
	       IF_flitBuffers_3_notEmpty__2_BIT_0_3_THEN_IF_I_ETC___d112,
	       IF_flitBuffers_2_notEmpty__13_BIT_0_14_THEN_IF_ETC___d153,
	       IF_flitBuffers_1_notEmpty__55_BIT_0_56_THEN_IF_ETC___d195,
	       IF_flitBuffers_notEmpty__96_BIT_0_97_THEN_IF_I_ETC___d236 } ;
  assign routerAlloc$EN_allocate = 1'd1 ;
  assign routerAlloc$EN_next = 1'd1 ;
  // remaining internal signals
  module_outport_encoder instance_outport_encoder_1(.outport_encoder_vec({ { 1'd1 &&
									     routerAlloc$allocate[4],
									     1'd1 &&
									     routerAlloc$allocate[3],
									     1'd1 &&
									     routerAlloc$allocate[2] },
									   1'd1 &&
									   routerAlloc$allocate[1],
									   1'd1 &&
									   routerAlloc$allocate[0] }),
						    .outport_encoder(outport_encoder___d1117));
  module_outport_encoder instance_outport_encoder_0(.outport_encoder_vec({ { 1'd1 &&
									     routerAlloc$allocate[9],
									     1'd1 &&
									     routerAlloc$allocate[8],
									     1'd1 &&
									     routerAlloc$allocate[7] },
									   1'd1 &&
									   routerAlloc$allocate[6],
									   1'd1 &&
									   routerAlloc$allocate[5] }),
						    .outport_encoder(outport_encoder___d1116));
  module_outport_encoder instance_outport_encoder_2(.outport_encoder_vec({ { 1'd1 &&
									     routerAlloc$allocate[14],
									     1'd1 &&
									     routerAlloc$allocate[13],
									     1'd1 &&
									     routerAlloc$allocate[12] },
									   1'd1 &&
									   routerAlloc$allocate[11],
									   1'd1 &&
									   routerAlloc$allocate[10] }),
						    .outport_encoder(outport_encoder___d1115));
  module_outport_encoder instance_outport_encoder_4(.outport_encoder_vec({ { 1'd1 &&
									     routerAlloc$allocate[24],
									     1'd1 &&
									     routerAlloc$allocate[23],
									     1'd1 &&
									     routerAlloc$allocate[22] },
									   1'd1 &&
									   routerAlloc$allocate[21],
									   1'd1 &&
									   routerAlloc$allocate[20] }),
						    .outport_encoder(outport_encoder___d1113));
  module_outport_encoder instance_outport_encoder_3(.outport_encoder_vec({ { 1'd1 &&
									     routerAlloc$allocate[19],
									     1'd1 &&
									     routerAlloc$allocate[18],
									     1'd1 &&
									     routerAlloc$allocate[17] },
									   1'd1 &&
									   routerAlloc$allocate[16],
									   1'd1 &&
									   routerAlloc$allocate[15] }),
						    .outport_encoder(outport_encoder___d1114));
  assign IF_IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_si_ETC___d235 =
	     IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_simpl_ETC___d952 ?
	       { outPortFIFOs_0$first == 3'd4,
		 outPortFIFOs_0$first == 3'd3,
		 outPortFIFOs_0$first == 3'd2,
		 outPortFIFOs_0$first == 3'd1,
		 outPortFIFOs_0$first == 3'd0 } :
	       { flitBuffers$notEmpty[1] &&
		 IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 &&
		 outPortFIFOs_0_1$first == 3'd4,
		 flitBuffers$notEmpty[1] &&
		 IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 &&
		 outPortFIFOs_0_1$first == 3'd3,
		 flitBuffers$notEmpty[1] &&
		 IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 &&
		 outPortFIFOs_0_1$first == 3'd2,
		 flitBuffers$notEmpty[1] &&
		 IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 &&
		 outPortFIFOs_0_1$first == 3'd1,
		 flitBuffers$notEmpty[1] &&
		 IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 &&
		 outPortFIFOs_0_1$first == 3'd0 } ;
  assign IF_IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_si_ETC___d194 =
	     IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_simpl_ETC___d950 ?
	       { outPortFIFOs_1$first == 3'd4,
		 outPortFIFOs_1$first == 3'd3,
		 outPortFIFOs_1$first == 3'd2,
		 outPortFIFOs_1$first == 3'd1,
		 outPortFIFOs_1$first == 3'd0 } :
	       { flitBuffers_1$notEmpty[1] &&
		 IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 &&
		 outPortFIFOs_1_1$first == 3'd4,
		 flitBuffers_1$notEmpty[1] &&
		 IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 &&
		 outPortFIFOs_1_1$first == 3'd3,
		 flitBuffers_1$notEmpty[1] &&
		 IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 &&
		 outPortFIFOs_1_1$first == 3'd2,
		 flitBuffers_1$notEmpty[1] &&
		 IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 &&
		 outPortFIFOs_1_1$first == 3'd1,
		 flitBuffers_1$notEmpty[1] &&
		 IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 &&
		 outPortFIFOs_1_1$first == 3'd0 } ;
  assign IF_IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_si_ETC___d152 =
	     IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_simpl_ETC___d948 ?
	       { outPortFIFOs_2$first == 3'd4,
		 outPortFIFOs_2$first == 3'd3,
		 outPortFIFOs_2$first == 3'd2,
		 outPortFIFOs_2$first == 3'd1,
		 outPortFIFOs_2$first == 3'd0 } :
	       { flitBuffers_2$notEmpty[1] &&
		 IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 &&
		 outPortFIFOs_2_1$first == 3'd4,
		 flitBuffers_2$notEmpty[1] &&
		 IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 &&
		 outPortFIFOs_2_1$first == 3'd3,
		 flitBuffers_2$notEmpty[1] &&
		 IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 &&
		 outPortFIFOs_2_1$first == 3'd2,
		 flitBuffers_2$notEmpty[1] &&
		 IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 &&
		 outPortFIFOs_2_1$first == 3'd1,
		 flitBuffers_2$notEmpty[1] &&
		 IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 &&
		 outPortFIFOs_2_1$first == 3'd0 } ;
  assign IF_IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simp_ETC___d111 =
	     IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simple__ETC___d946 ?
	       { outPortFIFOs_3$first == 3'd4,
		 outPortFIFOs_3$first == 3'd3,
		 outPortFIFOs_3$first == 3'd2,
		 outPortFIFOs_3$first == 3'd1,
		 outPortFIFOs_3$first == 3'd0 } :
	       { flitBuffers_3$notEmpty[1] &&
		 IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 &&
		 outPortFIFOs_3_1$first == 3'd4,
		 flitBuffers_3$notEmpty[1] &&
		 IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 &&
		 outPortFIFOs_3_1$first == 3'd3,
		 flitBuffers_3$notEmpty[1] &&
		 IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 &&
		 outPortFIFOs_3_1$first == 3'd2,
		 flitBuffers_3$notEmpty[1] &&
		 IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 &&
		 outPortFIFOs_3_1$first == 3'd1,
		 flitBuffers_3$notEmpty[1] &&
		 IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 &&
		 outPortFIFOs_3_1$first == 3'd0 } ;
  assign IF_IF_outPortFIFOs_4_first_EQ_0_THEN_simple_cr_ETC___d70 =
	     IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d944 ?
	       { outPortFIFOs_4$first == 3'd4,
		 outPortFIFOs_4$first == 3'd3,
		 outPortFIFOs_4$first == 3'd2,
		 outPortFIFOs_4$first == 3'd1,
		 outPortFIFOs_4$first == 3'd0 } :
	       { flitBuffers_4$notEmpty[1] &&
		 IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 &&
		 outPortFIFOs_4_1$first == 3'd4,
		 flitBuffers_4$notEmpty[1] &&
		 IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 &&
		 outPortFIFOs_4_1$first == 3'd3,
		 flitBuffers_4$notEmpty[1] &&
		 IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 &&
		 outPortFIFOs_4_1$first == 3'd2,
		 flitBuffers_4$notEmpty[1] &&
		 IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 &&
		 outPortFIFOs_4_1$first == 3'd1,
		 flitBuffers_4$notEmpty[1] &&
		 IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 &&
		 outPortFIFOs_4_1$first == 3'd0 } ;
  assign IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d1161 =
	     IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1047 ?
	       hasFlitsToSend_perIn$wget[69:0] :
	       (IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1089 ?
		  hasFlitsToSend_perIn_1$wget[69:0] :
		  IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d612) ;
  assign IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d1171 =
	     IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1047 ?
	       !outport_encoder___d1117[3] || !hasFlitsToSend_perIn$wget[70] :
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d582 ;
  assign IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d580 =
	     IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1091 ?
	       !outport_encoder___d1114[3] ||
	       !hasFlitsToSend_perIn_3$wget[70] :
	       outport_encoder___d1113[3] &&
	       outport_encoder___d1113[2:0] == 3'd0 &&
	       !hasFlitsToSend_perIn_4$wget[70] ;
  assign IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d581 =
	     IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1090 ?
	       !outport_encoder___d1115[3] ||
	       !hasFlitsToSend_perIn_2$wget[70] :
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d580 ;
  assign IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d582 =
	     IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1089 ?
	       !outport_encoder___d1116[3] ||
	       !hasFlitsToSend_perIn_1$wget[70] :
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d581 ;
  assign IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d593 =
	     IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1091 ?
	       outport_encoder___d1114[3] && hasFlitsToSend_perIn_3$wget[70] :
	       !outport_encoder___d1113[3] ||
	       outport_encoder___d1113[2:0] != 3'd0 ||
	       hasFlitsToSend_perIn_4$wget[70] ;
  assign IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d594 =
	     IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1090 ?
	       outport_encoder___d1115[3] && hasFlitsToSend_perIn_2$wget[70] :
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d593 ;
  assign IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d595 =
	     IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1089 ?
	       outport_encoder___d1116[3] && hasFlitsToSend_perIn_1$wget[70] :
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d594 ;
  assign IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d596 =
	     IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1047 ?
	       outport_encoder___d1117[3] && hasFlitsToSend_perIn$wget[70] :
	       IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d595 ;
  assign IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d612 =
	     IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1090 ?
	       hasFlitsToSend_perIn_2$wget[69:0] :
	       (IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1091 ?
		  hasFlitsToSend_perIn_3$wget[69:0] :
		  hasFlitsToSend_perIn_4$wget[69:0]) ;
  assign IF_flitBuffers_1_notEmpty__55_BIT_0_56_THEN_IF_ETC___d195 =
	     flitBuffers_1$notEmpty[0] ?
	       IF_IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_si_ETC___d194 :
	       { flitBuffers_1$notEmpty[1] &&
		 IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 &&
		 outPortFIFOs_1_1$first == 3'd4,
		 flitBuffers_1$notEmpty[1] &&
		 IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 &&
		 outPortFIFOs_1_1$first == 3'd3,
		 flitBuffers_1$notEmpty[1] &&
		 IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 &&
		 outPortFIFOs_1_1$first == 3'd2,
		 flitBuffers_1$notEmpty[1] &&
		 IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 &&
		 outPortFIFOs_1_1$first == 3'd1,
		 flitBuffers_1$notEmpty[1] &&
		 IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 &&
		 outPortFIFOs_1_1$first == 3'd0 } ;
  assign IF_flitBuffers_2_notEmpty__13_BIT_0_14_THEN_IF_ETC___d153 =
	     flitBuffers_2$notEmpty[0] ?
	       IF_IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_si_ETC___d152 :
	       { flitBuffers_2$notEmpty[1] &&
		 IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 &&
		 outPortFIFOs_2_1$first == 3'd4,
		 flitBuffers_2$notEmpty[1] &&
		 IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 &&
		 outPortFIFOs_2_1$first == 3'd3,
		 flitBuffers_2$notEmpty[1] &&
		 IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 &&
		 outPortFIFOs_2_1$first == 3'd2,
		 flitBuffers_2$notEmpty[1] &&
		 IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 &&
		 outPortFIFOs_2_1$first == 3'd1,
		 flitBuffers_2$notEmpty[1] &&
		 IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 &&
		 outPortFIFOs_2_1$first == 3'd0 } ;
  assign IF_flitBuffers_3_notEmpty__2_BIT_0_3_THEN_IF_I_ETC___d112 =
	     flitBuffers_3$notEmpty[0] ?
	       IF_IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simp_ETC___d111 :
	       { flitBuffers_3$notEmpty[1] &&
		 IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 &&
		 outPortFIFOs_3_1$first == 3'd4,
		 flitBuffers_3$notEmpty[1] &&
		 IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 &&
		 outPortFIFOs_3_1$first == 3'd3,
		 flitBuffers_3$notEmpty[1] &&
		 IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 &&
		 outPortFIFOs_3_1$first == 3'd2,
		 flitBuffers_3$notEmpty[1] &&
		 IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 &&
		 outPortFIFOs_3_1$first == 3'd1,
		 flitBuffers_3$notEmpty[1] &&
		 IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 &&
		 outPortFIFOs_3_1$first == 3'd0 } ;
  assign IF_flitBuffers_4_notEmpty_BIT_0_THEN_IF_IF_out_ETC___d71 =
	     flitBuffers_4$notEmpty[0] ?
	       IF_IF_outPortFIFOs_4_first_EQ_0_THEN_simple_cr_ETC___d70 :
	       { flitBuffers_4$notEmpty[1] &&
		 IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 &&
		 outPortFIFOs_4_1$first == 3'd4,
		 flitBuffers_4$notEmpty[1] &&
		 IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 &&
		 outPortFIFOs_4_1$first == 3'd3,
		 flitBuffers_4$notEmpty[1] &&
		 IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 &&
		 outPortFIFOs_4_1$first == 3'd2,
		 flitBuffers_4$notEmpty[1] &&
		 IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 &&
		 outPortFIFOs_4_1$first == 3'd1,
		 flitBuffers_4$notEmpty[1] &&
		 IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 &&
		 outPortFIFOs_4_1$first == 3'd0 } ;
  assign IF_flitBuffers_notEmpty__96_BIT_0_97_THEN_IF_I_ETC___d236 =
	     flitBuffers$notEmpty[0] ?
	       IF_IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_si_ETC___d235 :
	       { flitBuffers$notEmpty[1] &&
		 IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 &&
		 outPortFIFOs_0_1$first == 3'd4,
		 flitBuffers$notEmpty[1] &&
		 IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 &&
		 outPortFIFOs_0_1$first == 3'd3,
		 flitBuffers$notEmpty[1] &&
		 IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 &&
		 outPortFIFOs_0_1$first == 3'd2,
		 flitBuffers$notEmpty[1] &&
		 IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 &&
		 outPortFIFOs_0_1$first == 3'd1,
		 flitBuffers$notEmpty[1] &&
		 IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 &&
		 outPortFIFOs_0_1$first == 3'd0 } ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d910 =
	     outport_encoder___d1114[3] ?
	       ((outport_encoder___d1114[2:0] == 3'd1) ?
		  3'd3 :
		  IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d914) :
	       IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d914 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d911 =
	     outport_encoder___d1114[3] ?
	       ((outport_encoder___d1114[2:0] == 3'd2) ?
		  3'd3 :
		  IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d915) :
	       IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d915 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d912 =
	     outport_encoder___d1114[3] ?
	       ((outport_encoder___d1114[2:0] == 3'd3) ?
		  outport_encoder___d1114[2:0] :
		  IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d916) :
	       IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d916 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d913 =
	     outport_encoder___d1114[3] ?
	       ((outport_encoder___d1114[2:0] == 3'd4) ?
		  3'd3 :
		  IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d917) :
	       IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d917 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1105 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] != 3'd0 &&
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d955 :
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d955 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1106 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] != 3'd1 &&
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d966 :
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d966 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1107 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] != 3'd2 &&
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d974 :
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d974 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1108 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] != 3'd3 &&
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d982 :
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d982 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1109 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] != 3'd4 &&
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d990 :
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d990 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d898 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] != 3'd0 &&
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d907 :
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d907 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d902 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] != 3'd0 &&
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d901 :
	       IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d901 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d903 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] != 3'd0 &&
	       outport_encoder___d1115[3] &&
	       outport_encoder___d1115[2:0] == 3'd0 :
	       outport_encoder___d1115[3] &&
	       outport_encoder___d1115[2:0] == 3'd0 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1126 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] == 3'd0 ||
	       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1125 :
	       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1125 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1131 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] == 3'd1 ||
	       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1130 :
	       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1130 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1136 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] == 3'd2 ||
	       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1135 :
	       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1135 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1141 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] == 3'd3 ||
	       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1140 :
	       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1140 ;
  assign IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1146 =
	     outport_encoder___d1114[3] ?
	       outport_encoder___d1114[2:0] == 3'd4 ||
	       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1145 :
	       IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1145 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d918 =
	     outport_encoder___d1116[3] ?
	       ((outport_encoder___d1116[2:0] == 3'd1) ?
		  outport_encoder___d1116[2:0] :
		  3'd0) :
	       3'd0 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d919 =
	     outport_encoder___d1116[3] ?
	       ((outport_encoder___d1116[2:0] == 3'd2) ? 3'd1 : 3'd0) :
	       3'd0 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d920 =
	     outport_encoder___d1116[3] ?
	       ((outport_encoder___d1116[2:0] == 3'd3) ? 3'd1 : 3'd0) :
	       3'd0 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d921 =
	     outport_encoder___d1116[3] ?
	       ((outport_encoder___d1116[2:0] == 3'd4) ? 3'd1 : 3'd0) :
	       3'd0 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d958 =
	     outport_encoder___d1116[3] ?
	       outport_encoder___d1116[2:0] != 3'd0 &&
	       (!outport_encoder___d1117[3] ||
		outport_encoder___d1117[2:0] != 3'd0) :
	       !outport_encoder___d1117[3] ||
	       outport_encoder___d1117[2:0] != 3'd0 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d968 =
	     outport_encoder___d1116[3] ?
	       outport_encoder___d1116[2:0] != 3'd1 &&
	       (!outport_encoder___d1117[3] ||
		outport_encoder___d1117[2:0] != 3'd1) :
	       !outport_encoder___d1117[3] ||
	       outport_encoder___d1117[2:0] != 3'd1 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d976 =
	     outport_encoder___d1116[3] ?
	       outport_encoder___d1116[2:0] != 3'd2 &&
	       (!outport_encoder___d1117[3] ||
		outport_encoder___d1117[2:0] != 3'd2) :
	       !outport_encoder___d1117[3] ||
	       outport_encoder___d1117[2:0] != 3'd2 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d984 =
	     outport_encoder___d1116[3] ?
	       outport_encoder___d1116[2:0] != 3'd3 &&
	       (!outport_encoder___d1117[3] ||
		outport_encoder___d1117[2:0] != 3'd3) :
	       !outport_encoder___d1117[3] ||
	       outport_encoder___d1117[2:0] != 3'd3 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d992 =
	     outport_encoder___d1116[3] ?
	       outport_encoder___d1116[2:0] != 3'd4 &&
	       (!outport_encoder___d1117[3] ||
		outport_encoder___d1117[2:0] != 3'd4) :
	       !outport_encoder___d1117[3] ||
	       outport_encoder___d1117[2:0] != 3'd4 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1124 =
	     outport_encoder___d1116[3] ?
	       outport_encoder___d1116[2:0] == 3'd0 ||
	       outport_encoder___d1117[3] &&
	       outport_encoder___d1117[2:0] == 3'd0 :
	       outport_encoder___d1117[3] &&
	       outport_encoder___d1117[2:0] == 3'd0 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1129 =
	     outport_encoder___d1116[3] ?
	       outport_encoder___d1116[2:0] == 3'd1 ||
	       outport_encoder___d1117[3] &&
	       outport_encoder___d1117[2:0] == 3'd1 :
	       outport_encoder___d1117[3] &&
	       outport_encoder___d1117[2:0] == 3'd1 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1134 =
	     outport_encoder___d1116[3] ?
	       outport_encoder___d1116[2:0] == 3'd2 ||
	       outport_encoder___d1117[3] &&
	       outport_encoder___d1117[2:0] == 3'd2 :
	       outport_encoder___d1117[3] &&
	       outport_encoder___d1117[2:0] == 3'd2 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1139 =
	     outport_encoder___d1116[3] ?
	       outport_encoder___d1116[2:0] == 3'd3 ||
	       outport_encoder___d1117[3] &&
	       outport_encoder___d1117[2:0] == 3'd3 :
	       outport_encoder___d1117[3] &&
	       outport_encoder___d1117[2:0] == 3'd3 ;
  assign IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1144 =
	     outport_encoder___d1116[3] ?
	       outport_encoder___d1116[2:0] == 3'd4 ||
	       outport_encoder___d1117[3] &&
	       outport_encoder___d1117[2:0] == 3'd4 :
	       outport_encoder___d1117[3] &&
	       outport_encoder___d1117[2:0] == 3'd4 ;
  assign IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1047 =
	     outport_encoder___d1113[3] ?
	       outport_encoder___d1113[2:0] != 3'd0 &&
	       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d898 :
	       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d898 ;
  assign IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1089 =
	     outport_encoder___d1113[3] ?
	       outport_encoder___d1113[2:0] != 3'd0 &&
	       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d902 :
	       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d902 ;
  assign IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1090 =
	     outport_encoder___d1113[3] ?
	       outport_encoder___d1113[2:0] != 3'd0 &&
	       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d903 :
	       IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d903 ;
  assign IF_outport_encoder_37_BIT_3_38_THEN_NOT_outpor_ETC___d1091 =
	     outport_encoder___d1113[3] ?
	       outport_encoder___d1113[2:0] != 3'd0 &&
	       outport_encoder___d1114[3] &&
	       outport_encoder___d1114[2:0] == 3'd0 :
	       outport_encoder___d1114[3] &&
	       outport_encoder___d1114[2:0] == 3'd0 ;
  assign IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1046 =
	     outport_encoder___d1113[3] ?
	       outport_encoder___d1113[2:0] == 3'd0 ||
	       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1126 :
	       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1126 ;
  assign IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1056 =
	     outport_encoder___d1113[3] ?
	       outport_encoder___d1113[2:0] == 3'd1 ||
	       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1131 :
	       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1131 ;
  assign IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1058 =
	     outport_encoder___d1113[3] ?
	       outport_encoder___d1113[2:0] == 3'd2 ||
	       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1136 :
	       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1136 ;
  assign IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1060 =
	     outport_encoder___d1113[3] ?
	       outport_encoder___d1113[2:0] == 3'd3 ||
	       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1141 :
	       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1141 ;
  assign IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1062 =
	     outport_encoder___d1113[3] ?
	       outport_encoder___d1113[2:0] == 3'd4 ||
	       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1146 :
	       IF_outport_encoder_02_BIT_3_03_THEN_outport_en_ETC___d1146 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d914 =
	     outport_encoder___d1115[3] ?
	       ((outport_encoder___d1115[2:0] == 3'd1) ?
		  3'd2 :
		  IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d918) :
	       IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d918 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d915 =
	     outport_encoder___d1115[3] ?
	       ((outport_encoder___d1115[2:0] == 3'd2) ?
		  outport_encoder___d1115[2:0] :
		  IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d919) :
	       IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d919 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d916 =
	     outport_encoder___d1115[3] ?
	       ((outport_encoder___d1115[2:0] == 3'd3) ?
		  3'd2 :
		  IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d920) :
	       IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d920 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_IF_outport_ETC___d917 =
	     outport_encoder___d1115[3] ?
	       ((outport_encoder___d1115[2:0] == 3'd4) ?
		  3'd2 :
		  IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d921) :
	       IF_outport_encoder_32_BIT_3_33_THEN_IF_outport_ETC___d921 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d901 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] != 3'd0 &&
	       outport_encoder___d1116[3] &&
	       outport_encoder___d1116[2:0] == 3'd0 :
	       outport_encoder___d1116[3] &&
	       outport_encoder___d1116[2:0] == 3'd0 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d907 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] != 3'd0 &&
	       (!outport_encoder___d1116[3] ||
		outport_encoder___d1116[2:0] != 3'd0) :
	       !outport_encoder___d1116[3] ||
	       outport_encoder___d1116[2:0] != 3'd0 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d955 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] != 3'd0 &&
	       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d958 :
	       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d958 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d966 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] != 3'd1 &&
	       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d968 :
	       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d968 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d974 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] != 3'd2 &&
	       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d976 :
	       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d976 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d982 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] != 3'd3 &&
	       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d984 :
	       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d984 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_NOT_outpor_ETC___d990 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] != 3'd4 &&
	       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d992 :
	       IF_outport_encoder_32_BIT_3_33_THEN_NOT_outpor_ETC___d992 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1125 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] == 3'd0 ||
	       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1124 :
	       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1124 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1130 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] == 3'd1 ||
	       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1129 :
	       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1129 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1135 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] == 3'd2 ||
	       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1134 :
	       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1134 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1140 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] == 3'd3 ||
	       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1139 :
	       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1139 ;
  assign IF_outport_encoder_67_BIT_3_68_THEN_outport_en_ETC___d1145 =
	     outport_encoder___d1115[3] ?
	       outport_encoder___d1115[2:0] == 3'd4 ||
	       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1144 :
	       IF_outport_encoder_32_BIT_3_33_THEN_outport_en_ETC___d1144 ;
  assign active_in__h48706 =
	     outport_encoder___d1113[3] ?
	       ((outport_encoder___d1113[2:0] == 3'd1) ?
		  3'd4 :
		  IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d910) :
	       IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d910 ;
  assign active_in__h50467 =
	     outport_encoder___d1113[3] ?
	       ((outport_encoder___d1113[2:0] == 3'd2) ?
		  3'd4 :
		  IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d911) :
	       IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d911 ;
  assign active_in__h52228 =
	     outport_encoder___d1113[3] ?
	       ((outport_encoder___d1113[2:0] == 3'd3) ?
		  3'd4 :
		  IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d912) :
	       IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d912 ;
  assign active_in__h53989 =
	     outport_encoder___d1113[3] ?
	       ((outport_encoder___d1113[2:0] == 3'd4) ?
		  outport_encoder___d1113[2:0] :
		  IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d913) :
	       IF_outport_encoder_02_BIT_3_03_THEN_IF_outport_ETC___d913 ;
  assign fifo_out__h36476 =
	     !flitBuffers$notEmpty[0] ||
	     IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_NOT_s_ETC___d304 ;
  assign fifo_out__h37661 =
	     !flitBuffers_1$notEmpty[0] ||
	     IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_NOT_s_ETC___d339 ;
  assign fifo_out__h38207 =
	     !flitBuffers_2$notEmpty[0] ||
	     IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_NOT_s_ETC___d374 ;
  assign fifo_out__h38753 =
	     !flitBuffers_3$notEmpty[0] ||
	     IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_NOT_sim_ETC___d409 ;
  assign fifo_out__h39299 =
	     !flitBuffers_4$notEmpty[0] ||
	     IF_outPortFIFOs_4_first_EQ_0_THEN_NOT_simple_c_ETC___d444 ;
  always@(outPortFIFOs_0$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_0$first)
      3'd0:
	  IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_NOT_s_ETC___d304 =
	      !EN_out_ports_0_putNonFullVCs ||
	      !out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_NOT_s_ETC___d304 =
	      !EN_out_ports_1_putNonFullVCs ||
	      !out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_NOT_s_ETC___d304 =
	      !EN_out_ports_2_putNonFullVCs ||
	      !out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_NOT_s_ETC___d304 =
	      !EN_out_ports_3_putNonFullVCs ||
	      !out_ports_3_putNonFullVCs_nonFullVCs[0];
      3'd4:
	  IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_NOT_s_ETC___d304 =
	      !EN_out_ports_4_putNonFullVCs ||
	      !out_ports_4_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_NOT_s_ETC___d304 =
		   !EN_out_ports_4_putNonFullVCs ||
		   !out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(outPortFIFOs_1$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_1$first)
      3'd0:
	  IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_NOT_s_ETC___d339 =
	      !EN_out_ports_0_putNonFullVCs ||
	      !out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_NOT_s_ETC___d339 =
	      !EN_out_ports_1_putNonFullVCs ||
	      !out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_NOT_s_ETC___d339 =
	      !EN_out_ports_2_putNonFullVCs ||
	      !out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_NOT_s_ETC___d339 =
	      !EN_out_ports_3_putNonFullVCs ||
	      !out_ports_3_putNonFullVCs_nonFullVCs[0];
      3'd4:
	  IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_NOT_s_ETC___d339 =
	      !EN_out_ports_4_putNonFullVCs ||
	      !out_ports_4_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_NOT_s_ETC___d339 =
		   !EN_out_ports_4_putNonFullVCs ||
		   !out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(outPortFIFOs_2$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_2$first)
      3'd0:
	  IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_NOT_s_ETC___d374 =
	      !EN_out_ports_0_putNonFullVCs ||
	      !out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_NOT_s_ETC___d374 =
	      !EN_out_ports_1_putNonFullVCs ||
	      !out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_NOT_s_ETC___d374 =
	      !EN_out_ports_2_putNonFullVCs ||
	      !out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_NOT_s_ETC___d374 =
	      !EN_out_ports_3_putNonFullVCs ||
	      !out_ports_3_putNonFullVCs_nonFullVCs[0];
      3'd4:
	  IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_NOT_s_ETC___d374 =
	      !EN_out_ports_4_putNonFullVCs ||
	      !out_ports_4_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_NOT_s_ETC___d374 =
		   !EN_out_ports_4_putNonFullVCs ||
		   !out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(outPortFIFOs_3$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_3$first)
      3'd0:
	  IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_NOT_sim_ETC___d409 =
	      !EN_out_ports_0_putNonFullVCs ||
	      !out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_NOT_sim_ETC___d409 =
	      !EN_out_ports_1_putNonFullVCs ||
	      !out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_NOT_sim_ETC___d409 =
	      !EN_out_ports_2_putNonFullVCs ||
	      !out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_NOT_sim_ETC___d409 =
	      !EN_out_ports_3_putNonFullVCs ||
	      !out_ports_3_putNonFullVCs_nonFullVCs[0];
      3'd4:
	  IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_NOT_sim_ETC___d409 =
	      !EN_out_ports_4_putNonFullVCs ||
	      !out_ports_4_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_NOT_sim_ETC___d409 =
		   !EN_out_ports_4_putNonFullVCs ||
		   !out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(outPortFIFOs_4$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_4$first)
      3'd0:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_NOT_simple_c_ETC___d444 =
	      !EN_out_ports_0_putNonFullVCs ||
	      !out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_NOT_simple_c_ETC___d444 =
	      !EN_out_ports_1_putNonFullVCs ||
	      !out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_NOT_simple_c_ETC___d444 =
	      !EN_out_ports_2_putNonFullVCs ||
	      !out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_NOT_simple_c_ETC___d444 =
	      !EN_out_ports_3_putNonFullVCs ||
	      !out_ports_3_putNonFullVCs_nonFullVCs[0];
      3'd4:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_NOT_simple_c_ETC___d444 =
	      !EN_out_ports_4_putNonFullVCs ||
	      !out_ports_4_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_4_first_EQ_0_THEN_NOT_simple_c_ETC___d444 =
		   !EN_out_ports_4_putNonFullVCs ||
		   !out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(outPortFIFOs_4_1$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_4_1$first)
      3'd0:
	  IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[1];
      3'd1:
	  IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[1];
      3'd2:
	  IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[1];
      3'd3:
	  IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[1];
      default: IF_outPortFIFOs_4_1_first__2_EQ_0_3_THEN_simpl_ETC___d1007 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[1];
    endcase
  end
  always@(outPortFIFOs_4$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_4$first)
      3'd0:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d944 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d944 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d944 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d944 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d944 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(outPortFIFOs_3_1$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_3_1$first)
      3'd0:
	  IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[1];
      3'd1:
	  IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[1];
      3'd2:
	  IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[1];
      3'd3:
	  IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[1];
      default: IF_outPortFIFOs_3_1_first__8_EQ_0_9_THEN_simpl_ETC___d1013 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[1];
    endcase
  end
  always@(outPortFIFOs_3$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_3$first)
      3'd0:
	  IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simple__ETC___d946 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simple__ETC___d946 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simple__ETC___d946 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simple__ETC___d946 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_3_first__4_EQ_0_5_THEN_simple__ETC___d946 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(outPortFIFOs_2_1$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_2_1$first)
      3'd0:
	  IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[1];
      3'd1:
	  IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[1];
      3'd2:
	  IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[1];
      3'd3:
	  IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[1];
      default: IF_outPortFIFOs_2_1_first__29_EQ_0_30_THEN_sim_ETC___d1019 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[1];
    endcase
  end
  always@(outPortFIFOs_2$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_2$first)
      3'd0:
	  IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_simpl_ETC___d948 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_simpl_ETC___d948 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_simpl_ETC___d948 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_simpl_ETC___d948 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_2_first__15_EQ_0_16_THEN_simpl_ETC___d948 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(outPortFIFOs_1_1$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_1_1$first)
      3'd0:
	  IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[1];
      3'd1:
	  IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[1];
      3'd2:
	  IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[1];
      3'd3:
	  IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[1];
      default: IF_outPortFIFOs_1_1_first__71_EQ_0_72_THEN_sim_ETC___d1026 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[1];
    endcase
  end
  always@(outPortFIFOs_0_1$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_0_1$first)
      3'd0:
	  IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[1];
      3'd1:
	  IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[1];
      3'd2:
	  IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[1];
      3'd3:
	  IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[1];
      default: IF_outPortFIFOs_0_1_first__12_EQ_0_13_THEN_sim_ETC___d1033 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[1];
    endcase
  end
  always@(outPortFIFOs_1$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_1$first)
      3'd0:
	  IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_simpl_ETC___d950 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_simpl_ETC___d950 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_simpl_ETC___d950 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_simpl_ETC___d950 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_1_first__57_EQ_0_58_THEN_simpl_ETC___d950 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(outPortFIFOs_0$first or
	  EN_out_ports_4_putNonFullVCs or
	  out_ports_4_putNonFullVCs_nonFullVCs or
	  EN_out_ports_0_putNonFullVCs or
	  out_ports_0_putNonFullVCs_nonFullVCs or
	  EN_out_ports_1_putNonFullVCs or
	  out_ports_1_putNonFullVCs_nonFullVCs or
	  EN_out_ports_2_putNonFullVCs or
	  out_ports_2_putNonFullVCs_nonFullVCs or
	  EN_out_ports_3_putNonFullVCs or
	  out_ports_3_putNonFullVCs_nonFullVCs)
  begin
    case (outPortFIFOs_0$first)
      3'd0:
	  IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_simpl_ETC___d952 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_simpl_ETC___d952 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_simpl_ETC___d952 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_simpl_ETC___d952 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_0_first__98_EQ_0_99_THEN_simpl_ETC___d952 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(active_in__h48706 or
	  outport_encoder___d1113 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d1117 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d1116 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d1115 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d1114 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h48706)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d671 =
	      outport_encoder___d1117[3] && hasFlitsToSend_perIn$wget[70];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d671 =
	      outport_encoder___d1116[3] && hasFlitsToSend_perIn_1$wget[70];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d671 =
	      outport_encoder___d1115[3] && hasFlitsToSend_perIn_2$wget[70];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d671 =
	      outport_encoder___d1114[3] && hasFlitsToSend_perIn_3$wget[70];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d671 =
		   active_in__h48706 != 3'd4 ||
		   outport_encoder___d1113[3] &&
		   hasFlitsToSend_perIn_4$wget[70];
    endcase
  end
  always@(active_in__h50467 or
	  outport_encoder___d1113 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d1117 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d1116 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d1115 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d1114 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h50467)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d735 =
	      outport_encoder___d1117[3] && hasFlitsToSend_perIn$wget[70];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d735 =
	      outport_encoder___d1116[3] && hasFlitsToSend_perIn_1$wget[70];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d735 =
	      outport_encoder___d1115[3] && hasFlitsToSend_perIn_2$wget[70];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d735 =
	      outport_encoder___d1114[3] && hasFlitsToSend_perIn_3$wget[70];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d735 =
		   active_in__h50467 != 3'd4 ||
		   outport_encoder___d1113[3] &&
		   hasFlitsToSend_perIn_4$wget[70];
    endcase
  end
  always@(active_in__h52228 or
	  outport_encoder___d1113 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d1117 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d1116 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d1115 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d1114 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h52228)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d799 =
	      outport_encoder___d1117[3] && hasFlitsToSend_perIn$wget[70];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d799 =
	      outport_encoder___d1116[3] && hasFlitsToSend_perIn_1$wget[70];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d799 =
	      outport_encoder___d1115[3] && hasFlitsToSend_perIn_2$wget[70];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d799 =
	      outport_encoder___d1114[3] && hasFlitsToSend_perIn_3$wget[70];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d799 =
		   active_in__h52228 != 3'd4 ||
		   outport_encoder___d1113[3] &&
		   hasFlitsToSend_perIn_4$wget[70];
    endcase
  end
  always@(active_in__h53989 or
	  outport_encoder___d1113 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d1117 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d1116 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d1115 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d1114 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h53989)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d863 =
	      outport_encoder___d1117[3] && hasFlitsToSend_perIn$wget[70];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d863 =
	      outport_encoder___d1116[3] && hasFlitsToSend_perIn_1$wget[70];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d863 =
	      outport_encoder___d1115[3] && hasFlitsToSend_perIn_2$wget[70];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d863 =
	      outport_encoder___d1114[3] && hasFlitsToSend_perIn_3$wget[70];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d863 =
		   active_in__h53989 != 3'd4 ||
		   outport_encoder___d1113[3] &&
		   hasFlitsToSend_perIn_4$wget[70];
    endcase
  end
  always@(active_in__h48706 or
	  outport_encoder___d1113 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d1117 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d1116 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d1115 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d1114 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h48706)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1172 =
	      !outport_encoder___d1117[3] || !hasFlitsToSend_perIn$wget[70];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1172 =
	      !outport_encoder___d1116[3] || !hasFlitsToSend_perIn_1$wget[70];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1172 =
	      !outport_encoder___d1115[3] || !hasFlitsToSend_perIn_2$wget[70];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1172 =
	      !outport_encoder___d1114[3] || !hasFlitsToSend_perIn_3$wget[70];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1172 =
		   active_in__h48706 == 3'd4 &&
		   (!outport_encoder___d1113[3] ||
		    !hasFlitsToSend_perIn_4$wget[70]);
    endcase
  end
  always@(active_in__h50467 or
	  outport_encoder___d1113 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d1117 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d1116 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d1115 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d1114 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h50467)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1173 =
	      !outport_encoder___d1117[3] || !hasFlitsToSend_perIn$wget[70];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1173 =
	      !outport_encoder___d1116[3] || !hasFlitsToSend_perIn_1$wget[70];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1173 =
	      !outport_encoder___d1115[3] || !hasFlitsToSend_perIn_2$wget[70];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1173 =
	      !outport_encoder___d1114[3] || !hasFlitsToSend_perIn_3$wget[70];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1173 =
		   active_in__h50467 == 3'd4 &&
		   (!outport_encoder___d1113[3] ||
		    !hasFlitsToSend_perIn_4$wget[70]);
    endcase
  end
  always@(active_in__h52228 or
	  outport_encoder___d1113 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d1117 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d1116 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d1115 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d1114 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h52228)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1174 =
	      !outport_encoder___d1117[3] || !hasFlitsToSend_perIn$wget[70];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1174 =
	      !outport_encoder___d1116[3] || !hasFlitsToSend_perIn_1$wget[70];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1174 =
	      !outport_encoder___d1115[3] || !hasFlitsToSend_perIn_2$wget[70];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1174 =
	      !outport_encoder___d1114[3] || !hasFlitsToSend_perIn_3$wget[70];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1174 =
		   active_in__h52228 == 3'd4 &&
		   (!outport_encoder___d1113[3] ||
		    !hasFlitsToSend_perIn_4$wget[70]);
    endcase
  end
  always@(active_in__h53989 or
	  outport_encoder___d1113 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d1117 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d1116 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d1115 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d1114 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h53989)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1175 =
	      !outport_encoder___d1117[3] || !hasFlitsToSend_perIn$wget[70];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1175 =
	      !outport_encoder___d1116[3] || !hasFlitsToSend_perIn_1$wget[70];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1175 =
	      !outport_encoder___d1115[3] || !hasFlitsToSend_perIn_2$wget[70];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1175 =
	      !outport_encoder___d1114[3] || !hasFlitsToSend_perIn_3$wget[70];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1175 =
		   active_in__h53989 == 3'd4 &&
		   (!outport_encoder___d1113[3] ||
		    !hasFlitsToSend_perIn_4$wget[70]);
    endcase
  end
  always@(active_in__h48706 or
	  hasFlitsToSend_perIn_4$wget or
	  hasFlitsToSend_perIn$wget or
	  hasFlitsToSend_perIn_1$wget or
	  hasFlitsToSend_perIn_2$wget or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h48706)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1162 =
	      hasFlitsToSend_perIn$wget[69:0];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1162 =
	      hasFlitsToSend_perIn_1$wget[69:0];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1162 =
	      hasFlitsToSend_perIn_2$wget[69:0];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1162 =
	      hasFlitsToSend_perIn_3$wget[69:0];
      3'd4:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1162 =
	      hasFlitsToSend_perIn_4$wget[69:0];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1162 =
		   hasFlitsToSend_perIn_4$wget[69:0];
    endcase
  end
  always@(active_in__h50467 or
	  hasFlitsToSend_perIn_4$wget or
	  hasFlitsToSend_perIn$wget or
	  hasFlitsToSend_perIn_1$wget or
	  hasFlitsToSend_perIn_2$wget or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h50467)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1163 =
	      hasFlitsToSend_perIn$wget[69:0];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1163 =
	      hasFlitsToSend_perIn_1$wget[69:0];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1163 =
	      hasFlitsToSend_perIn_2$wget[69:0];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1163 =
	      hasFlitsToSend_perIn_3$wget[69:0];
      3'd4:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1163 =
	      hasFlitsToSend_perIn_4$wget[69:0];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1163 =
		   hasFlitsToSend_perIn_4$wget[69:0];
    endcase
  end
  always@(active_in__h52228 or
	  hasFlitsToSend_perIn_4$wget or
	  hasFlitsToSend_perIn$wget or
	  hasFlitsToSend_perIn_1$wget or
	  hasFlitsToSend_perIn_2$wget or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h52228)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1164 =
	      hasFlitsToSend_perIn$wget[69:0];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1164 =
	      hasFlitsToSend_perIn_1$wget[69:0];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1164 =
	      hasFlitsToSend_perIn_2$wget[69:0];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1164 =
	      hasFlitsToSend_perIn_3$wget[69:0];
      3'd4:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1164 =
	      hasFlitsToSend_perIn_4$wget[69:0];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1164 =
		   hasFlitsToSend_perIn_4$wget[69:0];
    endcase
  end
  always@(active_in__h53989 or
	  hasFlitsToSend_perIn_4$wget or
	  hasFlitsToSend_perIn$wget or
	  hasFlitsToSend_perIn_1$wget or
	  hasFlitsToSend_perIn_2$wget or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h53989)
      3'd0:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1165 =
	      hasFlitsToSend_perIn$wget[69:0];
      3'd1:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1165 =
	      hasFlitsToSend_perIn_1$wget[69:0];
      3'd2:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1165 =
	      hasFlitsToSend_perIn_2$wget[69:0];
      3'd3:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1165 =
	      hasFlitsToSend_perIn_3$wget[69:0];
      3'd4:
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1165 =
	      hasFlitsToSend_perIn_4$wget[69:0];
      default: IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1165 =
		   hasFlitsToSend_perIn_4$wget[69:0];
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        activeVC_perIn_reg <= `BSV_ASSIGNMENT_DELAY
	    { 1'd0, 1'bx /* unspecified value */  };
	activeVC_perIn_reg_1 <= `BSV_ASSIGNMENT_DELAY
	    { 1'd0, 1'bx /* unspecified value */  };
	activeVC_perIn_reg_2 <= `BSV_ASSIGNMENT_DELAY
	    { 1'd0, 1'bx /* unspecified value */  };
	activeVC_perIn_reg_3 <= `BSV_ASSIGNMENT_DELAY
	    { 1'd0, 1'bx /* unspecified value */  };
	activeVC_perIn_reg_4 <= `BSV_ASSIGNMENT_DELAY
	    { 1'd0, 1'bx /* unspecified value */  };
	inPortVL_0 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_0_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_1_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_2 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_2_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_3 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_3_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_4 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_4_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	lockedVL_0 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_0_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_1_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_2_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_3_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_4 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_4_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_0 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_0_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_0_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_0_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_0_4 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_1_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_1_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_1_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_1_4 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_2_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_2_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_2_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_2_4 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_3_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_3_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_3_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_3_4 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_4 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_4_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_4_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_4_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	selectedIO_reg_4_4 <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (activeVC_perIn_reg$EN)
	  activeVC_perIn_reg <= `BSV_ASSIGNMENT_DELAY activeVC_perIn_reg$D_IN;
	if (activeVC_perIn_reg_1$EN)
	  activeVC_perIn_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      activeVC_perIn_reg_1$D_IN;
	if (activeVC_perIn_reg_2$EN)
	  activeVC_perIn_reg_2 <= `BSV_ASSIGNMENT_DELAY
	      activeVC_perIn_reg_2$D_IN;
	if (activeVC_perIn_reg_3$EN)
	  activeVC_perIn_reg_3 <= `BSV_ASSIGNMENT_DELAY
	      activeVC_perIn_reg_3$D_IN;
	if (activeVC_perIn_reg_4$EN)
	  activeVC_perIn_reg_4 <= `BSV_ASSIGNMENT_DELAY
	      activeVC_perIn_reg_4$D_IN;
	if (inPortVL_0$EN)
	  inPortVL_0 <= `BSV_ASSIGNMENT_DELAY inPortVL_0$D_IN;
	if (inPortVL_0_1$EN)
	  inPortVL_0_1 <= `BSV_ASSIGNMENT_DELAY inPortVL_0_1$D_IN;
	if (inPortVL_1$EN)
	  inPortVL_1 <= `BSV_ASSIGNMENT_DELAY inPortVL_1$D_IN;
	if (inPortVL_1_1$EN)
	  inPortVL_1_1 <= `BSV_ASSIGNMENT_DELAY inPortVL_1_1$D_IN;
	if (inPortVL_2$EN)
	  inPortVL_2 <= `BSV_ASSIGNMENT_DELAY inPortVL_2$D_IN;
	if (inPortVL_2_1$EN)
	  inPortVL_2_1 <= `BSV_ASSIGNMENT_DELAY inPortVL_2_1$D_IN;
	if (inPortVL_3$EN)
	  inPortVL_3 <= `BSV_ASSIGNMENT_DELAY inPortVL_3$D_IN;
	if (inPortVL_3_1$EN)
	  inPortVL_3_1 <= `BSV_ASSIGNMENT_DELAY inPortVL_3_1$D_IN;
	if (inPortVL_4$EN)
	  inPortVL_4 <= `BSV_ASSIGNMENT_DELAY inPortVL_4$D_IN;
	if (inPortVL_4_1$EN)
	  inPortVL_4_1 <= `BSV_ASSIGNMENT_DELAY inPortVL_4_1$D_IN;
	if (lockedVL_0$EN)
	  lockedVL_0 <= `BSV_ASSIGNMENT_DELAY lockedVL_0$D_IN;
	if (lockedVL_0_1$EN)
	  lockedVL_0_1 <= `BSV_ASSIGNMENT_DELAY lockedVL_0_1$D_IN;
	if (lockedVL_1$EN)
	  lockedVL_1 <= `BSV_ASSIGNMENT_DELAY lockedVL_1$D_IN;
	if (lockedVL_1_1$EN)
	  lockedVL_1_1 <= `BSV_ASSIGNMENT_DELAY lockedVL_1_1$D_IN;
	if (lockedVL_2$EN)
	  lockedVL_2 <= `BSV_ASSIGNMENT_DELAY lockedVL_2$D_IN;
	if (lockedVL_2_1$EN)
	  lockedVL_2_1 <= `BSV_ASSIGNMENT_DELAY lockedVL_2_1$D_IN;
	if (lockedVL_3$EN)
	  lockedVL_3 <= `BSV_ASSIGNMENT_DELAY lockedVL_3$D_IN;
	if (lockedVL_3_1$EN)
	  lockedVL_3_1 <= `BSV_ASSIGNMENT_DELAY lockedVL_3_1$D_IN;
	if (lockedVL_4$EN)
	  lockedVL_4 <= `BSV_ASSIGNMENT_DELAY lockedVL_4$D_IN;
	if (lockedVL_4_1$EN)
	  lockedVL_4_1 <= `BSV_ASSIGNMENT_DELAY lockedVL_4_1$D_IN;
	if (selectedIO_reg_0$EN)
	  selectedIO_reg_0 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_0$D_IN;
	if (selectedIO_reg_0_1$EN)
	  selectedIO_reg_0_1 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_0_1$D_IN;
	if (selectedIO_reg_0_2$EN)
	  selectedIO_reg_0_2 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_0_2$D_IN;
	if (selectedIO_reg_0_3$EN)
	  selectedIO_reg_0_3 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_0_3$D_IN;
	if (selectedIO_reg_0_4$EN)
	  selectedIO_reg_0_4 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_0_4$D_IN;
	if (selectedIO_reg_1$EN)
	  selectedIO_reg_1 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_1$D_IN;
	if (selectedIO_reg_1_1$EN)
	  selectedIO_reg_1_1 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_1_1$D_IN;
	if (selectedIO_reg_1_2$EN)
	  selectedIO_reg_1_2 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_1_2$D_IN;
	if (selectedIO_reg_1_3$EN)
	  selectedIO_reg_1_3 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_1_3$D_IN;
	if (selectedIO_reg_1_4$EN)
	  selectedIO_reg_1_4 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_1_4$D_IN;
	if (selectedIO_reg_2$EN)
	  selectedIO_reg_2 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_2$D_IN;
	if (selectedIO_reg_2_1$EN)
	  selectedIO_reg_2_1 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_2_1$D_IN;
	if (selectedIO_reg_2_2$EN)
	  selectedIO_reg_2_2 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_2_2$D_IN;
	if (selectedIO_reg_2_3$EN)
	  selectedIO_reg_2_3 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_2_3$D_IN;
	if (selectedIO_reg_2_4$EN)
	  selectedIO_reg_2_4 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_2_4$D_IN;
	if (selectedIO_reg_3$EN)
	  selectedIO_reg_3 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_3$D_IN;
	if (selectedIO_reg_3_1$EN)
	  selectedIO_reg_3_1 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_3_1$D_IN;
	if (selectedIO_reg_3_2$EN)
	  selectedIO_reg_3_2 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_3_2$D_IN;
	if (selectedIO_reg_3_3$EN)
	  selectedIO_reg_3_3 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_3_3$D_IN;
	if (selectedIO_reg_3_4$EN)
	  selectedIO_reg_3_4 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_3_4$D_IN;
	if (selectedIO_reg_4$EN)
	  selectedIO_reg_4 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_4$D_IN;
	if (selectedIO_reg_4_1$EN)
	  selectedIO_reg_4_1 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_4_1$D_IN;
	if (selectedIO_reg_4_2$EN)
	  selectedIO_reg_4_2 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_4_2$D_IN;
	if (selectedIO_reg_4_3$EN)
	  selectedIO_reg_4_3 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_4_3$D_IN;
	if (selectedIO_reg_4_4$EN)
	  selectedIO_reg_4_4 <= `BSV_ASSIGNMENT_DELAY selectedIO_reg_4_4$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    activeVC_perIn_reg = 2'h2;
    activeVC_perIn_reg_1 = 2'h2;
    activeVC_perIn_reg_2 = 2'h2;
    activeVC_perIn_reg_3 = 2'h2;
    activeVC_perIn_reg_4 = 2'h2;
    inPortVL_0 = 3'h2;
    inPortVL_0_1 = 3'h2;
    inPortVL_1 = 3'h2;
    inPortVL_1_1 = 3'h2;
    inPortVL_2 = 3'h2;
    inPortVL_2_1 = 3'h2;
    inPortVL_3 = 3'h2;
    inPortVL_3_1 = 3'h2;
    inPortVL_4 = 3'h2;
    inPortVL_4_1 = 3'h2;
    lockedVL_0 = 1'h0;
    lockedVL_0_1 = 1'h0;
    lockedVL_1 = 1'h0;
    lockedVL_1_1 = 1'h0;
    lockedVL_2 = 1'h0;
    lockedVL_2_1 = 1'h0;
    lockedVL_3 = 1'h0;
    lockedVL_3_1 = 1'h0;
    lockedVL_4 = 1'h0;
    lockedVL_4_1 = 1'h0;
    selectedIO_reg_0 = 1'h0;
    selectedIO_reg_0_1 = 1'h0;
    selectedIO_reg_0_2 = 1'h0;
    selectedIO_reg_0_3 = 1'h0;
    selectedIO_reg_0_4 = 1'h0;
    selectedIO_reg_1 = 1'h0;
    selectedIO_reg_1_1 = 1'h0;
    selectedIO_reg_1_2 = 1'h0;
    selectedIO_reg_1_3 = 1'h0;
    selectedIO_reg_1_4 = 1'h0;
    selectedIO_reg_2 = 1'h0;
    selectedIO_reg_2_1 = 1'h0;
    selectedIO_reg_2_2 = 1'h0;
    selectedIO_reg_2_3 = 1'h0;
    selectedIO_reg_2_4 = 1'h0;
    selectedIO_reg_3 = 1'h0;
    selectedIO_reg_3_1 = 1'h0;
    selectedIO_reg_3_2 = 1'h0;
    selectedIO_reg_3_3 = 1'h0;
    selectedIO_reg_3_4 = 1'h0;
    selectedIO_reg_4 = 1'h0;
    selectedIO_reg_4_1 = 1'h0;
    selectedIO_reg_4_2 = 1'h0;
    selectedIO_reg_4_3 = 1'h0;
    selectedIO_reg_4_4 = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N) if (EN_out_ports_0_putNonFullVCs) $write("");
    if (RST_N) if (EN_out_ports_0_putNonFullVCs) $write("");
    if (RST_N) if (EN_out_ports_1_putNonFullVCs) $write("");
    if (RST_N) if (EN_out_ports_1_putNonFullVCs) $write("");
    if (RST_N) if (EN_out_ports_2_putNonFullVCs) $write("");
    if (RST_N) if (EN_out_ports_2_putNonFullVCs) $write("");
    if (RST_N) if (EN_out_ports_3_putNonFullVCs) $write("");
    if (RST_N) if (EN_out_ports_3_putNonFullVCs) $write("");
    if (RST_N) if (EN_out_ports_4_putNonFullVCs) $write("");
    if (RST_N) if (EN_out_ports_4_putNonFullVCs) $write("");
    if (RST_N)
      if (outport_encoder___d1117[3] &&
	  flitBuffers$deq[64] != fifo_out__h36476)
	$write("");
    if (RST_N)
      if (outport_encoder___d1116[3] &&
	  flitBuffers_1$deq[64] != fifo_out__h37661)
	$write("");
    if (RST_N)
      if (outport_encoder___d1115[3] &&
	  flitBuffers_2$deq[64] != fifo_out__h38207)
	$write("");
    if (RST_N)
      if (outport_encoder___d1114[3] &&
	  flitBuffers_3$deq[64] != fifo_out__h38753)
	$write("");
    if (RST_N)
      if (outport_encoder___d1113[3] &&
	  flitBuffers_4$deq[64] != fifo_out__h39299)
	$write("");
    if (RST_N)
      if (EN_out_ports_0_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1046 &&
	  (outport_encoder___d1113[3] ?
	     outport_encoder___d1113[2:0] != 3'd0 &&
	     IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1105 :
	     IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1105))
	$write("");
    if (RST_N)
      if (EN_out_ports_0_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1046 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d1171)
	$display("Dynamic assertion failed: \"RouterSimple.bsv\", line 759, column 47\nOutput selected invalid flit!");
    if (RST_N)
      if (EN_out_ports_0_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1046 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d1171)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_0_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1046 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d1171)
	$display("Dynamic assertion failed: \"RouterSimple.bsv\", line 780, column 47\nAllocation selected input port with invalid flit!");
    if (RST_N)
      if (EN_out_ports_0_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1046 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_NOT_out_ETC___d1171)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_1_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1056 &&
	  (outport_encoder___d1113[3] ?
	     outport_encoder___d1113[2:0] != 3'd1 &&
	     IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1106 :
	     IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1106))
	$write("");
    if (RST_N)
      if (EN_out_ports_1_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1056 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1172)
	$display("Dynamic assertion failed: \"RouterSimple.bsv\", line 759, column 47\nOutput selected invalid flit!");
    if (RST_N)
      if (EN_out_ports_1_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1056 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1172)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_1_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1056 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1172)
	$display("Dynamic assertion failed: \"RouterSimple.bsv\", line 780, column 47\nAllocation selected input port with invalid flit!");
    if (RST_N)
      if (EN_out_ports_1_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1056 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1172)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_2_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1058 &&
	  (outport_encoder___d1113[3] ?
	     outport_encoder___d1113[2:0] != 3'd2 &&
	     IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1107 :
	     IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1107))
	$write("");
    if (RST_N)
      if (EN_out_ports_2_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1058 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1173)
	$display("Dynamic assertion failed: \"RouterSimple.bsv\", line 759, column 47\nOutput selected invalid flit!");
    if (RST_N)
      if (EN_out_ports_2_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1058 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1173)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_2_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1058 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1173)
	$display("Dynamic assertion failed: \"RouterSimple.bsv\", line 780, column 47\nAllocation selected input port with invalid flit!");
    if (RST_N)
      if (EN_out_ports_2_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1058 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1173)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_3_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1060 &&
	  (outport_encoder___d1113[3] ?
	     outport_encoder___d1113[2:0] != 3'd3 &&
	     IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1108 :
	     IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1108))
	$write("");
    if (RST_N)
      if (EN_out_ports_3_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1060 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1174)
	$display("Dynamic assertion failed: \"RouterSimple.bsv\", line 759, column 47\nOutput selected invalid flit!");
    if (RST_N)
      if (EN_out_ports_3_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1060 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1174)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_3_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1060 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1174)
	$display("Dynamic assertion failed: \"RouterSimple.bsv\", line 780, column 47\nAllocation selected input port with invalid flit!");
    if (RST_N)
      if (EN_out_ports_3_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1060 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1174)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_4_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1062 &&
	  (outport_encoder___d1113[3] ?
	     outport_encoder___d1113[2:0] != 3'd4 &&
	     IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1109 :
	     IF_outport_encoder_02_BIT_3_03_THEN_NOT_outpor_ETC___d1109))
	$write("");
    if (RST_N)
      if (EN_out_ports_4_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1062 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1175)
	$display("Dynamic assertion failed: \"RouterSimple.bsv\", line 759, column 47\nOutput selected invalid flit!");
    if (RST_N)
      if (EN_out_ports_4_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1062 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1175)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_4_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1062 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1175)
	$display("Dynamic assertion failed: \"RouterSimple.bsv\", line 780, column 47\nAllocation selected input port with invalid flit!");
    if (RST_N)
      if (EN_out_ports_4_getFlit &&
	  IF_outport_encoder_37_BIT_3_38_THEN_outport_en_ETC___d1062 &&
	  IF_IF_outport_encoder_37_BIT_3_38_THEN_IF_outp_ETC___d1175)
	$finish(32'd0);
  end
  // synopsys translate_on
endmodule