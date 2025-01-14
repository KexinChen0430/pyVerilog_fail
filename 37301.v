module exu_mon(/*AUTOARG*/
   // Inputs
   clk, rst_l, exu_irf_wen, exu_irf_wen2, exu_irf_data, exu_irf_data2,
   exu_rd, restore_request, divcntl_wb_req_g
   );
   input        clk;
   input        rst_l;
   input        exu_irf_wen;
   input        exu_irf_wen2;
   input [71:0] exu_irf_data;
   input [71:0] exu_irf_data2;
   input [4:0] 	exu_rd;
   input  	restore_request;
   input  	divcntl_wb_req_g;
   reg 		enable;
   integer      restore_count, divcntl_wb_req_count;
   initial begin
      enable = 1;
      restore_count = 0;
      divcntl_wb_req_count = 0;
      if ($test$plusargs("turn_off_exu_monitor")) enable = 0;
   end
   always @(posedge clk)begin
      if(rst_l && enable) begin
	 // check for X being written into registers.
	 if(((exu_irf_wen == 1'b1) && (^exu_irf_data === 1'bx)) ||
	    ((exu_irf_wen2 == 1'b1) && (^exu_irf_data2 === 1'bx))) begin
	     $display("Info: attempt to write X to register %d at time %0d.", exu_rd, $time);
	     `MONITOR_PATH.fail("exu_mon: attempt to write X to register detected.");
	 end
      end // if (!reset)
   end    // always @(negedge clk)
   always @(posedge clk) begin
      if(rst_l && enable) begin
        if(restore_request == 1'b1) begin
           if(restore_count > 5) begin
	     $display("Info: exu_mon: restore_request active for more than 5 cycles : time %0d.", $time);
             `MONITOR_PATH.fail("exu_mon: restore_request active for more than 5 cycles");
           end
           else begin
             restore_count = restore_count + 1;
           end
        end
        else begin
          restore_count = 0;
        end
      end
    end
   always @(posedge clk) begin
      if(rst_l && enable) begin
        if(divcntl_wb_req_g == 1'b1) begin
           if(divcntl_wb_req_count > 5) begin
	     $display("Info: exu_mon: divcntl_wb_req_g active for more than 5 cycles : time %0d.", $time);
            `MONITOR_PATH.fail("exu_mon: divcntl_wb_req_g active for more than 5 cycles");
           end
           else begin
             divcntl_wb_req_count = divcntl_wb_req_count + 1;
           end
        end
        else begin
          divcntl_wb_req_count = 0;
        end
      end
    end
endmodule