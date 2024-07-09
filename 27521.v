module mig_7series_v2_0_qdr_rld_phy_ck_addr_cmd_delay #
  (
   parameter TCQ          = 100,       // clk->out delay (sim only)
   parameter BURST_LEN   = 4,      //Burst Length
   parameter nCK_PER_CLK  = 2,         // # of memory clocks per CLK
   parameter CLK_PERIOD   = 3636,      // Internal clock period (in ps) - for a 550 MHz clk(clk period-1818ps), fabric clk period is 3636ps
   parameter N_CTL_LANES  = 3          // Number of control byte lanes
   )
  (
   input            clk,            // half or quarter rate core clock
   input            rst,            // half or quarter rate core clk reset
   input            cmd_delay_start,
   //input            phy_ctl_ready,  // PHY Control Block is ready for operation
   output reg [5:0] ctl_lane_cnt,   // The control byte lane Phaser_Out
                                    // being accessed
   output reg       po_stg2_f_incdec,// Inc/dec Phaser_Out fine delay line
   output reg       po_en_stg2_f,   // Enable Phaser_Out fine delay inc/dec
   output           po_ck_addr_cmd_delay_done // Completed delaying Ck,addr,
                                              // cmd and ctl Phaser_Outs
   );
   localparam TAP_CNT_LIMIT = 63;
   //Calculate the tap resolution of the PHASER based on the clock period
   localparam FREQ_REF_DIV           = (CLK_PERIOD > 5000 ? 4 :
                                        CLK_PERIOD > 2500 ? 2 : 1);
   localparam real FREQ_REF_PS       = CLK_PERIOD/FREQ_REF_DIV;
   localparam integer PHASER_TAP_RES = ((FREQ_REF_PS/2)/64);
   // No. of Phaser taps for 1/4 of memory clock period
   localparam CALC_TAP_CNT = (CLK_PERIOD / (4 * PHASER_TAP_RES));
   //For now make sure our TAP_CNT calculation doesn't overflow
   localparam TAP_CNT = (CALC_TAP_CNT > TAP_CNT_LIMIT) ?
                         TAP_CNT_LIMIT : CALC_TAP_CNT;
//   localparam DIV4_CK
//             = ((CLK_PERIOD/nCK_PER_CLK)/4);
//   localparam TAP_CNT = (300 + ((CLK_PERIOD/nCK_PER_CLK)/64) - 1)/
//                        ((CLK_PERIOD/nCK_PER_CLK)/64);
   reg       delay_done;
   reg       delay_done_r1;
   reg       delay_done_r2;
   reg       delay_done_r3;
   reg       delay_done_r4;
   reg [5:0] delay_cnt_r;
   assign po_ck_addr_cmd_delay_done = (BURST_LEN == 2)? cmd_delay_start : delay_done_r4;
   //po_stg2_f_incdec and po_en_stg2_f stay asserted HIGH for TAP_COUNT cycles for every control byte lane
   //the alignment is started once the
   always @(posedge clk) begin
     if (rst || ~cmd_delay_start || delay_done || (delay_cnt_r == 6'd1)) begin
       po_stg2_f_incdec <= #TCQ 1'b0;
       po_en_stg2_f     <= #TCQ 1'b0;
     end else if (((delay_cnt_r == 6'd0) || (delay_cnt_r == TAP_CNT)) && (ctl_lane_cnt < N_CTL_LANES)) begin
       po_stg2_f_incdec <= #TCQ 1'b1;
       po_en_stg2_f     <= #TCQ 1'b1;
     end
   end
   // delay counter to count TAP_CNT cycles
   always @(posedge clk) begin
     // load delay counter with init value of TAP_CNT
     if (rst || ~cmd_delay_start ||((delay_cnt_r == 6'd0) && (ctl_lane_cnt < N_CTL_LANES)))
       delay_cnt_r  <= #TCQ TAP_CNT;
     else if (po_en_stg2_f && (delay_cnt_r > 6'd0))
       delay_cnt_r  <= #TCQ delay_cnt_r - 1;
   end
   //ctl_lane_cnt is used to count the number of CTL_LANES or byte lanes that have the address/command phase shifted by 1/4 mem. cycle
   //This ensures all ctrl byte lanes have had their output phase shifted.
   always @(posedge clk) begin
     if (rst || ~cmd_delay_start )
       ctl_lane_cnt <= #TCQ 6'b0;
     else if (~delay_done && (ctl_lane_cnt == N_CTL_LANES-1) && (delay_cnt_r == 6'd1))
       ctl_lane_cnt <= #TCQ ctl_lane_cnt;
     else if ((ctl_lane_cnt != N_CTL_LANES-1) && (delay_cnt_r == 6'd1))
        ctl_lane_cnt <= #TCQ ctl_lane_cnt + 1;
   end
   // when all the ctl_lanes have their output phase shifted by 1/4 cycle, delay shifting is done.
   always @(posedge clk) begin
     if (rst )  begin
       delay_done    <= #TCQ 1'b0;
     //end else if (((delay_cnt_r == 6'd2) && (ctl_lane_cnt == N_CTL_LANES-1)) || (BURST_LEN == 2)) begin
     end else if ((delay_cnt_r == 6'd2) && (ctl_lane_cnt == N_CTL_LANES-1))  begin
       delay_done    <= #TCQ 1'b1;
     end
   end
   always @(posedge clk) begin
     delay_done_r1 <= #TCQ delay_done;
     delay_done_r2 <= #TCQ delay_done_r1;
     delay_done_r3 <= #TCQ delay_done_r2;
     delay_done_r4 <= #TCQ delay_done_r3;
   end
endmodule