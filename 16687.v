module or DMA consumes DWORD
    input                     debug_link_send_data, // @posedge mclk (sata_clk, 75MHz)  - last symbol was data output (to count sent out)
    input                     debug_link_dmatp,     // link received DMATp from device
    input                     irq,                  // system irq
    output                        datascope_clk,
    output reg [ADDRESS_BITS-1:0] datascope_waddr,
    output                        datascope_we,
    output reg             [31:0] datascope_di
    );
`include "includes/ahci_localparams.vh" // @SuppressThisWarning VEditor : Unused localparams
    reg                 [2:0] punch_tag;
    wire                      write_tag_w = soft_write_en && (soft_write_addr[ADDRESS_BITS-1:0] == HBA_PORT__PunchTime__TAG__ADDR);
    reg                       pend_punch_time;
    wire                      write_punch_time = pend_punch_time && !fis_start && !fis_run && !fis_run_d;
    reg                       fis_run;
    reg                       fis_run_d;
    reg                       fis_we; // recording FIS data (until end or max len)
    reg                [12:0] fis_len;
    reg                [12:0] fis_left;
    reg                [31:0] fis_data;
    reg                [27:0] cur_time;
    reg                       was_h2d_last;
    reg                       h2d_ready_d; // delayed h2d_ready to count 1->0 transitions
    reg                [ 7:0] h2d_nready_cntr; // count (infrequent) events when h2d FIFO turns off ready
//    reg
    wire                      fis_start = (h2d_valid && h2d_ready && (h2d_type == 1)) ||
                                          (d2h_valid && d2h_ready && (d2h_type == 1));
    wire                      fis_end =   (d2h_valid? (d2h_valid && d2h_ready && d2h_type[1]): was_h2d_last);
//    wire                      fis_end_we = (fis_left == 0) || fis_end;
    wire                      pre_we_w =  fis_run && (d2h_valid?(d2h_valid && d2h_ready):(h2d_valid && h2d_ready));
    reg                       fis_run_d2;
    reg                       fis_run_d3;
    reg                       fis_run_d4; // to read non 0x39 d2h fis
    reg                       fis_run_d5; // number of dwords sent by link a s data symbols
//  reg                       fis_first;
    reg                       data_fis;
    reg                       pre_we_r;
    reg                       we_r;
    wire                      inc_dw_cntr =  fis_run && (d2h_valid?(d2h_ready && (d2h_type == 0)):(h2d_valid && h2d_ready));
    wire is_cfis_w = h2d_valid && (h2d_data[ 7: 0] == 8'h27) && // valid @ fis_start
                                 ((h2d_data[23:16] == 8'h25) || // Read DMA Extended
                                  (h2d_data[23:16] == 8'h35) || // Write DMA Extended
                                  (h2d_data[23:16] == 8'hC8) || // Read DMA
                                  (h2d_data[23:16] == 8'hCA));   // Write DMA
    reg  is_cfis_r;
    reg                [23:0] last_dma_cmd;
    reg                       set_dma_count;
    reg                [21:0] dw_count;
    wire                [7:0] fis_data_w = d2h_valid ? d2h_data[7:0] : h2d_data[7:0];
    reg                [31:0] non_dma_act; // last D2H FIS that was not DMA activate, received after DMA/IO command
    reg                       set_non_dma_act;
    reg                [21:0] link_count;
    reg                [21:0] link_count_latched;
    reg                       reset_link_count; // data FIS from dma command until
    reg                       was_link_dmatp;   //
    reg                       irq_r;
    reg                       irq_was;
    wire                      we_w = write_punch_time || fis_start || (fis_we ? pre_we_r : (!fis_run && (fis_run_d || fis_run_d2 || fis_run_d3 || fis_run_d4  || fis_run_d5))); // 3 after
    wire                      we_irq= (irq_was ^ irq_r) && !we_w; // only when not irq
//    input              debug_link_dmatp,      // link received DMATp from device
    assign datascope_we =  we_r;
    assign datascope_clk = clk;
    always @ (posedge clk) begin
        was_h2d_last <= h2d_type[1] && h2d_valid && h2d_ready;
        if (rst) cur_time <= 0;
        else     cur_time <= cur_time + 1;
        if (write_tag_w) punch_tag <= soft_write_data[2:0];
        if      (rst)                 pend_punch_time <= 0;
        else if (write_tag_w)         pend_punch_time <= 1;
        else if (write_punch_time)    pend_punch_time <= 0;
        if (write_punch_time || fis_start)   datascope_di <= {write_punch_time?{1'b1,punch_tag}:{3'b0,d2h_valid},cur_time};
        else if (fis_we)                     datascope_di <= fis_data;
        else if (!fis_run    && fis_run_d)   datascope_di <= {19'h7fff8, fis_len};
        else if (!fis_run_d  && fis_run_d2)  datascope_di <= {10'h2a8,   dw_count};
        else if (!fis_run_d2 && fis_run_d3)  datascope_di <= {8'h55,   last_dma_cmd};
        else if (!fis_run_d3 && fis_run_d4)  datascope_di <= non_dma_act;
        else if (!fis_run_d4 && fis_run_d5)  datascope_di <= {h2d_nready_cntr[7:0], was_link_dmatp, 1'b0, link_count_latched};
        else if (we_irq)                     datascope_di <= {3'h7,irq_r,cur_time};
        pre_we_r <= pre_we_w || fis_start ;
//        we_r <= write_punch_time || fis_start || (fis_we ? pre_we_r : (!fis_run && fis_run_d));
        we_r <= we_w || we_irq;
        if     (fis_start) fis_left <= FIS_LEN - 1;
        else if (pre_we_w) fis_left <= fis_left - 1;
//        if     (fis_start) fis_first <= 1;
//       else if (pre_we_w) fis_first <= 0;
        if      (fis_end)               data_fis <= 0;
//        else if (pre_we_w && fis_start) data_fis <= fis_data_w == 8'h46;
        else if (fis_start) data_fis <= fis_data_w == 8'h46;
        if      (rst)                        fis_we <= 0;
        else if (fis_start)                  fis_we <= 1;
        else if ((fis_left == 0) || fis_end) fis_we <= 0;
        if      (rst)        fis_run <= 0;
        else if (fis_start)  fis_run <= 1;
        else if (fis_end)    fis_run <= 0;
        fis_run_d <=  fis_run;
        fis_run_d2 <= fis_run_d;
        fis_run_d3 <= fis_run_d2;
        fis_run_d4 <= fis_run_d3;
        fis_run_d5 <= fis_run_d4;
        if      (cfis)                    dw_count <= 0;
        else if (inc_dw_cntr && data_fis) dw_count <= dw_count + 1;
        if      (rst)                                reset_link_count <= 0;
        else if (cfis)                               reset_link_count <= 1;
        else if (fis_start && (fis_data_w == 8'h46)) reset_link_count <= 0;
        if      (reset_link_count)     link_count <= 0;
        else if (debug_link_send_data) link_count <= link_count + 1; // will only be valid later, latch at next fis start
        if (fis_start) link_count_latched <= link_count;
        if      (reset_link_count)     was_link_dmatp <= 0;
        else if (debug_link_dmatp)     was_link_dmatp <= 1;
        h2d_ready_d <= h2d_ready;
        if      (rst)                       h2d_nready_cntr <= 0;
        else if (!h2d_ready && h2d_ready_d) h2d_nready_cntr <= h2d_nready_cntr+1;
        if (fis_start) is_cfis_r <= is_cfis_w;
        if (fis_start && is_cfis_w) last_dma_cmd[23:16] <= h2d_data[23:16]; // command code
        set_dma_count <=  (fis_len == 3) && h2d_valid && h2d_ready && is_cfis_r;
        if (set_dma_count) last_dma_cmd[15:0] <= fis_data[15:0];
        set_non_dma_act <= fis_start && d2h_valid && (fis_data_w != 8'h39);
        if      (set_dma_count)   non_dma_act <= 32'h33333333;
        else if (set_non_dma_act) non_dma_act <= fis_data;
        if     (fis_start) fis_len <= d2h_valid? 0 : 1;
        else if (pre_we_w) fis_len <= fis_len + 1;
        if (fis_start || pre_we_w) fis_data <= d2h_valid ? d2h_data : h2d_data;
        if      (rst)  datascope_waddr <= 0;
        else if (we_r) datascope_waddr <= datascope_waddr + 1;
        irq_r <= irq;
        if      (rst)    irq_was <=0;
        else if (we_irq) irq_was <= irq_r;
    end
endmodule