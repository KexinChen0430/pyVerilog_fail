module receives a UDP frame with header fields in parallel along with the
payload in an AXI stream, combines the header with the payload, passes through
the IP headers, and transmits the complete IP payload on an AXI interface.
*/
localparam [2:0]
    STATE_IDLE = 3'd0,
    STATE_WRITE_HEADER = 3'd1,
    STATE_WRITE_PAYLOAD = 3'd2,
    STATE_WRITE_PAYLOAD_LAST = 3'd3,
    STATE_WAIT_LAST = 3'd4;
reg [2:0] state_reg = STATE_IDLE, state_next;
// datapath control signals
reg store_udp_hdr;
reg store_last_word;
reg [2:0] hdr_ptr_reg = 3'd0, hdr_ptr_next;
reg [15:0] word_count_reg = 16'd0, word_count_next;
reg [7:0] last_word_data_reg = 8'd0;
reg [15:0] udp_source_port_reg = 16'd0;
reg [15:0] udp_dest_port_reg = 16'd0;
reg [15:0] udp_length_reg = 16'd0;
reg [15:0] udp_checksum_reg = 16'd0;
reg s_udp_hdr_ready_reg = 1'b0, s_udp_hdr_ready_next;
reg s_udp_payload_axis_tready_reg = 1'b0, s_udp_payload_axis_tready_next;
reg m_ip_hdr_valid_reg = 1'b0, m_ip_hdr_valid_next;
reg [47:0] m_eth_dest_mac_reg = 48'd0;
reg [47:0] m_eth_src_mac_reg = 48'd0;
reg [15:0] m_eth_type_reg = 16'd0;
reg [3:0] m_ip_version_reg = 4'd0;
reg [3:0] m_ip_ihl_reg = 4'd0;
reg [5:0] m_ip_dscp_reg = 6'd0;
reg [1:0] m_ip_ecn_reg = 2'd0;
reg [15:0] m_ip_length_reg = 16'd0;
reg [15:0] m_ip_identification_reg = 16'd0;
reg [2:0] m_ip_flags_reg = 3'd0;
reg [12:0] m_ip_fragment_offset_reg = 13'd0;
reg [7:0] m_ip_ttl_reg = 8'd0;
reg [7:0] m_ip_protocol_reg = 8'd0;
reg [15:0] m_ip_header_checksum_reg = 16'd0;
reg [31:0] m_ip_source_ip_reg = 32'd0;
reg [31:0] m_ip_dest_ip_reg = 32'd0;
reg busy_reg = 1'b0;
reg error_payload_early_termination_reg = 1'b0, error_payload_early_termination_next;
// internal datapath
reg [7:0] m_ip_payload_axis_tdata_int;
reg       m_ip_payload_axis_tvalid_int;
reg       m_ip_payload_axis_tready_int_reg = 1'b0;
reg       m_ip_payload_axis_tlast_int;
reg       m_ip_payload_axis_tuser_int;
wire      m_ip_payload_axis_tready_int_early;
assign s_udp_hdr_ready = s_udp_hdr_ready_reg;
assign s_udp_payload_axis_tready = s_udp_payload_axis_tready_reg;
assign m_ip_hdr_valid = m_ip_hdr_valid_reg;
assign m_eth_dest_mac = m_eth_dest_mac_reg;
assign m_eth_src_mac = m_eth_src_mac_reg;
assign m_eth_type = m_eth_type_reg;
assign m_ip_version = m_ip_version_reg;
assign m_ip_ihl = m_ip_ihl_reg;
assign m_ip_dscp = m_ip_dscp_reg;
assign m_ip_ecn = m_ip_ecn_reg;
assign m_ip_length = m_ip_length_reg;
assign m_ip_identification = m_ip_identification_reg;
assign m_ip_flags = m_ip_flags_reg;
assign m_ip_fragment_offset = m_ip_fragment_offset_reg;
assign m_ip_ttl = m_ip_ttl_reg;
assign m_ip_protocol = m_ip_protocol_reg;
assign m_ip_header_checksum = m_ip_header_checksum_reg;
assign m_ip_source_ip = m_ip_source_ip_reg;
assign m_ip_dest_ip = m_ip_dest_ip_reg;
assign busy = busy_reg;
assign error_payload_early_termination = error_payload_early_termination_reg;
always @* begin
    state_next = STATE_IDLE;
    s_udp_hdr_ready_next = 1'b0;
    s_udp_payload_axis_tready_next = 1'b0;
    store_udp_hdr = 1'b0;
    store_last_word = 1'b0;
    hdr_ptr_next = hdr_ptr_reg;
    word_count_next = word_count_reg;
    m_ip_hdr_valid_next = m_ip_hdr_valid_reg && !m_ip_hdr_ready;
    error_payload_early_termination_next = 1'b0;
    m_ip_payload_axis_tdata_int = 8'd0;
    m_ip_payload_axis_tvalid_int = 1'b0;
    m_ip_payload_axis_tlast_int = 1'b0;
    m_ip_payload_axis_tuser_int = 1'b0;
    case (state_reg)
        STATE_IDLE: begin
            // idle state - wait for data
            hdr_ptr_next = 3'd0;
            s_udp_hdr_ready_next = !m_ip_hdr_valid_next;
            if (s_udp_hdr_ready && s_udp_hdr_valid) begin
                store_udp_hdr = 1'b1;
                s_udp_hdr_ready_next = 1'b0;
                m_ip_hdr_valid_next = 1'b1;
                if (m_ip_payload_axis_tready_int_reg) begin
                    m_ip_payload_axis_tvalid_int = 1'b1;
                    m_ip_payload_axis_tdata_int = s_udp_source_port[15: 8];
                    hdr_ptr_next = 3'd1;
                end
                state_next = STATE_WRITE_HEADER;
            end else begin
                state_next = STATE_IDLE;
            end
        end
        STATE_WRITE_HEADER: begin
            // write header state
            word_count_next = udp_length_reg - 16'd8;
            if (m_ip_payload_axis_tready_int_reg) begin
                // word transfer out
                hdr_ptr_next = hdr_ptr_reg + 3'd1;
                m_ip_payload_axis_tvalid_int = 1'b1;
                state_next = STATE_WRITE_HEADER;
                case (hdr_ptr_reg)
                    3'h0: m_ip_payload_axis_tdata_int = udp_source_port_reg[15: 8];
                    3'h1: m_ip_payload_axis_tdata_int = udp_source_port_reg[ 7: 0];
                    3'h2: m_ip_payload_axis_tdata_int = udp_dest_port_reg[15: 8];
                    3'h3: m_ip_payload_axis_tdata_int = udp_dest_port_reg[ 7: 0];
                    3'h4: m_ip_payload_axis_tdata_int = udp_length_reg[15: 8];
                    3'h5: m_ip_payload_axis_tdata_int = udp_length_reg[ 7: 0];
                    3'h6: m_ip_payload_axis_tdata_int = udp_checksum_reg[15: 8];
                    3'h7: begin
                        m_ip_payload_axis_tdata_int = udp_checksum_reg[ 7: 0];
                        s_udp_payload_axis_tready_next = m_ip_payload_axis_tready_int_early;
                        state_next = STATE_WRITE_PAYLOAD;
                    end
                endcase
            end else begin
                state_next = STATE_WRITE_HEADER;
            end
        end
        STATE_WRITE_PAYLOAD: begin
            // write payload
            s_udp_payload_axis_tready_next = m_ip_payload_axis_tready_int_early;
            m_ip_payload_axis_tdata_int = s_udp_payload_axis_tdata;
            m_ip_payload_axis_tlast_int = s_udp_payload_axis_tlast;
            m_ip_payload_axis_tuser_int = s_udp_payload_axis_tuser;
            if (s_udp_payload_axis_tready && s_udp_payload_axis_tvalid) begin
                // word transfer through
                word_count_next = word_count_reg - 16'd1;
                m_ip_payload_axis_tvalid_int = 1'b1;
                if (s_udp_payload_axis_tlast) begin
                    if (word_count_reg != 16'd1) begin
                        // end of frame, but length does not match
                        m_ip_payload_axis_tuser_int = 1'b1;
                        error_payload_early_termination_next = 1'b1;
                    end
                    s_udp_hdr_ready_next = !m_ip_hdr_valid_next;
                    s_udp_payload_axis_tready_next = 1'b0;
                    state_next = STATE_IDLE;
                end else begin
                    if (word_count_reg == 16'd1) begin
                        store_last_word = 1'b1;
                        m_ip_payload_axis_tvalid_int = 1'b0;
                        state_next = STATE_WRITE_PAYLOAD_LAST;
                    end else begin
                        state_next = STATE_WRITE_PAYLOAD;
                    end
                end
            end else begin
                state_next = STATE_WRITE_PAYLOAD;
            end
        end
        STATE_WRITE_PAYLOAD_LAST: begin
            // read and discard until end of frame
            s_udp_payload_axis_tready_next = m_ip_payload_axis_tready_int_early;
            m_ip_payload_axis_tdata_int = last_word_data_reg;
            m_ip_payload_axis_tlast_int = s_udp_payload_axis_tlast;
            m_ip_payload_axis_tuser_int = s_udp_payload_axis_tuser;
            if (s_udp_payload_axis_tready && s_udp_payload_axis_tvalid) begin
                if (s_udp_payload_axis_tlast) begin
                    s_udp_hdr_ready_next = !m_ip_hdr_valid_next;
                    s_udp_payload_axis_tready_next = 1'b0;
                    m_ip_payload_axis_tvalid_int = 1'b1;
                    state_next = STATE_IDLE;
                end else begin
                    state_next = STATE_WRITE_PAYLOAD_LAST;
                end
            end else begin
                state_next = STATE_WRITE_PAYLOAD_LAST;
            end
        end
        STATE_WAIT_LAST: begin
            // wait for end of frame; read and discard
            s_udp_payload_axis_tready_next = 1'b1;
            if (s_udp_payload_axis_tvalid) begin
                if (s_udp_payload_axis_tlast) begin
                    s_udp_hdr_ready_next = !m_ip_hdr_valid_next;
                    s_udp_payload_axis_tready_next = 1'b0;
                    state_next = STATE_IDLE;
                end else begin
                    state_next = STATE_WAIT_LAST;
                end
            end else begin
                state_next = STATE_WAIT_LAST;
            end
        end
    endcase
end
always @(posedge clk) begin
    if (rst) begin
        state_reg <= STATE_IDLE;
        s_udp_hdr_ready_reg <= 1'b0;
        s_udp_payload_axis_tready_reg <= 1'b0;
        m_ip_hdr_valid_reg <= 1'b0;
        busy_reg <= 1'b0;
        error_payload_early_termination_reg <= 1'b0;
    end else begin
        state_reg <= state_next;
        s_udp_hdr_ready_reg <= s_udp_hdr_ready_next;
        s_udp_payload_axis_tready_reg <= s_udp_payload_axis_tready_next;
        m_ip_hdr_valid_reg <= m_ip_hdr_valid_next;
        busy_reg <= state_next != STATE_IDLE;
        error_payload_early_termination_reg <= error_payload_early_termination_next;
    end
    hdr_ptr_reg <= hdr_ptr_next;
    word_count_reg <= word_count_next;
    // datapath
    if (store_udp_hdr) begin
        m_eth_dest_mac_reg <= s_eth_dest_mac;
        m_eth_src_mac_reg <= s_eth_src_mac;
        m_eth_type_reg <= s_eth_type;
        m_ip_version_reg <= s_ip_version;
        m_ip_ihl_reg <= s_ip_ihl;
        m_ip_dscp_reg <= s_ip_dscp;
        m_ip_ecn_reg <= s_ip_ecn;
        m_ip_length_reg <= s_udp_length + 20;
        m_ip_identification_reg <= s_ip_identification;
        m_ip_flags_reg <= s_ip_flags;
        m_ip_fragment_offset_reg <= s_ip_fragment_offset;
        m_ip_ttl_reg <= s_ip_ttl;
        m_ip_protocol_reg <= s_ip_protocol;
        m_ip_header_checksum_reg <= s_ip_header_checksum;
        m_ip_source_ip_reg <= s_ip_source_ip;
        m_ip_dest_ip_reg <= s_ip_dest_ip;
        udp_source_port_reg <= s_udp_source_port;
        udp_dest_port_reg <= s_udp_dest_port;
        udp_length_reg <= s_udp_length;
        udp_checksum_reg <= s_udp_checksum;
    end
    if (store_last_word) begin
        last_word_data_reg <= m_ip_payload_axis_tdata_int;
    end
end
// output datapath logic
reg [7:0] m_ip_payload_axis_tdata_reg = 8'd0;
reg       m_ip_payload_axis_tvalid_reg = 1'b0, m_ip_payload_axis_tvalid_next;
reg       m_ip_payload_axis_tlast_reg = 1'b0;
reg       m_ip_payload_axis_tuser_reg = 1'b0;
reg [7:0] temp_m_ip_payload_axis_tdata_reg = 8'd0;
reg       temp_m_ip_payload_axis_tvalid_reg = 1'b0, temp_m_ip_payload_axis_tvalid_next;
reg       temp_m_ip_payload_axis_tlast_reg = 1'b0;
reg       temp_m_ip_payload_axis_tuser_reg = 1'b0;
// datapath control
reg store_ip_payload_int_to_output;
reg store_ip_payload_int_to_temp;
reg store_ip_payload_axis_temp_to_output;
assign m_ip_payload_axis_tdata = m_ip_payload_axis_tdata_reg;
assign m_ip_payload_axis_tvalid = m_ip_payload_axis_tvalid_reg;
assign m_ip_payload_axis_tlast = m_ip_payload_axis_tlast_reg;
assign m_ip_payload_axis_tuser = m_ip_payload_axis_tuser_reg;
// enable ready input next cycle if output is ready or the temp reg will not be filled on the next cycle (output reg empty or no input)
assign m_ip_payload_axis_tready_int_early = m_ip_payload_axis_tready || (!temp_m_ip_payload_axis_tvalid_reg && (!m_ip_payload_axis_tvalid_reg || !m_ip_payload_axis_tvalid_int));
always @* begin
    // transfer sink ready state to source
    m_ip_payload_axis_tvalid_next = m_ip_payload_axis_tvalid_reg;
    temp_m_ip_payload_axis_tvalid_next = temp_m_ip_payload_axis_tvalid_reg;
    store_ip_payload_int_to_output = 1'b0;
    store_ip_payload_int_to_temp = 1'b0;
    store_ip_payload_axis_temp_to_output = 1'b0;
    if (m_ip_payload_axis_tready_int_reg) begin
        // input is ready
        if (m_ip_payload_axis_tready || !m_ip_payload_axis_tvalid_reg) begin
            // output is ready or currently not valid, transfer data to output
            m_ip_payload_axis_tvalid_next = m_ip_payload_axis_tvalid_int;
            store_ip_payload_int_to_output = 1'b1;
        end else begin
            // output is not ready, store input in temp
            temp_m_ip_payload_axis_tvalid_next = m_ip_payload_axis_tvalid_int;
            store_ip_payload_int_to_temp = 1'b1;
        end
    end else if (m_ip_payload_axis_tready) begin
        // input is not ready, but output is ready
        m_ip_payload_axis_tvalid_next = temp_m_ip_payload_axis_tvalid_reg;
        temp_m_ip_payload_axis_tvalid_next = 1'b0;
        store_ip_payload_axis_temp_to_output = 1'b1;
    end
end
always @(posedge clk) begin
    if (rst) begin
        m_ip_payload_axis_tvalid_reg <= 1'b0;
        m_ip_payload_axis_tready_int_reg <= 1'b0;
        temp_m_ip_payload_axis_tvalid_reg <= 1'b0;
    end else begin
        m_ip_payload_axis_tvalid_reg <= m_ip_payload_axis_tvalid_next;
        m_ip_payload_axis_tready_int_reg <= m_ip_payload_axis_tready_int_early;
        temp_m_ip_payload_axis_tvalid_reg <= temp_m_ip_payload_axis_tvalid_next;
    end
    // datapath
    if (store_ip_payload_int_to_output) begin
        m_ip_payload_axis_tdata_reg <= m_ip_payload_axis_tdata_int;
        m_ip_payload_axis_tlast_reg <= m_ip_payload_axis_tlast_int;
        m_ip_payload_axis_tuser_reg <= m_ip_payload_axis_tuser_int;
    end else if (store_ip_payload_axis_temp_to_output) begin
        m_ip_payload_axis_tdata_reg <= temp_m_ip_payload_axis_tdata_reg;
        m_ip_payload_axis_tlast_reg <= temp_m_ip_payload_axis_tlast_reg;
        m_ip_payload_axis_tuser_reg <= temp_m_ip_payload_axis_tuser_reg;
    end
    if (store_ip_payload_int_to_temp) begin
        temp_m_ip_payload_axis_tdata_reg <= m_ip_payload_axis_tdata_int;
        temp_m_ip_payload_axis_tlast_reg <= m_ip_payload_axis_tlast_int;
        temp_m_ip_payload_axis_tuser_reg <= m_ip_payload_axis_tuser_int;
    end
end
endmodule