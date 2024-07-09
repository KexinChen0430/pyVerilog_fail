module if
  wl3[2:0]
     always @* case ({wp, fp, wl})
        6'h00: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b0001; fifo_rd <= 0; nfp <= 1; swl <= 1; end
 */
    // mclk domain
    always @ (posedge mclk) begin
        hrst_mclk <= hrst;
        if      (mrst || hrst_mclk) en_fifo_wr <= 0;
        else if (init_mclk)         en_fifo_wr <= 1;
        else if (flush_mclk)        en_fifo_wr <= 0;
        if (hrst_mclk || init_mclk)    waddr <= 0;
        else if (fifo_wr)              waddr <= waddr + 1;
        if (hrst_mclk || init_mclk)    fifo_full <= 0;
        else if (fifo_wr && waddr[0])  fifo_full <= {fifo_full[ADDRESS_NUM-2:0], ~waddr[ADDRESS_BITS+1]};
        fifo_half_mclk <= en_fifo_wr && fifo_nempty [waddr[ADDRESS_BITS:1]] ^ waddr[ADDRESS_BITS+1];
        if (fifo_wr && !waddr[0]) fifo0_ram[waddr[ADDRESS_BITS:1]] <= din;
        if (fifo_wr &&  waddr[0]) fifo1_ram[waddr[ADDRESS_BITS:1]] <= din;
        fifo_nempty_mclk <= (fifo_full [raddr[ADDRESS_BITS-1:0]] ^ raddr[ADDRESS_BITS]); // only valid after read is stopped
    end
    // hclk -> mclk cross-clock synchronization
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) init_mclk_i (
        .rst       (hrst),            // input
        .src_clk   (hclk),            // input
        .dst_clk   (mclk),            // input
        .in_pulse  (init),            // input
        .out_pulse (init_mclk),       // output
        .busy()                       // output
    );
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) flush_mclk_i (
        .rst       (hrst),            // input
        .src_clk   (hclk),            // input
        .dst_clk   (mclk),            // input
        .in_pulse  (flush_hclk),      // input
        .out_pulse (flush_mclk),      // output
        .busy()                       // output
    );
    // mclk -> hclk cross-clock synchronization
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) init_confirm_i (
        .rst       (mrst),            // input
        .src_clk   (mclk),            // input
        .dst_clk   (hclk),            // input
        .in_pulse  (init_mclk),       // input
        .out_pulse (init_confirm),    // output
        .busy()                       // output
    );
/*
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) flush_conf_i (
        .rst       (mrst),            // input
        .src_clk   (mclk),            // input
        .dst_clk   (hclk),            // input
        .in_pulse  (flush_mclk),      // input
        .out_pulse (flush_conf),      // output
        .busy()                       // output
    );
*/
    /*
    wl: 0: left 1 word, 1: left 2 words, 2: left 3 words, 3: left >=4 words
    wp (pointer in the output qword, only first in PRD can be non-zero) 0: word 0 of output QW, ...
    mx0 0: use fifo_do_prev[16], 1: fifo_do_prev[32], 2:fifo_do_prev[48], 3:fifo_do[0];
    mx1 0: use fifo_do_prev[16], 1: fifo_do_prev[32], 2:fifo_do_prev[48], 3:fifo_do[0], 4:fifo_do[16];
    mx2 0: use fifo_do_prev[16], 1: fifo_do_prev[32], 2:fifo_do_prev[48], 3:fifo_do[0], 4:fifo_do[16], 5:fifo_do[32];
    mx3 0: use fifo_do_prev[16], 1: fifo_do_prev[32], 2:fifo_do_prev[48], 3:fifo_do[0], 4:fifo_do[16], 5:fifo_do[32],  6:fifo_do[48];
    fp/nfp: 0 - pointer to fifo_do_prev[16], 1 : fifo_do_prev[32], 2: fifo_do_prev[48], 3: fifo_do[0]
    */
    always @* case ({wp, fp, wl})
        6'h00: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b0001; need_fifo <= 0; nfp <= 1; swl <= 1; end
        6'h01: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b0011; need_fifo <= 0; nfp <= 2; swl <= 2; end
        6'h02: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b0111; need_fifo <= 0; nfp <= 3; swl <= 3; end
        6'h03: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b1111; need_fifo <= 1; nfp <= 0; swl <= 4; end
        6'h04: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b0001; need_fifo <= 0; nfp <= 2; swl <= 1; end
        6'h05: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b0011; need_fifo <= 0; nfp <= 3; swl <= 2; end
        6'h06: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b0111; need_fifo <= 1; nfp <= 0; swl <= 3; end
        6'h07: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b1111; need_fifo <= 1; nfp <= 1; swl <= 4; end
        6'h08: begin mx0 <= 2; mx1 <= 3; mx2 <= 4; mx3  <= 5; pm <= 4'b0001; need_fifo <= 0; nfp <= 3; swl <= 1; end
        6'h09: begin mx0 <= 2; mx1 <= 3; mx2 <= 4; mx3  <= 5; pm <= 4'b0011; need_fifo <= 1; nfp <= 0; swl <= 2; end
        6'h0a: begin mx0 <= 2; mx1 <= 3; mx2 <= 4; mx3  <= 5; pm <= 4'b0111; need_fifo <= 1; nfp <= 1; swl <= 3; end
        6'h0b: begin mx0 <= 2; mx1 <= 3; mx2 <= 4; mx3  <= 5; pm <= 4'b1111; need_fifo <= 1; nfp <= 2; swl <= 4; end
        6'h0c: begin mx0 <= 3; mx1 <= 4; mx2 <= 5; mx3  <= 6; pm <= 4'b0001; need_fifo <= 1; nfp <= 0; swl <= 1; end
        6'h0d: begin mx0 <= 3; mx1 <= 4; mx2 <= 5; mx3  <= 6; pm <= 4'b0011; need_fifo <= 1; nfp <= 1; swl <= 2; end
        6'h0e: begin mx0 <= 3; mx1 <= 4; mx2 <= 5; mx3  <= 6; pm <= 4'b0111; need_fifo <= 1; nfp <= 2; swl <= 3; end
        6'h0f: begin mx0 <= 3; mx1 <= 4; mx2 <= 5; mx3  <= 6; pm <= 4'b1111; need_fifo <= 1; nfp <= 3; swl <= 4; end
        6'h10: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b0010; need_fifo <= 0; nfp <= 1; swl <= 1; end
        6'h11: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b0110; need_fifo <= 0; nfp <= 2; swl <= 2; end
        6'h12: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b1110; need_fifo <= 0; nfp <= 3; swl <= 3; end
        6'h13: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b1110; need_fifo <= 0; nfp <= 3; swl <= 3; end
        6'h14: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b0010; need_fifo <= 0; nfp <= 2; swl <= 1; end
        6'h15: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b0110; need_fifo <= 0; nfp <= 3; swl <= 2; end
        6'h16: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b1110; need_fifo <= 1; nfp <= 0; swl <= 3; end
        6'h17: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b1110; need_fifo <= 1; nfp <= 0; swl <= 3; end
        6'h18: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b0010; need_fifo <= 0; nfp <= 3; swl <= 1; end
        6'h19: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b0110; need_fifo <= 1; nfp <= 0; swl <= 2; end
        6'h1a: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b1110; need_fifo <= 1; nfp <= 1; swl <= 3; end
        6'h1b: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b1110; need_fifo <= 1; nfp <= 1; swl <= 3; end
        6'h1c: begin mx0 <= 2; mx1 <= 3; mx2 <= 4; mx3  <= 5; pm <= 4'b0010; need_fifo <= 1; nfp <= 0; swl <= 1; end
        6'h1d: begin mx0 <= 2; mx1 <= 3; mx2 <= 4; mx3  <= 5; pm <= 4'b0110; need_fifo <= 1; nfp <= 1; swl <= 2; end
        6'h1e: begin mx0 <= 2; mx1 <= 3; mx2 <= 4; mx3  <= 5; pm <= 4'b1110; need_fifo <= 1; nfp <= 2; swl <= 3; end
        6'h1f: begin mx0 <= 2; mx1 <= 3; mx2 <= 4; mx3  <= 5; pm <= 4'b1110; need_fifo <= 1; nfp <= 2; swl <= 3; end
        6'h20: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 1; pm <= 4'b0100; need_fifo <= 0; nfp <= 1; swl <= 1; end
        6'h21: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 1; pm <= 4'b1100; need_fifo <= 0; nfp <= 2; swl <= 2; end
        6'h22: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 1; pm <= 4'b1100; need_fifo <= 0; nfp <= 2; swl <= 2; end
        6'h23: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 1; pm <= 4'b1100; need_fifo <= 0; nfp <= 2; swl <= 2; end
        6'h24: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b0100; need_fifo <= 0; nfp <= 2; swl <= 1; end
        6'h25: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b1100; need_fifo <= 0; nfp <= 3; swl <= 2; end
        6'h26: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b1100; need_fifo <= 0; nfp <= 3; swl <= 2; end
        6'h27: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b1100; need_fifo <= 0; nfp <= 3; swl <= 2; end
        6'h28: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b0100; need_fifo <= 0; nfp <= 3; swl <= 1; end
        6'h29: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b1100; need_fifo <= 1; nfp <= 0; swl <= 2; end
        6'h2a: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b1100; need_fifo <= 1; nfp <= 0; swl <= 2; end
        6'h2b: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b1100; need_fifo <= 1; nfp <= 0; swl <= 2; end
        6'h2c: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b0100; need_fifo <= 1; nfp <= 0; swl <= 1; end
        6'h2d: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b1100; need_fifo <= 1; nfp <= 1; swl <= 2; end
        6'h2e: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b1100; need_fifo <= 1; nfp <= 1; swl <= 2; end
        6'h2f: begin mx0 <= 1; mx1 <= 2; mx2 <= 3; mx3  <= 4; pm <= 4'b1100; need_fifo <= 1; nfp <= 1; swl <= 2; end
        6'h30: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 0; pm <= 4'b1000; need_fifo <= 0; nfp <= 1; swl <= 1; end
        6'h31: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 0; pm <= 4'b1000; need_fifo <= 0; nfp <= 1; swl <= 1; end
        6'h32: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 0; pm <= 4'b1000; need_fifo <= 0; nfp <= 1; swl <= 1; end
        6'h33: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 0; pm <= 4'b1000; need_fifo <= 0; nfp <= 1; swl <= 1; end
        6'h34: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 1; pm <= 4'b1000; need_fifo <= 0; nfp <= 2; swl <= 1; end
        6'h35: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 1; pm <= 4'b1000; need_fifo <= 0; nfp <= 2; swl <= 1; end
        6'h36: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 1; pm <= 4'b1000; need_fifo <= 0; nfp <= 2; swl <= 1; end
        6'h37: begin mx0 <= 0; mx1 <= 0; mx2 <= 0; mx3  <= 1; pm <= 4'b1000; need_fifo <= 0; nfp <= 2; swl <= 1; end
        6'h38: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b1000; need_fifo <= 0; nfp <= 3; swl <= 1; end
        6'h39: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b1000; need_fifo <= 0; nfp <= 3; swl <= 1; end
        6'h3a: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b1000; need_fifo <= 0; nfp <= 3; swl <= 1; end
        6'h3b: begin mx0 <= 0; mx1 <= 0; mx2 <= 1; mx3  <= 2; pm <= 4'b1000; need_fifo <= 0; nfp <= 3; swl <= 1; end
        6'h3c: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b1000; need_fifo <= 1; nfp <= 0; swl <= 1; end
        6'h3d: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b1000; need_fifo <= 1; nfp <= 0; swl <= 1; end
        6'h3e: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b1000; need_fifo <= 1; nfp <= 0; swl <= 1; end
        6'h3f: begin mx0 <= 0; mx1 <= 1; mx2 <= 2; mx3  <= 3; pm <= 4'b1000; need_fifo <= 1; nfp <= 0; swl <= 1; end
    endcase
endmodule