module filesystem_encrypt_buffer_V_m_axi_write
#(parameter
    NUM_WRITE_OUTSTANDING     = 2,
    MAX_WRITE_BURST_LENGTH    = 16,
    C_M_AXI_ID_WIDTH          = 1,
    C_M_AXI_ADDR_WIDTH        = 32,
    C_TARGET_ADDR             = 32'h00000000,
    C_M_AXI_DATA_WIDTH        = 32,
    C_M_AXI_AWUSER_WIDTH      = 1,
    C_M_AXI_WUSER_WIDTH       = 1,
    C_M_AXI_BUSER_WIDTH       = 1,
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
    // write address channel
    output wire [C_M_AXI_ID_WIDTH-1:0]        AWID,
    output wire [C_M_AXI_ADDR_WIDTH-1:0]      AWADDR,
    output wire [7:0]                   AWLEN,
    output wire [2:0]                   AWSIZE,
    output wire [1:0]                   AWBURST,
    output wire [1:0]                   AWLOCK,
    output wire [3:0]                   AWCACHE,
    output wire [2:0]                   AWPROT,
    output wire [3:0]                   AWQOS,
    output wire [3:0]                   AWREGION,
    output wire [C_M_AXI_AWUSER_WIDTH-1:0]    AWUSER,
    output wire                         AWVALID,
    input  wire                         AWREADY,
    // write data channel
    output wire [C_M_AXI_ID_WIDTH-1:0]        WID,
    output wire [C_M_AXI_DATA_WIDTH-1:0]      WDATA,
    output wire [C_M_AXI_DATA_WIDTH/8-1:0]    WSTRB,
    output wire                         WLAST,
    output wire [C_M_AXI_WUSER_WIDTH-1:0]     WUSER,
    output wire                         WVALID,
    input  wire                         WREADY,
    // write response channel
    input  wire [C_M_AXI_ID_WIDTH-1:0]        BID,
    input  wire [1:0]                   BRESP,
    input  wire [C_M_AXI_BUSER_WIDTH-1:0]     BUSER,
    input  wire                         BVALID,
    output wire                         BREADY,
    // write request
    input  wire                         wreq_valid,
    output wire                         wreq_ack,
    input  wire [USER_AW-1:0]           wreq_addr,
    input  wire [31:0]                  wreq_length,
    input  wire [3:0]                   wreq_cache,
    input  wire [2:0]                   wreq_prot,
    input  wire [3:0]                   wreq_qos,
    input  wire [C_M_AXI_AWUSER_WIDTH-1:0]    wreq_user,
    input  wire                         wdata_valid,
    output wire                         wdata_ack,
    input  wire [USER_DW/8-1:0]         wdata_strb,
    input  wire [C_M_AXI_WUSER_WIDTH-1:0]     wdata_user,
    input  wire [USER_DW-1:0]           wdata_data,
    output wire                         wrsp_valid,
    input  wire                         wrsp_ack,
    output wire [1:0]                   wrsp
);
localparam
    USER_DATA_WIDTH = calc_data_width(USER_DW),
    USER_DATA_BYTES = USER_DATA_WIDTH / 8,
    USER_ADDR_ALIGN = log2(USER_DATA_BYTES),
    BUS_DATA_WIDTH  = C_M_AXI_DATA_WIDTH,
    BUS_DATA_BYTES  = BUS_DATA_WIDTH / 8,
    BUS_ADDR_ALIGN  = log2(BUS_DATA_BYTES),
    NUM_WRITE_WIDTH = log2(MAX_WRITE_BURST_LENGTH),
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
    // AW channel
    wire [USER_AW + 31:0]                   wreq_data;
    wire [USER_AW + 31:0]                   rs2f_wreq_data;
    wire                                      rs2f_wreq_valid;
    wire                                      rs2f_wreq_ack;
    wire [USER_AW + 31:0]                   fifo_wreq_data;
    wire [USER_AW - 1:0]                    tmp_addr;
    wire [31:0]                             tmp_len;
    reg  [31:0]                             align_len;
    wire [7:0]                              awlen_tmp;
    wire [C_M_AXI_ADDR_WIDTH - 1:0]         awaddr_tmp;
    reg  [C_M_AXI_ADDR_WIDTH - 1:0]         start_addr;
    reg  [C_M_AXI_ADDR_WIDTH - 1:0]         start_addr_buf;
    wire [C_M_AXI_ADDR_WIDTH - 1:0]         end_addr;
    reg  [C_M_AXI_ADDR_WIDTH - 1:0]         end_addr_buf;
    wire [C_M_AXI_ADDR_WIDTH - 1:0]         sect_addr;
    reg  [C_M_AXI_ADDR_WIDTH - 1:0]         sect_addr_buf;
    wire [BUS_ADDR_ALIGN - 1:0]             sect_end;
    reg  [BUS_ADDR_ALIGN - 1:0]             sect_end_buf;
    wire [BUS_ADDR_ALIGN - 1:0]             burst_end;
    wire [11 - BUS_ADDR_ALIGN:0]            start_to_4k;
    wire [11 - BUS_ADDR_ALIGN:0]            sect_len;
    reg  [11 - BUS_ADDR_ALIGN:0]            sect_len_buf;
    reg  [11 - BUS_ADDR_ALIGN:0]            beat_len_buf;
    wire [1:0]                              aw2b_awdata;
    reg  [C_M_AXI_ADDR_WIDTH - 13:0]        sect_cnt;
    wire                                    zero_len_event;
    wire                                    negative_len_event;
    reg                                     invalid_len_event;
    reg                                     invalid_len_event_reg1;
    reg                                     invalid_len_event_reg2;
    wire                                    fifo_wreq_valid;
    reg                                     fifo_wreq_valid_buf;
    wire                                    fifo_wreq_read;
    wire                                    fifo_burst_w;
    wire                                    fifo_resp_w;
    reg                                     AWVALID_Dummy;
    reg                                     last_sect_buf;
    wire                                    ready_for_sect;
    wire                                    next_wreq;
    wire                                    ready_for_wreq;
    reg                                     wreq_handling;
    wire                                    first_sect;
    wire                                    last_sect;
    wire                                    next_sect;
    // W channel
    wire    [USER_DW + USER_DW/8 - 1:0]     fifo_wdata_wstrb;
    wire    [USER_DW + USER_DW/8 - 1:0]     data_pack;
    wire    [USER_DATA_WIDTH - 1:0]         tmp_data;
    wire    [USER_DATA_BYTES - 1:0]         tmp_strb;
    reg     [7:0]                           len_cnt;
    wire    [7:0]                           burst_len;
    wire                                    beat_valid;
    wire                                    next_data;
    wire                                    burst_valid;
    wire                                    fifo_burst_ready;
    wire                                    next_burst;
    reg                                     WVALID_Dummy;
    reg                                     WLAST_Dummy;
    //B channel
    wire    [1:0]                           aw2b_bdata;
    reg     [1:0]                           bresp_tmp;
    reg                                     next_resp;
    wire                                    last_resp;
    wire                                    invalid_event;
    wire                                    fifo_resp_ready;
    wire                                    need_wrsp;
    wire                                    resp_match;
    wire                                    resp_ready;
    filesystem_encrypt_buffer_V_m_axi_reg_slice #(
        .N(USER_AW + 32)
    ) rs_wreq (
        .sclk(ACLK),
        .reset(ARESET),
        .s_data(wreq_data),
        .s_valid(wreq_valid),
        .s_ready(wreq_ack),
        .m_data(rs2f_wreq_data),
        .m_valid(rs2f_wreq_valid),
        .m_ready(rs2f_wreq_ack));
    filesystem_encrypt_buffer_V_m_axi_fifo #(
        .DATA_BITS(USER_AW + 32),
        .DEPTH(USER_MAXREQS),
        .DEPTH_BITS(log2(USER_MAXREQS))
    ) fifo_wreq (
        .sclk(ACLK),
        .reset(ARESET),
        .sclk_en(ACLK_EN),
        .full_n(rs2f_wreq_ack),
        .wrreq(rs2f_wreq_valid),
        .data(rs2f_wreq_data),
        .empty_n(fifo_wreq_valid),
        .rdreq(fifo_wreq_read),
        .q(fifo_wreq_data));
    assign wreq_data   = {wreq_length, wreq_addr};
    assign tmp_addr    = fifo_wreq_data[USER_AW - 1:0];
    assign tmp_len     = fifo_wreq_data[USER_AW + 31:USER_AW];
    assign zero_len_event = fifo_wreq_valid? (tmp_len == 32'b0) : 0;
    assign negative_len_event = fifo_wreq_valid? tmp_len[31] : 0;
    assign end_addr    = start_addr + align_len;
    always @(posedge ACLK)
    begin
        if (ARESET)
            align_len   <= 0;
        else if (ACLK_EN) begin
            if(fifo_wreq_valid && ready_for_wreq) begin
                if (zero_len_event || negative_len_event)
                    align_len   <= 32'b0;
                else
                    align_len   <= (tmp_len << USER_ADDR_ALIGN) - 1;
            end
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            start_addr <= 0;
        else if (ACLK_EN) begin
            if(fifo_wreq_valid && ready_for_wreq)
                start_addr <= TARGET_ADDR + (tmp_addr << USER_ADDR_ALIGN);
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            fifo_wreq_valid_buf <= 1'b0;
        else if (ACLK_EN) begin
            if(next_wreq)
                fifo_wreq_valid_buf <= fifo_wreq_valid;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            invalid_len_event <= 1'b0;
        else if (ACLK_EN) begin
            if(next_wreq)
                invalid_len_event <= zero_len_event || negative_len_event;
        end
    end
    assign next_wreq      = (fifo_wreq_valid || fifo_wreq_valid_buf) && ready_for_wreq;
    assign ready_for_wreq = ~(wreq_handling && ~(last_sect && next_sect));
    assign fifo_wreq_read = next_wreq;
    always @(posedge ACLK)
    begin
        if (ARESET)
            wreq_handling <= 1'b0;
        else if (ACLK_EN) begin
            if (fifo_wreq_valid_buf && ~wreq_handling)
                wreq_handling <= 1'b1;
            else if (~fifo_wreq_valid_buf && last_sect && next_sect)
                wreq_handling <= 1'b0;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            start_addr_buf <= 0;
        else if (ACLK_EN) begin
            if (next_wreq)
                start_addr_buf <= start_addr;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            end_addr_buf <= 0;
        else if (ACLK_EN) begin
            if (next_wreq)
                end_addr_buf <= end_addr;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            beat_len_buf <= 0;
        else if (ACLK_EN) begin
            if (next_wreq)
                beat_len_buf <= (align_len[11:0] + start_addr[BUS_ADDR_ALIGN-1:0]) >> BUS_ADDR_ALIGN;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            sect_cnt <= 0;
        else if (ACLK_EN) begin
            if (next_wreq)
                sect_cnt <= start_addr[C_M_AXI_ADDR_WIDTH-1:12];
            else if (next_sect)
                sect_cnt <= sect_cnt + 1;
        end
    end
    // event registers
    always @(posedge ACLK)
    begin
        if (ARESET)
            invalid_len_event_reg1 <= 0;
        else if (ACLK_EN) begin
            invalid_len_event_reg1 <= invalid_len_event;
        end
    end
    // end event registers
    assign first_sect = (sect_cnt == start_addr_buf[C_M_AXI_ADDR_WIDTH-1:12]);
    assign last_sect  = (sect_cnt == end_addr_buf[C_M_AXI_ADDR_WIDTH-1:12]);
    assign next_sect  = wreq_handling && ready_for_sect;
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
    // event registers
    always @(posedge ACLK)
    begin
        if (ARESET)
            invalid_len_event_reg2 <= 0;
        else if (ACLK_EN) begin
            invalid_len_event_reg2 <= invalid_len_event_reg1;
        end
    end
    // end event registers
    assign AWID    = 0;
    assign AWSIZE  = BUS_ADDR_ALIGN;
    assign AWBURST = 2'b01;
    assign AWLOCK  = 2'b00;
    assign AWCACHE = C_CACHE_VALUE;
    assign AWPROT  = C_PROT_VALUE;
    assign AWUSER  = C_USER_VALUE;
    assign AWQOS   = wreq_qos;
    generate
    if (BUS_DATA_BYTES >= 4096/MAX_WRITE_BURST_LENGTH) begin : must_one_burst
        assign AWADDR  = {sect_addr_buf[C_M_AXI_ADDR_WIDTH - 1:BUS_ADDR_ALIGN], {BUS_ADDR_ALIGN{1'b0}}};
        assign AWLEN   = sect_len_buf;
        assign AWVALID = AWVALID_Dummy;
        assign ready_for_sect = ~(AWVALID_Dummy && ~AWREADY) && fifo_burst_ready && fifo_resp_ready;
        always @(posedge ACLK)
        begin
            if (ARESET)
                AWVALID_Dummy <= 1'b0;
            else if (ACLK_EN) begin
                if (invalid_len_event)
                    AWVALID_Dummy <= 1'b0;
                else if (next_sect)
                    AWVALID_Dummy <= 1'b1;
                else if (~next_sect && AWREADY)
                    AWVALID_Dummy <= 1'b0;
            end
        end
        assign fifo_resp_w = next_sect;
        assign aw2b_awdata = {last_sect, invalid_len_event};
        assign fifo_burst_w = ~invalid_len_event & next_sect;
        assign awaddr_tmp   = sect_addr[C_M_AXI_ADDR_WIDTH - 1:0];
        assign awlen_tmp    = sect_len;
        assign burst_end    = sect_end;
    end
    else begin : could_multi_bursts
        reg  [C_M_AXI_ADDR_WIDTH - 1:0]                     awaddr_buf;
        reg  [7:0]                                          awlen_buf;
        reg  [11 - NUM_WRITE_WIDTH - BUS_ADDR_ALIGN : 0]    loop_cnt;
        reg                                                 sect_handling;
        wire                                                last_loop;
        wire                                                next_loop;
        wire                                                ready_for_loop;
        assign AWADDR  = awaddr_buf;
        assign AWLEN   = awlen_buf;
        assign AWVALID = AWVALID_Dummy;
        assign last_loop      = (loop_cnt == sect_len_buf[11 - BUS_ADDR_ALIGN : NUM_WRITE_WIDTH]);
        assign next_loop      = sect_handling && ready_for_loop;
        assign ready_for_loop = ~(AWVALID_Dummy && ~AWREADY) && fifo_resp_ready && fifo_burst_ready;
        assign ready_for_sect = ~(sect_handling && ~(last_loop && next_loop));
        always @(posedge ACLK)
        begin
            if (ARESET)
                sect_handling <= 1'b0;
            else if (ACLK_EN) begin
                if (wreq_handling && ~sect_handling)
                    sect_handling <= 1'b1;
                else if (~wreq_handling && last_loop && next_loop)
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
        assign awaddr_tmp = (loop_cnt == 0)? sect_addr_buf[C_M_AXI_ADDR_WIDTH - 1:0] : (awaddr_buf + ((awlen_buf + 1) << BUS_ADDR_ALIGN));
        always @(posedge ACLK)
        begin
            if (ARESET)
                awaddr_buf <= 0;
            else if (ACLK_EN) begin
                if (next_loop)
                    awaddr_buf <= {awaddr_tmp[C_M_AXI_ADDR_WIDTH - 1:BUS_ADDR_ALIGN], {BUS_ADDR_ALIGN{1'b0}}};
            end
        end
        assign awlen_tmp  = (last_loop)? sect_len_buf[NUM_WRITE_WIDTH - 1:0] : { NUM_WRITE_WIDTH{1'b1} };
        always @(posedge ACLK)
        begin
            if (ARESET)
                awlen_buf <= 0;
            else if (ACLK_EN) begin
                if (next_loop)
                    awlen_buf <= awlen_tmp;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                AWVALID_Dummy <= 1'b0;
            else if (ACLK_EN) begin
                if (invalid_len_event_reg2)
                    AWVALID_Dummy <= 1'b0;
                else if (next_loop)
                    AWVALID_Dummy <= 1'b1;
                else if (~next_loop && AWREADY)
                    AWVALID_Dummy <= 1'b0;
            end
        end
        assign fifo_resp_w = next_loop;
        assign aw2b_awdata = {(last_loop & last_sect_buf), invalid_len_event_reg2};
        always @(posedge ACLK)
        begin
            if (ARESET)
                last_sect_buf <= 0;
            else if (ACLK_EN) begin
                if (next_sect && last_sect)
                    last_sect_buf <= 1;
                else if (next_sect)
                    last_sect_buf <= 0;
            end
        end
        assign fifo_burst_w = ~invalid_len_event_reg2 & next_loop;
        assign burst_end    = (last_loop)? sect_end_buf[BUS_ADDR_ALIGN - 1:0] : {BUS_ADDR_ALIGN{1'b1}};
    end
    endgenerate
    filesystem_encrypt_buffer_V_m_axi_buffer #(
        .DATA_WIDTH(USER_DW + USER_DW/8),
        .DEPTH(NUM_WRITE_OUTSTANDING * MAX_WRITE_BURST_LENGTH),
        .ADDR_WIDTH(log2(NUM_WRITE_OUTSTANDING * MAX_WRITE_BURST_LENGTH))
    ) buff_wdata (
        .clk(ACLK),
        .reset(ARESET),
        .sclk_en(ACLK_EN),
        .if_full_n(wdata_ack),
        .if_write_ce(1'b1),
        .if_write(wdata_valid),
        .if_din(fifo_wdata_wstrb),
        .if_empty_n(data_valid),
        .if_read_ce(1'b1),
        .if_read(next_data),
        .if_dout(data_pack)
    );
    assign fifo_wdata_wstrb = {wdata_strb, wdata_data};
    assign tmp_data         = data_pack[USER_DW - 1:0];
    assign tmp_strb         = data_pack[USER_DW + USER_DW/8 - 1:USER_DW];
    generate
    if (USER_DATA_WIDTH == BUS_DATA_WIDTH) begin : bus_equal_gen
        reg  [BUS_DATA_WIDTH - 1:0]         data_buf;
        reg  [BUS_DATA_BYTES - 1:0]         strb_buf;
        wire [7:0]                          tmp_burst_info;
        wire                                ready_for_data;
        filesystem_encrypt_buffer_V_m_axi_fifo #(
            .DATA_BITS(8),
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
            .q(burst_len),
            .data(tmp_burst_info));
        assign WDATA   = data_buf;
        assign WSTRB   = strb_buf;
        assign WLAST   = WLAST_Dummy;
        assign WVALID  = WVALID_Dummy;
        assign tmp_burst_info = awlen_tmp;
        assign next_data        = burst_valid && data_valid && ready_for_data;
        assign next_burst       = (len_cnt == burst_len) && next_data;
        assign ready_for_data   = ~(WVALID_Dummy && ~WREADY);
        always @(posedge ACLK)
        begin
            if (ACLK_EN) begin
                if (next_data)
                    data_buf <= tmp_data;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                strb_buf <= 0;
            else if (ACLK_EN) begin
                if (next_data)
                    strb_buf <= tmp_strb;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                WVALID_Dummy <= 1'b0;
            else if (ACLK_EN) begin
                if (next_data)
                    WVALID_Dummy <= 1'b1;
                else if (ready_for_data)
                    WVALID_Dummy <= 1'b0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                WLAST_Dummy <= 0;
            else if (ACLK_EN) begin
                if (next_burst)
                    WLAST_Dummy <= 1;
                else if (ready_for_data)
                    WLAST_Dummy <= 0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                len_cnt <= 0;
            else if (ACLK_EN) begin
                if (next_burst)
                    len_cnt <= 0;
                else if (next_data)
                    len_cnt <= len_cnt + 1;
            end
        end
    end
    else if (USER_DATA_WIDTH > BUS_DATA_WIDTH) begin : bus_narrow_gen
        localparam
            TOTAL_SPLIT     = USER_DATA_WIDTH / BUS_DATA_WIDTH,
            SPLIT_ALIGN     = log2(TOTAL_SPLIT);
        reg  [USER_DATA_WIDTH - 1:0]                data_buf;
        reg  [USER_DATA_BYTES - 1:0]                strb_buf;
        reg  [SPLIT_ALIGN - 1:0]                    split_cnt;
        wire [7:0]                                  tmp_burst_info;
        wire                                        first_split;
        wire                                        next_split;
        wire                                        last_split;
        wire                                        ready_for_data;
        filesystem_encrypt_buffer_V_m_axi_fifo #(
            .DATA_BITS(8),
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
            .q(burst_len),
            .data(tmp_burst_info));
        assign WDATA   = data_buf[BUS_DATA_WIDTH - 1:0];
        assign WSTRB   = strb_buf[BUS_DATA_BYTES - 1:0];
        assign WLAST   = WLAST_Dummy;
        assign WVALID  = WVALID_Dummy;
        assign tmp_burst_info = awlen_tmp;
        assign next_data        = first_split;
        assign next_burst       = (len_cnt == burst_len) && burst_valid && last_split;
        assign ready_for_data   = ~(WVALID_Dummy && ~WREADY);
        assign first_split = (split_cnt == 0) && data_valid && burst_valid && ready_for_data;
        assign last_split  = (split_cnt == (TOTAL_SPLIT - 1)) && ready_for_data;
        assign next_split  = (split_cnt != 0) && ready_for_data;
        always @(posedge ACLK)
        begin
            if (ARESET)
                split_cnt <= 0;
            else if (ACLK_EN) begin
                if (last_split)
                    split_cnt <= 0;
                else if (first_split || next_split)
                    split_cnt <= split_cnt + 1;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                len_cnt <= 0;
            else if (ACLK_EN) begin
                if (next_burst)
                    len_cnt <= 0;
                else if (next_data || next_split)
                    len_cnt <= len_cnt + 1;
            end
        end
        always @(posedge ACLK)
        begin
            if (ACLK_EN) begin
                if (next_data)
                    data_buf <= tmp_data;
                else if (next_split)
                    data_buf <= data_buf >> BUS_DATA_WIDTH;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                strb_buf <= 0;
            else if (ACLK_EN) begin
                if (next_data)
                    strb_buf <= tmp_strb;
                else if (next_split)
                    strb_buf <= strb_buf >> BUS_DATA_BYTES;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                WVALID_Dummy <= 0;
            else if (ACLK_EN) begin
                if (next_data)
                    WVALID_Dummy <= 1;
                else if (~(first_split || next_split) && ready_for_data)
                    WVALID_Dummy <= 0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                WLAST_Dummy <= 0;
            else if (ACLK_EN) begin
                if (next_burst && last_split)
                    WLAST_Dummy <= 1;
                else if (ready_for_data)
                    WLAST_Dummy <= 0;
            end
        end
    end
    else begin: bus_wide_gen
        localparam
            TOTAL_PADS      = BUS_DATA_WIDTH / USER_DATA_WIDTH,
            PAD_ALIGN       = log2(TOTAL_PADS);
        reg  [BUS_DATA_WIDTH - 1:0]                 data_buf;
        reg  [BUS_DATA_BYTES - 1:0]                 strb_buf;
        wire [2*PAD_ALIGN + 7:0]                    burst_pack;
        wire [2*PAD_ALIGN + 7:0]                    tmp_burst_info;
        wire [PAD_ALIGN - 1:0]                      head_pads;
        wire [PAD_ALIGN - 1:0]                      tail_pads;
        wire [TOTAL_PADS - 1:0]                     add_head;
        wire [TOTAL_PADS - 1:0]                     add_tail;
        wire [TOTAL_PADS - 1:0]                     pad_oh;
        reg  [TOTAL_PADS - 1:0]                     pad_oh_reg;
        wire [TOTAL_PADS - 1:0]                     head_pad_sel;
        wire [0:TOTAL_PADS - 1]                     tail_pad_sel;
        wire [7:0]                                  awlen_tmp_t;
        wire                                        ready_for_data;
        wire                                        next_pad;
        reg                                         first_pad;
        wire                                        last_pad;
        wire                                        first_beat;
        wire                                        last_beat;
        wire                                        next_beat;
        filesystem_encrypt_buffer_V_m_axi_fifo #(
            .DATA_BITS(8 + 2*PAD_ALIGN),
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
        assign WDATA   = data_buf;
        assign WSTRB   = strb_buf;
        assign WLAST   = WLAST_Dummy;
        assign WVALID  = WVALID_Dummy;
        assign awlen_tmp_t = awlen_tmp;
        assign tmp_burst_info = {awaddr_tmp[BUS_ADDR_ALIGN - 1:USER_ADDR_ALIGN], burst_end[BUS_ADDR_ALIGN - 1:USER_ADDR_ALIGN], awlen_tmp_t};
        filesystem_encrypt_buffer_V_m_axi_decoder #(
            .DIN_WIDTH(PAD_ALIGN)
        ) head_pad_decoder (
            .din(head_pads),
            .dout(head_pad_sel));
        filesystem_encrypt_buffer_V_m_axi_decoder #(
            .DIN_WIDTH(PAD_ALIGN)
        ) tail_pad_decoder (
            .din(tail_pads),
            .dout(tail_pad_sel));
        assign head_pads = burst_pack[2*PAD_ALIGN + 7:8 + PAD_ALIGN];
        assign tail_pads = ~burst_pack[PAD_ALIGN + 7:8];
        assign burst_len = burst_pack[7:0];
        assign next_data        = next_pad;
        assign next_burst       = last_beat && next_beat;
        assign ready_for_data   = ~(WVALID_Dummy && ~WREADY);
        assign first_beat = (len_cnt == 0) && burst_valid;
        assign last_beat  = (len_cnt == burst_len) && burst_valid;
        assign next_beat  = burst_valid && last_pad && ready_for_data;
        assign next_pad  = burst_valid && data_valid && ready_for_data;
        assign last_pad  = (last_beat)? pad_oh[TOTAL_PADS - tail_pads - 1] : pad_oh[TOTAL_PADS - 1];
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
        assign pad_oh = (data_valid == 0)?          0 :
                        (first_pad && first_beat)?  1 << head_pads :
                        (first_pad)?                1 :
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
            assign add_head[i-1] = head_pad_sel[i-1] && first_beat;
            assign add_tail[i-1] = tail_pad_sel[i-1] && last_beat;
            always @(posedge ACLK)
            begin
                if (ACLK_EN) begin
                    if ((add_head[i-1] || add_tail[i-1]) && ready_for_data)
                        data_buf[i*USER_DATA_WIDTH - 1:(i-1)*USER_DATA_WIDTH] <= 0;
                    else if (pad_oh[i-1] == 1'b1 && ready_for_data)
                        data_buf[i*USER_DATA_WIDTH - 1:(i-1)*USER_DATA_WIDTH] <= tmp_data;
                end
            end
            always @(posedge ACLK)
            begin
                if (ARESET)
                    strb_buf[i*USER_DATA_BYTES - 1:(i-1)*USER_DATA_BYTES] <= 0;
                else if (ACLK_EN) begin
                    if ((add_head[i-1] || add_tail[i-1]) && ready_for_data)
                        strb_buf[i*USER_DATA_BYTES - 1:(i-1)*USER_DATA_BYTES] <= 0;
                    else if (pad_oh[i-1] == 1'b1 && ready_for_data)
                        strb_buf[i*USER_DATA_BYTES - 1:(i-1)*USER_DATA_BYTES] <= tmp_strb;
                end
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                WVALID_Dummy <= 0;
            else if (ACLK_EN) begin
                if (next_beat)
                    WVALID_Dummy <= 1;
                else if (ready_for_data)
                    WVALID_Dummy <= 0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                WLAST_Dummy <= 0;
            else if (ACLK_EN) begin
                if (next_burst)
                    WLAST_Dummy <= 1;
                else if (ready_for_data)
                    WLAST_Dummy <= 0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                len_cnt <= 0;
            else if (ACLK_EN) begin
                if (next_burst)
                    len_cnt <= 0;
                else if (next_beat)
                    len_cnt <= len_cnt + 1;
            end
        end
    end
    endgenerate
    filesystem_encrypt_buffer_V_m_axi_fifo #(
        .DATA_BITS(2),
        .DEPTH(NUM_WRITE_OUTSTANDING-1),
        .DEPTH_BITS(log2(NUM_WRITE_OUTSTANDING-1))
    ) fifo_resp (
        .sclk(ACLK),
        .reset(ARESET),
        .sclk_en(ACLK_EN),
        .empty_n(need_wrsp),
        .full_n(fifo_resp_ready),
        .rdreq(next_resp),
        .wrreq(fifo_resp_w),
        .q(aw2b_bdata),
        .data(aw2b_awdata));
    filesystem_encrypt_buffer_V_m_axi_fifo #(
        .DATA_BITS(2),
        .DEPTH(USER_MAXREQS),
        .DEPTH_BITS(log2(USER_MAXREQS))
    ) fifo_resp_to_user (
        .sclk(ACLK),
        .reset(ARESET),
        .sclk_en(ACLK_EN),
        .empty_n(wrsp_valid),
        .full_n(resp_ready),
        .rdreq(wrsp_ack),
        .wrreq(resp_match),
        .q(wrsp),
        .data(bresp_tmp));
    assign BREADY = resp_ready;
    assign last_resp = aw2b_bdata[1];
    assign invalid_event = aw2b_bdata[0];
    assign resp_match = (next_resp && (last_resp || invalid_event)) && need_wrsp;
    always @(posedge ACLK)
    begin
        if (ARESET)
            next_resp <= 1'b0;
        else if (ACLK_EN) begin
            next_resp <= BVALID && resp_ready || (invalid_event && need_wrsp && ~next_resp);
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            bresp_tmp <= 2'b00;
        else if (ACLK_EN) begin
            if (resp_match && ~next_resp)           // last resp and no resp for next cycle: reset to 0
                bresp_tmp <= 2'b00;
            else if (resp_match && next_resp)       // last resp but has resp for next cycle
                bresp_tmp <= BRESP;
            else if (BVALID && resp_ready && ~bresp_tmp[1])
                bresp_tmp <= BRESP;
        end
    end
endmodule