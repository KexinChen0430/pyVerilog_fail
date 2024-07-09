module outputs)
   wire			emrq_fifo_access;	// From s_rq_fifo of fifo_async_emesh.v
   wire [3:0]		emrq_fifo_ctrlmode;	// From s_rq_fifo of fifo_async_emesh.v
   wire [31:0]		emrq_fifo_data;		// From s_rq_fifo of fifo_async_emesh.v
   wire [1:0]		emrq_fifo_datamode;	// From s_rq_fifo of fifo_async_emesh.v
   wire [31:0]		emrq_fifo_dstaddr;	// From s_rq_fifo of fifo_async_emesh.v
   wire [31:0]		emrq_fifo_srcaddr;	// From s_rq_fifo of fifo_async_emesh.v
   wire			emrq_fifo_write;	// From s_rq_fifo of fifo_async_emesh.v
   wire			emrq_rd_en;		// From etx_arbiter of etx_arbiter.v
   wire			emrr_fifo_access;	// From m_rr_fifo of fifo_async_emesh.v
   wire [3:0]		emrr_fifo_ctrlmode;	// From m_rr_fifo of fifo_async_emesh.v
   wire [31:0]		emrr_fifo_data;		// From m_rr_fifo of fifo_async_emesh.v
   wire [1:0]		emrr_fifo_datamode;	// From m_rr_fifo of fifo_async_emesh.v
   wire [31:0]		emrr_fifo_dstaddr;	// From m_rr_fifo of fifo_async_emesh.v
   wire [31:0]		emrr_fifo_srcaddr;	// From m_rr_fifo of fifo_async_emesh.v
   wire			emrr_fifo_write;	// From m_rr_fifo of fifo_async_emesh.v
   wire			emrr_rd_en;		// From etx_arbiter of etx_arbiter.v
   wire			emwr_fifo_access;	// From s_wr_fifo of fifo_async_emesh.v
   wire [3:0]		emwr_fifo_ctrlmode;	// From s_wr_fifo of fifo_async_emesh.v
   wire [31:0]		emwr_fifo_data;		// From s_wr_fifo of fifo_async_emesh.v
   wire [1:0]		emwr_fifo_datamode;	// From s_wr_fifo of fifo_async_emesh.v
   wire [31:0]		emwr_fifo_dstaddr;	// From s_wr_fifo of fifo_async_emesh.v
   wire [31:0]		emwr_fifo_srcaddr;	// From s_wr_fifo of fifo_async_emesh.v
   wire			emwr_fifo_write;	// From s_wr_fifo of fifo_async_emesh.v
   wire			emwr_rd_en;		// From etx_arbiter of etx_arbiter.v
   wire			etx_access;		// From etx_arbiter of etx_arbiter.v
   wire			etx_ack;		// From etx_protocol of etx_protocol.v
   wire [3:0]		etx_ctrlmode;		// From etx_arbiter of etx_arbiter.v
   wire [31:0]		etx_data;		// From etx_arbiter of etx_arbiter.v
   wire [1:0]		etx_datamode;		// From etx_arbiter of etx_arbiter.v
   wire [31:0]		etx_dstaddr;		// From etx_arbiter of etx_arbiter.v
   wire			etx_rd_wait;		// From etx_protocol of etx_protocol.v
   wire [31:0]		etx_srcaddr;		// From etx_arbiter of etx_arbiter.v
   wire			etx_wr_wait;		// From etx_protocol of etx_protocol.v
   wire			etx_write;		// From etx_arbiter of etx_arbiter.v
   wire [63:0]		tx_data_par;		// From etx_protocol of etx_protocol.v
   wire [7:0]		tx_frame_par;		// From etx_protocol of etx_protocol.v
   wire			tx_rd_wait;		// From etx_io of etx_io.v
   wire			tx_wr_wait;		// From etx_io of etx_io.v
   // End of automatics
   /*FIFOs                                                     */
   /*fifo_async_emesh  AUTO_TEMPLATE (
			       // Outputs
			       .emesh_\(.*\)_out(em@"(substring vl-cell-name  2 4)"_fifo_\1[]),
			       .fifo_empty	(em@"(substring vl-cell-name  2 4)"_fifo_empty),
			       .fifo_full	(em@"(substring vl-cell-name  2 4)"_fifo_full),
			       .fifo_progfull	(em@"(substring vl-cell-name  2 4)"_progfull),
			       // Inputs
			       .rd_clk		(tx_lclk_par),
			       .wr_clk		(@"(substring vl-cell-name  0 1)"_axi_aclk),
			       .reset		(reset),
			       .fifo_read	(em@"(substring vl-cell-name  2 4)"_rd_en),
                               .emesh_\(.*\)_in	(em@"(substring vl-cell-name  2 4)"_\1[]),
    );
    */
   //Write fifo (from slave)
   fifo_async_emesh s_wr_fifo(.fifo_full	(emwr_full),
			      /*AUTOINST*/
			      // Outputs
			      .emesh_access_out	(emwr_fifo_access), // Templated
			      .emesh_write_out	(emwr_fifo_write), // Templated
			      .emesh_datamode_out(emwr_fifo_datamode[1:0]), // Templated
			      .emesh_ctrlmode_out(emwr_fifo_ctrlmode[3:0]), // Templated
			      .emesh_dstaddr_out(emwr_fifo_dstaddr[31:0]), // Templated
			      .emesh_data_out	(emwr_fifo_data[31:0]), // Templated
			      .emesh_srcaddr_out(emwr_fifo_srcaddr[31:0]), // Templated
			      .fifo_progfull	(emwr_progfull), // Templated
			      // Inputs
			      .rd_clk		(tx_lclk_par),	 // Templated
			      .wr_clk		(s_axi_aclk),	 // Templated
			      .reset		(reset),	 // Templated
			      .emesh_access_in	(emwr_access),	 // Templated
			      .emesh_write_in	(emwr_write),	 // Templated
			      .emesh_datamode_in(emwr_datamode[1:0]), // Templated
			      .emesh_ctrlmode_in(emwr_ctrlmode[3:0]), // Templated
			      .emesh_dstaddr_in	(emwr_dstaddr[31:0]), // Templated
			      .emesh_data_in	(emwr_data[31:0]), // Templated
			      .emesh_srcaddr_in	(emwr_srcaddr[31:0]), // Templated
			      .fifo_read	(emwr_rd_en));	 // Templated
   //Read request fifo (from slave)
   fifo_async_emesh  s_rq_fifo(.fifo_full	(emrq_full),
				/*AUTOINST*/
			       // Outputs
			       .emesh_access_out(emrq_fifo_access), // Templated
			       .emesh_write_out	(emrq_fifo_write), // Templated
			       .emesh_datamode_out(emrq_fifo_datamode[1:0]), // Templated
			       .emesh_ctrlmode_out(emrq_fifo_ctrlmode[3:0]), // Templated
			       .emesh_dstaddr_out(emrq_fifo_dstaddr[31:0]), // Templated
			       .emesh_data_out	(emrq_fifo_data[31:0]), // Templated
			       .emesh_srcaddr_out(emrq_fifo_srcaddr[31:0]), // Templated
			       .fifo_progfull	(emrq_progfull), // Templated
			       // Inputs
			       .rd_clk		(tx_lclk_par),	 // Templated
			       .wr_clk		(s_axi_aclk),	 // Templated
			       .reset		(reset),	 // Templated
			       .emesh_access_in	(emrq_access),	 // Templated
			       .emesh_write_in	(emrq_write),	 // Templated
			       .emesh_datamode_in(emrq_datamode[1:0]), // Templated
			       .emesh_ctrlmode_in(emrq_ctrlmode[3:0]), // Templated
			       .emesh_dstaddr_in(emrq_dstaddr[31:0]), // Templated
			       .emesh_data_in	(emrq_data[31:0]), // Templated
			       .emesh_srcaddr_in(emrq_srcaddr[31:0]), // Templated
			       .fifo_read	(emrq_rd_en));	 // Templated
   //Read response fifo (from master)
   fifo_async_emesh  m_rr_fifo(.fifo_full	(emrr_full),
				/*AUTOINST*/
			       // Outputs
			       .emesh_access_out(emrr_fifo_access), // Templated
			       .emesh_write_out	(emrr_fifo_write), // Templated
			       .emesh_datamode_out(emrr_fifo_datamode[1:0]), // Templated
			       .emesh_ctrlmode_out(emrr_fifo_ctrlmode[3:0]), // Templated
			       .emesh_dstaddr_out(emrr_fifo_dstaddr[31:0]), // Templated
			       .emesh_data_out	(emrr_fifo_data[31:0]), // Templated
			       .emesh_srcaddr_out(emrr_fifo_srcaddr[31:0]), // Templated
			       .fifo_progfull	(emrr_progfull), // Templated
			       // Inputs
			       .rd_clk		(tx_lclk_par),	 // Templated
			       .wr_clk		(m_axi_aclk),	 // Templated
			       .reset		(reset),	 // Templated
			       .emesh_access_in	(emrr_access),	 // Templated
			       .emesh_write_in	(emrr_write),	 // Templated
			       .emesh_datamode_in(emrr_datamode[1:0]), // Templated
			       .emesh_ctrlmode_in(emrr_ctrlmode[3:0]), // Templated
			       .emesh_dstaddr_in(emrr_dstaddr[31:0]), // Templated
			       .emesh_data_in	(emrr_data[31:0]), // Templated
			       .emesh_srcaddr_in(emrr_srcaddr[31:0]), // Templated
			       .fifo_read	(emrr_rd_en));	 // Templated
   /*ELINK TRANSMIT ARBITER                                    */
   /*-arbiter between write (slave), read request (slave),     */
   /* and read response channel (master)                       */
   etx_arbiter etx_arbiter (
			      /*AUTOINST*/
			    // Outputs
			    .emwr_rd_en		(emwr_rd_en),
			    .emrq_rd_en		(emrq_rd_en),
			    .emrr_rd_en		(emrr_rd_en),
			    .etx_access		(etx_access),
			    .etx_write		(etx_write),
			    .etx_datamode	(etx_datamode[1:0]),
			    .etx_ctrlmode	(etx_ctrlmode[3:0]),
			    .etx_dstaddr	(etx_dstaddr[31:0]),
			    .etx_srcaddr	(etx_srcaddr[31:0]),
			    .etx_data		(etx_data[31:0]),
			    // Inputs
			    .tx_lclk_par	(tx_lclk_par),
			    .reset		(reset),
			    .emwr_fifo_access	(emwr_fifo_access),
			    .emwr_fifo_write	(emwr_fifo_write),
			    .emwr_fifo_datamode	(emwr_fifo_datamode[1:0]),
			    .emwr_fifo_ctrlmode	(emwr_fifo_ctrlmode[3:0]),
			    .emwr_fifo_dstaddr	(emwr_fifo_dstaddr[31:0]),
			    .emwr_fifo_data	(emwr_fifo_data[31:0]),
			    .emwr_fifo_srcaddr	(emwr_fifo_srcaddr[31:0]),
			    .emrq_fifo_access	(emrq_fifo_access),
			    .emrq_fifo_write	(emrq_fifo_write),
			    .emrq_fifo_datamode	(emrq_fifo_datamode[1:0]),
			    .emrq_fifo_ctrlmode	(emrq_fifo_ctrlmode[3:0]),
			    .emrq_fifo_dstaddr	(emrq_fifo_dstaddr[31:0]),
			    .emrq_fifo_data	(emrq_fifo_data[31:0]),
			    .emrq_fifo_srcaddr	(emrq_fifo_srcaddr[31:0]),
			    .emrr_fifo_access	(emrr_fifo_access),
			    .emrr_fifo_write	(emrr_fifo_write),
			    .emrr_fifo_datamode	(emrr_fifo_datamode[1:0]),
			    .emrr_fifo_ctrlmode	(emrr_fifo_ctrlmode[3:0]),
			    .emrr_fifo_dstaddr	(emrr_fifo_dstaddr[31:0]),
			    .emrr_fifo_data	(emrr_fifo_data[31:0]),
			    .emrr_fifo_srcaddr	(emrr_fifo_srcaddr[31:0]),
			    .etx_rd_wait	(etx_rd_wait),
			    .etx_wr_wait	(etx_wr_wait),
			    .etx_ack		(etx_ack));
   /*ELINK PROTOCOL LOGIC                                      */
   /*-translates the 104 bit emesh transaction to elink packeet*/
   etx_protocol etx_protocol (/*AUTOINST*/
			      // Outputs
			      .etx_rd_wait	(etx_rd_wait),
			      .etx_wr_wait	(etx_wr_wait),
			      .etx_ack		(etx_ack),
			      .tx_frame_par	(tx_frame_par[7:0]),
			      .tx_data_par	(tx_data_par[63:0]),
			      .ecfg_tx_datain	(ecfg_tx_datain[1:0]),
			      // Inputs
			      .reset		(reset),
			      .etx_access	(etx_access),
			      .etx_write	(etx_write),
			      .etx_datamode	(etx_datamode[1:0]),
			      .etx_ctrlmode	(etx_ctrlmode[3:0]),
			      .etx_dstaddr	(etx_dstaddr[31:0]),
			      .etx_srcaddr	(etx_srcaddr[31:0]),
			      .etx_data		(etx_data[31:0]),
			      .tx_lclk_par	(tx_lclk_par),
			      .tx_rd_wait	(tx_rd_wait),
			      .tx_wr_wait	(tx_wr_wait));
   /*ELINK TRANSMIT I/O LOGIC                                 */
   /*-parallel data and frame as input                        */
   /*-serializes data for I/O                                 */
   etx_io etx_io (
		    /*AUTOINST*/
		  // Outputs
		  .txo_lclk_p		(txo_lclk_p),
		  .txo_lclk_n		(txo_lclk_n),
		  .txo_frame_p		(txo_frame_p),
		  .txo_frame_n		(txo_frame_n),
		  .txo_data_p		(txo_data_p[7:0]),
		  .txo_data_n		(txo_data_n[7:0]),
		  .tx_wr_wait		(tx_wr_wait),
		  .tx_rd_wait		(tx_rd_wait),
		  // Inputs
		  .reset		(reset),
		  .txi_wr_wait_p	(txi_wr_wait_p),
		  .txi_wr_wait_n	(txi_wr_wait_n),
		  .txi_rd_wait_p	(txi_rd_wait_p),
		  .txi_rd_wait_n	(txi_rd_wait_n),
		  .tx_lclk_par		(tx_lclk_par),
		  .tx_lclk		(tx_lclk),
		  .tx_lclk_out		(tx_lclk_out),
		  .tx_frame_par		(tx_frame_par[7:0]),
		  .tx_data_par		(tx_data_par[63:0]),
		  .ecfg_tx_enable	(ecfg_tx_enable),
		  .ecfg_tx_gpio_enable	(ecfg_tx_gpio_enable),
		  .ecfg_dataout		(ecfg_dataout[8:0]));
   /*Debug signals                                             */
   always @ (posedge tx_lclk_par)
     begin
	ecfg_tx_debug[15:0] <= {2'b0,                     //15:14
				etx_rd_wait,              //13
				etx_wr_wait,              //12
				emrr_rd_en,               //11
				emrr_progfull,            //10
				emrr_access,	          //9
				emrq_rd_en,               //8
				emrq_progfull,            //7
				emrq_access,	          //6
				emwr_rd_en,               //5
				emwr_progfull,            //4
				emwr_access,              //3
				emrr_full,                //2
				emrq_full,                //1
				emwr_full	          //0
				};
     end
endmodule