module stb_ovfl_mon (/*AUTOARG*/
   // Inputs
   clk, rst_l, lsu_ifu_stbcnt3, lsu_ifu_stbcnt2, lsu_ifu_stbcnt1, lsu_ifu_stbcnt0,
   stb_ctl_reset3, stb_ctl_reset2, stb_ctl_reset1, stb_ctl_reset0, coreid
   );
   input clk;
   input rst_l;
   input [3:0] lsu_ifu_stbcnt3;
   input [3:0] lsu_ifu_stbcnt2;
   input [3:0] lsu_ifu_stbcnt1;
   input [3:0] lsu_ifu_stbcnt0;
   input       stb_ctl_reset3;
   input       stb_ctl_reset2;
   input       stb_ctl_reset1;
   input       stb_ctl_reset0;
   input [2:0] coreid;
   reg 		enable;
   reg 		stb_ctl_reset3_dly;
   reg 		stb_ctl_reset2_dly;
   reg 		stb_ctl_reset1_dly;
   reg 		stb_ctl_reset0_dly;
   initial begin
      enable = 1;
      if ($test$plusargs("turn_off_stb_ovfl_mon"))enable = 0;
   end
   always @(negedge clk) begin
     if (rst_l) begin
	stb_ctl_reset3_dly <= stb_ctl_reset3;
	stb_ctl_reset2_dly <= stb_ctl_reset2;
	stb_ctl_reset1_dly <= stb_ctl_reset1;
	stb_ctl_reset0_dly <= stb_ctl_reset0;
	if ((lsu_ifu_stbcnt3 > 8) && (stb_ctl_reset3_dly == 1'b0))
	  begin
	     $display ("%d: C%d T3: Store buffer overflow. No of entries = %d\n", $time, coreid, lsu_ifu_stbcnt3);
	     if(enable)`MONITOR_PATH.fail("Store buffer overflow");
	     else $display("Warning -> Store buffer overflow");
          end
	if ((lsu_ifu_stbcnt2 > 8) && (stb_ctl_reset2_dly == 1'b0))
	  begin
	     $display ("%d: C%d T2: Store buffer overflow. No of entries = %d\n", $time, coreid, lsu_ifu_stbcnt2);
	     if(enable)`MONITOR_PATH.fail("Store buffer overflow");
	     else $display("Warning -> Store buffer overflow");
          end
	if ((lsu_ifu_stbcnt1 > 8) && (stb_ctl_reset1_dly == 1'b0))
	  begin
	     $display ("%d: C%d T1: Store buffer overflow. No of entries = %d\n", $time, coreid, lsu_ifu_stbcnt1);
	     if(enable)`MONITOR_PATH.fail("Store buffer overflow");
	     else $display("Warning -> Store buffer overflow");
          end
	if ((lsu_ifu_stbcnt0 > 8) && (stb_ctl_reset0_dly == 1'b0))
	  begin
	     $display ("%d: C%d T0: Store buffer overflow. No of entries = %d\n", $time, coreid, lsu_ifu_stbcnt0);
	     if(enable)`MONITOR_PATH.fail("Store buffer overflow");
	     else $display("Warning -> Store buffer overflow");
          end
       end
     end
endmodule