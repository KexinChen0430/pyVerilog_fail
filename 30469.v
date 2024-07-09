module
// ==================================================================
   cnet_reprogram cnet_reprogram(
            .prog_data (prog_data),
            .prog_data_vld (prog_data_vld),
            .prog_reset (prog_reset),
            .cnet_reprog (cnet_reprog),
            .overflow (prog_overflow),
            .error (prog_error),
	    .empty (empty),
            .init (prog_init),
            .done (), //xCG
            .rp_prog_b (rp_prog_b),
            .rp_init_b (rp_init_b),
            .rp_cclk (rp_cclk),
            .rp_cs_b (rp_cs_b),
            .rp_rdwr_b (rp_rdwr_b),
            .rp_data (rp_data),
            .rp_done (rp_done),
            .reset (reset),
            .clk (clk)
         );
	assign prog_done = 1'b1;
   // synthesis attribute keep_hierarchy of cnet_reprogram is false;
// ==================================================================
// Clock-domain crossing buffer for DMA
// ==================================================================
   wire [31:0] cpci_dma_data_c2n;
   wire        cpci_dma_data_tri_en;
   assign cpci_dma_data = cpci_dma_data_tri_en ? cpci_dma_data_c2n :'b z;
   //assign dma_pkt_avail = 4'hffff; //xCG TESTING
   cnet_dma_bus_master cnet_dma_bus_master
     (
      .dma_pkt_avail (dma_pkt_avail),
      .dma_rd_request (dma_rd_request),
      .dma_rd_request_q (dma_rd_request_q),
      .dma_rd_data (dma_data_frm_cnet),
      .dma_rd_en (dma_rd_en),
      .dma_tx_full (dma_tx_full),
      .dma_nearly_empty (dma_nearly_empty),
      .dma_empty (dma_empty),
      .dma_all_in_buf (dma_all_in_buf),
      .overflow (dma_buf_overflow),
      .cnet_reprog (cnet_reprog),
      .dma_wr_data (dma_data_to_cnet),
      .dma_wr_en (dma_wr_en),
      .dma_wr_rdy (dma_wr_rdy),
      //outputs:
      .cpci_dma_op_code_req ( cpci_dma_op_code_req ),
      .cpci_dma_op_queue_id ( cpci_dma_op_queue_id ),
      //inputs:
      .cpci_dma_op_code_ack ( cpci_dma_op_code_ack ),
      // DMA data and flow control
      // data transfer in:
      //inputs:
      .cpci_dma_vld_n2c ( cpci_dma_vld_n2c ),
      .cpci_dma_data_n2c ( cpci_dma_data ),
      //outputs:
      .cpci_dma_q_nearly_full_c2n ( cpci_dma_q_nearly_full_c2n ),
      // data transfer out:
      //outputs:
      .cpci_dma_vld_c2n ( cpci_dma_vld_c2n ),
      .cpci_dma_data_c2n ( cpci_dma_data_c2n ),
      .cpci_dma_data_tri_en ( cpci_dma_data_tri_en ),
      //inputs:
      .cpci_dma_q_nearly_full_n2c ( cpci_dma_q_nearly_full_n2c ),
      //misc:
      .reset (reset),
      .pclk (clk),
      .nclk (nclk_int)
      );
   // synthesis attribute keep_hierarchy of cnet_dma_bus_master is false;
   // synthesis attribute iob of cpci_dma_op_code_req is true;
   // synthesis attribute iob of cpci_dma_op_queue_id is true;
   // synthesis attribute iob of cpci_dma_op_code_ack is true;
   // synthesis attribute iob of cpci_dma_vld_n2c is true;
   // synthesis attribute iob of cpci_dma_data is true;
   // synthesis attribute iob of cpci_dma_q_nearly_full_c2n is true;
   // synthesis attribute iob of cpci_dma_vld_c2n is true;
   // synthesis attribute iob of cpci_dma_data_c2n is true;
   // synthesis attribute iob of cpci_dma_data_tri_en is true;
   // synthesis attribute iob of cpci_dma_q_nearly_full_n2c is true;
// ==================================================================
// DMA Engine
// ==================================================================
dma_engine dma_engine(
            .pci_data (pci_data_to_dma), //xCG
            .dma_data (dma_data),
            .dma_cbe (dma_cbe),
            .dma_vld (dma_vld),
            .dma_wrdn (dma_wrdn),
            .dma_request (dma_request),
            .dma_complete (dma_complete),
            .dma_data_vld (dma_data_vld),
            .dma_src_en (dma_src_en),
            .dma_lat_timeout (dma_lat_timeout),
            .dma_addr_st (dma_addr_st),
            .dma_data_st (dma_data_st),
            .dma_rd_intr (dma_rd_intr),
            .dma_wr_intr (dma_wr_intr),
            .pci_retry (pci_retry),
            .pci_fatal (pci_fatal),
            .dma_rd_addr (dma_rd_addr),
            .dma_wr_addr (dma_wr_addr),
            .dma_rd_mac (dma_rd_mac),
            .dma_wr_mac (dma_wr_mac),
            .dma_rd_size (dma_rd_size),
            .dma_wr_size (dma_wr_size),
            .dma_rd_owner (dma_rd_owner),
            .dma_wr_owner (dma_wr_owner),
            .dma_rd_done (dma_rd_done),
            .dma_wr_done (dma_wr_done),
            .dma_time (dma_time),
            .dma_timeout (dma_xfer_timeout),
            .dma_retries (dma_retries),
            .dma_retry_expire (dma_retry_expire),
            .dma_rd_size_err (dma_rd_size_err),
            .dma_wr_size_err (dma_wr_size_err),
            .dma_rd_addr_err (dma_rd_addr_err),
            .dma_wr_addr_err (dma_wr_addr_err),
            .dma_rd_mac_err (dma_rd_mac_err),
            .dma_wr_mac_err (dma_wr_mac_err),
            .dma_fatal_err (dma_fatal_err),
            .dma_in_progress (dma_in_progress),
            .host_is_le (host_is_le),
            .dma_pkt_avail (dma_pkt_avail),
            .dma_rd_request (dma_rd_request),
            .dma_rd_request_q (dma_rd_request_q),
            .dma_data_frm_cnet (dma_data_frm_cnet),
            .dma_rd_en (dma_rd_en),
            .dma_data_to_cnet (dma_data_to_cnet),
            .dma_wr_en (dma_wr_en),
            .dma_wr_rdy (dma_wr_rdy),
            .dma_tx_full (dma_tx_full),
            .dma_nearly_empty (dma_nearly_empty),
            .dma_empty (dma_empty),
            .dma_all_in_buf (dma_all_in_buf),
            .cnet_reprog (cnet_reprog),
            .reset (reset),
            .clk (clk),
				.xfer_cnt (dma_xfer_cnt) //xCG
         );
   // synthesis attribute keep_hierarchy of dma_engine is false;
// ==================================================================
// Heartbeat
// ==================================================================
cpci_heartbeat cpci_heartbeat (
        .heartbeat(heartbeat_led),
        .reset    (reset),
        .clk      (clk)
        );
   // synthesis attribute keep_hierarchy of cpci_heartbeat is false;
// ==================================================================
// Chipscope
// ==================================================================
/*chipscope chipscope(
            .cpci_jmpr (cpci_jmpr),
            .cpci_id (cpci_id),
	    .empty (empty),
            .prog_init (prog_init),
            .prog_done (prog_done),
            .cnet_reprog (cnet_reprog),
            .pci_addr (pci_addr),
            .pci_data (pci_data),
            .pci_data_vld (pci_data_vld),
            .reg_hit (reg_hit),
            .reg_we (reg_we),
            .reg_vld (reg_vld),
            .pci_reset (pci_reset),
            .clk (clk)
         );*/
// Generate the global reset signal
// Force the chip to reset on startup
initial
begin
   startup_reset = 1;
end
always @(posedge clk)
begin
   startup_reset <= 1'b0;
   //reset <= pci_reset || reg_reset || startup_reset; xCG
end
// Generate the cpci_data signal
assign cpci_data = cpci_data_tri_en ? cpci_data_wr : 'bz;
// Generate the cnet_reset signal
always @(posedge nclk_int)
begin
   //cnet_reset <= cnet_reset_1;
   //cnet_reset_1 <= pci_reset || try_cnet_reset;
   cnet_reset <= reset; //xCG, changed this because was getting x in simulation.
end
// Generate the cnet_err_sync signal
always @(posedge clk)
begin
   //if (pci_reset) begin //xCG
	if (reset) begin
      cnet_err_d1 <= 1'b0;
      cnet_err_sync <= 1'b0;
   end
   else begin
      cnet_err_d1 <= cnet_err;
      cnet_err_sync <= cnet_err_d1;
   end
end
// Generate the phy_int_sync signal
always @(posedge clk)
begin
   //if (pci_reset) begin xCG
	if (reset) begin
      phy_int_d1 <= 1'b0;
      phy_int_sync <= 1'b0;
   end
   else begin
      phy_int_d1 <= ~phy_int_b;
      phy_int_sync <= phy_int_d1;
   end
end
//   assign cpci_led = heartbeat_led;
   assign cpci_led = (cpci_id == 4'h0) ? heartbeat_led : ~clock_checker_led;
// Disallow reprogramming
assign allow_reprog = 1'b1;
endmodule