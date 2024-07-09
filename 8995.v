module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					s2f_width_check ( .error(1'b1) );
		end
	endgenerate
	lab3_hps_0_fpga_interfaces fpga_interfaces (
		.h2f_rst_n      (h2f_rst_n),      //         h2f_reset.reset_n
		.f2h_axi_clk    (f2h_axi_clk),    //     f2h_axi_clock.clk
		.f2h_AWID       (f2h_AWID),       //     f2h_axi_slave.awid
		.f2h_AWADDR     (f2h_AWADDR),     //                  .awaddr
		.f2h_AWLEN      (f2h_AWLEN),      //                  .awlen
		.f2h_AWSIZE     (f2h_AWSIZE),     //                  .awsize
		.f2h_AWBURST    (f2h_AWBURST),    //                  .awburst
		.f2h_AWLOCK     (f2h_AWLOCK),     //                  .awlock
		.f2h_AWCACHE    (f2h_AWCACHE),    //                  .awcache
		.f2h_AWPROT     (f2h_AWPROT),     //                  .awprot
		.f2h_AWVALID    (f2h_AWVALID),    //                  .awvalid
		.f2h_AWREADY    (f2h_AWREADY),    //                  .awready
		.f2h_AWUSER     (f2h_AWUSER),     //                  .awuser
		.f2h_WID        (f2h_WID),        //                  .wid
		.f2h_WDATA      (f2h_WDATA),      //                  .wdata
		.f2h_WSTRB      (f2h_WSTRB),      //                  .wstrb
		.f2h_WLAST      (f2h_WLAST),      //                  .wlast
		.f2h_WVALID     (f2h_WVALID),     //                  .wvalid
		.f2h_WREADY     (f2h_WREADY),     //                  .wready
		.f2h_BID        (f2h_BID),        //                  .bid
		.f2h_BRESP      (f2h_BRESP),      //                  .bresp
		.f2h_BVALID     (f2h_BVALID),     //                  .bvalid
		.f2h_BREADY     (f2h_BREADY),     //                  .bready
		.f2h_ARID       (f2h_ARID),       //                  .arid
		.f2h_ARADDR     (f2h_ARADDR),     //                  .araddr
		.f2h_ARLEN      (f2h_ARLEN),      //                  .arlen
		.f2h_ARSIZE     (f2h_ARSIZE),     //                  .arsize
		.f2h_ARBURST    (f2h_ARBURST),    //                  .arburst
		.f2h_ARLOCK     (f2h_ARLOCK),     //                  .arlock
		.f2h_ARCACHE    (f2h_ARCACHE),    //                  .arcache
		.f2h_ARPROT     (f2h_ARPROT),     //                  .arprot
		.f2h_ARVALID    (f2h_ARVALID),    //                  .arvalid
		.f2h_ARREADY    (f2h_ARREADY),    //                  .arready
		.f2h_ARUSER     (f2h_ARUSER),     //                  .aruser
		.f2h_RID        (f2h_RID),        //                  .rid
		.f2h_RDATA      (f2h_RDATA),      //                  .rdata
		.f2h_RRESP      (f2h_RRESP),      //                  .rresp
		.f2h_RLAST      (f2h_RLAST),      //                  .rlast
		.f2h_RVALID     (f2h_RVALID),     //                  .rvalid
		.f2h_RREADY     (f2h_RREADY),     //                  .rready
		.h2f_lw_axi_clk (h2f_lw_axi_clk), //  h2f_lw_axi_clock.clk
		.h2f_lw_AWID    (h2f_lw_AWID),    // h2f_lw_axi_master.awid
		.h2f_lw_AWADDR  (h2f_lw_AWADDR),  //                  .awaddr
		.h2f_lw_AWLEN   (h2f_lw_AWLEN),   //                  .awlen
		.h2f_lw_AWSIZE  (h2f_lw_AWSIZE),  //                  .awsize
		.h2f_lw_AWBURST (h2f_lw_AWBURST), //                  .awburst
		.h2f_lw_AWLOCK  (h2f_lw_AWLOCK),  //                  .awlock
		.h2f_lw_AWCACHE (h2f_lw_AWCACHE), //                  .awcache
		.h2f_lw_AWPROT  (h2f_lw_AWPROT),  //                  .awprot
		.h2f_lw_AWVALID (h2f_lw_AWVALID), //                  .awvalid
		.h2f_lw_AWREADY (h2f_lw_AWREADY), //                  .awready
		.h2f_lw_WID     (h2f_lw_WID),     //                  .wid
		.h2f_lw_WDATA   (h2f_lw_WDATA),   //                  .wdata
		.h2f_lw_WSTRB   (h2f_lw_WSTRB),   //                  .wstrb
		.h2f_lw_WLAST   (h2f_lw_WLAST),   //                  .wlast
		.h2f_lw_WVALID  (h2f_lw_WVALID),  //                  .wvalid
		.h2f_lw_WREADY  (h2f_lw_WREADY),  //                  .wready
		.h2f_lw_BID     (h2f_lw_BID),     //                  .bid
		.h2f_lw_BRESP   (h2f_lw_BRESP),   //                  .bresp
		.h2f_lw_BVALID  (h2f_lw_BVALID),  //                  .bvalid
		.h2f_lw_BREADY  (h2f_lw_BREADY),  //                  .bready
		.h2f_lw_ARID    (h2f_lw_ARID),    //                  .arid
		.h2f_lw_ARADDR  (h2f_lw_ARADDR),  //                  .araddr
		.h2f_lw_ARLEN   (h2f_lw_ARLEN),   //                  .arlen
		.h2f_lw_ARSIZE  (h2f_lw_ARSIZE),  //                  .arsize
		.h2f_lw_ARBURST (h2f_lw_ARBURST), //                  .arburst
		.h2f_lw_ARLOCK  (h2f_lw_ARLOCK),  //                  .arlock
		.h2f_lw_ARCACHE (h2f_lw_ARCACHE), //                  .arcache
		.h2f_lw_ARPROT  (h2f_lw_ARPROT),  //                  .arprot
		.h2f_lw_ARVALID (h2f_lw_ARVALID), //                  .arvalid
		.h2f_lw_ARREADY (h2f_lw_ARREADY), //                  .arready
		.h2f_lw_RID     (h2f_lw_RID),     //                  .rid
		.h2f_lw_RDATA   (h2f_lw_RDATA),   //                  .rdata
		.h2f_lw_RRESP   (h2f_lw_RRESP),   //                  .rresp
		.h2f_lw_RLAST   (h2f_lw_RLAST),   //                  .rlast
		.h2f_lw_RVALID  (h2f_lw_RVALID),  //                  .rvalid
		.h2f_lw_RREADY  (h2f_lw_RREADY),  //                  .rready
		.h2f_axi_clk    (h2f_axi_clk),    //     h2f_axi_clock.clk
		.h2f_AWID       (h2f_AWID),       //    h2f_axi_master.awid
		.h2f_AWADDR     (h2f_AWADDR),     //                  .awaddr
		.h2f_AWLEN      (h2f_AWLEN),      //                  .awlen
		.h2f_AWSIZE     (h2f_AWSIZE),     //                  .awsize
		.h2f_AWBURST    (h2f_AWBURST),    //                  .awburst
		.h2f_AWLOCK     (h2f_AWLOCK),     //                  .awlock
		.h2f_AWCACHE    (h2f_AWCACHE),    //                  .awcache
		.h2f_AWPROT     (h2f_AWPROT),     //                  .awprot
		.h2f_AWVALID    (h2f_AWVALID),    //                  .awvalid
		.h2f_AWREADY    (h2f_AWREADY),    //                  .awready
		.h2f_WID        (h2f_WID),        //                  .wid
		.h2f_WDATA      (h2f_WDATA),      //                  .wdata
		.h2f_WSTRB      (h2f_WSTRB),      //                  .wstrb
		.h2f_WLAST      (h2f_WLAST),      //                  .wlast
		.h2f_WVALID     (h2f_WVALID),     //                  .wvalid
		.h2f_WREADY     (h2f_WREADY),     //                  .wready
		.h2f_BID        (h2f_BID),        //                  .bid
		.h2f_BRESP      (h2f_BRESP),      //                  .bresp
		.h2f_BVALID     (h2f_BVALID),     //                  .bvalid
		.h2f_BREADY     (h2f_BREADY),     //                  .bready
		.h2f_ARID       (h2f_ARID),       //                  .arid
		.h2f_ARADDR     (h2f_ARADDR),     //                  .araddr
		.h2f_ARLEN      (h2f_ARLEN),      //                  .arlen
		.h2f_ARSIZE     (h2f_ARSIZE),     //                  .arsize
		.h2f_ARBURST    (h2f_ARBURST),    //                  .arburst
		.h2f_ARLOCK     (h2f_ARLOCK),     //                  .arlock
		.h2f_ARCACHE    (h2f_ARCACHE),    //                  .arcache
		.h2f_ARPROT     (h2f_ARPROT),     //                  .arprot
		.h2f_ARVALID    (h2f_ARVALID),    //                  .arvalid
		.h2f_ARREADY    (h2f_ARREADY),    //                  .arready
		.h2f_RID        (h2f_RID),        //                  .rid
		.h2f_RDATA      (h2f_RDATA),      //                  .rdata
		.h2f_RRESP      (h2f_RRESP),      //                  .rresp
		.h2f_RLAST      (h2f_RLAST),      //                  .rlast
		.h2f_RVALID     (h2f_RVALID),     //                  .rvalid
		.h2f_RREADY     (h2f_RREADY),     //                  .rready
		.f2h_irq_p0     (f2h_irq_p0),     //          f2h_irq0.irq
		.f2h_irq_p1     (f2h_irq_p1)      //          f2h_irq1.irq
	);
	lab3_hps_0_hps_io hps_io (
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
		.hps_io_qspi_inst_IO0     (hps_io_qspi_inst_IO0),     //       .hps_io_qspi_inst_IO0
		.hps_io_qspi_inst_IO1     (hps_io_qspi_inst_IO1),     //       .hps_io_qspi_inst_IO1
		.hps_io_qspi_inst_IO2     (hps_io_qspi_inst_IO2),     //       .hps_io_qspi_inst_IO2
		.hps_io_qspi_inst_IO3     (hps_io_qspi_inst_IO3),     //       .hps_io_qspi_inst_IO3
		.hps_io_qspi_inst_SS0     (hps_io_qspi_inst_SS0),     //       .hps_io_qspi_inst_SS0
		.hps_io_qspi_inst_CLK     (hps_io_qspi_inst_CLK),     //       .hps_io_qspi_inst_CLK
		.hps_io_sdio_inst_CMD     (hps_io_sdio_inst_CMD),     //       .hps_io_sdio_inst_CMD
		.hps_io_sdio_inst_D0      (hps_io_sdio_inst_D0),      //       .hps_io_sdio_inst_D0
		.hps_io_sdio_inst_D1      (hps_io_sdio_inst_D1),      //       .hps_io_sdio_inst_D1
		.hps_io_sdio_inst_CLK     (hps_io_sdio_inst_CLK),     //       .hps_io_sdio_inst_CLK
		.hps_io_sdio_inst_D2      (hps_io_sdio_inst_D2),      //       .hps_io_sdio_inst_D2
		.hps_io_sdio_inst_D3      (hps_io_sdio_inst_D3),      //       .hps_io_sdio_inst_D3
		.hps_io_usb1_inst_D0      (hps_io_usb1_inst_D0),      //       .hps_io_usb1_inst_D0
		.hps_io_usb1_inst_D1      (hps_io_usb1_inst_D1),      //       .hps_io_usb1_inst_D1
		.hps_io_usb1_inst_D2      (hps_io_usb1_inst_D2),      //       .hps_io_usb1_inst_D2
		.hps_io_usb1_inst_D3      (hps_io_usb1_inst_D3),      //       .hps_io_usb1_inst_D3
		.hps_io_usb1_inst_D4      (hps_io_usb1_inst_D4),      //       .hps_io_usb1_inst_D4
		.hps_io_usb1_inst_D5      (hps_io_usb1_inst_D5),      //       .hps_io_usb1_inst_D5
		.hps_io_usb1_inst_D6      (hps_io_usb1_inst_D6),      //       .hps_io_usb1_inst_D6
		.hps_io_usb1_inst_D7      (hps_io_usb1_inst_D7),      //       .hps_io_usb1_inst_D7
		.hps_io_usb1_inst_CLK     (hps_io_usb1_inst_CLK),     //       .hps_io_usb1_inst_CLK
		.hps_io_usb1_inst_STP     (hps_io_usb1_inst_STP),     //       .hps_io_usb1_inst_STP
		.hps_io_usb1_inst_DIR     (hps_io_usb1_inst_DIR),     //       .hps_io_usb1_inst_DIR
		.hps_io_usb1_inst_NXT     (hps_io_usb1_inst_NXT),     //       .hps_io_usb1_inst_NXT
		.hps_io_spim0_inst_CLK    (hps_io_spim0_inst_CLK),    //       .hps_io_spim0_inst_CLK
		.hps_io_spim0_inst_MOSI   (hps_io_spim0_inst_MOSI),   //       .hps_io_spim0_inst_MOSI
		.hps_io_spim0_inst_MISO   (hps_io_spim0_inst_MISO),   //       .hps_io_spim0_inst_MISO
		.hps_io_spim0_inst_SS0    (hps_io_spim0_inst_SS0),    //       .hps_io_spim0_inst_SS0
		.hps_io_spim1_inst_CLK    (hps_io_spim1_inst_CLK),    //       .hps_io_spim1_inst_CLK
		.hps_io_spim1_inst_MOSI   (hps_io_spim1_inst_MOSI),   //       .hps_io_spim1_inst_MOSI
		.hps_io_spim1_inst_MISO   (hps_io_spim1_inst_MISO),   //       .hps_io_spim1_inst_MISO
		.hps_io_spim1_inst_SS0    (hps_io_spim1_inst_SS0),    //       .hps_io_spim1_inst_SS0
		.hps_io_uart0_inst_RX     (hps_io_uart0_inst_RX),     //       .hps_io_uart0_inst_RX
		.hps_io_uart0_inst_TX     (hps_io_uart0_inst_TX),     //       .hps_io_uart0_inst_TX
		.hps_io_i2c1_inst_SDA     (hps_io_i2c1_inst_SDA),     //       .hps_io_i2c1_inst_SDA
		.hps_io_i2c1_inst_SCL     (hps_io_i2c1_inst_SCL)      //       .hps_io_i2c1_inst_SCL
	);
endmodule