module, since this is a DQ/DQS bus-level requirement,
// not a per-rank requirement.
  localparam CASRD2CASWR = CL + (BURST_MODE == "4" ? 2 : 4) + DQRD2DQWR_DLY - CWL;
  localparam CASRD2CASWR_CLKS = (nCK_PER_CLK == 1)
                                    ? CASRD2CASWR :
                                 (nCK_PER_CLK == 2)
                                    ? ((CASRD2CASWR / 2) + (CASRD2CASWR % 2)) :
                                      ((CASRD2CASWR / 4) + ((CASRD2CASWR % 4) ? 1 :0));
  localparam RTW_CNT_WIDTH = clogb2(CASRD2CASWR_CLKS);
  generate
    begin : rtw_timer
      reg read_this_rank;
      always @(/*AS*/sending_col or rd_this_rank_r) begin
        read_this_rank = 1'b0;
        for (i = 0; i < nBANK_MACHS; i = i + 1)
        read_this_rank =
           read_this_rank || (sending_col[i] && rd_this_rank_r[(i*RANKS)+ID]);
      end
      reg [RTW_CNT_WIDTH-1:0] rtw_cnt_r;
      reg [RTW_CNT_WIDTH-1:0] rtw_cnt_ns;
      always @(/*AS*/rst or col_rd_wr or sending_col or rtw_cnt_r)
        if (rst) rtw_cnt_ns = {RTW_CNT_WIDTH{1'b0}};
        else begin
          rtw_cnt_ns = rtw_cnt_r;
          if (col_rd_wr && |sending_col) rtw_cnt_ns =
                 CASRD2CASWR_CLKS[RTW_CNT_WIDTH-1:0] - ONE[RTW_CNT_WIDTH-1:0];
          else if (|rtw_cnt_r) rtw_cnt_ns = rtw_cnt_r - ONE[RTW_CNT_WIDTH-1:0];
        end
      wire inhbt_wr_ns = |rtw_cnt_ns;
      always @(posedge clk) rtw_cnt_r <= #TCQ rtw_cnt_ns;
      always @(inhbt_wr_ns) inhbt_wr = inhbt_wr_ns;
    end
  endgenerate
// Refresh request generation.  Implement a "refresh bank".  Referred
// to as pullin-in refresh in the JEDEC spec.
// The refresh_rank_r counter increments when a refresh to this
// rank has been decoded.  In the up direction, the count saturates
// at nREFRESH_BANK.  As specified in the JEDEC spec, nREFRESH_BANK
// is normally eight.  The counter decrements with each refresh_tick,
// saturating at zero.  A refresh will be requests when the rank is
// not busy and refresh_rank_r != nREFRESH_BANK, or refresh_rank_r
// equals zero.
  localparam REFRESH_BANK_WIDTH = clogb2(nREFRESH_BANK + 1);
  generate begin : refresh_generation
      reg my_rank_busy;
      always @(/*AS*/rank_busy_r) begin
        my_rank_busy = 1'b0;
        for (i=0; i < nBANK_MACHS; i=i+1)
          my_rank_busy = my_rank_busy || rank_busy_r[(i*RANKS)+ID];
      end
      wire my_refresh =
        insert_maint_r1 && ~maint_zq_r && ~maint_sre_r && ~maint_srx_r &&
        (maint_rank_r == ID[RANK_WIDTH-1:0]);
      reg [REFRESH_BANK_WIDTH-1:0] refresh_bank_r;
      reg [REFRESH_BANK_WIDTH-1:0] refresh_bank_ns;
      always @(/*AS*/app_ref_req or init_calib_complete or my_refresh
               or refresh_bank_r or refresh_tick)
        if (~init_calib_complete)
          if (REFRESH_TIMER_DIV == 0)
                refresh_bank_ns = nREFRESH_BANK[0+:REFRESH_BANK_WIDTH];
          else refresh_bank_ns = {REFRESH_BANK_WIDTH{1'b0}};
        else
          case ({my_refresh, refresh_tick, app_ref_req})
            3'b000, 3'b110, 3'b101, 3'b111 : refresh_bank_ns = refresh_bank_r;
            3'b010, 3'b001, 3'b011 : refresh_bank_ns =
                                          (|refresh_bank_r)?
                                          refresh_bank_r - ONE[0+:REFRESH_BANK_WIDTH]:
                                          refresh_bank_r;
            3'b100                 : refresh_bank_ns =
                                   refresh_bank_r + ONE[0+:REFRESH_BANK_WIDTH];
          endcase // case ({my_refresh, refresh_tick})
      always @(posedge clk) refresh_bank_r <= #TCQ refresh_bank_ns;
   `ifdef MC_SVA
      refresh_bank_overflow: assert property (@(posedge clk)
               (rst || (refresh_bank_r <= nREFRESH_BANK)));
      refresh_bank_underflow: assert property (@(posedge clk)
               (rst || ~(~|refresh_bank_r && ~my_refresh && refresh_tick)));
      refresh_hi_priority: cover property (@(posedge clk)
               (rst && ~|refresh_bank_ns && (refresh_bank_r ==
                       ONE[0+:REFRESH_BANK_WIDTH])));
      refresh_bank_full: cover property (@(posedge clk)
               (rst && (refresh_bank_r ==
                        nREFRESH_BANK[0+:REFRESH_BANK_WIDTH])));
   `endif
      assign refresh_request = init_calib_complete &&
              (~|refresh_bank_r ||
  ((refresh_bank_r != nREFRESH_BANK[0+:REFRESH_BANK_WIDTH]) && ~my_rank_busy));
    end
  endgenerate
// Periodic read request generation.
  localparam PERIODIC_RD_TIMER_WIDTH = clogb2(PERIODIC_RD_TIMER_DIV + /*idle state*/ 1);
  generate begin : periodic_rd_generation
    if ( PERIODIC_RD_TIMER_DIV != 0 ) begin  // enable periodic reads
      reg read_this_rank;
      always @(/*AS*/rd_this_rank_r or sending_col) begin
        read_this_rank = 1'b0;
        for (i = 0; i < nBANK_MACHS; i = i + 1)
        read_this_rank =
           read_this_rank || (sending_col[i] && rd_this_rank_r[(i*RANKS)+ID]);
      end
      reg read_this_rank_r;
      reg read_this_rank_r1;
      always @(posedge clk) read_this_rank_r  <= #TCQ read_this_rank;
      always @(posedge clk) read_this_rank_r1 <= #TCQ read_this_rank_r;
      wire int_read_this_rank = read_this_rank &&
                                (((nCK_PER_CLK == 4) && read_this_rank_r)  ||
				 ((nCK_PER_CLK != 4) && read_this_rank_r1));
      reg periodic_rd_cntr1_ns;
      reg periodic_rd_cntr1_r;
      always @(/*AS*/clear_periodic_rd_request or periodic_rd_cntr1_r) begin
        periodic_rd_cntr1_ns = periodic_rd_cntr1_r;
        if (clear_periodic_rd_request)
          periodic_rd_cntr1_ns = periodic_rd_cntr1_r + 1'b1;
      end
      always @(posedge clk) begin
        if (rst) periodic_rd_cntr1_r <= #TCQ 1'b0;
        else     periodic_rd_cntr1_r <= #TCQ periodic_rd_cntr1_ns;
      end
      reg [PERIODIC_RD_TIMER_WIDTH-1:0] periodic_rd_timer_r;
      reg [PERIODIC_RD_TIMER_WIDTH-1:0] periodic_rd_timer_ns;
      always @(/*AS*/init_calib_complete or maint_prescaler_tick_r
               or periodic_rd_timer_r or int_read_this_rank) begin
        periodic_rd_timer_ns = periodic_rd_timer_r;
        if (~init_calib_complete)
          periodic_rd_timer_ns = {PERIODIC_RD_TIMER_WIDTH{1'b0}};
        else if (int_read_this_rank)
                periodic_rd_timer_ns =
                   PERIODIC_RD_TIMER_DIV[0+:PERIODIC_RD_TIMER_WIDTH];
             else if (|periodic_rd_timer_r && maint_prescaler_tick_r)
                 periodic_rd_timer_ns =
                   periodic_rd_timer_r - ONE[0+:PERIODIC_RD_TIMER_WIDTH];
      end
      always @(posedge clk) periodic_rd_timer_r <= #TCQ periodic_rd_timer_ns;
      wire periodic_rd_timer_one = maint_prescaler_tick_r &&
                 (periodic_rd_timer_r == ONE[0+:PERIODIC_RD_TIMER_WIDTH]);
      reg periodic_rd_request_r;
      wire periodic_rd_request_ns = ~rst &&
                     ((app_periodic_rd_req && init_calib_complete) ||
                      ((PERIODIC_RD_TIMER_DIV != 0) && ~init_calib_complete) ||
                      // (~(read_this_rank || clear_periodic_rd_request) &&
                      (~((int_read_this_rank) || (clear_periodic_rd_request && periodic_rd_cntr1_r)) &&
                      (periodic_rd_request_r || periodic_rd_timer_one)));
      always @(posedge clk) periodic_rd_request_r <=
                              #TCQ periodic_rd_request_ns;
   `ifdef MC_SVA
      read_clears_periodic_rd_request: cover property (@(posedge clk)
               (rst && (periodic_rd_request_r && read_this_rank)));
   `endif
      assign periodic_rd_request = init_calib_complete && periodic_rd_request_r;
    end else
      assign periodic_rd_request = 1'b0; //to disable periodic reads
  end
  endgenerate
endmodule