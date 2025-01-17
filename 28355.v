module outputs
  wire [31 : 0] portA_response_get;
  wire RDY_portA_request_put, RDY_portA_response_get;
  // inlined wires
  wire [1 : 0] bram_serverAdapter_s1_1$wget;
  wire bram_serverAdapter_cnt_1$whas,
       bram_serverAdapter_outData_enqData$whas,
       bram_serverAdapter_outData_outData$whas,
       bram_serverAdapter_s1_1$whas;
  // register bram_serverAdapter_cnt
  reg [2 : 0] bram_serverAdapter_cnt;
  wire [2 : 0] bram_serverAdapter_cnt$D_IN;
  wire bram_serverAdapter_cnt$EN;
  // register bram_serverAdapter_s1
  reg [1 : 0] bram_serverAdapter_s1;
  wire [1 : 0] bram_serverAdapter_s1$D_IN;
  wire bram_serverAdapter_s1$EN;
  // ports of submodule bram_memory
  wire [31 : 0] bram_memory$DI, bram_memory$DO;
  wire [9 : 0] bram_memory$ADDR;
  wire bram_memory$EN, bram_memory$WE;
  // ports of submodule bram_serverAdapter_outDataCore
  wire [31 : 0] bram_serverAdapter_outDataCore$D_IN,
		bram_serverAdapter_outDataCore$D_OUT;
  wire bram_serverAdapter_outDataCore$CLR,
       bram_serverAdapter_outDataCore$DEQ,
       bram_serverAdapter_outDataCore$EMPTY_N,
       bram_serverAdapter_outDataCore$ENQ,
       bram_serverAdapter_outDataCore$FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_bram_serverAdapter_outData_enqAndDeq;
  // inputs to muxes for submodule ports
  wire [1 : 0] MUX_bram_serverAdapter_s1_1$wset_1__VAL_1;
  // remaining internal signals
  wire [2 : 0] bram_serverAdapter_cnt_6_PLUS_IF_bram_serverAd_ETC___d32;
  wire [1 : 0] portA_request_put_BITS_43_TO_42__q1;
  // action method portA_request_put
  assign RDY_portA_request_put = (bram_serverAdapter_cnt ^ 3'h4) < 3'd7 ;
  // actionvalue method portA_response_get
  assign portA_response_get =
	     bram_serverAdapter_outDataCore$EMPTY_N ?
	       bram_serverAdapter_outDataCore$D_OUT :
	       bram_memory$DO ;
  assign RDY_portA_response_get =
	     (bram_serverAdapter_outDataCore$EMPTY_N ||
	      bram_serverAdapter_outData_enqData$whas) &&
	     bram_serverAdapter_outData_outData$whas ;
  // submodule bram_memory
  BRAM1 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) bram_memory(.CLK(CLK),
					  .ADDR(bram_memory$ADDR),
					  .DI(bram_memory$DI),
					  .WE(bram_memory$WE),
					  .EN(bram_memory$EN),
					  .DO(bram_memory$DO));
  // submodule bram_serverAdapter_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_serverAdapter_outDataCore(.RST_N(RST_N),
							      .CLK(CLK),
							      .D_IN(bram_serverAdapter_outDataCore$D_IN),
							      .ENQ(bram_serverAdapter_outDataCore$ENQ),
							      .DEQ(bram_serverAdapter_outDataCore$DEQ),
							      .CLR(bram_serverAdapter_outDataCore$CLR),
							      .D_OUT(bram_serverAdapter_outDataCore$D_OUT),
							      .FULL_N(bram_serverAdapter_outDataCore$FULL_N),
							      .EMPTY_N(bram_serverAdapter_outDataCore$EMPTY_N));
  // rule RL_bram_serverAdapter_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_serverAdapter_outData_enqAndDeq =
	     bram_serverAdapter_outDataCore$EMPTY_N &&
	     bram_serverAdapter_outDataCore$FULL_N &&
	     EN_portA_response_get &&
	     bram_serverAdapter_outData_enqData$whas ;
  // inputs to muxes for submodule ports
  assign MUX_bram_serverAdapter_s1_1$wset_1__VAL_1 =
	     { 1'd1,
	       !portA_request_put_BITS_43_TO_42__q1[1] ||
	       portA_request_put_BITS_43_TO_42__q1[0] } ;
  // inlined wires
  assign bram_serverAdapter_outData_enqData$whas =
	     bram_serverAdapter_outDataCore$FULL_N &&
	     bram_serverAdapter_s1[1] &&
	     bram_serverAdapter_s1[0] ;
  assign bram_serverAdapter_outData_outData$whas =
	     bram_serverAdapter_outDataCore$EMPTY_N ||
	     !bram_serverAdapter_outDataCore$EMPTY_N &&
	     bram_serverAdapter_outData_enqData$whas ;
  assign bram_serverAdapter_cnt_1$whas =
	     EN_portA_request_put &&
	     (!portA_request_put_BITS_43_TO_42__q1[1] ||
	      portA_request_put_BITS_43_TO_42__q1[0]) ;
  assign bram_serverAdapter_s1_1$wget =
	     EN_portA_request_put ?
	       MUX_bram_serverAdapter_s1_1$wset_1__VAL_1 :
	       2'd0 ;
  assign bram_serverAdapter_s1_1$whas =
	     EN_portA_request_put || EN_portAClear ;
  // register bram_serverAdapter_cnt
  assign bram_serverAdapter_cnt$D_IN =
	     EN_portAClear ?
	       3'd0 :
	       bram_serverAdapter_cnt_6_PLUS_IF_bram_serverAd_ETC___d32 ;
  assign bram_serverAdapter_cnt$EN =
	     bram_serverAdapter_cnt_1$whas || EN_portA_response_get ||
	     EN_portAClear ;
  // register bram_serverAdapter_s1
  assign bram_serverAdapter_s1$D_IN =
	     { bram_serverAdapter_s1_1$whas &&
	       bram_serverAdapter_s1_1$wget[1],
	       bram_serverAdapter_s1_1$wget[0] } ;
  assign bram_serverAdapter_s1$EN = 1'd1 ;
  // submodule bram_memory
  assign bram_memory$ADDR = portA_request_put[41:32] ;
  assign bram_memory$DI = portA_request_put[31:0] ;
  assign bram_memory$WE = portA_request_put[43] ;
  assign bram_memory$EN = EN_portA_request_put ;
  // submodule bram_serverAdapter_outDataCore
  assign bram_serverAdapter_outDataCore$D_IN = bram_memory$DO ;
  assign bram_serverAdapter_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_serverAdapter_outData_enqAndDeq ||
	     bram_serverAdapter_outDataCore$FULL_N &&
	     !EN_portA_response_get &&
	     bram_serverAdapter_outData_enqData$whas ;
  assign bram_serverAdapter_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_serverAdapter_outData_enqAndDeq ||
	     bram_serverAdapter_outDataCore$EMPTY_N &&
	     EN_portA_response_get &&
	     !bram_serverAdapter_outData_enqData$whas ;
  assign bram_serverAdapter_outDataCore$CLR = EN_portAClear ;
  // remaining internal signals
  assign bram_serverAdapter_cnt_6_PLUS_IF_bram_serverAd_ETC___d32 =
	     bram_serverAdapter_cnt +
	     (bram_serverAdapter_cnt_1$whas ? 3'd1 : 3'd0) +
	     (EN_portA_response_get ? 3'd7 : 3'd0) ;
  assign portA_request_put_BITS_43_TO_42__q1 = portA_request_put[43:42] ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        bram_serverAdapter_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_serverAdapter_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
      end
    else
      begin
        if (bram_serverAdapter_cnt$EN)
	  bram_serverAdapter_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapter_cnt$D_IN;
	if (bram_serverAdapter_s1$EN)
	  bram_serverAdapter_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapter_s1$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    bram_serverAdapter_cnt = 3'h2;
    bram_serverAdapter_s1 = 2'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N)
      if (bram_serverAdapter_s1[1] && !bram_serverAdapter_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
  end
  // synopsys translate_on
endmodule