module outputs)
   wire			erx_cfg_wait;		// From erx of erx.v
   wire			erx_reset;		// From erx of erx.v
   wire			erx_soft_reset;		// From ecfg_elink of ecfg_elink.v
   wire			etx_cfg_access;		// From etx of etx.v
   wire [PW-1:0]	etx_cfg_packet;		// From etx of etx.v
   wire			etx_reset;		// From etx of etx.v
   wire			etx_soft_reset;		// From ecfg_elink of ecfg_elink.v
   wire			rx_lclk_div4;		// From erx of erx.v
   wire			tx_active;		// From etx of etx.v
   wire			tx_lclk_div4;		// From etx of etx.v
   wire			txwr_gated_access;	// From ecfg_elink of ecfg_elink.v
   // End of automatics
   /*CLOCK AND RESET CONFIG                                   */
   defparam ecfg_elink.ID=ID;
   ecfg_elink ecfg_elink (.clk		        (sys_clk),
			  .por_reset		(sys_reset),
			  .clk_config		(),
			  /*AUTOINST*/
			  // Outputs
			  .txwr_gated_access	(txwr_gated_access),
			  .etx_soft_reset	(etx_soft_reset),
			  .erx_soft_reset	(erx_soft_reset),
			  .chipid		(chipid[11:0]),
			  // Inputs
			  .txwr_access		(txwr_access),
			  .txwr_packet		(txwr_packet[PW-1:0]));
   /*RECEIVER                                                 */
   /*erx AUTO_TEMPLATE (
	                .mi_dout      (mi_rx_dout[]),
                        .soft_reset   (erx_soft_reset),
                       );
   */
   defparam erx.ID          = ID;
   defparam erx.IOSTD_ELINK = IOSTD_ELINK;
   defparam erx.ETYPE       = ETYPE;
   erx erx(
	   /*AUTOINST*/
	   // Outputs
	   .rxo_wr_wait_p		(rxo_wr_wait_p),
	   .rxo_wr_wait_n		(rxo_wr_wait_n),
	   .rxo_rd_wait_p		(rxo_rd_wait_p),
	   .rxo_rd_wait_n		(rxo_rd_wait_n),
	   .rxwr_access			(rxwr_access),
	   .rxwr_packet			(rxwr_packet[PW-1:0]),
	   .rxrd_access			(rxrd_access),
	   .rxrd_packet			(rxrd_packet[PW-1:0]),
	   .rxrr_access			(rxrr_access),
	   .rxrr_packet			(rxrr_packet[PW-1:0]),
	   .erx_cfg_wait		(erx_cfg_wait),
	   .rx_lclk_div4		(rx_lclk_div4),
	   .erx_reset			(erx_reset),
	   .timeout			(timeout),
	   .mailbox_full		(mailbox_full),
	   .mailbox_not_empty		(mailbox_not_empty),
	   // Inputs
	   .soft_reset			(erx_soft_reset),	 // Templated
	   .sys_reset			(sys_reset),
	   .sys_clk			(sys_clk),
	   .tx_active			(tx_active),
	   .rxi_lclk_p			(rxi_lclk_p),
	   .rxi_lclk_n			(rxi_lclk_n),
	   .rxi_frame_p			(rxi_frame_p),
	   .rxi_frame_n			(rxi_frame_n),
	   .rxi_data_p			(rxi_data_p[7:0]),
	   .rxi_data_n			(rxi_data_n[7:0]),
	   .rxwr_wait			(rxwr_wait),
	   .rxrd_wait			(rxrd_wait),
	   .rxrr_wait			(rxrr_wait),
	   .erx_cfg_access		(erx_cfg_access),
	   .erx_cfg_packet		(erx_cfg_packet[PW-1:0]));
   /*TRANSMITTER                                              */
   /*etx AUTO_TEMPLATE (.mi_dout      (mi_tx_dout[]),
                        .emwr_\(.*\)  (esaxi_emwr_\1[]),
                        .emrq_\(.*\)  (esaxi_emrq_\1[]),
                        .emrr_\(.*\)  (emaxi_emrr_\1[]),
                        .soft_reset   (etx_soft_reset),
                        .txwr_access  (txwr_gated_access),
                       );
   */
   defparam etx.ID          = ID;
   defparam etx.IOSTD_ELINK = IOSTD_ELINK;
   defparam etx.ETYPE       = ETYPE;
   etx etx(
	   /*AUTOINST*/
	   // Outputs
	   .tx_active			(tx_active),
	   .txo_lclk_p			(txo_lclk_p),
	   .txo_lclk_n			(txo_lclk_n),
	   .txo_frame_p			(txo_frame_p),
	   .txo_frame_n			(txo_frame_n),
	   .txo_data_p			(txo_data_p[7:0]),
	   .txo_data_n			(txo_data_n[7:0]),
	   .cclk_p			(cclk_p),
	   .cclk_n			(cclk_n),
	   .chip_resetb			(chip_resetb),
	   .txrd_wait			(txrd_wait),
	   .txwr_wait			(txwr_wait),
	   .txrr_wait			(txrr_wait),
	   .etx_cfg_access		(etx_cfg_access),
	   .etx_cfg_packet		(etx_cfg_packet[PW-1:0]),
	   .etx_reset			(etx_reset),
	   .tx_lclk_div4		(tx_lclk_div4),
	   // Inputs
	   .sys_reset			(sys_reset),
	   .soft_reset			(etx_soft_reset),	 // Templated
	   .sys_clk			(sys_clk),
	   .txi_wr_wait_p		(txi_wr_wait_p),
	   .txi_wr_wait_n		(txi_wr_wait_n),
	   .txi_rd_wait_p		(txi_rd_wait_p),
	   .txi_rd_wait_n		(txi_rd_wait_n),
	   .txrd_access			(txrd_access),
	   .txrd_packet			(txrd_packet[PW-1:0]),
	   .txwr_access			(txwr_gated_access),	 // Templated
	   .txwr_packet			(txwr_packet[PW-1:0]),
	   .txrr_access			(txrr_access),
	   .txrr_packet			(txrr_packet[PW-1:0]),
	   .etx_cfg_wait		(etx_cfg_wait));
   /*TX-->RX REGISTER INTERFACE CONNECTION                    */
   defparam ecfg_cdc.DW=104;
   defparam ecfg_cdc.DEPTH=32;
   fifo_cdc ecfg_cdc (// Outputs
		      .wait_out		(etx_cfg_wait),
		      .access_out	(erx_cfg_access),
		      .packet_out	(erx_cfg_packet[PW-1:0]),
		      // Inputs
		      .clk_in		(tx_lclk_div4),
		      .reset_in		(etx_reset),
		      .access_in	(etx_cfg_access),
		      .packet_in	(etx_cfg_packet[PW-1:0]),
		      .clk_out		(rx_lclk_div4),
		      .reset_out	(erx_reset),
		      .wait_in		(erx_cfg_wait)
		      );
endmodule