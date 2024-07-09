module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					s2f_width_check ( .error(1'b1) );
		end
	endgenerate
	system_acl_iface_hps_fpga_interfaces fpga_interfaces (
		.h2f_rst_n                (h2f_rst_n),                //         h2f_reset.reset_n
		.h2f_lw_axi_clk           (h2f_lw_axi_clk),           //  h2f_lw_axi_clock.clk
		.h2f_lw_AWID              (h2f_lw_AWID),              // h2f_lw_axi_master.awid
		.h2f_lw_AWADDR            (h2f_lw_AWADDR),            //                  .awaddr
		.h2f_lw_AWLEN             (h2f_lw_AWLEN),             //                  .awlen
		.h2f_lw_AWSIZE            (h2f_lw_AWSIZE),            //                  .awsize
		.h2f_lw_AWBURST           (h2f_lw_AWBURST),           //                  .awburst
		.h2f_lw_AWLOCK            (h2f_lw_AWLOCK),            //                  .awlock
		.h2f_lw_AWCACHE           (h2f_lw_AWCACHE),           //                  .awcache
		.h2f_lw_AWPROT            (h2f_lw_AWPROT),            //                  .awprot
		.h2f_lw_AWVALID           (h2f_lw_AWVALID),           //                  .awvalid
		.h2f_lw_AWREADY           (h2f_lw_AWREADY),           //                  .awready
		.h2f_lw_WID               (h2f_lw_WID),               //                  .wid
		.h2f_lw_WDATA             (h2f_lw_WDATA),             //                  .wdata
		.h2f_lw_WSTRB             (h2f_lw_WSTRB),             //                  .wstrb
		.h2f_lw_WLAST             (h2f_lw_WLAST),             //                  .wlast
		.h2f_lw_WVALID            (h2f_lw_WVALID),            //                  .wvalid
		.h2f_lw_WREADY            (h2f_lw_WREADY),            //                  .wready
		.h2f_lw_BID               (h2f_lw_BID),               //                  .bid
		.h2f_lw_BRESP             (h2f_lw_BRESP),             //                  .bresp
		.h2f_lw_BVALID            (h2f_lw_BVALID),            //                  .bvalid
		.h2f_lw_BREADY            (h2f_lw_BREADY),            //                  .bready
		.h2f_lw_ARID              (h2f_lw_ARID),              //                  .arid
		.h2f_lw_ARADDR            (h2f_lw_ARADDR),            //                  .araddr
		.h2f_lw_ARLEN             (h2f_lw_ARLEN),             //                  .arlen
		.h2f_lw_ARSIZE            (h2f_lw_ARSIZE),            //                  .arsize
		.h2f_lw_ARBURST           (h2f_lw_ARBURST),           //                  .arburst
		.h2f_lw_ARLOCK            (h2f_lw_ARLOCK),            //                  .arlock
		.h2f_lw_ARCACHE           (h2f_lw_ARCACHE),           //                  .arcache
		.h2f_lw_ARPROT            (h2f_lw_ARPROT),            //                  .arprot
		.h2f_lw_ARVALID           (h2f_lw_ARVALID),           //                  .arvalid
		.h2f_lw_ARREADY           (h2f_lw_ARREADY),           //                  .arready
		.h2f_lw_RID               (h2f_lw_RID),               //                  .rid
		.h2f_lw_RDATA             (h2f_lw_RDATA),             //                  .rdata
		.h2f_lw_RRESP             (h2f_lw_RRESP),             //                  .rresp
		.h2f_lw_RLAST             (h2f_lw_RLAST),             //                  .rlast
		.h2f_lw_RVALID            (h2f_lw_RVALID),            //                  .rvalid
		.h2f_lw_RREADY            (h2f_lw_RREADY),            //                  .rready
		.f2h_sdram0_ADDRESS       (f2h_sdram0_ADDRESS),       //   f2h_sdram0_data.address
		.f2h_sdram0_BURSTCOUNT    (f2h_sdram0_BURSTCOUNT),    //                  .burstcount
		.f2h_sdram0_WAITREQUEST   (f2h_sdram0_WAITREQUEST),   //                  .waitrequest
		.f2h_sdram0_READDATA      (f2h_sdram0_READDATA),      //                  .readdata
		.f2h_sdram0_READDATAVALID (f2h_sdram0_READDATAVALID), //                  .readdatavalid
		.f2h_sdram0_READ          (f2h_sdram0_READ),          //                  .read
		.f2h_sdram0_WRITEDATA     (f2h_sdram0_WRITEDATA),     //                  .writedata
		.f2h_sdram0_BYTEENABLE    (f2h_sdram0_BYTEENABLE),    //                  .byteenable
		.f2h_sdram0_WRITE         (f2h_sdram0_WRITE),         //                  .write
		.f2h_sdram0_clk           (f2h_sdram0_clk),           //  f2h_sdram0_clock.clk
		.f2h_irq_p0               (f2h_irq_p0),               //          f2h_irq0.irq
		.f2h_irq_p1               (f2h_irq_p1)                //          f2h_irq1.irq
	);
	system_acl_iface_hps_hps_io hps_io (
		.mem_a                    (mem_a),                    // memory.mem_a
		.mem_ba                   (mem_ba),                   //       .mem_ba
		.mem_ck                   (mem_ck),                   //       .mem_ck
		.mem_ck_n                 (mem_ck_n),                 //       .mem_ck_n
		.mem_cke                  (mem_cke),                  //       .mem_cke
		.mem_cs_n                 (mem_cs_n),                 //       .mem_cs_n
		.mem_ras_n                (mem_ras_n),                //       .mem_ras_n
		.mem_cas_n                (mem_cas_n),                //       .mem_cas_n
		.mem_we_n                 (mem_we_n),                 //       .mem_we_n
		.mem_reset_n              (mem_reset_n),              //       .mem_reset_n
		.mem_dq                   (mem_dq),                   //       .mem_dq
		.mem_dqs                  (mem_dqs),                  //       .mem_dqs
		.mem_dqs_n                (mem_dqs_n),                //       .mem_dqs_n
		.mem_odt                  (mem_odt),                  //       .mem_odt
		.mem_dm                   (mem_dm),                   //       .mem_dm
		.oct_rzqin                (oct_rzqin),                //       .oct_rzqin
		.hps_io_emac1_inst_TX_CLK (hps_io_emac1_inst_TX_CLK), // hps_io.hps_io_emac1_inst_TX_CLK
		.hps_io_emac1_inst_TXD0   (hps_io_emac1_inst_TXD0),   //       .hps_io_emac1_inst_TXD0
		.hps_io_emac1_inst_TXD1   (hps_io_emac1_inst_TXD1),   //       .hps_io_emac1_inst_TXD1
		.hps_io_emac1_inst_TXD2   (hps_io_emac1_inst_TXD2),   //       .hps_io_emac1_inst_TXD2
		.hps_io_emac1_inst_TXD3   (hps_io_emac1_inst_TXD3),   //       .hps_io_emac1_inst_TXD3
		.hps_io_emac1_inst_RXD0   (hps_io_emac1_inst_RXD0),   //       .hps_io_emac1_inst_RXD0
		.hps_io_emac1_inst_MDIO   (hps_io_emac1_inst_MDIO),   //       .hps_io_emac1_inst_MDIO
		.hps_io_emac1_inst_MDC    (hps_io_emac1_inst_MDC),    //       .hps_io_emac1_inst_MDC
		.hps_io_emac1_inst_RX_CTL (hps_io_emac1_inst_RX_CTL), //       .hps_io_emac1_inst_RX_CTL
		.hps_io_emac1_inst_TX_CTL (hps_io_emac1_inst_TX_CTL), //       .hps_io_emac1_inst_TX_CTL
		.hps_io_emac1_inst_RX_CLK (hps_io_emac1_inst_RX_CLK), //       .hps_io_emac1_inst_RX_CLK
		.hps_io_emac1_inst_RXD1   (hps_io_emac1_inst_RXD1),   //       .hps_io_emac1_inst_RXD1
		.hps_io_emac1_inst_RXD2   (hps_io_emac1_inst_RXD2),   //       .hps_io_emac1_inst_RXD2
		.hps_io_emac1_inst_RXD3   (hps_io_emac1_inst_RXD3),   //       .hps_io_emac1_inst_RXD3
		.hps_io_sdio_inst_CMD     (hps_io_sdio_inst_CMD),     //       .hps_io_sdio_inst_CMD
		.hps_io_sdio_inst_D0      (hps_io_sdio_inst_D0),      //       .hps_io_sdio_inst_D0
		.hps_io_sdio_inst_D1      (hps_io_sdio_inst_D1),      //       .hps_io_sdio_inst_D1
		.hps_io_sdio_inst_CLK     (hps_io_sdio_inst_CLK),     //       .hps_io_sdio_inst_CLK
		.hps_io_sdio_inst_D2      (hps_io_sdio_inst_D2),      //       .hps_io_sdio_inst_D2
		.hps_io_sdio_inst_D3      (hps_io_sdio_inst_D3),      //       .hps_io_sdio_inst_D3
		.hps_io_uart0_inst_RX     (hps_io_uart0_inst_RX),     //       .hps_io_uart0_inst_RX
		.hps_io_uart0_inst_TX     (hps_io_uart0_inst_TX),     //       .hps_io_uart0_inst_TX
		.hps_io_i2c1_inst_SDA     (hps_io_i2c1_inst_SDA),     //       .hps_io_i2c1_inst_SDA
		.hps_io_i2c1_inst_SCL     (hps_io_i2c1_inst_SCL),     //       .hps_io_i2c1_inst_SCL
		.hps_io_gpio_inst_GPIO53  (hps_io_gpio_inst_GPIO53)   //       .hps_io_gpio_inst_GPIO53
	);
endmodule