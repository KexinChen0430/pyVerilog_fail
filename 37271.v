module)
assign triangle_edge0_o = triangle_edge0;
assign triangle_edge1_o = triangle_edge1;
// Triangle iteration variables
wire triangle_done        = (triangle_y_counter >= triangle_bound_max_y ) & (triangle_line_done);
wire triangle_line_done   = (triangle_x_counter > triangle_bound_max_x) | (!triangle_valid_pixel & triangle_line_active);
wire triangle_valid_pixel = (triangle_edge0 >= 0 && triangle_edge1 >= 0 && triangle_edge2 >= 0)
                            && (triangle_x_counter >= 1'b0 && triangle_y_counter >= 1'b0);
// State machine
reg [1:0] state;
parameter wait_state           = 2'b00,
          triangle_prep_state  = 2'b01,
          triangle_calc_state  = 2'b10,
          triangle_write_state = 2'b11;
// Manage states
always @(posedge clk_i or posedge rst_i)
if(rst_i)
  state <= wait_state;
else
  case (state)
    wait_state:
      if(triangle_write_i)
        state <= triangle_prep_state;
    // Preparation stage
    triangle_prep_state:
      state <= triangle_calc_state;
    // Per pixel preparation stage
    triangle_calc_state:
      // Backface culling
      if(triangle_area0 - triangle_area1 > 0)
      begin
        if(ack_i | triangle_ignore_pixel)
          state <= triangle_write_state;
      end
      else
        state <= wait_state;
    // Pixel write stage
    triangle_write_state:
      if(triangle_done)
        state <= wait_state;
      else
        state <= triangle_calc_state;
  endcase
// Manage outputs (mealy machine)
always @(posedge clk_i or posedge rst_i)
begin
  // Reset
  if(rst_i)
  begin
    ack_o       <= 1'b0;
    x_counter_o <= 1'b0;
    y_counter_o <= 1'b0;
    write_o     <= 1'b0;
    diff_x1x0   <= 1'b0;
    diff_y2y0   <= 1'b0;
    diff_x2x0   <= 1'b0;
    diff_y1y0   <= 1'b0;
    //reset triangle regs
    triangle_bound_min_x  <= 1'b0;
    triangle_bound_min_y  <= 1'b0;
    triangle_bound_max_x  <= 1'b0;
    triangle_bound_max_y  <= 1'b0;
    triangle_ignore_pixel <= 1'b0;
    triangle_line_active  <= 1'b0;
    triangle_area0        <= 1'b0;
    triangle_area1        <= 1'b0;
    triangle_edge0_y2y1   <= 1'b0;
    triangle_edge0_xx1    <= 1'b0;
    triangle_edge0_x2x1   <= 1'b0;
    triangle_edge0_yy1    <= 1'b0;
    triangle_edge1_y0y2   <= 1'b0;
    triangle_edge1_xx2    <= 1'b0;
    triangle_edge1_x0x2   <= 1'b0;
    triangle_edge1_yy2    <= 1'b0;
    triangle_edge2_y1y0   <= 1'b0;
    triangle_edge2_xx0    <= 1'b0;
    triangle_edge2_x1x0   <= 1'b0;
    triangle_edge2_yy0    <= 1'b0;
    triangle_x_counter    <= 1'b0;
    triangle_y_counter    <= 1'b0;
    triangle_area_o       <= 1'b0;
  end
  else
  begin
    case (state)
      // Wait for incoming instructions
      wait_state:
      begin
        ack_o       <= 1'b0;
        if(triangle_write_i)
        begin
          // Initialize bounds
          triangle_bound_min_x <= (dest_pixel0_x_i <= dest_pixel1_x_i && dest_pixel0_x_i <= dest_pixel2_x_i) ? p0_x :
                                  (dest_pixel1_x_i <= dest_pixel2_x_i) ? p1_x :
                                  p2_x;
          triangle_bound_max_x <= (dest_pixel0_x_i >= dest_pixel1_x_i && dest_pixel0_x_i >= dest_pixel2_x_i) ? p0_x :
                                  (dest_pixel1_x_i >= dest_pixel2_x_i) ? p1_x :
                                  p2_x;
          triangle_bound_min_y <= (dest_pixel0_y_i <= dest_pixel1_y_i && dest_pixel0_y_i <= dest_pixel2_y_i) ? p0_y :
                                  (dest_pixel1_y_i <= dest_pixel2_y_i) ? p1_y :
                                  p2_y;
          triangle_bound_max_y <= (dest_pixel0_y_i >= dest_pixel1_y_i && dest_pixel0_y_i >= dest_pixel2_y_i) ? p0_y :
                                  (dest_pixel1_y_i >= dest_pixel2_y_i) ? p1_y :
                                  p2_y;
          diff_x1x0 <= dest_pixel1_x_i - dest_pixel0_x_i;
          diff_y2y0 <= dest_pixel2_y_i - dest_pixel0_y_i;
          diff_x2x0 <= dest_pixel2_x_i - dest_pixel0_x_i;
          diff_y1y0 <= dest_pixel1_y_i - dest_pixel0_y_i;
        end
      end
      // Triangle preparation
      triangle_prep_state:
      begin
        triangle_x_counter    <= (triangle_bound_min_x > 0) ? triangle_bound_min_x : 1'b0;
        triangle_y_counter    <= (triangle_bound_min_y > 0) ? triangle_bound_min_y : 1'b0;
        triangle_ignore_pixel <= 1'b1;
        triangle_area0        <= diff_x1x0_int * diff_y2y0_int;
        triangle_area1        <= diff_x2x0_int * diff_y1y0_int;
      end
      // Rasterize triangle
      triangle_calc_state:
      begin
        // Backface culling
        ack_o           <= (triangle_area0 - triangle_area1 <= 0);
        triangle_area_o <= triangle_area0 - triangle_area1;
        write_o <= 1'b0;
        if(ack_i | triangle_ignore_pixel)
        begin
          triangle_edge0_y2y1 <= p2_y                        - p1_y;
          triangle_edge0_xx1  <= $signed(triangle_x_counter) - p1_x;
          triangle_edge0_x2x1 <= p2_x                        - p1_x;
          triangle_edge0_yy1  <= $signed(triangle_y_counter) - p1_y;
          triangle_edge1_y0y2 <= p0_y                        - p2_y;
          triangle_edge1_xx2  <= $signed(triangle_x_counter) - p2_x;
          triangle_edge1_x0x2 <= p0_x                        - p2_x;
          triangle_edge1_yy2  <= $signed(triangle_y_counter) - p2_y;
          triangle_edge2_y1y0 <= p1_y                        - p0_y;
          triangle_edge2_xx0  <= $signed(triangle_x_counter) - p0_x;
          triangle_edge2_x1x0 <= p1_x                        - p0_x;
          triangle_edge2_yy0  <= $signed(triangle_y_counter) - p0_y;
        end
      end
      triangle_write_state:
      if(triangle_done)
      begin
        ack_o   <= 1'b1;
        write_o <= 1'b0;
      end
      else
      begin
        x_counter_o            <= triangle_x_counter;
        y_counter_o            <= triangle_y_counter;
        write_o                <= triangle_valid_pixel;
        triangle_ignore_pixel  <= !triangle_valid_pixel;
        if(triangle_line_done) // iterate through width of rect
        begin
          triangle_x_counter   <= (triangle_bound_min_x > 0) ? triangle_bound_min_x : 1'b0;
          triangle_y_counter   <= triangle_y_counter + 1'b1;
          triangle_line_active <= 1'b0;
        end
        else
        begin
          triangle_x_counter   <= triangle_x_counter + 1'b1;
          triangle_line_active <= triangle_valid_pixel;
        end
      end
    endcase
  end
end
endmodule