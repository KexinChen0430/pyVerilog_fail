module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					chipselect_through_readlatency_check ( .error(1'b1) );
		end
	endgenerate
	altera_tristate_controller_translator #(
		.UAV_DATA_W             (8),
		.UAV_BYTEENABLE_W       (1),
		.UAV_ADDRESS_W          (22),
		.UAV_BURSTCOUNT_W       (1),
		.ZERO_WRITE_DELAY       (0),
		.ZERO_READ_DELAY        (0),
		.TURNAROUND_TIME_CYCLES (1),
		.READLATENCY_CYCLES     (2)
	) tdt (
		.clk                  (clk_clk),                                     //                       clk.clk
		.reset                (reset_reset),                                 //                     reset.reset
		.s0_uav_address       (uas_address),                                 //  avalon_universal_slave_0.address
		.s0_uav_burstcount    (uas_burstcount),                              //                          .burstcount
		.s0_uav_read          (uas_read),                                    //                          .read
		.s0_uav_write         (uas_write),                                   //                          .write
		.s0_uav_waitrequest   (uas_waitrequest),                             //                          .waitrequest
		.s0_uav_readdatavalid (uas_readdatavalid),                           //                          .readdatavalid
		.s0_uav_byteenable    (uas_byteenable),                              //                          .byteenable
		.s0_uav_readdata      (uas_readdata),                                //                          .readdata
		.s0_uav_writedata     (uas_writedata),                               //                          .writedata
		.s0_uav_lock          (uas_lock),                                    //                          .lock
		.s0_uav_debugaccess   (uas_debugaccess),                             //                          .debugaccess
		.m0_uav_address       (tdt_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.m0_uav_burstcount    (tdt_avalon_universal_master_0_burstcount),    //                          .burstcount
		.m0_uav_read          (tdt_avalon_universal_master_0_read),          //                          .read
		.m0_uav_write         (tdt_avalon_universal_master_0_write),         //                          .write
		.m0_uav_waitrequest   (tdt_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.m0_uav_readdatavalid (tdt_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.m0_uav_byteenable    (tdt_avalon_universal_master_0_byteenable),    //                          .byteenable
		.m0_uav_readdata      (tdt_avalon_universal_master_0_readdata),      //                          .readdata
		.m0_uav_writedata     (tdt_avalon_universal_master_0_writedata),     //                          .writedata
		.m0_uav_lock          (tdt_avalon_universal_master_0_lock),          //                          .lock
		.m0_uav_debugaccess   (tdt_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.c0_request           (tdt_conduit_start_request),                   //             conduit_start.request
		.c0_grant             (tda_conduit_end_grant),                       //                          .grant
		.c0_uav_write         (tdt_conduit_start_uav_write)                  //                          .uav_write
	);
	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (22),
		.AV_DATA_W                      (8),
		.UAV_DATA_W                     (8),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (1),
		.UAV_ADDRESS_W                  (22),
		.UAV_BURSTCOUNT_W               (1),
		.AV_READLATENCY                 (2),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (1),
		.AV_ADDRESS_SYMBOLS             (1),
		.AV_BURSTCOUNT_SYMBOLS          (1),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (8),
		.AV_WRITE_WAIT_CYCLES           (8),
		.AV_SETUP_WAIT_CYCLES           (2),
		.AV_DATA_HOLD_CYCLES            (2)
	) slave_translator (
		.clk                      (clk_clk),                                            //                      clk.clk
		.reset                    (reset_reset),                                        //                    reset.reset
		.uav_address              (tdt_avalon_universal_master_0_address),              // avalon_universal_slave_0.address
		.uav_burstcount           (tdt_avalon_universal_master_0_burstcount),           //                         .burstcount
		.uav_read                 (tdt_avalon_universal_master_0_read),                 //                         .read
		.uav_write                (tdt_avalon_universal_master_0_write),                //                         .write
		.uav_waitrequest          (tdt_avalon_universal_master_0_waitrequest),          //                         .waitrequest
		.uav_readdatavalid        (tdt_avalon_universal_master_0_readdatavalid),        //                         .readdatavalid
		.uav_byteenable           (tdt_avalon_universal_master_0_byteenable),           //                         .byteenable
		.uav_readdata             (tdt_avalon_universal_master_0_readdata),             //                         .readdata
		.uav_writedata            (tdt_avalon_universal_master_0_writedata),            //                         .writedata
		.uav_lock                 (tdt_avalon_universal_master_0_lock),                 //                         .lock
		.uav_debugaccess          (tdt_avalon_universal_master_0_debugaccess),          //                         .debugaccess
		.av_address               (slave_translator_avalon_anti_slave_0_address),       //      avalon_anti_slave_0.address
		.av_write                 (slave_translator_avalon_anti_slave_0_write),         //                         .write
		.av_read                  (slave_translator_avalon_anti_slave_0_read),          //                         .read
		.av_readdata              (slave_translator_avalon_anti_slave_0_readdata),      //                         .readdata
		.av_writedata             (slave_translator_avalon_anti_slave_0_writedata),     //                         .writedata
		.av_begintransfer         (slave_translator_avalon_anti_slave_0_begintransfer), //                         .begintransfer
		.av_byteenable            (slave_translator_avalon_anti_slave_0_byteenable),    //                         .byteenable
		.av_chipselect            (slave_translator_avalon_anti_slave_0_chipselect),    //                         .chipselect
		.av_beginbursttransfer    (),                                                   //              (terminated)
		.av_burstcount            (),                                                   //              (terminated)
		.av_readdatavalid         (1'b0),                                               //              (terminated)
		.av_waitrequest           (1'b0),                                               //              (terminated)
		.av_writebyteenable       (),                                                   //              (terminated)
		.av_lock                  (),                                                   //              (terminated)
		.av_clken                 (),                                                   //              (terminated)
		.uav_clken                (1'b0),                                               //              (terminated)
		.av_debugaccess           (),                                                   //              (terminated)
		.av_outputenable          (),                                                   //              (terminated)
		.uav_response             (),                                                   //              (terminated)
		.av_response              (2'b00),                                              //              (terminated)
		.uav_writeresponserequest (1'b0),                                               //              (terminated)
		.uav_writeresponsevalid   (),                                                   //              (terminated)
		.av_writeresponserequest  (),                                                   //              (terminated)
		.av_writeresponsevalid    (1'b0)                                                //              (terminated)
	);
	altera_tristate_controller_aggregator #(
		.AV_ADDRESS_W    (22),
		.AV_DATA_W       (8),
		.AV_BYTEENABLE_W (1)
	) tda (
		.clk                    (clk_clk),                                            //                       clk.clk
		.reset                  (reset_reset),                                        //                     reset.reset
		.tcm0_write_n           (tcm_write_n_out),                                    // tristate_conduit_master_0.write_n_out
		.tcm0_read_n            (tcm_read_n_out),                                     //                          .read_n_out
		.tcm0_begintransfer     (tcm_begintransfer_out),                              //                          .begintransfer_out
		.tcm0_chipselect_n      (tcm_chipselect_n_out),                               //                          .chipselect_n_out
		.tcm0_request           (tcm_request),                                        //                          .request
		.tcm0_grant             (tcm_grant),                                          //                          .grant
		.tcm0_address           (tcm_address_out),                                    //                          .address_out
		.tcm0_byteenable        (tcm_byteenable_out),                                 //                          .byteenable_out
		.tcm0_writedata         (tcm_data_out),                                       //                          .data_out
		.tcm0_data_outen        (tcm_data_outen),                                     //                          .data_outen
		.tcm0_readdata          (tcm_data_in),                                        //                          .data_in
		.av_write               (slave_translator_avalon_anti_slave_0_write),         //            avalon_slave_0.write
		.av_read                (slave_translator_avalon_anti_slave_0_read),          //                          .read
		.av_begintransfer       (slave_translator_avalon_anti_slave_0_begintransfer), //                          .begintransfer
		.av_chipselect          (slave_translator_avalon_anti_slave_0_chipselect),    //                          .chipselect
		.av_address             (slave_translator_avalon_anti_slave_0_address),       //                          .address
		.av_byteenable          (slave_translator_avalon_anti_slave_0_byteenable),    //                          .byteenable
		.av_writedata           (slave_translator_avalon_anti_slave_0_writedata),     //                          .writedata
		.av_readdata            (slave_translator_avalon_anti_slave_0_readdata),      //                          .readdata
		.c0_request             (tdt_conduit_start_request),                          //               conduit_end.request
		.c0_grant               (tda_conduit_end_grant),                              //                          .grant
		.c0_uav_write           (tdt_conduit_start_uav_write),                        //                          .uav_write
		.tcm0_write             (),                                                   //               (terminated)
		.av_lock                (1'b0),                                               //               (terminated)
		.tcm0_lock              (),                                                   //               (terminated)
		.tcm0_lock_n            (),                                                   //               (terminated)
		.tcm0_read              (),                                                   //               (terminated)
		.tcm0_begintransfer_n   (),                                                   //               (terminated)
		.tcm0_chipselect        (),                                                   //               (terminated)
		.av_outputenable        (1'b0),                                               //               (terminated)
		.tcm0_outputenable      (),                                                   //               (terminated)
		.tcm0_outputenable_n    (),                                                   //               (terminated)
		.av_waitrequest         (),                                                   //               (terminated)
		.tcm0_waitrequest       (1'b0),                                               //               (terminated)
		.tcm0_waitrequest_n     (1'b0),                                               //               (terminated)
		.reset_out              (),                                                   //               (terminated)
		.tcm0_resetrequest      (1'b0),                                               //               (terminated)
		.tcm0_resetrequest_n    (1'b1),                                               //               (terminated)
		.tcm0_irq_in            (1'b0),                                               //               (terminated)
		.tcm0_irq_in_n          (1'b1),                                               //               (terminated)
		.irq_out                (),                                                   //               (terminated)
		.tcm0_reset_output      (),                                                   //               (terminated)
		.tcm0_reset_output_n    (),                                                   //               (terminated)
		.tcm0_byteenable_n      (),                                                   //               (terminated)
		.av_writebyteenable     (1'b0),                                               //               (terminated)
		.tcm0_writebyteenable   (),                                                   //               (terminated)
		.tcm0_writebyteenable_n ()                                                    //               (terminated)
	);
endmodule