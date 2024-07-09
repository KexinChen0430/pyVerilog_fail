module
    timestamp_insertion
      #( .TIMESTAMP_WIDTH(TIMESTAMP_WIDTH),
         .C_M_AXIS_DATA_WIDTH(C_M_AXIS_DATA_WIDTH),
	 .C_M_AXIS_TUSER_WIDTH( C_M_AXIS_TUSER_WIDTH)
       ) timestamp_insertion
       (
       // Outputs
         .m_axis_tdata	(m_axis_tdata),
         .m_axis_tstrb  (m_axis_tstrb),
         .m_axis_tvalid (m_axis_tvalid),
         .m_axis_tlast  (m_axis_tlast),
         .m_axis_tuser  (m_axis_tuser),
	 .m_axis_tready	(m_axis_tready),
	// Inputs
         .stamp_counter	(stamp_counter),
         .pkt_start	(pkt_start),
	 .s_axis_tdata	(s_axis_tdata_time),
         .s_axis_tstrb	(s_axis_tstrb_time),
	 .s_axis_tvalid	(s_axis_tvalid_time),
         .s_axis_tlast	(s_axis_tlast_time),
         .s_axis_tuser	(s_axis_tuser_time),
         .s_axis_tready	(s_axis_tready_time),
	 .reset		(~axi_resetn),
         .clk		(axi_aclk)
       );
assign pkt_start2 = s_axis_tready_internal && s_axis_tvalid_internal && (s_axis_tuser_internal!=0);
 timestamp_insertion_pkt_train
      #( .TIMESTAMP_WIDTH(TIMESTAMP_WIDTH),
         .C_M_AXIS_DATA_WIDTH(C_M_AXIS_DATA_WIDTH),
	 .C_M_AXIS_TUSER_WIDTH( C_M_AXIS_TUSER_WIDTH)
       ) timestamp_insertion_2
       (
       // Outputs
         .m_axis_tdata	(m_axis_tdata_antonis),
         .m_axis_tstrb  (m_axis_tstrb_antonis),
         .m_axis_tvalid (m_axis_tvalid_antonis),
         .m_axis_tlast  (m_axis_tlast_antonis),
         .m_axis_tuser  (m_axis_tuser_antonis),
	 .m_axis_tready	(m_axis_tready_antonis),
	// Inputs
         .stamp_counter	(stamp_counter),
         .pkt_start	(pkt_start2),
	    .s_axis_tdata(s_axis_tdata_internal),
	    .s_axis_tstrb(s_axis_tstrb_internal),
	    .s_axis_tvalid(s_axis_tvalid_internal),
	    .s_axis_tready(s_axis_tready_internal),
	    .s_axis_tlast(s_axis_tlast_internal),
	    .s_axis_tuser(s_axis_tuser_internal),
	 .reset		(~axi_resetn),
         .clk		(axi_aclk)
       );
    // Instantiate the AXI Converter
    rx_queue #(
       .AXI_DATA_WIDTH(C_M_AXIS_DATA_WIDTH_INTERNAL),
       .AXI_CALCULATIONS_DATA_WIDTH(AXI_CALCULATIONS_DATA_WIDTH),
       .C_DEFAULT_SRC_PORT(C_DEFAULT_SRC_PORT)
    )rx_queue (
       // AXI side
       .tdata(m_axis_tdata_internal),
       .tstrb(m_axis_tstrb_internal),
       .tvalid(m_axis_tvalid_internal),
       .tlast(m_axis_tlast_internal),
       .tready(m_axis_tready_internal),
       .clk(axi_aclk),
       .reset(~axi_resetn),
       .pkt_start(pkt_start),
       // MAC side
       .rx_data(rx_data),
       .rx_data_valid(rx_data_valid),
       .rx_good_frame(rx_good_frame),
       .rx_bad_frame(rx_bad_frame),
       .clk156(clk156),
	.tdata_calculations(tdata_calculations),
	.tstrb_calculations(tstrb_calculations),
	.tvalid_calculations(tvalid_calculations),
	.tlast_calculations(tlast_calculations),
	.tready_calculations(tready_calculations),
       .stamp_counter(stamp_counter)
    );
    tx_queue #(
       .AXI_DATA_WIDTH(C_S_AXIS_DATA_WIDTH_INTERNAL)
    )
    tx_queue (
       // AXI side
       .tdata(m_axis_tdata_antonis),
       .tstrb(m_axis_tstrb_antonis),
       .tvalid(m_axis_tvalid_antonis),
       .tlast(m_axis_tlast_antonis),
       .tready(m_axis_tready_antonis),
       .clk(axi_aclk),
       .reset(~axi_resetn),
       // MAC side
       .tx_data(tx_data),
       .tx_data_valid(tx_data_valid),
       .tx_start(tx_start),
       .tx_ack(tx_ack),
       .clk156(clk156),
       .stamp_counter(stamp_counter)
    );
    nf10_axis_converter
    #(.C_M_AXIS_DATA_WIDTH(C_M_AXIS_DATA_WIDTH),
      .C_S_AXIS_DATA_WIDTH(C_M_AXIS_DATA_WIDTH_INTERNAL),
      .C_DEFAULT_VALUE_ENABLE(C_DEFAULT_VALUE_ENABLE),
      .C_DEFAULT_SRC_PORT(C_DEFAULT_SRC_PORT),
      .C_DEFAULT_DST_PORT(C_DEFAULT_DST_PORT)
     ) converter_master
    (
    // Global Ports
    .axi_aclk(axi_aclk),
    .axi_resetn(axi_resetn),
    // Master Stream Ports
    .m_axis_tdata(s_axis_tdata_time),
    .m_axis_tstrb(s_axis_tstrb_time),
    .m_axis_tvalid(s_axis_tvalid_time),
    .m_axis_tready(s_axis_tready_time),
    .m_axis_tlast(s_axis_tlast_time),
    .m_axis_tuser(s_axis_tuser_time),
    // Slave Stream Ports
    .s_axis_tdata(m_axis_tdata_internal),
    .s_axis_tstrb(m_axis_tstrb_internal),
    .s_axis_tvalid(m_axis_tvalid_internal),
    .s_axis_tready(m_axis_tready_internal),
    .s_axis_tlast(m_axis_tlast_internal),
    .s_axis_tuser(m_axis_tuser_internal)
   );
    nf10_axis_converter
    #(.C_M_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH_INTERNAL),
      .C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH)
     ) converter_slave
    (
    // Global Ports
    .axi_aclk(axi_aclk),
    .axi_resetn(axi_resetn),
    // Master Stream Ports
    .m_axis_tdata(s_axis_tdata_internal),
    .m_axis_tstrb(s_axis_tstrb_internal),
    .m_axis_tvalid(s_axis_tvalid_internal),
    .m_axis_tready(s_axis_tready_internal),
    .m_axis_tlast(s_axis_tlast_internal),
    .m_axis_tuser(s_axis_tuser_internal),
    // Slave Stream Ports
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tstrb(s_axis_tstrb),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),
    .s_axis_tlast(s_axis_tlast),
    .s_axis_tuser(s_axis_tuser)
   );
endmodule