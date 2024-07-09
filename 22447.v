module instantiation
  localparam [1:0] ST_BUFFBYPASS_TX_IDLE                 = 2'd0;
  localparam [1:0] ST_BUFFBYPASS_TX_DEASSERT_TXDLYSRESET = 2'd1;
  localparam [1:0] ST_BUFFBYPASS_TX_WAIT_TXSYNCDONE      = 2'd2;
  localparam [1:0] ST_BUFFBYPASS_TX_DONE                 = 2'd3;
  generate if (1) begin: gen_gtwiz_buffbypass_tx_main
    // Use auto mode buffer bypass
    if (P_BUFFER_BYPASS_MODE == 0) begin : gen_auto_mode
      // For single-lane auto mode buffer bypass, perform specified input port tie-offs
      if (P_TOTAL_NUMBER_OF_CHANNELS == 1) begin : gen_assign_one_chan
        assign txphdlyreset_out  = 1'b0;
        assign txphalign_out     = 1'b0;
        assign txphalignen_out   = 1'b0;
        assign txphdlypd_out     = 1'b0;
        assign txphinit_out      = 1'b0;
        assign txphovrden_out    = 1'b0;
        assign txdlybypass_out   = 1'b0;
        assign txdlyen_out       = 1'b0;
        assign txdlyovrden_out   = 1'b0;
        assign txphdlytstclk_out = 1'b0;
        assign txdlyhold_out     = 1'b0;
        assign txdlyupdown_out   = 1'b0;
        assign txsyncmode_out    = 1'b1;
        assign txsyncallin_out   = txphaligndone_in;
        assign txsyncin_out      = 1'b0;
      end
      // For multi-lane auto mode buffer bypass, perform specified master and slave lane input port tie-offs
      else begin : gen_assign_multi_chan
        assign txphdlyreset_out  = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txphalign_out     = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txphalignen_out   = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txphdlypd_out     = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txphinit_out      = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txphovrden_out    = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txdlybypass_out   = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txdlyen_out       = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txdlyovrden_out   = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txphdlytstclk_out = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txdlyhold_out     = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        assign txdlyupdown_out   = {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
        genvar gi;
        for (gi = 0; gi < P_TOTAL_NUMBER_OF_CHANNELS; gi = gi + 1) begin : gen_assign_txsyncmode
          if (gi == P_MASTER_CHANNEL_POINTER)
            assign txsyncmode_out[gi] = 1'b1;
          else
            assign txsyncmode_out[gi] = 1'b0;
        end
        assign txsyncallin_out = {P_TOTAL_NUMBER_OF_CHANNELS{&txphaligndone_in}};
        assign txsyncin_out    = {P_TOTAL_NUMBER_OF_CHANNELS{txsyncout_in[P_MASTER_CHANNEL_POINTER]}};
      end
      // Detect the rising edge of the transmitter reset done re-synchronized input. Assign an internal buffer bypass
      // start signal to the OR of this reset done indicator, and the synchronous buffer bypass procedure user request.
      wire gtwiz_buffbypass_tx_resetdone_sync_int;
      gtwizard_ultrascale_v1_7_1_reset_inv_synchronizer reset_synchronizer_resetdone_inst (
        .clk_in  (gtwiz_buffbypass_tx_clk_in),
        .rst_in  (gtwiz_buffbypass_tx_resetdone_in),
        .rst_out (gtwiz_buffbypass_tx_resetdone_sync_int)
      );
      reg  gtwiz_buffbypass_tx_resetdone_reg = 1'b0;
      wire gtwiz_buffbypass_tx_start_int;
      always @(posedge gtwiz_buffbypass_tx_clk_in) begin
        if (gtwiz_buffbypass_tx_reset_in)
          gtwiz_buffbypass_tx_resetdone_reg <= 1'b0;
        else
          gtwiz_buffbypass_tx_resetdone_reg <= gtwiz_buffbypass_tx_resetdone_sync_int;
      end
      assign gtwiz_buffbypass_tx_start_int = (gtwiz_buffbypass_tx_resetdone_sync_int &&
                                             ~gtwiz_buffbypass_tx_resetdone_reg) || gtwiz_buffbypass_tx_start_user_in;
      // Synchronize the master channel's buffer bypass completion output (TXSYNCDONE) into the local clock domain
      // and detect its rising edge for purposes of safe state machine transitions
      reg  gtwiz_buffbypass_tx_master_syncdone_sync_reg = 1'b0;
      wire gtwiz_buffbypass_tx_master_syncdone_sync_int;
      wire gtwiz_buffbypass_tx_master_syncdone_sync_re;
      gtwizard_ultrascale_v1_7_1_bit_synchronizer bit_synchronizer_master_syncdone_inst (
        .clk_in (gtwiz_buffbypass_tx_clk_in),
        .i_in   (txsyncdone_in[P_MASTER_CHANNEL_POINTER]),
        .o_out  (gtwiz_buffbypass_tx_master_syncdone_sync_int)
      );
      always @(posedge gtwiz_buffbypass_tx_clk_in)
        gtwiz_buffbypass_tx_master_syncdone_sync_reg <= gtwiz_buffbypass_tx_master_syncdone_sync_int;
      assign gtwiz_buffbypass_tx_master_syncdone_sync_re = gtwiz_buffbypass_tx_master_syncdone_sync_int &&
                                                          ~gtwiz_buffbypass_tx_master_syncdone_sync_reg;
      // Synchronize the master channel's phase alignment completion output (TXPHALIGNDONE) into the local clock domain
      wire gtwiz_buffbypass_tx_master_phaligndone_sync_int;
      gtwizard_ultrascale_v1_7_1_bit_synchronizer bit_synchronizer_master_phaligndone_inst (
        .clk_in (gtwiz_buffbypass_tx_clk_in),
        .i_in   (txphaligndone_in[P_MASTER_CHANNEL_POINTER]),
        .o_out  (gtwiz_buffbypass_tx_master_phaligndone_sync_int)
      );
      // Implement a simple state machine to perform the transmitter auto mode buffer bypass procedure
      reg [1:0] sm_buffbypass_tx = ST_BUFFBYPASS_TX_IDLE;
      always @(posedge gtwiz_buffbypass_tx_clk_in) begin
        if (gtwiz_buffbypass_tx_reset_in) begin
          gtwiz_buffbypass_tx_done_out  <= 1'b0;
          gtwiz_buffbypass_tx_error_out <= 1'b0;
          txdlysreset_out               <= {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
          sm_buffbypass_tx              <= ST_BUFFBYPASS_TX_IDLE;
        end
        else begin
          case (sm_buffbypass_tx)
            // Upon assertion of the internal buffer bypass start signal, assert TXDLYSRESET output(s)
            default: begin
              if (gtwiz_buffbypass_tx_start_int) begin
                gtwiz_buffbypass_tx_done_out  <= 1'b0;
                gtwiz_buffbypass_tx_error_out <= 1'b0;
                txdlysreset_out               <= {P_TOTAL_NUMBER_OF_CHANNELS{1'b1}};
                sm_buffbypass_tx              <= ST_BUFFBYPASS_TX_DEASSERT_TXDLYSRESET;
              end
            end
            // De-assert the TXDLYSRESET output(s)
            ST_BUFFBYPASS_TX_DEASSERT_TXDLYSRESET: begin
              txdlysreset_out  <= {P_TOTAL_NUMBER_OF_CHANNELS{1'b0}};
              sm_buffbypass_tx <= ST_BUFFBYPASS_TX_WAIT_TXSYNCDONE;
            end
            // Upon assertion of the synchronized TXSYNCDONE indicator, transition to the final state
            ST_BUFFBYPASS_TX_WAIT_TXSYNCDONE: begin
              if (gtwiz_buffbypass_tx_master_syncdone_sync_re)
                sm_buffbypass_tx <= ST_BUFFBYPASS_TX_DONE;
            end
            // Assert the buffer bypass procedure done user indicator, and set the procedure error flag if the
            // synchronized TXPHALIGNDONE indicator is not high
            ST_BUFFBYPASS_TX_DONE: begin
              gtwiz_buffbypass_tx_done_out  <= 1'b1;
              gtwiz_buffbypass_tx_error_out <= ~gtwiz_buffbypass_tx_master_phaligndone_sync_int;
              sm_buffbypass_tx              <= ST_BUFFBYPASS_TX_IDLE;
            end
          endcase
        end
      end
    end
  end
  endgenerate
endmodule