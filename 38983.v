module nc_inv_chk (/*AUTOARG*/
   // Inputs
   clk, rst_l, cpxpkt_vld, cpxpkt_rtntype, nc, wv, coreid
   );
   input clk;
   input rst_l;
   input cpxpkt_vld;
   input [3:0] cpxpkt_rtntype;
   input nc;
   input wv;
   input [2:0] coreid;
   reg 	 enable;
   initial begin
      enable = 1;
      if ($test$plusargs("turn_off_nc_inv_chk"))enable = 0;
   end
   always @(negedge clk) begin
      if (rst_l) begin
	if (cpxpkt_vld == 1'b1 && cpxpkt_rtntype == 4'b0000 && nc == 1'b1 && wv == 1'b1)
	  begin
	    $display ("%d: C%d non-cachable load invalidating I$\n", $time, coreid);
	    if (enable)
	      `MONITOR_PATH.fail("non-cachable load invalidating I$");
	    else
	      $display("Warning-> non-cachable load invalidating I$");
	  end
        end
     end
endmodule