module outputs
  reg [2 : 0] first;
  wire [3 : 0] count;
  wire RDY_clear,
       RDY_count,
       RDY_deq,
       RDY_enq,
       RDY_first,
       RDY_notEmpty,
       RDY_notFull,
       notEmpty,
       notFull;
  // register outPortFIFO_ifc_fifo_almost_full
  reg outPortFIFO_ifc_fifo_almost_full;
  wire outPortFIFO_ifc_fifo_almost_full$D_IN,
       outPortFIFO_ifc_fifo_almost_full$EN;
  // register outPortFIFO_ifc_fifo_deq_cnt
  reg [63 : 0] outPortFIFO_ifc_fifo_deq_cnt;
  wire [63 : 0] outPortFIFO_ifc_fifo_deq_cnt$D_IN;
  wire outPortFIFO_ifc_fifo_deq_cnt$EN;
  // register outPortFIFO_ifc_fifo_empty
  reg outPortFIFO_ifc_fifo_empty;
  wire outPortFIFO_ifc_fifo_empty$D_IN, outPortFIFO_ifc_fifo_empty$EN;
  // register outPortFIFO_ifc_fifo_enq_cnt
  reg [63 : 0] outPortFIFO_ifc_fifo_enq_cnt;
  wire [63 : 0] outPortFIFO_ifc_fifo_enq_cnt$D_IN;
  wire outPortFIFO_ifc_fifo_enq_cnt$EN;
  // register outPortFIFO_ifc_fifo_full
  reg outPortFIFO_ifc_fifo_full;
  wire outPortFIFO_ifc_fifo_full$D_IN, outPortFIFO_ifc_fifo_full$EN;
  // register outPortFIFO_ifc_fifo_head
  reg [2 : 0] outPortFIFO_ifc_fifo_head;
  wire [2 : 0] outPortFIFO_ifc_fifo_head$D_IN;
  wire outPortFIFO_ifc_fifo_head$EN;
  // register outPortFIFO_ifc_fifo_mem
  reg [2 : 0] outPortFIFO_ifc_fifo_mem;
  wire [2 : 0] outPortFIFO_ifc_fifo_mem$D_IN;
  wire outPortFIFO_ifc_fifo_mem$EN;
  // register outPortFIFO_ifc_fifo_mem_1
  reg [2 : 0] outPortFIFO_ifc_fifo_mem_1;
  wire [2 : 0] outPortFIFO_ifc_fifo_mem_1$D_IN;
  wire outPortFIFO_ifc_fifo_mem_1$EN;
  // register outPortFIFO_ifc_fifo_mem_2
  reg [2 : 0] outPortFIFO_ifc_fifo_mem_2;
  wire [2 : 0] outPortFIFO_ifc_fifo_mem_2$D_IN;
  wire outPortFIFO_ifc_fifo_mem_2$EN;
  // register outPortFIFO_ifc_fifo_mem_3
  reg [2 : 0] outPortFIFO_ifc_fifo_mem_3;
  wire [2 : 0] outPortFIFO_ifc_fifo_mem_3$D_IN;
  wire outPortFIFO_ifc_fifo_mem_3$EN;
  // register outPortFIFO_ifc_fifo_mem_4
  reg [2 : 0] outPortFIFO_ifc_fifo_mem_4;
  wire [2 : 0] outPortFIFO_ifc_fifo_mem_4$D_IN;
  wire outPortFIFO_ifc_fifo_mem_4$EN;
  // register outPortFIFO_ifc_fifo_mem_5
  reg [2 : 0] outPortFIFO_ifc_fifo_mem_5;
  wire [2 : 0] outPortFIFO_ifc_fifo_mem_5$D_IN;
  wire outPortFIFO_ifc_fifo_mem_5$EN;
  // register outPortFIFO_ifc_fifo_mem_6
  reg [2 : 0] outPortFIFO_ifc_fifo_mem_6;
  wire [2 : 0] outPortFIFO_ifc_fifo_mem_6$D_IN;
  wire outPortFIFO_ifc_fifo_mem_6$EN;
  // register outPortFIFO_ifc_fifo_mem_7
  reg [2 : 0] outPortFIFO_ifc_fifo_mem_7;
  wire [2 : 0] outPortFIFO_ifc_fifo_mem_7$D_IN;
  wire outPortFIFO_ifc_fifo_mem_7$EN;
  // register outPortFIFO_ifc_fifo_size_cnt
  reg [3 : 0] outPortFIFO_ifc_fifo_size_cnt;
  wire [3 : 0] outPortFIFO_ifc_fifo_size_cnt$D_IN;
  wire outPortFIFO_ifc_fifo_size_cnt$EN;
  // register outPortFIFO_ifc_fifo_tail
  reg [2 : 0] outPortFIFO_ifc_fifo_tail;
  wire [2 : 0] outPortFIFO_ifc_fifo_tail$D_IN;
  wire outPortFIFO_ifc_fifo_tail$EN;
  // rule scheduling signals
  wire WILL_FIRE_RL_outPortFIFO_ifc_fifo_continuousAssert;
  // remaining internal signals
  wire [63 : 0] x__h1275, x__h2099;
  wire [3 : 0] IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d48,
	       IF_outPortFIFO_ifc_fifo_w_deq_whas_THEN_outPor_ETC___d47;
  wire [2 : 0] outPortFIFO_ifc_fifo_head_PLUS_1___d110,
	       outPortFIFO_ifc_fifo_tail_PLUS_1___d111;
  wire IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d115,
       IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d33,
       IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d41,
       IF_outPortFIFO_ifc_fifo_w_deq_whas_THEN_outPor_ETC___d32,
       IF_outPortFIFO_ifc_fifo_w_deq_whas_THEN_outPor_ETC___d40,
       IF_outPortFIFO_ifc_fifo_w_enq_whas_THEN_outPor_ETC___d23,
       IF_outPortFIFO_ifc_fifo_w_enq_whas_THEN_outPor_ETC___d31,
       outPortFIFO_ifc_fifo_empty_6_EQ_outPortFIFO_if_ETC___d82;
  // action method enq
  assign RDY_enq = 1'd1 ;
  // action method deq
  assign RDY_deq = 1'd1 ;
  // value method first
  always@(outPortFIFO_ifc_fifo_head or
	  outPortFIFO_ifc_fifo_mem_7 or
	  outPortFIFO_ifc_fifo_mem or
	  outPortFIFO_ifc_fifo_mem_1 or
	  outPortFIFO_ifc_fifo_mem_2 or
	  outPortFIFO_ifc_fifo_mem_3 or
	  outPortFIFO_ifc_fifo_mem_4 or
	  outPortFIFO_ifc_fifo_mem_5 or outPortFIFO_ifc_fifo_mem_6)
  begin
    case (outPortFIFO_ifc_fifo_head)
      3'd0: first = outPortFIFO_ifc_fifo_mem;
      3'd1: first = outPortFIFO_ifc_fifo_mem_1;
      3'd2: first = outPortFIFO_ifc_fifo_mem_2;
      3'd3: first = outPortFIFO_ifc_fifo_mem_3;
      3'd4: first = outPortFIFO_ifc_fifo_mem_4;
      3'd5: first = outPortFIFO_ifc_fifo_mem_5;
      3'd6: first = outPortFIFO_ifc_fifo_mem_6;
      3'd7: first = outPortFIFO_ifc_fifo_mem_7;
    endcase
  end
  assign RDY_first = 1'd1 ;
  // value method notFull
  assign notFull = !outPortFIFO_ifc_fifo_full ;
  assign RDY_notFull = 1'd1 ;
  // value method notEmpty
  assign notEmpty = !outPortFIFO_ifc_fifo_empty ;
  assign RDY_notEmpty = 1'd1 ;
  // value method count
  assign count = outPortFIFO_ifc_fifo_size_cnt ;
  assign RDY_count = 1'd1 ;
  // action method clear
  assign RDY_clear = 1'd1 ;
  // rule RL_outPortFIFO_ifc_fifo_continuousAssert
  assign WILL_FIRE_RL_outPortFIFO_ifc_fifo_continuousAssert =
	     outPortFIFO_ifc_fifo_empty &&
	     outPortFIFO_ifc_fifo_enq_cnt != outPortFIFO_ifc_fifo_deq_cnt ;
  // register outPortFIFO_ifc_fifo_almost_full
  assign outPortFIFO_ifc_fifo_almost_full$D_IN =
	     !EN_clear &&
	     (IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d33 ||
	      IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d115) ;
  assign outPortFIFO_ifc_fifo_almost_full$EN = 1'd1 ;
  // register outPortFIFO_ifc_fifo_deq_cnt
  assign outPortFIFO_ifc_fifo_deq_cnt$D_IN = EN_clear ? 64'd0 : x__h1275 ;
  assign outPortFIFO_ifc_fifo_deq_cnt$EN = EN_clear || EN_deq ;
  // register outPortFIFO_ifc_fifo_empty
  assign outPortFIFO_ifc_fifo_empty$D_IN =
	     EN_clear ||
	     IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d41 ;
  assign outPortFIFO_ifc_fifo_empty$EN = 1'd1 ;
  // register outPortFIFO_ifc_fifo_enq_cnt
  assign outPortFIFO_ifc_fifo_enq_cnt$D_IN = EN_clear ? 64'd0 : x__h2099 ;
  assign outPortFIFO_ifc_fifo_enq_cnt$EN = EN_clear || EN_enq ;
  // register outPortFIFO_ifc_fifo_full
  assign outPortFIFO_ifc_fifo_full$D_IN =
	     !EN_clear &&
	     IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d115 ;
  assign outPortFIFO_ifc_fifo_full$EN = 1'd1 ;
  // register outPortFIFO_ifc_fifo_head
  assign outPortFIFO_ifc_fifo_head$D_IN =
	     EN_clear ? 3'd0 : outPortFIFO_ifc_fifo_head_PLUS_1___d110 ;
  assign outPortFIFO_ifc_fifo_head$EN = EN_clear || EN_deq ;
  // register outPortFIFO_ifc_fifo_mem
  assign outPortFIFO_ifc_fifo_mem$D_IN = enq_sendData ;
  assign outPortFIFO_ifc_fifo_mem$EN =
	     !EN_clear && EN_enq && outPortFIFO_ifc_fifo_tail == 3'd0 ;
  // register outPortFIFO_ifc_fifo_mem_1
  assign outPortFIFO_ifc_fifo_mem_1$D_IN = enq_sendData ;
  assign outPortFIFO_ifc_fifo_mem_1$EN =
	     !EN_clear && EN_enq && outPortFIFO_ifc_fifo_tail == 3'd1 ;
  // register outPortFIFO_ifc_fifo_mem_2
  assign outPortFIFO_ifc_fifo_mem_2$D_IN = enq_sendData ;
  assign outPortFIFO_ifc_fifo_mem_2$EN =
	     !EN_clear && EN_enq && outPortFIFO_ifc_fifo_tail == 3'd2 ;
  // register outPortFIFO_ifc_fifo_mem_3
  assign outPortFIFO_ifc_fifo_mem_3$D_IN = enq_sendData ;
  assign outPortFIFO_ifc_fifo_mem_3$EN =
	     !EN_clear && EN_enq && outPortFIFO_ifc_fifo_tail == 3'd3 ;
  // register outPortFIFO_ifc_fifo_mem_4
  assign outPortFIFO_ifc_fifo_mem_4$D_IN = enq_sendData ;
  assign outPortFIFO_ifc_fifo_mem_4$EN =
	     !EN_clear && EN_enq && outPortFIFO_ifc_fifo_tail == 3'd4 ;
  // register outPortFIFO_ifc_fifo_mem_5
  assign outPortFIFO_ifc_fifo_mem_5$D_IN = enq_sendData ;
  assign outPortFIFO_ifc_fifo_mem_5$EN =
	     !EN_clear && EN_enq && outPortFIFO_ifc_fifo_tail == 3'd5 ;
  // register outPortFIFO_ifc_fifo_mem_6
  assign outPortFIFO_ifc_fifo_mem_6$D_IN = enq_sendData ;
  assign outPortFIFO_ifc_fifo_mem_6$EN =
	     !EN_clear && EN_enq && outPortFIFO_ifc_fifo_tail == 3'd6 ;
  // register outPortFIFO_ifc_fifo_mem_7
  assign outPortFIFO_ifc_fifo_mem_7$D_IN = enq_sendData ;
  assign outPortFIFO_ifc_fifo_mem_7$EN =
	     !EN_clear && EN_enq && outPortFIFO_ifc_fifo_tail == 3'd7 ;
  // register outPortFIFO_ifc_fifo_size_cnt
  assign outPortFIFO_ifc_fifo_size_cnt$D_IN =
	     EN_clear ?
	       4'd0 :
	       IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d48 ;
  assign outPortFIFO_ifc_fifo_size_cnt$EN = 1'd1 ;
  // register outPortFIFO_ifc_fifo_tail
  assign outPortFIFO_ifc_fifo_tail$D_IN =
	     EN_clear ? 3'd0 : outPortFIFO_ifc_fifo_tail_PLUS_1___d111 ;
  assign outPortFIFO_ifc_fifo_tail$EN = EN_clear || EN_enq ;
  // remaining internal signals
  assign IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d115 =
	     (EN_deq && EN_enq) ?
	       outPortFIFO_ifc_fifo_full :
	       !EN_deq &&
	       IF_outPortFIFO_ifc_fifo_w_enq_whas_THEN_outPor_ETC___d23 ;
  assign IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d33 =
	     (EN_deq && EN_enq) ?
	       outPortFIFO_ifc_fifo_almost_full :
	       IF_outPortFIFO_ifc_fifo_w_deq_whas_THEN_outPor_ETC___d32 ;
  assign IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d41 =
	     (EN_deq && EN_enq) ?
	       outPortFIFO_ifc_fifo_empty :
	       IF_outPortFIFO_ifc_fifo_w_deq_whas_THEN_outPor_ETC___d40 ;
  assign IF_outPortFIFO_ifc_fifo_w_deq_whas_AND_outPort_ETC___d48 =
	     (EN_deq && EN_enq) ?
	       outPortFIFO_ifc_fifo_size_cnt :
	       IF_outPortFIFO_ifc_fifo_w_deq_whas_THEN_outPor_ETC___d47 ;
  assign IF_outPortFIFO_ifc_fifo_w_deq_whas_THEN_outPor_ETC___d32 =
	     EN_deq ?
	       outPortFIFO_ifc_fifo_tail == outPortFIFO_ifc_fifo_head :
	       IF_outPortFIFO_ifc_fifo_w_enq_whas_THEN_outPor_ETC___d31 ;
  assign IF_outPortFIFO_ifc_fifo_w_deq_whas_THEN_outPor_ETC___d40 =
	     EN_deq ?
	       outPortFIFO_ifc_fifo_head_PLUS_1___d110 ==
	       outPortFIFO_ifc_fifo_tail :
	       !EN_enq && outPortFIFO_ifc_fifo_empty ;
  assign IF_outPortFIFO_ifc_fifo_w_deq_whas_THEN_outPor_ETC___d47 =
	     EN_deq ?
	       outPortFIFO_ifc_fifo_size_cnt - 4'd1 :
	       (EN_enq ?
		  outPortFIFO_ifc_fifo_size_cnt + 4'd1 :
		  outPortFIFO_ifc_fifo_size_cnt) ;
  assign IF_outPortFIFO_ifc_fifo_w_enq_whas_THEN_outPor_ETC___d23 =
	     EN_enq ?
	       outPortFIFO_ifc_fifo_tail_PLUS_1___d111 ==
	       outPortFIFO_ifc_fifo_head :
	       outPortFIFO_ifc_fifo_full ;
  assign IF_outPortFIFO_ifc_fifo_w_enq_whas_THEN_outPor_ETC___d31 =
	     EN_enq ?
	       outPortFIFO_ifc_fifo_tail + 3'd2 == outPortFIFO_ifc_fifo_head :
	       outPortFIFO_ifc_fifo_almost_full ;
  assign outPortFIFO_ifc_fifo_empty_6_EQ_outPortFIFO_if_ETC___d82 =
	     outPortFIFO_ifc_fifo_empty ==
	     (outPortFIFO_ifc_fifo_head == outPortFIFO_ifc_fifo_tail &&
	      !outPortFIFO_ifc_fifo_full) ;
  assign outPortFIFO_ifc_fifo_head_PLUS_1___d110 =
	     outPortFIFO_ifc_fifo_head + 3'd1 ;
  assign outPortFIFO_ifc_fifo_tail_PLUS_1___d111 =
	     outPortFIFO_ifc_fifo_tail + 3'd1 ;
  assign x__h1275 = outPortFIFO_ifc_fifo_deq_cnt + 64'd1 ;
  assign x__h2099 = outPortFIFO_ifc_fifo_enq_cnt + 64'd1 ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        outPortFIFO_ifc_fifo_almost_full <= `BSV_ASSIGNMENT_DELAY 1'd0;
	outPortFIFO_ifc_fifo_deq_cnt <= `BSV_ASSIGNMENT_DELAY 64'd0;
	outPortFIFO_ifc_fifo_empty <= `BSV_ASSIGNMENT_DELAY 1'd1;
	outPortFIFO_ifc_fifo_enq_cnt <= `BSV_ASSIGNMENT_DELAY 64'd0;
	outPortFIFO_ifc_fifo_full <= `BSV_ASSIGNMENT_DELAY 1'd0;
	outPortFIFO_ifc_fifo_head <= `BSV_ASSIGNMENT_DELAY 3'd0;
	outPortFIFO_ifc_fifo_mem <= `BSV_ASSIGNMENT_DELAY 3'd0;
	outPortFIFO_ifc_fifo_mem_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	outPortFIFO_ifc_fifo_mem_2 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	outPortFIFO_ifc_fifo_mem_3 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	outPortFIFO_ifc_fifo_mem_4 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	outPortFIFO_ifc_fifo_mem_5 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	outPortFIFO_ifc_fifo_mem_6 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	outPortFIFO_ifc_fifo_mem_7 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	outPortFIFO_ifc_fifo_size_cnt <= `BSV_ASSIGNMENT_DELAY 4'd0;
	outPortFIFO_ifc_fifo_tail <= `BSV_ASSIGNMENT_DELAY 3'd0;
      end
    else
      begin
        if (outPortFIFO_ifc_fifo_almost_full$EN)
	  outPortFIFO_ifc_fifo_almost_full <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_almost_full$D_IN;
	if (outPortFIFO_ifc_fifo_deq_cnt$EN)
	  outPortFIFO_ifc_fifo_deq_cnt <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_deq_cnt$D_IN;
	if (outPortFIFO_ifc_fifo_empty$EN)
	  outPortFIFO_ifc_fifo_empty <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_empty$D_IN;
	if (outPortFIFO_ifc_fifo_enq_cnt$EN)
	  outPortFIFO_ifc_fifo_enq_cnt <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_enq_cnt$D_IN;
	if (outPortFIFO_ifc_fifo_full$EN)
	  outPortFIFO_ifc_fifo_full <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_full$D_IN;
	if (outPortFIFO_ifc_fifo_head$EN)
	  outPortFIFO_ifc_fifo_head <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_head$D_IN;
	if (outPortFIFO_ifc_fifo_mem$EN)
	  outPortFIFO_ifc_fifo_mem <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_mem$D_IN;
	if (outPortFIFO_ifc_fifo_mem_1$EN)
	  outPortFIFO_ifc_fifo_mem_1 <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_mem_1$D_IN;
	if (outPortFIFO_ifc_fifo_mem_2$EN)
	  outPortFIFO_ifc_fifo_mem_2 <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_mem_2$D_IN;
	if (outPortFIFO_ifc_fifo_mem_3$EN)
	  outPortFIFO_ifc_fifo_mem_3 <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_mem_3$D_IN;
	if (outPortFIFO_ifc_fifo_mem_4$EN)
	  outPortFIFO_ifc_fifo_mem_4 <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_mem_4$D_IN;
	if (outPortFIFO_ifc_fifo_mem_5$EN)
	  outPortFIFO_ifc_fifo_mem_5 <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_mem_5$D_IN;
	if (outPortFIFO_ifc_fifo_mem_6$EN)
	  outPortFIFO_ifc_fifo_mem_6 <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_mem_6$D_IN;
	if (outPortFIFO_ifc_fifo_mem_7$EN)
	  outPortFIFO_ifc_fifo_mem_7 <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_mem_7$D_IN;
	if (outPortFIFO_ifc_fifo_size_cnt$EN)
	  outPortFIFO_ifc_fifo_size_cnt <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_size_cnt$D_IN;
	if (outPortFIFO_ifc_fifo_tail$EN)
	  outPortFIFO_ifc_fifo_tail <= `BSV_ASSIGNMENT_DELAY
	      outPortFIFO_ifc_fifo_tail$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    outPortFIFO_ifc_fifo_almost_full = 1'h0;
    outPortFIFO_ifc_fifo_deq_cnt = 64'hAAAAAAAAAAAAAAAA;
    outPortFIFO_ifc_fifo_empty = 1'h0;
    outPortFIFO_ifc_fifo_enq_cnt = 64'hAAAAAAAAAAAAAAAA;
    outPortFIFO_ifc_fifo_full = 1'h0;
    outPortFIFO_ifc_fifo_head = 3'h2;
    outPortFIFO_ifc_fifo_mem = 3'h2;
    outPortFIFO_ifc_fifo_mem_1 = 3'h2;
    outPortFIFO_ifc_fifo_mem_2 = 3'h2;
    outPortFIFO_ifc_fifo_mem_3 = 3'h2;
    outPortFIFO_ifc_fifo_mem_4 = 3'h2;
    outPortFIFO_ifc_fifo_mem_5 = 3'h2;
    outPortFIFO_ifc_fifo_mem_6 = 3'h2;
    outPortFIFO_ifc_fifo_mem_7 = 3'h2;
    outPortFIFO_ifc_fifo_size_cnt = 4'hA;
    outPortFIFO_ifc_fifo_tail = 3'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N)
      if (EN_enq && outPortFIFO_ifc_fifo_full)
	$display("location of dfifo: ",
		 "\"RegFIFO.bsv\", line 25, column 33\n");
    if (RST_N)
      if (EN_enq && outPortFIFO_ifc_fifo_full)
	$display("Dynamic assertion failed: \"RegFIFO.bsv\", line 191, column 27\nouch, enqueuing to full FIFO");
    if (RST_N) if (EN_enq && outPortFIFO_ifc_fifo_full) $finish(32'd0);
    if (RST_N)
      if (EN_deq && outPortFIFO_ifc_fifo_empty)
	$display("location of dfifo: ",
		 "\"RegFIFO.bsv\", line 25, column 33\n");
    if (RST_N)
      if (EN_deq && outPortFIFO_ifc_fifo_empty)
	$display("Dynamic assertion failed: \"RegFIFO.bsv\", line 198, column 28\nouch, dequeueing from empty FIFO");
    if (RST_N) if (EN_deq && outPortFIFO_ifc_fifo_empty) $finish(32'd0);
    if (RST_N)
      if (WILL_FIRE_RL_outPortFIFO_ifc_fifo_continuousAssert)
	$display("Continuous assertion failed: \"RegFIFO.bsv\", line 167, column 59\nmismatched in enq/deq count");
    if (RST_N)
      if (WILL_FIRE_RL_outPortFIFO_ifc_fifo_continuousAssert) $finish(32'd0);
    if (RST_N)
      if (!outPortFIFO_ifc_fifo_empty_6_EQ_outPortFIFO_if_ETC___d82)
	$display("Continuous assertion failed: \"RegFIFO.bsv\", line 170, column 45\nerror in empty signals");
    if (RST_N)
      if (!outPortFIFO_ifc_fifo_empty_6_EQ_outPortFIFO_if_ETC___d82)
	$finish(32'd0);
  end
  // synopsys translate_on
endmodule