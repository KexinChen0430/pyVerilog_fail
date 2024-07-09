module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					tg_rand_seq_addr_gen_rand_addr_percent_check ( .error(1'b1) );
		end
	endgenerate
	driver_avl_use_be_avl_use_burstbegin #(
		.DEVICE_FAMILY                          ("Stratix IV"),
		.TG_AVL_DATA_WIDTH                      (64),
		.TG_AVL_ADDR_WIDTH                      (27),
		.TG_AVL_WORD_ADDR_WIDTH                 (24),
		.TG_AVL_SIZE_WIDTH                      (3),
		.TG_AVL_BE_WIDTH                        (8),
		.TG_GEN_BYTE_ADDR                       (1),
		.TG_NUM_DRIVER_LOOP                     (1),
		.TG_RANDOM_BYTE_ENABLE                  (1),
		.TG_ENABLE_READ_COMPARE                 (1),
		.TG_POWER_OF_TWO_BURSTS_ONLY            (0),
		.TG_BURST_ON_BURST_BOUNDARY             (0),
		.TG_TIMEOUT_COUNTER_WIDTH               (30),
		.TG_MAX_READ_LATENCY                    (20),
		.TG_SINGLE_RW_SEQ_ADDR_COUNT            (32),
		.TG_SINGLE_RW_RAND_ADDR_COUNT           (32),
		.TG_SINGLE_RW_RAND_SEQ_ADDR_COUNT       (32),
		.TG_BLOCK_RW_SEQ_ADDR_COUNT             (8),
		.TG_BLOCK_RW_RAND_ADDR_COUNT            (8),
		.TG_BLOCK_RW_RAND_SEQ_ADDR_COUNT        (8),
		.TG_BLOCK_RW_BLOCK_SIZE                 (8),
		.TG_TEMPLATE_STAGE_COUNT                (4),
		.TG_SEQ_ADDR_GEN_MIN_BURSTCOUNT         (1),
		.TG_SEQ_ADDR_GEN_MAX_BURSTCOUNT         (4),
		.TG_RAND_ADDR_GEN_MIN_BURSTCOUNT        (1),
		.TG_RAND_ADDR_GEN_MAX_BURSTCOUNT        (4),
		.TG_RAND_SEQ_ADDR_GEN_MIN_BURSTCOUNT    (1),
		.TG_RAND_SEQ_ADDR_GEN_MAX_BURSTCOUNT    (4),
		.TG_RAND_SEQ_ADDR_GEN_RAND_ADDR_PERCENT (50)
	) traffic_generator_0 (
		.pass                (pass),            //    status.pass
		.fail                (fail),            //          .fail
		.test_complete       (test_complete),   //          .test_complete
		.clk                 (clk),             // avl_clock.clk
		.reset_n             (reset_n),         // avl_reset.reset_n
		.avl_ready           (avl_ready),       //       avl.waitrequest_n
		.avl_addr            (avl_addr),        //          .address
		.avl_size            (avl_size),        //          .burstcount
		.avl_wdata           (avl_wdata),       //          .writedata
		.avl_rdata           (avl_rdata),       //          .readdata
		.avl_write_req       (avl_write_req),   //          .write
		.avl_read_req        (avl_read_req),    //          .read
		.avl_rdata_valid     (avl_rdata_valid), //          .readdatavalid
		.avl_be              (avl_be),          //          .byteenable
		.avl_burstbegin      (avl_burstbegin),  //          .beginbursttransfer
		.pnf_per_bit         (),                // (terminated)
		.pnf_per_bit_persist ()                 // (terminated)
	);
endmodule