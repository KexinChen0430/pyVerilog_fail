module happens to be good for a line drawing buffer,
  // since its contents are of the same color format.
  Palette #(.NUM_CHANNELS(`NUM_PAL_CHANNELS)) line_buffer(
      .clk_a(clk),
      .wr_a(tile_buf_wr | sprite_buf_wr),
      .rd_a(0),
      .addr_a(buf_addr),
      .data_in_a(pal_data),
      .byte_en_a(3'b111),
      .clk_b(clk),
      .wr_b(h_visible[0] & v_visible[0]),  // Clear the old data for a new line.
      .rd_b(~(h_blank | v_blank_delayed)),
      .addr_b(buf_scanout_addr),
      .data_in_b(0),
      .data_out_b(buf_scanout_data)
      );
  // Sprite index buffer, for detecting collisions between sprites.
  // Writing sprite data to it parallels drawing sprites to the line buffer.
  wire [`SPRITE_BUF_DATA_WIDTH-1:0] sprite_buffer_out;
  collision_buffer_1Kx9 sprite_buffer(
      .clock(clk),
      // Interface A.
      .wren_a(sprite_buf_wr),
      .address_a(buf_addr),
      // The uppermost bit indicates a valid sprite pixel.
      .data_a({1'b1, current_sprite_delayed}),
      // Break down the output into separate fields.
      .q_a({existing_sprite_pixel_valid, existing_sprite_index}),
      // Interface B.
      .wren_b(h_visible[0] & v_visible[0]),  // Clear old data for a new line.
      .address_b(buf_scanout_addr),
      .data_b(0),
      .q_b(sprite_buffer_out),
      );
  // The read value is valid one clock after the write value.  Use a delayed
  // write value to compare the two.
  reg sprite_buf_wr_delayed;
  reg [`BYTE_WIDTH-1:0] new_sprite_index;
  reg [`LINE_BUF_ADDR_WIDTH-1:0] buf_addr_delayed;
  always @ (posedge clk) begin
    sprite_buf_wr_delayed <= sprite_buf_wr;
    new_sprite_index <= current_sprite_delayed;
    buf_addr_delayed <= buf_addr;
  end
  wire existing_sprite_pixel_valid;
  wire [`BYTE_WIDTH-1:0] existing_sprite_index;
  // A collision is detected if there's an existing sprite pixel and it doesn't
  // come from the same sprite as the new one.
  // TODO: The screen goes black if the logic for comparing old vs new sprite
  // is used.  Figure out why.
  // TODO: Implement actual collision table.
  wire sprite_collision = sprite_buf_wr_delayed & existing_sprite_pixel_valid;
  assign coll_wr = sprite_collision;
  assign coll_addr = new_sprite_index;
  assign coll_data = existing_sprite_index;
  // This buffer stores the pixels where collision happened.  It is used only
  // for testing.  The output is only used when TEST_COLLISION_REGIONS_ONLY is
  // defined.
  wire [`COLLISION_BUF_DATA_WIDTH-1:0] collision_buffer_out;
  collision_buffer_1Kx9 collision_test_buffer(
      .clock(clk),
      // Write to the collision buffer only when there's a collision.
      .wren_a(sprite_collision),
      // Interface A.
      // Write to the buffer position that corresponds to the current pixel
      // being drawn.  Thus the collision buffer contains an image of where the
      // collisions are.
      .address_a(buf_addr_delayed),
      // The uppermost bit indicates a valid sprite pixel.
      .data_a({`COLLISION_BUF_DATA_WIDTH{1'b1}}),
      // Interface B.
      .wren_b(h_visible[0] & v_visible[0]),  // Clear old data for a new line.
      .address_b(buf_scanout_addr),
      .data_b(0),
      .q_b(collision_buffer_out),
      );
  // Line buffer -> VGA output
  // Interface B: reading from the line buffer
  wire [`LINE_BUF_ADDR_WIDTH-1:0] buf_scanout_addr;
  // Make sure to scan out from the part of the buffer that was rendered to
  // the previous line.
  assign buf_scanout_addr = {~screen_y[0], screen_x};
  wire [`PAL_DATA_WIDTH-1:0] buf_scanout_data;
  reg [7:0] buf_scanout_red;
  reg [7:0] buf_scanout_green;
  reg [7:0] buf_scanout_blue;
  // Latch the line buffer output.  This is needed to preserve the line buffer
  // output after it gets cleared for a new line.
  // TODO: I got this to work properly after a bit of trial and error.  In the
  // future, this may need to be revisited to get a better understanding of how
  // it works.
  always @ (negedge clk) begin
`ifndef TEST_COLLISION_BUFFER
    buf_scanout_red = buf_scanout_data[7:0];
    buf_scanout_green = buf_scanout_data[15:8];
    buf_scanout_blue = buf_scanout_data[23:16];
`else
  `ifndef TEST_COLLISION_REGIONS_ONLY
    // Test the sprite buffer.
    `define BUFFER_TEST_BIT sprite_buffer_out[`SPRITE_BUF_DATA_WIDTH-1]
  `else
    // Test the collision buffer.
    `define BUFFER_TEST_BIT collision_buffer_out[`COLL_DATA_WIDTH-1]
  `endif  // defined(TEST_COLLISION_REGIONS_ONLY)
  // For testing the collision buffer, show the buffer contents as part of the
  // scanout.  Regions with sprite pixels are shown as grey.
  {buf_scanout_red, buf_scanout_green, buf_scanout_blue} =
      `BUFFER_TEST_BIT ? 'h7f7f7f : {buf_scanout_data[7:0],
                                     buf_scanout_data[15:8],
                                     buf_scanout_data[23:16]};
`endif  // defined(TEST_COLLISION_BUFFER)
  end
  always @ (negedge clk) begin
    if (h_blank_delayed | v_blank_delayed) begin
      rgb_out <= {RGB_COLOR_DEPTH {1'b0}};
    end else if (~h_visible[0]) begin
      rgb_out <= {buf_scanout_blue[7:2],
                  buf_scanout_green[7:2],
                  buf_scanout_red[7:2]};
    end
  end
endmodule