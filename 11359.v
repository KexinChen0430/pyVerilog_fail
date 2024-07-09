module outputs)
   wire [15:0]		ecfg_clk_settings;	// From ecfg of ecfg.v
   wire [11:0]		ecfg_coreid;		// From ecfg of ecfg.v
   wire [10:0]		ecfg_dataout;		// From ecfg of ecfg.v
   wire [8:0]		ecfg_rx_datain;		// From erx of erx.v
   wire [15:0]		ecfg_rx_debug;		// From erx of erx.v
   wire			ecfg_rx_enable;		// From ecfg of ecfg.v
   wire			ecfg_rx_gpio_enable;	// From ecfg of ecfg.v
   wire			ecfg_rx_mmu_enable;	// From ecfg of ecfg.v
   wire			ecfg_timeout_enable;	// From ecfg of ecfg.v
   wire [3:0]		ecfg_tx_ctrlmode;	// From ecfg of ecfg.v
   wire [1:0]		ecfg_tx_datain;		// From etx of etx.v
   wire [15:0]		ecfg_tx_debug;		// From etx of etx.v
   wire			ecfg_tx_enable;		// From ecfg of ecfg.v
   wire			ecfg_tx_gpio_enable;	// From ecfg of ecfg.v
   wire			ecfg_tx_mmu_enable;	// From ecfg of ecfg.v
   wire			emaxi_emrq_access;	// From erx of erx.v
   wire [3:0]		emaxi_emrq_ctrlmode;	// From erx of erx.v
   wire [31:0]		emaxi_emrq_data;	// From erx of erx.v
   wire [1:0]		emaxi_emrq_datamode;	// From erx of erx.v
   wire [31:0]		emaxi_emrq_dstaddr;	// From erx of erx.v
   wire			emaxi_emrq_rd_en;	// From emaxi of emaxi.v
   wire [31:0]		emaxi_emrq_srcaddr;	// From erx of erx.v
   wire			emaxi_emrq_write;	// From erx of erx.v
   wire			emaxi_emrr_access;	// From emaxi of emaxi.v
   wire [3:0]		emaxi_emrr_ctrlmode;	// From emaxi of emaxi.v
   wire [31:0]		emaxi_emrr_data;	// From emaxi of emaxi.v
   wire [1:0]		emaxi_emrr_datamode;	// From emaxi of emaxi.v
   wire [31:0]		emaxi_emrr_dstaddr;	// From emaxi of emaxi.v
   wire			emaxi_emrr_progfull;	// From etx of etx.v
   wire [31:0]		emaxi_emrr_srcaddr;	// From emaxi of emaxi.v
   wire			emaxi_emrr_write;	// From emaxi of emaxi.v
   wire			emaxi_emwr_access;	// From erx of erx.v
   wire [3:0]		emaxi_emwr_ctrlmode;	// From erx of erx.v
   wire [31:0]		emaxi_emwr_data;	// From erx of erx.v
   wire [1:0]		emaxi_emwr_datamode;	// From erx of erx.v
   wire [31:0]		emaxi_emwr_dstaddr;	// From erx of erx.v
   wire			emaxi_emwr_rd_en;	// From emaxi of emaxi.v
   wire [31:0]		emaxi_emwr_srcaddr;	// From erx of erx.v
   wire			emaxi_emwr_write;	// From erx of erx.v
   wire			esaxi_emrq_access;	// From esaxi of esaxi.v
   wire [3:0]		esaxi_emrq_ctrlmode;	// From esaxi of esaxi.v
   wire [31:0]		esaxi_emrq_data;	// From esaxi of esaxi.v
   wire [1:0]		esaxi_emrq_datamode;	// From esaxi of esaxi.v
   wire [31:0]		esaxi_emrq_dstaddr;	// From esaxi of esaxi.v
   wire			esaxi_emrq_progfull;	// From etx of etx.v
   wire [31:0]		esaxi_emrq_srcaddr;	// From esaxi of esaxi.v
   wire			esaxi_emrq_write;	// From esaxi of esaxi.v
   wire			esaxi_emrr_access;	// From erx of erx.v
   wire [31:0]		esaxi_emrr_data;	// From erx of erx.v
   wire			esaxi_emrr_rd_en;	// From esaxi of esaxi.v
   wire			esaxi_emwr_access;	// From esaxi of esaxi.v
   wire [3:0]		esaxi_emwr_ctrlmode;	// From esaxi of esaxi.v
   wire [31:0]		esaxi_emwr_data;	// From esaxi of esaxi.v
   wire [1:0]		esaxi_emwr_datamode;	// From esaxi of esaxi.v
   wire [31:0]		esaxi_emwr_dstaddr;	// From esaxi of esaxi.v
   wire			esaxi_emwr_progfull;	// From etx of etx.v
   wire [31:0]		esaxi_emwr_srcaddr;	// From esaxi of esaxi.v
   wire			esaxi_emwr_write;	// From esaxi of esaxi.v
   wire [19:0]		mi_addr;		// From esaxi of esaxi.v
   wire			mi_clk;			// From esaxi of esaxi.v
   wire [31:0]		mi_din;			// From esaxi of esaxi.v
   wire [31:0]		mi_ecfg_dout;		// From ecfg of ecfg.v
   wire			mi_ecfg_sel;		// From esaxi of esaxi.v
   wire [DW-1:0]	mi_embox_dout;		// From embox of embox.v
   wire			mi_embox_sel;		// From esaxi of esaxi.v
   wire [31:0]		mi_rx_emmu_dout;	// From erx of erx.v
   wire			mi_rx_emmu_sel;		// From esaxi of esaxi.v
   wire [31:0]		mi_tx_emmu_dout;	// From etx of etx.v
   wire			mi_tx_emmu_sel;		// From esaxi of esaxi.v
   wire			mi_we;			// From esaxi of esaxi.v
   wire			reset;			// From ereset of ereset.v
   wire			soft_reset;		// From ecfg of ecfg.v
   wire			tx_lclk;		// From eclocks of eclocks.v
   wire			tx_lclk_out;		// From eclocks of eclocks.v
   wire			tx_lclk_par;		// From eclocks of eclocks.v
   // End of automatics
   /*AXI MASTER                                               */
  /*emaxi AUTO_TEMPLATE (
                        // Outputs
	                .m00_\(.*\)       (m_\1[]),
                        .em\(.*\)         (emaxi_em\1[]),
                        );
   */
   defparam emaxi.IDW    =IDW;     //ID width from instantiation
   emaxi emaxi(
	       /*AUTOINST*/
	       // Outputs
	       .emwr_rd_en		(emaxi_emwr_rd_en),	 // Templated
	       .emrq_rd_en		(emaxi_emrq_rd_en),	 // Templated
	       .emrr_access		(emaxi_emrr_access),	 // Templated
	       .emrr_write		(emaxi_emrr_write),	 // Templated
	       .emrr_datamode		(emaxi_emrr_datamode[1:0]), // Templated
	       .emrr_ctrlmode		(emaxi_emrr_ctrlmode[3:0]), // Templated
	       .emrr_dstaddr		(emaxi_emrr_dstaddr[31:0]), // Templated
	       .emrr_data		(emaxi_emrr_data[31:0]), // Templated
	       .emrr_srcaddr		(emaxi_emrr_srcaddr[31:0]), // Templated
	       .m_axi_awid		(m_axi_awid[IDW-1:0]),
	       .m_axi_awaddr		(m_axi_awaddr[31:0]),
	       .m_axi_awlen		(m_axi_awlen[7:0]),
	       .m_axi_awsize		(m_axi_awsize[2:0]),
	       .m_axi_awburst		(m_axi_awburst[1:0]),
	       .m_axi_awlock		(m_axi_awlock[1:0]),
	       .m_axi_awcache		(m_axi_awcache[3:0]),
	       .m_axi_awprot		(m_axi_awprot[2:0]),
	       .m_axi_awqos		(m_axi_awqos[3:0]),
	       .m_axi_awvalid		(m_axi_awvalid),
	       .m_axi_wid		(m_axi_wid[IDW-1:0]),
	       .m_axi_wdata		(m_axi_wdata[63:0]),
	       .m_axi_wstrb		(m_axi_wstrb[7:0]),
	       .m_axi_wlast		(m_axi_wlast),
	       .m_axi_wvalid		(m_axi_wvalid),
	       .m_axi_bready		(m_axi_bready),
	       .m_axi_arid		(m_axi_arid[IDW-1:0]),
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
	       .emwr_access		(emaxi_emwr_access),	 // Templated
	       .emwr_write		(emaxi_emwr_write),	 // Templated
	       .emwr_datamode		(emaxi_emwr_datamode[1:0]), // Templated
	       .emwr_ctrlmode		(emaxi_emwr_ctrlmode[3:0]), // Templated
	       .emwr_dstaddr		(emaxi_emwr_dstaddr[31:0]), // Templated
	       .emwr_data		(emaxi_emwr_data[31:0]), // Templated
	       .emwr_srcaddr		(emaxi_emwr_srcaddr[31:0]), // Templated
	       .emrq_access		(emaxi_emrq_access),	 // Templated
	       .emrq_write		(emaxi_emrq_write),	 // Templated
	       .emrq_datamode		(emaxi_emrq_datamode[1:0]), // Templated
	       .emrq_ctrlmode		(emaxi_emrq_ctrlmode[3:0]), // Templated
	       .emrq_dstaddr		(emaxi_emrq_dstaddr[31:0]), // Templated
	       .emrq_data		(emaxi_emrq_data[31:0]), // Templated
	       .emrq_srcaddr		(emaxi_emrq_srcaddr[31:0]), // Templated
	       .emrr_progfull		(emaxi_emrr_progfull),	 // Templated
	       .m_axi_aclk		(m_axi_aclk),
	       .m_axi_aresetn		(m_axi_aresetn),
	       .m_axi_awready		(m_axi_awready),
	       .m_axi_wready		(m_axi_wready),
	       .m_axi_bid		(m_axi_bid[IDW-1:0]),
	       .m_axi_bresp		(m_axi_bresp[1:0]),
	       .m_axi_bvalid		(m_axi_bvalid),
	       .m_axi_arready		(m_axi_arready),
	       .m_axi_rid		(m_axi_rid[IDW-1:0]),
	       .m_axi_rdata		(m_axi_rdata[63:0]),
	       .m_axi_rresp		(m_axi_rresp[1:0]),
	       .m_axi_rlast		(m_axi_rlast),
	       .m_axi_rvalid		(m_axi_rvalid));
   /*AXI SLAVE                                                */
   /*esaxi AUTO_TEMPLATE (
                        // Outputs
	                .s00_\(.*\)       (s_\1[]),
                        .emwr_\(.*\)      (esaxi_emwr_\1[]),
                        .emrq_\(.*\)      (esaxi_emrq_\1[]),
                        .emrr_\(.*\)      (esaxi_emrr_\1[]),
                        );
   */
   defparam esaxi.ELINKID=ELINKID; //passing along ID from top level
   defparam esaxi.IDW    =IDW;     //ID width from instantiation
   esaxi esaxi(
	       /*AUTOINST*/
	       // Outputs
	       .emwr_access		(esaxi_emwr_access),	 // Templated
	       .emwr_write		(esaxi_emwr_write),	 // Templated
	       .emwr_datamode		(esaxi_emwr_datamode[1:0]), // Templated
	       .emwr_ctrlmode		(esaxi_emwr_ctrlmode[3:0]), // Templated
	       .emwr_dstaddr		(esaxi_emwr_dstaddr[31:0]), // Templated
	       .emwr_data		(esaxi_emwr_data[31:0]), // Templated
	       .emwr_srcaddr		(esaxi_emwr_srcaddr[31:0]), // Templated
	       .emrq_access		(esaxi_emrq_access),	 // Templated
	       .emrq_write		(esaxi_emrq_write),	 // Templated
	       .emrq_datamode		(esaxi_emrq_datamode[1:0]), // Templated
	       .emrq_ctrlmode		(esaxi_emrq_ctrlmode[3:0]), // Templated
	       .emrq_dstaddr		(esaxi_emrq_dstaddr[31:0]), // Templated
	       .emrq_data		(esaxi_emrq_data[31:0]), // Templated
	       .emrq_srcaddr		(esaxi_emrq_srcaddr[31:0]), // Templated
	       .emrr_rd_en		(esaxi_emrr_rd_en),	 // Templated
	       .mi_clk			(mi_clk),
	       .mi_rx_emmu_sel		(mi_rx_emmu_sel),
	       .mi_tx_emmu_sel		(mi_tx_emmu_sel),
	       .mi_ecfg_sel		(mi_ecfg_sel),
	       .mi_embox_sel		(mi_embox_sel),
	       .mi_we			(mi_we),
	       .mi_addr			(mi_addr[19:0]),
	       .mi_din			(mi_din[31:0]),
	       .s_axi_arready		(s_axi_arready),
	       .s_axi_awready		(s_axi_awready),
	       .s_axi_bid		(s_axi_bid[IDW-1:0]),
	       .s_axi_bresp		(s_axi_bresp[1:0]),
	       .s_axi_bvalid		(s_axi_bvalid),
	       .s_axi_rid		(s_axi_rid[IDW-1:0]),
	       .s_axi_rdata		(s_axi_rdata[31:0]),
	       .s_axi_rlast		(s_axi_rlast),
	       .s_axi_rresp		(s_axi_rresp[1:0]),
	       .s_axi_rvalid		(s_axi_rvalid),
	       .s_axi_wready		(s_axi_wready),
	       // Inputs
	       .emwr_progfull		(esaxi_emwr_progfull),	 // Templated
	       .emrq_progfull		(esaxi_emrq_progfull),	 // Templated
	       .emrr_data		(esaxi_emrr_data[31:0]), // Templated
	       .emrr_access		(esaxi_emrr_access),	 // Templated
	       .mi_ecfg_dout		(mi_ecfg_dout[31:0]),
	       .mi_tx_emmu_dout		(mi_tx_emmu_dout[31:0]),
	       .mi_rx_emmu_dout		(mi_rx_emmu_dout[31:0]),
	       .mi_embox_dout		(mi_embox_dout[31:0]),
	       .ecfg_tx_ctrlmode	(ecfg_tx_ctrlmode[3:0]),
	       .ecfg_coreid		(ecfg_coreid[11:0]),
	       .ecfg_timeout_enable	(ecfg_timeout_enable),
	       .s_axi_aclk		(s_axi_aclk),
	       .s_axi_aresetn		(s_axi_aresetn),
	       .s_axi_arid		(s_axi_arid[IDW-1:0]),
	       .s_axi_araddr		(s_axi_araddr[31:0]),
	       .s_axi_arburst		(s_axi_arburst[1:0]),
	       .s_axi_arcache		(s_axi_arcache[3:0]),
	       .s_axi_arlock		(s_axi_arlock[1:0]),
	       .s_axi_arlen		(s_axi_arlen[7:0]),
	       .s_axi_arprot		(s_axi_arprot[2:0]),
	       .s_axi_arqos		(s_axi_arqos[3:0]),
	       .s_axi_arsize		(s_axi_arsize[2:0]),
	       .s_axi_arvalid		(s_axi_arvalid),
	       .s_axi_awid		(s_axi_awid[IDW-1:0]),
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
	       .s_axi_wid		(s_axi_wid[IDW-1:0]),
	       .s_axi_wdata		(s_axi_wdata[31:0]),
	       .s_axi_wlast		(s_axi_wlast),
	       .s_axi_wstrb		(s_axi_wstrb[3:0]),
	       .s_axi_wvalid		(s_axi_wvalid));
   /*RECEIVER                                                 */
   /*erx AUTO_TEMPLATE (
	                .mi_dout      (mi_rx_emmu_dout[]),
                        .mi_en        (mi_rx_emmu_sel),
                        .emwr_\(.*\)  (emaxi_emwr_\1[]),
                        .emrq_\(.*\)  (emaxi_emrq_\1[]),
                        .emrr_\(.*\)  (esaxi_emrr_\1[]),
                        );
   */
   erx erx(
	   /*AUTOINST*/
	   // Outputs
	   .ecfg_rx_debug		(ecfg_rx_debug[15:0]),
	   .ecfg_rx_datain		(ecfg_rx_datain[8:0]),
	   .mi_dout			(mi_rx_emmu_dout[31:0]), // Templated
	   .emwr_access			(emaxi_emwr_access),	 // Templated
	   .emwr_write			(emaxi_emwr_write),	 // Templated
	   .emwr_datamode		(emaxi_emwr_datamode[1:0]), // Templated
	   .emwr_ctrlmode		(emaxi_emwr_ctrlmode[3:0]), // Templated
	   .emwr_dstaddr		(emaxi_emwr_dstaddr[31:0]), // Templated
	   .emwr_data			(emaxi_emwr_data[31:0]), // Templated
	   .emwr_srcaddr		(emaxi_emwr_srcaddr[31:0]), // Templated
	   .emrq_access			(emaxi_emrq_access),	 // Templated
	   .emrq_write			(emaxi_emrq_write),	 // Templated
	   .emrq_datamode		(emaxi_emrq_datamode[1:0]), // Templated
	   .emrq_ctrlmode		(emaxi_emrq_ctrlmode[3:0]), // Templated
	   .emrq_dstaddr		(emaxi_emrq_dstaddr[31:0]), // Templated
	   .emrq_data			(emaxi_emrq_data[31:0]), // Templated
	   .emrq_srcaddr		(emaxi_emrq_srcaddr[31:0]), // Templated
	   .emrr_access			(esaxi_emrr_access),	 // Templated
	   .emrr_data			(esaxi_emrr_data[31:0]), // Templated
	   .rxo_wr_wait_p		(rxo_wr_wait_p),
	   .rxo_wr_wait_n		(rxo_wr_wait_n),
	   .rxo_rd_wait_p		(rxo_rd_wait_p),
	   .rxo_rd_wait_n		(rxo_rd_wait_n),
	   // Inputs
	   .reset			(reset),
	   .s_axi_aclk			(s_axi_aclk),
	   .m_axi_aclk			(m_axi_aclk),
	   .ecfg_rx_enable		(ecfg_rx_enable),
	   .ecfg_rx_mmu_enable		(ecfg_rx_mmu_enable),
	   .ecfg_rx_gpio_enable		(ecfg_rx_gpio_enable),
	   .ecfg_dataout		(ecfg_dataout[1:0]),
	   .mi_clk			(mi_clk),
	   .mi_en			(mi_rx_emmu_sel),	 // Templated
	   .mi_we			(mi_we),
	   .mi_addr			(mi_addr[15:0]),
	   .mi_din			(mi_din[31:0]),
	   .emwr_rd_en			(emaxi_emwr_rd_en),	 // Templated
	   .emrq_rd_en			(emaxi_emrq_rd_en),	 // Templated
	   .emrr_rd_en			(esaxi_emrr_rd_en),	 // Templated
	   .rxi_lclk_p			(rxi_lclk_p),
	   .rxi_lclk_n			(rxi_lclk_n),
	   .rxi_frame_p			(rxi_frame_p),
	   .rxi_frame_n			(rxi_frame_n),
	   .rxi_data_p			(rxi_data_p[7:0]),
	   .rxi_data_n			(rxi_data_n[7:0]));
   /*TRANSMITTER                                              */
   /*etx AUTO_TEMPLATE (
	                .mi_dout      (mi_tx_emmu_dout[]),
                        .mi_en        (mi_tx_emmu_sel),
                        .emwr_\(.*\)  (esaxi_emwr_\1[]),
                        .emrq_\(.*\)  (esaxi_emrq_\1[]),
                        .emrr_\(.*\)  (emaxi_emrr_\1[]),
                       );
   */
   etx etx(
	   /*AUTOINST*/
	   // Outputs
	   .ecfg_tx_datain		(ecfg_tx_datain[1:0]),
	   .ecfg_tx_debug		(ecfg_tx_debug[15:0]),
	   .emrq_progfull		(esaxi_emrq_progfull),	 // Templated
	   .emwr_progfull		(esaxi_emwr_progfull),	 // Templated
	   .emrr_progfull		(emaxi_emrr_progfull),	 // Templated
	   .txo_lclk_p			(txo_lclk_p),
	   .txo_lclk_n			(txo_lclk_n),
	   .txo_frame_p			(txo_frame_p),
	   .txo_frame_n			(txo_frame_n),
	   .txo_data_p			(txo_data_p[7:0]),
	   .txo_data_n			(txo_data_n[7:0]),
	   .mi_dout			(mi_tx_emmu_dout[31:0]), // Templated
	   // Inputs
	   .reset			(reset),
	   .tx_lclk			(tx_lclk),
	   .tx_lclk_out			(tx_lclk_out),
	   .tx_lclk_par			(tx_lclk_par),
	   .s_axi_aclk			(s_axi_aclk),
	   .m_axi_aclk			(m_axi_aclk),
	   .ecfg_tx_enable		(ecfg_tx_enable),
	   .ecfg_tx_gpio_enable		(ecfg_tx_gpio_enable),
	   .ecfg_tx_mmu_enable		(ecfg_tx_mmu_enable),
	   .ecfg_dataout		(ecfg_dataout[8:0]),
	   .emrq_access			(esaxi_emrq_access),	 // Templated
	   .emrq_write			(esaxi_emrq_write),	 // Templated
	   .emrq_datamode		(esaxi_emrq_datamode[1:0]), // Templated
	   .emrq_ctrlmode		(esaxi_emrq_ctrlmode[3:0]), // Templated
	   .emrq_dstaddr		(esaxi_emrq_dstaddr[31:0]), // Templated
	   .emrq_data			(esaxi_emrq_data[31:0]), // Templated
	   .emrq_srcaddr		(esaxi_emrq_srcaddr[31:0]), // Templated
	   .emwr_access			(esaxi_emwr_access),	 // Templated
	   .emwr_write			(esaxi_emwr_write),	 // Templated
	   .emwr_datamode		(esaxi_emwr_datamode[1:0]), // Templated
	   .emwr_ctrlmode		(esaxi_emwr_ctrlmode[3:0]), // Templated
	   .emwr_dstaddr		(esaxi_emwr_dstaddr[31:0]), // Templated
	   .emwr_data			(esaxi_emwr_data[31:0]), // Templated
	   .emwr_srcaddr		(esaxi_emwr_srcaddr[31:0]), // Templated
	   .emrr_access			(emaxi_emrr_access),	 // Templated
	   .emrr_write			(emaxi_emrr_write),	 // Templated
	   .emrr_datamode		(emaxi_emrr_datamode[1:0]), // Templated
	   .emrr_ctrlmode		(emaxi_emrr_ctrlmode[3:0]), // Templated
	   .emrr_dstaddr		(emaxi_emrr_dstaddr[31:0]), // Templated
	   .emrr_data			(emaxi_emrr_data[31:0]), // Templated
	   .emrr_srcaddr		(emaxi_emrr_srcaddr[31:0]), // Templated
	   .txi_wr_wait_p		(txi_wr_wait_p),
	   .txi_wr_wait_n		(txi_wr_wait_n),
	   .txi_rd_wait_p		(txi_rd_wait_p),
	   .txi_rd_wait_n		(txi_rd_wait_n),
	   .mi_clk			(mi_clk),
	   .mi_en			(mi_tx_emmu_sel),	 // Templated
	   .mi_we			(mi_we),
	   .mi_addr			(mi_addr[15:0]),
	   .mi_din			(mi_din[31:0]));
   /*ELINK CONFIGURATION REGISTERES                           */
   /*ecfg AUTO_TEMPLATE (
	                .mi_dout    (mi_ecfg_dout[]),
                        .mi_en      (mi_ecfg_sel),
                        .ecfg_reset (reset),
                        .clk        (mi_clk),
                      );
   */
   ecfg ecfg(
	     /*AUTOINST*/
	     // Outputs
	     .soft_reset		(soft_reset),
	     .mi_dout			(mi_ecfg_dout[31:0]),	 // Templated
	     .ecfg_tx_enable		(ecfg_tx_enable),
	     .ecfg_tx_mmu_enable	(ecfg_tx_mmu_enable),
	     .ecfg_tx_gpio_enable	(ecfg_tx_gpio_enable),
	     .ecfg_tx_ctrlmode		(ecfg_tx_ctrlmode[3:0]),
	     .ecfg_timeout_enable	(ecfg_timeout_enable),
	     .ecfg_rx_enable		(ecfg_rx_enable),
	     .ecfg_rx_mmu_enable	(ecfg_rx_mmu_enable),
	     .ecfg_rx_gpio_enable	(ecfg_rx_gpio_enable),
	     .ecfg_clk_settings		(ecfg_clk_settings[15:0]),
	     .ecfg_coreid		(ecfg_coreid[11:0]),
	     .ecfg_dataout		(ecfg_dataout[10:0]),
	     // Inputs
	     .hard_reset		(hard_reset),
	     .mi_clk			(mi_clk),
	     .mi_en			(mi_ecfg_sel),		 // Templated
	     .mi_we			(mi_we),
	     .mi_addr			(mi_addr[19:0]),
	     .mi_din			(mi_din[31:0]),
	     .ecfg_rx_datain		(ecfg_rx_datain[8:0]),
	     .ecfg_tx_datain		(ecfg_tx_datain[1:0]),
	     .embox_not_empty		(embox_not_empty),
	     .embox_full		(embox_full),
	     .ecfg_tx_debug		(ecfg_tx_debug[15:0]),
	     .ecfg_rx_debug		(ecfg_rx_debug[15:0]));
   /*GENERAL PURPOSE MAILBOX                                  */
   /*embox AUTO_TEMPLATE (
	                .mi_dout    (mi_embox_dout[]),
                        .mi_en      (mi_embox_sel),
                      );
   */
   embox embox(.clk			(s_axi_aclk),
	       /*AUTOINST*/
	       // Outputs
	       .mi_dout			(mi_embox_dout[DW-1:0]), // Templated
	       .embox_full		(embox_full),
	       .embox_not_empty		(embox_not_empty),
	       // Inputs
	       .reset			(reset),
	       .mi_en			(mi_embox_sel),		 // Templated
	       .mi_we			(mi_we),
	       .mi_addr			(mi_addr[19:0]),
	       .mi_din			(mi_din[DW-1:0]));
   /*RESET CIRCUITRY                                          */
   ereset ereset (/*AUTOINST*/
		  // Outputs
		  .reset		(reset),
		  .chip_resetb		(chip_resetb),
		  // Inputs
		  .hard_reset		(hard_reset),
		  .soft_reset		(soft_reset));
   /*CLOCKS                                                   */
   eclocks eclocks (
		    /*AUTOINST*/
		    // Outputs
		    .cclk_p		(cclk_p),
		    .cclk_n		(cclk_n),
		    .tx_lclk		(tx_lclk),
		    .tx_lclk_out	(tx_lclk_out),
		    .tx_lclk_par	(tx_lclk_par),
		    // Inputs
		    .clkin		(clkin),
		    .hard_reset		(hard_reset),
		    .ecfg_clk_settings	(ecfg_clk_settings[15:0]),
		    .clkbypass		(clkbypass[2:0]));
endmodule