module
//    reg               [31:7] ch_ctba_r;
    reg [READ_REG_LATENCY:0] reg_re_r;
    wire                     reg_re_w; // combined conditions to read register memory
    wire                     pre_reg_stb = reg_re_r[READ_REG_LATENCY-1] && !reg_re_r[READ_REG_LATENCY]; // only first, to make running 1
    reg                [3:0] fetch_chead_r;
    reg                [3:0] fetch_chead_stb_r;
    wire                     chead_done_w = fetch_chead_stb_r[2]; // done fetching command header
    reg                      chead_bsy;    // busy reading command header
    reg                      chead_bsy_re; // busy sending read command header
    reg                      pCmdToIssue_r;
//    reg                      fetch_ct_r;
    reg                      acfis_xmit_pend_r; //
    reg                      acfis_xmit_start_r;
    reg                      acfis_xmit_busy_r; //
//    reg                      anc_fis_r; // This is ATAPI FIS, not Command FIS
    wire                     acfis_xmit_start_w = (cfis_xmit || atapi_xmit || acfis_xmit_pend_r) && !dma_ct_busy && !fetch_cmd_busy_r; // dma_ct_busy no gaps with fetch_cmd_busy
    wire                     acfis_xmit_end = ct_stb && fis_dw_last;
    wire                     ct_re_w; // next cycle will be ct_re;
    reg  [READ_CT_LATENCY:0] ct_re_r;
    wire                     ct_stb = ct_re_r[READ_CT_LATENCY];
    reg                      fis_dw_first;
    wire                     fis_dw_last;
    reg               [11:0] dx_dwords_left;
    reg                      dx_fis_pend_r; // waiting to send first DWORD of the  H2D data transfer
    wire                     dx_dma_last_w; // sending last data word
    reg                      dx_busy_r;
    reg               [ 2:0] dx_err_r;
    reg                      xmit_ok_r;
    wire                     any_cmd_start = fetch_cmd || cfis_xmit || dx_xmit || atapi_xmit;
//    wire                     done_w = dx_dma_last_w || ((|dx_err_r) && dx_busy_r) || chead_done_w || acfis_xmit_end || dma_start; // done on last transmit or error
                             // dma_start ends 'fetch_cmd'
    wire                     done_w = xmit_ok_r || ((|dx_err_r) && dx_busy_r) || dma_start; // done on last transmit or error
    reg                      fetch_cmd_busy_r;
    // now ahci_dma watches for the last data DWORD and generates last_h2d_data, so transmission will end if either of xfer counter or DMA data (defined by total prd size)
    // if xfer_cntr wazs 0, it will never be decremented and never equal to 1, will not generate last)
//    reg                      xfer_cntr_is_set;
//    reg                      watch_prd_end;
//    wire                     masked_last_h2d_data = xfer_cntr_not_set && last_h2d_data; // otherwise use xfer counter to find FIS end
//    wire                     watch_prd_end_w =  masked_last_h2d_data || watch_prd_end; // Maybe not needed - just use watch_prd_end
//    reg                [1:0] was_dma_re;  // previous values of dma_re
//    reg                [2:0] was_dma_ndav; // inverted/masked previous values of dma_dav
//    wire                     send_last_w = was_dma_ndav[2];
    assign todev_valid = todev_full_r;
//    assign todev_valid = todev_full_r && (!watch_prd_end_w || dma_dav || send_last_w);
    assign dma_re =   dma_re_w;
    assign reg_re =   reg_re_r[1:0];
    assign ch_prdtl = ch_prdtl_r;
    assign ch_c =     ch_c_r;
    assign ch_b =     ch_b_r;
    assign ch_r =     ch_r_r;
    assign ch_p =     ch_p_r;
    assign ch_w =     ch_w_r;
    assign ch_a =     ch_a_r;
//    assign ch_cfl =   cfis_acmd_left_r;
    assign ch_cfl =   ch_cmd_len_r;
    assign reg_re_w = fetch_cmd || chead_bsy_re;
    assign dma_ctba_ld = fetch_chead_stb_r[2];
    assign dma_start =   fetch_chead_stb_r[3]; // next cycle after dma_ctba_ld
    assign pCmdToIssue = pCmdToIssue_r;
//    assign dmaCntrZero = dmaCntrZero_r;
    assign ct_re =       ct_re_r[1:0];
    // What else to wait for when
    assign fis_data_valid = ct_stb || (!dma_ct_busy && dx_fis_pend_r); // no wait write to output register 'todev_data', ct_re_r[0] is throttled according to FIFO room availability
    assign ct_re_w = todev_ready &&  acfis_xmit_busy_r && ((cfis_acmd_left_r[4:1] != 0) || (cfis_acmd_left_r[0] && !ct_re_r[0]));  // Later add more sources
    assign fis_dw_last = (cfis_acmd_left_out_r == 1);
    assign fis_data_type = {fis_dw_last, (write_or_w && dx_fis_pend_r) | (fis_dw_first && ct_stb)};
    assign fis_data_out = ({32{dx_fis_pend_r}} & DATA_FIS) | ({32{ct_stb}} & ct_data) ;
    assign dx_dma_last_w = dma_en_r && dma_re_w && ((dx_dwords_left[11:0] == 1) || last_h2d_data);
    assign dx_err = dx_err_r;
    assign dma_dev_wr = ch_w_r;
    assign  write_or_w = dma_re_w || fis_data_valid;
// When watching for FIS end, do not fill/use output register in the same cycle
    reg [3:0] dbg_was_ct_re_r;
    reg [4:0] dbg_was_cfis_acmd_left_r;
    always @ (posedge mclk) begin
        // Mutliplex between DMA and FIS output to the output routed to transmit FIFO
        // Count bypassing DMA dwords to generate FIS_last condition?
        if      (hba_rst || pcmd_st_cleared) todev_full_r <= 0;
        else if (write_or_w)                 todev_full_r <= 1; // do not fill the buffer if FIFO is not ready
        else if (todev_ready)                todev_full_r <= 0;
        if (write_or_w)                      todev_data <= dma_en_r? dma_out: fis_data_out;
        if      (hba_rst)                    todev_type <= 3; // invalid? - no, now first and last word in command FIS (impossible?)
        else if (write_or_w)                 todev_type <= dma_en_r? {dx_dma_last_w , 1'b0} : fis_data_type;
        // Read 3 DWORDs from the command header
        if (hba_rst)                         fetch_chead_r <= 0; // running 1
        else                                 fetch_chead_r <= {fetch_chead_r[2:0], fetch_cmd};
        if      (hba_rst)                    fetch_chead_stb_r <= 0;
        else                                 fetch_chead_stb_r <= {fetch_chead_stb_r[2:0], pre_reg_stb && chead_bsy};
        if      (hba_rst)                    chead_bsy <= 0;
        else if (fetch_cmd)                  chead_bsy <= 1;
        else if (chead_done_w)               chead_bsy <= 0;
        if      (hba_rst)                    chead_bsy_re <= 0;
        else if (fetch_cmd)                  chead_bsy_re <= 1;
        else if (fetch_chead_r[1])           chead_bsy_re <= 0; // read 3 dwords
        if      (hba_rst)                    reg_re_r <= 0; // [0] -> reg_re output
        else                                 reg_re_r <= {reg_re[1:0], reg_re_w};
        if      (fetch_cmd)                  reg_addr <= CLB_OFFS32;   // there will be more conditions
        else if (reg_re_r[0])                reg_addr <= reg_addr + 1;
        // save command header data to registers
        if (fetch_chead_stb_r[0]) begin
            ch_prdtl_r <=   reg_rdata[31:16];
            ch_c_r <=       reg_rdata[   10];
            ch_b_r <=       reg_rdata[    9];
            ch_r_r <=       reg_rdata[    8];
            ch_p_r <=       reg_rdata[    7];
            ch_w_r <=       reg_rdata[    6];
//            ch_a_r <=       reg_rdata[    5];
            ch_cmd_len_r<=  reg_rdata[ 4: 0];
        end
//ch_a
       if (hba_rst || atapi_xmit)     ch_a_r <= 0;
       else if (fetch_chead_stb_r[0]) ch_a_r <= reg_rdata[    5];
       if      (hba_rst)         pCmdToIssue_r <= 0;
       else if (chead_done_w)    pCmdToIssue_r <= 1;
       else if (clearCmdToIssue) pCmdToIssue_r <= 0;
       if      (hba_rst || pcmd_st_cleared) fetch_cmd_busy_r <= 0;
       else if (fetch_cmd)                  fetch_cmd_busy_r <= 1;
       else if (dma_start)                  fetch_cmd_busy_r <= 0;
       //CFIS/ATAPI common
       // fetch and send command/atapi FIS
       if (hba_rst || acfis_xmit_start_w || pcmd_st_cleared) acfis_xmit_pend_r <= 0;
       else if (cfis_xmit || atapi_xmit)                     acfis_xmit_pend_r <= 1;
       acfis_xmit_start_r <= !hba_rst && acfis_xmit_start_w;
       if      (hba_rst || pcmd_st_cleared) acfis_xmit_busy_r <= 0;
       else if (acfis_xmit_start_r)         acfis_xmit_busy_r <= 1;
       else if (acfis_xmit_end)             acfis_xmit_busy_r <= 0;
       if      (cfis_xmit)                        cfis_acmd_left_r <=   ch_cmd_len_r[ 4: 0];   // Will assume that there is room for ...
       else if (atapi_xmit)                       cfis_acmd_left_r <=  (|xfer_cntr[31:4]) ? 5'h4 : {3'b0,xfer_cntr[3:2]};
       else if (acfis_xmit_busy_r && ct_re_r[0])  cfis_acmd_left_r <=   cfis_acmd_left_r - 1;
       // Counting CFIS/ATAPI FIS dwords sent to TL
       if      (acfis_xmit_start_r) cfis_acmd_left_out_r <= cfis_acmd_left_r;
       else if (ct_stb)             cfis_acmd_left_out_r <= cfis_acmd_left_out_r - 1;
       if (hba_rst || acfis_xmit_start_w) ct_re_r <= 0;
       else                               ct_re_r <= {ct_re_r[READ_CT_LATENCY-1:0], ct_re_w};
       if      (cfis_xmit)   ct_addr <= 0;
       else if (atapi_xmit)  ct_addr <= 'h10; // start of ATAPI area
//       else if (cfis_acmd_left_r[0]) ct_addr <= ct_addr + 1;
       else if (ct_re_r[0])  ct_addr <= ct_addr + 1;
       // first/last dword in FIS
       if (!acfis_xmit_busy_r) fis_dw_first <= 1;
       else if (ct_stb)        fis_dw_first <= 0;
       //TODO: update xfer length, prdtl (only after R_OK) - yes, do it outside
       if   (dx_xmit)     dx_dwords_left[11:0] <= (xfer_cntr_zero || (|xfer_cntr[31:13])) ? 12'h800 : {1'b0,xfer_cntr[12:2]};
       else if (dma_re_w) dx_dwords_left[11:0] <= dx_dwords_left[11:0] - 1;
       if      (dx_xmit)  dwords_sent <= 0;
       else if (dma_re_w) dwords_sent <= dwords_sent + 1;
       // send FIS header
       if (hba_rst || write_or_w ||pcmd_st_cleared) dx_fis_pend_r <= 0;
       else if (dx_xmit)                            dx_fis_pend_r <= 1;
       if (hba_rst || dx_dma_last_w || (|dx_err_r) || pcmd_st_cleared) dma_en_r  <= 0;
       else if (dx_fis_pend_r &&  write_or_w)                          dma_en_r  <= 1;
       // Abort on transmit errors
       if (hba_rst || any_cmd_start) dx_err_r[0] <= 0;
       else if (syncesc_recv)        dx_err_r[0] <= 1;
       if (hba_rst || any_cmd_start) dx_err_r[1] <= 0;
       else if (xmit_err)            dx_err_r[1] <= 1;
       if (hba_rst || any_cmd_start) dx_err_r[2] <= 0;
       else if (xrdy_collision)      dx_err_r[2] <= 1;
       if      (hba_rst || pcmd_st_cleared)    dx_busy_r <= 0;   // sending CFIS, AFIS or data FIS (until error or R_OK)
       else if (dx_xmit || acfis_xmit_start_r) dx_busy_r <= 1;
       else if (xmit_ok || (|dx_err_r))        dx_busy_r <= 0;
       dma_prd_start <= (dma_start && (PREFETCH_ALWAYS || ch_p_r || !ch_w_r)) ||  // device read may prefetch just prd addresses
                        (dx_fis_pend_r &&  write_or_w); // enable PRD read now (if it was not already done)
       if      (hba_rst)                      done <= 0;
       else                                   done <= done_w;
       if      (hba_rst || pcmd_st_cleared)   busy <= 0;
       else if (any_cmd_start)                busy <= 1;
       else if (done_w)                       busy <= 0;
       if      (hba_rst)                      xmit_ok_r <= 0;
       else                                   xmit_ok_r <= dx_busy_r && !(|dx_err_r) && xmit_ok;
       dma_cmd_abort <= done_w && (|dx_err_r);
       if (cfis_xmit) dbg_was_ct_re_r <= {ct_re_r, ct_re_w};
       if (cfis_xmit) dbg_was_cfis_acmd_left_r <= cfis_acmd_left_r;
    end
    assign debug_01 = {dx_fis_pend_r,  ct_re_r, ct_re_w, cfis_acmd_left_r}; // 1,2,5
//    assign debug_01 = {acfis_xmit_start_w,  acfis_xmit_pend_r, dma_ct_busy, fetch_cmd_busy_r, ct_re_w, dbg_was_cfis_acmd_left_r}; // 1,2,5
//    wire                     acfis_xmit_start_w = (cfis_xmit || atapi_xmit || acfis_xmit_pend_r) && !dma_ct_busy && !fetch_cmd_busy_r; // dma_ct_busy no gaps with fetch_cmd_busy
endmodule