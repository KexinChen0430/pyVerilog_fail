module receives an ARP frame with header fields in parallel  and
transmits the complete Ethernet payload on an AXI interface.
*/
// datapath control signals
reg store_frame;
reg send_arp_header_reg = 1'b0, send_arp_header_next;
reg [PTR_WIDTH-1:0] ptr_reg = 0, ptr_next;
reg [15:0] arp_htype_reg = 16'd0;
reg [15:0] arp_ptype_reg = 16'd0;
reg [15:0] arp_oper_reg = 16'd0;
reg [47:0] arp_sha_reg = 48'd0;
reg [31:0] arp_spa_reg = 32'd0;
reg [47:0] arp_tha_reg = 48'd0;
reg [31:0] arp_tpa_reg = 32'd0;
reg s_frame_ready_reg = 1'b0, s_frame_ready_next;
reg m_eth_hdr_valid_reg = 1'b0, m_eth_hdr_valid_next;
reg [47:0] m_eth_dest_mac_reg = 48'd0;
reg [47:0] m_eth_src_mac_reg = 48'd0;
reg [15:0] m_eth_type_reg = 16'd0;
reg busy_reg = 1'b0;
// internal datapath
reg [DATA_WIDTH-1:0] m_eth_payload_axis_tdata_int;
reg [KEEP_WIDTH-1:0] m_eth_payload_axis_tkeep_int;
reg                  m_eth_payload_axis_tvalid_int;
reg                  m_eth_payload_axis_tready_int_reg = 1'b0;
reg                  m_eth_payload_axis_tlast_int;
reg                  m_eth_payload_axis_tuser_int;
wire                 m_eth_payload_axis_tready_int_early;
assign s_frame_ready = s_frame_ready_reg;
assign m_eth_hdr_valid = m_eth_hdr_valid_reg;
assign m_eth_dest_mac = m_eth_dest_mac_reg;
assign m_eth_src_mac = m_eth_src_mac_reg;
assign m_eth_type = m_eth_type_reg;
assign busy = busy_reg;
always @* begin
    send_arp_header_next = send_arp_header_reg;
    ptr_next = ptr_reg;
    s_frame_ready_next = 1'b0;
    store_frame = 1'b0;
    m_eth_hdr_valid_next = m_eth_hdr_valid_reg && !m_eth_hdr_ready;
    m_eth_payload_axis_tdata_int = {DATA_WIDTH{1'b0}};
    m_eth_payload_axis_tkeep_int = {KEEP_WIDTH{1'b0}};
    m_eth_payload_axis_tvalid_int = 1'b0;
    m_eth_payload_axis_tlast_int = 1'b0;
    m_eth_payload_axis_tuser_int = 1'b0;
    if (s_frame_ready && s_frame_valid) begin
        store_frame = 1'b1;
        m_eth_hdr_valid_next = 1'b1;
        ptr_next = 0;
        send_arp_header_next = 1'b1;
    end
    if (m_eth_payload_axis_tready_int_reg) begin
        if (send_arp_header_reg) begin
            ptr_next = ptr_reg + 1;
            m_eth_payload_axis_tdata_int = {DATA_WIDTH{1'b0}};
            m_eth_payload_axis_tkeep_int = {KEEP_WIDTH{1'b0}};
            m_eth_payload_axis_tvalid_int = 1'b1;
            m_eth_payload_axis_tlast_int = 1'b0;
            m_eth_payload_axis_tuser_int = 1'b0;
            `define _HEADER_FIELD_(offset, field) \
                if (ptr_reg == offset/KEEP_WIDTH) begin \
                    m_eth_payload_axis_tdata_int[(offset%KEEP_WIDTH)*8 +: 8] = field; \
                    m_eth_payload_axis_tkeep_int[offset%KEEP_WIDTH] = 1'b1; \
                end
            `_HEADER_FIELD_(0,  arp_htype_reg[1*8 +: 8])
            `_HEADER_FIELD_(1,  arp_htype_reg[0*8 +: 8])
            `_HEADER_FIELD_(2,  arp_ptype_reg[1*8 +: 8])
            `_HEADER_FIELD_(3,  arp_ptype_reg[0*8 +: 8])
            `_HEADER_FIELD_(4,  8'd6)
            `_HEADER_FIELD_(5,  8'd4)
            `_HEADER_FIELD_(6,  arp_oper_reg[1*8 +: 8])
            `_HEADER_FIELD_(7,  arp_oper_reg[0*8 +: 8])
            `_HEADER_FIELD_(8,  arp_sha_reg[5*8 +: 8])
            `_HEADER_FIELD_(9,  arp_sha_reg[4*8 +: 8])
            `_HEADER_FIELD_(10, arp_sha_reg[3*8 +: 8])
            `_HEADER_FIELD_(11, arp_sha_reg[2*8 +: 8])
            `_HEADER_FIELD_(12, arp_sha_reg[1*8 +: 8])
            `_HEADER_FIELD_(13, arp_sha_reg[0*8 +: 8])
            `_HEADER_FIELD_(14, arp_spa_reg[3*8 +: 8])
            `_HEADER_FIELD_(15, arp_spa_reg[2*8 +: 8])
            `_HEADER_FIELD_(16, arp_spa_reg[1*8 +: 8])
            `_HEADER_FIELD_(17, arp_spa_reg[0*8 +: 8])
            `_HEADER_FIELD_(18, arp_tha_reg[5*8 +: 8])
            `_HEADER_FIELD_(19, arp_tha_reg[4*8 +: 8])
            `_HEADER_FIELD_(20, arp_tha_reg[3*8 +: 8])
            `_HEADER_FIELD_(21, arp_tha_reg[2*8 +: 8])
            `_HEADER_FIELD_(22, arp_tha_reg[1*8 +: 8])
            `_HEADER_FIELD_(23, arp_tha_reg[0*8 +: 8])
            `_HEADER_FIELD_(24, arp_tpa_reg[3*8 +: 8])
            `_HEADER_FIELD_(25, arp_tpa_reg[2*8 +: 8])
            `_HEADER_FIELD_(26, arp_tpa_reg[1*8 +: 8])
            `_HEADER_FIELD_(27, arp_tpa_reg[0*8 +: 8])
            if (ptr_reg == 27/KEEP_WIDTH) begin
                m_eth_payload_axis_tlast_int = 1'b1;
                send_arp_header_next = 1'b0;
            end
            `undef _HEADER_FIELD_
        end
    end
    s_frame_ready_next = !m_eth_hdr_valid_next && !send_arp_header_next;
end
always @(posedge clk) begin
    send_arp_header_reg <= send_arp_header_next;
    ptr_reg <= ptr_next;
    s_frame_ready_reg <= s_frame_ready_next;
    m_eth_hdr_valid_reg <= m_eth_hdr_valid_next;
    busy_reg <= send_arp_header_next;
    if (store_frame) begin
        m_eth_dest_mac_reg <= s_eth_dest_mac;
        m_eth_src_mac_reg <= s_eth_src_mac;
        m_eth_type_reg <= s_eth_type;
        arp_htype_reg <= s_arp_htype;
        arp_ptype_reg <= s_arp_ptype;
        arp_oper_reg <= s_arp_oper;
        arp_sha_reg <= s_arp_sha;
        arp_spa_reg <= s_arp_spa;
        arp_tha_reg <= s_arp_tha;
        arp_tpa_reg <= s_arp_tpa;
    end
    if (rst) begin
        send_arp_header_reg <= 1'b0;
        ptr_reg <= 0;
        s_frame_ready_reg <= 1'b0;
        m_eth_hdr_valid_reg <= 1'b0;
        busy_reg <= 1'b0;
    end
end
// output datapath logic
reg [DATA_WIDTH-1:0] m_eth_payload_axis_tdata_reg = {DATA_WIDTH{1'b0}};
reg [KEEP_WIDTH-1:0] m_eth_payload_axis_tkeep_reg = {KEEP_WIDTH{1'b0}};
reg                  m_eth_payload_axis_tvalid_reg = 1'b0, m_eth_payload_axis_tvalid_next;
reg                  m_eth_payload_axis_tlast_reg = 1'b0;
reg                  m_eth_payload_axis_tuser_reg = 1'b0;
reg [DATA_WIDTH-1:0] temp_m_eth_payload_axis_tdata_reg = {DATA_WIDTH{1'b0}};
reg [KEEP_WIDTH-1:0] temp_m_eth_payload_axis_tkeep_reg = {KEEP_WIDTH{1'b0}};
reg                  temp_m_eth_payload_axis_tvalid_reg = 1'b0, temp_m_eth_payload_axis_tvalid_next;
reg                  temp_m_eth_payload_axis_tlast_reg = 1'b0;
reg                  temp_m_eth_payload_axis_tuser_reg = 1'b0;
// datapath control
reg store_eth_payload_int_to_output;
reg store_eth_payload_int_to_temp;
reg store_eth_payload_axis_temp_to_output;
assign m_eth_payload_axis_tdata = m_eth_payload_axis_tdata_reg;
assign m_eth_payload_axis_tkeep = KEEP_ENABLE ? m_eth_payload_axis_tkeep_reg : {KEEP_WIDTH{1'b1}};
assign m_eth_payload_axis_tvalid = m_eth_payload_axis_tvalid_reg;
assign m_eth_payload_axis_tlast = m_eth_payload_axis_tlast_reg;
assign m_eth_payload_axis_tuser = m_eth_payload_axis_tuser_reg;
// enable ready input next cycle if output is ready or the temp reg will not be filled on the next cycle (output reg empty or no input)
assign m_eth_payload_axis_tready_int_early = m_eth_payload_axis_tready || (!temp_m_eth_payload_axis_tvalid_reg && (!m_eth_payload_axis_tvalid_reg || !m_eth_payload_axis_tvalid_int));
always @* begin
    // transfer sink ready state to source
    m_eth_payload_axis_tvalid_next = m_eth_payload_axis_tvalid_reg;
    temp_m_eth_payload_axis_tvalid_next = temp_m_eth_payload_axis_tvalid_reg;
    store_eth_payload_int_to_output = 1'b0;
    store_eth_payload_int_to_temp = 1'b0;
    store_eth_payload_axis_temp_to_output = 1'b0;
    if (m_eth_payload_axis_tready_int_reg) begin
        // input is ready
        if (m_eth_payload_axis_tready || !m_eth_payload_axis_tvalid_reg) begin
            // output is ready or currently not valid, transfer data to output
            m_eth_payload_axis_tvalid_next = m_eth_payload_axis_tvalid_int;
            store_eth_payload_int_to_output = 1'b1;
        end else begin
            // output is not ready, store input in temp
            temp_m_eth_payload_axis_tvalid_next = m_eth_payload_axis_tvalid_int;
            store_eth_payload_int_to_temp = 1'b1;
        end
    end else if (m_eth_payload_axis_tready) begin
        // input is not ready, but output is ready
        m_eth_payload_axis_tvalid_next = temp_m_eth_payload_axis_tvalid_reg;
        temp_m_eth_payload_axis_tvalid_next = 1'b0;
        store_eth_payload_axis_temp_to_output = 1'b1;
    end
end
always @(posedge clk) begin
    if (rst) begin
        m_eth_payload_axis_tvalid_reg <= 1'b0;
        m_eth_payload_axis_tready_int_reg <= 1'b0;
        temp_m_eth_payload_axis_tvalid_reg <= 1'b0;
    end else begin
        m_eth_payload_axis_tvalid_reg <= m_eth_payload_axis_tvalid_next;
        m_eth_payload_axis_tready_int_reg <= m_eth_payload_axis_tready_int_early;
        temp_m_eth_payload_axis_tvalid_reg <= temp_m_eth_payload_axis_tvalid_next;
    end
    // datapath
    if (store_eth_payload_int_to_output) begin
        m_eth_payload_axis_tdata_reg <= m_eth_payload_axis_tdata_int;
        m_eth_payload_axis_tkeep_reg <= m_eth_payload_axis_tkeep_int;
        m_eth_payload_axis_tlast_reg <= m_eth_payload_axis_tlast_int;
        m_eth_payload_axis_tuser_reg <= m_eth_payload_axis_tuser_int;
    end else if (store_eth_payload_axis_temp_to_output) begin
        m_eth_payload_axis_tdata_reg <= temp_m_eth_payload_axis_tdata_reg;
        m_eth_payload_axis_tkeep_reg <= temp_m_eth_payload_axis_tkeep_reg;
        m_eth_payload_axis_tlast_reg <= temp_m_eth_payload_axis_tlast_reg;
        m_eth_payload_axis_tuser_reg <= temp_m_eth_payload_axis_tuser_reg;
    end
    if (store_eth_payload_int_to_temp) begin
        temp_m_eth_payload_axis_tdata_reg <= m_eth_payload_axis_tdata_int;
        temp_m_eth_payload_axis_tkeep_reg <= m_eth_payload_axis_tkeep_int;
        temp_m_eth_payload_axis_tlast_reg <= m_eth_payload_axis_tlast_int;
        temp_m_eth_payload_axis_tuser_reg <= m_eth_payload_axis_tuser_int;
    end
end
endmodule