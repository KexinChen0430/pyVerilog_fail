module
assign udp_rx_ip_hdr_valid = s_select_udp && ip_rx_ip_hdr_valid;
assign udp_rx_ip_eth_dest_mac = ip_rx_ip_eth_dest_mac;
assign udp_rx_ip_eth_src_mac = ip_rx_ip_eth_src_mac;
assign udp_rx_ip_eth_type = ip_rx_ip_eth_type;
assign udp_rx_ip_version = ip_rx_ip_version;
assign udp_rx_ip_ihl = ip_rx_ip_ihl;
assign udp_rx_ip_dscp = ip_rx_ip_dscp;
assign udp_rx_ip_ecn = ip_rx_ip_ecn;
assign udp_rx_ip_length = ip_rx_ip_length;
assign udp_rx_ip_identification = ip_rx_ip_identification;
assign udp_rx_ip_flags = ip_rx_ip_flags;
assign udp_rx_ip_fragment_offset = ip_rx_ip_fragment_offset;
assign udp_rx_ip_ttl = ip_rx_ip_ttl;
assign udp_rx_ip_protocol = 8'h11;
assign udp_rx_ip_header_checksum = ip_rx_ip_header_checksum;
assign udp_rx_ip_source_ip = ip_rx_ip_source_ip;
assign udp_rx_ip_dest_ip = ip_rx_ip_dest_ip;
assign udp_rx_ip_payload_axis_tdata = ip_rx_ip_payload_axis_tdata;
assign udp_rx_ip_payload_axis_tkeep = ip_rx_ip_payload_axis_tkeep;
assign udp_rx_ip_payload_axis_tvalid = s_select_udp_reg && ip_rx_ip_payload_axis_tvalid;
assign udp_rx_ip_payload_axis_tlast = ip_rx_ip_payload_axis_tlast;
assign udp_rx_ip_payload_axis_tuser = ip_rx_ip_payload_axis_tuser;
// External IP frame output
assign m_ip_hdr_valid = s_select_ip && ip_rx_ip_hdr_valid;
assign m_ip_eth_dest_mac = ip_rx_ip_eth_dest_mac;
assign m_ip_eth_src_mac = ip_rx_ip_eth_src_mac;
assign m_ip_eth_type = ip_rx_ip_eth_type;
assign m_ip_version = ip_rx_ip_version;
assign m_ip_ihl = ip_rx_ip_ihl;
assign m_ip_dscp = ip_rx_ip_dscp;
assign m_ip_ecn = ip_rx_ip_ecn;
assign m_ip_length = ip_rx_ip_length;
assign m_ip_identification = ip_rx_ip_identification;
assign m_ip_flags = ip_rx_ip_flags;
assign m_ip_fragment_offset = ip_rx_ip_fragment_offset;
assign m_ip_ttl = ip_rx_ip_ttl;
assign m_ip_protocol = ip_rx_ip_protocol;
assign m_ip_header_checksum = ip_rx_ip_header_checksum;
assign m_ip_source_ip = ip_rx_ip_source_ip;
assign m_ip_dest_ip = ip_rx_ip_dest_ip;
assign m_ip_payload_axis_tdata = ip_rx_ip_payload_axis_tdata;
assign m_ip_payload_axis_tkeep = ip_rx_ip_payload_axis_tkeep;
assign m_ip_payload_axis_tvalid = s_select_ip_reg && ip_rx_ip_payload_axis_tvalid;
assign m_ip_payload_axis_tlast = ip_rx_ip_payload_axis_tlast;
assign m_ip_payload_axis_tuser = ip_rx_ip_payload_axis_tuser;
assign ip_rx_ip_hdr_ready = (s_select_udp && udp_rx_ip_hdr_ready) ||
                            (s_select_ip && m_ip_hdr_ready);
assign ip_rx_ip_payload_axis_tready = (s_select_udp_reg && udp_rx_ip_payload_axis_tready) ||
                                      (s_select_ip_reg && m_ip_payload_axis_tready);
/*
 */
ip_arb_mux #(
    .S_COUNT(2),
    .DATA_WIDTH(64),
    .KEEP_ENABLE(1),
    .ID_ENABLE(0),
    .DEST_ENABLE(0),
    .USER_ENABLE(1),
    .USER_WIDTH(1),
    .ARB_TYPE_ROUND_ROBIN(0),
    .ARB_LSB_HIGH_PRIORITY(1)
)
ip_arb_mux_inst (
    .clk(clk),
    .rst(rst),
    // IP frame inputs
    .s_ip_hdr_valid({s_ip_hdr_valid, udp_tx_ip_hdr_valid}),
    .s_ip_hdr_ready({s_ip_hdr_ready, udp_tx_ip_hdr_ready}),
    .s_eth_dest_mac(0),
    .s_eth_src_mac(0),
    .s_eth_type(0),
    .s_ip_version(0),
    .s_ip_ihl(0),
    .s_ip_dscp({s_ip_dscp, udp_tx_ip_dscp}),
    .s_ip_ecn({s_ip_ecn, udp_tx_ip_ecn}),
    .s_ip_length({s_ip_length, udp_tx_ip_length}),
    .s_ip_identification(0),
    .s_ip_flags(0),
    .s_ip_fragment_offset(0),
    .s_ip_ttl({s_ip_ttl, udp_tx_ip_ttl}),
    .s_ip_protocol({s_ip_protocol, udp_tx_ip_protocol}),
    .s_ip_header_checksum(0),
    .s_ip_source_ip({s_ip_source_ip, udp_tx_ip_source_ip}),
    .s_ip_dest_ip({s_ip_dest_ip, udp_tx_ip_dest_ip}),
    .s_ip_payload_axis_tdata({s_ip_payload_axis_tdata, udp_tx_ip_payload_axis_tdata}),
    .s_ip_payload_axis_tkeep({s_ip_payload_axis_tkeep, udp_tx_ip_payload_axis_tkeep}),
    .s_ip_payload_axis_tvalid({s_ip_payload_axis_tvalid, udp_tx_ip_payload_axis_tvalid}),
    .s_ip_payload_axis_tready({s_ip_payload_axis_tready, udp_tx_ip_payload_axis_tready}),
    .s_ip_payload_axis_tlast({s_ip_payload_axis_tlast, udp_tx_ip_payload_axis_tlast}),
    .s_ip_payload_axis_tid(0),
    .s_ip_payload_axis_tdest(0),
    .s_ip_payload_axis_tuser({s_ip_payload_axis_tuser, udp_tx_ip_payload_axis_tuser}),
    // IP frame output
    .m_ip_hdr_valid(ip_tx_ip_hdr_valid),
    .m_ip_hdr_ready(ip_tx_ip_hdr_ready),
    .m_eth_dest_mac(),
    .m_eth_src_mac(),
    .m_eth_type(),
    .m_ip_version(),
    .m_ip_ihl(),
    .m_ip_dscp(ip_tx_ip_dscp),
    .m_ip_ecn(ip_tx_ip_ecn),
    .m_ip_length(ip_tx_ip_length),
    .m_ip_identification(),
    .m_ip_flags(),
    .m_ip_fragment_offset(),
    .m_ip_ttl(ip_tx_ip_ttl),
    .m_ip_protocol(ip_tx_ip_protocol),
    .m_ip_header_checksum(),
    .m_ip_source_ip(ip_tx_ip_source_ip),
    .m_ip_dest_ip(ip_tx_ip_dest_ip),
    .m_ip_payload_axis_tdata(ip_tx_ip_payload_axis_tdata),
    .m_ip_payload_axis_tkeep(ip_tx_ip_payload_axis_tkeep),
    .m_ip_payload_axis_tvalid(ip_tx_ip_payload_axis_tvalid),
    .m_ip_payload_axis_tready(ip_tx_ip_payload_axis_tready),
    .m_ip_payload_axis_tlast(ip_tx_ip_payload_axis_tlast),
    .m_ip_payload_axis_tid(),
    .m_ip_payload_axis_tdest(),
    .m_ip_payload_axis_tuser(ip_tx_ip_payload_axis_tuser)
);
/*
 */
ip_complete_64 #(
    .ARP_CACHE_ADDR_WIDTH(ARP_CACHE_ADDR_WIDTH),
    .ARP_REQUEST_RETRY_COUNT(ARP_REQUEST_RETRY_COUNT),
    .ARP_REQUEST_RETRY_INTERVAL(ARP_REQUEST_RETRY_INTERVAL),
    .ARP_REQUEST_TIMEOUT(ARP_REQUEST_TIMEOUT)
)
ip_complete_64_inst (
    .clk(clk),
    .rst(rst),
    // Ethernet frame input
    .s_eth_hdr_valid(s_eth_hdr_valid),
    .s_eth_hdr_ready(s_eth_hdr_ready),
    .s_eth_dest_mac(s_eth_dest_mac),
    .s_eth_src_mac(s_eth_src_mac),
    .s_eth_type(s_eth_type),
    .s_eth_payload_axis_tdata(s_eth_payload_axis_tdata),
    .s_eth_payload_axis_tkeep(s_eth_payload_axis_tkeep),
    .s_eth_payload_axis_tvalid(s_eth_payload_axis_tvalid),
    .s_eth_payload_axis_tready(s_eth_payload_axis_tready),
    .s_eth_payload_axis_tlast(s_eth_payload_axis_tlast),
    .s_eth_payload_axis_tuser(s_eth_payload_axis_tuser),
    // Ethernet frame output
    .m_eth_hdr_valid(m_eth_hdr_valid),
    .m_eth_hdr_ready(m_eth_hdr_ready),
    .m_eth_dest_mac(m_eth_dest_mac),
    .m_eth_src_mac(m_eth_src_mac),
    .m_eth_type(m_eth_type),
    .m_eth_payload_axis_tdata(m_eth_payload_axis_tdata),
    .m_eth_payload_axis_tkeep(m_eth_payload_axis_tkeep),
    .m_eth_payload_axis_tvalid(m_eth_payload_axis_tvalid),
    .m_eth_payload_axis_tready(m_eth_payload_axis_tready),
    .m_eth_payload_axis_tlast(m_eth_payload_axis_tlast),
    .m_eth_payload_axis_tuser(m_eth_payload_axis_tuser),
    // IP frame input
    .s_ip_hdr_valid(ip_tx_ip_hdr_valid),
    .s_ip_hdr_ready(ip_tx_ip_hdr_ready),
    .s_ip_dscp(ip_tx_ip_dscp),
    .s_ip_ecn(ip_tx_ip_ecn),
    .s_ip_length(ip_tx_ip_length),
    .s_ip_ttl(ip_tx_ip_ttl),
    .s_ip_protocol(ip_tx_ip_protocol),
    .s_ip_source_ip(ip_tx_ip_source_ip),
    .s_ip_dest_ip(ip_tx_ip_dest_ip),
    .s_ip_payload_axis_tdata(ip_tx_ip_payload_axis_tdata),
    .s_ip_payload_axis_tkeep(ip_tx_ip_payload_axis_tkeep),
    .s_ip_payload_axis_tvalid(ip_tx_ip_payload_axis_tvalid),
    .s_ip_payload_axis_tready(ip_tx_ip_payload_axis_tready),
    .s_ip_payload_axis_tlast(ip_tx_ip_payload_axis_tlast),
    .s_ip_payload_axis_tuser(ip_tx_ip_payload_axis_tuser),
    // IP frame output
    .m_ip_hdr_valid(ip_rx_ip_hdr_valid),
    .m_ip_hdr_ready(ip_rx_ip_hdr_ready),
    .m_ip_eth_dest_mac(ip_rx_ip_eth_dest_mac),
    .m_ip_eth_src_mac(ip_rx_ip_eth_src_mac),
    .m_ip_eth_type(ip_rx_ip_eth_type),
    .m_ip_version(ip_rx_ip_version),
    .m_ip_ihl(ip_rx_ip_ihl),
    .m_ip_dscp(ip_rx_ip_dscp),
    .m_ip_ecn(ip_rx_ip_ecn),
    .m_ip_length(ip_rx_ip_length),
    .m_ip_identification(ip_rx_ip_identification),
    .m_ip_flags(ip_rx_ip_flags),
    .m_ip_fragment_offset(ip_rx_ip_fragment_offset),
    .m_ip_ttl(ip_rx_ip_ttl),
    .m_ip_protocol(ip_rx_ip_protocol),
    .m_ip_header_checksum(ip_rx_ip_header_checksum),
    .m_ip_source_ip(ip_rx_ip_source_ip),
    .m_ip_dest_ip(ip_rx_ip_dest_ip),
    .m_ip_payload_axis_tdata(ip_rx_ip_payload_axis_tdata),
    .m_ip_payload_axis_tkeep(ip_rx_ip_payload_axis_tkeep),
    .m_ip_payload_axis_tvalid(ip_rx_ip_payload_axis_tvalid),
    .m_ip_payload_axis_tready(ip_rx_ip_payload_axis_tready),
    .m_ip_payload_axis_tlast(ip_rx_ip_payload_axis_tlast),
    .m_ip_payload_axis_tuser(ip_rx_ip_payload_axis_tuser),
    // Status
    .rx_busy(ip_rx_busy),
    .tx_busy(ip_tx_busy),
    .rx_error_header_early_termination(ip_rx_error_header_early_termination),
    .rx_error_payload_early_termination(ip_rx_error_payload_early_termination),
    .rx_error_invalid_header(ip_rx_error_invalid_header),
    .rx_error_invalid_checksum(ip_rx_error_invalid_checksum),
    .tx_error_payload_early_termination(ip_tx_error_payload_early_termination),
    .tx_error_arp_failed(ip_tx_error_arp_failed),
    // Configuration
    .local_mac(local_mac),
    .local_ip(local_ip),
    .gateway_ip(gateway_ip),
    .subnet_mask(subnet_mask),
    .clear_arp_cache(clear_arp_cache)
);
/*
 */
udp_64 #(
    .CHECKSUM_GEN_ENABLE(UDP_CHECKSUM_GEN_ENABLE),
    .CHECKSUM_PAYLOAD_FIFO_DEPTH(UDP_CHECKSUM_PAYLOAD_FIFO_DEPTH),
    .CHECKSUM_HEADER_FIFO_DEPTH(UDP_CHECKSUM_HEADER_FIFO_DEPTH)
)
udp_64_inst (
    .clk(clk),
    .rst(rst),
    // IP frame input
    .s_ip_hdr_valid(udp_rx_ip_hdr_valid),
    .s_ip_hdr_ready(udp_rx_ip_hdr_ready),
    .s_ip_eth_dest_mac(udp_rx_ip_eth_dest_mac),
    .s_ip_eth_src_mac(udp_rx_ip_eth_src_mac),
    .s_ip_eth_type(udp_rx_ip_eth_type),
    .s_ip_version(udp_rx_ip_version),
    .s_ip_ihl(udp_rx_ip_ihl),
    .s_ip_dscp(udp_rx_ip_dscp),
    .s_ip_ecn(udp_rx_ip_ecn),
    .s_ip_length(udp_rx_ip_length),
    .s_ip_identification(udp_rx_ip_identification),
    .s_ip_flags(udp_rx_ip_flags),
    .s_ip_fragment_offset(udp_rx_ip_fragment_offset),
    .s_ip_ttl(udp_rx_ip_ttl),
    .s_ip_protocol(udp_rx_ip_protocol),
    .s_ip_header_checksum(udp_rx_ip_header_checksum),
    .s_ip_source_ip(udp_rx_ip_source_ip),
    .s_ip_dest_ip(udp_rx_ip_dest_ip),
    .s_ip_payload_axis_tdata(udp_rx_ip_payload_axis_tdata),
    .s_ip_payload_axis_tkeep(udp_rx_ip_payload_axis_tkeep),
    .s_ip_payload_axis_tvalid(udp_rx_ip_payload_axis_tvalid),
    .s_ip_payload_axis_tready(udp_rx_ip_payload_axis_tready),
    .s_ip_payload_axis_tlast(udp_rx_ip_payload_axis_tlast),
    .s_ip_payload_axis_tuser(udp_rx_ip_payload_axis_tuser),
    // IP frame output
    .m_ip_hdr_valid(udp_tx_ip_hdr_valid),
    .m_ip_hdr_ready(udp_tx_ip_hdr_ready),
    .m_ip_eth_dest_mac(),
    .m_ip_eth_src_mac(),
    .m_ip_eth_type(),
    .m_ip_version(),
    .m_ip_ihl(),
    .m_ip_dscp(udp_tx_ip_dscp),
    .m_ip_ecn(udp_tx_ip_ecn),
    .m_ip_length(udp_tx_ip_length),
    .m_ip_identification(),
    .m_ip_flags(),
    .m_ip_fragment_offset(),
    .m_ip_ttl(udp_tx_ip_ttl),
    .m_ip_protocol(udp_tx_ip_protocol),
    .m_ip_header_checksum(),
    .m_ip_source_ip(udp_tx_ip_source_ip),
    .m_ip_dest_ip(udp_tx_ip_dest_ip),
    .m_ip_payload_axis_tdata(udp_tx_ip_payload_axis_tdata),
    .m_ip_payload_axis_tkeep(udp_tx_ip_payload_axis_tkeep),
    .m_ip_payload_axis_tvalid(udp_tx_ip_payload_axis_tvalid),
    .m_ip_payload_axis_tready(udp_tx_ip_payload_axis_tready),
    .m_ip_payload_axis_tlast(udp_tx_ip_payload_axis_tlast),
    .m_ip_payload_axis_tuser(udp_tx_ip_payload_axis_tuser),
    // UDP frame input
    .s_udp_hdr_valid(s_udp_hdr_valid),
    .s_udp_hdr_ready(s_udp_hdr_ready),
    .s_udp_eth_dest_mac(48'd0),
    .s_udp_eth_src_mac(48'd0),
    .s_udp_eth_type(16'd0),
    .s_udp_ip_version(4'd0),
    .s_udp_ip_ihl(4'd0),
    .s_udp_ip_dscp(s_udp_ip_dscp),
    .s_udp_ip_ecn(s_udp_ip_ecn),
    .s_udp_ip_identification(16'd0),
    .s_udp_ip_flags(3'd0),
    .s_udp_ip_fragment_offset(13'd0),
    .s_udp_ip_ttl(s_udp_ip_ttl),
    .s_udp_ip_header_checksum(16'd0),
    .s_udp_ip_source_ip(s_udp_ip_source_ip),
    .s_udp_ip_dest_ip(s_udp_ip_dest_ip),
    .s_udp_source_port(s_udp_source_port),
    .s_udp_dest_port(s_udp_dest_port),
    .s_udp_length(s_udp_length),
    .s_udp_checksum(s_udp_checksum),
    .s_udp_payload_axis_tdata(s_udp_payload_axis_tdata),
    .s_udp_payload_axis_tkeep(s_udp_payload_axis_tkeep),
    .s_udp_payload_axis_tvalid(s_udp_payload_axis_tvalid),
    .s_udp_payload_axis_tready(s_udp_payload_axis_tready),
    .s_udp_payload_axis_tlast(s_udp_payload_axis_tlast),
    .s_udp_payload_axis_tuser(s_udp_payload_axis_tuser),
    // UDP frame output
    .m_udp_hdr_valid(m_udp_hdr_valid),
    .m_udp_hdr_ready(m_udp_hdr_ready),
    .m_udp_eth_dest_mac(m_udp_eth_dest_mac),
    .m_udp_eth_src_mac(m_udp_eth_src_mac),
    .m_udp_eth_type(m_udp_eth_type),
    .m_udp_ip_version(m_udp_ip_version),
    .m_udp_ip_ihl(m_udp_ip_ihl),
    .m_udp_ip_dscp(m_udp_ip_dscp),
    .m_udp_ip_ecn(m_udp_ip_ecn),
    .m_udp_ip_length(m_udp_ip_length),
    .m_udp_ip_identification(m_udp_ip_identification),
    .m_udp_ip_flags(m_udp_ip_flags),
    .m_udp_ip_fragment_offset(m_udp_ip_fragment_offset),
    .m_udp_ip_ttl(m_udp_ip_ttl),
    .m_udp_ip_protocol(m_udp_ip_protocol),
    .m_udp_ip_header_checksum(m_udp_ip_header_checksum),
    .m_udp_ip_source_ip(m_udp_ip_source_ip),
    .m_udp_ip_dest_ip(m_udp_ip_dest_ip),
    .m_udp_source_port(m_udp_source_port),
    .m_udp_dest_port(m_udp_dest_port),
    .m_udp_length(m_udp_length),
    .m_udp_checksum(m_udp_checksum),
    .m_udp_payload_axis_tdata(m_udp_payload_axis_tdata),
    .m_udp_payload_axis_tkeep(m_udp_payload_axis_tkeep),
    .m_udp_payload_axis_tvalid(m_udp_payload_axis_tvalid),
    .m_udp_payload_axis_tready(m_udp_payload_axis_tready),
    .m_udp_payload_axis_tlast(m_udp_payload_axis_tlast),
    .m_udp_payload_axis_tuser(m_udp_payload_axis_tuser),
    // Status
    .rx_busy(udp_rx_busy),
    .tx_busy(udp_tx_busy),
    .rx_error_header_early_termination(udp_rx_error_header_early_termination),
    .rx_error_payload_early_termination(udp_rx_error_payload_early_termination),
    .tx_error_payload_early_termination(udp_tx_error_payload_early_termination)
);
endmodule