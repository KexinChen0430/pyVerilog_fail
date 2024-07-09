module
 */
arp #(
    .DATA_WIDTH(64),
    .KEEP_ENABLE(1),
    .KEEP_WIDTH(8),
    .CACHE_ADDR_WIDTH(ARP_CACHE_ADDR_WIDTH),
    .REQUEST_RETRY_COUNT(ARP_REQUEST_RETRY_COUNT),
    .REQUEST_RETRY_INTERVAL(ARP_REQUEST_RETRY_INTERVAL),
    .REQUEST_TIMEOUT(ARP_REQUEST_TIMEOUT)
)
arp_inst (
    .clk(clk),
    .rst(rst),
    // Ethernet frame input
    .s_eth_hdr_valid(arp_rx_eth_hdr_valid),
    .s_eth_hdr_ready(arp_rx_eth_hdr_ready),
    .s_eth_dest_mac(arp_rx_eth_dest_mac),
    .s_eth_src_mac(arp_rx_eth_src_mac),
    .s_eth_type(arp_rx_eth_type),
    .s_eth_payload_axis_tdata(arp_rx_eth_payload_axis_tdata),
    .s_eth_payload_axis_tkeep(arp_rx_eth_payload_axis_tkeep),
    .s_eth_payload_axis_tvalid(arp_rx_eth_payload_axis_tvalid),
    .s_eth_payload_axis_tready(arp_rx_eth_payload_axis_tready),
    .s_eth_payload_axis_tlast(arp_rx_eth_payload_axis_tlast),
    .s_eth_payload_axis_tuser(arp_rx_eth_payload_axis_tuser),
    // Ethernet frame output
    .m_eth_hdr_valid(arp_tx_eth_hdr_valid),
    .m_eth_hdr_ready(arp_tx_eth_hdr_ready),
    .m_eth_dest_mac(arp_tx_eth_dest_mac),
    .m_eth_src_mac(arp_tx_eth_src_mac),
    .m_eth_type(arp_tx_eth_type),
    .m_eth_payload_axis_tdata(arp_tx_eth_payload_axis_tdata),
    .m_eth_payload_axis_tkeep(arp_tx_eth_payload_axis_tkeep),
    .m_eth_payload_axis_tvalid(arp_tx_eth_payload_axis_tvalid),
    .m_eth_payload_axis_tready(arp_tx_eth_payload_axis_tready),
    .m_eth_payload_axis_tlast(arp_tx_eth_payload_axis_tlast),
    .m_eth_payload_axis_tuser(arp_tx_eth_payload_axis_tuser),
    // ARP requests
    .arp_request_valid(arp_request_valid),
    .arp_request_ready(arp_request_ready),
    .arp_request_ip(arp_request_ip),
    .arp_response_valid(arp_response_valid),
    .arp_response_ready(arp_response_ready),
    .arp_response_error(arp_response_error),
    .arp_response_mac(arp_response_mac),
    // Configuration
    .local_mac(local_mac),
    .local_ip(local_ip),
    .gateway_ip(gateway_ip),
    .subnet_mask(subnet_mask),
    .clear_cache(clear_arp_cache)
);
endmodule