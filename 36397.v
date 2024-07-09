module filesystem_encrypt_buffer_V_m_axi_read
#(parameter
    NUM_READ_OUTSTANDING      = 2,
    MAX_READ_BURST_LENGTH     = 16,
    C_M_AXI_ID_WIDTH          = 1,
    C_M_AXI_ADDR_WIDTH        = 32,
    C_TARGET_ADDR             = 32'h00000000,
    C_M_AXI_DATA_WIDTH        = 32,
    C_M_AXI_ARUSER_WIDTH      = 1,
    C_M_AXI_RUSER_WIDTH       = 1,
    C_USER_VALUE              = 1'b0,
    C_PROT_VALUE              = 3'b000,
    C_CACHE_VALUE             = 4'b0011,
    USER_DW                   = 16,
    USER_AW                   = 32,
    USER_MAXREQS              = 16
)(
    // system signal
    input  wire                         ACLK,
    input  wire                         ARESET,
    input  wire                         ACLK_EN,
    // read address channel
    output wire [C_M_AXI_ID_WIDTH-1:0]        ARID,
    output wire [C_M_AXI_ADDR_WIDTH-1:0]      ARADDR,
    output wire [7:0]                   ARLEN,
    output wire [2:0]                   ARSIZE,
    output wire [1:0]                   ARBURST,
    output wire [1:0]                   ARLOCK,
    output wire [3:0]                   ARCACHE,
    output wire [2:0]                   ARPROT,
    output wire [3:0]                   ARQOS,
    output wire [3:0]                   ARREGION,
    output wire [C_M_AXI_ARUSER_WIDTH-1:0]    ARUSER,
    output wire                         ARVALID,
    input  wire                         ARREADY,
    // read data channel
    input  wire [C_M_AXI_ID_WIDTH-1:0]        RID,
    input  wire [C_M_AXI_DATA_WIDTH-1:0]      RDATA,
    input  wire [1:0]                   RRESP,
    input  wire                         RLAST,
    input  wire [C_M_AXI_RUSER_WIDTH-1:0]     RUSER,
    input  wire                         RVALID,
    output wire                         RREADY,
    // read
    input  wire                         rreq_valid,
    output wire                         rreq_ack,
    input  wire [USER_AW-1:0]           rreq_addr,
    input  wire [31:0]                  rreq_length,
    input  wire [3:0]                   rreq_cache,
    input  wire [2:0]                   rreq_prot,
    input  wire [3:0]                   rreq_qos,
    input  wire [C_M_AXI_ARUSER_WIDTH-1:0]    rreq_user,
    output wire [USER_DW-1:0]           rdata_data,
    output wire [1:0]                   rrsp,
    output wire                         rdata_valid,
    input  wire                         rdata_ack
);
localparam
    USER_DATA_WIDTH = calc_data_width(USER_DW),
    USER_DATA_BYTES = USER_DATA_WIDTH / 8,
    USER_ADDR_ALIGN = log2(USER_DATA_BYTES),
    BUS_DATA_WIDTH  = C_M_AXI_DATA_WIDTH,
    BUS_DATA_BYTES  = BUS_DATA_WIDTH / 8,
    BUS_ADDR_ALIGN  = log2(BUS_DATA_BYTES),
    NUM_READ_WIDTH = log2(MAX_READ_BURST_LENGTH),
    TARGET_ADDR     = C_TARGET_ADDR & (32'hffffffff << USER_ADDR_ALIGN),
    BOUNDARY_BEATS  = {12-BUS_ADDR_ALIGN{1'b1}};
function integer calc_data_width;
    input integer x;
    integer y;
begin
    y = 8;
    while (y < x) y = y * 2;
    calc_data_width = y;
end
endfunction
function integer log2;
    input integer x;
    integer n, m;
begin
    n = 0;
    m = 1;
    while (m < x) begin
        n = n + 1;
        m = m * 2;
    end
    log2 = n;
end
endfunction
    // AR channel
    wire [USER_AW + 31:0]                   rreq_data;
    wire [USER_AW + 31:0]                   rs2f_rreq_data;
    wire                                      rs2f_rreq_valid;
    wire                                      rs2f_rreq_ack;
    wire [USER_AW + 31:0]                   fifo_rreq_data;
    wire [USER_AW - 1:0]                    tmp_addr;
    wire [31:0]                             tmp_len;
    reg  [31:0]                             align_len;
    wire [7:0]                              arlen_tmp;
    wire [C_M_AXI_ADDR_WIDTH - 1:0]               araddr_tmp;
    reg  [C_M_AXI_ADDR_WIDTH - 1:0]               start_addr;
    reg  [C_M_AXI_ADDR_WIDTH - 1:0]               start_addr_buf;
    wire [C_M_AXI_ADDR_WIDTH - 1:0]               end_addr;
    reg  [C_M_AXI_ADDR_WIDTH - 1:0]               end_addr_buf;
    wire [C_M_AXI_ADDR_WIDTH - 1:0]               sect_addr;
    reg  [C_M_AXI_ADDR_WIDTH - 1:0]               sect_addr_buf;
    wire [BUS_ADDR_ALIGN - 1:0]             sect_end;
    reg  [BUS_ADDR_ALIGN - 1:0]             sect_end_buf;
    wire [BUS_ADDR_ALIGN - 1:0]             burst_end;
    wire [11 - BUS_ADDR_ALIGN:0]            start_to_4k;
    wire [11 - BUS_ADDR_ALIGN:0]            sect_len;
    reg  [11 - BUS_ADDR_ALIGN:0]            sect_len_buf;
    reg  [11 - BUS_ADDR_ALIGN:0]            beat_len_buf;
    reg  [C_M_AXI_ADDR_WIDTH - 13:0]              sect_cnt;
    wire [1:0]                              ar2r_ardata;
    wire                                    fifo_rctl_r;
    wire                                    zero_len_event;
    wire                                    negative_len_event;
    reg                                     invalid_len_event;
    wire                                    fifo_rreq_valid;
    reg                                     fifo_rreq_valid_buf;
    wire                                    fifo_rreq_read;
    wire                                    fifo_burst_w;
    wire                                    fifo_resp_w;
    reg                                     ARVALID_Dummy;
    wire                                    ready_for_sect;
    wire                                    next_rreq;
    wire                                    ready_for_rreq;
    reg                                     rreq_handling;
    wire                                    first_sect;
    wire                                    last_sect;
    wire                                    next_sect;
    // R channel
    wire    [BUS_DATA_WIDTH + 2:0]          fifo_rresp_rdata;
    wire    [BUS_DATA_WIDTH + 2:0]          data_pack;
    wire    [BUS_DATA_WIDTH - 1:0]          tmp_data;
    wire    [USER_DW + 1:0]                 rs_rrsp_rdata;
    wire    [USER_DW + 1:0]                 rdata_data_pack;
    reg     [7:0]                           len_cnt;
    wire    [1:0]                           ar2r_rdata;
    wire    [1:0]                           tmp_resp;
    reg     [1:0]                           resp_buf;
    wire                                    tmp_last;
    wire                                    need_rlast;
    wire                                    fifo_rctl_ready;
    wire                                    beat_valid;
    wire                                    next_beat;
    wire                                    burst_valid;
    wire                                    fifo_burst_ready;
    wire                                    next_burst;
    wire                                    rdata_ack_t;
    reg                                     rdata_valid_t;
    filesystem_encrypt_buffer_V_m_axi_reg_slice #(
        .N(USER_AW + 32)
    ) rs_rreq (
        .sclk(ACLK),
        .reset(ARESET),
        .s_data(rreq_data),
        .s_valid(rreq_valid),
        .s_ready(rreq_ack),
        .m_data(rs2f_rreq_data),
        .m_valid(rs2f_rreq_valid),
        .m_ready(rs2f_rreq_ack));
    filesystem_encrypt_buffer_V_m_axi_fifo #(
        .DATA_BITS(USER_AW + 32),
        .DEPTH(USER_MAXREQS),
        .DEPTH_BITS(log2(USER_MAXREQS))
    ) fifo_rreq (
        .sclk(ACLK),
        .reset(ARESET),
        .sclk_en(ACLK_EN),
        .full_n(rs2f_rreq_ack),
        .wrreq(rs2f_rreq_valid),
        .data(rs2f_rreq_data),
        .empty_n(fifo_rreq_valid),
        .rdreq(fifo_rreq_read),
        .q(fifo_rreq_data));
    assign rreq_data   = {rreq_length, rreq_addr};
    assign tmp_addr    = fifo_rreq_data[USER_AW - 1:0];
    assign tmp_len     = fifo_rreq_data[USER_AW + 31:USER_AW];
    assign end_addr    = start_addr + align_len;
    assign zero_len_event = fifo_rreq_valid? (tmp_len == 32'b0) : 0;
    assign negative_len_event = fifo_rreq_valid? tmp_len[31] : 0;
    always @(posedge ACLK)
    begin
        if (ARESET)
            align_len   <= 0;
        else if (ACLK_EN) begin
            if(fifo_rreq_valid && ready_for_rreq)
                align_len   <= (tmp_len << USER_ADDR_ALIGN) - 1;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            start_addr <= 0;
        else if (ACLK_EN) begin
            if(fifo_rreq_valid && ready_for_rreq)
                start_addr <= TARGET_ADDR + (tmp_addr << USER_ADDR_ALIGN);
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            fifo_rreq_valid_buf <= 1'b0;
        else if (ACLK_EN) begin
            if((fifo_rreq_valid || fifo_rreq_valid_buf) && ready_for_rreq)
                fifo_rreq_valid_buf <= fifo_rreq_valid;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            invalid_len_event <= 1'b0;
        else if (ACLK_EN) begin
            if((fifo_rreq_valid || fifo_rreq_valid_buf) && ready_for_rreq)
                invalid_len_event <= zero_len_event || negative_len_event;
        end
    end
    assign next_rreq      = !invalid_len_event && (fifo_rreq_valid || fifo_rreq_valid_buf) && ready_for_rreq;
    assign ready_for_rreq = ~(rreq_handling && ~(last_sect && next_sect));
    assign fifo_rreq_read = invalid_len_event || next_rreq;
    always @(posedge ACLK)
    begin
        if (ARESET)
            rreq_handling <= 1'b0;
        else if (ACLK_EN) begin
            if (fifo_rreq_valid_buf && ~rreq_handling && ~invalid_len_event)
                rreq_handling <= 1'b1;
            else if ((~fifo_rreq_valid_buf || invalid_len_event) && last_sect && next_sect)
                rreq_handling <= 1'b0;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            start_addr_buf <= 0;
        else if (ACLK_EN) begin
            if (next_rreq)
                start_addr_buf <= start_addr;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            end_addr_buf <= 0;
        else if (ACLK_EN) begin
            if (next_rreq)
                end_addr_buf <= end_addr;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            beat_len_buf <= 0;
        else if (ACLK_EN) begin
            if (next_rreq)
                beat_len_buf <= (align_len[11:0] + start_addr[BUS_ADDR_ALIGN-1:0]) >> BUS_ADDR_ALIGN;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            sect_cnt <= 0;
        else if (ACLK_EN) begin
            if (next_rreq)
                sect_cnt <= start_addr[C_M_AXI_ADDR_WIDTH-1:12];
            else if (next_sect)
                sect_cnt <= sect_cnt + 1;
        end
    end
    assign first_sect = (sect_cnt == start_addr_buf[C_M_AXI_ADDR_WIDTH-1:12]);
    assign last_sect  = (sect_cnt == end_addr_buf[C_M_AXI_ADDR_WIDTH-1:12]);
    assign next_sect  = rreq_handling && ready_for_sect;
    assign sect_addr  = (first_sect)? start_addr_buf : {sect_cnt, {12{1'b0}}};
    always @(posedge ACLK)
    begin
        if (ARESET)
            sect_addr_buf <= 0;
        else if (ACLK_EN) begin
            if (next_sect)
                sect_addr_buf <= sect_addr;
        end
    end
    assign start_to_4k = BOUNDARY_BEATS - start_addr_buf[11:BUS_ADDR_ALIGN];
    assign sect_len    = ( first_sect &&  last_sect)? beat_len_buf :
                         ( first_sect && ~last_sect)? start_to_4k:
                         (~first_sect &&  last_sect)? end_addr_buf[11:BUS_ADDR_ALIGN] :
                                                      BOUNDARY_BEATS;
    always @(posedge ACLK)
    begin
        if (ARESET)
            sect_len_buf <= 0;
        else if (ACLK_EN) begin
            if (next_sect)
                sect_len_buf <= sect_len;
        end
    end
    assign sect_end = (last_sect)? end_addr_buf[BUS_ADDR_ALIGN - 1:0] : {BUS_ADDR_ALIGN{1'b1}};
    always @(posedge ACLK)
    begin
        if (ARESET)
            sect_end_buf <= 0;
        else if (ACLK_EN) begin
            if (next_sect)
                sect_end_buf <= sect_end;
        end
    end
    assign ARID    = 0;
    assign ARSIZE  = BUS_ADDR_ALIGN;
    assign ARBURST = 2'b01;
    assign ARLOCK  = 2'b00;
    assign ARCACHE = C_CACHE_VALUE;
    assign ARPROT  = C_PROT_VALUE;
    assign ARUSER  = C_USER_VALUE;
    assign ARQOS   = rreq_qos;
    generate
    if (BUS_DATA_BYTES >= 4096/MAX_READ_BURST_LENGTH) begin : must_one_burst
        assign ARADDR  = {sect_addr_buf[C_M_AXI_ADDR_WIDTH - 1:BUS_ADDR_ALIGN], {BUS_ADDR_ALIGN{1'b0}}};
        assign ARLEN   = sect_len_buf;
        assign ARVALID = ARVALID_Dummy;
        assign ready_for_sect = ~(ARVALID_Dummy && ~ARREADY) && fifo_burst_ready && fifo_rctl_ready;
        always @(posedge ACLK)
        begin
            if (ARESET)
                ARVALID_Dummy <= 1'b0;
            else if (ACLK_EN) begin
                if (next_sect)
                    ARVALID_Dummy <= 1'b1;
                else if (~next_sect && ARREADY)
                    ARVALID_Dummy <= 1'b0;
            end
        end
        assign fifo_rctl_r  = next_sect;
        assign ar2r_ardata  = {last_sect, 1'b0};
        assign fifo_burst_w = next_sect;
        assign araddr_tmp   = sect_addr[C_M_AXI_ADDR_WIDTH - 1:0];
        assign arlen_tmp    = sect_len;
        assign burst_end    = sect_end;
    end
    else begin : could_multi_bursts
        reg  [C_M_AXI_ADDR_WIDTH - 1:0]                 araddr_buf;
        reg  [7:0]                                      arlen_buf;
        reg  [11 - NUM_READ_WIDTH - BUS_ADDR_ALIGN:0]   loop_cnt;
        reg                                             sect_handling;
        wire                                            last_loop;
        wire                                            next_loop;
        wire                                            ready_for_loop;
        assign ARADDR  = araddr_buf;
        assign ARLEN   = arlen_buf;
        assign ARVALID = ARVALID_Dummy;
        assign last_loop      = (loop_cnt == sect_len_buf[11 - BUS_ADDR_ALIGN : NUM_READ_WIDTH]);
        assign next_loop      = sect_handling && ready_for_loop;
        assign ready_for_loop = ~(ARVALID_Dummy && ~ARREADY) && fifo_burst_ready && fifo_rctl_ready;
        assign ready_for_sect = ~(sect_handling && ~(last_loop && next_loop));
        always @(posedge ACLK)
        begin
            if (ARESET)
                sect_handling <= 1'b0;
            else if (ACLK_EN) begin
                if (rreq_handling && ~sect_handling)
                    sect_handling <= 1'b1;
                else if (~rreq_handling && last_loop && next_loop)
                    sect_handling <= 1'b0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                loop_cnt <= 0;
            else if (ACLK_EN) begin
                if (next_sect)
                    loop_cnt <= 0;
                else if (next_loop)
                    loop_cnt <= loop_cnt + 1;
            end
        end
        assign araddr_tmp = (loop_cnt == 0)? sect_addr_buf[C_M_AXI_ADDR_WIDTH - 1:0] : (araddr_buf + ((arlen_buf + 1) << BUS_ADDR_ALIGN));
        always @(posedge ACLK)
        begin
            if (ARESET)
                araddr_buf <= 0;
            else if (ACLK_EN) begin
                if (next_loop)
                    araddr_buf <= {araddr_tmp[C_M_AXI_ADDR_WIDTH - 1:BUS_ADDR_ALIGN], {BUS_ADDR_ALIGN{1'b0}}};
            end
        end
        assign arlen_tmp  = (last_loop)? sect_len_buf[NUM_READ_WIDTH - 1:0] : { NUM_READ_WIDTH{1'b1} };
        always @(posedge ACLK)
        begin
            if (ARESET)
                arlen_buf <= 0;
            else if (ACLK_EN) begin
                if (next_loop)
                    arlen_buf <= arlen_tmp;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                ARVALID_Dummy <= 1'b0;
            else if (ACLK_EN) begin
                if (next_loop)
                    ARVALID_Dummy <= 1'b1;
                else if (~next_loop && ARREADY)
                    ARVALID_Dummy <= 1'b0;
            end
        end
        assign fifo_rctl_r = next_loop;
        assign ar2r_ardata = {last_loop, 1'b0};
        assign fifo_burst_w = next_loop;
        assign burst_end    = (last_loop)? sect_end_buf[BUS_ADDR_ALIGN - 1:0] : {BUS_ADDR_ALIGN{1'b1}};
    end
    endgenerate
    filesystem_encrypt_buffer_V_m_axi_buffer #(
        .DATA_WIDTH(BUS_DATA_WIDTH + 3),
        .DEPTH(NUM_READ_OUTSTANDING * MAX_READ_BURST_LENGTH),
        .ADDR_WIDTH(log2(NUM_READ_OUTSTANDING * MAX_READ_BURST_LENGTH))
    ) buff_rdata (
        .clk(ACLK),
        .reset(ARESET),
        .sclk_en(ACLK_EN),
        .if_full_n(RREADY),
        .if_write_ce(1'b1),
        .if_write(RVALID),
        .if_din(fifo_rresp_rdata),
        .if_empty_n(beat_valid),
        .if_read_ce(1'b1),
        .if_read(next_beat),
        .if_dout(data_pack));
    filesystem_encrypt_buffer_V_m_axi_reg_slice #(
        .N(USER_DW + 2)
    ) rs_rdata (
        .sclk(ACLK),
        .reset(ARESET),
        .s_data(rs_rrsp_rdata),
        .s_valid(rdata_valid_t),
        .s_ready(rdata_ack_t),
        .m_data(rdata_data_pack),
        .m_valid(rdata_valid),
        .m_ready(rdata_ack));
    filesystem_encrypt_buffer_V_m_axi_fifo #(
        .DATA_BITS(2),
        .DEPTH(NUM_READ_OUTSTANDING-1),
        .DEPTH_BITS(log2(NUM_READ_OUTSTANDING-1))
    ) fifo_rctl (
        .sclk(ACLK),
        .reset(ARESET),
        .sclk_en(ACLK_EN),
        .empty_n(need_rlast),
        .full_n(fifo_rctl_ready),
        .rdreq(tmp_last),
        .wrreq(fifo_rctl_r),
        .q(ar2r_rdata),
        .data(ar2r_ardata));
    assign fifo_rresp_rdata = {RLAST, RRESP, RDATA};
    assign tmp_data         = data_pack[BUS_DATA_WIDTH - 1:0];
    assign tmp_resp         = data_pack[BUS_DATA_WIDTH + 1:BUS_DATA_WIDTH];
    assign tmp_last         = data_pack[BUS_DATA_WIDTH + 2] && beat_valid;
    generate
    if (USER_DATA_WIDTH == BUS_DATA_WIDTH) begin : bus_equal_gen
        reg  [BUS_DATA_WIDTH - 1:0]         data_buf;
        wire                                ready_for_data;
        assign rs_rrsp_rdata = {resp_buf, data_buf[USER_DW - 1:0]};
        assign rrsp          = rdata_data_pack[USER_DW + 1:USER_DW];
        assign rdata_data    = rdata_data_pack[USER_DW - 1:0];
        assign fifo_burst_ready = 1'b1;
        assign next_beat        = beat_valid && ready_for_data;
        assign ready_for_data   = ~(rdata_valid_t && ~rdata_ack_t);
        always @(posedge ACLK)
        begin
            if (ACLK_EN) begin
                if (next_beat)
                    data_buf <= tmp_data;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                resp_buf <= 2'b00;
            else if (ACLK_EN) begin
                if (next_beat)
                    resp_buf <= tmp_resp;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                rdata_valid_t <= 1'b0;
            else if (ACLK_EN) begin
                if (next_beat)
                    rdata_valid_t <= 1'b1;
                else if (ready_for_data)
                    rdata_valid_t <= 1'b0;
            end
        end
    end
    else if (USER_DATA_WIDTH < BUS_DATA_WIDTH) begin : bus_wide_gen
        localparam
        TOTAL_SPLIT     = BUS_DATA_WIDTH / USER_DATA_WIDTH,
            SPLIT_ALIGN     = log2(TOTAL_SPLIT);
        wire [2*SPLIT_ALIGN + 7:0]      tmp_burst_info;
        wire [2*SPLIT_ALIGN + 7:0]      burst_pack;
        reg  [BUS_DATA_WIDTH - 1:0]     data_buf;
        wire [SPLIT_ALIGN - 1:0]        split_cnt;
        reg  [SPLIT_ALIGN - 1:0]        split_cnt_buf;
        wire [SPLIT_ALIGN - 1:0]        head_split;
        wire [SPLIT_ALIGN - 1:0]        tail_split;
        wire [7:0]                      arlen_tmp_t;
        wire [7:0]                      burst_len;
        wire                            first_beat;
        wire                            last_beat;
        wire                            first_split;
        wire                            next_split;
        wire                            last_split;
        wire                            ready_for_data;
        filesystem_encrypt_buffer_V_m_axi_fifo #(
            .DATA_BITS(2*SPLIT_ALIGN + 8),
            .DEPTH(USER_MAXREQS),
            .DEPTH_BITS(log2(USER_MAXREQS))
        ) fifo_burst (
            .sclk(ACLK),
            .reset(ARESET),
            .sclk_en(ACLK_EN),
            .empty_n(burst_valid),
            .full_n(fifo_burst_ready),
            .rdreq(next_burst),
            .wrreq(fifo_burst_w),
            .q(burst_pack),
            .data(tmp_burst_info));
        assign rs_rrsp_rdata = {resp_buf, data_buf[USER_DW - 1:0]};
        assign rrsp          = rdata_data_pack[USER_DW + 1:USER_DW];
        assign rdata_data    = rdata_data_pack[USER_DW - 1:0];
        assign arlen_tmp_t    = arlen_tmp;
        assign tmp_burst_info = {araddr_tmp[BUS_ADDR_ALIGN - 1:USER_ADDR_ALIGN], burst_end[BUS_ADDR_ALIGN - 1:USER_ADDR_ALIGN], arlen_tmp_t};
        assign head_split     = burst_pack[2*SPLIT_ALIGN + 7:8 + SPLIT_ALIGN];
        assign tail_split     = burst_pack[SPLIT_ALIGN + 7:8];
        assign burst_len      = burst_pack[7:0];
        assign next_beat        = last_split;
        assign next_burst       = last_beat && last_split;
        assign ready_for_data   = ~(rdata_valid_t && ~rdata_ack_t);
        assign first_beat = (len_cnt == 0) && burst_valid && beat_valid;
        assign last_beat  = (len_cnt == burst_len) && burst_valid && beat_valid;
        assign first_split = (~first_beat)? (split_cnt == 0 && beat_valid && ready_for_data) : ((split_cnt == head_split) && ready_for_data);
        assign last_split  = (~last_beat)? (split_cnt == (TOTAL_SPLIT - 1) && ready_for_data) : ((split_cnt == tail_split) && ready_for_data);
        assign next_split  = (~first_beat)? ((split_cnt != 0) && ready_for_data) : ((split_cnt != head_split) && ready_for_data);
        assign split_cnt = (first_beat && (split_cnt_buf == 0))? head_split : split_cnt_buf;
        always @(posedge ACLK)
        begin
            if (ARESET)
                split_cnt_buf <= 0;
            else if (ACLK_EN) begin
                if (last_split)
                    split_cnt_buf <= 0;
                else if (first_split || next_split)
                    split_cnt_buf <= split_cnt + 1;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                len_cnt <= 0;
            else if (ACLK_EN) begin
                if (last_beat && last_split)
                    len_cnt <= 0;
                else if (last_split)
                    len_cnt <= len_cnt + 1;
            end
        end
        always @(posedge ACLK)
        begin
            if (ACLK_EN) begin
                if (first_split && first_beat)
                    data_buf <= tmp_data >> (head_split * USER_DATA_WIDTH);
                else if (first_split)
                    data_buf <= tmp_data;
                else if (next_split)
                    data_buf <= data_buf >> USER_DATA_WIDTH;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                resp_buf <= 2'b00;
            else if (ACLK_EN) begin
                if (first_split)
                    resp_buf <= tmp_resp;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                rdata_valid_t <= 0;
            else if (ACLK_EN) begin
                if (first_split)
                    rdata_valid_t <= 1;
                else if (~(first_split || next_split) && ready_for_data)
                    rdata_valid_t <= 0;
            end
        end
    end
    else begin: bus_narrow_gen
        localparam
            TOTAL_PADS      = USER_DATA_WIDTH / BUS_DATA_WIDTH,
            PAD_ALIGN       = log2(TOTAL_PADS);
        reg  [USER_DATA_WIDTH - 1:0]        data_buf;
        wire [TOTAL_PADS - 1:0]             pad_oh;
        reg  [TOTAL_PADS - 1:0]             pad_oh_reg;
        wire                                ready_for_data;
        wire                                next_pad;
        reg                                 first_pad;
        wire                                last_pad;
        wire                                next_data;
        assign rs_rrsp_rdata = {resp_buf, data_buf[USER_DW - 1:0]};
        assign rrsp          = rdata_data_pack[USER_DW + 1:USER_DW];
        assign rdata_data    = rdata_data_pack[USER_DW - 1:0];
        assign fifo_burst_ready = 1'b1;
        assign next_beat        = next_pad;
        assign ready_for_data   = ~(rdata_valid_t && ~rdata_ack_t);
        assign next_pad  = beat_valid && ready_for_data;
        assign last_pad  = pad_oh[TOTAL_PADS - 1];
        assign next_data = last_pad && ready_for_data;
        always @(posedge ACLK)
        begin
            if (ARESET)
                first_pad <= 1;
            else if (ACLK_EN) begin
                if (next_pad && ~last_pad)
                    first_pad <= 0;
                else if (next_pad && last_pad)
                    first_pad <= 1;
            end
        end
        assign pad_oh = (beat_valid == 0)?  0 :
                        (first_pad)?        1 :
                                            pad_oh_reg;
        always @(posedge ACLK)
        begin
            if (ARESET)
                pad_oh_reg <= 0;
            else if (ACLK_EN) begin
                if (next_pad)
                    pad_oh_reg <= {pad_oh[TOTAL_PADS - 2:0], 1'b0};
            end
        end
        genvar  i;
        for (i = 1; i <= TOTAL_PADS; i = i + 1) begin : data_gen
            always @(posedge ACLK)
            begin
                if (ACLK_EN) begin
                    if (pad_oh[i-1] == 1'b1 && ready_for_data)
                        data_buf[i*BUS_DATA_WIDTH - 1:(i-1)*BUS_DATA_WIDTH] <= tmp_data;
                end
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                resp_buf <= 2'b00;
            else if (ACLK_EN) begin
                if (next_beat && (resp_buf[0] ==1'b0))
                    resp_buf <= tmp_resp;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                rdata_valid_t <= 0;
            else if (ACLK_EN) begin
                if (next_data)
                    rdata_valid_t <= 1;
                else if (ready_for_data)
                    rdata_valid_t <= 0;
            end
        end
    end
    endgenerate
endmodule