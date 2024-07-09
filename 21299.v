module). In addition
      //      user may want to instantiate more VIO modules to control
      //      IDELAY for more DQ, DQS than is shown here
      icon4 u_icon
        (
         .control0 (cs_control0),
         .control1 (cs_control1),
         .control2 (cs_control2),
         .control3 (cs_control3)
         );
      // VIO ASYNC input: Display current IDELAY setting for up to 32
      // DQ taps (32x6) = 192
      vio_async_in192 u_vio0
        (
         .control  (cs_control0),
         .async_in (vio0_in)
         );
      // VIO ASYNC input: Display current IDELAY setting for up to 8 DQS
      // and DQS Gate taps (8x6x2) = 96
      vio_async_in96 u_vio1
        (
         .control  (cs_control1),
         .async_in (vio1_in)
         );
      // VIO ASYNC input: Display other calibration results
      vio_async_in100 u_vio2
        (
         .control  (cs_control2),
         .async_in (vio2_in)
         );
      // VIO SYNC output: Dynamically change IDELAY taps
      vio_sync_out32 u_vio3
        (
         .control  (cs_control3),
         .clk      (clkdiv0),
         .sync_out (vio3_out)
         );
      // Bit assignments:
      // NOTE: Not all VIO, ILA inputs/outputs may be used - these will
      //       be dependent on the user's particular bit width
      if (DQ_WIDTH <= 32) begin: gen_dq_le_32
        assign vio0_in[(6*DQ_WIDTH)-1:0]
                 = dbg_calib_dq_tap_cnt[(6*DQ_WIDTH)-1:0];
      end else begin: gen_dq_gt_32
        assign vio0_in = dbg_calib_dq_tap_cnt[191:0];
      end
      if (DQS_WIDTH <= 8) begin: gen_dqs_le_8
        assign vio1_in[(6*DQS_WIDTH)-1:0]
                 = dbg_calib_dqs_tap_cnt[(6*DQS_WIDTH)-1:0];
        assign vio1_in[(12*DQS_WIDTH)-1:(6*DQS_WIDTH)]
                 =  dbg_calib_gate_tap_cnt[(6*DQS_WIDTH)-1:0];
      end else begin: gen_dqs_gt_32
        assign vio1_in[47:0]  = dbg_calib_dqs_tap_cnt[47:0];
        assign vio1_in[95:48] = dbg_calib_gate_tap_cnt[47:0];
      end
//dbg_calib_rd_data_sel
     if (DQS_WIDTH <= 8) begin: gen_rdsel_le_8
        assign vio2_in[(DQS_WIDTH)+7:8]
	         = dbg_calib_rd_data_sel[(DQS_WIDTH)-1:0];
     end else begin: gen_rdsel_gt_32
      assign vio2_in[15:8]
                 = dbg_calib_rd_data_sel[7:0];
     end
//dbg_calib_rden_dly
     if (DQS_WIDTH <= 8) begin: gen_calrd_le_8
       assign vio2_in[(5*DQS_WIDTH)+19:20]
                 = dbg_calib_rden_dly[(5*DQS_WIDTH)-1:0];
     end else begin: gen_calrd_gt_32
       assign vio2_in[59:20]
                 = dbg_calib_rden_dly[39:0];
     end
//dbg_calib_gate_dly
     if (DQS_WIDTH <= 8) begin: gen_calgt_le_8
       assign vio2_in[(5*DQS_WIDTH)+59:60]
                 = dbg_calib_gate_dly[(5*DQS_WIDTH)-1:0];
     end else begin: gen_calgt_gt_32
       assign vio2_in[99:60]
                 = dbg_calib_gate_dly[39:0];
     end
//dbg_sel_idel_dq
     if (DQ_BITS <= 5) begin: gen_selid_le_5
       assign dbg_sel_idel_dq[DQ_BITS-1:0]
                 = vio3_out[DQ_BITS+7:8];
     end else begin: gen_selid_gt_32
       assign dbg_sel_idel_dq[4:0]
                 = vio3_out[12:8];
     end
//dbg_sel_idel_dqs
     if (DQS_BITS <= 3) begin: gen_seldqs_le_3
       assign dbg_sel_idel_dqs[DQS_BITS:0]
                 = vio3_out[(DQS_BITS+16):16];
     end else begin: gen_seldqs_gt_32
       assign dbg_sel_idel_dqs[3:0]
                 = vio3_out[19:16];
     end
//dbg_sel_idel_gate
     if (DQS_BITS <= 3) begin: gen_gtdqs_le_3
       assign dbg_sel_idel_gate[DQS_BITS:0]
                 = vio3_out[(DQS_BITS+21):21];
     end else begin: gen_gtdqs_gt_32
       assign dbg_sel_idel_gate[3:0]
                 = vio3_out[24:21];
     end
      assign vio2_in[3:0]              = dbg_calib_done;
      assign vio2_in[7:4]              = dbg_calib_err;
      assign dbg_idel_up_all           = vio3_out[0];
      assign dbg_idel_down_all         = vio3_out[1];
      assign dbg_idel_up_dq            = vio3_out[2];
      assign dbg_idel_down_dq          = vio3_out[3];
      assign dbg_idel_up_dqs           = vio3_out[4];
      assign dbg_idel_down_dqs         = vio3_out[5];
      assign dbg_idel_up_gate          = vio3_out[6];
      assign dbg_idel_down_gate        = vio3_out[7];
      assign dbg_sel_all_idel_dq       = vio3_out[15];
      assign dbg_sel_all_idel_dqs      = vio3_out[20];
      assign dbg_sel_all_idel_gate     = vio3_out[25];
    end
  endgenerate
endmodule