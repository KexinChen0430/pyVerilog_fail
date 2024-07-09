module outputs)
   wire                 elink_access_inb;       // From ewrapper_link_top of ewrapper_link_top.v
   wire                 elink_access_outb;      // From axi_elink_if of axi_elink_if.v
   wire                 elink_cclk_enb;         // From axi_elink_if of axi_elink_if.v
   wire [1:0]           elink_clk_div;          // From axi_elink_if of axi_elink_if.v
   wire [3:0]           elink_ctrlmode_inb;     // From ewrapper_link_top of ewrapper_link_top.v
   wire [3:0]           elink_ctrlmode_outb;    // From axi_elink_if of axi_elink_if.v
   wire [31:0]          elink_data_inb;         // From ewrapper_link_top of ewrapper_link_top.v
   wire [31:0]          elink_data_outb;        // From axi_elink_if of axi_elink_if.v
   wire [1:0]           elink_datamode_inb;     // From ewrapper_link_top of ewrapper_link_top.v
   wire [1:0]           elink_datamode_outb;    // From axi_elink_if of axi_elink_if.v
   wire                 elink_disable;          // From axi_elink_if of axi_elink_if.v
   wire [31:0]          elink_dstaddr_outb;     // From axi_elink_if of axi_elink_if.v
   wire                 elink_rd_wait_inb;      // From ewrapper_link_top of ewrapper_link_top.v
   wire                 elink_rd_wait_outb;     // From axi_elink_if of axi_elink_if.v
   wire [31:0]          elink_srcaddr_inb;      // From ewrapper_link_top of ewrapper_link_top.v
   wire [31:0]          elink_srcaddr_outb;     // From axi_elink_if of axi_elink_if.v
   wire                 elink_wr_wait_inb;      // From ewrapper_link_top of ewrapper_link_top.v
   wire                 elink_wr_wait_outb;     // From axi_elink_if of axi_elink_if.v
   wire                 elink_write_inb;        // From ewrapper_link_top of ewrapper_link_top.v
   wire                 elink_write_outb;       // From axi_elink_if of axi_elink_if.v
   wire                 emaxi_access_inb;       // From axi_master of axi_master.v
   wire                 emaxi_access_outb;      // From axi_elink_if of axi_elink_if.v
   wire [3:0]           emaxi_ctrlmode_inb;     // From axi_master of axi_master.v
   wire [3:0]           emaxi_ctrlmode_outb;    // From axi_elink_if of axi_elink_if.v
   wire [31:0]          emaxi_data_inb;         // From axi_master of axi_master.v
   wire [31:0]          emaxi_data_outb;        // From axi_elink_if of axi_elink_if.v
   wire [1:0]           emaxi_datamode_inb;     // From axi_master of axi_master.v
   wire [1:0]           emaxi_datamode_outb;    // From axi_elink_if of axi_elink_if.v
   wire [31:0]          emaxi_dstaddr_inb;      // From axi_master of axi_master.v
   wire [31:0]          emaxi_dstaddr_outb;     // From axi_elink_if of axi_elink_if.v
   wire                 emaxi_rd_wait_inb;      // From axi_master of axi_master.v
   wire [31:0]          emaxi_srcaddr_inb;      // From axi_master of axi_master.v
   wire [31:0]          emaxi_srcaddr_outb;     // From axi_elink_if of axi_elink_if.v
   wire                 emaxi_wr_wait_inb;      // From axi_master of axi_master.v
   wire                 emaxi_wr_wait_outb;     // From axi_elink_if of axi_elink_if.v
   wire                 emaxi_write_inb;        // From axi_master of axi_master.v
   wire                 emaxi_write_outb;       // From axi_elink_if of axi_elink_if.v
   wire                 esaxi_access_inb;       // From axi_slave of axi_slave.v
   wire                 esaxi_access_outb;      // From axi_elink_if of axi_elink_if.v
   wire [3:0]           esaxi_ctrlmode_inb;     // From axi_slave of axi_slave.v
   wire [3:0]           esaxi_ctrlmode_outb;    // From axi_elink_if of axi_elink_if.v
   wire [31:0]          esaxi_data_inb;         // From axi_slave of axi_slave.v
   wire [31:0]          esaxi_data_outb;        // From axi_elink_if of axi_elink_if.v
   wire [1:0]           esaxi_datamode_inb;     // From axi_slave of axi_slave.v
   wire [1:0]           esaxi_datamode_outb;    // From axi_elink_if of axi_elink_if.v
   wire [31:0]          esaxi_dstaddr_inb;      // From axi_slave of axi_slave.v
   wire [31:0]          esaxi_dstaddr_outb;     // From axi_elink_if of axi_elink_if.v
   wire                 esaxi_rd_wait_inb;      // From axi_slave of axi_slave.v
   wire                 esaxi_rd_wait_outb;     // From axi_elink_if of axi_elink_if.v
   wire [31:0]          esaxi_srcaddr_inb;      // From axi_slave of axi_slave.v
   wire [31:0]          esaxi_srcaddr_outb;     // From axi_elink_if of axi_elink_if.v
   wire                 esaxi_wr_wait_inb;      // From axi_slave of axi_slave.v
   wire                 esaxi_wr_wait_outb;     // From axi_elink_if of axi_elink_if.v
   wire                 esaxi_write_inb;        // From axi_slave of axi_slave.v
   wire                 esaxi_write_outb;       // From axi_elink_if of axi_elink_if.v
   // End of automatics
   //#########
   //# Regs
   //#########
   //#########
   //# Wires
   //#########
   wire 	    emaxi_reset;
   wire 	    esaxi_reset;
   wire 	    rxi_eclk;
   wire [31:0] 	    elink_dstaddr_inb;
   wire [31:0] 	    elink_dstaddr_tmp;
   wire 	    ext_mem_access;
   //#################
   //# global signals
   //#################
   assign emaxi_reset = ~emaxi_aresetn;
   assign esaxi_reset = ~esaxi_aresetn;
   //##################################
   //# AXI Slave Port Instantiation
   //##################################
   /*axi_slave AUTO_TEMPLATE(.eclk         (rxi_eclk),
                             .reset        (esaxi_reset),
                             .aclk	   (esaxi_aclk),
                             .aw\(.*\)     (esaxi_aw\1[]),
                             .w\(.*\)      (esaxi_w\1[]),
                             .b\(.*\)      (esaxi_b\1[]),
                             .ar\(.*\)     (esaxi_ar\1[]),
                             .r\(.*\)      (esaxi_r\1[]),
                             .emesh_\(.*\) (esaxi_\1[]),
                            );
    */
   axi_slave axi_slave(/*AUTOINST*/
                       // Outputs
                       .csysack         (csysack),
                       .cactive         (cactive),
                       .awready         (esaxi_awready),         // Templated
                       .wready          (esaxi_wready),          // Templated
                       .bid             (esaxi_bid[SIDW-1:0]),   // Templated
                       .bresp           (esaxi_bresp[1:0]),      // Templated
                       .bvalid          (esaxi_bvalid),          // Templated
                       .arready         (esaxi_arready),         // Templated
                       .rid             (esaxi_rid[SIDW-1:0]),   // Templated
                       .rdata           (esaxi_rdata[SDW-1:0]),  // Templated
                       .rresp           (esaxi_rresp[1:0]),      // Templated
                       .rlast           (esaxi_rlast),           // Templated
                       .rvalid          (esaxi_rvalid),          // Templated
                       .emesh_access_inb(esaxi_access_inb),      // Templated
                       .emesh_write_inb (esaxi_write_inb),       // Templated
                       .emesh_datamode_inb(esaxi_datamode_inb[1:0]), // Templated
                       .emesh_ctrlmode_inb(esaxi_ctrlmode_inb[3:0]), // Templated
                       .emesh_dstaddr_inb(esaxi_dstaddr_inb[31:0]), // Templated
                       .emesh_srcaddr_inb(esaxi_srcaddr_inb[31:0]), // Templated
                       .emesh_data_inb  (esaxi_data_inb[31:0]),  // Templated
                       .emesh_wr_wait_inb(esaxi_wr_wait_inb),    // Templated
                       .emesh_rd_wait_inb(esaxi_rd_wait_inb),    // Templated
                       // Inputs
                       .aclk            (esaxi_aclk),            // Templated
                       .eclk            (rxi_eclk),              // Templated
                       .reset           (esaxi_reset),           // Templated
                       .csysreq         (csysreq),
                       .awid            (esaxi_awid[SIDW-1:0]),  // Templated
                       .awaddr          (esaxi_awaddr[SAW-1:0]), // Templated
                       .awlen           (esaxi_awlen[3:0]),      // Templated
                       .awsize          (esaxi_awsize[2:0]),     // Templated
                       .awburst         (esaxi_awburst[1:0]),    // Templated
                       .awlock          (esaxi_awlock[1:0]),     // Templated
                       .awcache         (esaxi_awcache[3:0]),    // Templated
                       .awprot          (esaxi_awprot[2:0]),     // Templated
                       .awvalid         (esaxi_awvalid),         // Templated
                       .wid             (esaxi_wid[SIDW-1:0]),   // Templated
                       .wdata           (esaxi_wdata[SDW-1:0]),  // Templated
                       .wstrb           (esaxi_wstrb[3:0]),      // Templated
                       .wlast           (esaxi_wlast),           // Templated
                       .wvalid          (esaxi_wvalid),          // Templated
                       .bready          (esaxi_bready),          // Templated
                       .arid            (esaxi_arid[SIDW-1:0]),  // Templated
                       .araddr          (esaxi_araddr[SAW-1:0]), // Templated
                       .arlen           (esaxi_arlen[3:0]),      // Templated
                       .arsize          (esaxi_arsize[2:0]),     // Templated
                       .arburst         (esaxi_arburst[1:0]),    // Templated
                       .arlock          (esaxi_arlock[1:0]),     // Templated
                       .arcache         (esaxi_arcache[3:0]),    // Templated
                       .arprot          (esaxi_arprot[2:0]),     // Templated
                       .arvalid         (esaxi_arvalid),         // Templated
                       .rready          (esaxi_rready),          // Templated
                       .emesh_access_outb(esaxi_access_outb),    // Templated
                       .emesh_write_outb(esaxi_write_outb),      // Templated
                       .emesh_datamode_outb(esaxi_datamode_outb[1:0]), // Templated
                       .emesh_ctrlmode_outb(esaxi_ctrlmode_outb[3:0]), // Templated
                       .emesh_dstaddr_outb(esaxi_dstaddr_outb[31:0]), // Templated
                       .emesh_srcaddr_outb(esaxi_srcaddr_outb[31:0]), // Templated
                       .emesh_data_outb (esaxi_data_outb[31:0]), // Templated
                       .emesh_wr_wait_outb(esaxi_wr_wait_outb),  // Templated
                       .emesh_rd_wait_outb(esaxi_rd_wait_outb),  // Templated
                       .awqos           (esaxi_awqos[3:0]),      // Templated
                       .arqos           (esaxi_arqos[3:0]));      // Templated
   //##################################
   //# AXI Master Port Instantiation
   //##################################
   /*axi_master AUTO_TEMPLATE(.eclk         (rxi_eclk),
                              .reset        (emaxi_reset),
                              .aclk	    (emaxi_aclk),
                              .aw\(.*\)     (emaxi_aw\1[]),
                              .w\(.*\)      (emaxi_w\1[]),
                              .b\(.*\)      (emaxi_b\1[]),
                              .ar\(.*\)     (emaxi_ar\1[]),
                              .r\(.*\)      (emaxi_r\1[]),
                              .emesh_\(.*\) (emaxi_\1[]),
                             );
    */
   axi_master axi_master(/*AUTOINST*/
                         // Outputs
                         .awid                  (emaxi_awid[MIDW-1:0]), // Templated
                         .awaddr                (emaxi_awaddr[MAW-1:0]), // Templated
                         .awlen                 (emaxi_awlen[3:0]), // Templated
                         .awsize                (emaxi_awsize[2:0]), // Templated
                         .awburst               (emaxi_awburst[1:0]), // Templated
                         .awlock                (emaxi_awlock[1:0]), // Templated
                         .awcache               (emaxi_awcache[3:0]), // Templated
                         .awprot                (emaxi_awprot[2:0]), // Templated
                         .awvalid               (emaxi_awvalid), // Templated
                         .wid                   (emaxi_wid[MIDW-1:0]), // Templated
                         .wdata                 (emaxi_wdata[MDW-1:0]), // Templated
                         .wstrb                 (emaxi_wstrb[STW-1:0]), // Templated
                         .wlast                 (emaxi_wlast),   // Templated
                         .wvalid                (emaxi_wvalid),  // Templated
                         .bready                (emaxi_bready),  // Templated
                         .arid                  (emaxi_arid[MIDW-1:0]), // Templated
                         .araddr                (emaxi_araddr[MAW-1:0]), // Templated
                         .arlen                 (emaxi_arlen[3:0]), // Templated
                         .arsize                (emaxi_arsize[2:0]), // Templated
                         .arburst               (emaxi_arburst[1:0]), // Templated
                         .arlock                (emaxi_arlock[1:0]), // Templated
                         .arcache               (emaxi_arcache[3:0]), // Templated
                         .arprot                (emaxi_arprot[2:0]), // Templated
                         .arvalid               (emaxi_arvalid), // Templated
                         .rready                (emaxi_rready),  // Templated
                         .emesh_access_inb      (emaxi_access_inb), // Templated
                         .emesh_write_inb       (emaxi_write_inb), // Templated
                         .emesh_datamode_inb    (emaxi_datamode_inb[1:0]), // Templated
                         .emesh_ctrlmode_inb    (emaxi_ctrlmode_inb[3:0]), // Templated
                         .emesh_dstaddr_inb     (emaxi_dstaddr_inb[31:0]), // Templated
                         .emesh_srcaddr_inb     (emaxi_srcaddr_inb[31:0]), // Templated
                         .emesh_data_inb        (emaxi_data_inb[31:0]), // Templated
                         .emesh_wr_wait_inb     (emaxi_wr_wait_inb), // Templated
                         .emesh_rd_wait_inb     (emaxi_rd_wait_inb), // Templated
                         .awqos                 (emaxi_awqos[3:0]), // Templated
                         .arqos                 (emaxi_arqos[3:0]), // Templated
                         // Inputs
                         .aclk                  (emaxi_aclk),    // Templated
                         .eclk                  (rxi_eclk),      // Templated
                         .reset                 (emaxi_reset),   // Templated
                         .awready               (emaxi_awready), // Templated
                         .wready                (emaxi_wready),  // Templated
                         .bid                   (emaxi_bid[MIDW-1:0]), // Templated
                         .bresp                 (emaxi_bresp[1:0]), // Templated
                         .bvalid                (emaxi_bvalid),  // Templated
                         .arready               (emaxi_arready), // Templated
                         .rid                   (emaxi_rid[MIDW-1:0]), // Templated
                         .rdata                 (emaxi_rdata[MDW-1:0]), // Templated
                         .rresp                 (emaxi_rresp[1:0]), // Templated
                         .rlast                 (emaxi_rlast),   // Templated
                         .rvalid                (emaxi_rvalid),  // Templated
                         .emesh_access_outb     (emaxi_access_outb), // Templated
                         .emesh_write_outb      (emaxi_write_outb), // Templated
                         .emesh_datamode_outb   (emaxi_datamode_outb[1:0]), // Templated
                         .emesh_ctrlmode_outb   (emaxi_ctrlmode_outb[3:0]), // Templated
                         .emesh_dstaddr_outb    (emaxi_dstaddr_outb[31:0]), // Templated
                         .emesh_srcaddr_outb    (emaxi_srcaddr_outb[31:0]), // Templated
                         .emesh_data_outb       (emaxi_data_outb[31:0]), // Templated
                         .emesh_wr_wait_outb    (emaxi_wr_wait_outb)); // Templated
   //#####################################
   //# ELINK (CHIP Port) Instantiation
   //#####################################
   //# "manual remapping" of external memory address seen by the chips
   assign ext_mem_access = (elink_dstaddr_tmp[31:28] == `VIRT_EXT_MEM) &
			  ~(elink_dstaddr_tmp[31:20] == `AXI_COORD);
   assign elink_dstaddr_inb[31:28] = ext_mem_access ? `PHYS_EXT_MEM :
			                              elink_dstaddr_tmp[31:28];
   assign elink_dstaddr_inb[27:0] = elink_dstaddr_tmp[27:0];
   /*ewrapper_link_top AUTO_TEMPLATE(.emesh_clk_inb (rxi_eclk),
                                     .burst_en      (1'b1),
                                     .emesh_dstaddr_inb(elink_dstaddr_tmp[31:0]),
                                     .emesh_\(.*\)  (elink_\1[]),
                                    );
    */
   ewrapper_link_top ewrapper_link_top
     (/*AUTOINST*/
      // Outputs
      .emesh_clk_inb                    (rxi_eclk),              // Templated
      .emesh_access_inb                 (elink_access_inb),      // Templated
      .emesh_write_inb                  (elink_write_inb),       // Templated
      .emesh_datamode_inb               (elink_datamode_inb[1:0]), // Templated
      .emesh_ctrlmode_inb               (elink_ctrlmode_inb[3:0]), // Templated
      .emesh_dstaddr_inb                (elink_dstaddr_tmp[31:0]), // Templated
      .emesh_srcaddr_inb                (elink_srcaddr_inb[31:0]), // Templated
      .emesh_data_inb                   (elink_data_inb[31:0]),  // Templated
      .emesh_wr_wait_inb                (elink_wr_wait_inb),     // Templated
      .emesh_rd_wait_inb                (elink_rd_wait_inb),     // Templated
      .txo_data_p                       (txo_data_p[7:0]),
      .txo_data_n                       (txo_data_n[7:0]),
      .txo_frame_p                      (txo_frame_p),
      .txo_frame_n                      (txo_frame_n),
      .txo_lclk_p                       (txo_lclk_p),
      .txo_lclk_n                       (txo_lclk_n),
      .rxo_wr_wait_p                    (rxo_wr_wait_p),
      .rxo_wr_wait_n                    (rxo_wr_wait_n),
      .rxo_rd_wait_p                    (rxo_rd_wait_p),
      .rxo_rd_wait_n                    (rxo_rd_wait_n),
      .rxi_cclk_p                       (rxi_cclk_p),
      .rxi_cclk_n                       (rxi_cclk_n),
      // Inputs
      .reset                            (reset),
      .clkin_100                        (clkin_100),
      .elink_disable                    (elink_disable),
      .elink_cclk_enb                   (elink_cclk_enb),
      .elink_clk_div                    (elink_clk_div[1:0]),
      .emesh_access_outb                (elink_access_outb),     // Templated
      .emesh_write_outb                 (elink_write_outb),      // Templated
      .emesh_datamode_outb              (elink_datamode_outb[1:0]), // Templated
      .emesh_ctrlmode_outb              (elink_ctrlmode_outb[3:0]), // Templated
      .emesh_dstaddr_outb               (elink_dstaddr_outb[31:0]), // Templated
      .emesh_srcaddr_outb               (elink_srcaddr_outb[31:0]), // Templated
      .emesh_data_outb                  (elink_data_outb[31:0]), // Templated
      .emesh_wr_wait_outb               (elink_wr_wait_outb),    // Templated
      .emesh_rd_wait_outb               (elink_rd_wait_outb),    // Templated
      .rxi_data_p                       (rxi_data_p[7:0]),
      .rxi_data_n                       (rxi_data_n[7:0]),
      .rxi_frame_p                      (rxi_frame_p),
      .rxi_frame_n                      (rxi_frame_n),
      .rxi_lclk_p                       (rxi_lclk_p),
      .rxi_lclk_n                       (rxi_lclk_n),
      .txi_wr_wait_p                    (txi_wr_wait_p),
      .txi_wr_wait_n                    (txi_wr_wait_n),
      .txi_rd_wait_p                    (txi_rd_wait_p),
      .txi_rd_wait_n                    (txi_rd_wait_n),
      .burst_en                         (1'b1));                  // Templated
   //####################################
   //# AXI-ELINK Interface Instantiation
   //####################################
   /*axi_elink_if AUTO_TEMPLATE(.eclk (rxi_eclk),
                                .aclk (esaxi_aclk),
                               );
    */
   axi_elink_if axi_elink_if
     (/*AUTOINST*/
      // Outputs
      .reset_chip                       (reset_chip),
      .reset_fpga                       (reset_fpga),
      .emaxi_access_outb                (emaxi_access_outb),
      .emaxi_write_outb                 (emaxi_write_outb),
      .emaxi_datamode_outb              (emaxi_datamode_outb[1:0]),
      .emaxi_ctrlmode_outb              (emaxi_ctrlmode_outb[3:0]),
      .emaxi_dstaddr_outb               (emaxi_dstaddr_outb[31:0]),
      .emaxi_srcaddr_outb               (emaxi_srcaddr_outb[31:0]),
      .emaxi_data_outb                  (emaxi_data_outb[31:0]),
      .emaxi_wr_wait_outb               (emaxi_wr_wait_outb),
      .esaxi_access_outb                (esaxi_access_outb),
      .esaxi_write_outb                 (esaxi_write_outb),
      .esaxi_datamode_outb              (esaxi_datamode_outb[1:0]),
      .esaxi_ctrlmode_outb              (esaxi_ctrlmode_outb[3:0]),
      .esaxi_dstaddr_outb               (esaxi_dstaddr_outb[31:0]),
      .esaxi_srcaddr_outb               (esaxi_srcaddr_outb[31:0]),
      .esaxi_data_outb                  (esaxi_data_outb[31:0]),
      .esaxi_wr_wait_outb               (esaxi_wr_wait_outb),
      .esaxi_rd_wait_outb               (esaxi_rd_wait_outb),
      .elink_access_outb                (elink_access_outb),
      .elink_write_outb                 (elink_write_outb),
      .elink_datamode_outb              (elink_datamode_outb[1:0]),
      .elink_ctrlmode_outb              (elink_ctrlmode_outb[3:0]),
      .elink_dstaddr_outb               (elink_dstaddr_outb[31:0]),
      .elink_srcaddr_outb               (elink_srcaddr_outb[31:0]),
      .elink_data_outb                  (elink_data_outb[31:0]),
      .elink_wr_wait_outb               (elink_wr_wait_outb),
      .elink_rd_wait_outb               (elink_rd_wait_outb),
      .elink_disable                    (elink_disable),
      .elink_cclk_enb                   (elink_cclk_enb),
      .elink_clk_div                    (elink_clk_div[1:0]),
      // Inputs
      .eclk                             (rxi_eclk),              // Templated
      .aclk                             (esaxi_aclk),            // Templated
      .reset                            (reset),
      .emaxi_access_inb                 (emaxi_access_inb),
      .emaxi_write_inb                  (emaxi_write_inb),
      .emaxi_datamode_inb               (emaxi_datamode_inb[1:0]),
      .emaxi_ctrlmode_inb               (emaxi_ctrlmode_inb[3:0]),
      .emaxi_dstaddr_inb                (emaxi_dstaddr_inb[31:0]),
      .emaxi_srcaddr_inb                (emaxi_srcaddr_inb[31:0]),
      .emaxi_data_inb                   (emaxi_data_inb[31:0]),
      .emaxi_wr_wait_inb                (emaxi_wr_wait_inb),
      .emaxi_rd_wait_inb                (emaxi_rd_wait_inb),
      .esaxi_access_inb                 (esaxi_access_inb),
      .esaxi_write_inb                  (esaxi_write_inb),
      .esaxi_datamode_inb               (esaxi_datamode_inb[1:0]),
      .esaxi_ctrlmode_inb               (esaxi_ctrlmode_inb[3:0]),
      .esaxi_dstaddr_inb                (esaxi_dstaddr_inb[31:0]),
      .esaxi_srcaddr_inb                (esaxi_srcaddr_inb[31:0]),
      .esaxi_data_inb                   (esaxi_data_inb[31:0]),
      .esaxi_wr_wait_inb                (esaxi_wr_wait_inb),
      .esaxi_rd_wait_inb                (esaxi_rd_wait_inb),
      .elink_access_inb                 (elink_access_inb),
      .elink_write_inb                  (elink_write_inb),
      .elink_datamode_inb               (elink_datamode_inb[1:0]),
      .elink_ctrlmode_inb               (elink_ctrlmode_inb[3:0]),
      .elink_dstaddr_inb                (elink_dstaddr_inb[31:0]),
      .elink_srcaddr_inb                (elink_srcaddr_inb[31:0]),
      .elink_data_inb                   (elink_data_inb[31:0]),
      .elink_wr_wait_inb                (elink_wr_wait_inb),
      .elink_rd_wait_inb                (elink_rd_wait_inb));
endmodule