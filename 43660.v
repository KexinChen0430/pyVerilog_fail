module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					fifo_depths_check ( .error(1'b1) );
		end
	endgenerate
	altera_avalon_st_jtag_interface #(
		.PURPOSE              (1),
		.UPSTREAM_FIFO_SIZE   (0),
		.DOWNSTREAM_FIFO_SIZE (64),
		.MGMT_CHANNEL_WIDTH   (-1),
		.EXPORT_JTAG          (0),
		.USE_PLI              (0),
		.PLI_PORT             (50000)
	) jtag_phy_embedded_in_jtag_master (
		.clk             (clk_clk),                                    //        clock.clk
		.reset_n         (~rst_controller_reset_out_reset),            //  clock_reset.reset_n
		.source_data     (jtag_phy_embedded_in_jtag_master_src_data),  //          src.data
		.source_valid    (jtag_phy_embedded_in_jtag_master_src_valid), //             .valid
		.sink_data       (p2b_out_bytes_stream_data),                  //         sink.data
		.sink_valid      (p2b_out_bytes_stream_valid),                 //             .valid
		.sink_ready      (p2b_out_bytes_stream_ready),                 //             .ready
		.resetrequest    (master_reset_reset),                         // resetrequest.reset
		.source_ready    (1'b1),                                       //  (terminated)
		.mgmt_valid      (),                                           //  (terminated)
		.mgmt_channel    (),                                           //  (terminated)
		.mgmt_data       (),                                           //  (terminated)
		.jtag_tck        (1'b0),                                       //  (terminated)
		.jtag_tms        (1'b0),                                       //  (terminated)
		.jtag_tdi        (1'b0),                                       //  (terminated)
		.jtag_tdo        (),                                           //  (terminated)
		.jtag_ena        (1'b0),                                       //  (terminated)
		.jtag_usr1       (1'b0),                                       //  (terminated)
		.jtag_clr        (1'b0),                                       //  (terminated)
		.jtag_clrn       (1'b0),                                       //  (terminated)
		.jtag_state_tlr  (1'b0),                                       //  (terminated)
		.jtag_state_rti  (1'b0),                                       //  (terminated)
		.jtag_state_sdrs (1'b0),                                       //  (terminated)
		.jtag_state_cdr  (1'b0),                                       //  (terminated)
		.jtag_state_sdr  (1'b0),                                       //  (terminated)
		.jtag_state_e1dr (1'b0),                                       //  (terminated)
		.jtag_state_pdr  (1'b0),                                       //  (terminated)
		.jtag_state_e2dr (1'b0),                                       //  (terminated)
		.jtag_state_udr  (1'b0),                                       //  (terminated)
		.jtag_state_sirs (1'b0),                                       //  (terminated)
		.jtag_state_cir  (1'b0),                                       //  (terminated)
		.jtag_state_sir  (1'b0),                                       //  (terminated)
		.jtag_state_e1ir (1'b0),                                       //  (terminated)
		.jtag_state_pir  (1'b0),                                       //  (terminated)
		.jtag_state_e2ir (1'b0),                                       //  (terminated)
		.jtag_state_uir  (1'b0),                                       //  (terminated)
		.jtag_ir_in      (3'b000),                                     //  (terminated)
		.jtag_irq        (),                                           //  (terminated)
		.jtag_ir_out     ()                                            //  (terminated)
	);
	nios_dut_master_0_timing_adt timing_adt (
		.clk       (clk_clk),                                    //   clk.clk
		.reset_n   (~rst_controller_reset_out_reset),            // reset.reset_n
		.in_data   (jtag_phy_embedded_in_jtag_master_src_data),  //    in.data
		.in_valid  (jtag_phy_embedded_in_jtag_master_src_valid), //      .valid
		.out_data  (timing_adt_out_data),                        //   out.data
		.out_valid (timing_adt_out_valid),                       //      .valid
		.out_ready (timing_adt_out_ready)                        //      .ready
	);
	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (64),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (0),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) fifo (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (rst_controller_reset_out_reset),       // clk_reset.reset
		.in_data           (timing_adt_out_data),                  //        in.data
		.in_valid          (timing_adt_out_valid),                 //          .valid
		.in_ready          (timing_adt_out_ready),                 //          .ready
		.out_data          (fifo_out_data),                        //       out.data
		.out_valid         (fifo_out_valid),                       //          .valid
		.out_ready         (fifo_out_ready),                       //          .ready
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_startofpacket  (1'b0),                                 // (terminated)
		.in_endofpacket    (1'b0),                                 // (terminated)
		.out_startofpacket (),                                     // (terminated)
		.out_endofpacket   (),                                     // (terminated)
		.in_empty          (1'b0),                                 // (terminated)
		.out_empty         (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);
	altera_avalon_st_bytes_to_packets #(
		.CHANNEL_WIDTH (8),
		.ENCODING      (0)
	) b2p (
		.clk               (clk_clk),                              //                clk.clk
		.reset_n           (~rst_controller_reset_out_reset),      //          clk_reset.reset_n
		.out_channel       (b2p_out_packets_stream_channel),       // out_packets_stream.channel
		.out_ready         (b2p_out_packets_stream_ready),         //                   .ready
		.out_valid         (b2p_out_packets_stream_valid),         //                   .valid
		.out_data          (b2p_out_packets_stream_data),          //                   .data
		.out_startofpacket (b2p_out_packets_stream_startofpacket), //                   .startofpacket
		.out_endofpacket   (b2p_out_packets_stream_endofpacket),   //                   .endofpacket
		.in_ready          (fifo_out_ready),                       //    in_bytes_stream.ready
		.in_valid          (fifo_out_valid),                       //                   .valid
		.in_data           (fifo_out_data)                         //                   .data
	);
	altera_avalon_st_packets_to_bytes #(
		.CHANNEL_WIDTH (8),
		.ENCODING      (0)
	) p2b (
		.clk              (clk_clk),                         //               clk.clk
		.reset_n          (~rst_controller_reset_out_reset), //         clk_reset.reset_n
		.in_ready         (p2b_adapter_out_ready),           // in_packets_stream.ready
		.in_valid         (p2b_adapter_out_valid),           //                  .valid
		.in_data          (p2b_adapter_out_data),            //                  .data
		.in_channel       (p2b_adapter_out_channel),         //                  .channel
		.in_startofpacket (p2b_adapter_out_startofpacket),   //                  .startofpacket
		.in_endofpacket   (p2b_adapter_out_endofpacket),     //                  .endofpacket
		.out_ready        (p2b_out_bytes_stream_ready),      //  out_bytes_stream.ready
		.out_valid        (p2b_out_bytes_stream_valid),      //                  .valid
		.out_data         (p2b_out_bytes_stream_data)        //                  .data
	);
	altera_avalon_packets_to_master #(
		.FAST_VER    (0),
		.FIFO_DEPTHS (2),
		.FIFO_WIDTHU (1)
	) transacto (
		.clk               (clk_clk),                            //           clk.clk
		.reset_n           (~rst_controller_reset_out_reset),    //     clk_reset.reset_n
		.out_ready         (transacto_out_stream_ready),         //    out_stream.ready
		.out_valid         (transacto_out_stream_valid),         //              .valid
		.out_data          (transacto_out_stream_data),          //              .data
		.out_startofpacket (transacto_out_stream_startofpacket), //              .startofpacket
		.out_endofpacket   (transacto_out_stream_endofpacket),   //              .endofpacket
		.in_ready          (b2p_adapter_out_ready),              //     in_stream.ready
		.in_valid          (b2p_adapter_out_valid),              //              .valid
		.in_data           (b2p_adapter_out_data),               //              .data
		.in_startofpacket  (b2p_adapter_out_startofpacket),      //              .startofpacket
		.in_endofpacket    (b2p_adapter_out_endofpacket),        //              .endofpacket
		.address           (master_address),                     // avalon_master.address
		.readdata          (master_readdata),                    //              .readdata
		.read              (master_read),                        //              .read
		.write             (master_write),                       //              .write
		.writedata         (master_writedata),                   //              .writedata
		.waitrequest       (master_waitrequest),                 //              .waitrequest
		.readdatavalid     (master_readdatavalid),               //              .readdatavalid
		.byteenable        (master_byteenable)                   //              .byteenable
	);
	nios_dut_master_0_b2p_adapter b2p_adapter (
		.clk               (clk_clk),                              //   clk.clk
		.reset_n           (~rst_controller_reset_out_reset),      // reset.reset_n
		.in_data           (b2p_out_packets_stream_data),          //    in.data
		.in_valid          (b2p_out_packets_stream_valid),         //      .valid
		.in_ready          (b2p_out_packets_stream_ready),         //      .ready
		.in_startofpacket  (b2p_out_packets_stream_startofpacket), //      .startofpacket
		.in_endofpacket    (b2p_out_packets_stream_endofpacket),   //      .endofpacket
		.in_channel        (b2p_out_packets_stream_channel),       //      .channel
		.out_data          (b2p_adapter_out_data),                 //   out.data
		.out_valid         (b2p_adapter_out_valid),                //      .valid
		.out_ready         (b2p_adapter_out_ready),                //      .ready
		.out_startofpacket (b2p_adapter_out_startofpacket),        //      .startofpacket
		.out_endofpacket   (b2p_adapter_out_endofpacket)           //      .endofpacket
	);
	nios_dut_master_0_p2b_adapter p2b_adapter (
		.clk               (clk_clk),                            //   clk.clk
		.reset_n           (~rst_controller_reset_out_reset),    // reset.reset_n
		.in_data           (transacto_out_stream_data),          //    in.data
		.in_valid          (transacto_out_stream_valid),         //      .valid
		.in_ready          (transacto_out_stream_ready),         //      .ready
		.in_startofpacket  (transacto_out_stream_startofpacket), //      .startofpacket
		.in_endofpacket    (transacto_out_stream_endofpacket),   //      .endofpacket
		.out_data          (p2b_adapter_out_data),               //   out.data
		.out_valid         (p2b_adapter_out_valid),              //      .valid
		.out_ready         (p2b_adapter_out_ready),              //      .ready
		.out_startofpacket (p2b_adapter_out_startofpacket),      //      .startofpacket
		.out_endofpacket   (p2b_adapter_out_endofpacket),        //      .endofpacket
		.out_channel       (p2b_adapter_out_channel)             //      .channel
	);
	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (clk_reset_reset),                // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);
endmodule