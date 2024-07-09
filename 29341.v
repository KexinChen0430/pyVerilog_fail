module outputs)
   wire [3:0]		ecfg_cclk_div;		// From ecfg of ecfg.v
   wire [3:0]		ecfg_cclk_pllcfg;	// From ecfg of ecfg.v
   wire [11:0]		ecfg_coreid;		// From ecfg of ecfg.v
   wire [11:0]		ecfg_dataout;		// From ecfg of ecfg.v
   wire			ecfg_rx_enable;		// From ecfg of ecfg.v
   wire			ecfg_rx_gpio_mode;	// From ecfg of ecfg.v
   wire			ecfg_rx_loopback_mode;	// From ecfg of ecfg.v
   wire			ecfg_rx_mmu_mode;	// From ecfg of ecfg.v
   wire [3:0]		ecfg_tx_clkdiv;		// From ecfg of ecfg.v
   wire [3:0]		ecfg_tx_ctrl_mode;	// From ecfg of ecfg.v
   wire			ecfg_tx_enable;		// From ecfg of ecfg.v
   wire			ecfg_tx_gpio_mode;	// From ecfg of ecfg.v
   wire			ecfg_tx_mmu_mode;	// From ecfg of ecfg.v
   wire			mi_access;		// From axi_memif of axi_memif.v
   wire [MAW-1:0]	mi_addr;		// From axi_memif of axi_memif.v
   wire [MDW-1:0]	mi_data_in;		// From axi_memif of axi_memif.v
   wire [31:0]		mi_data_out;		// From ecfg of ecfg.v
   wire			mi_write;		// From axi_memif of axi_memif.v
   // End of automatics
   axi_memif axi_memif(/*AUTOINST*/
		       // Outputs
		       .s_axi_awready	(s_axi_awready),
		       .s_axi_wready	(s_axi_wready),
		       .s_axi_bresp	(s_axi_bresp[1:0]),
		       .s_axi_bvalid	(s_axi_bvalid),
		       .s_axi_arready	(s_axi_arready),
		       .s_axi_rdata	(s_axi_rdata[DW-1:0]),
		       .s_axi_rresp	(s_axi_rresp[1:0]),
		       .s_axi_rvalid	(s_axi_rvalid),
		       .mi_addr		(mi_addr[MAW-1:0]),
		       .mi_access	(mi_access),
		       .mi_write	(mi_write),
		       .mi_data_in	(mi_data_in[MDW-1:0]),
		       // Inputs
		       .s_axi_aclk	(s_axi_aclk),
		       .s_axi_aresetn	(s_axi_aresetn),
		       .s_axi_awaddr	(s_axi_awaddr[AW-1:0]),
		       .s_axi_awprot	(s_axi_awprot[2:0]),
		       .s_axi_awvalid	(s_axi_awvalid),
		       .s_axi_wdata	(s_axi_wdata[DW-1:0]),
		       .s_axi_wstrb	(s_axi_wstrb[SW-1:0]),
		       .s_axi_wvalid	(s_axi_wvalid),
		       .s_axi_bready	(s_axi_bready),
		       .s_axi_araddr	(s_axi_araddr[AW-1:0]),
		       .s_axi_arprot	(s_axi_arprot[2:0]),
		       .s_axi_arvalid	(s_axi_arvalid),
		       .s_axi_rready	(s_axi_rready),
		       .mi_data_out	(mi_data_out[MDW-1:0]));
   ecfg ecfg(
	     /*AUTOINST*/
	     // Outputs
	     .mi_data_out		(mi_data_out[31:0]),
	     .ecfg_tx_enable		(ecfg_tx_enable),
	     .ecfg_tx_mmu_mode		(ecfg_tx_mmu_mode),
	     .ecfg_tx_gpio_mode		(ecfg_tx_gpio_mode),
	     .ecfg_tx_ctrl_mode		(ecfg_tx_ctrl_mode[3:0]),
	     .ecfg_tx_clkdiv		(ecfg_tx_clkdiv[3:0]),
	     .ecfg_rx_enable		(ecfg_rx_enable),
	     .ecfg_rx_mmu_mode		(ecfg_rx_mmu_mode),
	     .ecfg_rx_gpio_mode		(ecfg_rx_gpio_mode),
	     .ecfg_rx_loopback_mode	(ecfg_rx_loopback_mode),
	     .ecfg_cclk_div		(ecfg_cclk_div[3:0]),
	     .ecfg_cclk_pllcfg		(ecfg_cclk_pllcfg[3:0]),
	     .ecfg_coreid		(ecfg_coreid[11:0]),
	     .ecfg_dataout		(ecfg_dataout[11:0]),
	     // Inputs
	     .param_coreid		(param_coreid[IDW-1:0]),
	     .clk			(clk),
	     .reset			(reset),
	     .mi_access			(mi_access),
	     .mi_write			(mi_write),
	     .mi_addr			(mi_addr[5:0]),
	     .mi_data_in		(mi_data_in[31:0]));
		       endmodule