module icache_mutex_mon(/*AUTOARG*/
   // Inputs
   clk, rst_l, waysel_buf_s1, alltag_err_s1, tlb_cam_miss_s1, cam_vld_s1, coreid
   );
   input clk;
   input rst_l;
   input [3:0] waysel_buf_s1;
   input [3:0] alltag_err_s1;
   input       tlb_cam_miss_s1;
   input       cam_vld_s1;
   input [2:0] coreid;
   reg 		enable;
   initial begin
      enable = 1;
      if ($test$plusargs("turn_off_icache_mutex_mon")) enable = 0;
   end
   always @ (negedge clk) begin
      if (rst_l) begin
        if (!((waysel_buf_s1 == 4'b0001) ||
              (waysel_buf_s1 == 4'b0010) ||
              (waysel_buf_s1 == 4'b0100) ||
              (waysel_buf_s1 == 4'b1000) ||
              (waysel_buf_s1 == 4'b0000)) &&
	      (|alltag_err_s1 == 1'b0) &&
	      (tlb_cam_miss_s1 == 1'b0) &&
	      (cam_vld_s1 == 1'b1))
	  begin
	     $display ("%d: C%d Non-mutex hit in the icache: %4b\n", $time, coreid, waysel_buf_s1);
	     if (enable)
	       `MONITOR_PATH.fail("Non-mutex hit in the icache");
	     else
	       $display("Warning-> Non-mutex hit in the icache");
	  end // if (!((waysel_buf_s1 == 4'b0001) ||...
      end // if (rst_l)
   end
endmodule