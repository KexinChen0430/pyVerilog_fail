module inputs and outputs to the internal signals of the
   //Inputs
   /*
    wire [C_DIN_WIDTH-1:0] DIN;
   wire [C_RD_PNTR_WIDTH-1:0] PROG_EMPTY_THRESH;
   wire [C_RD_PNTR_WIDTH-1:0] PROG_EMPTY_THRESH_ASSERT;
   wire [C_RD_PNTR_WIDTH-1:0] PROG_EMPTY_THRESH_NEGATE;
   wire [C_WR_PNTR_WIDTH-1:0] PROG_FULL_THRESH;
   wire [C_WR_PNTR_WIDTH-1:0] PROG_FULL_THRESH_ASSERT;
   wire [C_WR_PNTR_WIDTH-1:0] PROG_FULL_THRESH_NEGATE;
   wire RD_CLK;
   wire RD_EN;
   wire RST;
   wire WR_CLK;
   wire WR_EN;
    */
   // Dout may change behavior based on latency
   assign ideal_dout_out[C_DOUT_WIDTH-1:0] = (C_PRELOAD_LATENCY==2 &&
                          (C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1) )?
                         ideal_dout_d1: ideal_dout;
   assign DOUT[C_DOUT_WIDTH-1:0] = ideal_dout_out;
   // Assign SBITERR and DBITERR based on latency
   assign SBITERR = (C_ERROR_INJECTION_TYPE == 1 || C_ERROR_INJECTION_TYPE == 3) &&
                    (C_PRELOAD_LATENCY == 2 &&
                    (C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1) ) ?
                    err_type_d1[0]: err_type[0];
   assign DBITERR = (C_ERROR_INJECTION_TYPE == 2 || C_ERROR_INJECTION_TYPE == 3) &&
                    (C_PRELOAD_LATENCY==2 && (C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1)) ?
                    err_type_d1[1]: err_type[1];
   // Safety-ckt logic with embedded reg/fabric reg
     generate
         if ((C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1) && C_EN_SAFETY_CKT==1 && C_USE_EMBEDDED_REG < 3) begin
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d1;
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d2;
         reg [1:0] rst_delayed_sft1              =1;
         reg [1:0] rst_delayed_sft2              =1;
         reg [1:0] rst_delayed_sft3              =1;
         reg [1:0] rst_delayed_sft4              =1;
       //  if (C_HAS_VALID == 1) begin
       //       assign valid_out = valid_d1;
       //  end
        always@(posedge RD_CLK)
          begin
          rst_delayed_sft1 <= #`TCQ rd_rst_i;
          rst_delayed_sft2 <= #`TCQ rst_delayed_sft1;
          rst_delayed_sft3 <= #`TCQ rst_delayed_sft2;
          rst_delayed_sft4 <= #`TCQ rst_delayed_sft3;
          end
        always@(posedge rst_delayed_sft4 or posedge rd_rst_i or posedge RD_CLK)
          begin
          if( rst_delayed_sft4 == 1'b1 || rd_rst_i == 1'b1)
              ram_rd_en_d1 <= #`TCQ 1'b0;
          else
               ram_rd_en_d1 <= #`TCQ ram_rd_en;
          end
        always@(posedge rst_delayed_sft2 or posedge RD_CLK)
           begin
           if (rst_delayed_sft2 == 1'b1) begin
              if (C_USE_DOUT_RST == 1'b1) begin
                  @(posedge RD_CLK)
                   ideal_dout_d1 <= #`TCQ dout_reset_val;
              end
           end
           else begin
                   if (ram_rd_en_d1) begin
                   ideal_dout_d1   <= #`TCQ ideal_dout;
                   err_type_d1[0] <= #`TCQ err_type[0];
                   err_type_d1[1] <= #`TCQ err_type[1];
                   end
             end
           end
      end
      endgenerate
   // Safety-ckt logic with embedded reg + fabric reg
     generate
         if ((C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1) && C_EN_SAFETY_CKT==1 && C_USE_EMBEDDED_REG == 3) begin
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d1;
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d2;
         reg [1:0] rst_delayed_sft1              =1;
         reg [1:0] rst_delayed_sft2              =1;
         reg [1:0] rst_delayed_sft3              =1;
         reg [1:0] rst_delayed_sft4              =1;
        always@(posedge RD_CLK) begin
          rst_delayed_sft1 <= #`TCQ rd_rst_i;
          rst_delayed_sft2 <= #`TCQ rst_delayed_sft1;
          rst_delayed_sft3 <= #`TCQ rst_delayed_sft2;
          rst_delayed_sft4 <= #`TCQ rst_delayed_sft3;
        end
        always@(posedge rst_delayed_sft4 or posedge rd_rst_i or posedge RD_CLK) begin
          if( rst_delayed_sft4 == 1'b1 || rd_rst_i == 1'b1)
              ram_rd_en_d1 <= #`TCQ 1'b0;
          else begin
               ram_rd_en_d1 <= #`TCQ ram_rd_en;
               fab_rd_en_d1 <= #`TCQ ram_rd_en_d1;
          end
        end
        always@(posedge rst_delayed_sft2 or posedge RD_CLK) begin
           if (rst_delayed_sft2 == 1'b1) begin
              if (C_USE_DOUT_RST == 1'b1) begin
                   @(posedge RD_CLK)
                   ideal_dout_d1 <= #`TCQ dout_reset_val;
                   ideal_dout_both <= #`TCQ dout_reset_val;
              end
           end else begin
             if (ram_rd_en_d1) begin
               ideal_dout_both   <= #`TCQ ideal_dout;
               err_type_both[0] <= #`TCQ err_type[0];
               err_type_both[1] <= #`TCQ err_type[1];
             end
             if (fab_rd_en_d1) begin
               ideal_dout_d1   <= #`TCQ ideal_dout_both;
               err_type_d1[0] <= #`TCQ err_type_both[0];
               err_type_d1[1] <= #`TCQ err_type_both[1];
             end
           end
         end
      end
      endgenerate
   // Overflow may be active-low
   generate
      if (C_HAS_OVERFLOW==1) begin : blockOF1
   assign OVERFLOW = ideal_overflow ? !C_OVERFLOW_LOW : C_OVERFLOW_LOW;
      end
   endgenerate
   assign PROG_EMPTY = ideal_prog_empty;
   assign PROG_FULL  = ideal_prog_full;
   // Valid may change behavior based on latency or active-low
   generate
      if (C_HAS_VALID==1) begin : blockVL1
   assign valid_i   = (C_PRELOAD_LATENCY==0) ? (RD_EN & ~EMPTY) : ideal_valid;
   assign valid_out1 = (C_PRELOAD_LATENCY==2 &&
                       (C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1) && C_USE_EMBEDDED_REG < 3)?
                       valid_d1: valid_i;
   assign valid_out2 = (C_PRELOAD_LATENCY==2 &&
                       (C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1) && C_USE_EMBEDDED_REG == 3)?
                       valid_d2: valid_i;
   assign valid_out = (C_USE_EMBEDDED_REG == 3) ? valid_out2 : valid_out1;
   assign VALID     = valid_out ? !C_VALID_LOW : C_VALID_LOW;
     end
   endgenerate
   // Underflow may change behavior based on latency or active-low
   generate
      if (C_HAS_UNDERFLOW==1) begin : blockUF1
   assign underflow_i = (C_PRELOAD_LATENCY==0) ? (RD_EN & EMPTY) : ideal_underflow;
   assign UNDERFLOW   = underflow_i ? !C_UNDERFLOW_LOW : C_UNDERFLOW_LOW;
    end
   endgenerate
   // Write acknowledge may be active low
   generate
      if (C_HAS_WR_ACK==1) begin : blockWK1
   assign WR_ACK = ideal_wr_ack ? !C_WR_ACK_LOW : C_WR_ACK_LOW;
     end
   endgenerate
   // Generate RD_DATA_COUNT if Use Extra Logic option is selected
   generate
      if (C_HAS_WR_DATA_COUNT == 1 && C_USE_FWFT_DATA_COUNT == 1) begin : wdc_fwft_ext
      reg  [C_PNTR_WIDTH-1:0]  adjusted_wr_pntr = 0;
      reg  [C_PNTR_WIDTH-1:0]  adjusted_rd_pntr = 0;
      wire [C_PNTR_WIDTH-1:0]  diff_wr_rd_tmp;
      wire [C_PNTR_WIDTH:0]    diff_wr_rd;
      reg  [C_PNTR_WIDTH:0]    wr_data_count_i  = 0;
        always @* begin
          if (C_WR_PNTR_WIDTH > C_RD_PNTR_WIDTH) begin
            adjusted_wr_pntr = wr_pntr;
            adjusted_rd_pntr = 0;
            adjusted_rd_pntr[C_PNTR_WIDTH-1:C_PNTR_WIDTH-C_RD_PNTR_WIDTH] = rd_pntr_wr;
          end else if (C_WR_PNTR_WIDTH < C_RD_PNTR_WIDTH) begin
            adjusted_rd_pntr = rd_pntr_wr;
            adjusted_wr_pntr = 0;
            adjusted_wr_pntr[C_PNTR_WIDTH-1:C_PNTR_WIDTH-C_WR_PNTR_WIDTH] = wr_pntr;
          end else begin
            adjusted_wr_pntr = wr_pntr;
            adjusted_rd_pntr = rd_pntr_wr;
          end
        end // always @*
        assign diff_wr_rd_tmp = adjusted_wr_pntr - adjusted_rd_pntr;
        assign diff_wr_rd     = {1'b0,diff_wr_rd_tmp};
        always @ (posedge wr_rst_i or posedge WR_CLK)
        begin
            if (wr_rst_i)
              wr_data_count_i <= 0;
            else
              wr_data_count_i <= #`TCQ diff_wr_rd + EXTRA_WORDS_DC;
        end // always @ (posedge WR_CLK or posedge WR_CLK)
        always @* begin
          if (C_WR_PNTR_WIDTH >= C_RD_PNTR_WIDTH)
            wdc_fwft_ext_as = wr_data_count_i[C_PNTR_WIDTH:0];
          else
            wdc_fwft_ext_as = wr_data_count_i[C_PNTR_WIDTH:C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH];
        end // always @*
      end // wdc_fwft_ext
   endgenerate
   // Generate RD_DATA_COUNT if Use Extra Logic option is selected
   reg  [C_RD_PNTR_WIDTH:0]    rdc_fwft_ext_as  = 0;
   generate if (C_USE_EMBEDDED_REG < 3) begin: rdc_fwft_ext_both
      if (C_HAS_RD_DATA_COUNT == 1 && C_USE_FWFT_DATA_COUNT == 1) begin : rdc_fwft_ext
      reg  [C_RD_PNTR_WIDTH-1:0]  adjusted_wr_pntr_rd = 0;
      wire [C_RD_PNTR_WIDTH-1:0]  diff_rd_wr_tmp;
      wire [C_RD_PNTR_WIDTH:0]    diff_rd_wr;
        always @* begin
          if (C_RD_PNTR_WIDTH > C_WR_PNTR_WIDTH) begin
            adjusted_wr_pntr_rd = 0;
            adjusted_wr_pntr_rd[C_RD_PNTR_WIDTH-1:C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH] = wr_pntr_rd;
          end else begin
            adjusted_wr_pntr_rd = wr_pntr_rd[C_WR_PNTR_WIDTH-1:C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH];
          end
        end // always @*
        assign diff_rd_wr_tmp = adjusted_wr_pntr_rd - rd_pntr;
        assign diff_rd_wr     = {1'b0,diff_rd_wr_tmp};
   always @ (posedge rd_rst_i or posedge RD_CLK)
        begin
            if (rd_rst_i) begin
              rdc_fwft_ext_as   <= 0;
            end else begin
              if (!stage2_valid)
                rdc_fwft_ext_as <= #`TCQ 0;
              else if (!stage1_valid && stage2_valid)
                rdc_fwft_ext_as <= #`TCQ 1;
              else
                rdc_fwft_ext_as <= #`TCQ diff_rd_wr + 2'h2;
            end
        end // always @ (posedge WR_CLK or posedge WR_CLK)
      end // rdc_fwft_ext
 end
   endgenerate
  generate if (C_USE_EMBEDDED_REG == 3) begin
     if (C_HAS_RD_DATA_COUNT == 1 && C_USE_FWFT_DATA_COUNT == 1) begin : rdc_fwft_ext
      reg  [C_RD_PNTR_WIDTH-1:0]  adjusted_wr_pntr_rd = 0;
      wire [C_RD_PNTR_WIDTH-1:0]  diff_rd_wr_tmp;
      wire [C_RD_PNTR_WIDTH:0]    diff_rd_wr;
        always @* begin
          if (C_RD_PNTR_WIDTH > C_WR_PNTR_WIDTH) begin
            adjusted_wr_pntr_rd = 0;
            adjusted_wr_pntr_rd[C_RD_PNTR_WIDTH-1:C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH] = wr_pntr_rd;
          end else begin
            adjusted_wr_pntr_rd = wr_pntr_rd[C_WR_PNTR_WIDTH-1:C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH];
          end
        end // always @*
        assign diff_rd_wr_tmp = adjusted_wr_pntr_rd - rd_pntr;
        assign diff_rd_wr     = {1'b0,diff_rd_wr_tmp};
        wire [C_RD_PNTR_WIDTH:0]  diff_rd_wr_1;
   //     assign diff_rd_wr_1 = diff_rd_wr +2'h2;
       always @ (posedge rd_rst_i or posedge RD_CLK)
        begin
            if (rd_rst_i) begin
              rdc_fwft_ext_as   <= #`TCQ 0;
            end else begin
          //if (fab_read_data_valid_i == 1'b0 && ((ram_valid_i == 1'b0 && read_data_valid_i ==1'b0) || (ram_valid_i == 1'b0 && read_data_valid_i ==1'b1) || (ram_valid_i == 1'b1 && read_data_valid_i ==1'b0) || (ram_valid_i == 1'b1 && read_data_valid_i ==1'b1)))
          //    rdc_fwft_ext_as <= 1'b0;
          //else if (fab_read_data_valid_i == 1'b1 && ((ram_valid_i == 1'b0 && read_data_valid_i ==1'b0) || (ram_valid_i == 1'b0 && read_data_valid_i ==1'b1)))
          //    rdc_fwft_ext_as <= 1'b1;
          //else
            rdc_fwft_ext_as <= diff_rd_wr + 2'h2 ;
        end
end
end
end
endgenerate
   // Assign the read data count value only if it is selected,
   // otherwise output zeros.
   generate
      if (C_HAS_RD_DATA_COUNT == 1) begin : grdc
   assign RD_DATA_COUNT[C_RD_DATA_COUNT_WIDTH-1:0] = C_USE_FWFT_DATA_COUNT ?
          rdc_fwft_ext_as[C_RD_PNTR_WIDTH:C_RD_PNTR_WIDTH+1-C_RD_DATA_COUNT_WIDTH] :
          rd_data_count_int[C_RD_PNTR_WIDTH:C_RD_PNTR_WIDTH+1-C_RD_DATA_COUNT_WIDTH];
      end
   endgenerate
   generate
      if (C_HAS_RD_DATA_COUNT == 0) begin : gnrdc
   assign RD_DATA_COUNT[C_RD_DATA_COUNT_WIDTH-1:0] = {C_RD_DATA_COUNT_WIDTH{1'b0}};
      end
   endgenerate
   // Assign the write data count value only if it is selected,
   // otherwise output zeros
   generate
      if (C_HAS_WR_DATA_COUNT == 1) begin : gwdc
   assign WR_DATA_COUNT[C_WR_DATA_COUNT_WIDTH-1:0] = (C_USE_FWFT_DATA_COUNT == 1) ?
          wdc_fwft_ext_as[C_WR_PNTR_WIDTH:C_WR_PNTR_WIDTH+1-C_WR_DATA_COUNT_WIDTH] :
          wr_data_count_int[C_WR_PNTR_WIDTH:C_WR_PNTR_WIDTH+1-C_WR_DATA_COUNT_WIDTH];
      end
   endgenerate
   generate
      if (C_HAS_WR_DATA_COUNT == 0) begin : gnwdc
   assign WR_DATA_COUNT[C_WR_DATA_COUNT_WIDTH-1:0] = {C_WR_DATA_COUNT_WIDTH{1'b0}};
      end
   endgenerate
  /**************************************************************************
  //Capture delayed version of valid
  generate
      if (C_HAS_VALID==1) begin : blockVL2
  always @(posedge RD_CLK or posedge rd_rst_i) begin
    if (rd_rst_i == 1'b1) begin
      valid_d1 <= 1'b0;
      valid_d2 <= 1'b0;
    end else begin
      valid_d1 <= #`TCQ valid_i;
      valid_d2 <= #`TCQ valid_d1;
    end
//    if (C_USE_EMBEDDED_REG == 3 && (C_EN_SAFETY_CKT == 0 || C_EN_SAFETY_CKT == 1 ) begin
  //      valid_d2 <= #`TCQ valid_d1;
      //  end
  end
      end
 endgenerate
  //Capture delayed version of dout
  /**************************************************************************
  generate
       if (C_USE_EMBEDDED_REG < 3) begin
  always @(posedge RD_CLK or posedge rd_rst_i) begin
    if (rd_rst_i == 1'b1) begin
       if (C_USE_DOUT_RST == 1'b1) begin
         @(posedge RD_CLK)
           ideal_dout_d1   <= #`TCQ dout_reset_val;
           ideal_dout   <= #`TCQ dout_reset_val;
       end
      // Reset err_type only if ECC is not selected
      if (C_USE_ECC == 0)
        err_type_d1     <= #`TCQ 0;
     end else if (ram_rd_en_d1) begin
      ideal_dout_d1   <= #`TCQ ideal_dout;
      err_type_d1     <= #`TCQ err_type;
           end
  end
end
endgenerate
/**************************************************************************
generate
  if (C_USE_EMBEDDED_REG == 3) begin
    always @(posedge RD_CLK or posedge rd_rst_i) begin
      if (rd_rst_i == 1'b1) begin
        if (C_USE_DOUT_RST == 1'b1) begin
           @(posedge RD_CLK)
             ideal_dout    <= #`TCQ dout_reset_val;
             ideal_dout_d1   <= #`TCQ dout_reset_val;
             ideal_dout_both   <= #`TCQ dout_reset_val;
        end
        // Reset err_type only if ECC is not selected
        if (C_USE_ECC == 0) begin
          err_type_d1     <= #`TCQ 0;
          err_type_both   <= #`TCQ 0;
        end
      end else begin
         if (ram_rd_en_d1) begin
           ideal_dout_both   <= #`TCQ ideal_dout;
           err_type_both     <= #`TCQ err_type;
         end
         if (fab_rd_en_d1) begin
           ideal_dout_d1   <= #`TCQ ideal_dout_both;
           err_type_d1     <= #`TCQ err_type_both;
         end
      end
    end
  end
endgenerate
   /**************************************************************************
   generate
     if (C_HAS_OVERFLOW == 1 && IS_8SERIES == 0) begin : g7s_ovflw
       always @(posedge WR_CLK) begin
         ideal_overflow    <= #`TCQ WR_EN & FULL;
       end
     end else if (C_HAS_OVERFLOW == 1 && IS_8SERIES == 1) begin : g8s_ovflw
       always @(posedge WR_CLK) begin
         //ideal_overflow    <= #`TCQ WR_EN & (FULL | wr_rst_i);
         ideal_overflow    <= #`TCQ WR_EN & (FULL );
       end
     end
   endgenerate
   generate
     if (C_HAS_UNDERFLOW == 1 && IS_8SERIES == 0) begin : g7s_unflw
       always @(posedge RD_CLK) begin
         ideal_underflow    <= #`TCQ EMPTY & RD_EN;
       end
     end else if (C_HAS_UNDERFLOW == 1 && IS_8SERIES == 1) begin : g8s_unflw
       always @(posedge RD_CLK) begin
         ideal_underflow    <= #`TCQ (EMPTY) & RD_EN;
         //ideal_underflow    <= #`TCQ (rd_rst_i | EMPTY) & RD_EN;
       end
     end
   endgenerate
   /**************************************************************************
   localparam NO_OF_SYNC_STAGE_INC_G2B = C_SYNCHRONIZER_STAGE + 1;
   wire [C_WR_PNTR_WIDTH-1:0] wr_pntr_sync_stgs [0:NO_OF_SYNC_STAGE_INC_G2B];
   wire [C_RD_PNTR_WIDTH-1:0] rd_pntr_sync_stgs [0:NO_OF_SYNC_STAGE_INC_G2B];
   genvar gss;
   generate for (gss = 1; gss <= NO_OF_SYNC_STAGE_INC_G2B; gss = gss + 1) begin : Sync_stage_inst
     fifo_generator_v13_1_3_sync_stage
       #(
         .C_WIDTH  (C_WR_PNTR_WIDTH)
        )
     rd_stg_inst
        (
         .RST      (rd_rst_i),
         .CLK      (RD_CLK),
         .DIN      (wr_pntr_sync_stgs[gss-1]),
         .DOUT     (wr_pntr_sync_stgs[gss])
        );
     fifo_generator_v13_1_3_sync_stage
       #(
         .C_WIDTH  (C_RD_PNTR_WIDTH)
        )
     wr_stg_inst
        (
         .RST      (wr_rst_i),
         .CLK      (WR_CLK),
         .DIN      (rd_pntr_sync_stgs[gss-1]),
         .DOUT     (rd_pntr_sync_stgs[gss])
        );
   end endgenerate // Sync_stage_inst
   assign wr_pntr_sync_stgs[0] = wr_pntr_rd1;
   assign rd_pntr_sync_stgs[0] = rd_pntr_wr1;
   always@* begin
     wr_pntr_rd           <= wr_pntr_sync_stgs[NO_OF_SYNC_STAGE_INC_G2B];
     rd_pntr_wr           <= rd_pntr_sync_stgs[NO_OF_SYNC_STAGE_INC_G2B];
   end
   /**************************************************************************
   reg [C_WR_PNTR_WIDTH-1:0] diff_pntr = 0;
   always @(posedge WR_CLK or posedge wr_rst_i) begin : gen_fifo_wp
     if (wr_rst_i == 1'b1 && C_EN_SAFETY_CKT == 0)
       wr_pntr           <= 0;
     else if (C_EN_SAFETY_CKT == 1 && SAFETY_CKT_WR_RST == 1'b1)
       wr_pntr           <= #`TCQ 0;
   end
   always @(posedge WR_CLK or posedge wr_rst_i) begin : gen_fifo_w
     /****** Reset fifo (case 1)***************************************/
     if (wr_rst_i == 1'b1) begin
       num_wr_bits       <= 0;
       next_num_wr_bits   = 0;
       wr_ptr            <= C_WR_DEPTH - 1;
       rd_ptr_wrclk      <= C_RD_DEPTH - 1;
       ideal_wr_ack      <= 0;
       ideal_wr_count    <= 0;
       tmp_wr_listsize    = 0;
       rd_ptr_wrclk_next <= 0;
       wr_pntr_rd1       <= 0;
     end else begin //wr_rst_i==0
       wr_pntr_rd1   <= #`TCQ wr_pntr;
       //Determine the current number of words in the FIFO
       tmp_wr_listsize = (C_DEPTH_RATIO_RD > 1) ? num_wr_bits/C_DOUT_WIDTH :
                         num_wr_bits/C_DIN_WIDTH;
       rd_ptr_wrclk_next = rd_ptr;
       if (rd_ptr_wrclk < rd_ptr_wrclk_next) begin
         next_num_wr_bits = num_wr_bits -
                            C_DOUT_WIDTH*(rd_ptr_wrclk + C_RD_DEPTH
                                          - rd_ptr_wrclk_next);
       end else begin
         next_num_wr_bits = num_wr_bits -
                            C_DOUT_WIDTH*(rd_ptr_wrclk - rd_ptr_wrclk_next);
       end
       //If this is a write, handle the write by adding the value
       // to the linked list, and updating all outputs appropriately
       if (WR_EN == 1'b1) begin
         if (FULL == 1'b1) begin
           //If the FIFO is full, do NOT perform the write,
           // update flags accordingly
           if ((tmp_wr_listsize + C_DEPTH_RATIO_RD - 1)/C_DEPTH_RATIO_RD
             >= C_FIFO_WR_DEPTH) begin
             //write unsuccessful - do not change contents
             //Do not acknowledge the write
             ideal_wr_ack      <= #`TCQ 0;
             //Reminder that FIFO is still full
             ideal_wr_count    <= #`TCQ num_write_words_sized_i;
           //If the FIFO is one from full, but reporting full
           end else
             if ((tmp_wr_listsize + C_DEPTH_RATIO_RD - 1)/C_DEPTH_RATIO_RD ==
                C_FIFO_WR_DEPTH-1) begin
             //No change to FIFO
             //Write not successful
             ideal_wr_ack      <= #`TCQ 0;
             //With DEPTH-1 words in the FIFO, it is almost_full
             ideal_wr_count    <= #`TCQ num_write_words_sized_i;
           //If the FIFO is completely empty, but it is
           // reporting FULL for some reason (like reset)
           end else
             if ((tmp_wr_listsize + C_DEPTH_RATIO_RD - 1)/C_DEPTH_RATIO_RD <=
                C_FIFO_WR_DEPTH-2) begin
             //No change to FIFO
             //Write not successful
             ideal_wr_ack      <= #`TCQ 0;
             //FIFO is really not close to full, so change flag status.
             ideal_wr_count    <= #`TCQ num_write_words_sized_i;
           end //(tmp_wr_listsize == 0)
         end else begin
           //If the FIFO is full, do NOT perform the write,
           // update flags accordingly
           if ((tmp_wr_listsize + C_DEPTH_RATIO_RD - 1)/C_DEPTH_RATIO_RD >=
              C_FIFO_WR_DEPTH) begin
             //write unsuccessful - do not change contents
             //Do not acknowledge the write
             ideal_wr_ack       <= #`TCQ 0;
             //Reminder that FIFO is still full
             ideal_wr_count     <= #`TCQ num_write_words_sized_i;
           //If the FIFO is one from full
           end else
             if ((tmp_wr_listsize + C_DEPTH_RATIO_RD - 1)/C_DEPTH_RATIO_RD ==
                C_FIFO_WR_DEPTH-1) begin
             //Add value on DIN port to FIFO
             write_fifo;
             next_num_wr_bits = next_num_wr_bits + C_DIN_WIDTH;
             //Write successful, so issue acknowledge
             // and no error
             ideal_wr_ack      <= #`TCQ 1;
             //This write is CAUSING the FIFO to go full
             ideal_wr_count    <= #`TCQ num_write_words_sized_i;
           //If the FIFO is 2 from full
           end else
             if ((tmp_wr_listsize + C_DEPTH_RATIO_RD - 1)/C_DEPTH_RATIO_RD ==
                C_FIFO_WR_DEPTH-2) begin
             //Add value on DIN port to FIFO
             write_fifo;
             next_num_wr_bits =  next_num_wr_bits + C_DIN_WIDTH;
             //Write successful, so issue acknowledge
             // and no error
             ideal_wr_ack      <= #`TCQ 1;
             //Still 2 from full
             ideal_wr_count    <= #`TCQ num_write_words_sized_i;
           //If the FIFO is not close to being full
           end else
             if ((tmp_wr_listsize + C_DEPTH_RATIO_RD - 1)/C_DEPTH_RATIO_RD <
                C_FIFO_WR_DEPTH-2) begin
             //Add value on DIN port to FIFO
             write_fifo;
             next_num_wr_bits  = next_num_wr_bits + C_DIN_WIDTH;
             //Write successful, so issue acknowledge
             // and no error
             ideal_wr_ack      <= #`TCQ 1;
             //Not even close to full.
             ideal_wr_count    <= num_write_words_sized_i;
           end
         end
       end else begin //(WR_EN == 1'b1)
         //If user did not attempt a write, then do not
         // give ack or err
         ideal_wr_ack   <= #`TCQ 0;
         ideal_wr_count <= #`TCQ num_write_words_sized_i;
       end
       num_wr_bits       <= #`TCQ next_num_wr_bits;
       rd_ptr_wrclk      <= #`TCQ rd_ptr;
     end //wr_rst_i==0
   end // gen_fifo_w
  /***************************************************************************
   wire [C_WR_PNTR_WIDTH-1:0] pf_thr_assert_val;
   wire [C_WR_PNTR_WIDTH-1:0] pf_thr_negate_val;
   generate if (C_PRELOAD_REGS == 1 && C_PRELOAD_LATENCY == 0) begin : FWFT
     assign pf_thr_assert_val = C_PROG_FULL_THRESH_ASSERT_VAL - EXTRA_WORDS_DC;
     assign pf_thr_negate_val = C_PROG_FULL_THRESH_NEGATE_VAL - EXTRA_WORDS_DC;
   end else begin // STD
     assign pf_thr_assert_val = C_PROG_FULL_THRESH_ASSERT_VAL;
     assign pf_thr_negate_val = C_PROG_FULL_THRESH_NEGATE_VAL;
   end endgenerate
   always @(posedge WR_CLK or posedge wr_rst_i) begin
     if (wr_rst_i == 1'b1) begin
       diff_pntr         <= 0;
     end else begin
       if (ram_wr_en)
         diff_pntr <= #`TCQ (wr_pntr - adj_rd_pntr_wr + 2'h1);
       else if (!ram_wr_en)
         diff_pntr <= #`TCQ (wr_pntr - adj_rd_pntr_wr);
    end
  end
   always @(posedge WR_CLK or posedge RST_FULL_FF) begin : gen_pf
     if (RST_FULL_FF == 1'b1) begin
       ideal_prog_full   <= C_FULL_FLAGS_RST_VAL;
     end else begin
       if (RST_FULL_GEN)
         ideal_prog_full   <= #`TCQ 0;
       //Single Programmable Full Constant Threshold
       else if (C_PROG_FULL_TYPE == 1) begin
         if (FULL == 0) begin
           if (diff_pntr >= pf_thr_assert_val)
             ideal_prog_full <= #`TCQ 1;
           else
             ideal_prog_full <= #`TCQ 0;
         end else
           ideal_prog_full   <= #`TCQ ideal_prog_full;
       //Two Programmable Full Constant Thresholds
       end else if (C_PROG_FULL_TYPE == 2) begin
         if (FULL == 0) begin
           if (diff_pntr >= pf_thr_assert_val)
             ideal_prog_full <= #`TCQ 1;
           else if (diff_pntr < pf_thr_negate_val)
             ideal_prog_full <= #`TCQ 0;
           else
             ideal_prog_full <= #`TCQ ideal_prog_full;
         end else
           ideal_prog_full   <= #`TCQ ideal_prog_full;
       //Single Programmable Full Threshold Input
       end else if (C_PROG_FULL_TYPE == 3) begin
         if (FULL == 0) begin
           if (C_PRELOAD_REGS == 1 && C_PRELOAD_LATENCY == 0) begin // FWFT
             if (diff_pntr >= (PROG_FULL_THRESH - EXTRA_WORDS_DC))
               ideal_prog_full <= #`TCQ 1;
             else
               ideal_prog_full <= #`TCQ 0;
           end else begin // STD
             if (diff_pntr >= PROG_FULL_THRESH)
               ideal_prog_full <= #`TCQ 1;
             else
               ideal_prog_full <= #`TCQ 0;
           end
         end else
           ideal_prog_full   <= #`TCQ ideal_prog_full;
       //Two Programmable Full Threshold Inputs
       end else if (C_PROG_FULL_TYPE == 4) begin
         if (FULL == 0) begin
           if (C_PRELOAD_REGS == 1 && C_PRELOAD_LATENCY == 0) begin // FWFT
             if (diff_pntr >= (PROG_FULL_THRESH_ASSERT - EXTRA_WORDS_DC))
               ideal_prog_full <= #`TCQ 1;
             else if (diff_pntr < (PROG_FULL_THRESH_NEGATE - EXTRA_WORDS_DC))
               ideal_prog_full <= #`TCQ 0;
             else
               ideal_prog_full <= #`TCQ ideal_prog_full;
           end else begin // STD
             if (diff_pntr >= PROG_FULL_THRESH_ASSERT)
               ideal_prog_full <= #`TCQ 1;
             else if (diff_pntr < PROG_FULL_THRESH_NEGATE)
               ideal_prog_full <= #`TCQ 0;
             else
               ideal_prog_full <= #`TCQ ideal_prog_full;
           end
         end else
           ideal_prog_full   <= #`TCQ ideal_prog_full;
       end // C_PROG_FULL_TYPE
     end //wr_rst_i==0
   end //
   /**************************************************************************
   /*********************************************************
   //Determine the Assert and Negate thresholds for Programmable Empty
   wire [C_RD_PNTR_WIDTH-1:0] pe_thr_assert_val;
   wire [C_RD_PNTR_WIDTH-1:0] pe_thr_negate_val;
   reg [C_RD_PNTR_WIDTH-1:0] diff_pntr_rd      = 0;
   always @(posedge RD_CLK or posedge rd_rst_i) begin : gen_pe
     if (rd_rst_i) begin
       diff_pntr_rd       <= 0;
       ideal_prog_empty   <= 1'b1;
     end else begin
       if (ram_rd_en)
         diff_pntr_rd       <=  #`TCQ (adj_wr_pntr_rd - rd_pntr) - 1'h1;
       else if (!ram_rd_en)
         diff_pntr_rd       <=  #`TCQ (adj_wr_pntr_rd - rd_pntr);
       else
         diff_pntr_rd       <=  #`TCQ diff_pntr_rd;
       if (C_PROG_EMPTY_TYPE == 1) begin
         if (EMPTY == 0) begin
           if (diff_pntr_rd <= pe_thr_assert_val)
             ideal_prog_empty <= #`TCQ 1;
           else
             ideal_prog_empty <= #`TCQ 0;
         end else
           ideal_prog_empty   <= #`TCQ ideal_prog_empty;
       end else if (C_PROG_EMPTY_TYPE == 2) begin
         if (EMPTY == 0) begin
           if (diff_pntr_rd <= pe_thr_assert_val)
             ideal_prog_empty <= #`TCQ 1;
           else if (diff_pntr_rd > pe_thr_negate_val)
             ideal_prog_empty <= #`TCQ 0;
           else
             ideal_prog_empty <= #`TCQ ideal_prog_empty;
         end else
           ideal_prog_empty   <= #`TCQ ideal_prog_empty;
       end else if (C_PROG_EMPTY_TYPE == 3) begin
         if (EMPTY == 0) begin
           if (diff_pntr_rd <= pe_thr_assert_val)
             ideal_prog_empty <= #`TCQ 1;
           else
             ideal_prog_empty <= #`TCQ 0;
         end else
           ideal_prog_empty   <= #`TCQ ideal_prog_empty;
       end else if (C_PROG_EMPTY_TYPE == 4) begin
         if (EMPTY == 0) begin
           if (diff_pntr_rd <= pe_thr_assert_val)
             ideal_prog_empty <= #`TCQ 1;
           else if (diff_pntr_rd > pe_thr_negate_val)
             ideal_prog_empty <= #`TCQ 0;
           else
             ideal_prog_empty <= #`TCQ ideal_prog_empty;
         end else
           ideal_prog_empty   <= #`TCQ ideal_prog_empty;
       end  //C_PROG_EMPTY_TYPE
     end
   end // gen_pe
   generate if (C_PROG_EMPTY_TYPE == 3) begin : single_pe_thr_input
     assign pe_thr_assert_val = (C_PRELOAD_REGS == 1 && C_PRELOAD_LATENCY == 0) ?
                                PROG_EMPTY_THRESH - 2'h2 : PROG_EMPTY_THRESH;
   end endgenerate // single_pe_thr_input
   generate if (C_PROG_EMPTY_TYPE == 4) begin : multiple_pe_thr_input
     assign pe_thr_assert_val = (C_PRELOAD_REGS == 1 && C_PRELOAD_LATENCY == 0) ?
                                PROG_EMPTY_THRESH_ASSERT - 2'h2 : PROG_EMPTY_THRESH_ASSERT;
     assign pe_thr_negate_val = (C_PRELOAD_REGS == 1 && C_PRELOAD_LATENCY == 0) ?
                                PROG_EMPTY_THRESH_NEGATE - 2'h2 : PROG_EMPTY_THRESH_NEGATE;
   end endgenerate // multiple_pe_thr_input
   generate if (C_PROG_EMPTY_TYPE < 3) begin : single_multiple_pe_thr_const
     assign pe_thr_assert_val = (C_PRELOAD_REGS == 1 && C_PRELOAD_LATENCY == 0) ?
                                C_PROG_EMPTY_THRESH_ASSERT_VAL - 2'h2 : C_PROG_EMPTY_THRESH_ASSERT_VAL;
     assign pe_thr_negate_val = (C_PRELOAD_REGS == 1 && C_PRELOAD_LATENCY == 0) ?
                                C_PROG_EMPTY_THRESH_NEGATE_VAL - 2'h2 : C_PROG_EMPTY_THRESH_NEGATE_VAL;
   end endgenerate // single_multiple_pe_thr_const
   always @(posedge RD_CLK or posedge rd_rst_i) begin : gen_fifo_rp
     if (rd_rst_i && C_EN_SAFETY_CKT == 0)
       rd_pntr            <= 0;
     else if (C_EN_SAFETY_CKT == 1 && SAFETY_CKT_RD_RST == 1'b1)
       rd_pntr            <= #`TCQ 0;
   end
   always @(posedge RD_CLK or posedge rd_rst_i) begin : gen_fifo_r_as
     /****** Reset fifo (case 1)***************************************/
     if (rd_rst_i) begin
       num_rd_bits        <= 0;
       next_num_rd_bits    = 0;
       rd_ptr             <= C_RD_DEPTH -1;
       rd_pntr_wr1        <= 0;
       wr_ptr_rdclk       <= C_WR_DEPTH -1;
       // DRAM resets asynchronously
       if (C_MEMORY_TYPE == 2 && C_USE_DOUT_RST == 1)
          ideal_dout    <= dout_reset_val;
       // Reset err_type only if ECC is not selected
       if (C_USE_ECC == 0) begin
         err_type         <= 0;
         err_type_d1      <= 0;
         err_type_both    <= 0;
       end
       ideal_valid        <= 1'b0;
       ideal_rd_count     <= 0;
     end else begin //rd_rst_i==0
       rd_pntr_wr1   <= #`TCQ rd_pntr;
       //Determine the current number of words in the FIFO
       tmp_rd_listsize = (C_DEPTH_RATIO_WR > 1) ? num_rd_bits/C_DIN_WIDTH :
                         num_rd_bits/C_DOUT_WIDTH;
       wr_ptr_rdclk_next = wr_ptr;
       if (wr_ptr_rdclk < wr_ptr_rdclk_next) begin
         next_num_rd_bits = num_rd_bits +
                            C_DIN_WIDTH*(wr_ptr_rdclk +C_WR_DEPTH
                                         - wr_ptr_rdclk_next);
       end else begin
         next_num_rd_bits = num_rd_bits +
                             C_DIN_WIDTH*(wr_ptr_rdclk - wr_ptr_rdclk_next);
       end
       // Read Operation - Read Latency 1
       if (C_PRELOAD_LATENCY==1 || C_PRELOAD_LATENCY==2) begin
                 ideal_valid        <= #`TCQ 1'b0;
         if (ram_rd_en == 1'b1) begin
           if (EMPTY == 1'b1) begin
             //If the FIFO is completely empty, and is reporting empty
             if (tmp_rd_listsize/C_DEPTH_RATIO_WR <= 0)
               begin
                 //Do not change the contents of the FIFO
                 //Do not acknowledge the read from empty FIFO
                 ideal_valid        <= #`TCQ 1'b0;
                 //Reminder that FIFO is still empty
                 ideal_rd_count     <= #`TCQ num_read_words_sized_i;
               end // if (tmp_rd_listsize <= 0)
             //If the FIFO is one from empty, but it is reporting empty
             else if (tmp_rd_listsize/C_DEPTH_RATIO_WR == 1)
               begin
                 //Do not change the contents of the FIFO
                 //Do not acknowledge the read from empty FIFO
                 ideal_valid        <= #`TCQ 1'b0;
                 //Note that FIFO is no longer empty, but is almost empty (has one word left)
                 ideal_rd_count     <= #`TCQ num_read_words_sized_i;
               end // if (tmp_rd_listsize == 1)
             //If the FIFO is two from empty, and is reporting empty
             else if (tmp_rd_listsize/C_DEPTH_RATIO_WR == 2)
               begin
                 //Do not change the contents of the FIFO
                 //Do not acknowledge the read from empty FIFO
                 ideal_valid        <= #`TCQ 1'b0;
                 //Fifo has two words, so is neither empty or almost empty
                 ideal_rd_count     <= #`TCQ num_read_words_sized_i;
               end // if (tmp_rd_listsize == 2)
             //If the FIFO is not close to empty, but is reporting that it is
             // Treat the FIFO as empty this time, but unset EMPTY flags.
             if ((tmp_rd_listsize/C_DEPTH_RATIO_WR > 2) && (tmp_rd_listsize/C_DEPTH_RATIO_WR<C_FIFO_RD_DEPTH))
               begin
                 //Do not change the contents of the FIFO
                 //Do not acknowledge the read from empty FIFO
                 ideal_valid <= #`TCQ 1'b0;
                 //Note that the FIFO is No Longer Empty or Almost Empty
                 ideal_rd_count <= #`TCQ num_read_words_sized_i;
               end // if ((tmp_rd_listsize > 2) && (tmp_rd_listsize<=C_FIFO_RD_DEPTH-1))
             end // else: if(ideal_empty == 1'b1)
           else //if (ideal_empty == 1'b0)
             begin
               //If the FIFO is completely full, and we are successfully reading from it
               if (tmp_rd_listsize/C_DEPTH_RATIO_WR >= C_FIFO_RD_DEPTH)
                 begin
                   //Read the value from the FIFO
                   read_fifo;
                   next_num_rd_bits = next_num_rd_bits - C_DOUT_WIDTH;
                   //Acknowledge the read from the FIFO, no error
                   ideal_valid        <= #`TCQ 1'b1;
                   //Not close to empty
                   ideal_rd_count     <= #`TCQ num_read_words_sized_i;
                 end // if (tmp_rd_listsize == C_FIFO_RD_DEPTH)
               //If the FIFO is not close to being empty
               else if ((tmp_rd_listsize/C_DEPTH_RATIO_WR > 2) && (tmp_rd_listsize/C_DEPTH_RATIO_WR<=C_FIFO_RD_DEPTH))
                 begin
                   //Read the value from the FIFO
                   read_fifo;
                   next_num_rd_bits = next_num_rd_bits - C_DOUT_WIDTH;
                   //Acknowledge the read from the FIFO, no error
                   ideal_valid        <= #`TCQ 1'b1;
                   //Not close to empty
                   ideal_rd_count     <= #`TCQ num_read_words_sized_i;
                 end // if ((tmp_rd_listsize > 2) && (tmp_rd_listsize<=C_FIFO_RD_DEPTH-1))
               //If the FIFO is two from empty
               else if (tmp_rd_listsize/C_DEPTH_RATIO_WR == 2)
                 begin
                   //Read the value from the FIFO
                   read_fifo;
                   next_num_rd_bits = next_num_rd_bits - C_DOUT_WIDTH;
                   //Acknowledge the read from the FIFO, no error
                   ideal_valid        <= #`TCQ 1'b1;
                   //Fifo is not yet empty. It is going almost_empty
                   ideal_rd_count     <= #`TCQ num_read_words_sized_i;
                 end // if (tmp_rd_listsize == 2)
               //If the FIFO is one from empty
               else if ((tmp_rd_listsize/C_DEPTH_RATIO_WR == 1))
                 begin
                   //Read the value from the FIFO
                   read_fifo;
                   next_num_rd_bits = next_num_rd_bits - C_DOUT_WIDTH;
                   //Acknowledge the read from the FIFO, no error
                   ideal_valid        <= #`TCQ 1'b1;
                   //Note that FIFO is GOING empty
                   ideal_rd_count     <= #`TCQ num_read_words_sized_i;
                 end // if (tmp_rd_listsize == 1)
               //If the FIFO is completely empty
               else if (tmp_rd_listsize/C_DEPTH_RATIO_WR <= 0)
                 begin
                   //Do not change the contents of the FIFO
                   //Do not acknowledge the read from empty FIFO
                   ideal_valid        <= #`TCQ 1'b0;
                   ideal_rd_count     <= #`TCQ num_read_words_sized_i;
                 end // if (tmp_rd_listsize <= 0)
             end // if (ideal_empty == 1'b0)
           end //(RD_EN == 1'b1)
         else //if (RD_EN == 1'b0)
           begin
             //If user did not attempt a read, do not give an ack or err
             ideal_valid          <= #`TCQ 1'b0;
             ideal_rd_count       <= #`TCQ num_read_words_sized_i;
           end // else: !if(RD_EN == 1'b1)
       // Read Operation - Read Latency 0
       end else if (C_PRELOAD_REGS==1 && C_PRELOAD_LATENCY==0) begin
                 ideal_valid        <= #`TCQ 1'b0;
         if (ram_rd_en == 1'b1) begin
           if (EMPTY == 1'b1) begin
             //If the FIFO is completely empty, and is reporting empty
             if (tmp_rd_listsize/C_DEPTH_RATIO_WR <= 0) begin
               //Do not change the contents of the FIFO
               //Do not acknowledge the read from empty FIFO
               ideal_valid        <= #`TCQ 1'b0;
               //Reminder that FIFO is still empty
               ideal_rd_count     <= #`TCQ num_read_words_sized_i;
             //If the FIFO is one from empty, but it is reporting empty
             end else if (tmp_rd_listsize/C_DEPTH_RATIO_WR == 1) begin
               //Do not change the contents of the FIFO
               //Do not acknowledge the read from empty FIFO
               ideal_valid        <= #`TCQ 1'b0;
               //Note that FIFO is no longer empty, but is almost empty (has one word left)
               ideal_rd_count     <= #`TCQ num_read_words_sized_i;
             //If the FIFO is two from empty, and is reporting empty
             end else if (tmp_rd_listsize/C_DEPTH_RATIO_WR == 2) begin
               //Do not change the contents of the FIFO
               //Do not acknowledge the read from empty FIFO
               ideal_valid        <= #`TCQ 1'b0;
               //Fifo has two words, so is neither empty or almost empty
               ideal_rd_count     <= #`TCQ num_read_words_sized_i;
               //If the FIFO is not close to empty, but is reporting that it is
             // Treat the FIFO as empty this time, but unset EMPTY flags.
             end else if ((tmp_rd_listsize/C_DEPTH_RATIO_WR > 2) &&
                         (tmp_rd_listsize/C_DEPTH_RATIO_WR<C_FIFO_RD_DEPTH)) begin
               //Do not change the contents of the FIFO
               //Do not acknowledge the read from empty FIFO
               ideal_valid        <= #`TCQ 1'b0;
               //Note that the FIFO is No Longer Empty or Almost Empty
               ideal_rd_count     <= #`TCQ num_read_words_sized_i;
             end // if ((tmp_rd_listsize > 2) && (tmp_rd_listsize<=C_FIFO_RD_DEPTH-1))
           end else begin
             //If the FIFO is completely full, and we are successfully reading from it
             if (tmp_rd_listsize/C_DEPTH_RATIO_WR >= C_FIFO_RD_DEPTH) begin
               //Read the value from the FIFO
               read_fifo;
               next_num_rd_bits = next_num_rd_bits - C_DOUT_WIDTH;
               //Acknowledge the read from the FIFO, no error
               ideal_valid        <= #`TCQ 1'b1;
               //Not close to empty
               ideal_rd_count     <= #`TCQ num_read_words_sized_i;
             //If the FIFO is not close to being empty
             end else if ((tmp_rd_listsize/C_DEPTH_RATIO_WR > 2) &&
                          (tmp_rd_listsize/C_DEPTH_RATIO_WR<=C_FIFO_RD_DEPTH)) begin
               //Read the value from the FIFO
               read_fifo;
               next_num_rd_bits = next_num_rd_bits - C_DOUT_WIDTH;
               //Acknowledge the read from the FIFO, no error
               ideal_valid        <= #`TCQ 1'b1;
               //Not close to empty
               ideal_rd_count     <= #`TCQ num_read_words_sized_i;
             //If the FIFO is two from empty
             end else if (tmp_rd_listsize/C_DEPTH_RATIO_WR == 2) begin
               //Read the value from the FIFO
               read_fifo;
               next_num_rd_bits = next_num_rd_bits - C_DOUT_WIDTH;
               //Acknowledge the read from the FIFO, no error
               ideal_valid        <= #`TCQ 1'b1;
               //Fifo is not yet empty. It is going almost_empty
               ideal_rd_count     <= #`TCQ num_read_words_sized_i;
             //If the FIFO is one from empty
             end else if (tmp_rd_listsize/C_DEPTH_RATIO_WR == 1) begin
               //Read the value from the FIFO
               read_fifo;
               next_num_rd_bits = next_num_rd_bits - C_DOUT_WIDTH;
               //Acknowledge the read from the FIFO, no error
               ideal_valid        <= #`TCQ 1'b1;
               //Note that FIFO is GOING empty
               ideal_rd_count     <= #`TCQ num_read_words_sized_i;
             //If the FIFO is completely empty
             end else if (tmp_rd_listsize/C_DEPTH_RATIO_WR <= 0) begin
               //Do not change the contents of the FIFO
               //Do not acknowledge the read from empty FIFO
               ideal_valid        <= #`TCQ 1'b0;
               //Reminder that FIFO is still empty
               ideal_rd_count     <= #`TCQ num_read_words_sized_i;
             end // if (tmp_rd_listsize <= 0)
           end // if (ideal_empty == 1'b0)
         end else begin//(RD_EN == 1'b0)
           //If user did not attempt a read, do not give an ack or err
           ideal_valid           <= #`TCQ 1'b0;
           ideal_rd_count        <= #`TCQ num_read_words_sized_i;
         end // else: !if(RD_EN == 1'b1)
       end //if (C_PRELOAD_REGS==1 && C_PRELOAD_LATENCY==0)
       num_rd_bits      <= #`TCQ next_num_rd_bits;
       wr_ptr_rdclk     <= #`TCQ wr_ptr;
     end //rd_rst_i==0
   end //always gen_fifo_r_as
endmodule