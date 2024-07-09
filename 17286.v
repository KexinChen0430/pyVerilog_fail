module outputs.
  // Limit device_temp to 0C to 125C and assign it to flop input device_temp_100
  // temp C = ( ( ADC CODE * 503.975 ) / 4096 ) - 273.15
  wire        device_temp_high = device_temp > TEMP_MAX_LIMIT;
  wire        device_temp_low  = device_temp < TEMP_MIN_LIMIT;
  wire [11:0] device_temp_100  =     ( { 12 {  device_temp_high                     } } & TEMP_MAX_LIMIT )
                                   | ( { 12 {                      device_temp_low  } } & TEMP_MIN_LIMIT )
                                   | ( { 12 { ~device_temp_high & ~device_temp_low  } } & device_temp );
  // Capture/hold the initial temperature used in setting temperature bands and set init complete flag
  // to enable normal sample operation.
  wire [11:0] device_temp_init_nxt      = tempmon_state_init  ? device_temp_101 : device_temp_init;
  wire        tempmon_init_complete_nxt = tempmon_state_init  ? 1'b1            : tempmon_init_complete;
  // Capture/hold the current temperature on the sample enable signal rising edge after init is complete.
  // The captured current temp is not used functionaly.  It is just useful for debug and waveform review.
  wire        update_temp_101           =  tempmon_init_complete & ~tempmon_sample_en_102 & tempmon_sample_en_101;
  wire [11:0] device_temp_capture_101   =  update_temp_101 ? device_temp_101 : device_temp_capture_102;
  //===========================================================================
  // Generate FSM arc signals
  //===========================================================================
  // Temperature comparisons for increasing temperature.
  wire        temp_cmp_four_inc_max_101  = device_temp_101 >= four_inc_max_limit  ;
  wire        temp_cmp_three_inc_max_101 = device_temp_101 >= three_inc_max_limit ;
  wire        temp_cmp_two_inc_max_101   = device_temp_101 >= two_inc_max_limit   ;
  wire        temp_cmp_one_inc_max_101   = device_temp_101 >= one_inc_max_limit   ;
  wire        temp_cmp_neutral_max_101   = device_temp_101 >= neutral_max_limit   ;
  wire        temp_cmp_one_dec_max_101   = device_temp_101 >= one_dec_max_limit   ;
  wire        temp_cmp_two_dec_max_101   = device_temp_101 >= two_dec_max_limit   ;
  wire        temp_cmp_three_dec_max_101 = device_temp_101 >= three_dec_max_limit ;
  // Temperature comparisons for decreasing temperature.
  wire        temp_cmp_three_inc_min_101 = device_temp_101 < three_inc_min_limit ;
  wire        temp_cmp_two_inc_min_101   = device_temp_101 < two_inc_min_limit   ;
  wire        temp_cmp_one_inc_min_101   = device_temp_101 < one_inc_min_limit   ;
  wire        temp_cmp_neutral_min_101   = device_temp_101 < neutral_min_limit   ;
  wire        temp_cmp_one_dec_min_101   = device_temp_101 < one_dec_min_limit   ;
  wire        temp_cmp_two_dec_min_101   = device_temp_101 < two_dec_min_limit   ;
  wire        temp_cmp_three_dec_min_101 = device_temp_101 < three_dec_min_limit ;
  wire        temp_cmp_four_dec_min_101  = device_temp_101 < four_dec_min_limit  ;
  // FSM arcs for increasing temperature.
  wire        temp_gte_four_inc_max  = update_temp_102 & temp_cmp_four_inc_max_102;
  wire        temp_gte_three_inc_max = update_temp_102 & temp_cmp_three_inc_max_102;
  wire        temp_gte_two_inc_max   = update_temp_102 & temp_cmp_two_inc_max_102;
  wire        temp_gte_one_inc_max   = update_temp_102 & temp_cmp_one_inc_max_102;
  wire        temp_gte_neutral_max   = update_temp_102 & temp_cmp_neutral_max_102;
  wire        temp_gte_one_dec_max   = update_temp_102 & temp_cmp_one_dec_max_102;
  wire        temp_gte_two_dec_max   = update_temp_102 & temp_cmp_two_dec_max_102;
  wire        temp_gte_three_dec_max = update_temp_102 & temp_cmp_three_dec_max_102;
  // FSM arcs for decreasing temperature.
  wire        temp_lte_three_inc_min = update_temp_102 & temp_cmp_three_inc_min_102;
  wire        temp_lte_two_inc_min   = update_temp_102 & temp_cmp_two_inc_min_102;
  wire        temp_lte_one_inc_min   = update_temp_102 & temp_cmp_one_inc_min_102;
  wire        temp_lte_neutral_min   = update_temp_102 & temp_cmp_neutral_min_102;
  wire        temp_lte_one_dec_min   = update_temp_102 & temp_cmp_one_dec_min_102;
  wire        temp_lte_two_dec_min   = update_temp_102 & temp_cmp_two_dec_min_102;
  wire        temp_lte_three_dec_min = update_temp_102 & temp_cmp_three_dec_min_102;
  wire        temp_lte_four_dec_min  = update_temp_102 & temp_cmp_four_dec_min_102;
  //===========================================================================
  // Implement FSM
  //===========================================================================
  // In addition to the nine temperature states, there are also IDLE and INIT states.
  // The INIT state triggers the calculation of the temperature boundaries between the
  // other states.  After INIT, the FSM will always go to the NEUTRAL state.  There is
  // no timing restriction required between calib_complete and tempmon_sample_en.
  always @(*) begin
    tempmon_state_nxt = tempmon_state;
    tempmon_state_init = 1'b0;
    pi_f_inc_nxt = 1'b0;
    pi_f_dec_nxt = 1'b0;
    casez (tempmon_state)
      IDLE: begin
        if (calib_complete) tempmon_state_nxt = INIT;
      end
      INIT: begin
        tempmon_state_nxt = NEUTRAL;
        tempmon_state_init = 1'b1;
      end
      FOUR_INC: begin
        if (temp_gte_four_inc_max) begin
	  tempmon_state_nxt = THREE_INC;
          pi_f_dec_nxt = 1'b1;
        end
      end
      THREE_INC: begin
        if (temp_gte_three_inc_max) begin
	  tempmon_state_nxt = TWO_INC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_three_inc_min) begin
	  tempmon_state_nxt = FOUR_INC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      TWO_INC: begin
        if (temp_gte_two_inc_max) begin
	  tempmon_state_nxt = ONE_INC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_two_inc_min) begin
	  tempmon_state_nxt = THREE_INC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      ONE_INC: begin
        if (temp_gte_one_inc_max) begin
	  tempmon_state_nxt = NEUTRAL;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_one_inc_min) begin
	  tempmon_state_nxt = TWO_INC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      NEUTRAL: begin
        if (temp_gte_neutral_max) begin
	  tempmon_state_nxt = ONE_DEC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_neutral_min) begin
	  tempmon_state_nxt = ONE_INC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      ONE_DEC: begin
        if (temp_gte_one_dec_max) begin
	  tempmon_state_nxt = TWO_DEC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_one_dec_min) begin
	  tempmon_state_nxt = NEUTRAL;
          pi_f_inc_nxt = 1'b1;
        end
      end
      TWO_DEC: begin
        if (temp_gte_two_dec_max) begin
	  tempmon_state_nxt = THREE_DEC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_two_dec_min) begin
	  tempmon_state_nxt = ONE_DEC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      THREE_DEC: begin
        if (temp_gte_three_dec_max) begin
	  tempmon_state_nxt = FOUR_DEC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_three_dec_min) begin
	  tempmon_state_nxt = TWO_DEC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      FOUR_DEC: begin
	if (temp_lte_four_dec_min) begin
	  tempmon_state_nxt = THREE_DEC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      default: begin
	  tempmon_state_nxt = IDLE;
      end
    endcase
  end //always
//synopsys translate_off
reg [71:0] tempmon_state_name;
always @(*) casez (tempmon_state)
   IDLE      : tempmon_state_name = "IDLE";
   INIT      : tempmon_state_name = "INIT";
   FOUR_INC  : tempmon_state_name = "FOUR_INC";
   THREE_INC : tempmon_state_name = "THREE_INC";
   TWO_INC   : tempmon_state_name = "TWO_INC";
   ONE_INC   : tempmon_state_name = "ONE_INC";
   NEUTRAL   : tempmon_state_name = "NEUTRAL";
   ONE_DEC   : tempmon_state_name = "ONE_DEC";
   TWO_DEC   : tempmon_state_name = "TWO_DEC";
   THREE_DEC : tempmon_state_name = "THREE_DEC";
   FOUR_DEC  : tempmon_state_name = "FOUR_DEC";
   default   : tempmon_state_name = "BAD_STATE";
endcase
//synopsys translate_on
  //===========================================================================
  // Generate final output and implement flops
  //===========================================================================
  // Generate output
  assign tempmon_pi_f_inc = pi_f_inc;
  assign tempmon_pi_f_dec = pi_f_dec;
  assign tempmon_sel_pi_incdec = pi_f_inc | pi_f_dec;
  // Implement reset flops
  always @(posedge clk) begin
    if(rst) begin
      tempmon_state           <= #TCQ 11'b000_0000_0001;
      pi_f_inc                <= #TCQ 1'b0;
      pi_f_dec                <= #TCQ 1'b0;
      four_inc_max_limit      <= #TCQ 12'b0;
      three_inc_max_limit     <= #TCQ 12'b0;
      two_inc_max_limit       <= #TCQ 12'b0;
      one_inc_max_limit       <= #TCQ 12'b0;
      neutral_max_limit       <= #TCQ 12'b0;
      one_dec_max_limit       <= #TCQ 12'b0;
      two_dec_max_limit       <= #TCQ 12'b0;
      three_dec_max_limit     <= #TCQ 12'b0;
      three_inc_min_limit     <= #TCQ 12'b0;
      two_inc_min_limit       <= #TCQ 12'b0;
      one_inc_min_limit       <= #TCQ 12'b0;
      neutral_min_limit       <= #TCQ 12'b0;
      one_dec_min_limit       <= #TCQ 12'b0;
      two_dec_min_limit       <= #TCQ 12'b0;
      three_dec_min_limit     <= #TCQ 12'b0;
      four_dec_min_limit      <= #TCQ 12'b0;
      device_temp_init        <= #TCQ 12'b0;
      tempmon_init_complete   <= #TCQ 1'b0;
      tempmon_sample_en_101   <= #TCQ 1'b0;
      tempmon_sample_en_102   <= #TCQ 1'b0;
      device_temp_101         <= #TCQ 12'b0;
      device_temp_capture_102 <= #TCQ 12'b0;
    end
    else begin
      tempmon_state           <= #TCQ tempmon_state_nxt;
      pi_f_inc                <= #TCQ pi_f_inc_nxt;
      pi_f_dec                <= #TCQ pi_f_dec_nxt;
      four_inc_max_limit      <= #TCQ four_inc_max_limit_nxt;
      three_inc_max_limit     <= #TCQ three_inc_max_limit_nxt;
      two_inc_max_limit       <= #TCQ two_inc_max_limit_nxt;
      one_inc_max_limit       <= #TCQ one_inc_max_limit_nxt;
      neutral_max_limit       <= #TCQ neutral_max_limit_nxt;
      one_dec_max_limit       <= #TCQ one_dec_max_limit_nxt;
      two_dec_max_limit       <= #TCQ two_dec_max_limit_nxt;
      three_dec_max_limit     <= #TCQ three_dec_max_limit_nxt;
      three_inc_min_limit     <= #TCQ three_inc_min_limit_nxt;
      two_inc_min_limit       <= #TCQ two_inc_min_limit_nxt;
      one_inc_min_limit       <= #TCQ one_inc_min_limit_nxt;
      neutral_min_limit       <= #TCQ neutral_min_limit_nxt;
      one_dec_min_limit       <= #TCQ one_dec_min_limit_nxt;
      two_dec_min_limit       <= #TCQ two_dec_min_limit_nxt;
      three_dec_min_limit     <= #TCQ three_dec_min_limit_nxt;
      four_dec_min_limit      <= #TCQ four_dec_min_limit_nxt;
      device_temp_init        <= #TCQ device_temp_init_nxt;
      tempmon_init_complete   <= #TCQ tempmon_init_complete_nxt;
      tempmon_sample_en_101   <= #TCQ tempmon_sample_en;
      tempmon_sample_en_102   <= #TCQ tempmon_sample_en_101;
      device_temp_101         <= #TCQ device_temp_100;
      device_temp_capture_102 <= #TCQ device_temp_capture_101;
    end
  end
  // Implement non-reset flops
  always @(posedge clk) begin
      temp_cmp_four_inc_max_102  <= #TCQ temp_cmp_four_inc_max_101;
      temp_cmp_three_inc_max_102 <= #TCQ temp_cmp_three_inc_max_101;
      temp_cmp_two_inc_max_102   <= #TCQ temp_cmp_two_inc_max_101;
      temp_cmp_one_inc_max_102   <= #TCQ temp_cmp_one_inc_max_101;
      temp_cmp_neutral_max_102   <= #TCQ temp_cmp_neutral_max_101;
      temp_cmp_one_dec_max_102   <= #TCQ temp_cmp_one_dec_max_101;
      temp_cmp_two_dec_max_102   <= #TCQ temp_cmp_two_dec_max_101;
      temp_cmp_three_dec_max_102 <= #TCQ temp_cmp_three_dec_max_101;
      temp_cmp_three_inc_min_102 <= #TCQ temp_cmp_three_inc_min_101;
      temp_cmp_two_inc_min_102   <= #TCQ temp_cmp_two_inc_min_101;
      temp_cmp_one_inc_min_102   <= #TCQ temp_cmp_one_inc_min_101;
      temp_cmp_neutral_min_102   <= #TCQ temp_cmp_neutral_min_101;
      temp_cmp_one_dec_min_102   <= #TCQ temp_cmp_one_dec_min_101;
      temp_cmp_two_dec_min_102   <= #TCQ temp_cmp_two_dec_min_101;
      temp_cmp_three_dec_min_102 <= #TCQ temp_cmp_three_dec_min_101;
      temp_cmp_four_dec_min_102  <= #TCQ temp_cmp_four_dec_min_101;
      update_temp_102            <= #TCQ update_temp_101;
  end
endmodule