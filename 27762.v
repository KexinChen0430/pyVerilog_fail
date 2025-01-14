module outputs
  wire [31 : 0] s_axi_RDATA;
  wire [1 : 0] s_axi_BRESP, s_axi_RRESP;
  wire s_axi_ARREADY,
       s_axi_AWREADY,
       s_axi_BVALID,
       s_axi_RVALID,
       s_axi_WREADY,
       upads_rts,
       upads_tx;
  // inlined wires
  wire [35 : 0] a4l_a4wrData_data_wire_wget;
  wire [34 : 0] a4l_a4rdAddr_data_wire_wget, a4l_a4wrAddr_data_wire_wget;
  wire [33 : 0] a4l_a4rdResp_fifof_x_wire_wget;
  wire [31 : 0] a4ls_rdAddr_w_wget, a4ls_wrAddr_w_wget, a4ls_wrData_w_wget;
  wire [3 : 0] a4ls_wrStrb_w_wget;
  wire [2 : 0] a4ls_rdProt_w_wget, a4ls_wrProt_w_wget;
  wire [1 : 0] a4l_a4wrResp_fifof_x_wire_wget;
  wire a4l_a4rdAddr_enq_enq_whas,
       a4l_a4rdAddr_enq_valid_whas,
       a4l_a4rdResp_deq_deq_whas,
       a4l_a4rdResp_deq_ready_whas,
       a4l_a4rdResp_fifof_dequeueing_whas,
       a4l_a4rdResp_fifof_enqueueing_whas,
       a4l_a4rdResp_fifof_x_wire_whas,
       a4l_a4wrAddr_enq_enq_whas,
       a4l_a4wrAddr_enq_valid_whas,
       a4l_a4wrData_enq_enq_whas,
       a4l_a4wrData_enq_valid_whas,
       a4l_a4wrResp_deq_deq_whas,
       a4l_a4wrResp_deq_ready_whas,
       a4l_a4wrResp_fifof_dequeueing_whas,
       a4l_a4wrResp_fifof_enqueueing_whas,
       a4l_a4wrResp_fifof_x_wire_whas,
       a4ls_rdAddrVal_w_wget,
       a4ls_rdAddrVal_w_whas,
       a4ls_rdAddr_w_whas,
       a4ls_rdProt_w_whas,
       a4ls_rdRespRdy_w_wget,
       a4ls_rdRespRdy_w_whas,
       a4ls_wrAddrVal_w_wget,
       a4ls_wrAddrVal_w_whas,
       a4ls_wrAddr_w_whas,
       a4ls_wrDataVal_w_wget,
       a4ls_wrDataVal_w_whas,
       a4ls_wrData_w_whas,
       a4ls_wrProt_w_whas,
       a4ls_wrRespRdy_w_wget,
       a4ls_wrRespRdy_w_whas,
       a4ls_wrStrb_w_whas;
  // register a4l_a4rdResp_fifof_cntr_r
  reg [1 : 0] a4l_a4rdResp_fifof_cntr_r;
  wire [1 : 0] a4l_a4rdResp_fifof_cntr_r_D_IN;
  wire a4l_a4rdResp_fifof_cntr_r_EN;
  // register a4l_a4rdResp_fifof_q_0
  reg [33 : 0] a4l_a4rdResp_fifof_q_0;
  reg [33 : 0] a4l_a4rdResp_fifof_q_0_D_IN;
  wire a4l_a4rdResp_fifof_q_0_EN;
  // register a4l_a4rdResp_fifof_q_1
  reg [33 : 0] a4l_a4rdResp_fifof_q_1;
  reg [33 : 0] a4l_a4rdResp_fifof_q_1_D_IN;
  wire a4l_a4rdResp_fifof_q_1_EN;
  // register a4l_a4wrResp_fifof_cntr_r
  reg [1 : 0] a4l_a4wrResp_fifof_cntr_r;
  wire [1 : 0] a4l_a4wrResp_fifof_cntr_r_D_IN;
  wire a4l_a4wrResp_fifof_cntr_r_EN;
  // register a4l_a4wrResp_fifof_q_0
  reg [1 : 0] a4l_a4wrResp_fifof_q_0;
  reg [1 : 0] a4l_a4wrResp_fifof_q_0_D_IN;
  wire a4l_a4wrResp_fifof_q_0_EN;
  // register a4l_a4wrResp_fifof_q_1
  reg [1 : 0] a4l_a4wrResp_fifof_q_1;
  wire [1 : 0] a4l_a4wrResp_fifof_q_1_D_IN;
  wire a4l_a4wrResp_fifof_q_1_EN;
  // register r0
  reg [31 : 0] r0;
  wire [31 : 0] r0_D_IN;
  wire r0_EN;
  // register r4
  reg [31 : 0] r4;
  wire [31 : 0] r4_D_IN;
  wire r4_EN;
  // register r8
  reg [31 : 0] r8;
  wire [31 : 0] r8_D_IN;
  wire r8_EN;
  // register rC
  reg [31 : 0] rC;
  wire [31 : 0] rC_D_IN;
  wire rC_EN;
  // register uartInited
  reg uartInited;
  wire uartInited_D_IN, uartInited_EN;
  // register uartTxtP
  reg [5 : 0] uartTxtP;
  wire [5 : 0] uartTxtP_D_IN;
  wire uartTxtP_EN;
  // ports of submodule a4l_a4rdAddr_fifof
  wire [34 : 0] a4l_a4rdAddr_fifof_D_IN, a4l_a4rdAddr_fifof_D_OUT;
  wire a4l_a4rdAddr_fifof_CLR,
       a4l_a4rdAddr_fifof_DEQ,
       a4l_a4rdAddr_fifof_EMPTY_N,
       a4l_a4rdAddr_fifof_ENQ,
       a4l_a4rdAddr_fifof_FULL_N;
  // ports of submodule a4l_a4wrAddr_fifof
  wire [34 : 0] a4l_a4wrAddr_fifof_D_IN, a4l_a4wrAddr_fifof_D_OUT;
  wire a4l_a4wrAddr_fifof_CLR,
       a4l_a4wrAddr_fifof_DEQ,
       a4l_a4wrAddr_fifof_EMPTY_N,
       a4l_a4wrAddr_fifof_ENQ,
       a4l_a4wrAddr_fifof_FULL_N;
  // ports of submodule a4l_a4wrData_fifof
  wire [35 : 0] a4l_a4wrData_fifof_D_IN, a4l_a4wrData_fifof_D_OUT;
  wire a4l_a4wrData_fifof_CLR,
       a4l_a4wrData_fifof_DEQ,
       a4l_a4wrData_fifof_EMPTY_N,
       a4l_a4wrData_fifof_ENQ,
       a4l_a4wrData_fifof_FULL_N;
  // ports of submodule bluart
  wire [15 : 0] bluart_setClkDiv_put;
  wire [7 : 0] bluart_rxChar_get,
	       bluart_rxLevel,
	       bluart_txChar_put,
	       bluart_txLevel;
  wire bluart_EN_rxChar_get,
       bluart_EN_setClkDiv_put,
       bluart_EN_txChar_put,
       bluart_RDY_rxChar_get,
       bluart_RDY_txChar_put,
       bluart_pads_cts_arg,
       bluart_pads_rts,
       bluart_pads_rx_arg,
       bluart_pads_tx;
  // rule scheduling signals
  wire CAN_FIRE_RL_a4l_cfwr,
       WILL_FIRE_RL_a4l_a4rdResp_fifof_both,
       WILL_FIRE_RL_a4l_a4rdResp_fifof_decCtr,
       WILL_FIRE_RL_a4l_a4rdResp_fifof_incCtr,
       WILL_FIRE_RL_a4l_a4wrResp_fifof_both,
       WILL_FIRE_RL_a4l_a4wrResp_fifof_decCtr,
       WILL_FIRE_RL_a4l_a4wrResp_fifof_incCtr,
       WILL_FIRE_RL_a4l_cfrd,
       WILL_FIRE_RL_a4l_cfwr,
       WILL_FIRE_RL_init_uart_text;
  // inputs to muxes for submodule ports
  reg [7 : 0] MUX_bluart_txChar_put_1__VAL_2;
  wire [33 : 0] MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_1,
		MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_2,
		MUX_a4l_a4rdResp_fifof_q_1_write_1__VAL_2;
  wire [1 : 0] MUX_a4l_a4rdResp_fifof_cntr_r_write_1__VAL_2,
	       MUX_a4l_a4wrResp_fifof_cntr_r_write_1__VAL_2,
	       MUX_a4l_a4wrResp_fifof_q_0_write_1__VAL_2;
  wire MUX_a4l_a4rdResp_fifof_q_0_write_1__SEL_1,
       MUX_a4l_a4rdResp_fifof_q_0_write_1__SEL_2,
       MUX_a4l_a4rdResp_fifof_q_1_write_1__SEL_1,
       MUX_a4l_a4rdResp_fifof_q_1_write_1__SEL_2,
       MUX_a4l_a4wrResp_fifof_q_0_write_1__SEL_1,
       MUX_a4l_a4wrResp_fifof_q_0_write_1__SEL_2,
       MUX_bluart_txChar_put_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h6172, v__h6591, v__h6623;
  reg [31 : 0] v__h6246;
  reg [7 : 0] put__h3600;
  wire [31 : 0] rdat__h6330, rdat__h6336, v__h6367, v__h6388;
  wire [5 : 0] x__h3644;
  wire [1 : 0] a4l_a4rdResp_fifof_cntr_r_2_MINUS_1___d60,
	       a4l_a4wrResp_fifof_cntr_r_9_MINUS_1___d27;
  wire _dfoo1, _dfoo3, _dfoo5, _dfoo7;
  // value method s_axi_sAWREADY
  assign s_axi_AWREADY = a4l_a4wrAddr_fifof_FULL_N ;
  // value method s_axi_sWREADY
  assign s_axi_WREADY = a4l_a4wrData_fifof_FULL_N ;
  // value method s_axi_sBVALID
  assign s_axi_BVALID = a4l_a4wrResp_fifof_cntr_r != 2'd0 ;
  // value method s_axi_sBRESP
  assign s_axi_BRESP = a4l_a4wrResp_fifof_q_0 ;
  // value method s_axi_sARREADY
  assign s_axi_ARREADY = a4l_a4rdAddr_fifof_FULL_N ;
  // value method s_axi_sRVALID
  assign s_axi_RVALID = a4l_a4rdResp_fifof_cntr_r != 2'd0 ;
  // value method s_axi_sRDATA
  assign s_axi_RDATA = a4l_a4rdResp_fifof_q_0[31:0] ;
  // value method s_axi_sRRESP
  assign s_axi_RRESP = a4l_a4rdResp_fifof_q_0[33:32] ;
  // value method upads_rts
  assign upads_rts = bluart_pads_rts ;
  // value method upads_tx
  assign upads_tx = bluart_pads_tx ;
  // submodule a4l_a4rdAddr_fifof
  FIFO2 #(.width(32'd35),
	  .guarded(32'd1)) a4l_a4rdAddr_fifof(.RST(s_axi_aresetn),
					      .CLK(s_axi_aclk),
					      .D_IN(a4l_a4rdAddr_fifof_D_IN),
					      .ENQ(a4l_a4rdAddr_fifof_ENQ),
					      .DEQ(a4l_a4rdAddr_fifof_DEQ),
					      .CLR(a4l_a4rdAddr_fifof_CLR),
					      .D_OUT(a4l_a4rdAddr_fifof_D_OUT),
					      .FULL_N(a4l_a4rdAddr_fifof_FULL_N),
					      .EMPTY_N(a4l_a4rdAddr_fifof_EMPTY_N));
  // submodule a4l_a4wrAddr_fifof
  FIFO2 #(.width(32'd35),
	  .guarded(32'd1)) a4l_a4wrAddr_fifof(.RST(s_axi_aresetn),
					      .CLK(s_axi_aclk),
					      .D_IN(a4l_a4wrAddr_fifof_D_IN),
					      .ENQ(a4l_a4wrAddr_fifof_ENQ),
					      .DEQ(a4l_a4wrAddr_fifof_DEQ),
					      .CLR(a4l_a4wrAddr_fifof_CLR),
					      .D_OUT(a4l_a4wrAddr_fifof_D_OUT),
					      .FULL_N(a4l_a4wrAddr_fifof_FULL_N),
					      .EMPTY_N(a4l_a4wrAddr_fifof_EMPTY_N));
  // submodule a4l_a4wrData_fifof
  FIFO2 #(.width(32'd36),
	  .guarded(32'd1)) a4l_a4wrData_fifof(.RST(s_axi_aresetn),
					      .CLK(s_axi_aclk),
					      .D_IN(a4l_a4wrData_fifof_D_IN),
					      .ENQ(a4l_a4wrData_fifof_ENQ),
					      .DEQ(a4l_a4wrData_fifof_DEQ),
					      .CLR(a4l_a4wrData_fifof_CLR),
					      .D_OUT(a4l_a4wrData_fifof_D_OUT),
					      .FULL_N(a4l_a4wrData_fifof_FULL_N),
					      .EMPTY_N(a4l_a4wrData_fifof_EMPTY_N));
  // submodule bluart
  mkBLUART bluart(.CLK(s_axi_aclk),
		  .RST_N(s_axi_aresetn),
		  .pads_cts_arg(bluart_pads_cts_arg),
		  .pads_rx_arg(bluart_pads_rx_arg),
		  .setClkDiv_put(bluart_setClkDiv_put),
		  .txChar_put(bluart_txChar_put),
		  .EN_setClkDiv_put(bluart_EN_setClkDiv_put),
		  .EN_txChar_put(bluart_EN_txChar_put),
		  .EN_rxChar_get(bluart_EN_rxChar_get),
		  .RDY_setClkDiv_put(),
		  .txLevel(bluart_txLevel),
		  .RDY_txLevel(),
		  .rxLevel(bluart_rxLevel),
		  .RDY_rxLevel(),
		  .RDY_txChar_put(bluart_RDY_txChar_put),
		  .rxChar_get(bluart_rxChar_get),
		  .RDY_rxChar_get(bluart_RDY_rxChar_get),
		  .pads_rts(bluart_pads_rts),
		  .pads_tx(bluart_pads_tx));
  // rule RL_a4l_cfrd
  assign WILL_FIRE_RL_a4l_cfrd =
	     a4l_a4rdResp_fifof_cntr_r != 2'd2 &&
	     a4l_a4rdAddr_fifof_EMPTY_N &&
	     (a4l_a4rdAddr_fifof_D_OUT[7:0] != 8'h30 ||
	      bluart_rxLevel == 8'd0 ||
	      bluart_RDY_rxChar_get) ;
  // rule RL_init_uart_text
  assign WILL_FIRE_RL_init_uart_text = bluart_RDY_txChar_put && !uartInited ;
  // rule RL_a4l_cfwr
  assign CAN_FIRE_RL_a4l_cfwr =
	     a4l_a4wrResp_fifof_cntr_r != 2'd2 &&
	     a4l_a4wrAddr_fifof_EMPTY_N &&
	     a4l_a4wrData_fifof_EMPTY_N &&
	     (a4l_a4wrAddr_fifof_D_OUT[7:0] != 8'h2C ||
	      bluart_RDY_txChar_put) ;
  assign WILL_FIRE_RL_a4l_cfwr =
	     CAN_FIRE_RL_a4l_cfwr && !WILL_FIRE_RL_init_uart_text ;
  // rule RL_a4l_a4wrResp_fifof_incCtr
  assign WILL_FIRE_RL_a4l_a4wrResp_fifof_incCtr =
	     WILL_FIRE_RL_a4l_cfwr && WILL_FIRE_RL_a4l_cfwr &&
	     !a4l_a4wrResp_fifof_dequeueing_whas ;
  // rule RL_a4l_a4wrResp_fifof_decCtr
  assign WILL_FIRE_RL_a4l_a4wrResp_fifof_decCtr =
	     a4l_a4wrResp_fifof_dequeueing_whas && !WILL_FIRE_RL_a4l_cfwr ;
  // rule RL_a4l_a4wrResp_fifof_both
  assign WILL_FIRE_RL_a4l_a4wrResp_fifof_both =
	     WILL_FIRE_RL_a4l_cfwr && a4l_a4wrResp_fifof_dequeueing_whas &&
	     WILL_FIRE_RL_a4l_cfwr ;
  // rule RL_a4l_a4rdResp_fifof_incCtr
  assign WILL_FIRE_RL_a4l_a4rdResp_fifof_incCtr =
	     WILL_FIRE_RL_a4l_cfrd && WILL_FIRE_RL_a4l_cfrd &&
	     !a4l_a4rdResp_fifof_dequeueing_whas ;
  // rule RL_a4l_a4rdResp_fifof_decCtr
  assign WILL_FIRE_RL_a4l_a4rdResp_fifof_decCtr =
	     a4l_a4rdResp_fifof_dequeueing_whas && !WILL_FIRE_RL_a4l_cfrd ;
  // rule RL_a4l_a4rdResp_fifof_both
  assign WILL_FIRE_RL_a4l_a4rdResp_fifof_both =
	     WILL_FIRE_RL_a4l_cfrd && a4l_a4rdResp_fifof_dequeueing_whas &&
	     WILL_FIRE_RL_a4l_cfrd ;
  // inputs to muxes for submodule ports
  assign MUX_a4l_a4rdResp_fifof_q_0_write_1__SEL_1 =
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_incCtr &&
	     a4l_a4rdResp_fifof_cntr_r == 2'd0 ;
  assign MUX_a4l_a4rdResp_fifof_q_0_write_1__SEL_2 =
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_both && _dfoo7 ;
  assign MUX_a4l_a4rdResp_fifof_q_1_write_1__SEL_1 =
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_incCtr &&
	     a4l_a4rdResp_fifof_cntr_r == 2'd1 ;
  assign MUX_a4l_a4rdResp_fifof_q_1_write_1__SEL_2 =
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_both && _dfoo5 ;
  assign MUX_a4l_a4wrResp_fifof_q_0_write_1__SEL_1 =
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_incCtr &&
	     a4l_a4wrResp_fifof_cntr_r == 2'd0 ;
  assign MUX_a4l_a4wrResp_fifof_q_0_write_1__SEL_2 =
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_both && _dfoo3 ;
  assign MUX_bluart_txChar_put_1__SEL_1 =
	     WILL_FIRE_RL_a4l_cfwr && a4l_a4wrAddr_fifof_D_OUT[7:0] == 8'h2C ;
  assign MUX_a4l_a4rdResp_fifof_cntr_r_write_1__VAL_2 =
	     a4l_a4rdResp_fifof_cntr_r + 2'd1 ;
  assign MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_1 = { 2'd0, v__h6246 } ;
  assign MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_2 =
	     (a4l_a4rdResp_fifof_cntr_r == 2'd1) ?
	       MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_1 :
	       a4l_a4rdResp_fifof_q_1 ;
  assign MUX_a4l_a4rdResp_fifof_q_1_write_1__VAL_2 =
	     (a4l_a4rdResp_fifof_cntr_r == 2'd2) ?
	       MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_1 :
	       34'd0 ;
  assign MUX_a4l_a4wrResp_fifof_cntr_r_write_1__VAL_2 =
	     a4l_a4wrResp_fifof_cntr_r + 2'd1 ;
  assign MUX_a4l_a4wrResp_fifof_q_0_write_1__VAL_2 =
	     (a4l_a4wrResp_fifof_cntr_r == 2'd1) ?
	       2'd0 :
	       a4l_a4wrResp_fifof_q_1 ;
  always@(uartTxtP or put__h3600)
  begin
    case (uartTxtP)
      6'd0, 6'd42: MUX_bluart_txChar_put_1__VAL_2 = 8'h0D;
      6'd1, 6'd43: MUX_bluart_txChar_put_1__VAL_2 = 8'h0A;
      default: MUX_bluart_txChar_put_1__VAL_2 = put__h3600;
    endcase
  end
  // inlined wires
  assign a4l_a4wrResp_fifof_x_wire_wget = 2'd0 ;
  assign a4l_a4wrResp_fifof_x_wire_whas = WILL_FIRE_RL_a4l_cfwr ;
  assign a4l_a4rdResp_fifof_x_wire_wget =
	     MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_1 ;
  assign a4l_a4rdResp_fifof_x_wire_whas = WILL_FIRE_RL_a4l_cfrd ;
  assign a4ls_wrAddrVal_w_wget = 1'd1 ;
  assign a4ls_wrAddrVal_w_whas = s_axi_AWVALID ;
  assign a4ls_wrDataVal_w_wget = 1'd1 ;
  assign a4ls_wrDataVal_w_whas = s_axi_WVALID ;
  assign a4ls_wrRespRdy_w_wget = 1'd1 ;
  assign a4ls_wrRespRdy_w_whas = s_axi_BREADY ;
  assign a4ls_rdAddrVal_w_wget = 1'd1 ;
  assign a4ls_rdAddrVal_w_whas = s_axi_ARVALID ;
  assign a4ls_rdRespRdy_w_wget = 1'd1 ;
  assign a4ls_rdRespRdy_w_whas = s_axi_RREADY ;
  assign a4ls_wrAddr_w_wget = s_axi_AWADDR ;
  assign a4ls_wrAddr_w_whas = 1'd1 ;
  assign a4ls_wrProt_w_wget = s_axi_AWPROT ;
  assign a4ls_wrProt_w_whas = 1'd1 ;
  assign a4ls_wrData_w_wget = s_axi_WDATA ;
  assign a4ls_wrData_w_whas = 1'd1 ;
  assign a4ls_wrStrb_w_wget = s_axi_WSTRB ;
  assign a4ls_wrStrb_w_whas = 1'd1 ;
  assign a4ls_rdAddr_w_wget = s_axi_ARADDR ;
  assign a4ls_rdAddr_w_whas = 1'd1 ;
  assign a4ls_rdProt_w_wget = s_axi_ARPROT ;
  assign a4ls_rdProt_w_whas = 1'd1 ;
  assign a4l_a4wrAddr_enq_valid_whas = s_axi_AWVALID ;
  assign a4l_a4wrAddr_enq_enq_whas = 1'b0 ;
  assign a4l_a4wrData_enq_valid_whas = s_axi_WVALID ;
  assign a4l_a4wrData_enq_enq_whas = 1'b0 ;
  assign a4l_a4wrResp_fifof_enqueueing_whas = WILL_FIRE_RL_a4l_cfwr ;
  assign a4l_a4wrResp_fifof_dequeueing_whas =
	     a4l_a4wrResp_fifof_cntr_r != 2'd0 && s_axi_BREADY ;
  assign a4l_a4wrResp_deq_ready_whas = s_axi_BREADY ;
  assign a4l_a4wrResp_deq_deq_whas = 1'b0 ;
  assign a4l_a4rdAddr_enq_valid_whas = s_axi_ARVALID ;
  assign a4l_a4rdAddr_enq_enq_whas = 1'b0 ;
  assign a4l_a4rdResp_fifof_enqueueing_whas = WILL_FIRE_RL_a4l_cfrd ;
  assign a4l_a4rdResp_fifof_dequeueing_whas =
	     a4l_a4rdResp_fifof_cntr_r != 2'd0 && s_axi_RREADY ;
  assign a4l_a4rdResp_deq_ready_whas = s_axi_RREADY ;
  assign a4l_a4rdResp_deq_deq_whas = 1'b0 ;
  assign a4l_a4wrAddr_data_wire_wget = { s_axi_AWPROT, s_axi_AWADDR } ;
  assign a4l_a4wrData_data_wire_wget = { s_axi_WSTRB, s_axi_WDATA } ;
  assign a4l_a4rdAddr_data_wire_wget = { s_axi_ARPROT, s_axi_ARADDR } ;
  // register a4l_a4rdResp_fifof_cntr_r
  assign a4l_a4rdResp_fifof_cntr_r_D_IN =
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_decCtr ?
	       a4l_a4rdResp_fifof_cntr_r_2_MINUS_1___d60 :
	       MUX_a4l_a4rdResp_fifof_cntr_r_write_1__VAL_2 ;
  assign a4l_a4rdResp_fifof_cntr_r_EN =
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_decCtr ||
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_incCtr ;
  // register a4l_a4rdResp_fifof_q_0
  always@(MUX_a4l_a4rdResp_fifof_q_0_write_1__SEL_1 or
	  MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_1 or
	  MUX_a4l_a4rdResp_fifof_q_0_write_1__SEL_2 or
	  MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_2 or
	  WILL_FIRE_RL_a4l_a4rdResp_fifof_decCtr or a4l_a4rdResp_fifof_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_a4l_a4rdResp_fifof_q_0_write_1__SEL_1:
	  a4l_a4rdResp_fifof_q_0_D_IN =
	      MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_1;
      MUX_a4l_a4rdResp_fifof_q_0_write_1__SEL_2:
	  a4l_a4rdResp_fifof_q_0_D_IN =
	      MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_2;
      WILL_FIRE_RL_a4l_a4rdResp_fifof_decCtr:
	  a4l_a4rdResp_fifof_q_0_D_IN = a4l_a4rdResp_fifof_q_1;
      default: a4l_a4rdResp_fifof_q_0_D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign a4l_a4rdResp_fifof_q_0_EN =
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_incCtr &&
	     a4l_a4rdResp_fifof_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_both && _dfoo7 ||
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_decCtr ;
  // register a4l_a4rdResp_fifof_q_1
  always@(MUX_a4l_a4rdResp_fifof_q_1_write_1__SEL_1 or
	  MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_1 or
	  MUX_a4l_a4rdResp_fifof_q_1_write_1__SEL_2 or
	  MUX_a4l_a4rdResp_fifof_q_1_write_1__VAL_2 or
	  WILL_FIRE_RL_a4l_a4rdResp_fifof_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_a4l_a4rdResp_fifof_q_1_write_1__SEL_1:
	  a4l_a4rdResp_fifof_q_1_D_IN =
	      MUX_a4l_a4rdResp_fifof_q_0_write_1__VAL_1;
      MUX_a4l_a4rdResp_fifof_q_1_write_1__SEL_2:
	  a4l_a4rdResp_fifof_q_1_D_IN =
	      MUX_a4l_a4rdResp_fifof_q_1_write_1__VAL_2;
      WILL_FIRE_RL_a4l_a4rdResp_fifof_decCtr:
	  a4l_a4rdResp_fifof_q_1_D_IN = 34'd0;
      default: a4l_a4rdResp_fifof_q_1_D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign a4l_a4rdResp_fifof_q_1_EN =
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_incCtr &&
	     a4l_a4rdResp_fifof_cntr_r == 2'd1 ||
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_both && _dfoo5 ||
	     WILL_FIRE_RL_a4l_a4rdResp_fifof_decCtr ;
  // register a4l_a4wrResp_fifof_cntr_r
  assign a4l_a4wrResp_fifof_cntr_r_D_IN =
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_decCtr ?
	       a4l_a4wrResp_fifof_cntr_r_9_MINUS_1___d27 :
	       MUX_a4l_a4wrResp_fifof_cntr_r_write_1__VAL_2 ;
  assign a4l_a4wrResp_fifof_cntr_r_EN =
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_decCtr ||
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_incCtr ;
  // register a4l_a4wrResp_fifof_q_0
  always@(MUX_a4l_a4wrResp_fifof_q_0_write_1__SEL_1 or
	  MUX_a4l_a4wrResp_fifof_q_0_write_1__SEL_2 or
	  MUX_a4l_a4wrResp_fifof_q_0_write_1__VAL_2 or
	  WILL_FIRE_RL_a4l_a4wrResp_fifof_decCtr or a4l_a4wrResp_fifof_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_a4l_a4wrResp_fifof_q_0_write_1__SEL_1:
	  a4l_a4wrResp_fifof_q_0_D_IN = 2'd0;
      MUX_a4l_a4wrResp_fifof_q_0_write_1__SEL_2:
	  a4l_a4wrResp_fifof_q_0_D_IN =
	      MUX_a4l_a4wrResp_fifof_q_0_write_1__VAL_2;
      WILL_FIRE_RL_a4l_a4wrResp_fifof_decCtr:
	  a4l_a4wrResp_fifof_q_0_D_IN = a4l_a4wrResp_fifof_q_1;
      default: a4l_a4wrResp_fifof_q_0_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign a4l_a4wrResp_fifof_q_0_EN =
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_incCtr &&
	     a4l_a4wrResp_fifof_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_both && _dfoo3 ||
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_decCtr ;
  // register a4l_a4wrResp_fifof_q_1
  assign a4l_a4wrResp_fifof_q_1_D_IN = 2'd0 ;
  assign a4l_a4wrResp_fifof_q_1_EN =
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_incCtr &&
	     a4l_a4wrResp_fifof_cntr_r == 2'd1 ||
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_both && _dfoo1 ||
	     WILL_FIRE_RL_a4l_a4wrResp_fifof_decCtr ;
  // register r0
  assign r0_D_IN = a4l_a4wrData_fifof_D_OUT[31:0] ;
  assign r0_EN =
	     WILL_FIRE_RL_a4l_cfwr && a4l_a4wrAddr_fifof_D_OUT[7:0] == 8'h0 ;
  // register r4
  assign r4_D_IN = a4l_a4wrData_fifof_D_OUT[31:0] ;
  assign r4_EN =
	     WILL_FIRE_RL_a4l_cfwr && a4l_a4wrAddr_fifof_D_OUT[7:0] == 8'h04 ;
  // register r8
  assign r8_D_IN = a4l_a4wrData_fifof_D_OUT[31:0] ;
  assign r8_EN =
	     WILL_FIRE_RL_a4l_cfwr && a4l_a4wrAddr_fifof_D_OUT[7:0] == 8'h08 ;
  // register rC
  assign rC_D_IN = a4l_a4wrData_fifof_D_OUT[31:0] ;
  assign rC_EN =
	     WILL_FIRE_RL_a4l_cfwr && a4l_a4wrAddr_fifof_D_OUT[7:0] == 8'h0C ;
  // register uartInited
  assign uartInited_D_IN = 1'd1 ;
  assign uartInited_EN = WILL_FIRE_RL_init_uart_text && uartTxtP == 6'd43 ;
  // register uartTxtP
  assign uartTxtP_D_IN = uartTxtP + 6'd1 ;
  assign uartTxtP_EN = WILL_FIRE_RL_init_uart_text ;
  // submodule a4l_a4rdAddr_fifof
  assign a4l_a4rdAddr_fifof_D_IN = a4l_a4rdAddr_data_wire_wget ;
  assign a4l_a4rdAddr_fifof_ENQ = a4l_a4rdAddr_fifof_FULL_N && s_axi_ARVALID ;
  assign a4l_a4rdAddr_fifof_DEQ = WILL_FIRE_RL_a4l_cfrd ;
  assign a4l_a4rdAddr_fifof_CLR = 1'b0 ;
  // submodule a4l_a4wrAddr_fifof
  assign a4l_a4wrAddr_fifof_D_IN = a4l_a4wrAddr_data_wire_wget ;
  assign a4l_a4wrAddr_fifof_ENQ = a4l_a4wrAddr_fifof_FULL_N && s_axi_AWVALID ;
  assign a4l_a4wrAddr_fifof_DEQ = WILL_FIRE_RL_a4l_cfwr ;
  assign a4l_a4wrAddr_fifof_CLR = 1'b0 ;
  // submodule a4l_a4wrData_fifof
  assign a4l_a4wrData_fifof_D_IN = a4l_a4wrData_data_wire_wget ;
  assign a4l_a4wrData_fifof_ENQ = a4l_a4wrData_fifof_FULL_N && s_axi_WVALID ;
  assign a4l_a4wrData_fifof_DEQ = WILL_FIRE_RL_a4l_cfwr ;
  assign a4l_a4wrData_fifof_CLR = 1'b0 ;
  // submodule bluart
  assign bluart_pads_cts_arg = upads_cts_arg ;
  assign bluart_pads_rx_arg = upads_rx_arg ;
  assign bluart_setClkDiv_put = a4l_a4wrData_fifof_D_OUT[15:0] ;
  assign bluart_txChar_put =
	     MUX_bluart_txChar_put_1__SEL_1 ?
	       a4l_a4wrData_fifof_D_OUT[7:0] :
	       MUX_bluart_txChar_put_1__VAL_2 ;
  assign bluart_EN_setClkDiv_put =
	     WILL_FIRE_RL_a4l_cfwr && a4l_a4wrAddr_fifof_D_OUT[7:0] == 8'h20 ;
  assign bluart_EN_txChar_put =
	     WILL_FIRE_RL_a4l_cfwr &&
	     a4l_a4wrAddr_fifof_D_OUT[7:0] == 8'h2C ||
	     WILL_FIRE_RL_init_uart_text ;
  assign bluart_EN_rxChar_get =
	     WILL_FIRE_RL_a4l_cfrd &&
	     a4l_a4rdAddr_fifof_D_OUT[7:0] == 8'h30 &&
	     bluart_rxLevel != 8'd0 ;
  // remaining internal signals
  assign _dfoo1 =
	     a4l_a4wrResp_fifof_cntr_r != 2'd2 ||
	     a4l_a4wrResp_fifof_cntr_r_9_MINUS_1___d27 == 2'd1 ;
  assign _dfoo3 =
	     a4l_a4wrResp_fifof_cntr_r != 2'd1 ||
	     a4l_a4wrResp_fifof_cntr_r_9_MINUS_1___d27 == 2'd0 ;
  assign _dfoo5 =
	     a4l_a4rdResp_fifof_cntr_r != 2'd2 ||
	     a4l_a4rdResp_fifof_cntr_r_2_MINUS_1___d60 == 2'd1 ;
  assign _dfoo7 =
	     a4l_a4rdResp_fifof_cntr_r != 2'd1 ||
	     a4l_a4rdResp_fifof_cntr_r_2_MINUS_1___d60 == 2'd0 ;
  assign a4l_a4rdResp_fifof_cntr_r_2_MINUS_1___d60 =
	     a4l_a4rdResp_fifof_cntr_r - 2'd1 ;
  assign a4l_a4wrResp_fifof_cntr_r_9_MINUS_1___d27 =
	     a4l_a4wrResp_fifof_cntr_r - 2'd1 ;
  assign rdat__h6330 = { 24'd0, bluart_txLevel } ;
  assign rdat__h6336 = { 24'd0, bluart_rxLevel } ;
  assign v__h6367 = (bluart_rxLevel == 8'd0) ? 32'd0 : v__h6388 ;
  assign v__h6388 = { 24'd0, bluart_rxChar_get } ;
  assign x__h3644 = uartTxtP - 6'd2 ;
  always@(a4l_a4rdAddr_fifof_D_OUT or
	  v__h6367 or r0 or r4 or r8 or rC or rdat__h6330 or rdat__h6336)
  begin
    case (a4l_a4rdAddr_fifof_D_OUT[7:0])
      8'h0: v__h6246 = r0;
      8'h04: v__h6246 = r4;
      8'h08: v__h6246 = r8;
      8'h0C: v__h6246 = rC;
      8'h10: v__h6246 = 32'hDEADBEEF;
      8'h14: v__h6246 = 32'hBABECAFE;
      8'h18: v__h6246 = 32'hF00DFACE;
      8'h1C: v__h6246 = 32'hFEEDC0DE;
      8'h24: v__h6246 = rdat__h6330;
      8'h28: v__h6246 = rdat__h6336;
      default: v__h6246 = v__h6367;
    endcase
  end
  always@(x__h3644)
  begin
    case (x__h3644)
      6'd0, 6'd5, 6'd15: put__h3600 = 8'd65;
      6'd1: put__h3600 = 8'd88;
      6'd2: put__h3600 = 8'd66;
      6'd3, 6'd28, 6'd29: put__h3600 = 8'd76;
      6'd4: put__h3600 = 8'd85;
      6'd6, 6'd22: put__h3600 = 8'd82;
      6'd7: put__h3600 = 8'd84;
      6'd8: put__h3600 = 8'd46;
      6'd9: put__h3600 = 8'd98;
      6'd10, 6'd26: put__h3600 = 8'd115;
      6'd11: put__h3600 = 8'd118;
      6'd12, 6'd14, 6'd21, 6'd27, 6'd31, 6'd35: put__h3600 = 8'd32;
      6'd13: put__h3600 = 8'd45;
      6'd16: put__h3600 = 8'd116;
      6'd17: put__h3600 = 8'd111;
      6'd18: put__h3600 = 8'd109;
      6'd19: put__h3600 = 8'd105;
      6'd20, 6'd33: put__h3600 = 8'd99;
      6'd23: put__h3600 = 8'd117;
      6'd24: put__h3600 = 8'd108;
      6'd25: put__h3600 = 8'd101;
      6'd30: put__h3600 = 8'd67;
      6'd32: put__h3600 = 8'd40;
      6'd34: put__h3600 = 8'd41;
      6'd36: put__h3600 = 8'd50;
      6'd37: put__h3600 = 8'd48;
      6'd38: put__h3600 = 8'd49;
      6'd39: put__h3600 = 8'd52;
      default: put__h3600 = 8'b10101010 /* unspecified value */ ;
    endcase
  end
  // handling of inlined registers
  always@(posedge s_axi_aclk)
  begin
    if (s_axi_aresetn == `BSV_RESET_VALUE)
      begin
        a4l_a4rdResp_fifof_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	a4l_a4rdResp_fifof_q_0 <= `BSV_ASSIGNMENT_DELAY 34'd0;
	a4l_a4rdResp_fifof_q_1 <= `BSV_ASSIGNMENT_DELAY 34'd0;
	a4l_a4wrResp_fifof_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	a4l_a4wrResp_fifof_q_0 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	a4l_a4wrResp_fifof_q_1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	r0 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	r4 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	r8 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rC <= `BSV_ASSIGNMENT_DELAY 32'd0;
	uartInited <= `BSV_ASSIGNMENT_DELAY 1'd0;
	uartTxtP <= `BSV_ASSIGNMENT_DELAY 6'd0;
      end
    else
      begin
        if (a4l_a4rdResp_fifof_cntr_r_EN)
	  a4l_a4rdResp_fifof_cntr_r <= `BSV_ASSIGNMENT_DELAY
	      a4l_a4rdResp_fifof_cntr_r_D_IN;
	if (a4l_a4rdResp_fifof_q_0_EN)
	  a4l_a4rdResp_fifof_q_0 <= `BSV_ASSIGNMENT_DELAY
	      a4l_a4rdResp_fifof_q_0_D_IN;
	if (a4l_a4rdResp_fifof_q_1_EN)
	  a4l_a4rdResp_fifof_q_1 <= `BSV_ASSIGNMENT_DELAY
	      a4l_a4rdResp_fifof_q_1_D_IN;
	if (a4l_a4wrResp_fifof_cntr_r_EN)
	  a4l_a4wrResp_fifof_cntr_r <= `BSV_ASSIGNMENT_DELAY
	      a4l_a4wrResp_fifof_cntr_r_D_IN;
	if (a4l_a4wrResp_fifof_q_0_EN)
	  a4l_a4wrResp_fifof_q_0 <= `BSV_ASSIGNMENT_DELAY
	      a4l_a4wrResp_fifof_q_0_D_IN;
	if (a4l_a4wrResp_fifof_q_1_EN)
	  a4l_a4wrResp_fifof_q_1 <= `BSV_ASSIGNMENT_DELAY
	      a4l_a4wrResp_fifof_q_1_D_IN;
	if (r0_EN) r0 <= `BSV_ASSIGNMENT_DELAY r0_D_IN;
	if (r4_EN) r4 <= `BSV_ASSIGNMENT_DELAY r4_D_IN;
	if (r8_EN) r8 <= `BSV_ASSIGNMENT_DELAY r8_D_IN;
	if (rC_EN) rC <= `BSV_ASSIGNMENT_DELAY rC_D_IN;
	if (uartInited_EN)
	  uartInited <= `BSV_ASSIGNMENT_DELAY uartInited_D_IN;
	if (uartTxtP_EN) uartTxtP <= `BSV_ASSIGNMENT_DELAY uartTxtP_D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    a4l_a4rdResp_fifof_cntr_r = 2'h2;
    a4l_a4rdResp_fifof_q_0 = 34'h2AAAAAAAA;
    a4l_a4rdResp_fifof_q_1 = 34'h2AAAAAAAA;
    a4l_a4wrResp_fifof_cntr_r = 2'h2;
    a4l_a4wrResp_fifof_q_0 = 2'h2;
    a4l_a4wrResp_fifof_q_1 = 2'h2;
    r0 = 32'hAAAAAAAA;
    r4 = 32'hAAAAAAAA;
    r8 = 32'hAAAAAAAA;
    rC = 32'hAAAAAAAA;
    uartInited = 1'h0;
    uartTxtP = 6'h2A;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge s_axi_aclk)
  begin
    #0;
    if (s_axi_aresetn != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_a4l_cfrd)
	begin
	  v__h6591 = $time;
	  #0;
	end
    if (s_axi_aresetn != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_a4l_cfrd)
	$display("[%0d]: %m: AXI4-LITE CONFIG READ Addr:%0x",
		 v__h6591,
		 a4l_a4rdAddr_fifof_D_OUT[31:0]);
    if (s_axi_aresetn != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_a4l_cfrd)
	begin
	  v__h6623 = $time;
	  #0;
	end
    if (s_axi_aresetn != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_a4l_cfrd)
	$display("[%0d]: %m: AXI4-LITE CONFIG READ RESPOSNE Data:%0x",
		 v__h6623,
		 v__h6246);
    if (s_axi_aresetn != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_a4l_cfwr)
	begin
	  v__h6172 = $time;
	  #0;
	end
    if (s_axi_aresetn != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_a4l_cfwr)
	$display("[%0d]: %m: AXI4-LITE CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h6172,
		 a4l_a4wrAddr_fifof_D_OUT[31:0],
		 a4l_a4wrData_fifof_D_OUT[35:32],
		 a4l_a4wrData_fifof_D_OUT[31:0]);
  end
  // synopsys translate_on
endmodule