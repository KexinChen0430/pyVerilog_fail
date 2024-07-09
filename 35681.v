module DisplayTiming(h_pos, v_pos, h_sync, v_sync, h_blank, v_blank,
                     h_visible_pos, v_visible_pos, h_end, v_end,
                     mode);
  input [`VIDEO_COUNT_WIDTH-1:0] h_pos;
  input [`VIDEO_COUNT_WIDTH-1:0] v_pos;
  input [`VIDEO_MODE_WIDTH-1:0] mode;
  // Sync signals.
  output h_sync, v_sync;
  // Blanking signals indicating that scanout is in an off-screen area.
  output h_blank, v_blank;
  // Position of scanout relative to upper-left corner of visible portion of
  // screen.
  output [`VIDEO_COUNT_WIDTH-1:0] h_visible_pos;
  output [`VIDEO_COUNT_WIDTH-1:0] v_visible_pos;
  // Indicates that the last pixel or line of the h/v scan is being displayed.
  output h_end, v_end;
  wire [`VIDEO_COUNT_WIDTH * `NUM_TIMING_VALUES - 1:0] h_timing_values_array;
  wire [`VIDEO_COUNT_WIDTH * `NUM_TIMING_VALUES - 1:0] v_timing_values_array;
  // Decode the timing values for the video mode.
  VideoModeDecoder decoder(mode, h_timing_values_array, v_timing_values_array);
  // Distribute them into separate values.
  wire [`VIDEO_COUNT_WIDTH-1:0] h_timing_values [`NUM_TIMING_VALUES-1:0];
  wire [`VIDEO_COUNT_WIDTH-1:0] v_timing_values [`NUM_TIMING_VALUES-1:0];
  genvar i;
  generate
    for (i = 0; i < `NUM_TIMING_VALUES; i = i + 1) begin : timing_values
      // Do this in reverse, as the order is reversed in the concatenation
      // in VideoModeDecoder.
      assign h_timing_values[`NUM_TIMING_VALUES - 1 - i] =
          h_timing_values_array[`VIDEO_COUNT_WIDTH * (i + 1) - 1:
                                `VIDEO_COUNT_WIDTH * i];
      assign v_timing_values[`NUM_TIMING_VALUES - 1 - i] =
          v_timing_values_array[`VIDEO_COUNT_WIDTH * (i + 1) - 1:
                                `VIDEO_COUNT_WIDTH * i];
    end
  endgenerate
  `define H_VISIBLE_LENGTH    h_timing_values[0]
  `define H_FRONT_LENGTH      h_timing_values[1]
  `define H_SYNC_LENGTH       h_timing_values[2]
  `define H_BACK_LENGTH       h_timing_values[3]
  `define H_SYNC_START        h_timing_values[4]
  `define H_BACK_START        h_timing_values[5]
  `define H_VISIBLE_START     h_timing_values[6]
  `define H_FRONT_START       h_timing_values[7]
  `define H_TOTAL_LENGTH      h_timing_values[8]
  `define V_VISIBLE_LENGTH    v_timing_values[0]
  `define V_FRONT_LENGTH      v_timing_values[1]
  `define V_SYNC_LENGTH       v_timing_values[2]
  `define V_BACK_LENGTH       v_timing_values[3]
  `define V_SYNC_START        v_timing_values[4]
  `define V_BACK_START        v_timing_values[5]
  `define V_VISIBLE_START     v_timing_values[6]
  `define V_FRONT_START       v_timing_values[7]
  `define V_TOTAL_LENGTH      v_timing_values[8]
  assign h_sync = ~(h_pos < `H_SYNC_LENGTH);
  assign v_sync = ~(v_pos < `V_SYNC_LENGTH);
  assign h_blank = (h_pos < `H_VISIBLE_START || h_pos >= `H_FRONT_START);
  assign v_blank = (v_pos < `V_VISIBLE_START || v_pos >= `V_FRONT_START);
  assign h_visible_pos = h_pos - `H_VISIBLE_START;
  assign v_visible_pos = v_pos - `V_VISIBLE_START;
  assign h_end = (h_pos == (`H_TOTAL_LENGTH - 1));
  assign v_end = (v_pos == (`V_TOTAL_LENGTH - 1));
endmodule