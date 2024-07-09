module
  always @(posedge clk) begin
    ctrl_rden_r       <= ctrl_rden;
    phy_init_rden_r   <= phy_init_rden;
    phy_init_rden_r1  <= phy_init_rden_r;
    calib_rden_edge_r <= phy_init_rden_r & ~phy_init_rden_r1;
  end
  // Calibration shift register used for both Stage 3 and Stage 4 cal
  // (not strictly necessary for stage 4, but use as an additional check
  // to make sure we're checking for correct data on the right clock cycle)
  always @(posedge clkdiv)
    if (!calib_done[2])
      calib_rden_srl_a <= cal3_rden_srl_a;
    else
      calib_rden_srl_a <= cal4_rden_srl_a;
  // Flops for targetting of multi-cycle path in UCF
  genvar cal_rden_ff_i;
  generate
    for (cal_rden_ff_i = 0; cal_rden_ff_i < 5;
         cal_rden_ff_i = cal_rden_ff_i+1) begin: gen_cal_rden_dly
      FDRSE u_ff_cal_rden_dly
        (
         .Q   (calib_rden_srl_a_r[cal_rden_ff_i]),
         .C   (clkdiv),
         .CE  (1'b1),
         .D   (calib_rden_srl_a[cal_rden_ff_i]),
         .R   (1'b0),
         .S   (1'b0)
         ) /* synthesis syn_preserve = 1 */
           /* synthesis syn_replicate = 0 */;
    end
  endgenerate
  SRLC32E u_calib_rden_srl
    (
     .Q   (calib_rden_srl_out),
     .Q31 (),
     .A   (calib_rden_srl_a_r),
     .CE  (1'b1),
     .CLK (clk),
     .D   (calib_rden_edge_r)
     );
  FDRSE u_calib_rden_srl_out_r
    (
         .Q   (calib_rden_srl_out_r),
         .C   (clk),
         .CE  (1'b1),
         .D   (calib_rden_srl_out),
         .R   (1'b0),
         .S   (1'b0)
     ) /* synthesis syn_preserve = 1 */;
  // convert to CLKDIV domain. Two version are generated because we need
  // to be able to tell exactly which fast (clk) clock cycle the read
  // enable was asserted in. Only one of CALIB_DATA_VALID or
  // CALIB_DATA_VALID_STGD will be asserted for any given shift value
  always @(posedge clk)
    calib_rden_srl_out_r1 <= calib_rden_srl_out_r;
  always @(posedge clkdiv) begin
    calib_rden_valid      <= calib_rden_srl_out_r;
    calib_rden_valid_stgd <= calib_rden_srl_out_r1;
  end
  // Second set of delays chain, use for normal reads
  // input = RDEN from controller
  // Flops for targetting of multi-cycle path in UCF
  genvar rden_ff_i;
  generate
    for (rden_ff_i = 0; rden_ff_i < 5*DQS_WIDTH;
         rden_ff_i = rden_ff_i+1) begin: gen_rden_dly
      FDRSE u_ff_rden_dly
        (
         .Q   (rden_dly_r[rden_ff_i]),
         .C   (clkdiv),
         .CE  (1'b1),
         .D   (rden_dly[rden_ff_i]),
         .R   (1'b0),
         .S   (1'b0)
         ) /* synthesis syn_preserve = 1 */
           /* synthesis syn_replicate = 0 */;
    end
  endgenerate
  // NOTE: Comment this section explaining purpose of SRL's
  genvar rden_i;
  generate
    for (rden_i = 0; rden_i < DQS_WIDTH; rden_i = rden_i + 1) begin: gen_rden
      SRLC32E u_rden_srl
        (
         .Q   (rden_srl_out[rden_i]),
         .Q31 (),
         .A   ({rden_dly_r[(rden_i*5)+4],
                rden_dly_r[(rden_i*5)+3],
                rden_dly_r[(rden_i*5)+2],
                rden_dly_r[(rden_i*5)+1],
                rden_dly_r[(rden_i*5)]}),
         .CE  (1'b1),
         .CLK (clk),
         .D   (ctrl_rden_r)
         );
      FDRSE u_calib_rden_r
        (
         .Q   (calib_rden[rden_i]),
         .C   (clk),
         .CE  (1'b1),
         .D   (rden_srl_out[rden_i]),
         .R   (1'b0),
         .S   (1'b0)
         ) /* synthesis syn_preserve = 1 */;
    end
  endgenerate
  // indicates that current received data is the correct pattern. Check both
  // rising and falling data for first DQ in each DQS group. Note that
  // we're checking using a pipelined version of read data, so need to take
  // this inherent delay into account in determining final read valid delay
  // Data is written to the memory in the following order (first -> last):
  //   0x1, 0xE, 0xE, 0x1, 0x1, 0xE, 0x1, 0xE
  // Looking at the two LSb bits, expect data in sequence (in binary):
  //   bit[0]: 1, 0, 0, 1, 0, 1, 0, 1
  //   bit[1]: 0, 1, 1, 0, 1, 0, 1, 0
  // Check for the presence of the first 7 words, and compensate read valid
  // delay accordingly. Don't check last falling edge data, it may be
  // corrupted by the DQS tri-state glitch at end of read postamble
  // (glitch protection not yet active until stage 4 cal)
  always @(posedge clkdiv) begin
    rdd_rise_q1_r  <= rdd_rise_q1;
    rdd_fall_q1_r  <= rdd_fall_q1;
    rdd_rise_q2_r  <= rdd_rise_q2;
    rdd_fall_q2_r  <= rdd_fall_q2;
    rdd_rise_q1_r1 <= rdd_rise_q1_r;
    rdd_fall_q1_r1 <= rdd_fall_q1_r;
    // MIG 3.3: Added comparison for second bit in DQS group for stage 3 cal
    rdd_rise_q1_bit1_r  <= rdd_rise_q1_bit1;
    rdd_fall_q1_bit1_r  <= rdd_fall_q1_bit1;
    rdd_rise_q2_bit1_r  <= rdd_rise_q2_bit1;
    rdd_fall_q2_bit1_r  <= rdd_fall_q2_bit1;
    rdd_rise_q1_bit1_r1 <= rdd_rise_q1_bit1_r;
    rdd_fall_q1_bit1_r1 <= rdd_fall_q1_bit1_r;
  end
  always @(posedge clkdiv) begin
    // For the following sequence from memory:
    //   rise[0], fall[0], rise[1], fall[1]
    // if data is aligned out of fabric ISERDES:
    //   RDD_RISE_Q2 = rise[0]
    //   RDD_FALL_Q2 = fall[0]
    //   RDD_RISE_Q1 = rise[1]
    //   RDD_FALL_Q1 = fall[1]
    cal3_data_match <= ((rdd_rise_q2_r == 1) &&
                        (rdd_fall_q2_r == 0) &&
                        (rdd_rise_q1_r == 0) &&
                        (rdd_fall_q1_r == 1) &&
                        (rdd_rise_q2   == 0) &&
                        (rdd_fall_q2   == 1) &&
                        (rdd_rise_q1   == 0) &&
                        (rdd_rise_q2_bit1_r == 0) &&
                        (rdd_fall_q2_bit1_r == 1) &&
                        (rdd_rise_q1_bit1_r == 1) &&
                        (rdd_fall_q1_bit1_r == 0) &&
                        (rdd_rise_q2_bit1   == 1) &&
                        (rdd_fall_q2_bit1   == 0) &&
                        (rdd_rise_q1_bit1   == 1));
    // if data is staggered out of fabric ISERDES:
    //   RDD_RISE_Q1_R = rise[0]
    //   RDD_FALL_Q1_R = fall[0]
    //   RDD_RISE_Q2   = rise[1]
    //   RDD_FALL_Q2   = fall[1]
    cal3_data_match_stgd <= ((rdd_rise_q1_r1 == 1) &&
                             (rdd_fall_q1_r1 == 0) &&
                             (rdd_rise_q2_r  == 0) &&
                             (rdd_fall_q2_r  == 1) &&
                             (rdd_rise_q1_r  == 0) &&
                             (rdd_fall_q1_r  == 1) &&
                             (rdd_rise_q2    == 0) &&
                             (rdd_rise_q1_bit1_r1 == 0) &&
                             (rdd_fall_q1_bit1_r1 == 1) &&
                             (rdd_rise_q2_bit1_r  == 1) &&
                             (rdd_fall_q2_bit1_r  == 0) &&
                             (rdd_rise_q1_bit1_r  == 1) &&
                             (rdd_fall_q1_bit1_r  == 0) &&
                             (rdd_rise_q2_bit1    == 1));
  end
  assign cal3_rden_dly = cal3_rden_srl_a - CAL3_RDEN_SRL_DLY_DELTA;
  assign cal3_data_valid = (calib_rden_valid | calib_rden_valid_stgd);
  assign cal3_match_found
    = ((calib_rden_valid && cal3_data_match) ||
       (calib_rden_valid_stgd && cal3_data_match_stgd));
  // when calibrating, check to see which clock cycle (after the read is
  // issued) does the expected data pattern arrive. Record this result
  // NOTE: Can add error checking here in case valid data not found on any
  //  of the available pipeline stages
  always @(posedge clkdiv) begin
    if (rstdiv) begin
      cal3_rden_srl_a <= 5'bxxxxx;
      cal3_state      <= CAL3_IDLE;
      calib_done[2]   <= 1'b0;
      calib_err_2[0]  <= 1'b0;
      count_rden      <= {DQS_WIDTH{1'b0}};
      rden_dly        <= {5*DQS_WIDTH{1'b0}};
    end else begin
      case (cal3_state)
        CAL3_IDLE: begin
          count_rden <= {DQS_WIDTH{1'b0}};
          if (calib_start[2]) begin
            calib_done[2] <= 1'b0;
            cal3_state    <= CAL3_INIT;
          end
        end
        CAL3_INIT: begin
          cal3_rden_srl_a <= RDEN_BASE_DELAY;
          // let SRL pipe clear after loading initial shift value
          cal3_state      <= CAL3_RDEN_PIPE_CLR_WAIT;
        end
        CAL3_DETECT:
          if (cal3_data_valid)
            // if match found at the correct clock cycle
            if (cal3_match_found) begin
              // For simulation, load SRL addresses for all DQS with same value
              if (SIM_ONLY != 0) begin
                for (i = 0; i < DQS_WIDTH; i = i + 1) begin: loop_sim_rden_dly
                  rden_dly[(i*5)]   <= cal3_rden_dly[0];
                  rden_dly[(i*5)+1] <= cal3_rden_dly[1];
                  rden_dly[(i*5)+2] <= cal3_rden_dly[2];
                  rden_dly[(i*5)+3] <= cal3_rden_dly[3];
                  rden_dly[(i*5)+4] <= cal3_rden_dly[4];
                end
              end else begin
                rden_dly[(count_rden*5)]   <= cal3_rden_dly[0];
                rden_dly[(count_rden*5)+1] <= cal3_rden_dly[1];
                rden_dly[(count_rden*5)+2] <= cal3_rden_dly[2];
                rden_dly[(count_rden*5)+3] <= cal3_rden_dly[3];
                rden_dly[(count_rden*5)+4] <= cal3_rden_dly[4];
              end
              // Use for stage 4 calibration
              calib_rden_dly[(count_rden*5)]   <= cal3_rden_srl_a[0];
              calib_rden_dly[(count_rden*5)+1] <= cal3_rden_srl_a[1];
              calib_rden_dly[(count_rden*5)+2] <= cal3_rden_srl_a[2];
              calib_rden_dly[(count_rden*5)+3] <= cal3_rden_srl_a[3];
              calib_rden_dly[(count_rden*5)+4] <= cal3_rden_srl_a[4];
              cal3_state <= CAL3_DONE;
            end else begin
              // If we run out of stages to shift, without finding correct
              // result, the stop and assert error
              if (cal3_rden_srl_a == 5'b11111) begin
                calib_err_2[0] <= 1'b1;
                cal3_state   <= CAL3_IDLE;
              end else begin
                // otherwise, increase the shift value and try again
                cal3_rden_srl_a <= cal3_rden_srl_a + 1;
                cal3_state      <= CAL3_RDEN_PIPE_CLR_WAIT;
              end
            end
        // give additional time for RDEN_R pipe to clear from effects of
        // previous pipeline or IDELAY tap change
        CAL3_RDEN_PIPE_CLR_WAIT:
          if (calib_rden_pipe_cnt == 5'b00000)
              cal3_state <= CAL3_DETECT;
        CAL3_DONE: begin
          if ((count_rden == DQS_WIDTH-1) || (SIM_ONLY != 0)) begin
            calib_done[2] <= 1'b1;
            cal3_state    <= CAL3_IDLE;
          end else begin
            count_rden    <= count_rden + 1;
            cal3_state    <= CAL3_INIT;
          end
        end
      endcase
    end
  end
  // Last part of stage 3 calibration - compensate for differences
  // in delay between different DQS groups. Assume that in the worst
  // case, DQS groups can only differ by one clock cycle. Data for
  // certain DQS groups must be delayed by one clock cycle.
  // NOTE: May need to increase allowable variation to greater than
  //  one clock cycle in certain customer designs.
  // Algorithm is:
  //   1. Record shift delay value for DQS[0]
  //   2. Compare each DQS[x] delay value to that of DQS[0]:
  //       one clock cycle only - this is a key assumption, assume no
  //       more than a one clock cycle variation.
  //   3. After calibration is complete, set control for DQS group
  //      delay (CALIB_RDEN_SEL):
  //       delay (and at least one other DQS group has a higher
  //       delay).
  //       delay (and that all other DQS groups have the same or
  //       lower delay).
  //       (variation is too high for this algorithm to handle)
  always @(posedge clkdiv) begin
    if (rstdiv) begin
      calib_err_2[1] <= 1'b0;
      calib_rden_sel <= {DQS_WIDTH{1'bx}};
      rden_dec       <= 1'b0;
      rden_dly_0     <= 5'bxxxxx;
      rden_inc       <= 1'b0;
      rden_mux       <= {DQS_WIDTH{1'b0}};
    end else begin
      // if a match if found, then store the value of rden_dly
      if (!calib_done[2]) begin
        if ((cal3_state == CAL3_DETECT) && cal3_match_found) begin
          // store the value for DQS[0] as a reference
          if (count_rden == 0) begin
            // for simulation, RDEN calibration only happens for DQS[0]
            // set RDEN_MUX for all DQS groups to be the same as DQS[0]
            if (SIM_ONLY != 0)
              rden_mux <= {DQS_WIDTH{1'b0}};
            else begin
              // otherwise, load values for DQS[0]
              rden_dly_0  <= cal3_rden_srl_a;
              rden_mux[0] <= 1'b0;
            end
          end else if (SIM_ONLY == 0) begin
            // for all other DQS groups, compare RDEN_DLY delay value with
            // that of DQS[0]
            if (rden_dly_0 != cal3_rden_srl_a) begin
              // record that current DQS group has a different delay
              // than DQS[0] (the "reference" DQS group)
              rden_mux[count_rden] <= 1'b1;
              if (rden_dly_0 > cal3_rden_srl_a)
                rden_inc <= 1'b1;
              else if (rden_dly_0 < cal3_rden_srl_a)
                rden_dec <= 1'b1;
              // otherwise, if current DQS group has same delay as DQS[0],
              // then rden_mux[count_rden] remains at 0 (since rden_mux
              // array contents initialized to 0)
            end
          end
        end
      end else begin
        // Otherwise - if we're done w/ stage 2 calibration:
        // set final value for RDEN data delay
        // flag error if there's more than one cycle variation from DQS[0]
        calib_err_2[1] <= (rden_inc && rden_dec);
        if (rden_inc)
          // if DQS[0] delay represents max delay
          calib_rden_sel <= ~rden_mux;
        else
          // if DQS[0] delay represents min delay (or all the delays are
          // the same between DQS groups)
          calib_rden_sel <= rden_mux;
      end
    end
  end
  // flag error for stage 3 if appropriate
  always @(posedge clkdiv)
    calib_err[2] <= calib_err_2[0] | calib_err_2[1];
  // Stage 4 calibration: DQS gate
  // indicates that current received data is the correct pattern. Same as
  // for READ VALID calibration, except that the expected data sequence is
  // different since DQS gate is asserted after the 6th word.
  // Data sequence:
  //  Arrives from memory (at FPGA input) (R, F): 1 0 0 1 1 0 0 1
  //  After gating the sequence looks like: 1 0 0 1 1 0 1 0 (7th word =
  //   5th word, 8th word = 6th word)
  // What is the gate timing is off? Need to make sure we can distinquish
  // between the results of correct vs. incorrect gate timing. We also use
  // the "read_valid" signal from stage 3 calibration to help us determine
  // when to check for a valid sequence for stage 4 calibration (i.e. use
  // CAL4_DATA_VALID in addition to CAL4_DATA_MATCH/CAL4_DATA_MATCH_STGD)
  // Note that since the gate signal from the CLK0 domain is synchronized
  // to the falling edge of DQS, that the effect of the gate will only be
  // seen starting with a rising edge data (although it is possible
  // the GATE IDDR output could go metastable and cause a unexpected result
  // on the first rising and falling edges after the gate is enabled).
  // Also note that the actual DQS glitch can come more than 0.5*tCK after
  // the last falling edge of DQS and the constraint for this path is can
  // be > 0.5*tCK; however, this means when calibrating, the output of the
  // GATE IDDR may miss the setup time requirement of the rising edge flop
  // and only meet it for the falling edge flop. Therefore the rising
  // edge data immediately following the assertion of the gate can either
  // be a 1 or 0 (can rely on either)
  // As the timing on the gate is varied, we expect to see (sequence of
  // captured read data shown below):
  //                          read burst even starts)
  //                          represents possiblity that gate may not disable
  //                          clock for 2nd rising word in time)
  assign cal4_data_valid = calib_rden_valid | calib_rden_valid_stgd;
  assign cal4_data_good  = (calib_rden_valid &
                            cal4_data_match) |
                           (calib_rden_valid_stgd &
                            cal4_data_match_stgd);
  always @(posedge clkdiv) begin
    // if data is aligned out of fabric ISERDES:
    cal4_data_match <= ((rdd_rise_q2_r == 1) &&
                        (rdd_fall_q2_r == 0) &&
                        (rdd_rise_q1_r == 0) &&
                        (rdd_fall_q1_r == 1) &&
                        (rdd_rise_q2   == 1) &&
                        (rdd_fall_q2   == 0) &&
                        // MIG 2.1: Last rising edge data value not
                        // guaranteed to be certain value at higher
                        // frequencies
                        // (rdd_rise_q1   == 0) &&
                        (rdd_fall_q1   == 0));
    // if data is staggered out of fabric ISERDES:
    cal4_data_match_stgd <= ((rdd_rise_q1_r1 == 1) &&
                             (rdd_fall_q1_r1 == 0) &&
                             (rdd_rise_q2_r  == 0) &&
                             (rdd_fall_q2_r  == 1) &&
                             (rdd_rise_q1_r  == 1) &&
                             (rdd_fall_q1_r  == 0) &&
                             // MIG 2.1: Last rising edge data value not
                             // guaranteed to be certain value at higher
                             // frequencies
                             // (rdd_rise_q2    == 0) &&
                             (rdd_fall_q2    == 0));
  end
  // DQS gate enable generation:
  // This signal gets synchronized to DQS domain, and drives IDDR
  // register that in turn asserts/deasserts CE to all 4 or 8 DQ
  // IDDR's in that DQS group.
  //   1. During normal (post-cal) operation, this is only for 2 clock
  //      cycles following the end of a burst. Check for falling edge
  //      of RDEN. But must also make sure NOT assert for a read-idle-
  //      read (two non-consecutive reads, separated by exactly one
  //      idle cycle) - in this case, don't assert the gate because:
  //      (1) we don't have enough time to deassert the gate before the
  //          first rising edge of DQS for second burst (b/c of fact
  //          that DQS gate is generated in the fabric only off rising
  //          edge of CLK0 - if we somehow had an ODDR in fabric, we
  //          could pull this off, (2) assumption is that the DQS glitch
  //          will not rise enough to cause a glitch because the
  //          post-amble of the first burst is followed immediately by
  //          the pre-amble of the next burst
  //   2. During stage 4 calibration, assert for 3 clock cycles
  //      (assert gate enable one clock cycle early), since we gate out
  //      the last two words (in addition to the crap on the DQ bus after
  //      the DQS read postamble).
  // NOTE: PHY_INIT_RDEN and CTRL_RDEN have slightly different timing w/r
  //  to when they are asserted w/r to the start of the read burst
  //  (PHY_INIT_RDEN is one cycle earlier than CTRL_RDEN).
  // register for timing purposes for fast clock path - currently only
  // calib_done_r[2] used
  always @(posedge clk)
    calib_done_r <= calib_done;
  always @(*) begin
    calib_ctrl_rden = ctrl_rden;
    calib_init_rden = calib_done_r[2] & phy_init_rden;
  end
  assign calib_ctrl_rden_negedge = ~calib_ctrl_rden & calib_ctrl_rden_r;
  // check for read-idle-read before asserting DQS pulse at end of read
  assign calib_ctrl_gate_pulse   = calib_ctrl_rden_negedge_r &
                                   ~calib_ctrl_rden;
  always @(posedge clk) begin
    calib_ctrl_rden_r         <= calib_ctrl_rden;
    calib_ctrl_rden_negedge_r <= calib_ctrl_rden_negedge;
    calib_ctrl_gate_pulse_r   <= calib_ctrl_gate_pulse;
  end
  assign calib_init_gate_pulse = ~calib_init_rden & calib_init_rden_r;
  always @(posedge clk) begin
    calib_init_rden_r        <= calib_init_rden;
    calib_init_gate_pulse_r  <= calib_init_gate_pulse;
    calib_init_gate_pulse_r1 <= calib_init_gate_pulse_r;
  end
  // Gate is asserted: (1) during cal, for 3 cycles, starting 1 cycle
  // after falling edge of CTRL_RDEN, (2) during normal ops, for 2
  // cycles, starting 2 cycles after falling edge of CTRL_RDEN
  assign gate_srl_in = ~((calib_ctrl_gate_pulse |
                          calib_ctrl_gate_pulse_r) |
                         (calib_init_gate_pulse   |
                          calib_init_gate_pulse_r |
                          calib_init_gate_pulse_r1));
  // generate DQS enable signal for each DQS group
  // There are differences between DQS gate signal for calibration vs. during
  // normal operation:
  //    rather than after the last word (e.g. for a 8-word, 4-cycle burst,
  //    cycle 4 is gated for calibration; during normal operation, cycle
  //    5 (i.e. cycle after the last word) is gated)
  // enable for DQS is deasserted for two clock cycles, except when
  // we have the preamble for the next read immediately following
  // the postamble of the current read - assume DQS does not glitch
  // during this time, that it stays low. Also if we did have to gate
  // the DQS for this case, then we don't have enough time to deassert
  // the gate in time for the first rising edge of DQS for the second
  // read
  // Flops for targetting of multi-cycle path in UCF
  genvar gate_ff_i;
  generate
    for (gate_ff_i = 0; gate_ff_i < 5*DQS_WIDTH;
         gate_ff_i = gate_ff_i+1) begin: gen_gate_dly
      FDRSE u_ff_gate_dly
        (
         .Q   (gate_dly_r[gate_ff_i]),
         .C   (clkdiv),
         .CE  (1'b1),
         .D   (gate_dly[gate_ff_i]),
         .R   (1'b0),
         .S   (1'b0)
         ) /* synthesis syn_preserve = 1 */
           /* synthesis syn_replicate = 0 */;
    end
  endgenerate
  genvar gate_i;
  generate
    for (gate_i = 0; gate_i < DQS_WIDTH; gate_i = gate_i + 1) begin: gen_gate
      SRLC32E u_gate_srl
        (
         .Q   (gate_srl_out[gate_i]),
         .Q31 (),
         .A   ({gate_dly_r[(gate_i*5)+4],
                gate_dly_r[(gate_i*5)+3],
                gate_dly_r[(gate_i*5)+2],
                gate_dly_r[(gate_i*5)+1],
                gate_dly_r[(gate_i*5)]}),
         .CE  (1'b1),
         .CLK (clk),
         .D   (gate_srl_in)
         );
      // For GATE_BASE_DELAY > 0, have one extra cycle to register outputs
      // from controller before generating DQS gate pulse. In PAR, the
      // location of the controller logic can be far from the DQS gate
      // logic (DQS gate logic located near the DQS I/O's), contributing
      // to large net delays. Registering the controller outputs for
      // CL >= 4 (above 200MHz) adds a stage of pipelining to reduce net
      // delays
      if (GATE_BASE_DELAY > 0) begin: gen_gate_base_dly_gt3
        // add flop between SRL32 and EN_DQS flop (which is located near the
        // DDR2 IOB's)
        FDRSE u_gate_srl_ff
          (
         .Q   (gate_srl_out_r[gate_i]),
         .C   (clk),
         .CE  (1'b1),
         .D   (gate_srl_out[gate_i]),
         .R   (1'b0),
         .S   (1'b0)
           ) /* synthesis syn_preserve = 1 */;
      end else begin: gen_gate_base_dly_le3
        assign gate_srl_out_r[gate_i] = gate_srl_out[gate_i];
      end
      FDRSE u_en_dqs_ff
        (
         .Q   (en_dqs[gate_i]),
         .C   (clk),
         .CE  (1'b1),
         .D   (gate_srl_out_r[gate_i]),
         .R   (1'b0),
         .S   (1'b0)
         ) /* synthesis syn_preserve = 1 */
           /* synthesis syn_replicate = 0 */;
    end
  endgenerate
  // Find valid window: keep track of how long we've been in the same data
  // window. If it's been long enough, then declare that we've found a stable
  // valid window - in particular, that we're past any region of instability
  // associated with the edge of the window. Use only when finding left edge
  always @(posedge clkdiv)
    // reset before we start to look for window
    if (cal4_state == CAL4_INIT) begin
      cal4_window_cnt    <= 4'b0000;
      cal4_stable_window <= 1'b0;
    end else if ((cal4_state == CAL4_FIND_EDGE) && cal4_seek_left) begin
      // if we're looking for left edge, and incrementing IDELAY, count
      // consecutive taps over which we're in the window
      if (cal4_data_valid) begin
        if (cal4_data_good)
          cal4_window_cnt <= cal4_window_cnt + 1;
        else
          cal4_window_cnt <= 4'b0000;
      end
      if (cal4_window_cnt == MIN_WIN_SIZE-1)
        cal4_stable_window <= 1'b1;
    end
  // keep track of edge tap counts found, and whether we've
  // incremented to the maximum number of taps allowed
  always @(posedge clkdiv)
    if ((cal4_state == CAL4_INIT) || cal4_dlyrst_gate) begin
      cal4_idel_max_tap <= 1'b0;
      cal4_idel_bit_tap <= 1'b0;
      cal4_idel_tap_cnt <= 6'b000000;
    end else if (cal4_dlyce_gate) begin
      if (cal4_dlyinc_gate) begin
        cal4_idel_tap_cnt <= cal4_idel_tap_cnt + 1;
        cal4_idel_bit_tap <= (cal4_idel_tap_cnt == CAL4_IDEL_BIT_VAL-2);
        cal4_idel_max_tap <= (cal4_idel_tap_cnt == 6'b111110);
      end else begin
        cal4_idel_tap_cnt <= cal4_idel_tap_cnt - 1;
        cal4_idel_bit_tap <= 1'b0;
        cal4_idel_max_tap <= 1'b0;
      end
    end
  always @(posedge clkdiv)
    if ((cal4_state != CAL4_RDEN_PIPE_CLR_WAIT) &&
        (cal3_state != CAL3_RDEN_PIPE_CLR_WAIT))
      calib_rden_pipe_cnt <= CALIB_RDEN_PIPE_LEN-1;
    else
      calib_rden_pipe_cnt <= calib_rden_pipe_cnt - 1;
  // Stage 4 cal state machine
  always @(posedge clkdiv)
    if (rstdiv) begin
      calib_done[3]      <= 1'b0;
      calib_done_tmp[3]  <= 1'b0;
      calib_err[3]       <= 1'b0;
      count_gate         <= 'b0;
      gate_dly           <= 'b0;
      next_count_gate    <= 'b0;
      cal4_idel_adj_cnt  <= 6'bxxxxxx;
      cal4_dlyce_gate    <= 1'b0;
      cal4_dlyinc_gate   <= 1'b0;
      cal4_dlyrst_gate   <= 1'b0;    // reset handled elsewhere in code
      cal4_gate_srl_a    <= 5'bxxxxx;
      cal4_rden_srl_a    <= 5'bxxxxx;
      cal4_ref_req       <= 1'b0;
      cal4_seek_left     <= 1'bx;
      cal4_state         <= CAL4_IDLE;
    end else begin
      cal4_ref_req     <= 1'b0;
      cal4_dlyce_gate  <= 1'b0;
      cal4_dlyinc_gate <= 1'b0;
      cal4_dlyrst_gate <= 1'b0;
      case (cal4_state)
        CAL4_IDLE: begin
          count_gate      <= 'b0;
          next_count_gate <= 'b0;
          if (calib_start[3]) begin
            gate_dly      <= 'b0;
            calib_done[3] <= 1'b0;
            cal4_state    <= CAL4_INIT;
          end
        end
        CAL4_INIT: begin
          // load: (1) initial value of gate delay SRL, (2) appropriate
          // value of RDEN SRL (so that we get correct "data valid" timing)
          cal4_gate_srl_a <= GATE_BASE_INIT;
          cal4_rden_srl_a <= {calib_rden_dly[(count_gate*5)+4],
                              calib_rden_dly[(count_gate*5)+3],
                              calib_rden_dly[(count_gate*5)+2],
                              calib_rden_dly[(count_gate*5)+1],
                              calib_rden_dly[(count_gate*5)]};
          // let SRL pipe clear after loading initial shift value
          cal4_state <= CAL4_RDEN_PIPE_CLR_WAIT;
        end
        // sort of an initial state - start checking to see whether we're
        // already in the window or not
        CAL4_FIND_WINDOW:
          // decide right away if we start in the proper window - this
          // determines if we are then looking for the left (trailing) or
          // right (leading) edge of the data valid window
          if (cal4_data_valid) begin
            // if we find a match - then we're already in window, now look
            // for left edge. Otherwise, look for right edge of window
            cal4_seek_left  <= cal4_data_good;
            cal4_state      <= CAL4_FIND_EDGE;
          end
        CAL4_FIND_EDGE:
          // don't do anything until the exact clock cycle when to check that
          // readback data is valid or not
          if (cal4_data_valid) begin
            // we're currently in the window, look for left edge of window
            if (cal4_seek_left) begin
              // make sure we've passed the right edge before trying to detect
              // the left edge (i.e. avoid any edge "instability") - else, we
              // may detect an "false" edge too soon. By design, if we start in
              // the data valid window, always expect at least
              // MIN(BIT_TIME_TAPS,32) (-/+ jitter, see below) taps of valid
              // window before we hit the left edge (this is because when stage
              // 4 calibration first begins (i.e., gate_dly = 00, and IDELAY =
              // 00), we're guaranteed to NOT be in the window, and we always
              // start searching for MIN(BIT_TIME_TAPS,32) for the right edge
              // of window. If we don't find it, increment gate_dly, and if we
              // now start in the window, we have at least approximately
              // CLK_PERIOD-MIN(BIT_TIME_TAPS,32) = MIN(BIT_TIME_TAPS,32) taps.
              // It's approximately because jitter, noise, etc. can bring this
              // value down slightly. Because of this (although VERY UNLIKELY),
              // we have to protect against not decrementing IDELAY below 0
              // during adjustment phase).
              if (cal4_stable_window && !cal4_data_good) begin
                // found left edge of window, dec by MIN(BIT_TIME_TAPS,32)
                cal4_idel_adj_cnt <= CAL4_IDEL_BIT_VAL;
                cal4_idel_adj_inc <= 1'b0;
                cal4_state        <= CAL4_ADJ_IDEL;
              end else begin
                // Otherwise, keep looking for left edge:
                if (cal4_idel_max_tap) begin
                  // ran out of taps looking for left edge (max=63) - happens
                  // for low frequency case, decrement by 32
                  cal4_idel_adj_cnt <= 6'b100000;
                  cal4_idel_adj_inc <= 1'b0;
                  cal4_state        <= CAL4_ADJ_IDEL;
                end else begin
                  cal4_dlyce_gate  <= 1'b1;
                  cal4_dlyinc_gate <= 1'b1;
                  cal4_state       <= CAL4_IDEL_WAIT;
                end
              end
            end else begin
              // looking for right edge of window:
              // look for the first match - this means we've found the right
              // (leading) edge of the data valid window, increment by
              // MIN(BIT_TIME_TAPS,32)
              if (cal4_data_good) begin
                cal4_idel_adj_cnt <= CAL4_IDEL_BIT_VAL;
                cal4_idel_adj_inc <= 1'b1;
                cal4_state        <= CAL4_ADJ_IDEL;
              end else begin
                // Otherwise, keep looking:
                // only look for MIN(BIT_TIME_TAPS,32) taps for right edge,
                // if we haven't found it, then inc gate delay, try again
                if (cal4_idel_bit_tap) begin
                  // if we're already maxed out on gate delay, then error out
                  // (simulation only - calib_err isn't currently connected)
                  if (cal4_gate_srl_a == 5'b11111) begin
                    calib_err[3] <= 1'b1;
                    cal4_state   <= CAL4_IDLE;
                  end else begin
                    // otherwise, increment gate delay count, and start
                    // over again
                    cal4_gate_srl_a <= cal4_gate_srl_a + 1;
                    cal4_dlyrst_gate <= 1'b1;
                    cal4_state <= CAL4_RDEN_PIPE_CLR_WAIT;
                  end
                end else begin
                  // keep looking for right edge
                  cal4_dlyce_gate  <= 1'b1;
                  cal4_dlyinc_gate <= 1'b1;
                  cal4_state       <= CAL4_IDEL_WAIT;
                end
              end
            end
          end
        // wait for GATE IDELAY to settle, after reset or increment
        CAL4_IDEL_WAIT: begin
          // For simulation, load SRL addresses for all DQS with same value
          if (SIM_ONLY != 0) begin
            for (i = 0; i < DQS_WIDTH; i = i + 1) begin: loop_sim_gate_dly
              gate_dly[(i*5)+4] <= cal4_gate_srl_a[4];
              gate_dly[(i*5)+3] <= cal4_gate_srl_a[3];
              gate_dly[(i*5)+2] <= cal4_gate_srl_a[2];
              gate_dly[(i*5)+1] <= cal4_gate_srl_a[1];
              gate_dly[(i*5)]   <= cal4_gate_srl_a[0];
            end
          end else begin
            gate_dly[(count_gate*5)+4] <= cal4_gate_srl_a[4];
            gate_dly[(count_gate*5)+3] <= cal4_gate_srl_a[3];
            gate_dly[(count_gate*5)+2] <= cal4_gate_srl_a[2];
            gate_dly[(count_gate*5)+1] <= cal4_gate_srl_a[1];
            gate_dly[(count_gate*5)]   <= cal4_gate_srl_a[0];
          end
          // check to see if we've found edge of window
          if (!idel_set_wait)
            cal4_state <= CAL4_FIND_EDGE;
        end
        // give additional time for RDEN_R pipe to clear from effects of
        // previous pipeline (and IDELAY reset)
        CAL4_RDEN_PIPE_CLR_WAIT: begin
          // MIG 2.2: Bug fix - make sure to update GATE_DLY count, since
          // possible for FIND_EDGE->RDEN_PIPE_CLR_WAIT->FIND_WINDOW
          // transition (i.e. need to make sure the gate count updated in
          // FIND_EDGE gets reflected in GATE_DLY by the time we reach
          // state FIND_WINDOW) - previously GATE_DLY only being updated
          // during state CAL4_IDEL_WAIT
          if (SIM_ONLY != 0) begin
            for (i = 0; i < DQS_WIDTH; i = i + 1) begin: loop_sim_gate_dly_pipe
              gate_dly[(i*5)+4] <= cal4_gate_srl_a[4];
              gate_dly[(i*5)+3] <= cal4_gate_srl_a[3];
              gate_dly[(i*5)+2] <= cal4_gate_srl_a[2];
              gate_dly[(i*5)+1] <= cal4_gate_srl_a[1];
              gate_dly[(i*5)]   <= cal4_gate_srl_a[0];
            end
          end else begin
            gate_dly[(count_gate*5)+4] <= cal4_gate_srl_a[4];
            gate_dly[(count_gate*5)+3] <= cal4_gate_srl_a[3];
            gate_dly[(count_gate*5)+2] <= cal4_gate_srl_a[2];
            gate_dly[(count_gate*5)+1] <= cal4_gate_srl_a[1];
            gate_dly[(count_gate*5)]   <= cal4_gate_srl_a[0];
          end
          // look for new window
          if (calib_rden_pipe_cnt == 5'b00000)
            cal4_state <= CAL4_FIND_WINDOW;
        end
        // increment/decrement DQS/DQ IDELAY for final adjustment
        CAL4_ADJ_IDEL:
          // add underflow protection for corner case when left edge found
          // using fewer than MIN(BIT_TIME_TAPS,32) taps
          if ((cal4_idel_adj_cnt == 6'b000000) ||
              (cal4_dlyce_gate && !cal4_dlyinc_gate &&
               (cal4_idel_tap_cnt == 6'b000001))) begin
            cal4_state <= CAL4_DONE;
            // stop when all gates calibrated, or gate[0] cal'ed (for sim)
            if ((count_gate == DQS_WIDTH-1) || (SIM_ONLY != 0))
              calib_done_tmp[3] <= 1'b1;
            else
              // need for VHDL simulation to prevent out-of-index error
              next_count_gate <= count_gate + 1;
          end else begin
            cal4_idel_adj_cnt <= cal4_idel_adj_cnt - 1;
            cal4_dlyce_gate  <= 1'b1;
            // whether inc or dec depends on whether left or right edge found
            cal4_dlyinc_gate <= cal4_idel_adj_inc;
          end
        // wait for IDELAY output to settle after decrement. Check current
        // COUNT_GATE value and decide if we're done
        CAL4_DONE:
          if (!idel_set_wait) begin
            count_gate <= next_count_gate;
            if (calib_done_tmp[3]) begin
              calib_done[3] <= 1'b1;
              cal4_state <= CAL4_IDLE;
            end else begin
              // request auto-refresh after every DQS group calibrated to
              // avoid tRAS violation
              cal4_ref_req <= 1'b1;
              if (calib_ref_done)
                cal4_state <= CAL4_INIT;
            end
          end
      endcase
    end
endmodule