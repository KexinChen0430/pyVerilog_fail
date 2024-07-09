module outputs
  wire [7 : 0] rxChar_get, rxLevel, txLevel;
  wire RDY_rxChar_get,
       RDY_rxLevel,
       RDY_setClkDiv_put,
       RDY_txChar_put,
       RDY_txLevel,
       pads_rts,
       pads_tx;
  // register clkDiv
  reg [15 : 0] clkDiv;
  wire [15 : 0] clkDiv_D_IN;
  wire clkDiv_EN;
  // register rxBaudCnt
  reg [15 : 0] rxBaudCnt;
  wire [15 : 0] rxBaudCnt_D_IN;
  wire rxBaudCnt_EN;
  // register rxBitCnt
  reg [3 : 0] rxBitCnt;
  wire [3 : 0] rxBitCnt_D_IN;
  wire rxBitCnt_EN;
  // register rxCtsReg
  reg rxCtsReg;
  wire rxCtsReg_D_IN, rxCtsReg_EN;
  // register rxD
  reg [1 : 0] rxD;
  wire [1 : 0] rxD_D_IN;
  wire rxD_EN;
  // register rxInReg
  reg rxInReg;
  wire rxInReg_D_IN, rxInReg_EN;
  // register rxV
  reg [7 : 0] rxV;
  wire [7 : 0] rxV_D_IN;
  wire rxV_EN;
  // register txBaudCnt
  reg [15 : 0] txBaudCnt;
  wire [15 : 0] txBaudCnt_D_IN;
  wire txBaudCnt_EN;
  // register txBitCnt
  reg [3 : 0] txBitCnt;
  reg [3 : 0] txBitCnt_D_IN;
  wire txBitCnt_EN;
  // register txData
  reg txData;
  wire txData_D_IN, txData_EN;
  // register txSendPtr
  reg [7 : 0] txSendPtr;
  wire [7 : 0] txSendPtr_D_IN;
  wire txSendPtr_EN;
  // ports of submodule rxF
  wire [7 : 0] rxF_D_IN, rxF_D_OUT;
  wire rxF_CLR, rxF_DEQ, rxF_EMPTY_N, rxF_ENQ, rxF_FULL_N;
  // ports of submodule txF
  wire [7 : 0] txF_D_IN, txF_D_OUT;
  wire txF_CLR, txF_DEQ, txF_EMPTY_N, txF_ENQ, txF_FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_update_txBitCnt;
  // remaining internal signals
  wire [15 : 0] IF_rxBitCnt_7_EQ_10_1_AND_rxBaudCnt_2_EQ_clkDi_ETC___d45;
  wire [9 : 0] txa__h2921;
  wire rxBaudCnt_2_EQ_clkDiv_SRL_1_3___d34,
       rxBaudCnt_2_ULT_clkDiv___d38,
       rxBitCnt_7_EQ_0_8_AND_rxD_3_EQ_0b10_9_0_OR_rxB_ETC___d42,
       rxBitCnt_7_EQ_0_8_AND_rxD_3_EQ_0b10_9_0_OR_rxB_ETC___d49;
  // action method setClkDiv_put
  assign RDY_setClkDiv_put = 1'd1 ;
  // value method txLevel
  assign txLevel = txF_EMPTY_N ? 8'd1 : 8'd0 ;
  assign RDY_txLevel = 1'd1 ;
  // value method rxLevel
  assign rxLevel = rxF_EMPTY_N ? 8'd1 : 8'd0 ;
  assign RDY_rxLevel = 1'd1 ;
  // action method txChar_put
  assign RDY_txChar_put = txF_FULL_N ;
  // actionvalue method rxChar_get
  assign rxChar_get = rxF_D_OUT ;
  assign RDY_rxChar_get = rxF_EMPTY_N ;
  // value method pads_rts
  assign pads_rts = 1'd1 ;
  // value method pads_tx
  assign pads_tx = txData ;
  // submodule rxF
  SizedFIFO #(.p1width(32'd8),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(32'd1)) rxF(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(rxF_D_IN),
				   .ENQ(rxF_ENQ),
				   .DEQ(rxF_DEQ),
				   .CLR(rxF_CLR),
				   .D_OUT(rxF_D_OUT),
				   .FULL_N(rxF_FULL_N),
				   .EMPTY_N(rxF_EMPTY_N));
  // submodule txF
  FIFO2 #(.width(32'd8), .guarded(32'd1)) txF(.RST(RST_N),
					      .CLK(CLK),
					      .D_IN(txF_D_IN),
					      .ENQ(txF_ENQ),
					      .DEQ(txF_DEQ),
					      .CLR(txF_CLR),
					      .D_OUT(txF_D_OUT),
					      .FULL_N(txF_FULL_N),
					      .EMPTY_N(txF_EMPTY_N));
  // rule RL_update_txBitCnt
  assign WILL_FIRE_RL_update_txBitCnt =
	     (txBitCnt != 4'd9 || txF_EMPTY_N) && txBaudCnt == clkDiv ;
  // register clkDiv
  assign clkDiv_D_IN = setClkDiv_put ;
  assign clkDiv_EN = EN_setClkDiv_put ;
  // register rxBaudCnt
  assign rxBaudCnt_D_IN =
	     (rxBitCnt == 4'd0 && rxD == 2'b10) ?
	       16'd1 :
	       IF_rxBitCnt_7_EQ_10_1_AND_rxBaudCnt_2_EQ_clkDi_ETC___d45 ;
  assign rxBaudCnt_EN =
	     rxBitCnt_7_EQ_0_8_AND_rxD_3_EQ_0b10_9_0_OR_rxB_ETC___d42 ;
  // register rxBitCnt
  assign rxBitCnt_D_IN =
	     (rxBitCnt == 4'd0 && rxD == 2'b10) ?
	       4'd1 :
	       ((rxBitCnt == 4'd10 && rxBaudCnt_2_EQ_clkDiv_SRL_1_3___d34) ?
		  4'd0 :
		  rxBitCnt + 4'd1) ;
  assign rxBitCnt_EN =
	     rxBitCnt_7_EQ_0_8_AND_rxD_3_EQ_0b10_9_0_OR_rxB_ETC___d49 ;
  // register rxCtsReg
  assign rxCtsReg_D_IN = pads_cts_arg ;
  assign rxCtsReg_EN = 1'd1 ;
  // register rxD
  assign rxD_D_IN = { rxD[0], rxInReg } ;
  assign rxD_EN = 1'd1 ;
  // register rxInReg
  assign rxInReg_D_IN = pads_rx_arg ;
  assign rxInReg_EN = 1'd1 ;
  // register rxV
  assign rxV_D_IN = { rxD[1], rxV[7:1] } ;
  assign rxV_EN = rxBaudCnt_2_EQ_clkDiv_SRL_1_3___d34 ;
  // register txBaudCnt
  assign txBaudCnt_D_IN = (txBaudCnt < clkDiv) ? txBaudCnt + 16'd1 : 16'd0 ;
  assign txBaudCnt_EN = 1'd1 ;
  // register txBitCnt
  always@(txBitCnt)
  begin
    case (txBitCnt)
      4'd0: txBitCnt_D_IN = 4'd1;
      4'd9: txBitCnt_D_IN = 4'd0;
      default: txBitCnt_D_IN = txBitCnt + 4'd1;
    endcase
  end
  assign txBitCnt_EN =
	     WILL_FIRE_RL_update_txBitCnt &&
	     (txF_EMPTY_N || txBitCnt != 4'd0) ;
  // register txData
  assign txData_D_IN = txa__h2921[txBitCnt] ;
  assign txData_EN = txF_EMPTY_N ;
  // register txSendPtr
  assign txSendPtr_D_IN = 8'h0 ;
  assign txSendPtr_EN = 1'b0 ;
  // submodule rxF
  assign rxF_D_IN = rxV ;
  assign rxF_ENQ =
	     rxF_FULL_N && rxD[1] && rxBitCnt == 4'd10 &&
	     rxBaudCnt_2_EQ_clkDiv_SRL_1_3___d34 ;
  assign rxF_DEQ = EN_rxChar_get ;
  assign rxF_CLR = 1'b0 ;
  // submodule txF
  assign txF_D_IN = txChar_put ;
  assign txF_ENQ = EN_txChar_put ;
  assign txF_DEQ = WILL_FIRE_RL_update_txBitCnt && txBitCnt == 4'd9 ;
  assign txF_CLR = 1'b0 ;
  // remaining internal signals
  assign IF_rxBitCnt_7_EQ_10_1_AND_rxBaudCnt_2_EQ_clkDi_ETC___d45 =
	     (rxBitCnt == 4'd10 && rxBaudCnt_2_EQ_clkDiv_SRL_1_3___d34) ?
	       16'd0 :
	       (rxBaudCnt_2_ULT_clkDiv___d38 ? rxBaudCnt + 16'd1 : 16'd1) ;
  assign rxBaudCnt_2_EQ_clkDiv_SRL_1_3___d34 = rxBaudCnt == clkDiv >> 1 ;
  assign rxBaudCnt_2_ULT_clkDiv___d38 = rxBaudCnt < clkDiv ;
  assign rxBitCnt_7_EQ_0_8_AND_rxD_3_EQ_0b10_9_0_OR_rxB_ETC___d42 =
	     rxBitCnt == 4'd0 && rxD == 2'b10 ||
	     rxBitCnt == 4'd10 && rxBaudCnt_2_EQ_clkDiv_SRL_1_3___d34 ||
	     rxBaudCnt != 16'd0 ||
	     !rxBaudCnt_2_ULT_clkDiv___d38 ;
  assign rxBitCnt_7_EQ_0_8_AND_rxD_3_EQ_0b10_9_0_OR_rxB_ETC___d49 =
	     rxBitCnt == 4'd0 && rxD == 2'b10 ||
	     rxBitCnt == 4'd10 && rxBaudCnt_2_EQ_clkDiv_SRL_1_3___d34 ||
	     rxBaudCnt == clkDiv ;
  assign txa__h2921 = { txF_D_OUT, 2'b01 } ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        clkDiv <= `BSV_ASSIGNMENT_DELAY 16'd1085;
	rxBaudCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
	rxBitCnt <= `BSV_ASSIGNMENT_DELAY 4'd0;
	rxCtsReg <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rxD <= `BSV_ASSIGNMENT_DELAY 2'd3;
	rxInReg <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rxV <= `BSV_ASSIGNMENT_DELAY 8'd255;
	txBaudCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
	txBitCnt <= `BSV_ASSIGNMENT_DELAY 4'd0;
	txData <= `BSV_ASSIGNMENT_DELAY 1'd1;
	txSendPtr <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (clkDiv_EN) clkDiv <= `BSV_ASSIGNMENT_DELAY clkDiv_D_IN;
	if (rxBaudCnt_EN) rxBaudCnt <= `BSV_ASSIGNMENT_DELAY rxBaudCnt_D_IN;
	if (rxBitCnt_EN) rxBitCnt <= `BSV_ASSIGNMENT_DELAY rxBitCnt_D_IN;
	if (rxCtsReg_EN) rxCtsReg <= `BSV_ASSIGNMENT_DELAY rxCtsReg_D_IN;
	if (rxD_EN) rxD <= `BSV_ASSIGNMENT_DELAY rxD_D_IN;
	if (rxInReg_EN) rxInReg <= `BSV_ASSIGNMENT_DELAY rxInReg_D_IN;
	if (rxV_EN) rxV <= `BSV_ASSIGNMENT_DELAY rxV_D_IN;
	if (txBaudCnt_EN) txBaudCnt <= `BSV_ASSIGNMENT_DELAY txBaudCnt_D_IN;
	if (txBitCnt_EN) txBitCnt <= `BSV_ASSIGNMENT_DELAY txBitCnt_D_IN;
	if (txData_EN) txData <= `BSV_ASSIGNMENT_DELAY txData_D_IN;
	if (txSendPtr_EN) txSendPtr <= `BSV_ASSIGNMENT_DELAY txSendPtr_D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    clkDiv = 16'hAAAA;
    rxBaudCnt = 16'hAAAA;
    rxBitCnt = 4'hA;
    rxCtsReg = 1'h0;
    rxD = 2'h2;
    rxInReg = 1'h0;
    rxV = 8'hAA;
    txBaudCnt = 16'hAAAA;
    txBitCnt = 4'hA;
    txData = 1'h0;
    txSendPtr = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule