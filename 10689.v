module. Any csc conversions must be disabled on info frame
  assign hdmi_tpm_mismatch_s = (hdmi_data_422 == hdmi_tpm_data_s) ? 1'b0 : hdmi_de_422;
  assign hdmi_tpm_data_s = {hdmi_tpm_data[3:2], 6'h20, hdmi_tpm_data[1:0], 6'h20};
  always @(posedge hdmi_clk) begin
    if (hdmi_fs_422 == 1'b1) begin
      hdmi_tpm_data <= 'd0;
    end else if (hdmi_de_422 == 1'b1) begin
      hdmi_tpm_data <= hdmi_tpm_data + 1'b1;
    end
    if (hdmi_tpm_mismatch_s == 1'b1) begin
      hdmi_tpm_mismatch_count <= 5'h10;
    end else if (hdmi_tpm_mismatch_count[4] == 1'b1) begin
      hdmi_tpm_mismatch_count <= hdmi_tpm_mismatch_count + 1'b1;
    end
    hdmi_tpm_oos <= hdmi_tpm_mismatch_count[4];
  end
  // fs, enable and data on 422 and 444 domains
  always @(posedge hdmi_clk) begin
    hdmi_fs_422 <= hdmi_sof & hdmi_enable;
    hdmi_de_422 <= hdmi_hs_de & hdmi_vs_de & hdmi_enable;
    hdmi_data_422 <= hdmi_data_de;
    if (hdmi_up_csc_bypass == 1'b1) begin
      hdmi_fs_444 <= hdmi_fs_422;
      hdmi_de_444 <= hdmi_de_422;
    end else begin
      hdmi_fs_444 <= hdmi_fs_444_s;
      hdmi_de_444 <= hdmi_de_444_s;
    end
    if (hdmi_up_tpg_enable == 1'b1) begin
      hdmi_data_444 <= hdmi_tpm_data;
    end else if (hdmi_up_csc_bypass == 1'b1) begin
      hdmi_data_444 <= {8'd0, hdmi_data_422};
    end else begin
      hdmi_data_444 <= hdmi_data_444_s;
    end
    hdmi_fs_444_d <= hdmi_fs_444;
    hdmi_de_444_d <= hdmi_de_444;
    hdmi_data_444_d <= hdmi_data_444;
  end
  // start of frame
  assign hdmi_sof_s = hdmi_vs_de & ~hdmi_vs_de_d;
  assign hdmi_count_mismatch_s = hdmi_hs_count_mismatch | hdmi_vs_count_mismatch;
  assign hdmi_oos_s = ((hdmi_hs_count == hdmi_up_hs_count) &&
    (hdmi_vs_count == hdmi_up_vs_count)) ? hdmi_count_mismatch_s : 1'b1;
  // hdmi side of the interface, horizontal and vertical sync counters.
  // capture active video size and report mismatch
  always @(posedge hdmi_clk) begin
    hdmi_oos <= hdmi_oos_s;
    hdmi_sof <= hdmi_sof_s;
    hdmi_hs_de_d <= hdmi_hs_de;
    hdmi_vs_de_d <= hdmi_vs_de;
    if ((hdmi_hs_de == 1'b1) && (hdmi_hs_de_d == 1'b0)) begin
      hdmi_hs_run_count <= 'd1;
    end else if (hdmi_hs_de == 1'b1) begin
      hdmi_hs_run_count <= hdmi_hs_run_count + 1'b1;
    end
    if ((hdmi_vs_de == 1'b1) && (hdmi_vs_de_d == 1'b0)) begin
      hdmi_vs_run_count <= 'd0;
    end else if ((hdmi_vs_de == 1'b1) && (hdmi_hs_de == 1'b1) && (hdmi_hs_de_d == 1'b0)) begin
      hdmi_vs_run_count <= hdmi_vs_run_count + 1'b1;
    end
    if ((hdmi_hs_de == 1'b0) && (hdmi_hs_de_d == 1'b1)) begin
      hdmi_hs_count_mismatch <= (hdmi_hs_count == hdmi_hs_run_count) ? 1'b0 : 1'b1;
      hdmi_hs_count_toggle <= ~hdmi_hs_count_toggle;
      hdmi_hs_count <= hdmi_hs_run_count;
    end
    if ((hdmi_vs_de == 1'b0) && (hdmi_vs_de_d == 1'b1)) begin
      hdmi_vs_count_mismatch <= (hdmi_vs_count == hdmi_vs_run_count) ? 1'b0 : 1'b1;
      hdmi_vs_count_toggle <= ~hdmi_vs_count_toggle;
      hdmi_vs_count <= hdmi_vs_run_count;
    end
    if (hdmi_sof_s == 1'b1) begin
      hdmi_enable <= hdmi_up_enable & ~hdmi_oos_s;
    end
  end
  // delay to get rid of eav's 4 bytes
  always @(posedge hdmi_clk) begin
    hdmi_data_d <= hdmi_data_p;
    hdmi_hs_de_rcv_d <= hdmi_hs_de_rcv;
    hdmi_vs_de_rcv_d <= hdmi_vs_de_rcv;
    hdmi_data_2d <= hdmi_data_d;
    hdmi_hs_de_rcv_2d <= hdmi_hs_de_rcv_d;
    hdmi_vs_de_rcv_2d <= hdmi_vs_de_rcv_d;
    hdmi_data_3d <= hdmi_data_2d;
    hdmi_hs_de_rcv_3d <= hdmi_hs_de_rcv_2d;
    hdmi_vs_de_rcv_3d <= hdmi_vs_de_rcv_2d;
    hdmi_data_4d <= hdmi_data_3d;
    hdmi_hs_de_rcv_4d <= hdmi_hs_de_rcv_3d;
    hdmi_vs_de_rcv_4d <= hdmi_vs_de_rcv_3d;
    hdmi_data_de <= hdmi_data_4d;
    hdmi_hs_de <= hdmi_hs_de_rcv & hdmi_hs_de_rcv_4d;
    hdmi_vs_de <= hdmi_vs_de_rcv & hdmi_vs_de_rcv_4d;
  end
  // check for sav and eav and generate the corresponding enables
  always @(posedge hdmi_clk) begin
    if ((hdmi_data_p == 16'hffff) || (hdmi_data_p == 16'h0000)) begin
      hdmi_preamble_cnt <= hdmi_preamble_cnt + 1'b1;
    end else begin
      hdmi_preamble_cnt <= 'd0;
    end
    if (hdmi_preamble_cnt == 3'b11) begin
      if ((hdmi_data_p == 16'hb6b6) || (hdmi_data_p == 16'h9d9d)) begin
        hdmi_hs_de_rcv <= 1'b0;
      end else if ((hdmi_data_p == 16'habab) || (hdmi_data_p == 16'h8080)) begin
        hdmi_hs_de_rcv <= 1'b1;
      end
      if (hdmi_data_p == 16'hb6b6) begin
        hdmi_vs_de_rcv <= 1'b0;
      end else if (hdmi_data_p == 16'h9d9d) begin
        hdmi_vs_de_rcv <= 1'b1;
      end
    end
  end
  // hdmi input data registers
  always @(posedge hdmi_clk) begin
    hdmi_data_neg_p <= hdmi_data_neg;
    hdmi_data_pos_p <= hdmi_data;
    if (hdmi_up_edge_sel == 1'b1) begin
      hdmi_data_p <= hdmi_data_neg_p;
    end else begin
      hdmi_data_p <= hdmi_data_pos_p;
    end
  end
  always @(negedge hdmi_clk) begin
    hdmi_data_neg <= hdmi_data;
  end
  // microprocessor signals on the hdmi side
  reg [2:0] hdmi_up_toggle;
  assign hdmi_up_toggle_ret = hdmi_up_toggle[2];
  always @(posedge hdmi_clk) begin
    hdmi_up_toggle[0] <= up_toggle;
    hdmi_up_toggle[2:1] <= hdmi_up_toggle[1:0];
    if (hdmi_up_toggle[2] ^ hdmi_up_toggle[1]) begin
      hdmi_up_enable <= up_enable;
      hdmi_up_crcb_init <= up_crcb_init;
      hdmi_up_edge_sel <= up_edge_sel;
      hdmi_up_hs_count <= up_hs_count;
      hdmi_up_vs_count <= up_vs_count;
      hdmi_up_csc_bypass <= up_csc_bypass;
      hdmi_up_tpg_enable <= up_tpg_enable;
    end
   end
  // super sampling, 422 to 444
  cf_ss_422to444 i_ss (
    .clk (hdmi_clk),
    .s422_vs (1'b0),
    .s422_hs (hdmi_fs_422),
    .s422_de (hdmi_de_422),
    .s422_data (hdmi_data_422),
    .s444_vs (),
    .s444_hs (ss_fs_s),
    .s444_de (ss_de_s),
    .s444_data (ss_data_s),
    .Cr_Cb_sel_init (hdmi_up_crcb_init));
  // color space conversion, CrYCb to RGB
  cf_csc_CrYCb2RGB i_csc (
    .clk (hdmi_clk),
    .CrYCb_vs (1'b0),
    .CrYCb_hs (ss_fs_s),
    .CrYCb_de (ss_de_s),
    .CrYCb_data (ss_data_s),
    .RGB_vs (),
    .RGB_hs (hdmi_fs_444_s),
    .RGB_de (hdmi_de_444_s),
    .RGB_data (hdmi_data_444_s));
endmodule