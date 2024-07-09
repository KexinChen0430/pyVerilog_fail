module outputs)
   wire [15:0]		clk_config;		// From ecfg_elink of ecfg_elink.v
   wire			erx_cfg_wait;		// From erx of erx.v
   wire			erx_reset;		// From ereset of ereset.v
   wire			etx_cfg_access;		// From etx of etx.v
   wire [PW-1:0]	etx_cfg_packet;		// From etx of etx.v
   wire			etx_reset;		// From ereset of ereset.v
   wire			sys_reset;		// From ereset of ereset.v
   wire			txwr_gated_access;	// From ecfg_elink of ecfg_elink.v
   wire 		etx90_reset;
   wire 		erx_ioreset;
   // End of automatics
   /*CLOCK AND RESET CONFIG                                   */
   defparam ecfg_elink.ID=ID;
   ecfg_elink ecfg_elink (.clk		        (sys_clk),
			  /*AUTOINST*/
			  // Outputs
			  .txwr_gated_access	(txwr_gated_access),
			  .elink_en		(elink_en),
			  .clk_config		(clk_config[15:0]),
			  .e_chipid		(e_chipid[11:0]),
			  // Inputs
			  .txwr_access		(txwr_access),
			  .txwr_packet		(txwr_packet[PW-1:0]),
			  .reset		(reset));
   /*RESET CIRCUITRY                                          */
   //Synchronize with each clock domain
   ereset ereset (
		  /*AUTOINST*/
		  // Outputs
		  .etx_reset		(etx_reset),
		  .erx_reset		(erx_reset),
		  .sys_reset		(sys_reset),
		  .etx90_reset         (etx90_reset),
		  .erx_ioreset(erx_ioreset),
		  // Inputs
		  .reset		(reset),
		  .sys_clk		(sys_clk),
		  .tx_lclk90(tx_lclk90),
		  .rx_lclk(rx_lclk),
		  .tx_lclk_div4		(tx_lclk_div4),
		  .rx_lclk_div4		(rx_lclk_div4));
   /*RECEIVER                                                 */
   /*erx AUTO_TEMPLATE (
	                .mi_dout      (mi_rx_dout[]),
                        .reset        (erx_reset),
                       );
   */
   defparam erx.ID          = ID;
   defparam erx.IOSTD_ELINK = IOSTD_ELINK;
   defparam erx.ETYPE       = ETYPE;
   erx erx(
	   /*AUTOINST*/
	   // Outputs
	   .rx_lclk_pll			(rx_lclk_pll),
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
	   .timeout			(timeout),
	   .mailbox_full		(mailbox_full),
	   .mailbox_not_empty		(mailbox_not_empty),
	   // Inputs
	   .erx_reset			(erx_reset),
	   .erx_ioreset                 (erx_ioreset),
	   .sys_reset			(sys_reset),
	   .sys_clk			(sys_clk),
	   .rx_lclk			(rx_lclk),
	   .rx_lclk_div4		(rx_lclk_div4),
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
                        .reset        (etx_reset),
                       );
   */
   defparam etx.ID          = ID;
   defparam etx.IOSTD_ELINK = IOSTD_ELINK;
   defparam etx.ETYPE       = ETYPE;
   etx etx(.txwr_access  (txwr_gated_access),
	   /*AUTOINST*/
	   // Outputs
	   .txo_lclk_p			(txo_lclk_p),
	   .txo_lclk_n			(txo_lclk_n),
	   .txo_frame_p			(txo_frame_p),
	   .txo_frame_n			(txo_frame_n),
	   .txo_data_p			(txo_data_p[7:0]),
	   .txo_data_n			(txo_data_n[7:0]),
	   .txrd_wait			(txrd_wait),
	   .txwr_wait			(txwr_wait),
	   .txrr_wait			(txrr_wait),
	   .etx_cfg_access		(etx_cfg_access),
	   .etx_cfg_packet		(etx_cfg_packet[PW-1:0]),
	   // Inputs
	   .etx90_reset                 (etx90_reset),
	   .etx_reset			(etx_reset),
	   .sys_reset			(sys_reset),
	   .sys_clk			(sys_clk),
	   .tx_lclk			(tx_lclk),
	   .tx_lclk90			(tx_lclk90),
	   .tx_lclk_div4		(tx_lclk_div4),
	   .txi_wr_wait_p		(txi_wr_wait_p),
	   .txi_wr_wait_n		(txi_wr_wait_n),
	   .txi_rd_wait_p		(txi_rd_wait_p),
	   .txi_rd_wait_n		(txi_rd_wait_n),
	   .txrd_access			(txrd_access),
	   .txrd_packet			(txrd_packet[PW-1:0]),
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