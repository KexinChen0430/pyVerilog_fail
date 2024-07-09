module definition
    // renaming port names to more meaningfull internal names
    assign wdatap_cmdload_valid         = ~proc_busy & proc_load & proc_write & proc_load_dataid;
    assign wdatap_cmdload_tbp_index     = tbp_load_index;
    assign wdatap_cmdload_burstcount    = proc_size;
    assign wdatap_cmdload_dataid        = wdatap_free_id_dataid;
    assign wr_data_mem_full             = ~wdatap_datawrite_ready;
    assign wdatap_datawrite_valid       = write_data_en;
    assign wdatap_datawrite_data        = write_data;
    assign wdatap_datawrite_be          = byte_en; // we need to replicate
    assign data_complete                = wdatap_tbp_data_ready;
    assign data_rmw_complete            = rmwfifo_output_valid_pulse | rmwfifo_output_valid_handshake;       // broadcast to all TBP's
    assign data_partial_be              = wdatap_tbp_data_partial_be;
    assign wdatap_dataread_valid               = doing_write & rdwr_data_valid & ~rmw_correct;
    assign wdatap_dataread_dataid              = dataid;
    assign wdatap_dataread_dataid_vector       = dataid_vector;
    assign wdatap_dataread_valid_first         = doing_write_first & rdwr_data_valid_first & ~rmw_correct_first;
    assign wdatap_dataread_dataid_first        = dataid_first;
    assign wdatap_dataread_dataid_vector_first = dataid_vector_first;
    assign wdatap_dataread_valid_first_vector  = rdwr_data_valid_first_vector;
    assign wdatap_dataread_valid_last          = doing_write_last  & rdwr_data_valid_last  & ~rmw_correct_last ;
    assign wdatap_dataread_dataid_last         = dataid_last;
    assign wdatap_dataread_dataid_vector_last  = dataid_vector_last;
    assign wdatap_data                         = wdatap_dataread_data;
    assign wdatap_rmw_partial_data             = wdatap_dataread_rmw_partial_data;
    assign wdatap_rmw_correct_data             = wdatap_dataread_rmw_correct_data;
    assign wdatap_rmw_partial                  = wdatap_dataread_rmw_partial;
    assign wdatap_rmw_correct                  = wdatap_dataread_rmw_correct;
    assign wdatap_dm                           = wdatap_dataread_dm;
    // internal signals
    // flow control between free list & allocated list
    assign wdatap_free_id_get_ready = wdatap_cmdload_valid;
    assign wdatap_allocated_put_valid= wdatap_free_id_get_ready & wdatap_free_id_valid;
    assign wdatap_free_id_valid = wdatap_int_free_id_valid & wdatap_cmdload_ready;
    always @ (posedge ctl_clk or negedge ctl_reset_n)
    begin
        if (!ctl_reset_n)
        begin
            cfg_dram_data_width <= 0;
        end
        else
        begin
            if (cfg_enable_ecc)
            begin
                cfg_dram_data_width <= cfg_interface_width - CFG_ECC_CODE_WIDTH;            // SPR:362973
            end
            else
            begin
                cfg_dram_data_width <= cfg_interface_width;
            end
        end
    end
    always @ (posedge ctl_clk or negedge ctl_reset_n)
    begin
        if (!ctl_reset_n)
        begin
            cfg_dram_dm_width <= 0;
        end
        else
        begin
            cfg_dram_dm_width <= cfg_dram_data_width / CFG_MEM_IF_DQ_PER_DQS;
        end
    end
    always @ (posedge ctl_clk or negedge ctl_reset_n)
    begin
        if (~ctl_reset_n)
        begin
            //reset state ...
            wdatap_dataread_dataid_r <= 0;
        end
        else
        begin
            //active state ...
            wdatap_dataread_dataid_r <= wdatap_dataread_dataid;
        end
    end
    alt_mem_ddrx_list
    #(
        .CTL_LIST_WIDTH                             (CFG_DATA_ID_WIDTH),
        .CTL_LIST_DEPTH                             (CFG_DATAID_ARRAY_DEPTH),
        .CTL_LIST_INIT_VALUE_TYPE                   ("INCR"),
        .CTL_LIST_INIT_VALID                        ("VALID")
    )
    wdatap_list_freeid_inst
    (
     .ctl_clk                                       (ctl_clk),
     .ctl_reset_n                                   (ctl_reset_n),
     .list_get_entry_ready                          (wdatap_free_id_get_ready),
     .list_get_entry_valid                          (wdatap_int_free_id_valid),
     .list_get_entry_id                             (wdatap_free_id_dataid),
     .list_get_entry_id_vector                      (wdatap_free_id_dataid_vector),
     // wdatap_dataread_ready can be ignored, list entry availability is guaranteed
     .list_put_entry_ready                          (wdatap_dataread_ready),
     .list_put_entry_valid                          (wdatap_dataread_done),
     .list_put_entry_id                             (wdatap_dataread_dataid_r)
    );
    alt_mem_ddrx_list
    #(
        .CTL_LIST_WIDTH                             (CFG_DATA_ID_WIDTH),
        .CTL_LIST_DEPTH                             (CFG_DATAID_ARRAY_DEPTH),
        .CTL_LIST_INIT_VALUE_TYPE                   ("ZERO"),
        .CTL_LIST_INIT_VALID                        ("INVALID")
    )
    wdatap_list_allocated_id_inst
    (
     .ctl_clk                                       (ctl_clk),
     .ctl_reset_n                                   (ctl_reset_n),
     .list_get_entry_ready                          (wdatap_notify_data_valid),
     .list_get_entry_valid                          (wdatap_update_data_dataid_valid),
     .list_get_entry_id                             (wdatap_update_data_dataid),
     .list_get_entry_id_vector                      (wdatap_update_data_dataid_vector),
     // wdatap_allocated_put_ready can be ignored, list entry availability is guaranteed
     .list_put_entry_ready                          (wdatap_allocated_put_ready),
     .list_put_entry_valid                          (wdatap_allocated_put_valid),
     .list_put_entry_id                             (wdatap_free_id_dataid)
    );
    alt_mem_ddrx_burst_tracking
    # (
        .CFG_BURSTCOUNT_TRACKING_WIDTH              (CFG_BURSTCOUNT_TRACKING_WIDTH),
        .CFG_BUFFER_ADDR_WIDTH                      (CFG_BUFFER_ADDR_WIDTH),
        .CFG_INT_SIZE_WIDTH                         (CFG_INT_SIZE_WIDTH)
    )
    wdatap_burst_tracking_inst
    (
        // port list
        .ctl_clk                                    (ctl_clk),
        .ctl_reset_n                                (ctl_reset_n),
        // data burst interface
        .burst_ready                                (wdatap_datawrite_ready),
        .burst_valid                                (wdatap_datawrite_valid),
        // burstcount counter sent to data_id_manager
        .burst_pending_burstcount                   (wdatap_update_data_burstcount),
        .burst_next_pending_burstcount              (wdatap_update_data_next_burstcount),
        // burstcount consumed by data_id_manager
        .burst_consumed_valid                       (wdatap_notify_data_valid),
        .burst_counsumed_burstcount                 (wdatap_notify_data_burstcount_consumed)
    );
    alt_mem_ddrx_dataid_manager
    # (
        .CFG_DATA_ID_WIDTH                          (CFG_DATA_ID_WIDTH),
        .CFG_LOCAL_WLAT_GROUP                       (CFG_LOCAL_WLAT_GROUP),
        .CFG_DRAM_WLAT_GROUP                        (CFG_DRAM_WLAT_GROUP),
        .CFG_BUFFER_ADDR_WIDTH                      (CFG_BUFFER_ADDR_WIDTH),
        .CFG_INT_SIZE_WIDTH                         (CFG_INT_SIZE_WIDTH),
        .CFG_TBP_NUM                                (CFG_TBP_NUM),
        .CFG_BURSTCOUNT_TRACKING_WIDTH              (CFG_BURSTCOUNT_TRACKING_WIDTH),
        .CFG_PORT_WIDTH_BURST_LENGTH                (CFG_PORT_WIDTH_BURST_LENGTH),
        .CFG_DWIDTH_RATIO                           (CFG_DWIDTH_RATIO),
	.CFG_ECC_BE_ALLLOW_RMW			    (CFG_ECC_BE_ALLLOW_RMW)
    )
    wdatap_dataid_manager_inst
    (
        // clock & reset
        .ctl_clk                                    (ctl_clk),
        .ctl_reset_n                                (ctl_reset_n),
        // configuration signals
        .cfg_burst_length                           (cfg_burst_length),
        .cfg_enable_ecc                             (cfg_enable_ecc),
        .cfg_enable_auto_corr                       (cfg_enable_auto_corr),
        .cfg_enable_no_dm                           (cfg_enable_no_dm),
        // update cmd interface
        .update_cmd_if_ready                        (wdatap_cmdload_ready),
        .update_cmd_if_valid                        (wdatap_cmdload_valid),
        .update_cmd_if_data_id                      (wdatap_cmdload_dataid),
        .update_cmd_if_burstcount                   (wdatap_cmdload_burstcount),
        .update_cmd_if_tbp_id                       (wdatap_cmdload_tbp_index),
        // update data interface
        .update_data_if_valid                       (wdatap_update_data_dataid_valid),
        .update_data_if_data_id                     (wdatap_update_data_dataid),
        .update_data_if_data_id_vector              (wdatap_update_data_dataid_vector),
        .update_data_if_burstcount                  (wdatap_update_data_burstcount),
        .update_data_if_next_burstcount             (wdatap_update_data_next_burstcount),
        // notify data interface
        .notify_data_if_valid                       (wdatap_notify_data_valid),
        .notify_data_if_burstcount                  (wdatap_notify_data_burstcount_consumed),
        // notify tbp interface
        .notify_tbp_data_ready                      (wdatap_tbp_data_ready),
        .notify_tbp_data_partial_be                 (wdatap_tbp_data_partial_be),
        // buffer write address generate interface
        .write_data_if_ready                        (wdatap_datawrite_ready),
        .write_data_if_valid                        (wdatap_datawrite_valid),
        .write_data_if_accepted                     (wdatap_datawrite_accepted),
        .write_data_if_address                      (wdatap_datawrite_address),
        .write_data_if_partial_be                   (wdatap_datawrite_partial_be),
	.write_data_if_allzeros_be	    	    (wdatap_datawrite_allzeros_be),
        // read data interface
        .read_data_if_valid                         (wdatap_dataread_valid),
        .read_data_if_data_id                       (wdatap_dataread_dataid),
        .read_data_if_data_id_vector                (wdatap_dataread_dataid_vector),
        .read_data_if_valid_first                   (wdatap_dataread_valid_first),
        .read_data_if_data_id_first                 (wdatap_dataread_dataid_first),
        .read_data_if_data_id_vector_first          (wdatap_dataread_dataid_vector_first),
        .read_data_if_valid_first_vector            (wdatap_dataread_valid_first_vector),
        .read_data_if_valid_last                    (wdatap_dataread_valid_last),
        .read_data_if_data_id_last                  (wdatap_dataread_dataid_last),
        .read_data_if_data_id_vector_last           (wdatap_dataread_dataid_vector_last),
        .read_data_if_address                       (wdatap_dataread_address),
        .read_data_if_datavalid                     (wdatap_dataread_datavalid),
        .read_data_if_done                          (wdatap_dataread_done)          // use with wdatap_dataread_dataid_r
    );
    genvar wdatap_m;
    genvar wdatap_n;
    generate
        for (wdatap_m = 0;wdatap_m < CFG_DWIDTH_RATIO;wdatap_m = wdatap_m + 1)
        begin : wdata_buffer_per_dwidth_ratio
            for (wdatap_n = 0;wdatap_n < CFG_LOCAL_WLAT_GROUP;wdatap_n = wdatap_n + 1)
            begin : wdata_buffer_per_dqs_group
                alt_mem_ddrx_buffer
                # (
                    .ADDR_WIDTH                                 (CFG_BUFFER_ADDR_WIDTH),
                    .DATA_WIDTH                                 (CFG_WR_DATA_WIDTH_PER_DQS_GROUP),
                    .REGISTER_OUTPUT                            (CFG_WDATA_REG)
                )
                wdatap_buffer_data_inst
                (
                    // port list
                    .ctl_clk                                    (ctl_clk),
                    .ctl_reset_n                                (ctl_reset_n),
                    // write interface
                    .write_valid                                (wdatap_datawrite_accepted),
                    .write_address                              (wdatap_datawrite_address),
                    .write_data                                 (wdatap_datawrite_data       [(wdatap_m * CFG_WR_DATA_WIDTH_PER_DQS_GROUP * CFG_LOCAL_WLAT_GROUP) + ((wdatap_n + 1) * CFG_WR_DATA_WIDTH_PER_DQS_GROUP) - 1 : (wdatap_m * CFG_WR_DATA_WIDTH_PER_DQS_GROUP * CFG_LOCAL_WLAT_GROUP) + (wdatap_n * CFG_WR_DATA_WIDTH_PER_DQS_GROUP)]),
                    // read interface
                    .read_valid                                 (wdatap_dataread_valid       [wdatap_n]),
                    .read_address                               (wdatap_dataread_address     [(wdatap_n + 1) * CFG_BUFFER_ADDR_WIDTH - 1 : wdatap_n * CFG_BUFFER_ADDR_WIDTH]),
                    .read_data                                  (wdatap_dataread_buffer_data [(wdatap_m * CFG_WR_DATA_WIDTH_PER_DQS_GROUP * CFG_LOCAL_WLAT_GROUP) + ((wdatap_n + 1) * CFG_WR_DATA_WIDTH_PER_DQS_GROUP) - 1 : (wdatap_m * CFG_WR_DATA_WIDTH_PER_DQS_GROUP * CFG_LOCAL_WLAT_GROUP) + (wdatap_n * CFG_WR_DATA_WIDTH_PER_DQS_GROUP)])
                );
                alt_mem_ddrx_buffer
                # (
                    .ADDR_WIDTH                                 (CFG_BUFFER_ADDR_WIDTH),
                    .DATA_WIDTH                                 (CFG_WR_DM_WIDTH_PER_DQS_GROUP),
                    .REGISTER_OUTPUT                            (CFG_WDATA_REG)
                )
                wdatap_buffer_be_inst
                (
                    // port list
                    .ctl_clk                                    (ctl_clk),
                    .ctl_reset_n                                (ctl_reset_n),
                    // write interface
                    .write_valid                                (wdatap_datawrite_accepted),
                    .write_address                              (wdatap_datawrite_address),
                    .write_data                                 (int_datawrite_dm          [(wdatap_m * CFG_WR_DM_WIDTH_PER_DQS_GROUP * CFG_LOCAL_WLAT_GROUP) + ((wdatap_n + 1) * CFG_WR_DM_WIDTH_PER_DQS_GROUP) - 1 : (wdatap_m * CFG_WR_DM_WIDTH_PER_DQS_GROUP * CFG_LOCAL_WLAT_GROUP) + (wdatap_n * CFG_WR_DM_WIDTH_PER_DQS_GROUP)]),
                    // read interface
                    .read_valid                                 (wdatap_dataread_valid     [wdatap_n]),
                    .read_address                               (wdatap_dataread_address   [(wdatap_n + 1) * CFG_BUFFER_ADDR_WIDTH - 1 : wdatap_n * CFG_BUFFER_ADDR_WIDTH]),
                    .read_data                                  (wdatap_dataread_buffer_dm [(wdatap_m * CFG_WR_DM_WIDTH_PER_DQS_GROUP * CFG_LOCAL_WLAT_GROUP) + ((wdatap_n + 1) * CFG_WR_DM_WIDTH_PER_DQS_GROUP) - 1 : (wdatap_m * CFG_WR_DM_WIDTH_PER_DQS_GROUP * CFG_LOCAL_WLAT_GROUP) + (wdatap_n * CFG_WR_DM_WIDTH_PER_DQS_GROUP)])
                );
            end
        end
    endgenerate
    // byteenables analysis & generation
    genvar wdatap_j, wdatap_k;
    generate
		if (CFG_ECC_BE_ALLLOW_RMW) begin
			reg     [CFG_ECC_MULTIPLES-1:0]                      be_all_ones;
			reg     [CFG_ECC_MULTIPLES-1:0]                      be_all_zeros;
			reg     [(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1:0] wdatap_datawrite_dm_widthratio    [CFG_ECC_MULTIPLES-1:0];
			reg     [(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1:0] int_datawrite_dm_unused1          [CFG_ECC_MULTIPLES-1:0];
			reg     [(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1:0] int_datawrite_dm_unused0          [CFG_ECC_MULTIPLES-1:0];
			assign wdatap_datawrite_partial_be = |int_datawrite_partial_be;
			assign wdatap_datawrite_allzeros_be = (!cfg_enable_no_dm & &be_all_zeros) ? 1'b1 : 1'b0;
			for (wdatap_k = 0;wdatap_k < CFG_LOCAL_DM_WIDTH;wdatap_k = wdatap_k + 1)
			begin : local_dm
				always @ (*)
				begin
					if (CFG_MEM_IF_DQ_PER_DQS == 4)
					begin
						wdatap_datawrite_dm [wdatap_k] = wdatap_datawrite_be [wdatap_k / 2];
					end
					else
					begin
						wdatap_datawrite_dm [wdatap_k] = wdatap_datawrite_be [wdatap_k];
					end
				end
			end
			for (wdatap_j = 0; wdatap_j < CFG_ECC_MULTIPLES; wdatap_j = wdatap_j + 1)
			begin : gen_partial_be
				always @ (*)
				begin
				be_all_ones[wdatap_j]    = &int_datawrite_dm_unused1[wdatap_j];
				be_all_zeros[wdatap_j]   = ~(|int_datawrite_dm_unused0[wdatap_j]);
					wdatap_datawrite_dm_widthratio [wdatap_j] =  wdatap_datawrite_dm [(wdatap_j+1)*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1 : (wdatap_j*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES))];
				end
				for (wdatap_k = 0; wdatap_k < (CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES); wdatap_k = wdatap_k + 1'b1)
				begin : gen_dm_unused_bits
					always @ (*)
					begin
						if (wdatap_k < cfg_dram_dm_width)
						begin
							int_datawrite_dm_unused1 [wdatap_j] [wdatap_k] =  wdatap_datawrite_dm_widthratio [wdatap_j][wdatap_k];
							int_datawrite_dm_unused0 [wdatap_j] [wdatap_k] =  wdatap_datawrite_dm_widthratio [wdatap_j][wdatap_k];
						end
						else
						begin
							int_datawrite_dm_unused1 [wdatap_j] [wdatap_k] =  {1'b1};
							int_datawrite_dm_unused0 [wdatap_j] [wdatap_k] =  {1'b0};
						end
					end
				end
				always @ (*)
				begin
					// partial be calculated for every dq width if byteenables, not partial be if either all ones, or all zeros
					if (cfg_enable_no_dm)
					begin
						int_datawrite_partial_be[wdatap_j] =  ~be_all_ones[wdatap_j];
					end
					else
					begin
						int_datawrite_partial_be[wdatap_j] =  ~(be_all_ones[wdatap_j] | be_all_zeros[wdatap_j]);
					end
					if (cfg_enable_ecc)
					begin
						if (be_all_zeros[wdatap_j])
						begin
							// no ECC code will be written
							int_datawrite_dm [(wdatap_j+1)*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1 : (wdatap_j*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES))] = int_datawrite_dm_unused0 [wdatap_j];
						end
						else
						begin
							// higher unused be bit will be used for ECC word
							int_datawrite_dm [(wdatap_j+1)*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1 : (wdatap_j*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES))] = int_datawrite_dm_unused1 [wdatap_j];
						end
					end
					else
					begin
							int_datawrite_dm [(wdatap_j+1)*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1 : (wdatap_j*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES))] = int_datawrite_dm_unused0 [wdatap_j];
					end
				end
			end
		end
		else begin
			reg     [(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1:0] wdatap_datawrite_dm_widthratio    [CFG_ECC_MULTIPLES-1:0];
			reg     [(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1:0] int_datawrite_dm_unused1          [CFG_ECC_MULTIPLES-1:0];
			reg     [(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1:0] int_datawrite_dm_unused0          [CFG_ECC_MULTIPLES-1:0];
			assign wdatap_datawrite_partial_be = |int_datawrite_partial_be;
			assign wdatap_datawrite_allzeros_be = 0;
			for (wdatap_k = 0;wdatap_k < CFG_LOCAL_DM_WIDTH;wdatap_k = wdatap_k + 1)
			begin : local_dm
				always @ (*)
				begin
					if (CFG_MEM_IF_DQ_PER_DQS == 4)
					begin
						wdatap_datawrite_dm [wdatap_k] = wdatap_datawrite_be [wdatap_k / 2];
					end
					else
					begin
						wdatap_datawrite_dm [wdatap_k] = wdatap_datawrite_be [wdatap_k];
					end
				end
			end
			for (wdatap_j = 0; wdatap_j < CFG_ECC_MULTIPLES; wdatap_j = wdatap_j + 1)
			begin : gen_partial_be
				wire be_all_ones    = &int_datawrite_dm_unused1[wdatap_j];
				wire be_all_zeros   = ~(|int_datawrite_dm_unused0[wdatap_j]);
				always @ (*)
				begin
						wdatap_datawrite_dm_widthratio [wdatap_j] =  wdatap_datawrite_dm [(wdatap_j+1)*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1 : (wdatap_j*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES))];
				end
				for (wdatap_k = 0; wdatap_k < (CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES); wdatap_k = wdatap_k + 1'b1)
				begin : gen_dm_unused_bits
					always @ (*)
					begin
						if (wdatap_k < cfg_dram_dm_width)
						begin
							int_datawrite_dm_unused1 [wdatap_j] [wdatap_k] =  wdatap_datawrite_dm_widthratio [wdatap_j][wdatap_k];
							int_datawrite_dm_unused0 [wdatap_j] [wdatap_k] =  wdatap_datawrite_dm_widthratio [wdatap_j][wdatap_k];
						end
						else
						begin
							int_datawrite_dm_unused1 [wdatap_j] [wdatap_k] =  {1'b1};
							int_datawrite_dm_unused0 [wdatap_j] [wdatap_k] =  {1'b0};
						end
					end
				end
				always @ (*)
				begin
					// partial be calculated for every dq width if byteenables, not partial be if either all ones, or all zeros
					if (cfg_enable_no_dm)
					begin
						int_datawrite_partial_be[wdatap_j] =  ~be_all_ones;
					end
					else
					begin
						int_datawrite_partial_be[wdatap_j] =  ~( be_all_ones | be_all_zeros );
					end
					if (cfg_enable_ecc)
					begin
						if (be_all_zeros)
						begin
							// no ECC code will be written
							int_datawrite_dm [(wdatap_j+1)*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1 : (wdatap_j*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES))] = int_datawrite_dm_unused0 [wdatap_j];
						end
						else
						begin
							// higher unused be bit will be used for ECC word
							int_datawrite_dm [(wdatap_j+1)*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1 : (wdatap_j*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES))] = int_datawrite_dm_unused1 [wdatap_j];
						end
					end
					else
					begin
							int_datawrite_dm [(wdatap_j+1)*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES)-1 : (wdatap_j*(CFG_LOCAL_DM_WIDTH/CFG_ECC_MULTIPLES))] = int_datawrite_dm_unused0 [wdatap_j];
					end
				end
			end
		end
    endgenerate
    // rmw data fifo
    // assume rmw data for 2 commands doesn't came back to back, causing rmwfifo_output_valid_pulse not to be generated for 2nd commands data
    assign rmwfifo_output_valid_pulse = rmwfifo_output_valid & ~rmwfifo_output_valid_r;
    // New data_rmw_complete logic, TBP/cmd_gen will have to assert data_rmw_fetch before data_rmw_complete de-asserts
    always @ (posedge ctl_clk or negedge ctl_reset_n)
    begin
        if (!ctl_reset_n)
        begin
            rmwfifo_output_valid_handshake <= 1'b0;
        end
        else
        begin
            if (data_rmw_fetch)
            begin
                rmwfifo_output_valid_handshake <= 1'b0;
            end
            else if (rmwfifo_output_valid_pulse)
            begin
                rmwfifo_output_valid_handshake <= 1'b1;
            end
        end
    end
    always @ (posedge ctl_clk or negedge ctl_reset_n)
    begin
        if (~ctl_reset_n)
        begin
            rmwfifo_output_valid_r  <= 1'b0;
            rmw_correct_r1          <= 1'b0;
            rmw_partial_r1          <= 1'b0;
            rmw_correct_r2          <= 1'b0;
            rmw_partial_r2          <= 1'b0;
        end
        else
        begin
            rmwfifo_output_valid_r  <= rmwfifo_output_valid;
            rmw_correct_r1          <= rmw_correct;
            rmw_partial_r1          <= rmw_partial;
            rmw_correct_r2          <= rmw_correct_r1;
            rmw_partial_r2          <= rmw_partial_r1;
        end
    end
    // RMW FIFO output register
    always @ (posedge ctl_clk or negedge ctl_reset_n)
    begin
        if (!ctl_reset_n)
        begin
            rmwfifo_output_data_r <= 0;
        end
        else
        begin
            rmwfifo_output_data_r <= rmwfifo_output_data;
        end
    end
    assign rmwfifo_input = {rmwfifo_ecc_code, rmwfifo_ecc_dbe, rmwfifo_data};
    assign {rmwfifo_output_ecc_code, rmwfifo_output_ecc_dbe, rmwfifo_output_data} = rmwfifo_output;
    assign rmwfifo_output_read = rmw_correct_r1 | (&wdatap_dataread_datavalid & rmw_partial_r1); // wdatap_dataread_datavalid must be all high together in ECC case (afi_wlat same for all DQS group), limitation in 11.0sp1
    assign err_rmwfifo_overflow = rmwfifo_data_valid & ~rmwfifo_ready;
    alt_mem_ddrx_fifo
    #(
        .CTL_FIFO_DATA_WIDTH (CFG_RMWDATA_FIFO_DATA_WIDTH),
        .CTL_FIFO_ADDR_WIDTH (CFG_RMWDATA_FIFO_ADDR_WIDTH)
    )
    rmw_data_fifo_inst
    (
        .ctl_clk            (ctl_clk),
        .ctl_reset_n        (ctl_reset_n),
        .get_ready          (rmwfifo_output_read),
        .get_valid          (rmwfifo_output_valid),
        .get_data           (rmwfifo_output),
        .put_ready          (rmwfifo_ready),
        .put_valid          (rmwfifo_data_valid),
        .put_data           (rmwfifo_input)
    );
    // rmw data merge block
    genvar wdatap_i;
    generate
        for (wdatap_i = 0; wdatap_i < ((CFG_LOCAL_DM_WIDTH)); wdatap_i = wdatap_i + 1)
        begin : gen_rmw_data_merge
            always @ (*)
            begin
                if (wdatap_dataread_buffer_dm[wdatap_i])
                begin
                    // data from wdatap buffer
                    rmw_merged_data [ ((wdatap_i + 1) * CFG_MEM_IF_DQ_PER_DQS) - 1 : (wdatap_i * CFG_MEM_IF_DQ_PER_DQS) ] = wdatap_dataread_buffer_data [ ((wdatap_i + 1) * CFG_MEM_IF_DQ_PER_DQS) - 1 : (wdatap_i * CFG_MEM_IF_DQ_PER_DQS) ];
                end
                else
                begin
                    // data from rmwfifo
                    if (CFG_WDATA_REG)
                    begin
                        rmw_merged_data [ ((wdatap_i + 1) * CFG_MEM_IF_DQ_PER_DQS) - 1 : (wdatap_i * CFG_MEM_IF_DQ_PER_DQS) ] = rmwfifo_output_data_r [ ((wdatap_i + 1) * CFG_MEM_IF_DQ_PER_DQS) - 1 : (wdatap_i * CFG_MEM_IF_DQ_PER_DQS) ];
                    end
                    else
                    begin
                        rmw_merged_data [ ((wdatap_i + 1) * CFG_MEM_IF_DQ_PER_DQS) - 1 : (wdatap_i * CFG_MEM_IF_DQ_PER_DQS) ] = rmwfifo_output_data   [ ((wdatap_i + 1) * CFG_MEM_IF_DQ_PER_DQS) - 1 : (wdatap_i * CFG_MEM_IF_DQ_PER_DQS) ];
                    end
                end
            end
        end
    endgenerate
    // wdata output mux
    // drives wdatap_data & wdatap_be from either of
    // if cfg_enabled etc ?
    generate
        if (CFG_WDATA_REG)
        begin
            always @ (*)
            begin
                if (cfg_enable_ecc | cfg_enable_no_dm)
                begin
                    wdatap_dataread_data             = wdatap_dataread_buffer_data;
                    wdatap_dataread_rmw_partial_data = rmw_merged_data;
                    wdatap_dataread_rmw_correct_data = rmwfifo_output_data_r;
                    wdatap_dataread_rmw_partial      = rmw_partial_r2;
                    wdatap_dataread_rmw_correct      = rmw_correct_r2;
                    if (rmw_correct_r2 | rmw_partial_r2)
                    begin
                        wdatap_dataread_dm = {(CFG_LOCAL_DM_WIDTH){1'b1}};
                    end
                    else
                    begin
                        wdatap_dataread_dm = wdatap_dataread_buffer_dm;
                    end
                end
                else
                begin
                    wdatap_dataread_dm               = wdatap_dataread_buffer_dm;
                    wdatap_dataread_data             = wdatap_dataread_buffer_data;
                    wdatap_dataread_rmw_partial_data = 0;
                    wdatap_dataread_rmw_correct_data = 0;
                    wdatap_dataread_rmw_partial      = 1'b0;
                    wdatap_dataread_rmw_correct      = 1'b0;
                end
            end
            // ecc code overwrite
            always @ (posedge ctl_clk or negedge ctl_reset_n)
            begin
                if (!ctl_reset_n)
                begin
                    wdatap_ecc_code           <= 0;
                    wdatap_ecc_code_overwrite <= 0;
                end
                else
                begin
                    wdatap_ecc_code <= rmwfifo_output_ecc_code;
                    if (cfg_enable_ecc_code_overwrites)
                    begin
                        if (rmw_correct_r1)
                        begin
                            wdatap_ecc_code_overwrite <= rmwfifo_output_ecc_dbe;
                        end
                        else if (rmw_partial_r1)
                        begin
                            if ( (|wdatap_dataread_buffer_dm) | (~rmwfifo_output_valid) )
                            begin
                                wdatap_ecc_code_overwrite <= {CFG_ECC_MULTIPLES{1'b0}};
                            end
                            else
                            begin
                                wdatap_ecc_code_overwrite <= rmwfifo_output_ecc_dbe;
                            end
                        end
                        else
                        begin
                            wdatap_ecc_code_overwrite <= {CFG_ECC_MULTIPLES{1'b0}};
                        end
                    end
                    else
                    begin
                        wdatap_ecc_code_overwrite <= {CFG_ECC_MULTIPLES{1'b0}};
                    end
                end
            end
        end
        else
        begin
            always @ (*)
            begin
                if (cfg_enable_ecc | cfg_enable_no_dm)
                begin
                    wdatap_dataread_data             = wdatap_dataread_buffer_data;
                    wdatap_dataread_rmw_partial_data = rmw_merged_data;
                    wdatap_dataread_rmw_correct_data = rmwfifo_output_data;
                    wdatap_dataread_rmw_partial      = rmw_partial_r1;
                    wdatap_dataread_rmw_correct      = rmw_correct_r1;
                    if (rmw_correct_r1 | rmw_partial_r1)
                    begin
                        wdatap_dataread_dm = {(CFG_LOCAL_DM_WIDTH){1'b1}};
                    end
                    else
                    begin
                        wdatap_dataread_dm = wdatap_dataread_buffer_dm;
                    end
                end
                else
                begin
                    wdatap_dataread_dm               = wdatap_dataread_buffer_dm;
                    wdatap_dataread_data             = wdatap_dataread_buffer_data;
                    wdatap_dataread_rmw_partial_data = 0;
                    wdatap_dataread_rmw_correct_data = 0;
                    wdatap_dataread_rmw_partial      = 1'b0;
                    wdatap_dataread_rmw_correct      = 1'b0;
                end
            end
            // ecc code overwrite
            always @ (*)
            begin
                wdatap_ecc_code         = rmwfifo_output_ecc_code;
                if (cfg_enable_ecc_code_overwrites)
                begin
                    if (rmw_correct_r1)
                    begin
                        wdatap_ecc_code_overwrite = rmwfifo_output_ecc_dbe;
                    end
                    else if (rmw_partial_r1)
                    begin
                        if ( (|wdatap_dataread_buffer_dm) | (~rmwfifo_output_valid) )
                        begin
                            wdatap_ecc_code_overwrite = {CFG_ECC_MULTIPLES{1'b0}};
                        end
                        else
                        begin
                            wdatap_ecc_code_overwrite = rmwfifo_output_ecc_dbe;
                        end
                    end
                    else
                    begin
                        wdatap_ecc_code_overwrite = {CFG_ECC_MULTIPLES{1'b0}};
                    end
                end
                else
                begin
                    wdatap_ecc_code_overwrite = {CFG_ECC_MULTIPLES{1'b0}};
                end
            end
        end
    endgenerate
endmodule