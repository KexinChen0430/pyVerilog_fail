module outputs
  wire [132 : 0] out_ports_0_getFlit,
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
  wire [132 : 0] hasFlitsToSend_perIn$wget,
		 hasFlitsToSend_perIn_1$wget,
		 hasFlitsToSend_perIn_2$wget,
		 hasFlitsToSend_perIn_3$wget,
		 hasFlitsToSend_perIn_4$wget;
  // register inPortVL
  reg [2 : 0] inPortVL;
  wire [2 : 0] inPortVL$D_IN;
  wire inPortVL$EN;
  // register inPortVL_1
  reg [2 : 0] inPortVL_1;
  wire [2 : 0] inPortVL_1$D_IN;
  wire inPortVL_1$EN;
  // register inPortVL_2
  reg [2 : 0] inPortVL_2;
  wire [2 : 0] inPortVL_2$D_IN;
  wire inPortVL_2$EN;
  // register inPortVL_3
  reg [2 : 0] inPortVL_3;
  wire [2 : 0] inPortVL_3$D_IN;
  wire inPortVL_3$EN;
  // register inPortVL_4
  reg [2 : 0] inPortVL_4;
  wire [2 : 0] inPortVL_4$D_IN;
  wire inPortVL_4$EN;
  // register lockedVL
  reg lockedVL;
  wire lockedVL$D_IN, lockedVL$EN;
  // register lockedVL_1
  reg lockedVL_1;
  wire lockedVL_1$D_IN, lockedVL_1$EN;
  // register lockedVL_2
  reg lockedVL_2;
  wire lockedVL_2$D_IN, lockedVL_2$EN;
  // register lockedVL_3
  reg lockedVL_3;
  wire lockedVL_3$D_IN, lockedVL_3$EN;
  // register lockedVL_4
  reg lockedVL_4;
  wire lockedVL_4$D_IN, lockedVL_4$EN;
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
  wire [131 : 0] flitBuffers$deq, flitBuffers$enq_data_in;
  wire flitBuffers$EN_deq,
       flitBuffers$EN_enq,
       flitBuffers$notEmpty,
       flitBuffers$notFull;
  // ports of submodule flitBuffers_1
  wire [131 : 0] flitBuffers_1$deq, flitBuffers_1$enq_data_in;
  wire flitBuffers_1$EN_deq,
       flitBuffers_1$EN_enq,
       flitBuffers_1$notEmpty,
       flitBuffers_1$notFull;
  // ports of submodule flitBuffers_2
  wire [131 : 0] flitBuffers_2$deq, flitBuffers_2$enq_data_in;
  wire flitBuffers_2$EN_deq,
       flitBuffers_2$EN_enq,
       flitBuffers_2$notEmpty,
       flitBuffers_2$notFull;
  // ports of submodule flitBuffers_3
  wire [131 : 0] flitBuffers_3$deq, flitBuffers_3$enq_data_in;
  wire flitBuffers_3$EN_deq,
       flitBuffers_3$EN_enq,
       flitBuffers_3$notEmpty,
       flitBuffers_3$notFull;
  // ports of submodule flitBuffers_4
  wire [131 : 0] flitBuffers_4$deq, flitBuffers_4$enq_data_in;
  wire flitBuffers_4$EN_deq,
       flitBuffers_4$EN_enq,
       flitBuffers_4$notEmpty,
       flitBuffers_4$notFull;
  // ports of submodule outPortFIFOs
  wire [2 : 0] outPortFIFOs$enq_sendData, outPortFIFOs$first;
  wire outPortFIFOs$EN_clear, outPortFIFOs$EN_deq, outPortFIFOs$EN_enq;
  // ports of submodule outPortFIFOs_1
  wire [2 : 0] outPortFIFOs_1$enq_sendData, outPortFIFOs_1$first;
  wire outPortFIFOs_1$EN_clear, outPortFIFOs_1$EN_deq, outPortFIFOs_1$EN_enq;
  // ports of submodule outPortFIFOs_2
  wire [2 : 0] outPortFIFOs_2$enq_sendData, outPortFIFOs_2$first;
  wire outPortFIFOs_2$EN_clear, outPortFIFOs_2$EN_deq, outPortFIFOs_2$EN_enq;
  // ports of submodule outPortFIFOs_3
  wire [2 : 0] outPortFIFOs_3$enq_sendData, outPortFIFOs_3$first;
  wire outPortFIFOs_3$EN_clear, outPortFIFOs_3$EN_deq, outPortFIFOs_3$EN_enq;
  // ports of submodule outPortFIFOs_4
  wire [2 : 0] outPortFIFOs_4$enq_sendData, outPortFIFOs_4$first;
  wire outPortFIFOs_4$EN_clear, outPortFIFOs_4$EN_deq, outPortFIFOs_4$EN_enq;
  // ports of submodule routerAlloc
  wire [24 : 0] routerAlloc$allocate, routerAlloc$allocate_alloc_input;
  wire routerAlloc$EN_allocate, routerAlloc$EN_next;
  // remaining internal signals
  reg [131 : 0] IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d845,
		IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d846,
		IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d847,
		IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d848;
  reg IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d433,
      IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d495,
      IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d557,
      IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d619,
      IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d855,
      IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d856,
      IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d857,
      IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d858,
      IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88,
      IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67,
      IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47,
      IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27,
      IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108;
  wire [131 : 0] IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d390,
		 IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d844;
  wire [3 : 0] outport_encoder___d828,
	       outport_encoder___d829,
	       outport_encoder___d830,
	       outport_encoder___d831,
	       outport_encoder___d832;
  wire [2 : 0] IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d693,
	       IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d694,
	       IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d695,
	       IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d696,
	       IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d689,
	       IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d690,
	       IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d691,
	       IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d692,
	       IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d697,
	       IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d698,
	       IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d699,
	       IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d700,
	       active_in__h35433,
	       active_in__h36374,
	       active_in__h37315,
	       active_in__h38256;
  wire IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d347,
       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d348,
       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d349,
       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d360,
       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d361,
       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d362,
       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d363,
       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d854,
       IF_outport_encoder_03_BIT_3_04_THEN_NOT_outpor_ETC___d654,
       IF_outport_encoder_03_BIT_3_04_THEN_NOT_outpor_ETC___d668,
       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d652,
       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d656,
       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d662,
       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d669,
       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d671,
       IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d653,
       IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d665,
       IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d667,
       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d659,
       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d663,
       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d672,
       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d683,
       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d685,
       IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d792,
       IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d809,
       IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d810,
       IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d811,
       IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d791,
       IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d801,
       IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d803,
       IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d805,
       IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d807,
       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d651,
       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d655,
       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d676,
       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d684,
       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d686;
  // actionvalue method in_ports_0_getNonFullVCs
  assign in_ports_0_getNonFullVCs = { 1'd0, flitBuffers$notFull } ;
  // actionvalue method in_ports_1_getNonFullVCs
  assign in_ports_1_getNonFullVCs = { 1'd0, flitBuffers_1$notFull } ;
  // actionvalue method in_ports_2_getNonFullVCs
  assign in_ports_2_getNonFullVCs = { 1'd0, flitBuffers_2$notFull } ;
  // actionvalue method in_ports_3_getNonFullVCs
  assign in_ports_3_getNonFullVCs = { 1'd0, flitBuffers_3$notFull } ;
  // actionvalue method in_ports_4_getNonFullVCs
  assign in_ports_4_getNonFullVCs = { 1'd0, flitBuffers_4$notFull } ;
  // actionvalue method out_ports_0_getFlit
  assign out_ports_0_getFlit =
	     { IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d791 &&
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d363,
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d844 } ;
  // actionvalue method out_ports_1_getFlit
  assign out_ports_1_getFlit =
	     { IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d801 &&
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d433,
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d845 } ;
  // actionvalue method out_ports_2_getFlit
  assign out_ports_2_getFlit =
	     { IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d803 &&
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d495,
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d846 } ;
  // actionvalue method out_ports_3_getFlit
  assign out_ports_3_getFlit =
	     { IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d805 &&
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d557,
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d847 } ;
  // actionvalue method out_ports_4_getFlit
  assign out_ports_4_getFlit =
	     { IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d807 &&
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d619,
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d848 } ;
  // submodule flitBuffers
  mkInputQueue flitBuffers(.CLK(CLK),
			   .RST_N(RST_N),
			   .enq_data_in(flitBuffers$enq_data_in),
			   .EN_enq(flitBuffers$EN_enq),
			   .EN_deq(flitBuffers$EN_deq),
			   .deq(flitBuffers$deq),
			   .notEmpty(flitBuffers$notEmpty),
			   .notFull(flitBuffers$notFull));
  // submodule flitBuffers_1
  mkInputQueue flitBuffers_1(.CLK(CLK),
			     .RST_N(RST_N),
			     .enq_data_in(flitBuffers_1$enq_data_in),
			     .EN_enq(flitBuffers_1$EN_enq),
			     .EN_deq(flitBuffers_1$EN_deq),
			     .deq(flitBuffers_1$deq),
			     .notEmpty(flitBuffers_1$notEmpty),
			     .notFull(flitBuffers_1$notFull));
  // submodule flitBuffers_2
  mkInputQueue flitBuffers_2(.CLK(CLK),
			     .RST_N(RST_N),
			     .enq_data_in(flitBuffers_2$enq_data_in),
			     .EN_enq(flitBuffers_2$EN_enq),
			     .EN_deq(flitBuffers_2$EN_deq),
			     .deq(flitBuffers_2$deq),
			     .notEmpty(flitBuffers_2$notEmpty),
			     .notFull(flitBuffers_2$notFull));
  // submodule flitBuffers_3
  mkInputQueue flitBuffers_3(.CLK(CLK),
			     .RST_N(RST_N),
			     .enq_data_in(flitBuffers_3$enq_data_in),
			     .EN_enq(flitBuffers_3$EN_enq),
			     .EN_deq(flitBuffers_3$EN_deq),
			     .deq(flitBuffers_3$deq),
			     .notEmpty(flitBuffers_3$notEmpty),
			     .notFull(flitBuffers_3$notFull));
  // submodule flitBuffers_4
  mkInputQueue flitBuffers_4(.CLK(CLK),
			     .RST_N(RST_N),
			     .enq_data_in(flitBuffers_4$enq_data_in),
			     .EN_enq(flitBuffers_4$EN_enq),
			     .EN_deq(flitBuffers_4$EN_deq),
			     .deq(flitBuffers_4$deq),
			     .notEmpty(flitBuffers_4$notEmpty),
			     .notFull(flitBuffers_4$notFull));
  // submodule outPortFIFOs
  mkOutPortFIFO outPortFIFOs(.CLK(CLK),
			     .RST_N(RST_N),
			     .enq_sendData(outPortFIFOs$enq_sendData),
			     .EN_enq(outPortFIFOs$EN_enq),
			     .EN_deq(outPortFIFOs$EN_deq),
			     .EN_clear(outPortFIFOs$EN_clear),
			     .RDY_enq(),
			     .RDY_deq(),
			     .first(outPortFIFOs$first),
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
  // register inPortVL
  assign inPortVL$D_IN = 3'h0 ;
  assign inPortVL$EN = 1'b0 ;
  // register inPortVL_1
  assign inPortVL_1$D_IN = 3'h0 ;
  assign inPortVL_1$EN = 1'b0 ;
  // register inPortVL_2
  assign inPortVL_2$D_IN = 3'h0 ;
  assign inPortVL_2$EN = 1'b0 ;
  // register inPortVL_3
  assign inPortVL_3$D_IN = 3'h0 ;
  assign inPortVL_3$EN = 1'b0 ;
  // register inPortVL_4
  assign inPortVL_4$D_IN = 3'h0 ;
  assign inPortVL_4$EN = 1'b0 ;
  // register lockedVL
  assign lockedVL$D_IN = 1'b0 ;
  assign lockedVL$EN = 1'b0 ;
  // register lockedVL_1
  assign lockedVL_1$D_IN = 1'b0 ;
  assign lockedVL_1$EN = 1'b0 ;
  // register lockedVL_2
  assign lockedVL_2$D_IN = 1'b0 ;
  assign lockedVL_2$EN = 1'b0 ;
  // register lockedVL_3
  assign lockedVL_3$D_IN = 1'b0 ;
  assign lockedVL_3$EN = 1'b0 ;
  // register lockedVL_4
  assign lockedVL_4$D_IN = 1'b0 ;
  assign lockedVL_4$EN = 1'b0 ;
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
  assign flitBuffers$enq_data_in = in_ports_0_putRoutedFlit_flit_in[134:3] ;
  assign flitBuffers$EN_enq =
	     EN_in_ports_0_putRoutedFlit &&
	     in_ports_0_putRoutedFlit_flit_in[135] ;
  assign flitBuffers$EN_deq = outport_encoder___d832[3] ;
  // submodule flitBuffers_1
  assign flitBuffers_1$enq_data_in = in_ports_1_putRoutedFlit_flit_in[134:3] ;
  assign flitBuffers_1$EN_enq =
	     EN_in_ports_1_putRoutedFlit &&
	     in_ports_1_putRoutedFlit_flit_in[135] ;
  assign flitBuffers_1$EN_deq = outport_encoder___d831[3] ;
  // submodule flitBuffers_2
  assign flitBuffers_2$enq_data_in = in_ports_2_putRoutedFlit_flit_in[134:3] ;
  assign flitBuffers_2$EN_enq =
	     EN_in_ports_2_putRoutedFlit &&
	     in_ports_2_putRoutedFlit_flit_in[135] ;
  assign flitBuffers_2$EN_deq = outport_encoder___d830[3] ;
  // submodule flitBuffers_3
  assign flitBuffers_3$enq_data_in = in_ports_3_putRoutedFlit_flit_in[134:3] ;
  assign flitBuffers_3$EN_enq =
	     EN_in_ports_3_putRoutedFlit &&
	     in_ports_3_putRoutedFlit_flit_in[135] ;
  assign flitBuffers_3$EN_deq = outport_encoder___d829[3] ;
  // submodule flitBuffers_4
  assign flitBuffers_4$enq_data_in = in_ports_4_putRoutedFlit_flit_in[134:3] ;
  assign flitBuffers_4$EN_enq =
	     EN_in_ports_4_putRoutedFlit &&
	     in_ports_4_putRoutedFlit_flit_in[135] ;
  assign flitBuffers_4$EN_deq = outport_encoder___d828[3] ;
  // submodule outPortFIFOs
  assign outPortFIFOs$enq_sendData = in_ports_0_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs$EN_enq =
	     EN_in_ports_0_putRoutedFlit &&
	     in_ports_0_putRoutedFlit_flit_in[135] ;
  assign outPortFIFOs$EN_deq = outport_encoder___d832[3] ;
  assign outPortFIFOs$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_1
  assign outPortFIFOs_1$enq_sendData = in_ports_1_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_1$EN_enq =
	     EN_in_ports_1_putRoutedFlit &&
	     in_ports_1_putRoutedFlit_flit_in[135] ;
  assign outPortFIFOs_1$EN_deq = outport_encoder___d831[3] ;
  assign outPortFIFOs_1$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_2
  assign outPortFIFOs_2$enq_sendData = in_ports_2_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_2$EN_enq =
	     EN_in_ports_2_putRoutedFlit &&
	     in_ports_2_putRoutedFlit_flit_in[135] ;
  assign outPortFIFOs_2$EN_deq = outport_encoder___d830[3] ;
  assign outPortFIFOs_2$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_3
  assign outPortFIFOs_3$enq_sendData = in_ports_3_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_3$EN_enq =
	     EN_in_ports_3_putRoutedFlit &&
	     in_ports_3_putRoutedFlit_flit_in[135] ;
  assign outPortFIFOs_3$EN_deq = outport_encoder___d829[3] ;
  assign outPortFIFOs_3$EN_clear = 1'b0 ;
  // submodule outPortFIFOs_4
  assign outPortFIFOs_4$enq_sendData = in_ports_4_putRoutedFlit_flit_in[2:0] ;
  assign outPortFIFOs_4$EN_enq =
	     EN_in_ports_4_putRoutedFlit &&
	     in_ports_4_putRoutedFlit_flit_in[135] ;
  assign outPortFIFOs_4$EN_deq = outport_encoder___d828[3] ;
  assign outPortFIFOs_4$EN_clear = 1'b0 ;
  // submodule routerAlloc
  assign routerAlloc$allocate_alloc_input =
	     { flitBuffers_4$notEmpty &&
	       IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27 &&
	       outPortFIFOs_4$first == 3'd4,
	       flitBuffers_4$notEmpty &&
	       IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27 &&
	       outPortFIFOs_4$first == 3'd3,
	       flitBuffers_4$notEmpty &&
	       IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27 &&
	       outPortFIFOs_4$first == 3'd2,
	       flitBuffers_4$notEmpty &&
	       IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27 &&
	       outPortFIFOs_4$first == 3'd1,
	       flitBuffers_4$notEmpty &&
	       IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27 &&
	       outPortFIFOs_4$first == 3'd0,
	       flitBuffers_3$notEmpty &&
	       IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47 &&
	       outPortFIFOs_3$first == 3'd4,
	       flitBuffers_3$notEmpty &&
	       IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47 &&
	       outPortFIFOs_3$first == 3'd3,
	       flitBuffers_3$notEmpty &&
	       IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47 &&
	       outPortFIFOs_3$first == 3'd2,
	       flitBuffers_3$notEmpty &&
	       IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47 &&
	       outPortFIFOs_3$first == 3'd1,
	       flitBuffers_3$notEmpty &&
	       IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47 &&
	       outPortFIFOs_3$first == 3'd0,
	       flitBuffers_2$notEmpty &&
	       IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67 &&
	       outPortFIFOs_2$first == 3'd4,
	       flitBuffers_2$notEmpty &&
	       IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67 &&
	       outPortFIFOs_2$first == 3'd3,
	       flitBuffers_2$notEmpty &&
	       IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67 &&
	       outPortFIFOs_2$first == 3'd2,
	       flitBuffers_2$notEmpty &&
	       IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67 &&
	       outPortFIFOs_2$first == 3'd1,
	       flitBuffers_2$notEmpty &&
	       IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67 &&
	       outPortFIFOs_2$first == 3'd0,
	       flitBuffers_1$notEmpty &&
	       IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88 &&
	       outPortFIFOs_1$first == 3'd4,
	       flitBuffers_1$notEmpty &&
	       IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88 &&
	       outPortFIFOs_1$first == 3'd3,
	       flitBuffers_1$notEmpty &&
	       IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88 &&
	       outPortFIFOs_1$first == 3'd2,
	       flitBuffers_1$notEmpty &&
	       IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88 &&
	       outPortFIFOs_1$first == 3'd1,
	       flitBuffers_1$notEmpty &&
	       IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88 &&
	       outPortFIFOs_1$first == 3'd0,
	       flitBuffers$notEmpty &&
	       IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108 &&
	       outPortFIFOs$first == 3'd4,
	       flitBuffers$notEmpty &&
	       IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108 &&
	       outPortFIFOs$first == 3'd3,
	       flitBuffers$notEmpty &&
	       IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108 &&
	       outPortFIFOs$first == 3'd2,
	       flitBuffers$notEmpty &&
	       IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108 &&
	       outPortFIFOs$first == 3'd1,
	       flitBuffers$notEmpty &&
	       IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108 &&
	       outPortFIFOs$first == 3'd0 } ;
  assign routerAlloc$EN_allocate = 1'd1 ;
  assign routerAlloc$EN_next = 1'd1 ;
  // remaining internal signals
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
						    .outport_encoder(outport_encoder___d831));
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
						    .outport_encoder(outport_encoder___d832));
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
						    .outport_encoder(outport_encoder___d830));
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
						    .outport_encoder(outport_encoder___d829));
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
						    .outport_encoder(outport_encoder___d828));
  assign IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d347 =
	     IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d811 ?
	       !outport_encoder___d829[3] ||
	       !hasFlitsToSend_perIn_3$wget[132] :
	       outport_encoder___d828[3] &&
	       outport_encoder___d828[2:0] == 3'd0 &&
	       !hasFlitsToSend_perIn_4$wget[132] ;
  assign IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d348 =
	     IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d810 ?
	       !outport_encoder___d830[3] ||
	       !hasFlitsToSend_perIn_2$wget[132] :
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d347 ;
  assign IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d349 =
	     IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d809 ?
	       !outport_encoder___d831[3] ||
	       !hasFlitsToSend_perIn_1$wget[132] :
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d348 ;
  assign IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d360 =
	     IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d811 ?
	       outport_encoder___d829[3] && hasFlitsToSend_perIn_3$wget[132] :
	       !outport_encoder___d828[3] ||
	       outport_encoder___d828[2:0] != 3'd0 ||
	       hasFlitsToSend_perIn_4$wget[132] ;
  assign IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d361 =
	     IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d810 ?
	       outport_encoder___d830[3] && hasFlitsToSend_perIn_2$wget[132] :
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d360 ;
  assign IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d362 =
	     IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d809 ?
	       outport_encoder___d831[3] && hasFlitsToSend_perIn_1$wget[132] :
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d361 ;
  assign IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d363 =
	     IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d792 ?
	       outport_encoder___d832[3] && hasFlitsToSend_perIn$wget[132] :
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d362 ;
  assign IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d390 =
	     IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d810 ?
	       hasFlitsToSend_perIn_2$wget[131:0] :
	       (IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d811 ?
		  hasFlitsToSend_perIn_3$wget[131:0] :
		  hasFlitsToSend_perIn_4$wget[131:0]) ;
  assign IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d844 =
	     IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d792 ?
	       hasFlitsToSend_perIn$wget[131:0] :
	       (IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d809 ?
		  hasFlitsToSend_perIn_1$wget[131:0] :
		  IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d390) ;
  assign IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d854 =
	     IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d792 ?
	       !outport_encoder___d832[3] || !hasFlitsToSend_perIn$wget[132] :
	       IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d349 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d693 =
	     outport_encoder___d830[3] ?
	       ((outport_encoder___d830[2:0] == 3'd1) ?
		  3'd2 :
		  IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d697) :
	       IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d697 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d694 =
	     outport_encoder___d830[3] ?
	       ((outport_encoder___d830[2:0] == 3'd2) ?
		  outport_encoder___d830[2:0] :
		  IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d698) :
	       IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d698 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d695 =
	     outport_encoder___d830[3] ?
	       ((outport_encoder___d830[2:0] == 3'd3) ?
		  3'd2 :
		  IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d699) :
	       IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d699 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d696 =
	     outport_encoder___d830[3] ?
	       ((outport_encoder___d830[2:0] == 3'd4) ?
		  3'd2 :
		  IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d700) :
	       IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d700 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_NOT_outpor_ETC___d654 =
	     outport_encoder___d830[3] ?
	       outport_encoder___d830[2:0] != 3'd0 &&
	       (!outport_encoder___d831[3] ||
		outport_encoder___d831[2:0] != 3'd0) :
	       !outport_encoder___d831[3] ||
	       outport_encoder___d831[2:0] != 3'd0 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_NOT_outpor_ETC___d668 =
	     outport_encoder___d830[3] ?
	       outport_encoder___d830[2:0] != 3'd0 &&
	       outport_encoder___d831[3] &&
	       outport_encoder___d831[2:0] == 3'd0 :
	       outport_encoder___d831[3] &&
	       outport_encoder___d831[2:0] == 3'd0 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d652 =
	     outport_encoder___d830[3] ?
	       outport_encoder___d830[2:0] == 3'd0 ||
	       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d651 :
	       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d651 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d656 =
	     outport_encoder___d830[3] ?
	       outport_encoder___d830[2:0] == 3'd1 ||
	       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d655 :
	       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d655 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d662 =
	     outport_encoder___d830[3] ?
	       outport_encoder___d830[2:0] == 3'd4 ||
	       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d686 :
	       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d686 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d669 =
	     outport_encoder___d830[3] ?
	       outport_encoder___d830[2:0] == 3'd3 ||
	       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d676 :
	       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d676 ;
  assign IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d671 =
	     outport_encoder___d830[3] ?
	       outport_encoder___d830[2:0] == 3'd2 ||
	       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d684 :
	       IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d684 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d689 =
	     outport_encoder___d829[3] ?
	       ((outport_encoder___d829[2:0] == 3'd1) ?
		  3'd3 :
		  IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d693) :
	       IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d693 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d690 =
	     outport_encoder___d829[3] ?
	       ((outport_encoder___d829[2:0] == 3'd2) ?
		  3'd3 :
		  IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d694) :
	       IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d694 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d691 =
	     outport_encoder___d829[3] ?
	       ((outport_encoder___d829[2:0] == 3'd3) ?
		  outport_encoder___d829[2:0] :
		  IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d695) :
	       IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d695 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d692 =
	     outport_encoder___d829[3] ?
	       ((outport_encoder___d829[2:0] == 3'd4) ?
		  3'd3 :
		  IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d696) :
	       IF_outport_encoder_03_BIT_3_04_THEN_IF_outport_ETC___d696 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d653 =
	     outport_encoder___d829[3] ?
	       outport_encoder___d829[2:0] != 3'd0 &&
	       IF_outport_encoder_03_BIT_3_04_THEN_NOT_outpor_ETC___d654 :
	       IF_outport_encoder_03_BIT_3_04_THEN_NOT_outpor_ETC___d654 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d665 =
	     outport_encoder___d829[3] ?
	       outport_encoder___d829[2:0] != 3'd0 &&
	       IF_outport_encoder_03_BIT_3_04_THEN_NOT_outpor_ETC___d668 :
	       IF_outport_encoder_03_BIT_3_04_THEN_NOT_outpor_ETC___d668 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d667 =
	     outport_encoder___d829[3] ?
	       outport_encoder___d829[2:0] != 3'd0 &&
	       outport_encoder___d830[3] &&
	       outport_encoder___d830[2:0] == 3'd0 :
	       outport_encoder___d830[3] &&
	       outport_encoder___d830[2:0] == 3'd0 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d659 =
	     outport_encoder___d829[3] ?
	       outport_encoder___d829[2:0] == 3'd2 ||
	       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d671 :
	       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d671 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d663 =
	     outport_encoder___d829[3] ?
	       outport_encoder___d829[2:0] == 3'd4 ||
	       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d662 :
	       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d662 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d672 =
	     outport_encoder___d829[3] ?
	       outport_encoder___d829[2:0] == 3'd0 ||
	       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d652 :
	       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d652 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d683 =
	     outport_encoder___d829[3] ?
	       outport_encoder___d829[2:0] == 3'd1 ||
	       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d656 :
	       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d656 ;
  assign IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d685 =
	     outport_encoder___d829[3] ?
	       outport_encoder___d829[2:0] == 3'd3 ||
	       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d669 :
	       IF_outport_encoder_03_BIT_3_04_THEN_outport_en_ETC___d669 ;
  assign IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d792 =
	     outport_encoder___d828[3] ?
	       outport_encoder___d828[2:0] != 3'd0 &&
	       IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d653 :
	       IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d653 ;
  assign IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d809 =
	     outport_encoder___d828[3] ?
	       outport_encoder___d828[2:0] != 3'd0 &&
	       IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d665 :
	       IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d665 ;
  assign IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d810 =
	     outport_encoder___d828[3] ?
	       outport_encoder___d828[2:0] != 3'd0 &&
	       IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d667 :
	       IF_outport_encoder_24_BIT_3_25_THEN_NOT_outpor_ETC___d667 ;
  assign IF_outport_encoder_45_BIT_3_46_THEN_NOT_outpor_ETC___d811 =
	     outport_encoder___d828[3] ?
	       outport_encoder___d828[2:0] != 3'd0 &&
	       outport_encoder___d829[3] &&
	       outport_encoder___d829[2:0] == 3'd0 :
	       outport_encoder___d829[3] &&
	       outport_encoder___d829[2:0] == 3'd0 ;
  assign IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d791 =
	     outport_encoder___d828[3] ?
	       outport_encoder___d828[2:0] == 3'd0 ||
	       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d672 :
	       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d672 ;
  assign IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d801 =
	     outport_encoder___d828[3] ?
	       outport_encoder___d828[2:0] == 3'd1 ||
	       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d683 :
	       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d683 ;
  assign IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d803 =
	     outport_encoder___d828[3] ?
	       outport_encoder___d828[2:0] == 3'd2 ||
	       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d659 :
	       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d659 ;
  assign IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d805 =
	     outport_encoder___d828[3] ?
	       outport_encoder___d828[2:0] == 3'd3 ||
	       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d685 :
	       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d685 ;
  assign IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d807 =
	     outport_encoder___d828[3] ?
	       outport_encoder___d828[2:0] == 3'd4 ||
	       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d663 :
	       IF_outport_encoder_24_BIT_3_25_THEN_outport_en_ETC___d663 ;
  assign IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d697 =
	     outport_encoder___d831[3] ?
	       ((outport_encoder___d831[2:0] == 3'd1) ?
		  outport_encoder___d831[2:0] :
		  3'd0) :
	       3'd0 ;
  assign IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d698 =
	     outport_encoder___d831[3] ?
	       ((outport_encoder___d831[2:0] == 3'd2) ? 3'd1 : 3'd0) :
	       3'd0 ;
  assign IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d699 =
	     outport_encoder___d831[3] ?
	       ((outport_encoder___d831[2:0] == 3'd3) ? 3'd1 : 3'd0) :
	       3'd0 ;
  assign IF_outport_encoder_82_BIT_3_83_THEN_IF_outport_ETC___d700 =
	     outport_encoder___d831[3] ?
	       ((outport_encoder___d831[2:0] == 3'd4) ? 3'd1 : 3'd0) :
	       3'd0 ;
  assign IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d651 =
	     outport_encoder___d831[3] ?
	       outport_encoder___d831[2:0] == 3'd0 ||
	       outport_encoder___d832[3] &&
	       outport_encoder___d832[2:0] == 3'd0 :
	       outport_encoder___d832[3] &&
	       outport_encoder___d832[2:0] == 3'd0 ;
  assign IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d655 =
	     outport_encoder___d831[3] ?
	       outport_encoder___d831[2:0] == 3'd1 ||
	       outport_encoder___d832[3] &&
	       outport_encoder___d832[2:0] == 3'd1 :
	       outport_encoder___d832[3] &&
	       outport_encoder___d832[2:0] == 3'd1 ;
  assign IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d676 =
	     outport_encoder___d831[3] ?
	       outport_encoder___d831[2:0] == 3'd3 ||
	       outport_encoder___d832[3] &&
	       outport_encoder___d832[2:0] == 3'd3 :
	       outport_encoder___d832[3] &&
	       outport_encoder___d832[2:0] == 3'd3 ;
  assign IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d684 =
	     outport_encoder___d831[3] ?
	       outport_encoder___d831[2:0] == 3'd2 ||
	       outport_encoder___d832[3] &&
	       outport_encoder___d832[2:0] == 3'd2 :
	       outport_encoder___d832[3] &&
	       outport_encoder___d832[2:0] == 3'd2 ;
  assign IF_outport_encoder_82_BIT_3_83_THEN_outport_en_ETC___d686 =
	     outport_encoder___d831[3] ?
	       outport_encoder___d831[2:0] == 3'd4 ||
	       outport_encoder___d832[3] &&
	       outport_encoder___d832[2:0] == 3'd4 :
	       outport_encoder___d832[3] &&
	       outport_encoder___d832[2:0] == 3'd4 ;
  assign active_in__h35433 =
	     outport_encoder___d828[3] ?
	       ((outport_encoder___d828[2:0] == 3'd1) ?
		  3'd4 :
		  IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d689) :
	       IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d689 ;
  assign active_in__h36374 =
	     outport_encoder___d828[3] ?
	       ((outport_encoder___d828[2:0] == 3'd2) ?
		  3'd4 :
		  IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d690) :
	       IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d690 ;
  assign active_in__h37315 =
	     outport_encoder___d828[3] ?
	       ((outport_encoder___d828[2:0] == 3'd3) ?
		  3'd4 :
		  IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d691) :
	       IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d691 ;
  assign active_in__h38256 =
	     outport_encoder___d828[3] ?
	       ((outport_encoder___d828[2:0] == 3'd4) ?
		  outport_encoder___d828[2:0] :
		  IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d692) :
	       IF_outport_encoder_24_BIT_3_25_THEN_IF_outport_ETC___d692 ;
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
	  IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_4_first_EQ_0_THEN_simple_credi_ETC___d27 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[0];
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
	  IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_3_first__7_EQ_0_8_THEN_simple__ETC___d47 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[0];
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
	  IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_2_first__7_EQ_0_8_THEN_simple__ETC___d67 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[0];
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
	  IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_1_first__8_EQ_0_9_THEN_simple__ETC___d88 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(outPortFIFOs$first or
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
    case (outPortFIFOs$first)
      3'd0:
	  IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108 =
	      EN_out_ports_0_putNonFullVCs &&
	      out_ports_0_putNonFullVCs_nonFullVCs[0];
      3'd1:
	  IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108 =
	      EN_out_ports_1_putNonFullVCs &&
	      out_ports_1_putNonFullVCs_nonFullVCs[0];
      3'd2:
	  IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108 =
	      EN_out_ports_2_putNonFullVCs &&
	      out_ports_2_putNonFullVCs_nonFullVCs[0];
      3'd3:
	  IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108 =
	      EN_out_ports_3_putNonFullVCs &&
	      out_ports_3_putNonFullVCs_nonFullVCs[0];
      default: IF_outPortFIFOs_first__8_EQ_0_9_THEN_simple_cr_ETC___d108 =
		   EN_out_ports_4_putNonFullVCs &&
		   out_ports_4_putNonFullVCs_nonFullVCs[0];
    endcase
  end
  always@(active_in__h35433 or
	  outport_encoder___d828 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d832 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d831 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d830 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d829 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h35433)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d433 =
	      outport_encoder___d832[3] && hasFlitsToSend_perIn$wget[132];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d433 =
	      outport_encoder___d831[3] && hasFlitsToSend_perIn_1$wget[132];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d433 =
	      outport_encoder___d830[3] && hasFlitsToSend_perIn_2$wget[132];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d433 =
	      outport_encoder___d829[3] && hasFlitsToSend_perIn_3$wget[132];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d433 =
		   active_in__h35433 != 3'd4 ||
		   outport_encoder___d828[3] &&
		   hasFlitsToSend_perIn_4$wget[132];
    endcase
  end
  always@(active_in__h36374 or
	  outport_encoder___d828 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d832 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d831 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d830 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d829 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h36374)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d495 =
	      outport_encoder___d832[3] && hasFlitsToSend_perIn$wget[132];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d495 =
	      outport_encoder___d831[3] && hasFlitsToSend_perIn_1$wget[132];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d495 =
	      outport_encoder___d830[3] && hasFlitsToSend_perIn_2$wget[132];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d495 =
	      outport_encoder___d829[3] && hasFlitsToSend_perIn_3$wget[132];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d495 =
		   active_in__h36374 != 3'd4 ||
		   outport_encoder___d828[3] &&
		   hasFlitsToSend_perIn_4$wget[132];
    endcase
  end
  always@(active_in__h37315 or
	  outport_encoder___d828 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d832 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d831 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d830 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d829 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h37315)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d557 =
	      outport_encoder___d832[3] && hasFlitsToSend_perIn$wget[132];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d557 =
	      outport_encoder___d831[3] && hasFlitsToSend_perIn_1$wget[132];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d557 =
	      outport_encoder___d830[3] && hasFlitsToSend_perIn_2$wget[132];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d557 =
	      outport_encoder___d829[3] && hasFlitsToSend_perIn_3$wget[132];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d557 =
		   active_in__h37315 != 3'd4 ||
		   outport_encoder___d828[3] &&
		   hasFlitsToSend_perIn_4$wget[132];
    endcase
  end
  always@(active_in__h38256 or
	  outport_encoder___d828 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d832 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d831 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d830 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d829 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h38256)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d619 =
	      outport_encoder___d832[3] && hasFlitsToSend_perIn$wget[132];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d619 =
	      outport_encoder___d831[3] && hasFlitsToSend_perIn_1$wget[132];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d619 =
	      outport_encoder___d830[3] && hasFlitsToSend_perIn_2$wget[132];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d619 =
	      outport_encoder___d829[3] && hasFlitsToSend_perIn_3$wget[132];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d619 =
		   active_in__h38256 != 3'd4 ||
		   outport_encoder___d828[3] &&
		   hasFlitsToSend_perIn_4$wget[132];
    endcase
  end
  always@(active_in__h35433 or
	  outport_encoder___d828 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d832 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d831 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d830 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d829 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h35433)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d855 =
	      !outport_encoder___d832[3] || !hasFlitsToSend_perIn$wget[132];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d855 =
	      !outport_encoder___d831[3] || !hasFlitsToSend_perIn_1$wget[132];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d855 =
	      !outport_encoder___d830[3] || !hasFlitsToSend_perIn_2$wget[132];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d855 =
	      !outport_encoder___d829[3] || !hasFlitsToSend_perIn_3$wget[132];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d855 =
		   active_in__h35433 == 3'd4 &&
		   (!outport_encoder___d828[3] ||
		    !hasFlitsToSend_perIn_4$wget[132]);
    endcase
  end
  always@(active_in__h36374 or
	  outport_encoder___d828 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d832 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d831 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d830 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d829 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h36374)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d856 =
	      !outport_encoder___d832[3] || !hasFlitsToSend_perIn$wget[132];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d856 =
	      !outport_encoder___d831[3] || !hasFlitsToSend_perIn_1$wget[132];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d856 =
	      !outport_encoder___d830[3] || !hasFlitsToSend_perIn_2$wget[132];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d856 =
	      !outport_encoder___d829[3] || !hasFlitsToSend_perIn_3$wget[132];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d856 =
		   active_in__h36374 == 3'd4 &&
		   (!outport_encoder___d828[3] ||
		    !hasFlitsToSend_perIn_4$wget[132]);
    endcase
  end
  always@(active_in__h37315 or
	  outport_encoder___d828 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d832 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d831 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d830 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d829 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h37315)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d857 =
	      !outport_encoder___d832[3] || !hasFlitsToSend_perIn$wget[132];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d857 =
	      !outport_encoder___d831[3] || !hasFlitsToSend_perIn_1$wget[132];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d857 =
	      !outport_encoder___d830[3] || !hasFlitsToSend_perIn_2$wget[132];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d857 =
	      !outport_encoder___d829[3] || !hasFlitsToSend_perIn_3$wget[132];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d857 =
		   active_in__h37315 == 3'd4 &&
		   (!outport_encoder___d828[3] ||
		    !hasFlitsToSend_perIn_4$wget[132]);
    endcase
  end
  always@(active_in__h38256 or
	  outport_encoder___d828 or
	  hasFlitsToSend_perIn_4$wget or
	  outport_encoder___d832 or
	  hasFlitsToSend_perIn$wget or
	  outport_encoder___d831 or
	  hasFlitsToSend_perIn_1$wget or
	  outport_encoder___d830 or
	  hasFlitsToSend_perIn_2$wget or
	  outport_encoder___d829 or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h38256)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d858 =
	      !outport_encoder___d832[3] || !hasFlitsToSend_perIn$wget[132];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d858 =
	      !outport_encoder___d831[3] || !hasFlitsToSend_perIn_1$wget[132];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d858 =
	      !outport_encoder___d830[3] || !hasFlitsToSend_perIn_2$wget[132];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d858 =
	      !outport_encoder___d829[3] || !hasFlitsToSend_perIn_3$wget[132];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d858 =
		   active_in__h38256 == 3'd4 &&
		   (!outport_encoder___d828[3] ||
		    !hasFlitsToSend_perIn_4$wget[132]);
    endcase
  end
  always@(active_in__h35433 or
	  hasFlitsToSend_perIn_4$wget or
	  hasFlitsToSend_perIn$wget or
	  hasFlitsToSend_perIn_1$wget or
	  hasFlitsToSend_perIn_2$wget or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h35433)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d845 =
	      hasFlitsToSend_perIn$wget[131:0];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d845 =
	      hasFlitsToSend_perIn_1$wget[131:0];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d845 =
	      hasFlitsToSend_perIn_2$wget[131:0];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d845 =
	      hasFlitsToSend_perIn_3$wget[131:0];
      3'd4:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d845 =
	      hasFlitsToSend_perIn_4$wget[131:0];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d845 =
		   hasFlitsToSend_perIn_4$wget[131:0];
    endcase
  end
  always@(active_in__h36374 or
	  hasFlitsToSend_perIn_4$wget or
	  hasFlitsToSend_perIn$wget or
	  hasFlitsToSend_perIn_1$wget or
	  hasFlitsToSend_perIn_2$wget or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h36374)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d846 =
	      hasFlitsToSend_perIn$wget[131:0];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d846 =
	      hasFlitsToSend_perIn_1$wget[131:0];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d846 =
	      hasFlitsToSend_perIn_2$wget[131:0];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d846 =
	      hasFlitsToSend_perIn_3$wget[131:0];
      3'd4:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d846 =
	      hasFlitsToSend_perIn_4$wget[131:0];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d846 =
		   hasFlitsToSend_perIn_4$wget[131:0];
    endcase
  end
  always@(active_in__h37315 or
	  hasFlitsToSend_perIn_4$wget or
	  hasFlitsToSend_perIn$wget or
	  hasFlitsToSend_perIn_1$wget or
	  hasFlitsToSend_perIn_2$wget or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h37315)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d847 =
	      hasFlitsToSend_perIn$wget[131:0];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d847 =
	      hasFlitsToSend_perIn_1$wget[131:0];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d847 =
	      hasFlitsToSend_perIn_2$wget[131:0];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d847 =
	      hasFlitsToSend_perIn_3$wget[131:0];
      3'd4:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d847 =
	      hasFlitsToSend_perIn_4$wget[131:0];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d847 =
		   hasFlitsToSend_perIn_4$wget[131:0];
    endcase
  end
  always@(active_in__h38256 or
	  hasFlitsToSend_perIn_4$wget or
	  hasFlitsToSend_perIn$wget or
	  hasFlitsToSend_perIn_1$wget or
	  hasFlitsToSend_perIn_2$wget or hasFlitsToSend_perIn_3$wget)
  begin
    case (active_in__h38256)
      3'd0:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d848 =
	      hasFlitsToSend_perIn$wget[131:0];
      3'd1:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d848 =
	      hasFlitsToSend_perIn_1$wget[131:0];
      3'd2:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d848 =
	      hasFlitsToSend_perIn_2$wget[131:0];
      3'd3:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d848 =
	      hasFlitsToSend_perIn_3$wget[131:0];
      3'd4:
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d848 =
	      hasFlitsToSend_perIn_4$wget[131:0];
      default: IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d848 =
		   hasFlitsToSend_perIn_4$wget[131:0];
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        inPortVL <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_2 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_3 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inPortVL_4 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	lockedVL <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lockedVL_4 <= `BSV_ASSIGNMENT_DELAY 1'd0;
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
        if (inPortVL$EN) inPortVL <= `BSV_ASSIGNMENT_DELAY inPortVL$D_IN;
	if (inPortVL_1$EN)
	  inPortVL_1 <= `BSV_ASSIGNMENT_DELAY inPortVL_1$D_IN;
	if (inPortVL_2$EN)
	  inPortVL_2 <= `BSV_ASSIGNMENT_DELAY inPortVL_2$D_IN;
	if (inPortVL_3$EN)
	  inPortVL_3 <= `BSV_ASSIGNMENT_DELAY inPortVL_3$D_IN;
	if (inPortVL_4$EN)
	  inPortVL_4 <= `BSV_ASSIGNMENT_DELAY inPortVL_4$D_IN;
	if (lockedVL$EN) lockedVL <= `BSV_ASSIGNMENT_DELAY lockedVL$D_IN;
	if (lockedVL_1$EN)
	  lockedVL_1 <= `BSV_ASSIGNMENT_DELAY lockedVL_1$D_IN;
	if (lockedVL_2$EN)
	  lockedVL_2 <= `BSV_ASSIGNMENT_DELAY lockedVL_2$D_IN;
	if (lockedVL_3$EN)
	  lockedVL_3 <= `BSV_ASSIGNMENT_DELAY lockedVL_3$D_IN;
	if (lockedVL_4$EN)
	  lockedVL_4 <= `BSV_ASSIGNMENT_DELAY lockedVL_4$D_IN;
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
    inPortVL = 3'h2;
    inPortVL_1 = 3'h2;
    inPortVL_2 = 3'h2;
    inPortVL_3 = 3'h2;
    inPortVL_4 = 3'h2;
    lockedVL = 1'h0;
    lockedVL_1 = 1'h0;
    lockedVL_2 = 1'h0;
    lockedVL_3 = 1'h0;
    lockedVL_4 = 1'h0;
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
      if (EN_out_ports_0_getFlit &&
	  IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d791 &&
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d854)
	$display("Dynamic assertion failed: \"IQRouterSimple.bsv\", line 619, column 47\nOutput selected invalid flit!");
    if (RST_N)
      if (EN_out_ports_0_getFlit &&
	  IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d791 &&
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_NOT_out_ETC___d854)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_1_getFlit &&
	  IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d801 &&
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d855)
	$display("Dynamic assertion failed: \"IQRouterSimple.bsv\", line 619, column 47\nOutput selected invalid flit!");
    if (RST_N)
      if (EN_out_ports_1_getFlit &&
	  IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d801 &&
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d855)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_2_getFlit &&
	  IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d803 &&
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d856)
	$display("Dynamic assertion failed: \"IQRouterSimple.bsv\", line 619, column 47\nOutput selected invalid flit!");
    if (RST_N)
      if (EN_out_ports_2_getFlit &&
	  IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d803 &&
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d856)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_3_getFlit &&
	  IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d805 &&
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d857)
	$display("Dynamic assertion failed: \"IQRouterSimple.bsv\", line 619, column 47\nOutput selected invalid flit!");
    if (RST_N)
      if (EN_out_ports_3_getFlit &&
	  IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d805 &&
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d857)
	$finish(32'd0);
    if (RST_N)
      if (EN_out_ports_4_getFlit &&
	  IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d807 &&
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d858)
	$display("Dynamic assertion failed: \"IQRouterSimple.bsv\", line 619, column 47\nOutput selected invalid flit!");
    if (RST_N)
      if (EN_out_ports_4_getFlit &&
	  IF_outport_encoder_45_BIT_3_46_THEN_outport_en_ETC___d807 &&
	  IF_IF_outport_encoder_45_BIT_3_46_THEN_IF_outp_ETC___d858)
	$finish(32'd0);
  end
  // synopsys translate_on
endmodule