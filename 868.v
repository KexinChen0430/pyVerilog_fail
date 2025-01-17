module outputs
  wire [69 : 0] deq;
  wire [1 : 0] notEmpty, notFull;
  // inlined wires
  wire [2 : 0] inputVCQueues_ifc_mf_ifc_new_head$wget,
	       inputVCQueues_ifc_mf_ifc_new_tail$wget;
  wire [1 : 0] inputVCQueues_ifc_mf_ifc_rdFIFO$wget,
	       inputVCQueues_ifc_mf_ifc_wrFIFO$wget;
  // register inputVCQueues_ifc_mf_ifc_heads
  reg [2 : 0] inputVCQueues_ifc_mf_ifc_heads;
  wire [2 : 0] inputVCQueues_ifc_mf_ifc_heads$D_IN;
  wire inputVCQueues_ifc_mf_ifc_heads$EN;
  // register inputVCQueues_ifc_mf_ifc_heads_1
  reg [2 : 0] inputVCQueues_ifc_mf_ifc_heads_1;
  wire [2 : 0] inputVCQueues_ifc_mf_ifc_heads_1$D_IN;
  wire inputVCQueues_ifc_mf_ifc_heads_1$EN;
  // register inputVCQueues_ifc_mf_ifc_not_empty
  reg inputVCQueues_ifc_mf_ifc_not_empty;
  wire inputVCQueues_ifc_mf_ifc_not_empty$D_IN,
       inputVCQueues_ifc_mf_ifc_not_empty$EN;
  // register inputVCQueues_ifc_mf_ifc_not_empty_1
  reg inputVCQueues_ifc_mf_ifc_not_empty_1;
  wire inputVCQueues_ifc_mf_ifc_not_empty_1$D_IN,
       inputVCQueues_ifc_mf_ifc_not_empty_1$EN;
  // register inputVCQueues_ifc_mf_ifc_not_full
  reg inputVCQueues_ifc_mf_ifc_not_full;
  wire inputVCQueues_ifc_mf_ifc_not_full$D_IN,
       inputVCQueues_ifc_mf_ifc_not_full$EN;
  // register inputVCQueues_ifc_mf_ifc_not_full_1
  reg inputVCQueues_ifc_mf_ifc_not_full_1;
  wire inputVCQueues_ifc_mf_ifc_not_full_1$D_IN,
       inputVCQueues_ifc_mf_ifc_not_full_1$EN;
  // register inputVCQueues_ifc_mf_ifc_tails
  reg [2 : 0] inputVCQueues_ifc_mf_ifc_tails;
  wire [2 : 0] inputVCQueues_ifc_mf_ifc_tails$D_IN;
  wire inputVCQueues_ifc_mf_ifc_tails$EN;
  // register inputVCQueues_ifc_mf_ifc_tails_1
  reg [2 : 0] inputVCQueues_ifc_mf_ifc_tails_1;
  wire [2 : 0] inputVCQueues_ifc_mf_ifc_tails_1$D_IN;
  wire inputVCQueues_ifc_mf_ifc_tails_1$EN;
  // ports of submodule inputVCQueues_ifc_mf_ifc_fifoMem
  wire [69 : 0] inputVCQueues_ifc_mf_ifc_fifoMem$D_IN,
		inputVCQueues_ifc_mf_ifc_fifoMem$D_OUT;
  wire [3 : 0] inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_IN,
	       inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_OUT;
  wire inputVCQueues_ifc_mf_ifc_fifoMem$WE;
  // remaining internal signals
  wire [2 : 0] fifoRdPtr__h4019,
	       fifoWrPtr__h3549,
	       x__h2444,
	       x__h3036,
	       y__h2445,
	       y__h3037;
  wire IF_deq_fifo_out_THEN_NOT_inputVCQueues_ifc_mf__ETC___d89,
       IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88,
       IF_inputVCQueues_ifc_mf_ifc_new_head_whas__8_T_ETC___d58,
       IF_inputVCQueues_ifc_mf_ifc_new_tail_whas_THEN_ETC___d36,
       NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d38,
       NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d41,
       NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d43,
       NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d60,
       NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d63,
       NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d65,
       inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d52,
       inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d54,
       inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d30,
       inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d32;
  // actionvalue method deq
  assign deq = inputVCQueues_ifc_mf_ifc_fifoMem$D_OUT ;
  // value method notEmpty
  assign notEmpty =
	     { inputVCQueues_ifc_mf_ifc_not_empty_1,
	       inputVCQueues_ifc_mf_ifc_not_empty } ;
  // value method notFull
  assign notFull =
	     { inputVCQueues_ifc_mf_ifc_not_full_1,
	       inputVCQueues_ifc_mf_ifc_not_full } ;
  // submodule inputVCQueues_ifc_mf_ifc_fifoMem
  RegFile_1port #( /*data_width*/ 32'd70,
		   /*addr_width*/ 32'd4) inputVCQueues_ifc_mf_ifc_fifoMem(.CLK(CLK),
									  .rst_n(RST_N),
									  .ADDR_IN(inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_IN),
									  .ADDR_OUT(inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_OUT),
									  .D_IN(inputVCQueues_ifc_mf_ifc_fifoMem$D_IN),
									  .WE(inputVCQueues_ifc_mf_ifc_fifoMem$WE),
									  .D_OUT(inputVCQueues_ifc_mf_ifc_fifoMem$D_OUT));
  // inlined wires
  assign inputVCQueues_ifc_mf_ifc_wrFIFO$wget = { 1'd1, enq_fifo_in } ;
  assign inputVCQueues_ifc_mf_ifc_rdFIFO$wget = { 1'd1, deq_fifo_out } ;
  assign inputVCQueues_ifc_mf_ifc_new_tail$wget = fifoWrPtr__h3549 + 3'd1 ;
  assign inputVCQueues_ifc_mf_ifc_new_head$wget = fifoRdPtr__h4019 + 3'd1 ;
  // register inputVCQueues_ifc_mf_ifc_heads
  assign inputVCQueues_ifc_mf_ifc_heads$D_IN = x__h3036 ;
  assign inputVCQueues_ifc_mf_ifc_heads$EN =
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;
  // register inputVCQueues_ifc_mf_ifc_heads_1
  assign inputVCQueues_ifc_mf_ifc_heads_1$D_IN = x__h3036 ;
  assign inputVCQueues_ifc_mf_ifc_heads_1$EN =
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;
  // register inputVCQueues_ifc_mf_ifc_not_empty
  assign inputVCQueues_ifc_mf_ifc_not_empty$D_IN =
	     inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d32 ;
  assign inputVCQueues_ifc_mf_ifc_not_empty$EN =
	     inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d32 ||
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d63 ;
  // register inputVCQueues_ifc_mf_ifc_not_empty_1
  assign inputVCQueues_ifc_mf_ifc_not_empty_1$D_IN =
	     inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d30 ;
  assign inputVCQueues_ifc_mf_ifc_not_empty_1$EN =
	     inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d30 ||
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d60 ;
  // register inputVCQueues_ifc_mf_ifc_not_full
  assign inputVCQueues_ifc_mf_ifc_not_full$D_IN =
	     !EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	     !NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d41 ;
  assign inputVCQueues_ifc_mf_ifc_not_full$EN =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d41 ||
	     inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d54 ;
  // register inputVCQueues_ifc_mf_ifc_not_full_1
  assign inputVCQueues_ifc_mf_ifc_not_full_1$D_IN =
	     !EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	     !NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d38 ;
  assign inputVCQueues_ifc_mf_ifc_not_full_1$EN =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d38 ||
	     inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d52 ;
  // register inputVCQueues_ifc_mf_ifc_tails
  assign inputVCQueues_ifc_mf_ifc_tails$D_IN = x__h2444 ;
  assign inputVCQueues_ifc_mf_ifc_tails$EN =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;
  // register inputVCQueues_ifc_mf_ifc_tails_1
  assign inputVCQueues_ifc_mf_ifc_tails_1$D_IN = x__h2444 ;
  assign inputVCQueues_ifc_mf_ifc_tails_1$EN =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;
  // submodule inputVCQueues_ifc_mf_ifc_fifoMem
  assign inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_IN =
	     { enq_fifo_in, fifoWrPtr__h3549 } ;
  assign inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_OUT =
	     { deq_fifo_out, fifoRdPtr__h4019 } ;
  assign inputVCQueues_ifc_mf_ifc_fifoMem$D_IN = enq_data_in ;
  assign inputVCQueues_ifc_mf_ifc_fifoMem$WE = EN_enq ;
  // remaining internal signals
  assign IF_deq_fifo_out_THEN_NOT_inputVCQueues_ifc_mf__ETC___d89 =
	     deq_fifo_out ?
	       !inputVCQueues_ifc_mf_ifc_not_empty_1 :
	       !inputVCQueues_ifc_mf_ifc_not_empty ;
  assign IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88 =
	     enq_fifo_in ?
	       !inputVCQueues_ifc_mf_ifc_not_full_1 :
	       !inputVCQueues_ifc_mf_ifc_not_full ;
  assign IF_inputVCQueues_ifc_mf_ifc_new_head_whas__8_T_ETC___d58 =
	     x__h3036 == y__h3037 ;
  assign IF_inputVCQueues_ifc_mf_ifc_new_tail_whas_THEN_ETC___d36 =
	     x__h2444 == y__h2445 ;
  assign NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d38 =
	     (!EN_deq || !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_tail_whas_THEN_ETC___d36 &&
	     inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;
  assign NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d41 =
	     (!EN_deq || !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_tail_whas_THEN_ETC___d36 &&
	     !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;
  assign NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d43 =
	     (!EN_deq || !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_tail_whas_THEN_ETC___d36 ;
  assign NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d60 =
	     (!EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_head_whas__8_T_ETC___d58 &&
	     inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;
  assign NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d63 =
	     (!EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_head_whas__8_T_ETC___d58 &&
	     !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;
  assign NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d65 =
	     (!EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_head_whas__8_T_ETC___d58 ;
  assign fifoRdPtr__h4019 =
	     deq_fifo_out ?
	       inputVCQueues_ifc_mf_ifc_heads_1 :
	       inputVCQueues_ifc_mf_ifc_heads ;
  assign fifoWrPtr__h3549 =
	     enq_fifo_in ?
	       inputVCQueues_ifc_mf_ifc_tails_1 :
	       inputVCQueues_ifc_mf_ifc_tails ;
  assign inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d52 =
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     (!EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0]) &&
	     inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;
  assign inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d54 =
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     (!EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0]) &&
	     !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;
  assign inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d30 =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     (!EN_deq || !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0]) &&
	     inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;
  assign inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d32 =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     (!EN_deq || !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0]) &&
	     !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;
  assign x__h2444 = EN_enq ? inputVCQueues_ifc_mf_ifc_new_tail$wget : 3'd0 ;
  assign x__h3036 = EN_deq ? inputVCQueues_ifc_mf_ifc_new_head$wget : 3'd0 ;
  assign y__h2445 =
	     inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ?
	       inputVCQueues_ifc_mf_ifc_heads_1 :
	       inputVCQueues_ifc_mf_ifc_heads ;
  assign y__h3037 =
	     inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ?
	       inputVCQueues_ifc_mf_ifc_tails_1 :
	       inputVCQueues_ifc_mf_ifc_tails ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        inputVCQueues_ifc_mf_ifc_heads <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inputVCQueues_ifc_mf_ifc_heads_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inputVCQueues_ifc_mf_ifc_not_empty <= `BSV_ASSIGNMENT_DELAY 1'd0;
	inputVCQueues_ifc_mf_ifc_not_empty_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	inputVCQueues_ifc_mf_ifc_not_full <= `BSV_ASSIGNMENT_DELAY 1'd1;
	inputVCQueues_ifc_mf_ifc_not_full_1 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	inputVCQueues_ifc_mf_ifc_tails <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inputVCQueues_ifc_mf_ifc_tails_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
      end
    else
      begin
        if (inputVCQueues_ifc_mf_ifc_heads$EN)
	  inputVCQueues_ifc_mf_ifc_heads <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_heads$D_IN;
	if (inputVCQueues_ifc_mf_ifc_heads_1$EN)
	  inputVCQueues_ifc_mf_ifc_heads_1 <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_heads_1$D_IN;
	if (inputVCQueues_ifc_mf_ifc_not_empty$EN)
	  inputVCQueues_ifc_mf_ifc_not_empty <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_not_empty$D_IN;
	if (inputVCQueues_ifc_mf_ifc_not_empty_1$EN)
	  inputVCQueues_ifc_mf_ifc_not_empty_1 <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_not_empty_1$D_IN;
	if (inputVCQueues_ifc_mf_ifc_not_full$EN)
	  inputVCQueues_ifc_mf_ifc_not_full <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_not_full$D_IN;
	if (inputVCQueues_ifc_mf_ifc_not_full_1$EN)
	  inputVCQueues_ifc_mf_ifc_not_full_1 <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_not_full_1$D_IN;
	if (inputVCQueues_ifc_mf_ifc_tails$EN)
	  inputVCQueues_ifc_mf_ifc_tails <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_tails$D_IN;
	if (inputVCQueues_ifc_mf_ifc_tails_1$EN)
	  inputVCQueues_ifc_mf_ifc_tails_1 <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_tails_1$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    inputVCQueues_ifc_mf_ifc_heads = 3'h2;
    inputVCQueues_ifc_mf_ifc_heads_1 = 3'h2;
    inputVCQueues_ifc_mf_ifc_not_empty = 1'h0;
    inputVCQueues_ifc_mf_ifc_not_empty_1 = 1'h0;
    inputVCQueues_ifc_mf_ifc_not_full = 1'h0;
    inputVCQueues_ifc_mf_ifc_not_full_1 = 1'h0;
    inputVCQueues_ifc_mf_ifc_tails = 3'h2;
    inputVCQueues_ifc_mf_ifc_tails_1 = 3'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N)
      if (EN_enq && IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88)
	$write("");
    if (RST_N)
      if (EN_enq && IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88)
	$write("");
    if (RST_N)
      if (EN_enq && IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88)
	$display("Dynamic assertion failed: \"MultiFIFOMem.bsv\", line 156, column 38\nEnqueing to full FIFO in MultiFIFOMem!");
    if (RST_N)
      if (EN_enq && IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88)
	$finish(32'd0);
    if (RST_N) if (EN_enq) $write("");
    if (RST_N)
      if (EN_deq && IF_deq_fifo_out_THEN_NOT_inputVCQueues_ifc_mf__ETC___d89)
	$display("Dynamic assertion failed: \"MultiFIFOMem.bsv\", line 190, column 40\nDequeing from empty FIFO in MultiFIFOMem!");
    if (RST_N)
      if (EN_deq && IF_deq_fifo_out_THEN_NOT_inputVCQueues_ifc_mf__ETC___d89)
	$finish(32'd0);
    if (RST_N) if (EN_deq) $write("");
    if (RST_N)
      if (EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	  NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d43)
	$write("");
    if (RST_N)
      if (EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	  NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d65)
	$write("");
  end
  // synopsys translate_on
endmodule