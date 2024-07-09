module
// tag
always@(posedge clk) begin
    usr_arb_rx_wr_tag   <= rx_wr_tag_reg[`IF_TAG-1:0];
    rif_rx_wr_tag       <= rx_wr_tag_reg[`IF_TAG-1:0];
end
// valid
always@(posedge clk) begin
    if(~ rst_n)begin
        usr_arb_rx_wr_valid <= 0;
        rif_rx_wr_valid     <= 0;
    end
    else begin
        usr_arb_rx_wr_valid <= rx_wr_valid_reg & rx_wr_tag_reg[`FTHREAD_TAG-1] & run_wr_tx;
        rif_rx_wr_valid     <= rx_wr_valid_reg & ~rx_wr_tag_reg[`FTHREAD_TAG-1] & run_wr_tx;
    end
end
assign wr_cmd      = (run_wr_tx)? `CCI_REQ_WR_LINE : `CCI_REQ_WR_THRU;
quick_fifo  #(.FIFO_WIDTH(512+72),
            .FIFO_DEPTH_BITS(9),
            .FIFO_ALMOSTFULL_THRESHOLD(32)
            ) tx_wr_fifo(
        .clk                (clk),
        .reset_n            (rst_n),
        .din                ({ wr_cmd, ft_tx_wr_addr, ft_tx_wr_tag, ft_tx_data}),
        .we                 (ft_tx_wr_valid),
        .re                 (tx_wr_ready),
        .dout               ({tx_wr_hdr, tx_data}),
        .empty              (tx_wr_fifo_empty),
        .valid              (tx_wr_valid),
        .full               (tx_wr_fifo_full),
        .count              (),
        .almostfull         ()
    );
// Track All Write requests that are finished
always@(posedge clk) begin
	if( ~rst_n  | (ch_status_state == CHANNEL_IDLE_STATE) )begin
		writes_sent <= 0;
		writes_done <= 0;
	end
	else begin
       writes_sent <= (tx_wr_valid & tx_wr_ready)? (writes_sent + 1'b1) : writes_sent;
       writes_done <= (rx_wr_valid_reg)? (writes_done + 1'b1) : writes_done;
	end
end
// communicate with the scheduler
assign flush_cmd = (ch_status_state == CHANNEL_DONE_STATE);
// cmd_line
always@(posedge clk) begin
    if(~cmd_buff_valid) begin
        cmd_buff       <= reserved_cmd;
    end
end
// valid
always@(posedge clk) begin
	if(~rst_n) begin
		cmd_buff_valid <= 1'b0;
	end
	else if(flush_cmd) begin
		cmd_buff_valid <= 1'b0;
    end
    else if(reserved_cmd_valid & (ch_status_state == CHANNEL_IDLE_STATE)) begin
        cmd_buff_valid <= 1'b1;
    end
end
// reserved cmd
// cmd_line
always@(posedge clk) begin
    if(~reserved_cmd_valid) begin
        reserved_cmd       <= cmd_line;
    end
end
// valid
always@(posedge clk) begin
    if(~rst_n) begin
        reserved_cmd_valid <= 1'b0;
    end
    else if(read_reserved_cmd) begin
        reserved_cmd_valid <= 1'b0;
    end
    else if(cmd_valid) begin
        reserved_cmd_valid <= 1'b1;
    end
end
assign read_reserved_cmd = reserved_cmd_valid & (ch_status_state == CHANNEL_IDLE_STATE);
always@(posedge clk) begin
    if(~rst_n) begin
        ch_status_state              <= 3'b0;
        set_wr_if_direct_pipelined   <= 0;
        set_wr_if_mem_pipelined      <= 0;
        wr_mem_pipeline_addr         <= 0;
        set_rd_if_direct_pipelined   <= 0;
        set_rd_if_mem_pipelined      <= 0;
        rd_mem_pipeline_addr         <= 0;
        rd_mem_pipeline_addr_code    <= 0;
        rd_direct_pipeline_addr_code <= 0;
        fthread_job_done             <= 0;
        start_d0                     <= 0;
        rif_done                     <= 0;
        wif_done                     <= 0;
        config_param_line            <= 0;
        run_rd_tx                    <= 0;
        run_wr_tx                    <= 0;
        ft_tx_wr_valid      <= 0;
        ft_tx_data          <= 0;
        ft_tx_wr_addr       <= 0;
        ft_tx_wr_tag        <= 0;
        ft_tx_rd_valid      <= 0;
        ft_tx_rd_addr       <= 0;
        ft_tx_rd_tag        <= 0;
    end
    else begin
        case (ch_status_state)
            CHANNEL_IDLE_STATE: begin
                /* If a valid job request is available in the command buffer, then we issue a status update that the job is starting
                and compute some necessary flags for the configuration of the FThread Controller */
                ft_tx_wr_valid    <= 1'b0;
                fthread_job_done  <= 0;
                start_d0          <= 0;
                ft_tx_rd_valid    <= 0;
                rif_done          <= 0;
                wif_done          <= 0;
                if(cmd_buff_valid) begin
                    // Go to start state, set some flags
                    ch_status_state              <= CHANNEL_STARTING_STATE;
                    // WR IF Config
                    set_wr_if_direct_pipelined   <= (cmd_buff[121:120] == `WR_IF_DIRECT_PIPELINE_CODE);
                    set_wr_if_mem_pipelined      <= (cmd_buff[121:120] == `WR_IF_MEM_PIPELINE_CODE);
                    wr_mem_pipeline_addr         <= cmd_buff[179:122];
                    // RD IF Config
                    set_rd_if_direct_pipelined   <= cmd_buff[180];
                    set_rd_if_mem_pipelined      <= cmd_buff[181];
                    rd_mem_pipeline_addr         <= cmd_buff[239:182];
                    rd_mem_pipeline_addr_code    <= cmd_buff[243:240];
                    rd_direct_pipeline_addr_code <= cmd_buff[247:244];
                    // write fthread status as starting to the SW to see.
                    ft_tx_wr_valid      <= 1'b1;
                    ft_tx_data          <= {um_state_counters[255:0], ReadyCycles, ReadCycles, finishCycles, ConfigCycles, exeCycles, WrReqCnt, RdReqCnt, 29'b0, CHANNEL_STARTING_STATE};
                    ft_tx_wr_addr       <= cmd_buff[57:0];
                    ft_tx_wr_tag        <= 0;
                end
            end
            CHANNEL_STARTING_STATE: begin
                /* This state is just a stopby state until the starting status update request is sent to memory*/
                if(ft_tx_wr_ready) begin
                    ch_status_state   <= CHANNEL_CONFIG_STATE;
                    ft_tx_wr_valid    <= 1'b0;
                end
            end
            CHANNEL_CONFIG_STATE: begin
                /* During this state the Config struct reader is started to read the user AFU configuration data structure.
                When the configuration is obtained we switch to the Run state and trigger the user AFU*/
                if (afu_config_struct_valid) begin
                    ch_status_state     <= CHANNEL_RUN_STATE;
                    start_d0            <= 1'b1;
                    run_rd_tx           <= 1'b1;
                    run_wr_tx           <= 1'b1;
                end
                config_param_line       <= afu_config_struct;
                if(ft_tx_rd_ready) begin
                    ft_tx_rd_valid <= cfg_tx_rd_valid;
                    ft_tx_rd_addr  <= cfg_tx_rd_addr;
                    ft_tx_rd_tag   <= {1'b0, cfg_tx_rd_tag};
                end
            end
            CHANNEL_RUN_STATE: begin
                /* In this state the user AFU is active, we stay in this state until the user declares it finished processing and producing
                all the results. Then we move to the Drain WR FIFO state, to make sure all user generated write requests are submitted to
                memory*/
                start_d0 <= 1'b0;
                if(um_done) begin
                    ch_status_state   <= CHANNEL_DRAIN_WR_FIFO_STATE;
                    config_param_line <= 0;
                    wif_done          <= 1'b1;
                    rif_done          <= 1'b1;
                    set_rd_if_direct_pipelined   <= 0;
                    set_rd_if_mem_pipelined      <= 0;
                    rd_mem_pipeline_addr         <= 0;
                    rd_mem_pipeline_addr_code    <= 0;
                    rd_direct_pipeline_addr_code <= 0;
                end
                // TX RD
                if(ft_tx_rd_ready) begin
                    if(wif_tx_rd_valid) begin
                        ft_tx_rd_valid <= 1'b1;
                        ft_tx_rd_addr  <= wif_tx_rd_addr;
                        ft_tx_rd_tag   <= {1'b0, wif_tx_rd_tag};
                    end
                    else begin
                        ft_tx_rd_valid <= usr_arb_tx_rd_valid;
                        ft_tx_rd_addr  <= usr_arb_tx_rd_addr;
                        ft_tx_rd_tag   <= {1'b1, usr_arb_tx_rd_tag};
                    end
                end
                // TX WR
                if(ft_tx_wr_ready) begin
                    if(rif_tx_wr_valid) begin
                        ft_tx_wr_valid <= 1'b1;
                        ft_tx_wr_addr  <= rif_tx_wr_addr;
                        ft_tx_wr_tag   <= {1'b0, rif_tx_wr_tag};
                        ft_tx_data     <= rif_tx_data;
                    end
                    else begin
                        ft_tx_wr_valid <= usr_arb_tx_wr_valid;
                        ft_tx_wr_addr  <= usr_arb_tx_wr_addr;
                        ft_tx_wr_tag   <= {1'b1, usr_arb_tx_wr_tag};
                        ft_tx_data     <= usr_arb_tx_data;
                    end
                end
            end
            CHANNEL_DRAIN_WR_FIFO_STATE: begin
                /* In this state we make sure all the write requests in the different FIFOs are submitted to memory*/
                if (user_tx_wr_if_empty & tx_wr_fifo_empty & ~ft_tx_wr_valid) begin
                    ch_status_state     <= CHANNEL_WRFENCE_STATE;
                end
                if(tx_wr_fifo_empty) begin
                    set_wr_if_direct_pipelined   <= 0;
                    set_wr_if_mem_pipelined      <= 0;
                    wr_mem_pipeline_addr         <= 0;
                end
                // TX RD
                if(ft_tx_rd_ready) begin
                    ft_tx_rd_valid <= wif_tx_rd_valid;
                    ft_tx_rd_addr  <= wif_tx_rd_addr;
                    ft_tx_rd_tag   <= {1'b0, wif_tx_rd_tag};
                end
                // TX WR
                if(ft_tx_wr_ready) begin
                    if(rif_tx_wr_valid) begin
                        ft_tx_wr_valid <= 1'b1;
                        ft_tx_wr_addr  <= rif_tx_wr_addr;
                        ft_tx_wr_tag   <= {1'b0, rif_tx_wr_tag};
                        ft_tx_data     <= rif_tx_data;
                    end
                    else begin
                        ft_tx_wr_valid <= usr_arb_tx_wr_valid;
                        ft_tx_wr_addr  <= usr_arb_tx_wr_addr;
                        ft_tx_wr_tag   <= {1'b1, usr_arb_tx_wr_tag};
                        ft_tx_data     <= usr_arb_tx_data;
                    end
                end
            end
            CHANNEL_WRFENCE_STATE: begin
                run_rd_tx                    <= 0;
                run_wr_tx                    <= 0;
                if (writes_sent == writes_done) begin
                    ch_status_state   <= CHANNEL_DONE_STATE;
                    ft_tx_wr_valid      <= 1'b1;
                    ft_tx_data          <= {um_state_counters[255:0], ReadyCycles, ReadCycles, finishCycles, ConfigCycles, exeCycles, WrReqCnt, RdReqCnt, 29'b0, CHANNEL_DONE_STATE};
                    ft_tx_wr_addr       <= cmd_buff[57:0];
                    ft_tx_wr_tag        <= 0;
                end
            end
            CHANNEL_DONE_STATE: begin
                if(ft_tx_wr_ready) begin
                    ch_status_state   <= CHANNEL_DONE_RESP_STATE;
                    ft_tx_wr_valid    <= 1'b0;
                end
            end
            CHANNEL_DONE_RESP_STATE: begin
                if(rx_wr_valid_reg) begin
                    ch_status_state   <= CHANNEL_IDLE_STATE;
                    fthread_job_done  <= 1'b1;
                end
            end
        endcase
    end
end
assign ft_tx_rd_ready      = ~tx_rd_fifo_full;
assign wif_tx_rd_ready     = ft_tx_rd_ready & run_rd_tx;
assign usr_arb_tx_rd_ready = ft_tx_rd_ready & run_rd_tx & ~wif_tx_rd_valid;
assign cfg_tx_rd_ready     = ft_tx_rd_ready;
assign ft_tx_wr_ready      = ~tx_wr_fifo_full;
assign rif_tx_wr_ready     = ft_tx_wr_ready & run_wr_tx;
assign usr_arb_tx_wr_ready = ft_tx_wr_ready & run_wr_tx & ~rif_tx_wr_valid;
ReadConfigStruct #(.MAX_NUM_CONFIG_CL(MAX_NUM_CONFIG_CL))
     ReadConfigStruct (
    .clk                       (clk),
    .rst_n                     (rst_n & ~(ch_status_state == CHANNEL_DONE_RESP_STATE)),
    .get_config_struct         ( ch_status_state == CHANNEL_CONFIG_STATE ),
    .base_addr                 (cmd_buff[115:58]),
    .config_struct_length      ( {28'b0, cmd_buff[119:116]}),
    // User Module TX RD
    .cs_tx_rd_addr             (cfg_tx_rd_addr),
    .cs_tx_rd_tag              (cfg_tx_rd_tag),
    .cs_tx_rd_valid            (cfg_tx_rd_valid),
    .cs_tx_rd_free             (cfg_tx_rd_ready),
    // User Module RX RD
    .cs_rx_rd_tag              (cfg_rx_rd_tag),
    .cs_rx_rd_data             (cfg_rx_data),
    .cs_rx_rd_valid            (cfg_rx_rd_valid),
    .afu_config_struct         (afu_config_struct),
    .afu_config_struct_valid   (afu_config_struct_valid)
);
always@(posedge clk) begin
	um_params        <= config_param_line;
end
always@(posedge clk) begin
	if( ~rst_n) begin
		start_um         <= 0;
	end
	else begin
		start_um         <= start_d0;
	end
end
//assign um_params        = config_param_line;
assign reset_user_logic = (ch_status_state == CHANNEL_IDLE_STATE);
// RD Interface
user_tx_rd_if #(.USER_TAG(USER_RD_TAG))
user_tx_rd_if(
    .clk                                (clk),
    .rst_n                              (rst_n),
    .reset_interface                    ( (ch_status_state == CHANNEL_IDLE_STATE) ),
    .set_if_mem_pipelined               (set_rd_if_mem_pipelined),
    .set_if_direct_pipelined            (set_rd_if_direct_pipelined),
    .mem_pipeline_addr                  (rd_mem_pipeline_addr),
    .mem_pipeline_addr_code             (rd_mem_pipeline_addr_code),
    .direct_pipeline_addr_code          (rd_direct_pipeline_addr_code),
    .reads_finished                     (rif_done),
    // User Module TX RD
    .um_tx_rd_addr                      (um_tx_rd_addr),
    .um_tx_rd_tag                       (um_tx_rd_tag),
    .um_tx_rd_valid                     (um_tx_rd_valid),
    .um_tx_rd_ready                     (um_tx_rd_ready),
    // User Module RX RD
    .um_rx_rd_tag                       (um_rx_rd_tag),
    .um_rx_data                         (um_rx_data),
    .um_rx_rd_valid                     (um_rx_rd_valid),
    .um_rx_rd_ready                     (um_rx_rd_ready),
    .usr_arb_tx_rd_valid                (usr_arb_tx_rd_valid),
    .usr_arb_tx_rd_addr                 (usr_arb_tx_rd_addr),
    .usr_arb_tx_rd_tag                  (usr_arb_tx_rd_tag),
    .usr_arb_tx_rd_ready                (usr_arb_tx_rd_ready),
    .usr_arb_rx_rd_valid                (usr_arb_rx_rd_valid),
    .usr_arb_rx_rd_tag                  (usr_arb_rx_rd_tag),
    .usr_arb_rx_data                    (usr_arb_rx_data),
    .rif_tx_wr_addr                     (rif_tx_wr_addr),
    .rif_tx_wr_tag                      (rif_tx_wr_tag),
    .rif_tx_wr_valid                    (rif_tx_wr_valid),
    .rif_tx_data                        (rif_tx_data),
    .rif_tx_wr_ready                    (rif_tx_wr_ready),
    .rif_rx_wr_tag                      (rif_rx_wr_tag),
    .rif_rx_wr_valid                    (rif_rx_wr_valid),
    .usr_pipe_tx_rd_valid               (left_pipe_tx_rd_valid),
    .usr_pipe_tx_rd_tag                 (left_pipe_tx_rd_tag),
    .usr_pipe_tx_rd_ready               (left_pipe_tx_rd_ready),
    .usr_pipe_rx_rd_valid               (left_pipe_rx_rd_valid),
    .usr_pipe_rx_rd_tag                 (left_pipe_rx_rd_tag),
    .usr_pipe_rx_data                   (left_pipe_rx_data),
    .usr_pipe_rx_rd_ready               (left_pipe_rx_rd_ready)
);
// WR Interface
user_tx_wr_if #(.USER_TAG(USER_WR_TAG) )
user_tx_wr_if(
    .clk                                (clk),
    .rst_n                              (rst_n),
    .reset_interface                    ( (ch_status_state == CHANNEL_IDLE_STATE) ),
    .set_if_pipelined                   (set_wr_if_direct_pipelined),
    .user_tx_wr_if_empty                (user_tx_wr_if_empty),
    .set_if_mem_pipelined               (set_wr_if_mem_pipelined),
    .mem_pipeline_addr                  (wr_mem_pipeline_addr),
    .writes_finished                    (wif_done),
    // User Module TX WR
    .um_tx_wr_addr                      (um_tx_wr_addr),
    .um_tx_wr_tag                       (um_tx_wr_tag),
    .um_tx_wr_valid                     (um_tx_wr_valid),
    .um_tx_data                         (um_tx_data),
    .um_tx_wr_ready                     (um_tx_wr_ready),
    // User Module RX WR
    .um_rx_wr_valid                     (um_rx_wr_valid),
    .um_rx_wr_tag                       (um_rx_wr_tag),
    .usr_arb_tx_wr_valid                (usr_arb_tx_wr_valid),
    .usr_arb_tx_wr_addr                 (usr_arb_tx_wr_addr),
    .usr_arb_tx_wr_tag                  (usr_arb_tx_wr_tag),
    .usr_arb_tx_wr_ready                (usr_arb_tx_wr_ready),
    .usr_arb_tx_data                    (usr_arb_tx_data),
    .usr_arb_rx_wr_valid                (usr_arb_rx_wr_valid),
    .usr_arb_rx_wr_tag                  (usr_arb_rx_wr_tag),
    .wif_tx_rd_addr                     (wif_tx_rd_addr),
    .wif_tx_rd_tag                      (wif_tx_rd_tag),
    .wif_tx_rd_valid                    (wif_tx_rd_valid),
    .wif_tx_rd_ready                    (wif_tx_rd_ready),
    .wif_rx_rd_tag                      (wif_rx_rd_tag),
    .wif_rx_data                        (wif_rx_data),
    .wif_rx_rd_valid                    (wif_rx_rd_valid),
    .usr_pipe_tx_rd_valid               (right_pipe_tx_rd_valid),
    .usr_pipe_tx_rd_tag                 (right_pipe_tx_rd_tag),
    .usr_pipe_tx_rd_ready               (right_pipe_tx_rd_ready),
    .usr_pipe_rx_rd_valid               (right_pipe_rx_rd_valid),
    .usr_pipe_rx_rd_tag                 (right_pipe_rx_rd_tag),
    .usr_pipe_rx_data                   (right_pipe_rx_data),
    .usr_pipe_rx_rd_ready               (right_pipe_rx_rd_ready)
);
always@(posedge clk) begin
    if(~rst_n | (ch_status_state == CHANNEL_IDLE_STATE)) begin
        RdReqCnt     <= 32'b0;
        GRdReqCnt    <= 32'b0;
        WrReqCnt     <= 32'b0;
        exeCycles    <= 32'b0;
        finishCycles <= 32'b0;
        ConfigCycles <= 32'b0;
        ReadCycles   <= 0;
        ReadyCycles  <= 0;
    end
    else begin
        exeCycles <= exeCycles + 1'b1;
        if(tx_rd_valid & tx_rd_ready) begin
            GRdReqCnt  <= GRdReqCnt + 1'b1;
        end
        if(um_tx_rd_valid & um_tx_rd_ready) begin
            RdReqCnt  <= RdReqCnt + 1'b1;
        end
        if(um_tx_wr_valid & um_tx_wr_ready) begin
            WrReqCnt  <= WrReqCnt + 1'b1;
        end
        if( ch_status_state[2] ) begin
            finishCycles <= finishCycles + 1'b1;
        end
        if(ch_status_state == CHANNEL_CONFIG_STATE) begin
            ConfigCycles <= ConfigCycles + 1'b1;
        end
        if(um_tx_rd_valid) begin
           ReadCycles <= ReadCycles + 1'b1;
        end
        if(tx_rd_ready) begin
       ReadyCycles <= ReadyCycles + 1'b1;
        end
    end
end
endmodule