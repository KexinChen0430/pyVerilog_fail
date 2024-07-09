module. Any csc conversions must be disabled on info frame
  assign hdmi_tpm_mismatch_s = (hdmi_data_422 == hdmi_tpm_data_s) ? 1'b0 : hdmi_de_422;
  assign hdmi_tpm_data_s = {hdmi_tpm_data[3:2], 6'h20, hdmi_tpm_data[1:0], 6'h20};
  always @(posedge hdmi_clk) begin
    if (hdmi_fs_422 == 1'b1) begin
      hdmi_tpm_data <= 'd0;
    end else if (hdmi_de_422 == 1'b1) begin
      hdmi_tpm_data <= hdmi_tpm_data + 1'b1;
    end
    hdmi_tpm_oos <= hdmi_tpm_mismatch_s;
  end
  // fs, enable and data on 422 and 444 domains
  always @(posedge hdmi_clk) begin
    hdmi_fs_422 <= hdmi_sof & hdmi_enable;
    hdmi_de_422 <= hdmi_hs_de & hdmi_vs_de & hdmi_enable;
    hdmi_data_422 <= hdmi_data_de;
    hdmi_fs_444_d <= hdmi_fs_444;
    hdmi_de_444_d <= hdmi_de_444;
    hdmi_data_444_d <= hdmi_data_444;
    hdmi_data_444_2d <= hdmi_data_444_d;
    hdmi_data_444_3d <= hdmi_data_444_2d;
  end
  // Select output data depending on the control setting
  always @(posedge hdmi_clk) begin
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
    end else if (hdmi_up_bgr == 1'b1) begin
      hdmi_data_444 <= {hdmi_data_444_s[7:0], hdmi_data_444_s[15:8], hdmi_data_444_s[23:16]};
    end else begin
      hdmi_data_444 <= hdmi_data_444_s;
    end
  end
  // start of frame
  assign hdmi_sof_s = hdmi_vs_de & ~hdmi_vs_de_d;
  assign hdmi_oos_hs_s = hdmi_hs_count == hdmi_up_hs_count ? hdmi_hs_count_mismatch : 1'b1;
  assign hdmi_oos_vs_s = hdmi_vs_count == hdmi_up_vs_count ? hdmi_vs_count_mismatch : 1'b1;
  // hdmi side of the interface, horizontal and vertical sync counters.
  // capture active video size and report mismatch
  always @(posedge hdmi_clk) begin
    hdmi_oos_hs <= hdmi_oos_hs_s;
    hdmi_oos_vs <= hdmi_oos_vs_s;
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
      hdmi_hs_count <= hdmi_hs_run_count;
      hdmi_hs_count_update <= 1'b1;
    end else begin
	  hdmi_hs_count_update <= 1'b0;
	end
    if ((hdmi_vs_de == 1'b0) && (hdmi_vs_de_d == 1'b1)) begin
      hdmi_vs_count_mismatch <= (hdmi_vs_count == hdmi_vs_run_count) ? 1'b0 : 1'b1;
      hdmi_vs_count <= hdmi_vs_run_count;
      hdmi_vs_count_update <= 1'b1;
    end else begin
      hdmi_vs_count_update <= 1'b0;
	end
    if (hdmi_sof_s == 1'b1) begin
      hdmi_enable <= hdmi_up_enable & ~hdmi_oos_hs_s & ~hdmi_oos_vs_s;
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
  embedded_sync_decoder es_decoder (
	.clk (hdmi_clk),
	.data_in (hdmi_data_p),
	.hs_de (hdmi_hs_de),
	.vs_de (hdmi_vs_de),
	.data_out (hdmi_data_de)
  );
  // super sampling, 422 to 444
  ad_ss_422to444 #(
    .Cr_Cb_N(0),
    .DELAY_DATA_WIDTH(2)
  ) i_ss (
    .clk (hdmi_clk),
    .s422_de (hdmi_de_422),
	.s422_sync ({hdmi_fs_422,hdmi_de_422}),
    .s422_data (hdmi_data_422),
	.s444_sync ({ss_fs_s,ss_de_s}),
    .s444_data (ss_data_s)
  );
  // color space conversion, CrYCb to RGB
  ad_csc_CrYCb2RGB #(
    .DELAY_DATA_WIDTH(2)
  ) i_csc (
    .clk (hdmi_clk),
    .CrYCb_sync ({ss_fs_s, ss_de_s}),
    .CrYCb_data (ss_data_s),
    .RGB_sync ({hdmi_fs_444_s, hdmi_de_444_s}),
    .RGB_data (hdmi_data_444_s)
  );
endmodule