module outputs
  wire [7 : 0] led;
  wire [3 : 0] pcie_tx;
  wire CLK_GATE_p200clk, p200clk, p200rst;
  // register freeCnt
  reg [31 : 0] freeCnt;
  wire [31 : 0] freeCnt$D_IN;
  wire freeCnt$EN;
  // register swReg
  reg [7 : 0] swReg;
  wire [7 : 0] swReg$D_IN;
  wire swReg$EN;
  // ports of submodule aliveLed_sb
  wire aliveLed_sb$dD_OUT, aliveLed_sb$sD_IN, aliveLed_sb$sEN;
  // ports of submodule linkLed_sb
  wire linkLed_sb$dD_OUT, linkLed_sb$sD_IN, linkLed_sb$sEN;
  // ports of submodule pciw_pcie_ep
  wire [127 : 0] pciw_pcie_ep$tx_st_data0;
  wire [3 : 0] pciw_pcie_ep$pcie_rx_in, pciw_pcie_ep$pcie_tx_out;
  wire pciw_pcie_ep$ava_alive,
       pciw_pcie_ep$ava_core_clk_out,
       pciw_pcie_ep$ava_lnk_up,
       pciw_pcie_ep$ava_srstn,
       pciw_pcie_ep$rx_st_mask0,
       pciw_pcie_ep$rx_st_ready0,
       pciw_pcie_ep$tx_st_empty0,
       pciw_pcie_ep$tx_st_eop0,
       pciw_pcie_ep$tx_st_err0,
       pciw_pcie_ep$tx_st_sop0,
       pciw_pcie_ep$tx_st_valid0;
  // remaining internal signals
  wire swParity__h135, z__h559, z__h566, z__h573, z__h580, z__h587, z__h594;
  // oscillator and gates for output clock p200clk
  assign p200clk = sys0_clk ;
  assign CLK_GATE_p200clk = 1'd1 ;
  // output resets
  assign p200rst = sys0_rstn ;
  // value method pcie_tx
  assign pcie_tx = pciw_pcie_ep$pcie_tx_out ;
  // value method led
  assign led =
	     { ~swParity__h135,
	       swParity__h135,
	       aliveLed_sb$dD_OUT,
	       linkLed_sb$dD_OUT,
	       freeCnt[29:26] } ;
  // submodule aliveLed_sb
  SyncBit #(.init(1'd0)) aliveLed_sb(.sCLK(pciw_pcie_ep$ava_core_clk_out),
				     .dCLK(sys0_clk),
				     .sRST_N(pciw_pcie_ep$ava_srstn),
				     .sD_IN(aliveLed_sb$sD_IN),
				     .sEN(aliveLed_sb$sEN),
				     .dD_OUT(aliveLed_sb$dD_OUT));
  // submodule linkLed_sb
  SyncBit #(.init(1'd0)) linkLed_sb(.sCLK(pciw_pcie_ep$ava_core_clk_out),
				    .dCLK(sys0_clk),
				    .sRST_N(pciw_pcie_ep$ava_srstn),
				    .sD_IN(linkLed_sb$sD_IN),
				    .sEN(linkLed_sb$sEN),
				    .dD_OUT(linkLed_sb$dD_OUT));
  // submodule pciw_pcie_ep
  pcie_hip_s4gx_gen2_x4_128_wrapper pciw_pcie_ep(.sys0_clk(sys0_clk),
						 .sys0_rstn(sys0_rstn),
						 .pcie_clk(pcie_clk),
						 .pcie_rstn(pcie_rstn),
						 .pcie_rx_in(pciw_pcie_ep$pcie_rx_in),
						 .rx_st_mask0(pciw_pcie_ep$rx_st_mask0),
						 .rx_st_ready0(pciw_pcie_ep$rx_st_ready0),
						 .tx_st_data0(pciw_pcie_ep$tx_st_data0),
						 .tx_st_empty0(pciw_pcie_ep$tx_st_empty0),
						 .tx_st_eop0(pciw_pcie_ep$tx_st_eop0),
						 .tx_st_err0(pciw_pcie_ep$tx_st_err0),
						 .tx_st_sop0(pciw_pcie_ep$tx_st_sop0),
						 .tx_st_valid0(pciw_pcie_ep$tx_st_valid0),
						 .pcie_tx_out(pciw_pcie_ep$pcie_tx_out),
						 .ava_alive(pciw_pcie_ep$ava_alive),
						 .ava_lnk_up(pciw_pcie_ep$ava_lnk_up),
						 .rx_st_valid0(),
						 .rx_st_bardec0(),
						 .rx_st_be0(),
						 .rx_st_data0(),
						 .rx_st_sop0(),
						 .rx_st_eop0(),
						 .rx_st_empty0(),
						 .rx_st_err0(),
						 .tx_cred0(),
						 .tx_fifo_empty0(),
						 .ava_core_clk_out(pciw_pcie_ep$ava_core_clk_out),
						 .ava_srstn(pciw_pcie_ep$ava_srstn));
  // register freeCnt
  assign freeCnt$D_IN = freeCnt + 32'd1 ;
  assign freeCnt$EN = 1'd1 ;
  // register swReg
  assign swReg$D_IN = usr_sw_i ;
  assign swReg$EN = 1'd1 ;
  // submodule aliveLed_sb
  assign aliveLed_sb$sD_IN = pciw_pcie_ep$ava_alive ;
  assign aliveLed_sb$sEN = 1'd1 ;
  // submodule linkLed_sb
  assign linkLed_sb$sD_IN = pciw_pcie_ep$ava_lnk_up ;
  assign linkLed_sb$sEN = 1'd1 ;
  // submodule pciw_pcie_ep
  assign pciw_pcie_ep$pcie_rx_in = pcie_rx_i ;
  assign pciw_pcie_ep$rx_st_mask0 = 1'b0 ;
  assign pciw_pcie_ep$rx_st_ready0 = 1'b0 ;
  assign pciw_pcie_ep$tx_st_data0 = 128'h0 ;
  assign pciw_pcie_ep$tx_st_empty0 = 1'b0 ;
  assign pciw_pcie_ep$tx_st_eop0 = 1'b0 ;
  assign pciw_pcie_ep$tx_st_err0 = 1'b0 ;
  assign pciw_pcie_ep$tx_st_sop0 = 1'b0 ;
  assign pciw_pcie_ep$tx_st_valid0 = 1'b0 ;
  // remaining internal signals
  assign swParity__h135 = z__h594 ^ swReg[7] ;
  assign z__h559 = swReg[0] ^ swReg[1] ;
  assign z__h566 = z__h559 ^ swReg[2] ;
  assign z__h573 = z__h566 ^ swReg[3] ;
  assign z__h580 = z__h573 ^ swReg[4] ;
  assign z__h587 = z__h580 ^ swReg[5] ;
  assign z__h594 = z__h587 ^ swReg[6] ;
  // handling of inlined registers
  always@(posedge sys0_clk)
  begin
    if (!sys0_rstn)
      begin
        freeCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	swReg <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (freeCnt$EN) freeCnt <= `BSV_ASSIGNMENT_DELAY freeCnt$D_IN;
	if (swReg$EN) swReg <= `BSV_ASSIGNMENT_DELAY swReg$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    freeCnt = 32'hAAAAAAAA;
    swReg = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule