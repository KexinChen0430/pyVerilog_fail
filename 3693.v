module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					enable_traffic_tracking_check ( .error(1'b1) );
		end
	endgenerate
	altera_avlmm_slv_freeze_bridge #(
		.ENABLE_FREEZE_FROM_PR_REGION   (0),
		.ENABLE_TRAFFIC_TRACKING        (0),
		.ENABLED_BACKPRESSURE_BRIDGE    (0),
		.USE_BURSTCOUNT                 (1),
		.USE_READ_DATA_VALID            (1),
		.USE_READ_WAIT_TIME             (0),
		.USE_WRITE_WAIT_TIME            (0),
		.USE_WRRESPONSEVALID            (1),
		.SLV_BRIDGE_ADDR_WIDTH          (10),
		.SLV_BRIDGE_BYTEEN_WIDTH        (4),
		.SLV_BRIDGE_MAX_RDTRANS_WIDTH   (3),
		.SLV_BRIDGE_MAX_WRTRANS_WIDTH   (3),
		.SLV_BRIDGE_RWT_WIDTH           (1),
		.SLV_BRIDGE_WWT_WIDTH           (1),
		.SLV_BRIDGE_FIX_RDLATENCY_WIDTH (1),
		.SLV_BRIDGE_BURSTCOUNT_WIDTH    (3),
		.SLV_BRIDGE_WRDATA_WIDTH        (32),
		.SLV_BRIDGE_RDDATA_WIDTH        (32),
		.SLV_BRIDGE_FIX_READ_LATENCY    (0),
		.SLV_BRIDGE_READ_WAIT_TIME      (1),
		.SLV_BRIDGE_WRITE_WAIT_TIME     (0)
	) avlmm_slv_freeze_bridge (
		.clk                                 (clock),                               //   input,   width = 1,       clock_sink.clk
		.reset_n                             (reset_n),                             //   input,   width = 1,            reset.reset_n
		.freeze                              (freeze_conduit_freeze),               //   input,   width = 1,   freeze_conduit.freeze
		.illegal_request                     (freeze_conduit_illegal_request),      //  output,   width = 1,                 .illegal_request
		.slv_bridge_to_pr_read               (slv_bridge_to_pr_read),               //  output,   width = 1, slv_bridge_to_pr.read
		.slv_bridge_to_pr_waitrequest        (slv_bridge_to_pr_waitrequest),        //   input,   width = 1,                 .waitrequest
		.slv_bridge_to_pr_write              (slv_bridge_to_pr_write),              //  output,   width = 1,                 .write
		.slv_bridge_to_pr_addr               (slv_bridge_to_pr_address),            //  output,  width = 10,                 .address
		.slv_bridge_to_pr_byteenable         (slv_bridge_to_pr_byteenable),         //  output,   width = 4,                 .byteenable
		.slv_bridge_to_pr_wrdata             (slv_bridge_to_pr_writedata),          //  output,  width = 32,                 .writedata
		.slv_bridge_to_pr_rddata             (slv_bridge_to_pr_readdata),           //   input,  width = 32,                 .readdata
		.slv_bridge_to_pr_burstcount         (slv_bridge_to_pr_burstcount),         //  output,   width = 3,                 .burstcount
		.slv_bridge_to_pr_rddata_valid       (slv_bridge_to_pr_readdatavalid),      //   input,   width = 1,                 .readdatavalid
		.slv_bridge_to_pr_beginbursttransfer (slv_bridge_to_pr_beginbursttransfer), //  output,   width = 1,                 .beginbursttransfer
		.slv_bridge_to_pr_debugaccess        (slv_bridge_to_pr_debugaccess),        //  output,   width = 1,                 .debugaccess
		.slv_bridge_to_pr_response           (slv_bridge_to_pr_response),           //   input,   width = 2,                 .response
		.slv_bridge_to_pr_lock               (slv_bridge_to_pr_lock),               //  output,   width = 1,                 .lock
		.slv_bridge_to_pr_writeresponsevalid (slv_bridge_to_pr_writeresponsevalid), //   input,   width = 1,                 .writeresponsevalid
		.slv_bridge_to_sr_read               (slv_bridge_to_sr_read),               //   input,   width = 1, slv_bridge_to_sr.read
		.slv_bridge_to_sr_waitrequest        (slv_bridge_to_sr_waitrequest),        //  output,   width = 1,                 .waitrequest
		.slv_bridge_to_sr_write              (slv_bridge_to_sr_write),              //   input,   width = 1,                 .write
		.slv_bridge_to_sr_addr               (slv_bridge_to_sr_address),            //   input,  width = 10,                 .address
		.slv_bridge_to_sr_byteenable         (slv_bridge_to_sr_byteenable),         //   input,   width = 4,                 .byteenable
		.slv_bridge_to_sr_wrdata             (slv_bridge_to_sr_writedata),          //   input,  width = 32,                 .writedata
		.slv_bridge_to_sr_rddata             (slv_bridge_to_sr_readdata),           //  output,  width = 32,                 .readdata
		.slv_bridge_to_sr_burstcount         (slv_bridge_to_sr_burstcount),         //   input,   width = 3,                 .burstcount
		.slv_bridge_to_sr_rddata_valid       (slv_bridge_to_sr_readdatavalid),      //  output,   width = 1,                 .readdatavalid
		.slv_bridge_to_sr_beginbursttransfer (slv_bridge_to_sr_beginbursttransfer), //   input,   width = 1,                 .beginbursttransfer
		.slv_bridge_to_sr_debugaccess        (slv_bridge_to_sr_debugaccess),        //   input,   width = 1,                 .debugaccess
		.slv_bridge_to_sr_response           (slv_bridge_to_sr_response),           //  output,   width = 2,                 .response
		.slv_bridge_to_sr_lock               (slv_bridge_to_sr_lock),               //   input,   width = 1,                 .lock
		.slv_bridge_to_sr_writeresponsevalid (slv_bridge_to_sr_writeresponsevalid), //  output,   width = 1,                 .writeresponsevalid
		.pr_freeze                           (1'b0)                                 // (terminated),
	);
endmodule