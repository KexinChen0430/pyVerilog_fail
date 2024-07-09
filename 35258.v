module), the data inputs for the
  // user logic may be raw or offset-&-scaled data (see wire definitions above).
  // The user must correctly specify the following parameters so that the drivers
  // would know the decimation factor and the output data type (I/Q).
  // The driver must also enable the up_usr_sel to select user logic output.
  // THIS IS NOT A COMPLETE SOLUTION and individual needs may vary.
  // Also note that the data bitwidths may require padding or truncation to match the
  // external DMA bus width. This design as it is, uses 64bits.
  // A 4bit user logic select (max 16) is provided for tap points within the user logic.
  // Modify the following mux accordingly. If a tap point is not used, please drive
  // the decimation factors '0'. The example code below uses 2 tap points
  // Also note that there are processor based decimation and type controls-
  // If you are planning to put a programmable decimation filter, you may use these
  // signals (up_*) to control the decimation and data type. In this case, do
  // make sure to route the up_* signals to the usr_* - this allows software
  // writes to be read back. If software can not read back, it will default to a
  // read only mode (programmability is disabled).
  always @(posedge adc_clk) begin
    usr_max_channels <= 4'd1; // channel selects from 0 to 1.
    case (adc_usr_sel)
      4'b0000: begin // tap point 1. (let's say output of pulse shaping filter)
        usr_decimation_m <= 16'd1; // user logic decimation numerator
        usr_decimation_n <= 16'd1; // user logic decimation denominator
        usr_data_type <= 1'b0; // user logic output type (0 - complex, 1- real)
        usr_data_valid <= 1'd1; // user data valid (replace with user logic)
        usr_data <= {4{16'hf00d}}; // user data (replace with user logic)
      end
      4'b0001: begin // tap point 2. (let's say output of symbol timing recovery)
        usr_decimation_m <= 16'd1; // user logic decimation numerator
        usr_decimation_n <= 16'd1; // user logic decimation denominator
        usr_data_type <= 1'b0; // user logic output type (0 - complex, 1- real)
        usr_data_valid <= 1'd1; // user data valid (replace with user logic)
        usr_data <= {4{16'hcafe}}; // user data (replace with user logic)
      end
      default: begin // unused tap points
        usr_decimation_m <= up_decimation_m; // user logic decimation numerator
        usr_decimation_n <= up_decimation_n; // user logic decimation denominator
        usr_data_type <= up_data_type; // user logic output type (0 - complex, 1- real)
        usr_data_valid <= 1'd1; // user data valid (replace with user logic)
        usr_data <= {4{16'hdead}}; // user data (replace with user logic)
      end
    endcase
  end
  assign adc_mon_valid = 1'b1;
  assign adc_mon_data = {adc_data_b_s, adc_data_a_s};
  // the adc channel select let you pick a particular channel -
  always @(posedge adc_clk) begin
    adc_usr_sel_m1 <= up_usr_sel;
    adc_usr_sel <= adc_usr_sel_m1;
    adc_ch_sel_m1 <= up_ch_sel;
    adc_ch_sel <= adc_ch_sel_m1;
    adc_cnt <= adc_cnt + 1'b1;
    case (adc_ch_sel)
      2'b11: begin // both I and Q
        adc_valid <= adc_cnt[0];
        adc_data <= {adc_data_a_s, adc_data_b_s, adc_data[63:32]};
      end
      2'b10: begin // Q only
        adc_valid <= adc_cnt[1] & adc_cnt[0];
        adc_data <= {adc_data_b_s, adc_data[63:16]};
      end
      2'b01: begin // I only
        adc_valid <= adc_cnt[1] & adc_cnt[0];
        adc_data <= {adc_data_a_s, adc_data[63:16]};
      end
      default: begin  // user data
        adc_valid <= usr_data_valid;
        adc_data <= usr_data;
      end
    endcase
  end
  // register filtered signals
  always @(posedge adc_clk) begin
    adc_data_a_dcfilter <= adc_data_a_dcfilter_s;
    adc_data_b_dcfilter <= adc_data_b_dcfilter_s;
  end
  // pn sequence monitor
  cf_pnmon i_pnmon_a (
    .adc_clk (adc_clk),
    .adc_data (adc_data_a_if_s),
    .adc_pn_oos (adc_pn_oos[0]),
    .adc_pn_err (adc_pn_err[0]),
    .up_pn_type (up_pn_type[0]));
  // dc filters
  cf_dcfilter i_dcfilter_a (
    .adc_clk (adc_clk),
    .data_in (adc_data_a_if_s),
    .data_out (adc_data_a_dcfilter_s),
    .coeff (up_dcfilter_coeff_a));
  // offset & scale
  cf_muladd i_muladd_a (
    .adc_clk (adc_clk),
    .data_in (adc_data_a_dcfilter),
    .data_out (adc_data_a_s),
    .up_signext_enable (up_signext_enable),
    .up_muladd_enable (up_muladd_enable),
    .up_muladd_offbin (up_muladd_offbin),
    .up_muladd_scale (up_muladd_scale_a),
    .up_muladd_offset (up_muladd_offset_a));
  // pn sequence monitor
  cf_pnmon i_pnmon_b (
    .adc_clk (adc_clk),
    .adc_data (adc_data_b_if_s),
    .adc_pn_oos (adc_pn_oos[1]),
    .adc_pn_err (adc_pn_err[1]),
    .up_pn_type (up_pn_type[1]));
  // dc filters
  cf_dcfilter i_dcfilter_b (
    .adc_clk (adc_clk),
    .data_in (adc_data_b_if_s),
    .data_out (adc_data_b_dcfilter_s),
    .coeff (up_dcfilter_coeff_b));
  // offset & scale
  cf_muladd i_muladd_b (
    .adc_clk (adc_clk),
    .data_in (adc_data_b_dcfilter),
    .data_out (adc_data_b_s),
    .up_signext_enable (up_signext_enable),
    .up_muladd_enable (up_muladd_enable),
    .up_muladd_offbin (up_muladd_offbin),
    .up_muladd_scale (up_muladd_scale_b),
    .up_muladd_offset (up_muladd_offset_b));
  // adc data interface
  cf_adc_if #(.C_CF_BUFTYPE (C_CF_BUFTYPE), .C_IODELAY_GROUP(C_IODELAY_GROUP)) i_adc_if (
    .adc_clk_in_p (adc_clk_in_p),
    .adc_clk_in_n (adc_clk_in_n),
    .adc_data_in_p (adc_data_in_p),
    .adc_data_in_n (adc_data_in_n),
    .adc_data_or_p (adc_data_or_p),
    .adc_data_or_n (adc_data_or_n),
    .adc_clk (adc_clk),
    .adc_data_a (adc_data_a_if_s),
    .adc_data_b (adc_data_b_if_s),
    .adc_or (adc_or),
    .up_dmode (up_dmode),
    .up_delay_sel (up_delay_sel),
    .up_delay_rwn (up_delay_rwn),
    .up_delay_addr (up_delay_addr),
    .up_delay_wdata (up_delay_wdata),
    .delay_clk (delay_clk),
    .delay_ack (delay_ack),
    .delay_rdata (delay_rdata),
    .delay_locked (delay_locked));
endmodule