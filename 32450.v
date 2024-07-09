module instantiation
  localparam [1:0] ST_BUFFBYPASS_RX_IDLE                 = 2'd0;
  localparam [1:0] ST_BUFFBYPASS_RX_DEASSERT_RXDLYSRESET = 2'd1;
  localparam [1:0] ST_BUFFBYPASS_RX_WAIT_RXSYNCDONE      = 2'd2;
  localparam [1:0] ST_BUFFBYPASS_RX_DONE                 = 2'd3;
  generate if (1) begin: gen_gtwiz_buffbypass_rx_main
    // Use auto mode buffer bypass
    if (P_BUFFER_BYPASS_MODE == 0) begin : gen_auto_mode
      // For single-lane auto mode buffer bypass, perform specified input port tie-offs
      if (P_TOTAL_NUMBER_OF_CHANNELS == 1) begin : gen_assign_one_chan
        assign rxphdlyreset_out = 1'b0;
        assign rxphalign_out    = 1'b0;
        assign rxphalignen_out  = 1'b0;
        assign rxphdlypd_out    = 1'b0;
        assign rxphovrden_out   = 1'b0;
        assign rxdlybypass_out  = 1'b0;
        assign rxdlyen_out      = 1'b0;
        assign rxdlyovrden_out  = 1'b0;
        assign rxsyncmode_out   = 1'b1;
        assign rxsyncallin_out  = rxphaligndone_in;
        assign rxsyncin_out     = 1'b0;
      end
      // For multi-lane auto mode buffer bypass, perform specified master and slave lane input port tie-offs
      else begin : gen_assign_multi_chan
        assign rxphdlyreset_out = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign rxphalign_out    = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign rxphalignen_out  = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign rxphdlypd_out    = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign rxphovrden_out   = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign rxdlybypass_out  = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign rxdlyen_out      = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign rxdlyovrden_out  = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        genvar gi;
        for (gi = 0; gi < P_TOTAL_NUMBER_OF_CHANNELS; gi = gi + 1) begin : gen_assign_rxsyncmode
          if (gi == P_MASTER_CHANNEL_POINTER)
            assign rxsyncmode_out[gi] = 1'b1;
          else
            assign rxsyncmode_out[gi] = 1'b0;
        end
        assign rxsyncallin_out = {P_TOTAL_NUMBER_OF_CHANNELS{&rxphaligndone_in}};
        assign rxsyncin_out    = {P_TOTAL_NUMBER_OF_CHANNELS{rxsyncout_in[P_MASTER_CHANNEL_POINTER]}};
      end
      // Detect the rising edge of the receiver reset done re-synchronized input. Assign an internal buffer bypass
      // start signal to the OR of this reset done indicator, and the synchronous buffer bypass procedure user request.
      wire gtwiz_buffbypass_rx_resetdone_sync_int;
      gtwizard_ultrascale_v1_7_1_reset_inv_synchronizer reset_synchronizer_resetdone_inst (
        .clk_in  (gtwiz_buffbypass_rx_clk_in),
        .rst_in  (gtwiz_buffbypass_rx_resetdone_in),
        .rst_out (gtwiz_buffbypass_rx_resetdone_sync_int)
      );
      reg  gtwiz_buffbypass_rx_resetdone_reg = 1'b0;
      wire gtwiz_buffbypass_rx_start_int;
      always @(posedge gtwiz_buffbypass_rx_clk_in) begin
        if (gtwiz_buffbypass_rx_reset_in)
          gtwiz_buffbypass_rx_resetdone_reg <= 1'b0;
        else
          gtwiz_buffbypass_rx_resetdone_reg <= gtwiz_buffbypass_rx_resetdone_sync_int;
      end
      assign gtwiz_buffbypass_rx_start_int = (gtwiz_buffbypass_rx_resetdone_sync_int &&
                                             ~gtwiz_buffbypass_rx_resetdone_reg) || gtwiz_buffbypass_rx_start_user_in;
      // Synchronize the master channel's buffer bypass completion output (RXSYNCDONE) into the local clock domain
      // and detect its rising edge for purposes of safe state machine transitions
      reg  gtwiz_buffbypass_rx_master_syncdone_sync_reg = 1'b0;
      wire gtwiz_buffbypass_rx_master_syncdone_sync_int;
      wire gtwiz_buffbypass_rx_master_syncdone_sync_re;
      gtwizard_ultrascale_v1_7_1_bit_synchronizer bit_synchronizer_mastersyncdone_inst (
        .clk_in (gtwiz_buffbypass_rx_clk_in),
        .i_in   (rxsyncdone_in[P_MASTER_CHANNEL_POINTER]),
        .o_out  (gtwiz_buffbypass_rx_master_syncdone_sync_int)
      );
      always @(posedge gtwiz_buffbypass_rx_clk_in)
        gtwiz_buffbypass_rx_master_syncdone_sync_reg <= gtwiz_buffbypass_rx_master_syncdone_sync_int;
      assign gtwiz_buffbypass_rx_master_syncdone_sync_re = gtwiz_buffbypass_rx_master_syncdone_sync_int &&
                                                          ~gtwiz_buffbypass_rx_master_syncdone_sync_reg;
      // Synchronize the master channel's phase alignment completion output (RXPHALIGNDONE) into the local clock domain
      wire gtwiz_buffbypass_rx_master_phaligndone_sync_int;
      gtwizard_ultrascale_v1_7_1_bit_synchronizer bit_synchronizer_masterphaligndone_inst (
        .clk_in (gtwiz_buffbypass_rx_clk_in),
        .i_in   (rxphaligndone_in[P_MASTER_CHANNEL_POINTER]),
        .o_out  (gtwiz_buffbypass_rx_master_phaligndone_sync_int)
      );
      // Implement a simple state machine to perform the receiver auto mode buffer bypass procedure
      reg [1:0] sm_buffbypass_rx = ST_BUFFBYPASS_RX_IDLE;
      always @(posedge gtwiz_buffbypass_rx_clk_in) begin
        if (gtwiz_buffbypass_rx_reset_in) begin
          gtwiz_buffbypass_rx_done_out  <= 1'b0;
          gtwiz_buffbypass_rx_error_out <= 1'b0;
          rxdlysreset_out               <= {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
          sm_buffbypass_rx              <= ST_BUFFBYPASS_RX_IDLE;
        end
        else begin
          case (sm_buffbypass_rx)
            // Upon assertion of the internal buffer bypass start signal, assert RXDLYSRESET output(s)
            default: begin
              if (gtwiz_buffbypass_rx_start_int) begin
                gtwiz_buffbypass_rx_done_out  <= 1'b0;
                gtwiz_buffbypass_rx_error_out <= 1'b0;
                rxdlysreset_out               <= {P_TOTAL_NUMBER_OF_CHANNELS{1'b1}};
                sm_buffbypass_rx              <= ST_BUFFBYPASS_RX_DEASSERT_RXDLYSRESET;
              end
            end
            // De-assert the RXDLYSRESET output(s)
            ST_BUFFBYPASS_RX_DEASSERT_RXDLYSRESET: begin
              rxdlysreset_out  <= {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
              sm_buffbypass_rx <= ST_BUFFBYPASS_RX_WAIT_RXSYNCDONE;
            end
            // Upon assertion of the synchronized RXSYNCDONE indicator, transition to the final state
            ST_BUFFBYPASS_RX_WAIT_RXSYNCDONE: begin
              if (gtwiz_buffbypass_rx_master_syncdone_sync_re)
                sm_buffbypass_rx <= ST_BUFFBYPASS_RX_DONE;
            end
            // Assert the buffer bypass procedure done user indicator, and set the procedure error flag if the
            // synchronized RXPHALIGNDONE indicator is not high
            ST_BUFFBYPASS_RX_DONE: begin
              gtwiz_buffbypass_rx_done_out  <= 1'b1;
              gtwiz_buffbypass_rx_error_out <= ~gtwiz_buffbypass_rx_master_phaligndone_sync_int;
              sm_buffbypass_rx              <= ST_BUFFBYPASS_RX_IDLE;
            end
          endcase
        end
      end
    end
  end
  endgenerate
endmodule