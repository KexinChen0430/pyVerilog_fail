module does not need to be
      //  interleaved - it's already in the correct format - and the same
      //  initialization pattern from PHY_INIT is sent to all write FIFOs
      for (wdf_di_i = 0; wdf_di_i < MASK_WIDTH;
           wdf_di_i = wdf_di_i + 1) begin: gen_wdf_data_in
        assign i_wdf_data_in[(16*wdf_di_i)+15:(16*wdf_di_i)]
                 = {i_wdf_data_fall_in[(8*wdf_di_i)+7:(8*wdf_di_i)],
                    i_wdf_data_rise_in[(8*wdf_di_i)+7:(8*wdf_di_i)]};
        assign i_wdf_mask_data_in[(2*wdf_di_i)+1:(2*wdf_di_i)]
                 = {i_wdf_mask_data_fall_in[wdf_di_i],
                    i_wdf_mask_data_rise_in[wdf_di_i]};
      end
      // Write data FIFO Output:
      // FIFO DQ and mask outputs must be untangled and put in the standard
      // format of {fall,rise}. Same goes for mask output
      for (wdf_do_i = 0; wdf_do_i < MASK_WIDTH;
           wdf_do_i = wdf_do_i + 1) begin: gen_wdf_data_out
        assign i_wdf_data_rise_out[(8*wdf_do_i)+7:(8*wdf_do_i)]
                 = i_wdf_data_out[(16*wdf_do_i)+7:(16*wdf_do_i)];
        assign i_wdf_data_fall_out[(8*wdf_do_i)+7:(8*wdf_do_i)]
                 = i_wdf_data_out[(16*wdf_do_i)+15:(16*wdf_do_i)+8];
        assign i_wdf_mask_data_rise_out[wdf_do_i]
                 = i_wdf_mask_data_out[2*wdf_do_i];
        assign i_wdf_mask_data_fall_out[wdf_do_i]
                 = i_wdf_mask_data_out[(2*wdf_do_i)+1];
      end
      assign wdf_data = {i_wdf_data_fall_out,
                         i_wdf_data_rise_out};
      assign wdf_mask_data = {i_wdf_mask_data_fall_out,
                              i_wdf_mask_data_rise_out};
      for (wdf_i = 0; wdf_i < WDF_FIFO_NUM; wdf_i = wdf_i + 1) begin: gen_wdf
        FIFO36_72  #
          (
           .ALMOST_EMPTY_OFFSET     (9'h007),
           .ALMOST_FULL_OFFSET      (9'h00F),
           .DO_REG                  (1),          // extra CC output delay
           .EN_ECC_WRITE            ("FALSE"),
           .EN_ECC_READ             ("FALSE"),
           .EN_SYN                  ("FALSE"),
           .FIRST_WORD_FALL_THROUGH ("FALSE")
           )
          u_wdf
            (
             .ALMOSTEMPTY (),
             .ALMOSTFULL  (i_wdf_afull[wdf_i]),
             .DBITERR     (),
             .DO          (i_wdf_data_out[(64*(wdf_i+1))-1:64*wdf_i]),
             .DOP         (i_wdf_mask_data_out[(8*(wdf_i+1))-1:8*wdf_i]),
             .ECCPARITY   (),
             .EMPTY       (),
             .FULL        (),
             .RDCOUNT     (),
             .RDERR       (),
             .SBITERR     (),
             .WRCOUNT     (),
             .WRERR       (),
             .DI          (i_wdf_data_in[(64*(wdf_i+1))-1:64*wdf_i]),
             .DIP         (i_wdf_mask_data_in[(8*(wdf_i+1))-1:8*wdf_i]),
             .RDCLK       (clk90),
             .RDEN        (wdf_rden),
             .RST         (rst_r),          // or can use rst0
             .WRCLK       (clk0),
             .WREN        (app_wdf_wren)
             );
      end
    end
  endgenerate
endmodule