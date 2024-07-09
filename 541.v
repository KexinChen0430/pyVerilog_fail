module inputs and outputs to the internal signals of the
   //Inputs
   /*
   wire CLK;
   wire [C_DIN_WIDTH-1:0] DIN;
   wire [C_RD_PNTR_WIDTH-1:0] PROG_EMPTY_THRESH;
   wire [C_RD_PNTR_WIDTH-1:0] PROG_EMPTY_THRESH_ASSERT;
   wire [C_RD_PNTR_WIDTH-1:0] PROG_EMPTY_THRESH_NEGATE;
   wire [C_WR_PNTR_WIDTH-1:0] PROG_FULL_THRESH;
   wire [C_WR_PNTR_WIDTH-1:0] PROG_FULL_THRESH_ASSERT;
   wire [C_WR_PNTR_WIDTH-1:0] PROG_FULL_THRESH_NEGATE;
   wire RD_EN;
   wire RST;
   wire WR_EN;
    */
  // Assign ALMOST_EPMTY
  generate if (C_HAS_ALMOST_EMPTY == 1) begin : gae
    assign ALMOST_EMPTY = almost_empty_i;
  end else begin : gnae
    assign ALMOST_EMPTY = 0;
  end endgenerate // gae
  // Assign ALMOST_FULL
  generate if (C_HAS_ALMOST_FULL==1) begin : gaf
    assign ALMOST_FULL  = almost_full_i;
  end else begin : gnaf
    assign ALMOST_FULL  = 0;
  end endgenerate // gaf
   // Dout may change behavior based on latency
  localparam C_FWFT_ENABLED = (C_PRELOAD_LATENCY == 0 && C_PRELOAD_REGS == 1)?
                         1: 0;
  assign fwft_enabled = (C_PRELOAD_LATENCY == 0 && C_PRELOAD_REGS == 1)?
                         1: 0;
  assign ideal_dout_out= ((C_USE_EMBEDDED_REG>0 && (fwft_enabled == 0)) &&
                          (C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1))?
                         ideal_dout_d1: ideal_dout;
  assign DOUT = ideal_dout_out;
  // Assign SBITERR and DBITERR based on latency
  assign SBITERR = (C_ERROR_INJECTION_TYPE == 1 || C_ERROR_INJECTION_TYPE == 3) &&
                   ((C_USE_EMBEDDED_REG>0 && (fwft_enabled == 0)) &&
                    (C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1)) ?
                   err_type_d1[0]: err_type[0];
  assign DBITERR = (C_ERROR_INJECTION_TYPE == 2 || C_ERROR_INJECTION_TYPE == 3) &&
                   ((C_USE_EMBEDDED_REG>0 && (fwft_enabled == 0)) &&
                    (C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1)) ?
                   err_type_d1[1]: err_type[1];
  assign EMPTY         = empty_i;
  assign FULL          = full_i;
  //saftey_ckt with one register
  generate
         if ((C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1) && C_EN_SAFETY_CKT==1 && (C_USE_EMBEDDED_REG == 1 || C_USE_EMBEDDED_REG == 2 )) begin
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d1;
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d2;
         reg [1:0] rst_delayed_sft1              =1;
         reg [1:0] rst_delayed_sft2              =1;
         reg [1:0] rst_delayed_sft3              =1;
         reg [1:0] rst_delayed_sft4              =1;
        always@(posedge CLK)
          begin
          rst_delayed_sft1 <= #`TCQ rst_i;
          rst_delayed_sft2 <= #`TCQ rst_delayed_sft1;
          rst_delayed_sft3 <= #`TCQ rst_delayed_sft2;
          rst_delayed_sft4 <= #`TCQ rst_delayed_sft3;
          end
        always@(posedge rst_delayed_sft2 or posedge rst_i or posedge CLK)
          begin
          if( rst_delayed_sft2 == 1'b1 || rst_i == 1'b1) begin
              ram_rd_en_d1 <= #`TCQ 1'b0;
              valid_d1 <= #`TCQ 1'b0;
          end
          else begin
               ram_rd_en_d1 <= #`TCQ (RD_EN && ~(empty_i));
               valid_d1 <= #`TCQ valid_i;
          end
          end
           always@(posedge rst_delayed_sft2 or posedge CLK)
           begin
           if (rst_delayed_sft2 == 1'b1) begin
              if (C_USE_DOUT_RST == 1'b1) begin
                   @(posedge CLK)
                   ideal_dout_d1 <= #`TCQ dout_reset_val;
              end
              end
           else if (srst_rrst_busy == 1'b1) begin
                   if (C_USE_DOUT_RST == 1'b1) begin
                   ideal_dout_d1 <= #`TCQ dout_reset_val;
                   end
           end else if (ram_rd_en_d1) begin
                   ideal_dout_d1   <= #`TCQ ideal_dout;
                   err_type_d1[0] <= #`TCQ err_type[0];
                   err_type_d1[1] <= #`TCQ err_type[1];
                end
           end
      end //if
      endgenerate
//safety ckt with both registers
generate
         if ((C_MEMORY_TYPE==0 || C_MEMORY_TYPE==1) && C_EN_SAFETY_CKT==1 && C_USE_EMBEDDED_REG == 3) begin
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d1;
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d2;
         reg [1:0] rst_delayed_sft1              =1;
         reg [1:0] rst_delayed_sft2              =1;
         reg [1:0] rst_delayed_sft3              =1;
         reg [1:0] rst_delayed_sft4              =1;
        always@(posedge CLK) begin
          rst_delayed_sft1 <= #`TCQ rst_i;
          rst_delayed_sft2 <= #`TCQ rst_delayed_sft1;
          rst_delayed_sft3 <= #`TCQ rst_delayed_sft2;
          rst_delayed_sft4 <= #`TCQ rst_delayed_sft3;
        end
        always@(posedge rst_delayed_sft2 or posedge rst_i or posedge CLK) begin
          if (rst_delayed_sft2 == 1'b1 || rst_i == 1'b1) begin
            ram_rd_en_d1 <= #`TCQ 1'b0;
            valid_d1 <= #`TCQ 1'b0;
          end else begin
            ram_rd_en_d1 <= #`TCQ (RD_EN && ~(empty_i));
            fab_rd_en_d1 <= #`TCQ ram_rd_en_d1;
            valid_both <= #`TCQ valid_i;
            valid_d1 <= #`TCQ valid_both;
          end
        end
        always@(posedge rst_delayed_sft2 or posedge CLK) begin
          if (rst_delayed_sft2 == 1'b1) begin
             if (C_USE_DOUT_RST == 1'b1) begin
                   @(posedge CLK)
                  ideal_dout_d1 <= #`TCQ dout_reset_val;
             end
          end else if (srst_rrst_busy == 1'b1) begin
             if (C_USE_DOUT_RST == 1'b1) begin
               ideal_dout_d1 <= #`TCQ dout_reset_val;
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
      end //if
      endgenerate
  //Overflow may be active-low
  generate if (C_HAS_OVERFLOW==1) begin : gof
    assign OVERFLOW = ideal_overflow ? !C_OVERFLOW_LOW : C_OVERFLOW_LOW;
  end else begin : gnof
    assign OVERFLOW = 0;
  end endgenerate // gof
  assign PROG_EMPTY    = prog_empty_i;
  assign PROG_FULL     = prog_full_i;
   //Valid may change behavior based on latency or active-low
  generate if (C_HAS_VALID==1) begin : gvalid
    assign valid_i       = (C_PRELOAD_LATENCY == 0) ? (RD_EN & ~EMPTY) : ideal_valid;
    assign valid_out     = (C_PRELOAD_LATENCY == 2 && C_MEMORY_TYPE < 2) ?
                            valid_d1 : valid_i;
    assign VALID         = valid_out ? !C_VALID_LOW : C_VALID_LOW;
  end else begin : gnvalid
    assign VALID         = 0;
  end endgenerate // gvalid
  //Trim data count differently depending on set widths
  generate if (C_HAS_DATA_COUNT == 1) begin : gdc
    always @* begin
      diff_count <= wr_pntr - rd_pntr;
      if (C_DATA_COUNT_WIDTH > C_RD_PNTR_WIDTH) begin
        DATA_COUNT[C_RD_PNTR_WIDTH-1:0]  <= diff_count;
        DATA_COUNT[C_DATA_COUNT_WIDTH-1] <= 1'b0 ;
      end else begin
        DATA_COUNT <= diff_count[C_RD_PNTR_WIDTH-1:C_RD_PNTR_WIDTH-C_DATA_COUNT_WIDTH];
      end
    end
//  end else begin : gndc
//    always @* DATA_COUNT <= 0;
  end endgenerate // gdc
  //Underflow may change behavior based on latency or active-low
  generate if (C_HAS_UNDERFLOW==1) begin : guf
    assign underflow_i   = ideal_underflow;
    assign UNDERFLOW     = underflow_i ? !C_UNDERFLOW_LOW : C_UNDERFLOW_LOW;
  end else begin : gnuf
    assign UNDERFLOW     = 0;
  end endgenerate // guf
  //Write acknowledge may be active low
  generate if (C_HAS_WR_ACK==1) begin : gwr_ack
    assign WR_ACK        = ideal_wr_ack ? !C_WR_ACK_LOW : C_WR_ACK_LOW;
  end else begin : gnwr_ack
    assign WR_ACK        = 0;
  end endgenerate // gwr_ack
  /*****************************************************************************
  assign srst_i        = C_EN_SAFETY_CKT ? SAFETY_CKT_WR_RST : C_HAS_SRST ? (SRST | WR_RST_BUSY) : 0;
  assign rst_i            = C_HAS_RST ? RST : 0;
  assign srst_wrst_busy   = srst_i;
  assign srst_rrst_busy   = srst_i;
   /**************************************************************************
   //Capture delayed version of valid
   generate if (C_HAS_VALID == 1 && (C_USE_EMBEDDED_REG <3)) begin : blockVL20
     always @(posedge CLK or posedge rst_i) begin
        if (rst_i == 1'b1) begin
           valid_d1 <= 1'b0;
        end else begin
           if (srst_rrst_busy) begin
              valid_d1 <= #`TCQ 1'b0;
           end else begin
              valid_d1 <= #`TCQ valid_i;
           end
        end
     end // always @ (posedge CLK or posedge rst_i)
     end
   endgenerate // blockVL20
  generate if (C_HAS_VALID == 1 && (C_USE_EMBEDDED_REG == 3)) begin
     always @(posedge CLK or posedge rst_i) begin
        if (rst_i == 1'b1) begin
           valid_d1   <= 1'b0;
           valid_both <= 1'b0;
        end else begin
           if (srst_rrst_busy) begin
              valid_d1 <= #`TCQ 1'b0;
              valid_both <= #`TCQ 1'b0;
           end else begin
              valid_both <= #`TCQ valid_i;
               valid_d1 <= #`TCQ valid_both;
           end
        end
     end // always @ (posedge CLK or posedge rst_i)
  end
 endgenerate // blockVL20
   // Determine which stage in FWFT registers are valid
   reg stage1_valid = 0;
   reg stage2_valid = 0;
   generate
     if (C_PRELOAD_LATENCY == 0) begin : grd_fwft_proc
       always @ (posedge CLK or posedge rst_i) begin
         if (rst_i) begin
           stage1_valid     <= #`TCQ 0;
           stage2_valid     <= #`TCQ 0;
         end else begin
           if (!stage1_valid && !stage2_valid) begin
             if (!EMPTY)
               stage1_valid    <= #`TCQ 1'b1;
             else
               stage1_valid    <= #`TCQ 1'b0;
           end else if (stage1_valid && !stage2_valid) begin
             if (EMPTY) begin
               stage1_valid    <= #`TCQ 1'b0;
               stage2_valid    <= #`TCQ 1'b1;
             end else begin
               stage1_valid    <= #`TCQ 1'b1;
               stage2_valid    <= #`TCQ 1'b1;
             end
           end else if (!stage1_valid && stage2_valid) begin
             if (EMPTY && RD_EN) begin
               stage1_valid    <= #`TCQ 1'b0;
               stage2_valid    <= #`TCQ 1'b0;
             end else if (!EMPTY && RD_EN) begin
               stage1_valid    <= #`TCQ 1'b1;
               stage2_valid    <= #`TCQ 1'b0;
             end else if (!EMPTY && !RD_EN) begin
               stage1_valid    <= #`TCQ 1'b1;
               stage2_valid    <= #`TCQ 1'b1;
             end else begin
               stage1_valid    <= #`TCQ 1'b0;
               stage2_valid    <= #`TCQ 1'b1;
             end
           end else if (stage1_valid && stage2_valid) begin
             if (EMPTY && RD_EN) begin
               stage1_valid    <= #`TCQ 1'b0;
               stage2_valid    <= #`TCQ 1'b1;
             end else begin
               stage1_valid    <= #`TCQ 1'b1;
               stage2_valid    <= #`TCQ 1'b1;
             end
           end else begin
             stage1_valid    <= #`TCQ 1'b0;
             stage2_valid    <= #`TCQ 1'b0;
           end
         end // rd_rst_i
       end // always
     end
   endgenerate
   // Assign the read data count value only if it is selected,
   // otherwise output zeros.
   generate
      if (C_HAS_RD_DATA_COUNT == 1 && C_USE_FWFT_DATA_COUNT ==1) begin : grdc
       assign RD_DATA_COUNT[C_RD_DATA_COUNT_WIDTH-1:0] = rd_data_count_i_ss[C_RD_PNTR_WIDTH:C_RD_PNTR_WIDTH+1-C_RD_DATA_COUNT_WIDTH];
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
      if (C_HAS_WR_DATA_COUNT == 1 && C_USE_FWFT_DATA_COUNT == 1) begin : gwdc
       assign WR_DATA_COUNT[C_WR_DATA_COUNT_WIDTH-1:0] = wr_data_count_i_ss[C_WR_PNTR_WIDTH:C_WR_PNTR_WIDTH+1-C_WR_DATA_COUNT_WIDTH] ;
      end
   endgenerate
   generate
      if (C_HAS_WR_DATA_COUNT == 0) begin : gnwdc
   assign WR_DATA_COUNT[C_WR_DATA_COUNT_WIDTH-1:0] = {C_WR_DATA_COUNT_WIDTH{1'b0}};
      end
   endgenerate
   //reg ram_rd_en_d1 = 1'b0;
   //Capture delayed version of dout
   generate if (C_EN_SAFETY_CKT == 0 && (C_USE_EMBEDDED_REG<3)) begin
   always @(posedge CLK or posedge rst_i) begin
      if (rst_i == 1'b1) begin
         // Reset err_type only if ECC is not selected
         if (C_USE_ECC == 0) begin
            err_type_d1      <= #`TCQ 0;
            err_type_both    <= #`TCQ 0;
         end
         // DRAM and SRAM reset asynchronously
         if ((C_MEMORY_TYPE == 2 || C_MEMORY_TYPE == 3) && C_USE_DOUT_RST == 1) begin
            ideal_dout_d1 <= #`TCQ dout_reset_val;
         end
         ram_rd_en_d1 <= #`TCQ 1'b0;
        if (C_USE_DOUT_RST == 1) begin
            @(posedge CLK)
            ideal_dout_d1 <= #`TCQ dout_reset_val;
        end
      end else begin
         ram_rd_en_d1 <= #`TCQ RD_EN & ~EMPTY;
         if (srst_rrst_busy) begin
            ram_rd_en_d1 <= #`TCQ 1'b0;
            // Reset err_type only if ECC is not selected
            if (C_USE_ECC == 0) begin
               err_type_d1   <= #`TCQ 0;
               err_type_both <= #`TCQ 0;
            end
            // Reset DRAM and SRAM based FIFO, BRAM based FIFO is reset above
            if ((C_MEMORY_TYPE == 2 || C_MEMORY_TYPE == 3) && C_USE_DOUT_RST == 1) begin
               ideal_dout_d1 <= #`TCQ dout_reset_val;
            end
         if (C_USE_DOUT_RST == 1) begin
           // @(posedge CLK)
            ideal_dout_d1 <= #`TCQ dout_reset_val;
         end
         end else begin
            if (ram_rd_en_d1 ) begin
            ideal_dout_d1 <= #`TCQ ideal_dout;
            err_type_d1   <= #`TCQ err_type;
            end
         end
      end
   end   // always
end
endgenerate
//no safety ckt with both registers
 generate if (C_EN_SAFETY_CKT == 0 && (C_USE_EMBEDDED_REG==3)) begin
   always @(posedge CLK or posedge rst_i) begin
      if (rst_i == 1'b1) begin
          ram_rd_en_d1 <= #`TCQ 1'b0;
          fab_rd_en_d1 <= #`TCQ 1'b0;
         // Reset err_type only if ECC is not selected
         if (C_USE_ECC == 0) begin
            err_type_d1      <= #`TCQ 0;
            err_type_both    <= #`TCQ 0;
         end
         // DRAM and SRAM reset asynchronously
         if ((C_MEMORY_TYPE == 2 || C_MEMORY_TYPE == 3) && C_USE_DOUT_RST == 1) begin
            ideal_dout_d1 <= #`TCQ dout_reset_val;
            ideal_dout_both <= #`TCQ dout_reset_val;
      end
        if (C_USE_DOUT_RST == 1) begin
            @(posedge CLK)
            ideal_dout_d1 <= #`TCQ dout_reset_val;
            ideal_dout_both <= #`TCQ dout_reset_val;
       end
      end else begin
         if (srst_rrst_busy) begin
           ram_rd_en_d1 <= #`TCQ 1'b0;
           fab_rd_en_d1 <= #`TCQ 1'b0;
           // Reset err_type only if ECC is not selected
           if (C_USE_ECC == 0) begin
              err_type_d1   <= #`TCQ 0;
              err_type_both <= #`TCQ 0;
           end
           // Reset DRAM and SRAM based FIFO, BRAM based FIFO is reset above
           if ((C_MEMORY_TYPE == 2 || C_MEMORY_TYPE == 3) && C_USE_DOUT_RST == 1) begin
              ideal_dout_d1 <= #`TCQ dout_reset_val;
           end
           if (C_USE_DOUT_RST == 1) begin
             ideal_dout_d1 <= #`TCQ dout_reset_val;
           end
         end else begin
           ram_rd_en_d1 <= #`TCQ RD_EN & ~EMPTY;
           fab_rd_en_d1 <= #`TCQ (ram_rd_en_d1);
           if (ram_rd_en_d1 ) begin
             ideal_dout_both <= #`TCQ ideal_dout;
             err_type_both   <= #`TCQ err_type;
           end
           if (fab_rd_en_d1 ) begin
             ideal_dout_d1 <= #`TCQ ideal_dout_both;
             err_type_d1   <= #`TCQ err_type_both;
           end
         end
      end
   end   // always
end
endgenerate
   /**************************************************************************
   generate if (C_HAS_OVERFLOW == 1 && IS_8SERIES == 0) begin : g7s_ovflw
     always @(posedge CLK) begin
       ideal_overflow    <= #`TCQ WR_EN & full_i;
     end
   end else if (C_HAS_OVERFLOW == 1 && IS_8SERIES == 1) begin : g8s_ovflw
     always @(posedge CLK) begin
       //ideal_overflow    <= #`TCQ WR_EN & (rst_i | full_i);
       ideal_overflow    <= #`TCQ WR_EN & (WR_RST_BUSY | full_i);
     end
   end endgenerate // blockOF20
   generate if (C_HAS_UNDERFLOW == 1 && IS_8SERIES == 0) begin : g7s_unflw
     always @(posedge CLK) begin
       ideal_underflow   <= #`TCQ empty_i & RD_EN;
     end
   end else if (C_HAS_UNDERFLOW == 1 && IS_8SERIES == 1) begin : g8s_unflw
     always @(posedge CLK) begin
       //ideal_underflow   <= #`TCQ (rst_i | empty_i) & RD_EN;
       ideal_underflow   <= #`TCQ (RD_RST_BUSY | empty_i) & RD_EN;
     end
   end endgenerate // blockUF20
   /**************************
   reg [31:0] num_read_words_dc;
   reg [C_RD_DATA_COUNT_WIDTH-1:0] num_read_words_sized_i;
   always @(num_rd_bits) begin
     if (C_USE_FWFT_DATA_COUNT) begin
        //If using extra logic for FWFT Data Counts,
        // then scale FIFO contents to read domain,
        // and add two read words for FWFT stages
        //This value is only a temporary value and not used in the code.
        num_read_words_dc = (num_rd_bits/C_DOUT_WIDTH+2);
        //Trim the read words for use with RD_DATA_COUNT
        num_read_words_sized_i =
          num_read_words_dc[C_RD_PNTR_WIDTH : C_RD_PNTR_WIDTH-C_RD_DATA_COUNT_WIDTH+1];
     end else begin
        //If not using extra logic for FWFT Data Counts,
        // then scale FIFO contents to read domain.
        //This value is only a temporary value and not used in the code.
        num_read_words_dc = num_rd_bits/C_DOUT_WIDTH;
        //Trim the read words for use with RD_DATA_COUNT
        num_read_words_sized_i =
          num_read_words_dc[C_RD_PNTR_WIDTH-1 : C_RD_PNTR_WIDTH-C_RD_DATA_COUNT_WIDTH];
     end //if (C_USE_FWFT_DATA_COUNT)
   end //always
   /**************************
   reg [31:0] num_write_words_dc;
   reg [C_WR_DATA_COUNT_WIDTH-1:0] num_write_words_sized_i;
   always @(num_wr_bits) begin
     if (C_USE_FWFT_DATA_COUNT) begin
        //Calculate the Data Count value for the number of write words,
        // when using First-Word Fall-Through with extra logic for Data
        // Counts. This takes into consideration the number of words that
        // are expected to be stored in the FWFT register stages (it always
        // assumes they are filled).
        //This value is scaled to the Write Domain.
        //The expression (((A-1)/B))+1 divides A/B, but takes the
        // ceiling of the result.
        //When num_wr_bits==0, set the result manually to prevent
        // division errors.
        //EXTRA_WORDS_DC is the number of words added to write_words
        // due to FWFT.
        //This value is only a temporary value and not used in the code.
        num_write_words_dc = (num_wr_bits==0) ? EXTRA_WORDS_DC :  (((num_wr_bits-1)/C_DIN_WIDTH)+1) + EXTRA_WORDS_DC ;
        //Trim the write words for use with WR_DATA_COUNT
        num_write_words_sized_i =
          num_write_words_dc[C_WR_PNTR_WIDTH : C_WR_PNTR_WIDTH-C_WR_DATA_COUNT_WIDTH+1];
     end else begin
        //Calculate the Data Count value for the number of write words, when NOT
        // using First-Word Fall-Through with extra logic for Data Counts. This
        // calculates only the number of words in the internal FIFO.
        //The expression (((A-1)/B))+1 divides A/B, but takes the
        // ceiling of the result.
        //This value is scaled to the Write Domain.
        //When num_wr_bits==0, set the result manually to prevent
        // division errors.
        //This value is only a temporary value and not used in the code.
        num_write_words_dc = (num_wr_bits==0) ? 0 : ((num_wr_bits-1)/C_DIN_WIDTH)+1;
        //Trim the read words for use with RD_DATA_COUNT
        num_write_words_sized_i =
          num_write_words_dc[C_WR_PNTR_WIDTH-1 : C_WR_PNTR_WIDTH-C_WR_DATA_COUNT_WIDTH];
     end //if (C_USE_FWFT_DATA_COUNT)
   end //always
  /*************************************************************************
   wire              write_allow;
   wire              read_allow;
   wire              read_allow_dc;
   wire              write_only;
   wire              read_only;
   //wire              write_only_q;
   reg              write_only_q;
   //wire              read_only_q;
   reg              read_only_q;
   reg              full_reg;
   reg              rst_full_ff_reg1;
   reg              rst_full_ff_reg2;
   wire              ram_full_comb;
   wire              carry;
   assign write_allow  = WR_EN & ~full_i;
   assign read_allow   = RD_EN & ~empty_i;
   assign read_allow_dc = RD_EN_USER & ~USER_EMPTY_FB;
   //assign write_only   = write_allow & ~read_allow;
   //assign write_only_q = write_allow_q;
   //assign read_only    = read_allow    & ~write_allow;
   //assign read_only_q  = read_allow_q ;
   wire [C_WR_PNTR_WIDTH-1:0] diff_pntr;
   wire [C_RD_PNTR_WIDTH-1:0] diff_pntr_pe;
   reg [C_WR_PNTR_WIDTH-1:0] diff_pntr_reg1 = 0;
   reg [C_RD_PNTR_WIDTH-1:0] diff_pntr_pe_reg1 = 0;
   reg [C_RD_PNTR_WIDTH:0] diff_pntr_pe_asym = 0;
   wire [C_RD_PNTR_WIDTH:0] adj_wr_pntr_rd_asym ;
   wire [C_RD_PNTR_WIDTH:0] rd_pntr_asym;
   reg [C_WR_PNTR_WIDTH-1:0] diff_pntr_reg2 = 0;
   reg [C_WR_PNTR_WIDTH-1:0] diff_pntr_pe_reg2 = 0;
   wire [C_RD_PNTR_WIDTH-1:0] diff_pntr_pe_max;
   wire [C_RD_PNTR_WIDTH-1:0] diff_pntr_max;
   assign diff_pntr_pe_max = DIFF_MAX_RD;
   assign diff_pntr_max = DIFF_MAX_WR;
   generate if (IS_ASYMMETRY == 0) begin : diff_pntr_sym
    assign write_only   = write_allow & ~read_allow;
    assign read_only    = read_allow    & ~write_allow;
    end endgenerate
    generate if ( IS_ASYMMETRY == 1 && C_WR_PNTR_WIDTH < C_RD_PNTR_WIDTH) begin : wr_grt_rd
     assign read_only   = read_allow & &(rd_pntr[C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH-1 : 0]) & ~write_allow;
     assign write_only    = write_allow    & ~(read_allow & &(rd_pntr[C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH-1 : 0]));
    end endgenerate
    generate if (IS_ASYMMETRY ==1 && C_WR_PNTR_WIDTH > C_RD_PNTR_WIDTH) begin : rd_grt_wr
     assign read_only   = read_allow & ~(write_allow  & &(wr_pntr[C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH-1 : 0]));
     assign write_only    = write_allow &  &(wr_pntr[C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH-1 : 0]) & ~read_allow;
    end endgenerate
   // Write and Read pointer generation
   always @(posedge CLK or posedge rst_i) begin
     if (rst_i && C_EN_SAFETY_CKT == 0) begin
       wr_pntr         <= 0;
       rd_pntr         <= 0;
     end else begin
       if (srst_i) begin
         wr_pntr       <= #`TCQ 0;
         rd_pntr       <= #`TCQ 0;
       end else begin
         if (write_allow) wr_pntr <= #`TCQ wr_pntr + 1;
         if (read_allow)  rd_pntr <= #`TCQ rd_pntr + 1;
       end
     end
   end
   generate if (C_FIFO_TYPE == 2) begin : gll_dm_dout
   always @(posedge CLK) begin
     if (write_allow) begin
       if (ENABLE_ERR_INJECTION == 1)
         memory[wr_pntr] <= #`TCQ {INJECTDBITERR,INJECTSBITERR,DIN};
       else
         memory[wr_pntr] <= #`TCQ DIN;
     end
   end
   reg  [C_DATA_WIDTH-1:0] dout_tmp_q;
   reg [C_DATA_WIDTH-1:0] dout_tmp = 0;
   reg  [C_DATA_WIDTH-1:0] dout_tmp1 = 0;
   always @(posedge CLK) begin
     dout_tmp_q <= #`TCQ ideal_dout;
   end
     always @* begin
       if (read_allow)
         ideal_dout <= memory[rd_pntr];
       else
         ideal_dout <= dout_tmp_q;
     end
   end endgenerate // gll_dm_dout
   /**************************************************************************
   assign ram_rd_en        = RD_EN & !EMPTY;
   //reg [C_WR_PNTR_WIDTH-1:0] diff_pntr = 0;
   generate if (C_FIFO_TYPE != 2) begin : gnll_din
   always @(posedge CLK or posedge rst_i) begin : gen_fifo_w
     /****** Reset fifo (case 1)***************************************/
     if (rst_i == 1'b1) begin
       num_wr_bits       <= #`TCQ 0;
       next_num_wr_bits   = #`TCQ 0;
       wr_ptr            <= #`TCQ C_WR_DEPTH - 1;
       rd_ptr_wrclk      <= #`TCQ C_RD_DEPTH - 1;
       ideal_wr_ack      <= #`TCQ 0;
       ideal_wr_count    <= #`TCQ 0;
       tmp_wr_listsize    = #`TCQ 0;
       rd_ptr_wrclk_next <= #`TCQ 0;
       wr_pntr           <= #`TCQ 0;
       wr_pntr_rd1       <= #`TCQ 0;
     end else begin //rst_i==0
     if (srst_wrst_busy) begin
       num_wr_bits       <= #`TCQ 0;
       next_num_wr_bits   = #`TCQ 0;
       wr_ptr            <= #`TCQ C_WR_DEPTH - 1;
       rd_ptr_wrclk      <= #`TCQ C_RD_DEPTH - 1;
       ideal_wr_ack      <= #`TCQ 0;
       ideal_wr_count    <= #`TCQ 0;
       tmp_wr_listsize    = #`TCQ 0;
       rd_ptr_wrclk_next <= #`TCQ 0;
       wr_pntr           <= #`TCQ 0;
       wr_pntr_rd1       <= #`TCQ 0;
     end else begin//srst_i=0
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
       if (WR_EN == 1'b1) begin
         if (FULL == 1'b1) begin
             ideal_wr_ack      <= #`TCQ 0;
             //Reminder that FIFO is still full
             ideal_wr_count    <= #`TCQ num_write_words_sized_i;
         end else begin
             write_fifo;
             next_num_wr_bits  = next_num_wr_bits + C_DIN_WIDTH;
             //Write successful, so issue acknowledge
             // and no error
             ideal_wr_ack      <= #`TCQ 1;
             //Not even close to full.
             ideal_wr_count    <= num_write_words_sized_i;
           //end
         end
       end else begin //(WR_EN == 1'b1)
         //If user did not attempt a write, then do not
         // give ack or err
         ideal_wr_ack   <= #`TCQ 0;
         ideal_wr_count <= #`TCQ num_write_words_sized_i;
       end
       num_wr_bits       <= #`TCQ next_num_wr_bits;
       rd_ptr_wrclk      <= #`TCQ rd_ptr;
     end //srst_i==0
     end //wr_rst_i==0
   end // gen_fifo_w
    end endgenerate
   generate if (C_FIFO_TYPE < 2 && C_MEMORY_TYPE < 2) begin : gnll_dm_dout
     always @(posedge CLK) begin
       if (rst_i || srst_rrst_busy) begin
         if (C_USE_DOUT_RST == 1) begin
           ideal_dout <= #`TCQ dout_reset_val;
           ideal_dout_both <= #`TCQ dout_reset_val;
         end
       end
     end
    end endgenerate
   generate if (C_FIFO_TYPE != 2) begin : gnll_dout
   always @(posedge CLK or posedge rst_i) begin : gen_fifo_r
     /****** Reset fifo (case 1)***************************************/
     if (rst_i) begin
       num_rd_bits        <= #`TCQ 0;
       next_num_rd_bits    = #`TCQ 0;
       rd_ptr             <= #`TCQ C_RD_DEPTH -1;
       rd_pntr            <= #`TCQ 0;
       //rd_pntr_wr1       <= #`TCQ 0;
       wr_ptr_rdclk       <= #`TCQ C_WR_DEPTH -1;
       // DRAM resets asynchronously
       if (C_FIFO_TYPE < 2 && (C_MEMORY_TYPE == 2 || C_MEMORY_TYPE == 3 )&& C_USE_DOUT_RST == 1)
          ideal_dout    <= #`TCQ dout_reset_val;
       // Reset err_type only if ECC is not selected
       if (C_USE_ECC == 0) begin
         err_type         <= #`TCQ 0;
         err_type_d1      <= 0;
         err_type_both    <= 0;
       end
       ideal_valid        <= #`TCQ 1'b0;
       ideal_rd_count     <= #`TCQ 0;
     end else begin //rd_rst_i==0
     if (srst_rrst_busy) begin
       num_rd_bits        <= #`TCQ 0;
       next_num_rd_bits    = #`TCQ 0;
       rd_ptr             <= #`TCQ C_RD_DEPTH -1;
       rd_pntr            <= #`TCQ 0;
       //rd_pntr_wr1       <= #`TCQ 0;
       wr_ptr_rdclk       <= #`TCQ C_WR_DEPTH -1;
       // DRAM resets synchronously
       if (C_FIFO_TYPE < 2 && (C_MEMORY_TYPE == 2 || C_MEMORY_TYPE == 3 )&& C_USE_DOUT_RST == 1)
          ideal_dout    <= #`TCQ dout_reset_val;
       // Reset err_type only if ECC is not selected
       if (C_USE_ECC == 0) begin
         err_type         <= #`TCQ 0;
         err_type_d1      <= #`TCQ 0;
         err_type_both    <= #`TCQ 0;
       end
       ideal_valid        <= #`TCQ 1'b0;
       ideal_rd_count     <= #`TCQ 0;
      end //srst_i
      else begin
       //rd_pntr_wr1   <= #`TCQ rd_pntr;
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
         if (RD_EN == 1'b1) begin
           if (EMPTY == 1'b1) begin
                 ideal_valid        <= #`TCQ 1'b0;
                 ideal_rd_count     <= #`TCQ num_read_words_sized_i;
               end
           else
             begin
                   read_fifo;
                   next_num_rd_bits = next_num_rd_bits - C_DOUT_WIDTH;
                   //Acknowledge the read from the FIFO, no error
                   ideal_valid        <= #`TCQ 1'b1;
                   ideal_rd_count     <= #`TCQ num_read_words_sized_i;
                 end // if (tmp_rd_listsize == 2)
         end
       num_rd_bits      <= #`TCQ next_num_rd_bits;
       wr_ptr_rdclk     <= #`TCQ wr_ptr;
     end //s_rst_i==0
     end //rd_rst_i==0
   end //always
  end endgenerate
   // Generate diff_pntr for PROG_FULL generation
   // Generate diff_pntr_pe for PROG_EMPTY generation
   generate if ((C_PROG_FULL_TYPE != 0 || C_PROG_EMPTY_TYPE != 0) && IS_ASYMMETRY == 0) begin : reg_write_allow
     always @(posedge CLK ) begin
       if (rst_i) begin
         write_only_q   <= 1'b0;
         read_only_q    <= 1'b0;
         diff_pntr_reg1       <= 0;
         diff_pntr_pe_reg1    <= 0;
         diff_pntr_reg2       <= 0;
         diff_pntr_pe_reg2    <= 0;
       end else begin
         if (srst_i || srst_wrst_busy || srst_rrst_busy) begin
          if (srst_rrst_busy) begin
           read_only_q  <= #`TCQ 1'b0;
           diff_pntr_pe_reg1  <= #`TCQ 0;
           diff_pntr_pe_reg2  <= #`TCQ 0;
          end
          if (srst_wrst_busy) begin
           write_only_q <= #`TCQ 1'b0;
           diff_pntr_reg1     <= #`TCQ 0;
           diff_pntr_reg2     <= #`TCQ 0;
          end
         end else begin
           write_only_q <= #`TCQ write_only;
           read_only_q  <= #`TCQ read_only;
           diff_pntr_reg2  <= #`TCQ diff_pntr_reg1;
           diff_pntr_pe_reg2  <= #`TCQ diff_pntr_pe_reg1;
           // Add 1 to the difference pointer value when only write happens.
           if (write_only)
             diff_pntr_reg1 <= #`TCQ wr_pntr - adj_rd_pntr_wr + 1;
           else
             diff_pntr_reg1 <= #`TCQ wr_pntr - adj_rd_pntr_wr;
           // Add 1 to the difference pointer value when write or both write & read or no write & read happen.
           if (read_only)
             diff_pntr_pe_reg1 <= #`TCQ adj_wr_pntr_rd - rd_pntr - 1;
           else
             diff_pntr_pe_reg1 <= #`TCQ adj_wr_pntr_rd - rd_pntr;
         end
       end
     end
   assign diff_pntr_pe = diff_pntr_pe_reg1;
   assign diff_pntr = diff_pntr_reg1;
   end endgenerate // reg_write_allow
   generate if ((C_PROG_FULL_TYPE != 0 || C_PROG_EMPTY_TYPE != 0) && IS_ASYMMETRY == 1) begin : reg_write_allow_asym
    assign adj_wr_pntr_rd_asym[C_RD_PNTR_WIDTH:0] = {adj_wr_pntr_rd,1'b1};
    assign rd_pntr_asym[C_RD_PNTR_WIDTH:0] = {~rd_pntr,1'b1};
     always @(posedge CLK ) begin
       if (rst_i) begin
         diff_pntr_pe_asym    <= 0;
         diff_pntr_reg1       <= 0;
         full_reg             <= 0;
         rst_full_ff_reg1     <= 1;
         rst_full_ff_reg2     <= 1;
         diff_pntr_pe_reg1    <= 0;
       end else begin
         if (srst_i || srst_wrst_busy || srst_rrst_busy) begin
          if (srst_wrst_busy)
           diff_pntr_reg1     <= #`TCQ 0;
          if (srst_rrst_busy)
           full_reg             <=  #`TCQ 0;
           rst_full_ff_reg1     <=  #`TCQ 1;
           rst_full_ff_reg2     <=  #`TCQ 1;
           diff_pntr_pe_asym    <=  #`TCQ 0;
           diff_pntr_pe_reg1  <= #`TCQ 0;
         end else begin
             diff_pntr_pe_asym <= #`TCQ adj_wr_pntr_rd_asym + rd_pntr_asym;
             full_reg          <= #`TCQ full_i;
             rst_full_ff_reg1  <=  #`TCQ RST_FULL_FF;
             rst_full_ff_reg2  <=  #`TCQ rst_full_ff_reg1;
           if (~full_i) begin
             diff_pntr_reg1 <=  #`TCQ wr_pntr - adj_rd_pntr_wr;
          end
         end
       end
     end
   assign carry = (~(|(diff_pntr_pe_asym [C_RD_PNTR_WIDTH : 1])));
   assign diff_pntr_pe = (full_reg && ~rst_full_ff_reg2 && carry ) ? diff_pntr_pe_max : diff_pntr_pe_asym[C_RD_PNTR_WIDTH:1];
   assign diff_pntr = diff_pntr_reg1;
   end endgenerate // reg_write_allow_asym
   // Generate FULL flag
   wire                 comp0;
   wire                 comp1;
   wire                 going_full;
   wire                 leaving_full;
 generate if (C_WR_PNTR_WIDTH > C_RD_PNTR_WIDTH) begin :  gpad
    assign adj_rd_pntr_wr [C_WR_PNTR_WIDTH-1 : C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH] = rd_pntr;
    assign adj_rd_pntr_wr[C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH-1 : 0] = 0;
  end endgenerate
  generate if (C_WR_PNTR_WIDTH <= C_RD_PNTR_WIDTH) begin :  gtrim
    assign adj_rd_pntr_wr = rd_pntr[C_RD_PNTR_WIDTH-1 : C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH];
  end endgenerate
   assign comp1         = (adj_rd_pntr_wr == (wr_pntr + 1'b1));
   assign comp0         = (adj_rd_pntr_wr == wr_pntr);
    generate if (C_WR_PNTR_WIDTH == C_RD_PNTR_WIDTH) begin : gf_wp_eq_rp
     assign going_full    = (comp1 & write_allow & ~read_allow);
     assign leaving_full  = (comp0 & read_allow) | RST_FULL_GEN;
    end endgenerate
    // Write data width is bigger than read data width
    // Write depth is smaller than read depth
    // One write could be equal to 2 or 4 or 8 reads
    generate if (C_WR_PNTR_WIDTH < C_RD_PNTR_WIDTH) begin : gf_asym
      assign going_full = (comp1 & write_allow & (~ (read_allow & &(rd_pntr[C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH-1 : 0]))));
      assign leaving_full = (comp0 & read_allow & &(rd_pntr[C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH-1 : 0])) | RST_FULL_GEN;
    end endgenerate
    generate if (C_WR_PNTR_WIDTH > C_RD_PNTR_WIDTH) begin : gf_wp_gt_rp
      assign going_full = (comp1 & write_allow & ~read_allow);
      assign leaving_full =(comp0 & read_allow) | RST_FULL_GEN;
    end endgenerate
   assign ram_full_comb = going_full | (~leaving_full & full_i);
   always @(posedge CLK or posedge RST_FULL_FF) begin
     if (RST_FULL_FF)
       full_i   <= C_FULL_FLAGS_RST_VAL;
     else if (srst_wrst_busy)
       full_i   <= #`TCQ C_FULL_FLAGS_RST_VAL;
     else
       full_i   <= #`TCQ ram_full_comb;
    end
   // Generate EMPTY flag
   wire                 ecomp0;
   wire                 ecomp1;
   wire                 going_empty;
   wire                 leaving_empty;
   wire                 ram_empty_comb;
 generate if (C_RD_PNTR_WIDTH > C_WR_PNTR_WIDTH) begin :  pad
    assign adj_wr_pntr_rd [C_RD_PNTR_WIDTH-1 : C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH] = wr_pntr;
    assign adj_wr_pntr_rd[C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH-1 : 0] = 0;
  end endgenerate
  generate if (C_RD_PNTR_WIDTH <= C_WR_PNTR_WIDTH) begin :  trim
    assign adj_wr_pntr_rd = wr_pntr[C_WR_PNTR_WIDTH-1 : C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH];
  end endgenerate
   assign ecomp1         = (adj_wr_pntr_rd == (rd_pntr + 1'b1));
   assign ecomp0         = (adj_wr_pntr_rd == rd_pntr);
    generate if (C_WR_PNTR_WIDTH == C_RD_PNTR_WIDTH) begin : ge_wp_eq_rp
     assign going_empty    = (ecomp1 & ~write_allow & read_allow);
     assign leaving_empty  = (ecomp0 & write_allow);
    end endgenerate
    generate if (C_WR_PNTR_WIDTH > C_RD_PNTR_WIDTH) begin : ge_wp_gt_rp
      assign going_empty = (ecomp1 & read_allow & (~(write_allow & &(wr_pntr[C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH-1 : 0]))));
      assign leaving_empty = (ecomp0 & write_allow & &(wr_pntr[C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH-1 : 0]));
    end endgenerate
   generate if (C_WR_PNTR_WIDTH < C_RD_PNTR_WIDTH) begin : ge_wp_lt_rp
      assign going_empty = (ecomp1 & ~write_allow & read_allow);
      assign leaving_empty =(ecomp0 & write_allow);
    end endgenerate
    assign ram_empty_comb = going_empty | (~leaving_empty & empty_i);
   always @(posedge CLK or posedge rst_i) begin
     if (rst_i)
       empty_i  <= 1'b1;
     else if (srst_rrst_busy)
       empty_i  <= #`TCQ 1'b1;
     else
       empty_i  <= #`TCQ ram_empty_comb;
    end
   always @(posedge CLK or posedge rst_i) begin
     if (rst_i && C_EN_SAFETY_CKT == 0) begin
       EMPTY_FB     <= 1'b1;
     end else begin
       if (srst_rrst_busy || (SAFETY_CKT_WR_RST && C_EN_SAFETY_CKT))
         EMPTY_FB   <= #`TCQ 1'b1;
       else
         EMPTY_FB   <= #`TCQ ram_empty_comb;
     end
   end // always
   // Generate Read and write data counts for asymmetic common clock
    reg [C_GRTR_PNTR_WIDTH :0] count_dc = 0;
    wire [C_GRTR_PNTR_WIDTH :0] ratio;
    wire decr_by_one;
    wire incr_by_ratio;
    wire incr_by_one;
    wire decr_by_ratio;
   localparam IS_FWFT          = (C_PRELOAD_REGS == 1 && C_PRELOAD_LATENCY == 0) ? 1 : 0;
   generate if (C_WR_PNTR_WIDTH < C_RD_PNTR_WIDTH) begin : rd_depth_gt_wr
      assign ratio         = C_DEPTH_RATIO_RD;
      assign decr_by_one   = (IS_FWFT == 1)? read_allow_dc : read_allow;
      assign incr_by_ratio = write_allow;
      always @(posedge CLK or posedge rst_i) begin
       if (rst_i)
         count_dc  <= #`TCQ 0;
       else if (srst_wrst_busy)
         count_dc  <= #`TCQ 0;
       else begin
	 if (decr_by_one) begin
	   if (!incr_by_ratio)
            count_dc <= #`TCQ count_dc - 1;
           else
	    count_dc <= #`TCQ count_dc - 1  + ratio ;
	 end
	 else begin
	   if (!incr_by_ratio)
            count_dc <= #`TCQ count_dc ;
           else
	    count_dc <= #`TCQ count_dc + ratio ;
	end
       end
       end
       assign rd_data_count_i_ss[C_RD_PNTR_WIDTH : 0] = count_dc;
       assign wr_data_count_i_ss[C_WR_PNTR_WIDTH : 0] = count_dc[C_RD_PNTR_WIDTH : C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH];
    end endgenerate
    generate if (C_WR_PNTR_WIDTH > C_RD_PNTR_WIDTH) begin : wr_depth_gt_rd
      assign ratio         = C_DEPTH_RATIO_WR;
      assign incr_by_one   = write_allow;
      assign decr_by_ratio = (IS_FWFT == 1)? read_allow_dc : read_allow;
      always @(posedge CLK or posedge rst_i) begin
       if (rst_i)
         count_dc  <= #`TCQ 0;
       else if (srst_wrst_busy)
         count_dc  <= #`TCQ 0;
       else begin
	 if (incr_by_one) begin
	   if (!decr_by_ratio)
            count_dc <= #`TCQ count_dc + 1;
           else
	    count_dc <= #`TCQ count_dc + 1  - ratio ;
	 end
	 else begin
	   if (!decr_by_ratio)
            count_dc <= #`TCQ count_dc ;
           else
	    count_dc <= #`TCQ count_dc - ratio ;
	end
       end
       end
       assign wr_data_count_i_ss[C_WR_PNTR_WIDTH : 0] = count_dc;
       assign rd_data_count_i_ss[C_RD_PNTR_WIDTH : 0] = count_dc[C_WR_PNTR_WIDTH : C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH];
    end endgenerate
   // Generate WR_ACK flag
   always @(posedge CLK or posedge rst_i) begin
     if (rst_i)
       ideal_wr_ack  <= 1'b0;
     else if (srst_wrst_busy)
       ideal_wr_ack  <= #`TCQ 1'b0;
     else if (WR_EN & ~full_i)
       ideal_wr_ack  <= #`TCQ 1'b1;
     else
       ideal_wr_ack  <= #`TCQ 1'b0;
    end
   // Generate VALID flag
   always @(posedge CLK or posedge rst_i) begin
     if (rst_i)
       ideal_valid  <= 1'b0;
     else if (srst_rrst_busy)
       ideal_valid  <= #`TCQ 1'b0;
     else if (RD_EN & ~empty_i)
       ideal_valid  <= #`TCQ 1'b1;
     else
       ideal_valid  <= #`TCQ 1'b0;
    end
   // Generate ALMOST_FULL flag
   //generate if (C_HAS_ALMOST_FULL == 1 || C_PROG_FULL_TYPE > 2 || C_PROG_EMPTY_TYPE > 2) begin : gaf_ss
     wire                 fcomp2;
     wire                 going_afull;
     wire                 leaving_afull;
     wire                 ram_afull_comb;
   assign fcomp2         = (adj_rd_pntr_wr == (wr_pntr + 2'h2));
    generate if (C_WR_PNTR_WIDTH == C_RD_PNTR_WIDTH) begin : gaf_wp_eq_rp
     assign going_afull    = (fcomp2 & write_allow & ~read_allow);
     assign leaving_afull  = (comp1 & read_allow & ~write_allow) | RST_FULL_GEN;
    end endgenerate
    // Write data width is bigger than read data width
    // Write depth is smaller than read depth
    // One write could be equal to 2 or 4 or 8 reads
    generate if (C_WR_PNTR_WIDTH < C_RD_PNTR_WIDTH) begin : gaf_asym
      assign going_afull = (fcomp2 & write_allow & (~ (read_allow & &(rd_pntr[C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH-1 : 0]))));
      assign leaving_afull = (comp1 & (~write_allow) & read_allow & &(rd_pntr[C_RD_PNTR_WIDTH-C_WR_PNTR_WIDTH-1 : 0])) | RST_FULL_GEN;
    end endgenerate
    generate if (C_WR_PNTR_WIDTH > C_RD_PNTR_WIDTH) begin : gaf_wp_gt_rp
      assign going_afull = (fcomp2 & write_allow & ~read_allow);
      assign leaving_afull =((comp0 | comp1 | fcomp2) & read_allow) | RST_FULL_GEN;
    end endgenerate
     assign ram_afull_comb  = going_afull | (~leaving_afull & almost_full_i);
     always @(posedge CLK or posedge RST_FULL_FF) begin
       if (RST_FULL_FF)
         almost_full_i   <= C_FULL_FLAGS_RST_VAL;
       else if (srst_wrst_busy)
         almost_full_i   <= #`TCQ C_FULL_FLAGS_RST_VAL;
       else
         almost_full_i   <= #`TCQ ram_afull_comb;
      end
  // end endgenerate // gaf_ss
   // Generate ALMOST_EMPTY flag
   //generate if (C_HAS_ALMOST_EMPTY == 1) begin : gae_ss
     wire                 ecomp2;
     wire                 going_aempty;
     wire                 leaving_aempty;
     wire                 ram_aempty_comb;
     assign ecomp2          = (adj_wr_pntr_rd == (rd_pntr + 2'h2));
    generate if (C_WR_PNTR_WIDTH == C_RD_PNTR_WIDTH) begin : gae_wp_eq_rp
     assign going_aempty    = (ecomp2 & ~write_allow & read_allow);
     assign leaving_aempty  = (ecomp1 & write_allow & ~read_allow);
    end endgenerate
    generate if (C_WR_PNTR_WIDTH > C_RD_PNTR_WIDTH) begin : gae_wp_gt_rp
      assign going_aempty = (ecomp2 & read_allow & (~(write_allow & &(wr_pntr[C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH-1 : 0]))));
      assign leaving_aempty = (ecomp1 & ~read_allow & write_allow & &(wr_pntr[C_WR_PNTR_WIDTH-C_RD_PNTR_WIDTH-1 : 0]));
    end endgenerate
   generate if (C_WR_PNTR_WIDTH < C_RD_PNTR_WIDTH) begin : gae_wp_lt_rp
      assign going_aempty = (ecomp2 & ~write_allow & read_allow);
      assign leaving_aempty =((ecomp2 | ecomp1 |ecomp0) & write_allow);
    end endgenerate
     assign ram_aempty_comb = going_aempty | (~leaving_aempty & almost_empty_i);
     always @(posedge CLK or posedge rst_i) begin
       if (rst_i)
         almost_empty_i  <= 1'b1;
       else if (srst_rrst_busy)
         almost_empty_i  <= #`TCQ 1'b1;
       else
         almost_empty_i  <= #`TCQ ram_aempty_comb;
      end
  // end endgenerate // gae_ss
   // Generate PROG_FULL
   localparam  C_PF_ASSERT_VAL = (C_PRELOAD_LATENCY == 0) ?
                                  C_PROG_FULL_THRESH_ASSERT_VAL - EXTRA_WORDS_PF_PARAM : // FWFT
                                  C_PROG_FULL_THRESH_ASSERT_VAL; // STD
   localparam  C_PF_NEGATE_VAL = (C_PRELOAD_LATENCY == 0) ?
                                  C_PROG_FULL_THRESH_NEGATE_VAL - EXTRA_WORDS_PF_PARAM: // FWFT
                                  C_PROG_FULL_THRESH_NEGATE_VAL; // STD
   // Generate PROG_FULL for single programmable threshold constant
   wire [C_WR_PNTR_WIDTH-1:0] temp = C_PF_ASSERT_VAL;
   generate if (C_PROG_FULL_TYPE == 1) begin : single_pf_const
     always @(posedge CLK or posedge RST_FULL_FF) begin
       if (RST_FULL_FF && C_HAS_RST)
         prog_full_i   <= C_FULL_FLAGS_RST_VAL;
       else begin
         if (srst_wrst_busy)
           prog_full_i <= #`TCQ C_FULL_FLAGS_RST_VAL;
       else if (IS_ASYMMETRY == 0) begin
         if (RST_FULL_GEN)
          prog_full_i <= #`TCQ 1'b0;
         else if (diff_pntr == C_PF_ASSERT_VAL && write_only_q)
           prog_full_i <= #`TCQ 1'b1;
         else if (diff_pntr == C_PF_ASSERT_VAL && read_only_q)
           prog_full_i <= #`TCQ 1'b0;
         else
           prog_full_i <= #`TCQ prog_full_i;
       end
       else begin
       if (RST_FULL_GEN)
        prog_full_i <= #`TCQ 1'b0;
       else if (~RST_FULL_GEN ) begin
        if (diff_pntr>= C_PF_ASSERT_VAL )
          prog_full_i <= #`TCQ 1'b1;
        else if  ((diff_pntr) < C_PF_ASSERT_VAL )
        prog_full_i <= #`TCQ 1'b0;
       else
         prog_full_i <= #`TCQ 1'b0;
        end
       else
         prog_full_i <= #`TCQ prog_full_i;
       end
      end
     end
   end endgenerate // single_pf_const
   // Generate PROG_FULL for multiple programmable threshold constants
   generate if (C_PROG_FULL_TYPE == 2) begin : multiple_pf_const
     always @(posedge CLK or posedge RST_FULL_FF) begin
       //if (RST_FULL_FF)
       if (RST_FULL_FF && C_HAS_RST)
         prog_full_i   <= C_FULL_FLAGS_RST_VAL;
       else begin
         if (srst_wrst_busy)
           prog_full_i <= #`TCQ C_FULL_FLAGS_RST_VAL;
       else if (IS_ASYMMETRY == 0) begin
         if (RST_FULL_GEN)
           prog_full_i <= #`TCQ 1'b0;
         else if (diff_pntr == C_PF_ASSERT_VAL && write_only_q)
           prog_full_i <= #`TCQ 1'b1;
         else if (diff_pntr == C_PF_NEGATE_VAL && read_only_q)
           prog_full_i <= #`TCQ 1'b0;
         else
           prog_full_i <= #`TCQ prog_full_i;
       end
       else begin
       if (RST_FULL_GEN)
        prog_full_i <= #`TCQ 1'b0;
       else if (~RST_FULL_GEN ) begin
        if (diff_pntr >= C_PF_ASSERT_VAL )
          prog_full_i <= #`TCQ 1'b1;
       else if  (diff_pntr < C_PF_NEGATE_VAL)
         prog_full_i <= #`TCQ 1'b0;
       else
         prog_full_i <= #`TCQ prog_full_i;
        end
       else
         prog_full_i <= #`TCQ prog_full_i;
       end
      end
     end
   end endgenerate //multiple_pf_const
   // Generate PROG_FULL for single programmable threshold input port
   wire [C_WR_PNTR_WIDTH-1:0] pf3_assert_val = (C_PRELOAD_LATENCY == 0) ?
                                               PROG_FULL_THRESH - EXTRA_WORDS_PF: // FWFT
                                               PROG_FULL_THRESH; // STD
   generate if (C_PROG_FULL_TYPE == 3) begin : single_pf_input
     always @(posedge CLK or posedge RST_FULL_FF) begin//0
       //if (RST_FULL_FF)
       if (RST_FULL_FF && C_HAS_RST)
         prog_full_i   <= C_FULL_FLAGS_RST_VAL;
       else begin //1
         if (srst_wrst_busy)
           prog_full_i <= #`TCQ C_FULL_FLAGS_RST_VAL;
       else if (IS_ASYMMETRY == 0) begin//2
         if (RST_FULL_GEN)
           prog_full_i <= #`TCQ 1'b0;
         else if (~almost_full_i) begin//3
           if (diff_pntr > pf3_assert_val)
             prog_full_i <= #`TCQ 1'b1;
           else if (diff_pntr == pf3_assert_val) begin//4
             if (read_only_q)
               prog_full_i <= #`TCQ 1'b0;
             else
               prog_full_i <= #`TCQ 1'b1;
           end else//4
             prog_full_i <= #`TCQ 1'b0;
         end else//3
           prog_full_i <= #`TCQ prog_full_i;
       end //2
       else begin//5
       if (RST_FULL_GEN)
        prog_full_i <= #`TCQ 1'b0;
       else if (~full_i ) begin//6
        if (diff_pntr >= pf3_assert_val )
          prog_full_i <= #`TCQ 1'b1;
        else if  (diff_pntr < pf3_assert_val) begin//7
         prog_full_i <= #`TCQ 1'b0;
       end//7
       end//6
      else
           prog_full_i <= #`TCQ prog_full_i;
       end//5
     end//1
     end//0
   end endgenerate //single_pf_input
   // Generate PROG_FULL for multiple programmable threshold input ports
   wire [C_WR_PNTR_WIDTH-1:0] pf_assert_val = (C_PRELOAD_LATENCY == 0) ?
                                               (PROG_FULL_THRESH_ASSERT -EXTRA_WORDS_PF) : // FWFT
                                               PROG_FULL_THRESH_ASSERT; // STD
   wire [C_WR_PNTR_WIDTH-1:0] pf_negate_val = (C_PRELOAD_LATENCY == 0) ?
                                               (PROG_FULL_THRESH_NEGATE -EXTRA_WORDS_PF) : // FWFT
                                               PROG_FULL_THRESH_NEGATE; // STD
   generate if (C_PROG_FULL_TYPE == 4) begin : multiple_pf_inputs
     always @(posedge CLK or posedge RST_FULL_FF) begin
       if (RST_FULL_FF && C_HAS_RST)
         prog_full_i   <= C_FULL_FLAGS_RST_VAL;
       else begin
         if (srst_wrst_busy)
           prog_full_i <= #`TCQ C_FULL_FLAGS_RST_VAL;
       else if (IS_ASYMMETRY == 0) begin
         if (RST_FULL_GEN)
           prog_full_i <= #`TCQ 1'b0;
         else if (~almost_full_i) begin
           if (diff_pntr >= pf_assert_val)
             prog_full_i <= #`TCQ 1'b1;
           else if ((diff_pntr == pf_negate_val && read_only_q) ||
                  diff_pntr < pf_negate_val)
             prog_full_i <= #`TCQ 1'b0;
           else
             prog_full_i <= #`TCQ prog_full_i;
         end else
           prog_full_i <= #`TCQ prog_full_i;
       end
       else begin
       if (RST_FULL_GEN)
        prog_full_i <= #`TCQ 1'b0;
       else if (~full_i ) begin
        if (diff_pntr >= pf_assert_val )
          prog_full_i <= #`TCQ 1'b1;
       else if (diff_pntr < pf_negate_val)
         prog_full_i <= #`TCQ 1'b0;
       else
         prog_full_i <= #`TCQ prog_full_i;
        end
       else
         prog_full_i <= #`TCQ prog_full_i;
       end
     end
   end
   end endgenerate //multiple_pf_inputs
   // Generate PROG_EMPTY
   localparam  C_PE_ASSERT_VAL = (C_PRELOAD_LATENCY == 0) ?
                                  C_PROG_EMPTY_THRESH_ASSERT_VAL - 2: // FWFT
                                  C_PROG_EMPTY_THRESH_ASSERT_VAL; // STD
   localparam  C_PE_NEGATE_VAL = (C_PRELOAD_LATENCY == 0) ?
                                  C_PROG_EMPTY_THRESH_NEGATE_VAL - 2: // FWFT
                                  C_PROG_EMPTY_THRESH_NEGATE_VAL; // STD
   // Generate PROG_EMPTY for single programmable threshold constant
   generate if (C_PROG_EMPTY_TYPE == 1) begin : single_pe_const
     always @(posedge CLK or posedge rst_i) begin
       //if (rst_i)
       if (rst_i && C_HAS_RST)
         prog_empty_i  <= 1'b1;
       else begin
         if (srst_rrst_busy)
           prog_empty_i <= #`TCQ 1'b1;
       else if (IS_ASYMMETRY == 0) begin
         if (diff_pntr_pe == C_PE_ASSERT_VAL && read_only_q)
           prog_empty_i <= #`TCQ 1'b1;
         else if (diff_pntr_pe == C_PE_ASSERT_VAL && write_only_q)
           prog_empty_i <= #`TCQ 1'b0;
         else
           prog_empty_i <= #`TCQ prog_empty_i;
       end
       else begin
       if (~rst_i ) begin
        if (diff_pntr_pe <= C_PE_ASSERT_VAL)
          prog_empty_i <= #`TCQ 1'b1;
        else if  (diff_pntr_pe > C_PE_ASSERT_VAL)
         prog_empty_i <= #`TCQ 1'b0;
        end
       else
         prog_empty_i <= #`TCQ prog_empty_i;
       end
     end
     end
   end endgenerate // single_pe_const
   // Generate PROG_EMPTY for multiple programmable threshold constants
   generate if (C_PROG_EMPTY_TYPE == 2) begin : multiple_pe_const
     always @(posedge CLK or posedge rst_i) begin
       //if (rst_i)
       if (rst_i && C_HAS_RST)
         prog_empty_i  <= 1'b1;
       else begin
         if (srst_rrst_busy)
           prog_empty_i <= #`TCQ 1'b1;
       else if (IS_ASYMMETRY == 0) begin
         if (diff_pntr_pe == C_PE_ASSERT_VAL && read_only_q)
           prog_empty_i <= #`TCQ 1'b1;
         else if (diff_pntr_pe == C_PE_NEGATE_VAL && write_only_q)
           prog_empty_i <= #`TCQ 1'b0;
         else
           prog_empty_i <= #`TCQ prog_empty_i;
       end
       else begin
       if (~rst_i ) begin
        if (diff_pntr_pe <= C_PE_ASSERT_VAL )
          prog_empty_i <= #`TCQ 1'b1;
        else if (diff_pntr_pe > C_PE_NEGATE_VAL)
         prog_empty_i <= #`TCQ 1'b0;
       else
         prog_empty_i <= #`TCQ prog_empty_i;
        end
       else
         prog_empty_i <= #`TCQ prog_empty_i;
       end
     end
     end
   end endgenerate //multiple_pe_const
   // Generate PROG_EMPTY for single programmable threshold input port
   wire [C_RD_PNTR_WIDTH-1:0] pe3_assert_val = (C_PRELOAD_LATENCY == 0) ?
                                               (PROG_EMPTY_THRESH -2) : // FWFT
                                                PROG_EMPTY_THRESH; // STD
   generate if (C_PROG_EMPTY_TYPE == 3) begin : single_pe_input
     always @(posedge CLK or posedge rst_i) begin
       //if (rst_i)
       if (rst_i && C_HAS_RST)
         prog_empty_i  <= 1'b1;
       else begin
         if (srst_rrst_busy)
           prog_empty_i <= #`TCQ 1'b1;
       else if (IS_ASYMMETRY == 0) begin
          if (~almost_full_i) begin
           if (diff_pntr_pe < pe3_assert_val)
             prog_empty_i <= #`TCQ 1'b1;
           else if (diff_pntr_pe == pe3_assert_val) begin
             if (write_only_q)
               prog_empty_i <= #`TCQ 1'b0;
             else
               prog_empty_i <= #`TCQ 1'b1;
           end else
             prog_empty_i <= #`TCQ 1'b0;
         end else
           prog_empty_i <= #`TCQ prog_empty_i;
       end
       else begin
        if (diff_pntr_pe <= pe3_assert_val )
          prog_empty_i <= #`TCQ 1'b1;
        else if  (diff_pntr_pe > pe3_assert_val)
         prog_empty_i <= #`TCQ 1'b0;
       else
         prog_empty_i <= #`TCQ prog_empty_i;
        end
     end
     end
   end endgenerate // single_pe_input
   // Generate PROG_EMPTY for multiple programmable threshold input ports
   wire [C_RD_PNTR_WIDTH-1:0] pe4_assert_val = (C_PRELOAD_LATENCY == 0) ?
                                               (PROG_EMPTY_THRESH_ASSERT - 2) : // FWFT
                                                PROG_EMPTY_THRESH_ASSERT; // STD
   wire [C_RD_PNTR_WIDTH-1:0] pe4_negate_val = (C_PRELOAD_LATENCY == 0) ?
                                               (PROG_EMPTY_THRESH_NEGATE - 2) : // FWFT
                                                PROG_EMPTY_THRESH_NEGATE; // STD
   generate if (C_PROG_EMPTY_TYPE == 4) begin : multiple_pe_inputs
     always @(posedge CLK or posedge rst_i) begin
       //if (rst_i)
       if (rst_i && C_HAS_RST)
         prog_empty_i  <= 1'b1;
       else begin
         if (srst_rrst_busy)
           prog_empty_i <= #`TCQ 1'b1;
      else if (IS_ASYMMETRY == 0) begin
          if (~almost_full_i) begin
           if (diff_pntr_pe <= pe4_assert_val)
             prog_empty_i <= #`TCQ 1'b1;
           else if (((diff_pntr_pe == pe4_negate_val) && write_only_q) ||
                     (diff_pntr_pe > pe4_negate_val)) begin
             prog_empty_i <= #`TCQ 1'b0;
           end else
             prog_empty_i <= #`TCQ prog_empty_i;
         end else
           prog_empty_i <= #`TCQ prog_empty_i;
       end
       else begin
        if (diff_pntr_pe <= pe4_assert_val )
          prog_empty_i <= #`TCQ 1'b1;
        else if (diff_pntr_pe > pe4_negate_val)
         prog_empty_i <= #`TCQ 1'b0;
       else
         prog_empty_i <= #`TCQ prog_empty_i;
        end
     end
     end
   end endgenerate // multiple_pe_inputs
endmodule