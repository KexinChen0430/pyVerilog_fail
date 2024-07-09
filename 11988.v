module generates the video timing based on the parameters specified
// by the test program.
axis_gen #(
  .DLY                (DLY),
  .INTERLACE          (INTERLACE),
  .DATA_WIDTH         (TDATA_WIDTH)
)
axis_gen_i (
  .aclk				  (aclk ),
  .rst				  (rst	),
  .axis_tready		  (axis_tready ),
  .axis_tvalid		  (axis_tvalid),
  .axis_tdata_video	  (axis_video),
  .axis_tlast		  (axis_eol   ),
  .axis_tuser_sof	  (axis_sof   ),
  .fid                (fid),
  .active_pixels	  (active_pixels),
  .active_lines		  (active_lines )
);
timing_gen #(
  .DLY                (DLY),
  .INTERLACE          (INTERLACE),
  .DATA_WIDTH         (VDATA_WIDTH)
  )
timing_gen_i	(
  .clk			  (video_clk),
  .rst			  (rst),
  .ce			  (ce),
  .active_lines	  (active_lines	),
  .total_lines	  (total_lines	),
  .vsync_start	  (vsync_start	),
  .vsync_end	  (vsync_end	),
  .active_pixels  (active_pixels),
  .total_pixels	  (total_pixels	),
  .hsync_start	  (hsync_start	),
  .hsync_end	  (hsync_end	),
  .hsync		  (vtg_hsync		),
  .vsync		  (vtg_vsync		),
  .hblank         (vtg_hblank       ),
  .vblank         (vtg_vblank       ),
  .de			  (vtg_act_vid		),
  .field_id       (vtg_field_id     ),
  .video_data	  ()
);
// Top level Video output bridge -- DUT
tutorial_v_axi4s_vid_out_0_0
dut	(
  .aclk               (aclk),
  .rst                (rst),
  .aclken             (aclken ),
  .aresetn            (aresetn),
  .s_axis_video_tdata (axis_video ),
  .s_axis_video_tvalid (axis_tvalid),
  .s_axis_video_tready (axis_tready),
  .s_axis_video_tuser  (axis_sof   ),
  .s_axis_video_tlast  (axis_eol   ),
  .fid                 (fid),
  .vid_io_out_clk     (video_clk),
  .vid_io_out_ce      (vid_ce),
  .vid_active_video   (de),
  .vid_vsync          (vsync),
  .vid_hsync          (hsync),
  .vid_vblank 	      (hblank),
  .vid_hblank 	      (vblank),
  .vid_field_id       (vid_field_id),
  .vid_data           (video_data),
  .vtg_vsync  		  (vtg_vsync ),
  .vtg_hsync		  (vtg_hsync ),
  .vtg_vblank		  (vtg_vblank),
  .vtg_hblank		  (vtg_hblank),
  .vtg_active_video       (vtg_act_vid),
  .vtg_field_id       (vtg_field_id),
  .vtg_ce			  (ce),
  .locked    		  (vtg_locked),	      //out
  .wr_error		      (wr_error ),        //out
  .empty    		  (rd_error )	      //out
);
// Test program : This program controls the operation of the test bench.
test_vid_out #(
  .DLY                (DLY),
  .NUM_TESTS          (NUM_TESTS)
  )
test_vid_out_i (
  .clk				 (video_clk),
  .error			 (error),
  .frame_complete	 (frame_complete),
  .rst				 (rst),
  .total_lines		 (total_lines),
  .active_lines		 (active_lines),
  .vsync_start		 (vsync_start ),
  .vsync_end		 (vsync_end	  ),
  .total_pixels		 (total_pixels ),
  .active_pixels	 (active_pixels),
  .hsync_start		 (hsync_start	),
  .hsync_end		 (hsync_end	 )
);
phy_emulation #(
  .DLY                (DLY),
  .INTERLACE          (INTERLACE),
  .DATA_WIDTH         (VDATA_WIDTH)
  )
phy_emulation_i (
  .clk               (video_clk),
  .rst               (rst),
  .vid_ce            (vid_ce),
  .hsync             (hsync),
  .vsync             (vsync),
  .de                (de),
  .vid_field_id      (vid_field_id),
  .video_data        (video_data),
  .error_out		 (error),
  .frame_complete 	 (frame_complete)
);
endmodule