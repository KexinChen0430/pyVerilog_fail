module instanciated
gfx_triangle triangle(
.clk_i                  (clk_i),
.rst_i                  (rst_i),
.ack_i                  (triangle_ready),
.ack_o                  (triangle_ack),
.triangle_write_i       (triangle_write_i),
.texture_enable_i       (texture_enable_i),
.dest_pixel0_x_i        (dest_pixel0_x_i),
.dest_pixel0_y_i        (dest_pixel0_y_i),
.dest_pixel1_x_i        (dest_pixel1_x_i),
.dest_pixel1_y_i        (dest_pixel1_y_i),
.dest_pixel2_x_i        (dest_pixel2_x_i),
.dest_pixel2_y_i        (dest_pixel2_y_i),
.x_counter_o            (triangle_x_o),
.y_counter_o            (triangle_y_o),
.triangle_edge0_o       (triangle_edge0_o),
.triangle_edge1_o       (triangle_edge1_o),
.triangle_area_o        (triangle_area_o),
.write_o                (triangle_write_o)
);
defparam triangle.point_width    = point_width;
defparam triangle.subpixel_width = subpixel_width;
endmodule