module instantiation
  generate if (1) begin: gen_gtwiz_userclk_tx_main
    // Use BUFG_GT instance(s) to drive TXUSRCLK and TXUSRCLK2, inferred for integral source to TXUSRCLK frequency ratio
    if (P_CONTENTS == 0) begin
      // Drive TXUSRCLK with BUFG_GT-buffered source clock, dividing the input by the integral source clock to TXUSRCLK
      // frequency ratio
      BUFG_GT bufg_gt_usrclk_inst (
        .CE      (1'b1),
        .CEMASK  (1'b0),
        .CLR     (gtwiz_userclk_tx_reset_in),
        .CLRMASK (1'b0),
        .DIV     (P_USRCLK_DIV),
        .I       (gtwiz_userclk_tx_srcclk_in),
        .O       (gtwiz_userclk_tx_usrclk_out)
      );
      // If TXUSRCLK and TXUSRCLK2 frequencies are identical, drive both from the same BUFG_GT. Otherwise, drive
      // TXUSRCLK2 from a second BUFG_GT instance, dividing the source clock down to the TXUSRCLK2 frequency.
      if (P_FREQ_RATIO_USRCLK_TO_USRCLK2 == 1)
        assign gtwiz_userclk_tx_usrclk2_out = gtwiz_userclk_tx_usrclk_out;
      else begin
        BUFG_GT bufg_gt_usrclk2_inst (
          .CE      (1'b1),
          .CEMASK  (1'b0),
          .CLR     (gtwiz_userclk_tx_reset_in),
          .CLRMASK (1'b0),
          .DIV     (P_USRCLK2_DIV),
          .I       (gtwiz_userclk_tx_srcclk_in),
          .O       (gtwiz_userclk_tx_usrclk2_out)
        );
      end
      // Indicate active helper block functionality when the BUFG_GT divider is not held in reset
      (* ASYNC_REG = "TRUE" *) reg gtwiz_userclk_tx_active_meta = 1'b0;
      (* ASYNC_REG = "TRUE" *) reg gtwiz_userclk_tx_active_sync = 1'b0;
      always @(posedge gtwiz_userclk_tx_usrclk2_out, posedge gtwiz_userclk_tx_reset_in) begin
        if (gtwiz_userclk_tx_reset_in) begin
          gtwiz_userclk_tx_active_meta <= 1'b0;
          gtwiz_userclk_tx_active_sync <= 1'b0;
        end
        else begin
          gtwiz_userclk_tx_active_meta <= 1'b1;
          gtwiz_userclk_tx_active_sync <= gtwiz_userclk_tx_active_meta;
        end
      end
      assign gtwiz_userclk_tx_active_out = gtwiz_userclk_tx_active_sync;
    end
  end
  endgenerate
endmodule