module outputs)
   wire			elink_en;		// From elink of elink.v
   wire			elink_reset;		// From eclocks of eclocks.v
   wire			rx_lclk;		// From eclocks of eclocks.v
   wire			rx_lclk_div4;		// From eclocks of eclocks.v
   wire			rx_lclk_pll;		// From elink of elink.v
   wire			rxrd_access;		// From elink of elink.v
   wire [PW-1:0]	rxrd_packet;		// From elink of elink.v
   wire			rxrd_wait;		// From emaxi of emaxi.v
   wire			rxrr_access;		// From elink of elink.v
   wire [PW-1:0]	rxrr_packet;		// From elink of elink.v
   wire			rxrr_wait;		// From esaxi of esaxi.v
   wire			rxwr_access;		// From elink of elink.v
   wire [PW-1:0]	rxwr_packet;		// From elink of elink.v
   wire			rxwr_wait;		// From emaxi of emaxi.v
   wire			timeout;		// From elink of elink.v
   wire			tx_lclk;		// From eclocks of eclocks.v
   wire			tx_lclk90;		// From eclocks of eclocks.v
   wire			tx_lclk_div4;		// From eclocks of eclocks.v
   wire			txrd_access;		// From esaxi of esaxi.v
   wire [PW-1:0]	txrd_packet;		// From esaxi of esaxi.v
   wire			txrd_wait;		// From elink of elink.v
   wire			txrr_access;		// From emaxi of emaxi.v
   wire [PW-1:0]	txrr_packet;		// From emaxi of emaxi.v
   wire			txrr_wait;		// From elink of elink.v
   wire			txwr_access;		// From esaxi of esaxi.v
   wire [PW-1:0]	txwr_packet;		// From esaxi of esaxi.v
   wire			txwr_wait;		// From elink of elink.v
   // End of automatics
   //########################################################
   //ELINK
   //########################################################
   defparam elink.IOSTD_ELINK = IOSTD_ELINK;
   defparam elink.ETYPE       = ETYPE;
   elink elink(.reset			(elink_reset),
	       /*AUTOINST*/
	       // Outputs
	       .rx_lclk_pll		(rx_lclk_pll),
	       .rxo_wr_wait_p		(rxo_wr_wait_p),
	       .rxo_wr_wait_n		(rxo_wr_wait_n),
	       .rxo_rd_wait_p		(rxo_rd_wait_p),
	       .rxo_rd_wait_n		(rxo_rd_wait_n),
	       .txo_lclk_p		(txo_lclk_p),
	       .txo_lclk_n		(txo_lclk_n),
	       .txo_frame_p		(txo_frame_p),
	       .txo_frame_n		(txo_frame_n),
	       .txo_data_p		(txo_data_p[7:0]),
	       .txo_data_n		(txo_data_n[7:0]),
	       .e_chipid		(e_chipid[11:0]),
	       .elink_en		(elink_en),
	       .rxwr_access		(rxwr_access),
	       .rxwr_packet		(rxwr_packet[PW-1:0]),
	       .rxrd_access		(rxrd_access),
	       .rxrd_packet		(rxrd_packet[PW-1:0]),
	       .rxrr_access		(rxrr_access),
	       .rxrr_packet		(rxrr_packet[PW-1:0]),
	       .txwr_wait		(txwr_wait),
	       .txrd_wait		(txrd_wait),
	       .txrr_wait		(txrr_wait),
	       .mailbox_not_empty	(mailbox_not_empty),
	       .mailbox_full		(mailbox_full),
	       .timeout			(timeout),
	       // Inputs
	       .sys_clk			(sys_clk),
	       .tx_lclk			(tx_lclk),
	       .tx_lclk90		(tx_lclk90),
	       .tx_lclk_div4		(tx_lclk_div4),
	       .rx_lclk			(rx_lclk),
	       .rx_lclk_div4		(rx_lclk_div4),
	       .rxi_lclk_p		(rxi_lclk_p),
	       .rxi_lclk_n		(rxi_lclk_n),
	       .rxi_frame_p		(rxi_frame_p),
	       .rxi_frame_n		(rxi_frame_n),
	       .rxi_data_p		(rxi_data_p[7:0]),
	       .rxi_data_n		(rxi_data_n[7:0]),
	       .txi_wr_wait_p		(txi_wr_wait_p),
	       .txi_wr_wait_n		(txi_wr_wait_n),
	       .txi_rd_wait_p		(txi_rd_wait_p),
	       .txi_rd_wait_n		(txi_rd_wait_n),
	       .rxwr_wait		(rxwr_wait),
	       .rxrd_wait		(rxrd_wait),
	       .rxrr_wait		(rxrr_wait),
	       .txwr_access		(txwr_access),
	       .txwr_packet		(txwr_packet[PW-1:0]),
	       .txrd_access		(txrd_access),
	       .txrd_packet		(txrd_packet[PW-1:0]),
	       .txrr_access		(txrr_access),
	       .txrr_packet		(txrr_packet[PW-1:0]));
   //########################################################
   //CLOCK AND RESET
   //########################################################
   eclocks eclocks (.rx_clkin		(rx_lclk_pll),
		    /*AUTOINST*/
		    // Outputs
		    .tx_lclk		(tx_lclk),
		    .tx_lclk90		(tx_lclk90),
		    .tx_lclk_div4	(tx_lclk_div4),
		    .rx_lclk		(rx_lclk),
		    .rx_lclk_div4	(rx_lclk_div4),
		    .e_cclk_p		(e_cclk_p),
		    .e_cclk_n		(e_cclk_n),
		    .elink_reset	(elink_reset),
		    .e_resetb		(e_resetb),
		    // Inputs
		    .reset		(reset),
		    .elink_en		(elink_en),
		    .sys_clk		(sys_clk));
   //########################################################
   //AXI SLAVE
   //########################################################
   defparam esaxi.IDW=S_IDW;
   esaxi esaxi (.s_axi_aclk		(sys_clk),
		/*AUTOINST*/
		// Outputs
		.txwr_access		(txwr_access),
		.txwr_packet		(txwr_packet[PW-1:0]),
		.txrd_access		(txrd_access),
		.txrd_packet		(txrd_packet[PW-1:0]),
		.rxrr_wait		(rxrr_wait),
		.s_axi_arready		(s_axi_arready),
		.s_axi_awready		(s_axi_awready),
		.s_axi_bid		(s_axi_bid[S_IDW-1:0]),
		.s_axi_bresp		(s_axi_bresp[1:0]),
		.s_axi_bvalid		(s_axi_bvalid),
		.s_axi_rid		(s_axi_rid[S_IDW-1:0]),
		.s_axi_rdata		(s_axi_rdata[31:0]),
		.s_axi_rlast		(s_axi_rlast),
		.s_axi_rresp		(s_axi_rresp[1:0]),
		.s_axi_rvalid		(s_axi_rvalid),
		.s_axi_wready		(s_axi_wready),
		// Inputs
		.txwr_wait		(txwr_wait),
		.txrd_wait		(txrd_wait),
		.rxrr_access		(rxrr_access),
		.rxrr_packet		(rxrr_packet[PW-1:0]),
		.s_axi_aresetn		(s_axi_aresetn),
		.s_axi_arid		(s_axi_arid[S_IDW-1:0]),
		.s_axi_araddr		(s_axi_araddr[31:0]),
		.s_axi_arburst		(s_axi_arburst[1:0]),
		.s_axi_arcache		(s_axi_arcache[3:0]),
		.s_axi_arlock		(s_axi_arlock[1:0]),
		.s_axi_arlen		(s_axi_arlen[7:0]),
		.s_axi_arprot		(s_axi_arprot[2:0]),
		.s_axi_arqos		(s_axi_arqos[3:0]),
		.s_axi_arsize		(s_axi_arsize[2:0]),
		.s_axi_arvalid		(s_axi_arvalid),
		.s_axi_awid		(s_axi_awid[S_IDW-1:0]),
		.s_axi_awaddr		(s_axi_awaddr[31:0]),
		.s_axi_awburst		(s_axi_awburst[1:0]),
		.s_axi_awcache		(s_axi_awcache[3:0]),
		.s_axi_awlock		(s_axi_awlock[1:0]),
		.s_axi_awlen		(s_axi_awlen[7:0]),
		.s_axi_awprot		(s_axi_awprot[2:0]),
		.s_axi_awqos		(s_axi_awqos[3:0]),
		.s_axi_awsize		(s_axi_awsize[2:0]),
		.s_axi_awvalid		(s_axi_awvalid),
		.s_axi_bready		(s_axi_bready),
		.s_axi_rready		(s_axi_rready),
		.s_axi_wid		(s_axi_wid[S_IDW-1:0]),
		.s_axi_wdata		(s_axi_wdata[31:0]),
		.s_axi_wlast		(s_axi_wlast),
		.s_axi_wstrb		(s_axi_wstrb[3:0]),
		.s_axi_wvalid		(s_axi_wvalid));
   //########################################################
   //AXI MASTER INTERFACE
   //########################################################
   defparam emaxi.IDW=M_IDW;
   emaxi emaxi (.m_axi_aclk		(sys_clk),
		/*AUTOINST*/
		// Outputs
		.rxwr_wait		(rxwr_wait),
		.rxrd_wait		(rxrd_wait),
		.txrr_access		(txrr_access),
		.txrr_packet		(txrr_packet[PW-1:0]),
		.m_axi_awid		(m_axi_awid[M_IDW-1:0]),
		.m_axi_awaddr		(m_axi_awaddr[31:0]),
		.m_axi_awlen		(m_axi_awlen[7:0]),
		.m_axi_awsize		(m_axi_awsize[2:0]),
		.m_axi_awburst		(m_axi_awburst[1:0]),
		.m_axi_awlock		(m_axi_awlock[1:0]),
		.m_axi_awcache		(m_axi_awcache[3:0]),
		.m_axi_awprot		(m_axi_awprot[2:0]),
		.m_axi_awqos		(m_axi_awqos[3:0]),
		.m_axi_awvalid		(m_axi_awvalid),
		.m_axi_wid		(m_axi_wid[M_IDW-1:0]),
		.m_axi_wdata		(m_axi_wdata[63:0]),
		.m_axi_wstrb		(m_axi_wstrb[7:0]),
		.m_axi_wlast		(m_axi_wlast),
		.m_axi_wvalid		(m_axi_wvalid),
		.m_axi_bready		(m_axi_bready),
		.m_axi_arid		(m_axi_arid[M_IDW-1:0]),
		.m_axi_araddr		(m_axi_araddr[31:0]),
		.m_axi_arlen		(m_axi_arlen[7:0]),
		.m_axi_arsize		(m_axi_arsize[2:0]),
		.m_axi_arburst		(m_axi_arburst[1:0]),
		.m_axi_arlock		(m_axi_arlock[1:0]),
		.m_axi_arcache		(m_axi_arcache[3:0]),
		.m_axi_arprot		(m_axi_arprot[2:0]),
		.m_axi_arqos		(m_axi_arqos[3:0]),
		.m_axi_arvalid		(m_axi_arvalid),
		.m_axi_rready		(m_axi_rready),
		// Inputs
		.rxwr_access		(rxwr_access),
		.rxwr_packet		(rxwr_packet[PW-1:0]),
		.rxrd_access		(rxrd_access),
		.rxrd_packet		(rxrd_packet[PW-1:0]),
		.txrr_wait		(txrr_wait),
		.m_axi_aresetn		(m_axi_aresetn),
		.m_axi_awready		(m_axi_awready),
		.m_axi_wready		(m_axi_wready),
		.m_axi_bid		(m_axi_bid[M_IDW-1:0]),
		.m_axi_bresp		(m_axi_bresp[1:0]),
		.m_axi_bvalid		(m_axi_bvalid),
		.m_axi_arready		(m_axi_arready),
		.m_axi_rid		(m_axi_rid[M_IDW-1:0]),
		.m_axi_rdata		(m_axi_rdata[63:0]),
		.m_axi_rresp		(m_axi_rresp[1:0]),
		.m_axi_rlast		(m_axi_rlast),
		.m_axi_rvalid		(m_axi_rvalid));
endmodule