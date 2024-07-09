module mapped to output ports:
 assign RETRY_COUNTER     = retry_counter_int;
 assign RUN_PHALIGNMENT   = run_phase_alignment_int;
 assign TX_FSM_RESET_DONE = tx_fsm_reset_done_int;
 assign GTTXRESET = gttxreset_i;
  always @(posedge STABLE_CLOCK or posedge SOFT_RESET)
  begin
      // The counter starts running when configuration has finished and
      // the clock is stable. When its maximum count-value has been reached,
      // the 500 ns from Answer Record 43482 have been passed.
     if(SOFT_RESET)
      begin
          init_wait_count <= `DLY 8'h0;
          init_wait_done  <= `DLY 1'b0;
      end
      else if (init_wait_count == WAIT_MAX)
          init_wait_done <= `DLY  1'b1;
      else
        init_wait_count <= `DLY  init_wait_count + 1;
   end
  always @(posedge STABLE_CLOCK)
  begin
      // One common large counter for generating three time-out signals.
      // Intermediate time-outs are derived from calculated values, based
      // on the period of the provided clock.
      if (reset_time_out == 1'b1)
      begin
        time_out_counter  <= `DLY  0;
        time_out_2ms      <= `DLY  1'b0;
        time_tlock_max    <= `DLY  1'b0;
        time_out_500us    <= `DLY  1'b0;
      end
      else
      begin
        if (time_out_counter == WAIT_TIMEOUT_2ms)
          time_out_2ms <= `DLY  1'b1;
        else
          time_out_counter <= `DLY  time_out_counter + 1;
        if (time_out_counter == WAIT_TLOCK_MAX)
          time_tlock_max <= `DLY  1'b1;
        if (time_out_counter == WAIT_TIMEOUT_500us)
          time_out_500us <= `DLY  1'b1;
      end
  end
  always @(posedge STABLE_CLOCK)
  begin
      if (mmcm_lock_i == 1'b0)
      begin
        mmcm_lock_count <= `DLY  0;
        mmcm_lock_reclocked   <= `DLY  1'b0;
      end
      else
      begin
        if (mmcm_lock_count < MMCM_LOCK_CNT_MAX - 1)
          mmcm_lock_count <= `DLY  mmcm_lock_count + 1;
        else
          mmcm_lock_reclocked <= `DLY  1'b1;
      end
  end
  //Clock Domain Crossing
 srio_gen2_0_sync_block sync_run_phase_alignment_int
        (
           .clk             (TXUSERCLK),
           .data_in         (run_phase_alignment_int),
           .data_out        (run_phase_alignment_int_s2)
        );
 srio_gen2_0_sync_block sync_tx_fsm_reset_done_int
        (
           .clk             (TXUSERCLK),
           .data_in         (tx_fsm_reset_done_int),
           .data_out        (tx_fsm_reset_done_int_s2)
        );
  always @(posedge TXUSERCLK)
  begin
     run_phase_alignment_int_s3 <= `DLY run_phase_alignment_int_s2;
     tx_fsm_reset_done_int_s3   <= `DLY tx_fsm_reset_done_int_s2;
  end
srio_gen2_0_sync_block sync_time_out_wait_bypass
        (
           .clk             (STABLE_CLOCK),
           .data_in         (time_out_wait_bypass),
           .data_out        (time_out_wait_bypass_s2)
        );
 srio_gen2_0_sync_block sync_TXRESETDONE
        (
           .clk             (STABLE_CLOCK),
           .data_in         (TXRESETDONE),
           .data_out        (txresetdone_s2)
        );
 srio_gen2_0_sync_block sync_mmcm_lock_reclocked
        (
           .clk             (STABLE_CLOCK),
           .data_in         (MMCM_LOCK),
           .data_out        (mmcm_lock_i)
        );
 srio_gen2_0_sync_block sync_cplllock
        (
           .clk             (STABLE_CLOCK),
           .data_in         (CPLLLOCK),
           .data_out        (cplllock_sync)
        );
 srio_gen2_0_sync_block sync_qplllock
        (
           .clk             (STABLE_CLOCK),
           .data_in         (QPLLLOCK),
           .data_out        (qplllock_sync)
        );
  always @(posedge STABLE_CLOCK)
  begin
     time_out_wait_bypass_s3   <= `DLY time_out_wait_bypass_s2;
     txresetdone_s3            <= `DLY txresetdone_s2;
  end
  always @(posedge TXUSERCLK)
  begin
      if (run_phase_alignment_int_s3 == 1'b0)
      begin
        wait_bypass_count     <= `DLY  0;
        time_out_wait_bypass  <= `DLY  1'b0;
      end
      else if (run_phase_alignment_int_s3 == 1'b1 && tx_fsm_reset_done_int_s3 == 1'b0)
      begin
        if (wait_bypass_count == MAX_WAIT_BYPASS - 1)
          time_out_wait_bypass <= `DLY  1'b1;
        else
          wait_bypass_count <= `DLY  wait_bypass_count + 1;
      end
  end
  assign refclk_lost = ( TX_QPLL_USED == "TRUE"  && QPLLREFCLKLOST == 1'b1) ? 1'b1 :
                       ( TX_QPLL_USED == "FALSE" && CPLLREFCLKLOST == 1'b1) ? 1'b1 : 1'b0;
  always @(posedge STABLE_CLOCK )
  begin
    if((tx_state == ASSERT_ALL_RESETS) |
       (tx_state == RELEASE_PLL_RESET) |
       (tx_state == RELEASE_MMCM_RESET))
    begin
        wait_time_cnt <= `DLY WAIT_TIME_MAX;
    end else if (wait_time_cnt != 16'h0)
    begin
        wait_time_cnt <= wait_time_cnt - 16'h1;
    end
  end
  assign wait_time_done = (wait_time_cnt == 16'h0);
  //FSM for resetting the GTX/GTH/GTP in the 7-series.
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Following steps are performed:
  // 1) Only for GTX - After configuration wait for approximately 500 ns as specified in
  //    answer-record 43482
  // 2) Assert all resets on the GT and on an MMCM potentially connected.
  //    After that wait until a reference-clock has been detected.
  // 3) Release the reset to the GT and wait until the GT-PLL has locked.
  // 4) Release the MMCM-reset and wait until the MMCM has signalled lock.
  //    Also signal to the RX-side which PLL has been reset.
  // 5) Wait for the RESET_DONE-signal from the GTX.
  // 6) Signal to start the phase-alignment procedure and wait for it to
  //    finish.
  // 7) Reset-sequence has successfully run through. Signal this to the
  //    rest of the design by asserting TX_FSM_RESET_DONE.
  always @(posedge STABLE_CLOCK)
  begin
      if (SOFT_RESET == 1'b1)
      //if (SOFT_RESET == 1'b1 || (tx_state != INIT && tx_state != ASSERT_ALL_RESETS && refclk_lost == 1'b1))
      begin
        tx_state                <= `DLY  INIT;
        TXUSERRDY               <= `DLY  1'b0;
        gttxreset_i             <= `DLY  1'b0;
        MMCM_RESET              <= `DLY  1'b0;
        tx_fsm_reset_done_int   <= `DLY  1'b0;
        QPLL_RESET              <= `DLY  1'b0;
        CPLL_RESET              <= `DLY  1'b0;
        pll_reset_asserted      <= `DLY  1'b0;
        reset_time_out          <= `DLY  1'b0;
        retry_counter_int       <= `DLY   0;
        run_phase_alignment_int <= `DLY  1'b0;
        RESET_PHALIGNMENT       <= `DLY  1'b1;
      end
      else
      begin
        case (tx_state)
           INIT :
           begin
            //Initial state after configuration. This state will be left after
            //approx. 500 ns and not be re-entered.
            if (init_wait_done == 1'b1)
              tx_state           <= `DLY  ASSERT_ALL_RESETS;
              reset_time_out     <= `DLY  1'b1;
           end
           ASSERT_ALL_RESETS :
           begin
            //This is the state into which the FSM will always jump back if any
            //time-outs will occur.
            //The number of retries is reported on the output RETRY_COUNTER. In
            //case the transceiver never comes up for some reason, this machine
            //will still continue its best and rerun until the FPGA is turned off
            //or the transceivers come up correctly.
            if (TX_QPLL_USED == "TRUE")
            begin
              if (pll_reset_asserted == 1'b0)
              begin
                QPLL_RESET          <= `DLY  1'b1;
                pll_reset_asserted  <= `DLY  1'b1;
              end
              else
                QPLL_RESET          <= `DLY  1'b0;
            end
            else
            begin
              if (pll_reset_asserted == 1'b0)
              begin
                CPLL_RESET <= `DLY  1'b1;
                pll_reset_asserted  <= `DLY  1'b1;
              end
              else
                CPLL_RESET          <= `DLY  1'b0;
            end
            TXUSERRDY               <= `DLY  1'b0;
            gttxreset_i             <= `DLY  1'b1;
            MMCM_RESET              <= `DLY  1'b1;
            reset_time_out          <= `DLY  1'b1;
            run_phase_alignment_int <= `DLY  1'b0;
            RESET_PHALIGNMENT       <= `DLY  1'b1;
            if ((TX_QPLL_USED == "TRUE" && qplllock_sync == 1'b0 && pll_reset_asserted ) ||
               (TX_QPLL_USED == "FALSE" && cplllock_sync == 1'b0 && pll_reset_asserted ))
              tx_state  <= `DLY  WAIT_FOR_PLL_LOCK;
           end
           WAIT_FOR_PLL_LOCK :
           begin
              if(wait_time_done)
                 tx_state        <= `DLY RELEASE_PLL_RESET;
           end
           RELEASE_PLL_RESET :
           begin
            //PLL-Reset of the GTX gets released and the time-out counter
            //starts running.
            pll_reset_asserted  <= `DLY  1'b0;
            reset_time_out  <= `DLY  1'b0;
            if ((TX_QPLL_USED == "TRUE" && qplllock_sync == 1'b1) ||
               (TX_QPLL_USED == "FALSE" && cplllock_sync == 1'b1))
           begin
              tx_state  <= `DLY  WAIT_FOR_TXOUTCLK;
              reset_time_out  <= `DLY  1'b1;
           end
            if (time_out_2ms == 1'b1)
            begin
                if (retry_counter_int == MAX_RETRIES)
                // If too many retries are performed compared to what is specified in
                // the generic, the counter simply wraps around.
                retry_counter_int <= `DLY  0;
                else
                retry_counter_int <= `DLY  retry_counter_int + 1;
              tx_state            <= `DLY  ASSERT_ALL_RESETS;
            end
           end
           WAIT_FOR_TXOUTCLK :
           begin
            gttxreset_i <= `DLY  1'b0;
              if(wait_time_done)
               tx_state <= `DLY RELEASE_MMCM_RESET;
           end
           RELEASE_MMCM_RESET :
           begin
            //Release of the MMCM-reset. Waiting for the MMCM to lock.
            MMCM_RESET <= `DLY  1'b0;
            reset_time_out  <= `DLY  1'b0;
            if (mmcm_lock_reclocked == 1'b1)
            begin
              tx_state <= `DLY  WAIT_FOR_TXUSRCLK;
              reset_time_out  <= `DLY  1'b1;
            end
            if (time_tlock_max == 1'b1 && mmcm_lock_reclocked == 1'b0 && reset_time_out == 1'b0)
            begin
              if (retry_counter_int == MAX_RETRIES)
                // If too many retries are performed compared to what is specified in
                // the generic, the counter simply wraps around.
                retry_counter_int <= `DLY  0;
              else
                retry_counter_int <= `DLY  retry_counter_int + 1;
              tx_state            <= `DLY  ASSERT_ALL_RESETS;
            end
           end
           WAIT_FOR_TXUSRCLK :
           begin
              if(wait_time_done)
               tx_state <= `DLY WAIT_RESET_DONE;
           end
           WAIT_RESET_DONE :
           begin
            TXUSERRDY   <= `DLY  1'b1;
            reset_time_out  <= `DLY  1'b0;
            if (txresetdone_s3 == 1'b1)
            begin
              tx_state      <= `DLY  DO_PHASE_ALIGNMENT;
              reset_time_out  <= `DLY  1'b1;
            end
            if (time_out_500us == 1'b1 && reset_time_out == 1'b0)
            begin
              if (retry_counter_int == MAX_RETRIES)
                // If too many retries are performed compared to what is specified in
                // the generic, the counter simply wraps around.
                retry_counter_int <= `DLY  0;
              else
                retry_counter_int <= `DLY  retry_counter_int + 1;
              tx_state            <= `DLY  ASSERT_ALL_RESETS;
            end
           end
           DO_PHASE_ALIGNMENT :
           begin
            //The direct handling of the signals for the Phase Alignment is done outside
            //this state-machine.
            RESET_PHALIGNMENT       <= `DLY  1'b0;
            run_phase_alignment_int <= `DLY  1'b1;
            reset_time_out          <= `DLY  1'b0;
            if (PHALIGNMENT_DONE == 1'b1)
              tx_state        <= `DLY  RESET_FSM_DONE;
            if (time_out_wait_bypass_s3 == 1'b1)
            begin
              if (retry_counter_int == MAX_RETRIES)
                // If too many retries are performed compared to what is specified in
                // the generic, the counter simply wraps around.
                retry_counter_int <= `DLY  0;
              else
                retry_counter_int <= `DLY   retry_counter_int + 1;
              tx_state            <= `DLY  ASSERT_ALL_RESETS;
            end
           end
           RESET_FSM_DONE :
           begin
            reset_time_out        <= `DLY  1'b1;
            tx_fsm_reset_done_int <= `DLY  1'b1;
           end
           default:
              tx_state            <= `DLY  INIT;
        endcase
      end
    end
endmodule