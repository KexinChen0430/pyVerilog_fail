module //
.lbPortOpenReplyIn_TVALID               (mux2shim_portOpenReplyIn_V_V_TVALID),         // output wire portOpenReplyIn_TVALID
.lbPortOpenReplyIn_TREADY               (mux2shim_portOpenReplyIn_V_V_TREADY),         // input wire portOpenReplyIn_TREADY
.lbPortOpenReplyIn_TDATA                (mux2shim_portOpenReplyIn_V_V_TDATA),          // output wire [7 : 0] portOpenReplyIn_TDATA
.lbRequestPortOpenOut_TVALID            (shim2mux_requestPortOpenOut_V_TVALID),        // input wire requestPortOpenOut_TVALID
.lbRequestPortOpenOut_TREADY            (shim2mux_requestPortOpenOut_V_TREADY),        // output wire requestPortOpenOut_TREADY
.lbRequestPortOpenOut_TDATA             (shim2mux_requestPortOpenOut_V_TDATA),         // input wire [15 : 0] requestPortOpenOut_TDATA
.lbRxDataIn_TVALID                      (mux2shimRxDataIn_TVALID),                     // output wire rxDataIn_TVALID
.lbRxDataIn_TREADY                      (mux2shimRxDataIn_TREADY),                     // input wire rxDataIn_TREADY
.lbRxDataIn_TDATA                       (mux2shimRxDataIn_TDATA),                      // output wire [63 : 0] rxDataIn_TDATA
.lbRxDataIn_TKEEP                       (mux2shimRxDataIn_TKEEP),                      // output wire [7 : 0] rxDataIn_TKEEP
.lbRxDataIn_TLAST                       (mux2shimRxDataIn_TLAST),                      // output wire [0 : 0] rxDataIn_TLAST
.lbRxMetadataIn_TVALID                  (mux2shimRxMetadataIn_V_TVALID),               // output wire rxMetadataIn_TVALID
.lbRxMetadataIn_TREADY                  (mux2shimRxMetadataIn_V_TREADY),               // input wire rxMetadataIn_TREADY
.lbRxMetadataIn_TDATA                   (mux2shimRxMetadataIn_V_TDATA),                // output wire [95 : 0] rxMetadataIn_TDATA
.lbTxDataOut_TVALID                     (shim2mux_TVALID),                             // input wire txDataOut_TVALID
.lbTxDataOut_TREADY                     (shim2mux_TREADY),                             // output wire txDataOut_TREADY
.lbTxDataOut_TDATA                      (shim2mux_TDATA),                              // input wire [63 : 0] txDataOut_TDATA
.lbTxDataOut_TKEEP                      (shim2mux_TKEEP),                              // input wire [7 : 0] txDataOut_TKEEP
.lbTxDataOut_TLAST                      (shim2mux_TLAST),                              // input wire [0 : 0] txDataOut_TLAST
.lbTxLengthOut_TVALID                   (shim2muxTxLengthOut_V_V_TVALID),              // input wire txLengthOut_TVALID
.lbTxLengthOut_TREADY                   (shim2muxTxLengthOut_V_V_TREADY),              // output wire txLengthOut_TREADY
.lbTxLengthOut_TDATA                    (shim2muxTxLengthOut_V_V_TDATA),               // input wire [15 : 0] txLengthOut_TDATA
.lbTxMetadataOut_TVALID                 (shim2muxTxMetadataOut_V_TVALID),              // input wire txMetadataOut_TVALID
.lbTxMetadataOut_TREADY                 (shim2muxTxMetadataOut_V_TREADY),              // output wire txMetadataOut_TREADY
.lbTxMetadataOut_TDATA                  (shim2muxTxMetadataOut_V_TDATA)                // input wire [95 : 0] txMetadataOut_TDATA
);
reg app_start;
always @(posedge axi_clk)
begin
    if (aresetn == 0) begin
        app_start <= 0;
    end
    else begin
        app_start <= 1;//1;
    end
end
/*
 */
//echo_server_application_ip echo_server
/*
iperf_ip iperf_server
//iperf_client_ip iperf_client
(
.m_axis_listen_port_TVALID(axis_listen_port_TVALID),
.m_axis_listen_port_TREADY(axis_listen_port_TREADY),
.m_axis_listen_port_TDATA(axis_listen_port_TDATA),
//.m_axis_close_port_TVALID(axis_close_port_TVALID),
//.m_axis_close_port_TREADY(axis_close_port_TREADY),
//.m_axis_close_port_TDATA(axis_close_port_TDATA),
.m_axis_close_connection_TVALID(axis_close_connection_TVALID),
.m_axis_close_connection_TREADY(axis_close_connection_TREADY),
.m_axis_close_connection_TDATA(axis_close_connection_TDATA),
.m_axis_open_connection_TVALID(axis_open_connection_TVALID),
.m_axis_open_connection_TREADY(axis_open_connection_TREADY),
.m_axis_open_connection_TDATA(axis_open_connection_TDATA),
.m_axis_read_package_TVALID(axis_read_package_TVALID),
.m_axis_read_package_TREADY(axis_read_package_TREADY),
.m_axis_read_package_TDATA(axis_read_package_TDATA),
.m_axis_tx_data_TVALID(axis_tx_data_TVALID),
.m_axis_tx_data_TREADY(axis_tx_data_TREADY),
.m_axis_tx_data_TDATA(axis_tx_data_TDATA),
.m_axis_tx_data_TKEEP(axis_tx_data_TKEEP),
.m_axis_tx_data_TLAST(axis_tx_data_TLAST),
.m_axis_tx_metadata_TVALID(axis_tx_metadata_TVALID),
.m_axis_tx_metadata_TREADY(axis_tx_metadata_TREADY),
.m_axis_tx_metadata_TDATA(axis_tx_metadata_TDATA),
.s_axis_listen_port_status_TVALID(axis_listen_port_status_TVALID),
.s_axis_listen_port_status_TREADY(axis_listen_port_status_TREADY),
.s_axis_listen_port_status_TDATA(axis_listen_port_status_TDATA),
.s_axis_notifications_TVALID(axis_notifications_TVALID),
.s_axis_notifications_TREADY(axis_notifications_TREADY),
.s_axis_notifications_TDATA(axis_notifications_TDATA),
.s_axis_open_status_TVALID(axis_open_status_TVALID),
.s_axis_open_status_TREADY(axis_open_status_TREADY),
.s_axis_open_status_TDATA(axis_open_status_TDATA),
.s_axis_rx_data_TVALID(axis_rx_data_TVALID),
.s_axis_rx_data_TREADY(axis_rx_data_TREADY),
.s_axis_rx_data_TDATA(axis_rx_data_TDATA),
.s_axis_rx_data_TKEEP(axis_rx_data_TKEEP),
.s_axis_rx_data_TLAST(axis_rx_data_TLAST),
.s_axis_rx_metadata_TVALID(axis_rx_metadata_TVALID),
.s_axis_rx_metadata_TREADY(axis_rx_metadata_TREADY),
.s_axis_rx_metadata_TDATA(axis_rx_metadata_TDATA),
.s_axis_tx_status_TVALID(axis_tx_status_TVALID),
.s_axis_tx_status_TREADY(axis_tx_status_TREADY),
.s_axis_tx_status_TDATA(axis_tx_status_TDATA),
//Client only
//.runExperiment_V(runExperiment),
//.useConn_V(8'h01),
.aclk(axi_clk), // input aclk
.aresetn(aresetn), // input aresetn
.ap_start(app_start), // input ap_start
.ap_ready(), // output ap_ready
.ap_done(), // output ap_done
.ap_idle() // output ap_idle
);*/
//wire        runExperiment;
//wire        dualMode;
//wire[7:0]   noOfConnections;
//wire[7:0]   pkgWordCount;
reg ap_start;
always@( posedge axi_clk)
begin
    if (aresetn == 0)
        ap_start = 0;
    else
        ap_start = 1;
end
echo_server_application_ip myEchoServer (
  .ap_start(ap_start),                                                      // input wire ap_start
  .ap_ready(),                                                          // output wire ap_ready
  .ap_done(),                                                           // output wire ap_done
  .ap_idle(),                                                           // output wire ap_idle
  .m_axis_close_connection_TVALID(axis_close_connection_TVALID),      // output wire m_axis_close_connection_TVALID
  .m_axis_close_connection_TREADY(axis_close_connection_TREADY),      // input wire m_axis_close_connection_TREADY
  .m_axis_close_connection_TDATA(axis_close_connection_TDATA),        // output wire [15 : 0] m_axis_close_connection_TDATA
  .m_axis_listen_port_TVALID(axis_listen_port_TVALID),                // output wire m_axis_listen_port_TVALID
  .m_axis_listen_port_TREADY(axis_listen_port_TREADY),                // input wire m_axis_listen_port_TREADY
  .m_axis_listen_port_TDATA(axis_listen_port_TDATA),                  // output wire [15 : 0] m_axis_listen_port_TDATA
  .m_axis_open_connection_TVALID(axis_open_connection_TVALID),        // output wire m_axis_open_connection_TVALID
  .m_axis_open_connection_TREADY(axis_open_connection_TREADY),        // input wire m_axis_open_connection_TREADY
  .m_axis_open_connection_TDATA(axis_open_connection_TDATA),          // output wire [47 : 0] m_axis_open_connection_TDATA
  .m_axis_read_package_TVALID(axis_read_package_TVALID),              // output wire m_axis_read_package_TVALID
  .m_axis_read_package_TREADY(axis_read_package_TREADY),              // input wire m_axis_read_package_TREADY
  .m_axis_read_package_TDATA(axis_read_package_TDATA),                // output wire [31 : 0] m_axis_read_package_TDATA
  .m_axis_tx_data_TVALID(axis_tx_data_TVALID),                        // output wire m_axis_tx_data_TVALID
  .m_axis_tx_data_TREADY(axis_tx_data_TREADY),                        // input wire m_axis_tx_data_TREADY
  .m_axis_tx_data_TDATA(axis_tx_data_TDATA),                          // output wire [63 : 0] m_axis_tx_data_TDATA
  .m_axis_tx_data_TKEEP(axis_tx_data_TKEEP),                          // output wire [7 : 0] m_axis_tx_data_TKEEP
  .m_axis_tx_data_TLAST(axis_tx_data_TLAST),                          // output wire [0 : 0] m_axis_tx_data_TLAST
  .m_axis_tx_metadata_TVALID(axis_tx_metadata_TVALID),                // output wire m_axis_tx_metadata_TVALID
  .m_axis_tx_metadata_TREADY(axis_tx_metadata_TREADY),                // input wire m_axis_tx_metadata_TREADY
  .m_axis_tx_metadata_TDATA(axis_tx_metadata_TDATA),                  // output wire [15 : 0] m_axis_tx_metadata_TDATA
  .s_axis_listen_port_status_TVALID(axis_listen_port_status_TVALID),  // input wire s_axis_listen_port_status_TVALID
  .s_axis_listen_port_status_TREADY(axis_listen_port_status_TREADY),  // output wire s_axis_listen_port_status_TREADY
  .s_axis_listen_port_status_TDATA(axis_listen_port_status_TDATA),    // input wire [7 : 0] s_axis_listen_port_status_TDATA
  .s_axis_notifications_TVALID(axis_notifications_TVALID),            // input wire s_axis_notifications_TVALID
  .s_axis_notifications_TREADY(axis_notifications_TREADY),            // output wire s_axis_notifications_TREADY
  .s_axis_notifications_TDATA(axis_notifications_TDATA),              // input wire [87 : 0] s_axis_notifications_TDATA
  .s_axis_open_status_TVALID(axis_open_status_TVALID),                // input wire s_axis_open_status_TVALID
  .s_axis_open_status_TREADY(axis_open_status_TREADY),                // output wire s_axis_open_status_TREADY
  .s_axis_open_status_TDATA(axis_open_status_TDATA),                  // input wire [23 : 0] s_axis_open_status_TDATA
  .s_axis_rx_data_TVALID(axis_rx_data_TVALID),                        // input wire s_axis_rx_data_TVALID
  .s_axis_rx_data_TREADY(axis_rx_data_TREADY),                        // output wire s_axis_rx_data_TREADY
  .s_axis_rx_data_TDATA(axis_rx_data_TDATA),                          // input wire [63 : 0] s_axis_rx_data_TDATA
  .s_axis_rx_data_TKEEP(axis_rx_data_TKEEP),                          // input wire [7 : 0] s_axis_rx_data_TKEEP
  .s_axis_rx_data_TLAST(axis_rx_data_TLAST),                          // input wire [0 : 0] s_axis_rx_data_TLAST
  .s_axis_rx_metadata_TVALID(axis_rx_metadata_TVALID),                // input wire s_axis_rx_metadata_TVALID
  .s_axis_rx_metadata_TREADY(axis_rx_metadata_TREADY),                // output wire s_axis_rx_metadata_TREADY
  .s_axis_rx_metadata_TDATA(axis_rx_metadata_TDATA),                  // input wire [15 : 0] s_axis_rx_metadata_TDATA
  .s_axis_tx_status_TVALID(axis_tx_status_TVALID),                    // input wire s_axis_tx_status_TVALID
  .s_axis_tx_status_TREADY(axis_tx_status_TREADY),                    // output wire s_axis_tx_status_TREADY
  .s_axis_tx_status_TDATA(axis_tx_status_TDATA),                      // input wire [23 : 0] s_axis_tx_status_TDATA
  .aclk(axi_clk),                                                          // input wire aclk
  .aresetn(aresetn)                                                    // input wire aresetn
);
/*
iperf_client_0 iperf_client_inst (
  .runExperiment_V(runExperiment),                                    // input wire [0 : 0] runExperiment_V
  .dualModeEn_V(dualMode),                                          // input wire [0 : 0] dualModeEn_V
  .useConn_V(noOfConnections),                                                // input wire [7 : 0] useConn_V
  .pkgWordCount_V(pkgWordCount),                                      // input wire [7 : 0] pkgWordCount_V
  .regIpAddress1_V(32'h01010114),                                    // input wire [31 : 0] regIpAddress1_V
  .m_axis_close_connection_TVALID(axis_close_connection_TVALID),      // output wire m_axis_close_connection_TVALID
  .m_axis_close_connection_TREADY(axis_close_connection_TREADY),      // input wire m_axis_close_connection_TREADY
  .m_axis_close_connection_TDATA(axis_close_connection_TDATA),        // output wire [15 : 0] m_axis_close_connection_TDATA
  .m_axis_listen_port_TVALID(axis_listen_port_TVALID),                // output wire m_axis_listen_port_TVALID
  .m_axis_listen_port_TREADY(axis_listen_port_TREADY),                // input wire m_axis_listen_port_TREADY
  .m_axis_listen_port_TDATA(axis_listen_port_TDATA),                  // output wire [15 : 0] m_axis_listen_port_TDATA
  .m_axis_open_connection_TVALID(axis_open_connection_TVALID),        // output wire m_axis_open_connection_TVALID
  .m_axis_open_connection_TREADY(axis_open_connection_TREADY),        // input wire m_axis_open_connection_TREADY
  .m_axis_open_connection_TDATA(axis_open_connection_TDATA),          // output wire [47 : 0] m_axis_open_connection_TDATA
  .m_axis_read_package_TVALID(axis_read_package_TVALID),              // output wire m_axis_read_package_TVALID
  .m_axis_read_package_TREADY(axis_read_package_TREADY),              // input wire m_axis_read_package_TREADY
  .m_axis_read_package_TDATA(axis_read_package_TDATA),                // output wire [31 : 0] m_axis_read_package_TDATA
  .m_axis_tx_data_TVALID(axis_tx_data_TVALID),                        // output wire m_axis_tx_data_TVALID
  .m_axis_tx_data_TREADY(axis_tx_data_TREADY),                        // input wire m_axis_tx_data_TREADY
  .m_axis_tx_data_TDATA(axis_tx_data_TDATA),                          // output wire [63 : 0] m_axis_tx_data_TDATA
  .m_axis_tx_data_TKEEP(axis_tx_data_TKEEP),                          // output wire [7 : 0] m_axis_tx_data_TKEEP
  .m_axis_tx_data_TLAST(axis_tx_data_TLAST),                          // output wire [0 : 0] m_axis_tx_data_TLAST
  .m_axis_tx_metadata_TVALID(axis_tx_metadata_TVALID),                // output wire m_axis_tx_metadata_TVALID
  .m_axis_tx_metadata_TREADY(axis_tx_metadata_TREADY),                // input wire m_axis_tx_metadata_TREADY
  .m_axis_tx_metadata_TDATA(axis_tx_metadata_TDATA),                  // output wire [15 : 0] m_axis_tx_metadata_TDATA
  .s_axis_listen_port_status_TVALID(axis_listen_port_status_TVALID),  // input wire s_axis_listen_port_status_TVALID
  .s_axis_listen_port_status_TREADY(axis_listen_port_status_TREADY),  // output wire s_axis_listen_port_status_TREADY
  .s_axis_listen_port_status_TDATA(axis_listen_port_status_TDATA),    // input wire [7 : 0] s_axis_listen_port_status_TDATA
  .s_axis_notifications_TVALID(axis_notifications_TVALID),            // input wire s_axis_notifications_TVALID
  .s_axis_notifications_TREADY(axis_notifications_TREADY),            // output wire s_axis_notifications_TREADY
  .s_axis_notifications_TDATA(axis_notifications_TDATA),              // input wire [87 : 0] s_axis_notifications_TDATA
  .s_axis_open_status_TVALID(axis_open_status_TVALID),                // input wire s_axis_open_status_TVALID
  .s_axis_open_status_TREADY(axis_open_status_TREADY),                // output wire s_axis_open_status_TREADY
  .s_axis_open_status_TDATA(axis_open_status_TDATA),                  // input wire [23 : 0] s_axis_open_status_TDATA
  .s_axis_rx_data_TVALID(axis_rx_data_TVALID),                        // input wire s_axis_rx_data_TVALID
  .s_axis_rx_data_TREADY(axis_rx_data_TREADY),                        // output wire s_axis_rx_data_TREADY
  .s_axis_rx_data_TDATA(axis_rx_data_TDATA),                          // input wire [63 : 0] s_axis_rx_data_TDATA
  .s_axis_rx_data_TKEEP(axis_rx_data_TKEEP),                          // input wire [7 : 0] s_axis_rx_data_TKEEP
  .s_axis_rx_data_TLAST(axis_rx_data_TLAST),                          // input wire [0 : 0] s_axis_rx_data_TLAST
  .s_axis_rx_metadata_TVALID(axis_rx_metadata_TVALID),                // input wire s_axis_rx_metadata_TVALID
  .s_axis_rx_metadata_TREADY(axis_rx_metadata_TREADY),                // output wire s_axis_rx_metadata_TREADY
  .s_axis_rx_metadata_TDATA(axis_rx_metadata_TDATA),                  // input wire [15 : 0] s_axis_rx_metadata_TDATA
  .s_axis_tx_status_TVALID(axis_tx_status_TVALID),                    // input wire s_axis_tx_status_TVALID
  .s_axis_tx_status_TREADY(axis_tx_status_TREADY),                    // output wire s_axis_tx_status_TREADY
  .s_axis_tx_status_TDATA(axis_tx_status_TDATA),                      // input wire [23 : 0] s_axis_tx_status_TDATA
  .aclk(axi_clk),                                                     // input wire aclk
  .aresetn(aresetn)                                                   // input wire aresetn
);*/
/*
vio_ip myVIO (
  .clk(axi_clk),                    // input wire clk
  .probe_in0(),                     // input wire [0 : 0] probe_in0
  .probe_out0(runExperiment),       // output wire [0 : 0] probe_out0
  .probe_out1(dualMode),            // output wire [0 : 0] probe_out1
  .probe_out2(noOfConnections),     // output wire [7 : 0] probe_out2
  .probe_out3(pkgWordCount)         // output wire [7 : 0] probe_out3
);*/
udpLoopback_0 udpLoopback_inst (
  .lbPortOpenReplyIn_TVALID(mux2shim_portOpenReplyIn_V_V_TVALID),       // input wire portOpenReplyIn_TVALID
  .lbPortOpenReplyIn_TREADY(mux2shim_portOpenReplyIn_V_V_TREADY),       // output wire portOpenReplyIn_TREADY
  .lbPortOpenReplyIn_TDATA(mux2shim_portOpenReplyIn_V_V_TDATA),         // input wire [7 : 0] portOpenReplyIn_TDATA
  .lbRequestPortOpenOut_TVALID(shim2mux_requestPortOpenOut_V_TVALID),   // output wire requestPortOpenOut_TVALID
  .lbRequestPortOpenOut_TREADY(shim2mux_requestPortOpenOut_V_TREADY),   // input wire requestPortOpenOut_TREADY
  .lbRequestPortOpenOut_TDATA(shim2mux_requestPortOpenOut_V_TDATA),     // output wire [15 : 0] requestPortOpenOut_TDATA
  .lbRxDataIn_TVALID(mux2shimRxDataIn_TVALID),                          // input wire rxDataIn_TVALID
  .lbRxDataIn_TREADY(mux2shimRxDataIn_TREADY),                          // output wire rxDataIn_TREADY
  .lbRxDataIn_TDATA(mux2shimRxDataIn_TDATA),                            // input wire [63 : 0] rxDataIn_TDATA
  .lbRxDataIn_TKEEP(mux2shimRxDataIn_TKEEP),                            // input wire [7 : 0] rxDataIn_TKEEP
  .lbRxDataIn_TLAST(mux2shimRxDataIn_TLAST),                            // input wire [0 : 0] rxDataIn_TLAST
  .lbRxMetadataIn_TVALID(mux2shimRxMetadataIn_V_TVALID),                // input wire rxMetadataIn_TVALID
  .lbRxMetadataIn_TREADY(mux2shimRxMetadataIn_V_TREADY),                // output wire rxMetadataIn_TREADY
  .lbRxMetadataIn_TDATA(mux2shimRxMetadataIn_V_TDATA),                  // input wire [95 : 0] rxMetadataIn_TDATA
  .lbTxDataOut_TVALID(shim2mux_TVALID),                                 // output wire txDataOut_TVALID
  .lbTxDataOut_TREADY(shim2mux_TREADY),                                 // input wire txDataOut_TREADY
  .lbTxDataOut_TDATA(shim2mux_TDATA),                                   // output wire [63 : 0] txDataOut_TDATA
  .lbTxDataOut_TKEEP(shim2mux_TKEEP),                                   // output wire [7 : 0] txDataOut_TKEEP
  .lbTxDataOut_TLAST(shim2mux_TLAST),                                   // output wire [0 : 0] txDataOut_TLAST
  .lbTxLengthOut_TVALID(shim2muxTxLengthOut_V_V_TVALID),                // output wire txLengthOut_TVALID
  .lbTxLengthOut_TREADY(shim2muxTxLengthOut_V_V_TREADY),                // input wire txLengthOut_TREADY
  .lbTxLengthOut_TDATA(shim2muxTxLengthOut_V_V_TDATA),                  // output wire [15 : 0] txLengthOut_TDATA
  .lbTxMetadataOut_TVALID(shim2muxTxMetadataOut_V_TVALID),              // output wire txMetadataOut_TVALID
  .lbTxMetadataOut_TREADY(shim2muxTxMetadataOut_V_TREADY),              // input wire txMetadataOut_TREADY
  .lbTxMetadataOut_TDATA(shim2muxTxMetadataOut_V_TDATA),                // output wire [95 : 0] txMetadataOut_TDATA
  .aclk(axi_clk),                                                       // input wire aclk
  .aresetn(aresetn)                                                     // input wire aresetn
);
//DRAM MEM interface
//wire clk156_25;
wire reset156_25_n;
wire clk233;
wire clk200, clk200_i;
wire c0_init_calib_complete;
wire c1_init_calib_complete;
//toe stream interface signals
wire           toeTX_s_axis_read_cmd_tvalid;
wire          toeTX_s_axis_read_cmd_tready;
wire[71:0]     toeTX_s_axis_read_cmd_tdata;
//read status
wire          toeTX_m_axis_read_sts_tvalid;
wire           toeTX_m_axis_read_sts_tready;
wire[7:0]     toeTX_m_axis_read_sts_tdata;
//read stream
wire[63:0]    toeTX_m_axis_read_tdata;
wire[7:0]     toeTX_m_axis_read_tkeep;
wire          toeTX_m_axis_read_tlast;
wire          toeTX_m_axis_read_tvalid;
wire           toeTX_m_axis_read_tready;
//write commands
wire           toeTX_s_axis_write_cmd_tvalid;
wire          toeTX_s_axis_write_cmd_tready;
wire[71:0]     toeTX_s_axis_write_cmd_tdata;
//write status
wire          toeTX_m_axis_write_sts_tvalid;
wire           toeTX_m_axis_write_sts_tready;
wire[31:0]     toeTX_m_axis_write_sts_tdata;
//write stream
wire[63:0]     toeTX_s_axis_write_tdata;
wire[7:0]      toeTX_s_axis_write_tkeep;
wire           toeTX_s_axis_write_tlast;
wire           toeTX_s_axis_write_tvalid;
wire          toeTX_s_axis_write_tready;
//ht stream interface signals
wire           ht_s_axis_read_cmd_tvalid;
wire          ht_s_axis_read_cmd_tready;
wire[71:0]     ht_s_axis_read_cmd_tdata;
//read status
wire          ht_m_axis_read_sts_tvalid;
wire           ht_m_axis_read_sts_tready;
wire[7:0]     ht_m_axis_read_sts_tdata;
//read stream
wire[511:0]    ht_m_axis_read_tdata;
wire[63:0]     ht_m_axis_read_tkeep;
wire          ht_m_axis_read_tlast;
wire          ht_m_axis_read_tvalid;
wire           ht_m_axis_read_tready;
//write commands
wire           ht_s_axis_write_cmd_tvalid;
wire          ht_s_axis_write_cmd_tready;
wire[71:0]     ht_s_axis_write_cmd_tdata;
//write status
wire          ht_m_axis_write_sts_tvalid;
wire           ht_m_axis_write_sts_tready;
wire[31:0]     ht_m_axis_write_sts_tdata;
//write stream
wire[511:0]     ht_s_axis_write_tdata;
wire[63:0]      ht_s_axis_write_tkeep;
wire           ht_s_axis_write_tlast;
wire           ht_s_axis_write_tvalid;
wire          ht_s_axis_write_tready;
wire[511:0]     ht_s_axis_write_tdata_x;
wire[63:0]      ht_s_axis_write_tkeep_x;
wire           ht_s_axis_write_tlast_x;
wire           ht_s_axis_write_tvalid_x;
wire          ht_s_axis_write_tready_x;
//upd stream interface signals
wire           upd_s_axis_read_cmd_tvalid;
wire          upd_s_axis_read_cmd_tready;
wire[71:0]     upd_s_axis_read_cmd_tdata;
//read status
wire          upd_m_axis_read_sts_tvalid;
wire           upd_m_axis_read_sts_tready;
wire[7:0]     upd_m_axis_read_sts_tdata;
//read stream
wire[511:0]    upd_m_axis_read_tdata;
wire[63:0]     upd_m_axis_read_tkeep;
wire          upd_m_axis_read_tlast;
wire          upd_m_axis_read_tvalid;
wire           upd_m_axis_read_tready;
//write commands
wire           upd_s_axis_write_cmd_tvalid;
wire          upd_s_axis_write_cmd_tready;
wire[71:0]     upd_s_axis_write_cmd_tdata;
//write status
wire          upd_m_axis_write_sts_tvalid;
wire           upd_m_axis_write_sts_tready;
wire[31:0]     upd_m_axis_write_sts_tdata;
//write stream
wire[511:0]     upd_s_axis_write_tdata;
wire[63:0]      upd_s_axis_write_tkeep;
wire           upd_s_axis_write_tlast;
wire           upd_s_axis_write_tvalid;
wire          upd_s_axis_write_tready;
wire[511:0]     upd_s_axis_write_tdata_x;
wire[63:0]      upd_s_axis_write_tkeep_x;
wire           upd_s_axis_write_tlast_x;
wire           upd_s_axis_write_tvalid_x;
wire          upd_s_axis_write_tready_x;
wire ddr3_calib_complete, init_calib_complete;
wire toeTX_compare_error, ht_compare_error, upd_compare_error;
reg rst_n_r1, rst_n_r2, rst_n_r3;
reg reset156_25_n_r1, reset156_25_n_r2, reset156_25_n_r3;
//registers for crossing clock domains (from 233MHz to 156.25MHz)
reg c0_init_calib_complete_r1, c0_init_calib_complete_r2;
reg c1_init_calib_complete_r1, c1_init_calib_complete_r2;
//localparam TOE_START_ADDR = 32'd0;
//localparam HT_START_ADDR = 32'd0;
//localparam UPD_START_ADDR = 32'd32;
//assign clk156_25 = axi_clk;
//assign clk200 = clk_ref_200;
   always @(posedge axi_clk) begin
        reset156_25_n_r1 <= perst_n & pok_dram & network_init;
        reset156_25_n_r2 <= reset156_25_n_r1;
        reset156_25_n_r3 <= reset156_25_n_r2;
   end
   assign reset156_25_n = reset156_25_n_r3;
    assign aresetn = reset156_25_n & network_init;
always @(posedge axi_clk)
    if (~reset156_25_n) begin
        c0_init_calib_complete_r1 <= 1'b0;
        c0_init_calib_complete_r2 <= 1'b0;
        c1_init_calib_complete_r1 <= 1'b0;
        c1_init_calib_complete_r2 <= 1'b0;
    end
    else begin
        c0_init_calib_complete_r1 <= c0_init_calib_complete;
        c0_init_calib_complete_r2 <= c0_init_calib_complete_r1;
        c1_init_calib_complete_r1 <= c1_init_calib_complete;
        c1_init_calib_complete_r2 <= c1_init_calib_complete_r1;
    end
assign ddr3_calib_complete = c0_init_calib_complete_r2 & c1_init_calib_complete_r2;
assign init_calib_complete = ddr3_calib_complete;
/*
 */
// memory cmd streams
assign toeTX_s_axis_read_cmd_tvalid = axis_txread_cmd_TVALID;
assign axis_txread_cmd_TREADY = toeTX_s_axis_read_cmd_tready;
assign toeTX_s_axis_read_cmd_tdata = axis_txread_cmd_TDATA;
assign toeTX_s_axis_write_cmd_tvalid = axis_txwrite_cmd_TVALID;
assign axis_txwrite_cmd_TREADY = toeTX_s_axis_write_cmd_tready;
assign toeTX_s_axis_write_cmd_tdata = axis_txwrite_cmd_TDATA;
// memory sts streams
assign axis_txread_sts_TVALID         = toeTX_m_axis_read_sts_tvalid;
assign toeTX_m_axis_read_sts_tready   = 1'b1;
assign axis_txread_sts_TDATA          = toeTX_m_axis_read_sts_tdata;
assign axis_txwrite_sts_TVALID        = toeTX_m_axis_write_sts_tvalid;
assign toeTX_m_axis_write_sts_tready  = axis_txwrite_sts_TREADY;
assign axis_txwrite_sts_TDATA         = toeTX_m_axis_write_sts_tdata;
// memory data streams
assign axis_txread_data_TVALID = toeTX_m_axis_read_tvalid;
assign toeTX_m_axis_read_tready = axis_txread_data_TREADY;
assign axis_txread_data_TDATA = toeTX_m_axis_read_tdata;
assign axis_txread_data_TKEEP = toeTX_m_axis_read_tkeep;
assign axis_txread_data_TLAST = toeTX_m_axis_read_tlast;
assign toeTX_s_axis_write_tvalid = axis_txwrite_data_TVALID;
assign axis_txwrite_data_TREADY = toeTX_s_axis_write_tready;
assign toeTX_s_axis_write_tdata = axis_txwrite_data_TDATA;
assign toeTX_s_axis_write_tkeep = axis_txwrite_data_TKEEP;
assign toeTX_s_axis_write_tlast = axis_txwrite_data_TLAST;
wire           toeRX_s_axis_read_cmd_tvalid;
wire          toeRX_s_axis_read_cmd_tready;
wire[71:0]     toeRX_s_axis_read_cmd_tdata;
//read status
wire          toeRX_m_axis_read_sts_tvalid;
wire           toeRX_m_axis_read_sts_tready;
wire[7:0]     toeRX_m_axis_read_sts_tdata;
//read stream
wire[63:0]    toeRX_m_axis_read_tdata;
wire[7:0]     toeRX_m_axis_read_tkeep;
wire          toeRX_m_axis_read_tlast;
wire          toeRX_m_axis_read_tvalid;
wire           toeRX_m_axis_read_tready;
//write commands
wire           toeRX_s_axis_write_cmd_tvalid;
wire          toeRX_s_axis_write_cmd_tready;
wire[71:0]     toeRX_s_axis_write_cmd_tdata;
//write status
wire          toeRX_m_axis_write_sts_tvalid;
wire           toeRX_m_axis_write_sts_tready;
wire[7:0]     toeRX_m_axis_write_sts_tdata;
//write stream
wire[63:0]     toeRX_s_axis_write_tdata;
wire[7:0]      toeRX_s_axis_write_tkeep;
wire           toeRX_s_axis_write_tlast;
wire           toeRX_s_axis_write_tvalid;
wire          toeRX_s_axis_write_tready;
wire  toeRX_compare_error;
assign toeRX_compare_error = 1'b0;
/* RX Memory Signals
 */
// memory cmd streams
assign toeRX_s_axis_read_cmd_tvalid = axis_rxread_cmd_TVALID;
assign axis_rxread_cmd_TREADY = toeRX_s_axis_read_cmd_tready;
assign toeRX_s_axis_read_cmd_tdata = axis_rxread_cmd_TDATA;
assign toeRX_s_axis_write_cmd_tvalid = axis_rxwrite_cmd_TVALID;
assign axis_rxwrite_cmd_TREADY = toeRX_s_axis_write_cmd_tready;
assign toeRX_s_axis_write_cmd_tdata = axis_rxwrite_cmd_TDATA;
// memory sts streams
assign axis_rxread_sts_TVALID = toeRX_m_axis_read_sts_tvalid;
assign toeRX_m_axis_read_sts_tready = 1'b1;
assign axis_rxread_sts_TDATA = toeRX_m_axis_read_sts_tdata;
assign axis_rxwrite_sts_TVALID = toeRX_m_axis_write_sts_tvalid;
assign toeRX_m_axis_write_sts_tready = axis_rxwrite_sts_TREADY;
assign axis_rxwrite_sts_TDATA = toeRX_m_axis_write_sts_tdata;
// memory data streams
assign axis_rxread_data_TVALID = toeRX_m_axis_read_tvalid;
assign toeRX_m_axis_read_tready = axis_rxread_data_TREADY;
assign axis_rxread_data_TDATA = toeRX_m_axis_read_tdata;
assign axis_rxread_data_TKEEP = toeRX_m_axis_read_tkeep;
assign axis_rxread_data_TLAST = toeRX_m_axis_read_tlast;
assign toeRX_s_axis_write_tvalid = axis_rxwrite_data_TVALID;
assign axis_rxwrite_data_TREADY = toeRX_s_axis_write_tready;
assign toeRX_s_axis_write_tdata = axis_rxwrite_data_TDATA;
assign toeRX_s_axis_write_tkeep = axis_rxwrite_data_TKEEP;
assign toeRX_s_axis_write_tlast = axis_rxwrite_data_TLAST;
stream_tg #(
  .DATA_WIDTH(512),
  .KEEP_WIDTH(64),
  .START_ADDR(0),
  .START_DATA(8),
  .BTT(23'd64),
  .DRR(1'b0)
)
ht_stream_tg (
    .aclk(axi_clk),
    .aresetn(ddr3_calib_complete),
    .write_cmd(ht_s_axis_write_cmd_tdata),
    .write_cmd_valid(ht_s_axis_write_cmd_tvalid),
    .write_cmd_ready(ht_s_axis_write_cmd_tready),
    .write_data(ht_s_axis_write_tdata),
    .write_data_valid(ht_s_axis_write_tvalid),
    .write_data_ready(ht_s_axis_write_tready),
    .write_data_keep(ht_s_axis_write_tkeep),
    .write_data_last(ht_s_axis_write_tlast),
    .read_cmd(ht_s_axis_read_cmd_tdata),
    .read_cmd_valid(ht_s_axis_read_cmd_tvalid),
    .read_cmd_ready(ht_s_axis_read_cmd_tready),
    .read_data(ht_m_axis_read_tdata),
    .read_data_valid(ht_m_axis_read_tvalid),
    .read_data_keep(ht_m_axis_read_tkeep),
    .read_data_last(ht_m_axis_read_tlast),
    .read_data_ready(ht_m_axis_read_tready),
    .read_sts_data(ht_m_axis_read_sts_tdata),
    .read_sts_valid(ht_m_axis_read_sts_tvalid),
    .read_sts_ready(),
    .write_sts_data(ht_m_axis_write_sts_tdata),
    .write_sts_valid(ht_m_axis_write_sts_tvalid),
    .write_sts_ready(),
    .compare_error(ht_compare_error)
);
stream_tg #(
  .DATA_WIDTH(512),
  .KEEP_WIDTH(64),
  .START_ADDR(128),
  .START_DATA(32),
  .BTT(23'd64),
  .DRR(1'b0)
)
upd_stream_tg (
    .aclk(axi_clk),
    .aresetn(ddr3_calib_complete),
    .write_cmd(upd_s_axis_write_cmd_tdata),
    .write_cmd_valid(upd_s_axis_write_cmd_tvalid),
    .write_cmd_ready(upd_s_axis_write_cmd_tready),
    .write_data(upd_s_axis_write_tdata),
    .write_data_valid(upd_s_axis_write_tvalid),
    .write_data_ready(upd_s_axis_write_tready),
    .write_data_keep(upd_s_axis_write_tkeep),
    .write_data_last(upd_s_axis_write_tlast),
    .read_cmd(upd_s_axis_read_cmd_tdata),
    .read_cmd_valid(upd_s_axis_read_cmd_tvalid),
    .read_cmd_ready(upd_s_axis_read_cmd_tready),
    .read_data(upd_m_axis_read_tdata),
    .read_data_valid(upd_m_axis_read_tvalid),
    .read_data_keep(upd_m_axis_read_tkeep),
    .read_data_last(upd_m_axis_read_tlast),
    .read_data_ready(upd_m_axis_read_tready),
    .read_sts_data(upd_m_axis_read_sts_tdata),
    .read_sts_valid(upd_m_axis_read_sts_tvalid),
    .read_sts_ready(),
    .write_sts_data(upd_m_axis_write_sts_tdata),
    .write_sts_valid(upd_m_axis_write_sts_tvalid),
    .write_sts_ready(),
    .compare_error(upd_compare_error)
);
assign ht_m_axis_read_sts_tready = 1'b1;
assign ht_m_axis_write_sts_tready = 1'b1;
assign upd_m_axis_read_sts_tready = 1'b1;
assign upd_m_axis_write_sts_tready = 1'b1;
mem_inf  #(
    .C0_SIMULATION("FALSE"),
    .C1_SIMULATION("FALSE"),
    .C0_SIM_BYPASS_INIT_CAL("OFF"),
    .C1_SIM_BYPASS_INIT_CAL("OFF")
)
mem_inf_inst(
.clk156_25(axi_clk),
//.reset233_n(reset233_n), //active low reset signal for 233MHz clock domain
.reset156_25_n(ddr3_calib_complete),
//.clk233(clk233),
//.clk200(clk_ref_200),
//ddr3 pins
//SODIMM 0
// Inouts
.c0_ddr3_dq(c0_ddr3_dq),
.c0_ddr3_dqs_n(c0_ddr3_dqs_n),
.c0_ddr3_dqs_p(c0_ddr3_dqs_p),
// Outputs
.c0_ddr3_addr(c0_ddr3_addr),
.c0_ddr3_ba(c0_ddr3_ba),
.c0_ddr3_ras_n(c0_ddr3_ras_n),
.c0_ddr3_cas_n(c0_ddr3_cas_n),
.c0_ddr3_we_n(c0_ddr3_we_n),
.c0_ddr3_reset_n(c0_ddr3_reset_n),
.c0_ddr3_ck_p(c0_ddr3_ck_p),
.c0_ddr3_ck_n(c0_ddr3_ck_n),
.c0_ddr3_cke(c0_ddr3_cke),
.c0_ddr3_cs_n(c0_ddr3_cs_n),
//.c0_ddr3_dm(c0_ddr3_dm),
.c0_ddr3_odt(c0_ddr3_odt),
.c0_ui_clk(),
.c0_init_calib_complete(c0_init_calib_complete),
  // Differential system clocks
.c0_sys_clk_p(c0_sys_clk_p),
.c0_sys_clk_n(c0_sys_clk_n),
 // differential iodelayctrl clk (reference clock)
.clk_ref_p(clk_ref_p),
.clk_ref_n(clk_ref_n),
.c1_sys_clk_p(c1_sys_clk_p),
.c1_sys_clk_n(c1_sys_clk_n),
.sys_rst(perst_n & pok_dram),
//SODIMM 1
// Inouts
.c1_ddr3_dq(c1_ddr3_dq),
.c1_ddr3_dqs_n(c1_ddr3_dqs_n),
.c1_ddr3_dqs_p(c1_ddr3_dqs_p),
// Outputs
.c1_ddr3_addr(c1_ddr3_addr),
.c1_ddr3_ba(c1_ddr3_ba),
.c1_ddr3_ras_n(c1_ddr3_ras_n),
.c1_ddr3_cas_n(c1_ddr3_cas_n),
.c1_ddr3_we_n(c1_ddr3_we_n),
.c1_ddr3_reset_n(c1_ddr3_reset_n),
.c1_ddr3_ck_p(c1_ddr3_ck_p),
.c1_ddr3_ck_n(c1_ddr3_ck_n),
.c1_ddr3_cke(c1_ddr3_cke),
.c1_ddr3_cs_n(c1_ddr3_cs_n),
//.c1_ddr3_dm(c1_ddr3_dm),
.c1_ddr3_odt(c1_ddr3_odt),
.c1_ui_clk(),
.c1_init_calib_complete(c1_init_calib_complete),
//toe stream interface signals
.toeTX_s_axis_read_cmd_tvalid(toeTX_s_axis_read_cmd_tvalid),
.toeTX_s_axis_read_cmd_tready(toeTX_s_axis_read_cmd_tready),
.toeTX_s_axis_read_cmd_tdata(toeTX_s_axis_read_cmd_tdata),
//read status
.toeTX_m_axis_read_sts_tvalid(toeTX_m_axis_read_sts_tvalid),
.toeTX_m_axis_read_sts_tready(toeTX_m_axis_read_sts_tready),
.toeTX_m_axis_read_sts_tdata(toeTX_m_axis_read_sts_tdata),
//read stream
.toeTX_m_axis_read_tdata(toeTX_m_axis_read_tdata),
.toeTX_m_axis_read_tkeep(toeTX_m_axis_read_tkeep),
.toeTX_m_axis_read_tlast(toeTX_m_axis_read_tlast),
.toeTX_m_axis_read_tvalid(toeTX_m_axis_read_tvalid),
.toeTX_m_axis_read_tready(toeTX_m_axis_read_tready),
//write commands
.toeTX_s_axis_write_cmd_tvalid(toeTX_s_axis_write_cmd_tvalid),
.toeTX_s_axis_write_cmd_tready(toeTX_s_axis_write_cmd_tready),
.toeTX_s_axis_write_cmd_tdata(toeTX_s_axis_write_cmd_tdata),
//write status
.toeTX_m_axis_write_sts_tvalid(toeTX_m_axis_write_sts_tvalid),
.toeTX_m_axis_write_sts_tready(toeTX_m_axis_write_sts_tready),
.toeTX_m_axis_write_sts_tdata(toeTX_m_axis_write_sts_tdata),
//write stream
.toeTX_s_axis_write_tdata(toeTX_s_axis_write_tdata),
.toeTX_s_axis_write_tkeep(toeTX_s_axis_write_tkeep),
.toeTX_s_axis_write_tlast(toeTX_s_axis_write_tlast),
.toeTX_s_axis_write_tvalid(toeTX_s_axis_write_tvalid),
.toeTX_s_axis_write_tready(toeTX_s_axis_write_tready),
.toeRX_s_axis_read_cmd_tvalid(toeRX_s_axis_read_cmd_tvalid),
.toeRX_s_axis_read_cmd_tready(toeRX_s_axis_read_cmd_tready),
.toeRX_s_axis_read_cmd_tdata(toeRX_s_axis_read_cmd_tdata),
//read status
.toeRX_m_axis_read_sts_tvalid(toeRX_m_axis_read_sts_tvalid),
.toeRX_m_axis_read_sts_tready(toeRX_m_axis_read_sts_tready),
.toeRX_m_axis_read_sts_tdata(toeRX_m_axis_read_sts_tdata),
//read stream
.toeRX_m_axis_read_tdata(toeRX_m_axis_read_tdata),
.toeRX_m_axis_read_tkeep(toeRX_m_axis_read_tkeep),
.toeRX_m_axis_read_tlast(toeRX_m_axis_read_tlast),
.toeRX_m_axis_read_tvalid(toeRX_m_axis_read_tvalid),
.toeRX_m_axis_read_tready(toeRX_m_axis_read_tready),
//write commands
.toeRX_s_axis_write_cmd_tvalid(toeRX_s_axis_write_cmd_tvalid),
.toeRX_s_axis_write_cmd_tready(toeRX_s_axis_write_cmd_tready),
.toeRX_s_axis_write_cmd_tdata(toeRX_s_axis_write_cmd_tdata),
//write status
.toeRX_m_axis_write_sts_tvalid(toeRX_m_axis_write_sts_tvalid),
.toeRX_m_axis_write_sts_tready(toeRX_m_axis_write_sts_tready),
.toeRX_m_axis_write_sts_tdata(toeRX_m_axis_write_sts_tdata),
//write stream
.toeRX_s_axis_write_tdata(toeRX_s_axis_write_tdata),
.toeRX_s_axis_write_tkeep(toeRX_s_axis_write_tkeep),
.toeRX_s_axis_write_tlast(toeRX_s_axis_write_tlast),
.toeRX_s_axis_write_tvalid(toeRX_s_axis_write_tvalid),
.toeRX_s_axis_write_tready(toeRX_s_axis_write_tready),
//ht stream interface signals
.ht_s_axis_read_cmd_tvalid(ht_s_axis_read_cmd_tvalid),
.ht_s_axis_read_cmd_tready(ht_s_axis_read_cmd_tready),
.ht_s_axis_read_cmd_tdata(ht_s_axis_read_cmd_tdata),
//read status
.ht_m_axis_read_sts_tvalid(ht_m_axis_read_sts_tvalid),
.ht_m_axis_read_sts_tready(ht_m_axis_read_sts_tready),
.ht_m_axis_read_sts_tdata(ht_m_axis_read_sts_tdata),
//read stream
.ht_m_axis_read_tdata(ht_m_axis_read_tdata),
.ht_m_axis_read_tkeep(ht_m_axis_read_tkeep),
.ht_m_axis_read_tlast(ht_m_axis_read_tlast),
.ht_m_axis_read_tvalid(ht_m_axis_read_tvalid),
.ht_m_axis_read_tready(ht_m_axis_read_tready),
//write commands
.ht_s_axis_write_cmd_tvalid(ht_s_axis_write_cmd_tvalid),
.ht_s_axis_write_cmd_tready(ht_s_axis_write_cmd_tready),
.ht_s_axis_write_cmd_tdata(ht_s_axis_write_cmd_tdata),
//write status
.ht_m_axis_write_sts_tvalid(ht_m_axis_write_sts_tvalid),
.ht_m_axis_write_sts_tready(ht_m_axis_write_sts_tready),
.ht_m_axis_write_sts_tdata(ht_m_axis_write_sts_tdata),
//write stream
.ht_s_axis_write_tdata(ht_s_axis_write_tdata),
.ht_s_axis_write_tkeep(ht_s_axis_write_tkeep),
.ht_s_axis_write_tlast(ht_s_axis_write_tlast),
.ht_s_axis_write_tvalid(ht_s_axis_write_tvalid),
.ht_s_axis_write_tready(ht_s_axis_write_tready),
//upd stream interface signals
.upd_s_axis_read_cmd_tvalid(upd_s_axis_read_cmd_tvalid),
.upd_s_axis_read_cmd_tready(upd_s_axis_read_cmd_tready),
.upd_s_axis_read_cmd_tdata(upd_s_axis_read_cmd_tdata),
//read status
.upd_m_axis_read_sts_tvalid(upd_m_axis_read_sts_tvalid),
.upd_m_axis_read_sts_tready(upd_m_axis_read_sts_tready),
.upd_m_axis_read_sts_tdata(upd_m_axis_read_sts_tdata),
//read stream
.upd_m_axis_read_tdata(upd_m_axis_read_tdata),
.upd_m_axis_read_tkeep(upd_m_axis_read_tkeep),
.upd_m_axis_read_tlast(upd_m_axis_read_tlast),
.upd_m_axis_read_tvalid(upd_m_axis_read_tvalid),
.upd_m_axis_read_tready(upd_m_axis_read_tready),
//write commands
.upd_s_axis_write_cmd_tvalid(upd_s_axis_write_cmd_tvalid),
.upd_s_axis_write_cmd_tready(upd_s_axis_write_cmd_tready),
.upd_s_axis_write_cmd_tdata(upd_s_axis_write_cmd_tdata),
//write status
.upd_m_axis_write_sts_tvalid(upd_m_axis_write_sts_tvalid),
.upd_m_axis_write_sts_tready(upd_m_axis_write_sts_tready),
.upd_m_axis_write_sts_tdata(upd_m_axis_write_sts_tdata),
//write stream
.upd_s_axis_write_tdata(upd_s_axis_write_tdata),
.upd_s_axis_write_tkeep(upd_s_axis_write_tkeep),
.upd_s_axis_write_tlast(upd_s_axis_write_tlast),
.upd_s_axis_write_tvalid(upd_s_axis_write_tvalid),
.upd_s_axis_write_tready(upd_s_axis_write_tready)
);
assign usr_led[0] = init_calib_complete;
assign usr_led[1] = perst_n & pok_dram;
assign usr_led[2] = app_start;
assign usr_led[5:3] = 0;
/*
always@ (posedge axi_clk)
begin
 if (toeRX_s_axis_write_cmd_tvalid == 1)
    wrCmdCounter = wrCmdCounter + 1;
end
always@ (posedge axi_clk)
begin
 if (toeRX_s_axis_read_cmd_tvalid == 1)
    rdCmdCounter = rdCmdCounter + 1;
end
always@ (posedge axi_clk)
begin
 if (axis_read_package_TVALID == 1)
    rdAppCounter = rdAppCounter + 1;
end*/
/*dataIla rxWrIla (
	.clk(axi_clk), // input wire clk
	.probe0(axis_rxwrite_data_TREADY), // input wire [0:0]  probe0
	.probe1(axis_rxwrite_data_TVALID), // input wire [0:0]  probe1
	.probe2(axis_rxwrite_data_TLAST), // input wire [0:0]  probe2
	.probe3(wrCmdCounter)
);
cmdIla rxWrCmdIla (
	.clk(axi_clk), // input wire clk
	.probe0(axis_rxwrite_cmd_TDATA), // input wire [71:0]  probe0
	.probe1(axis_rxwrite_cmd_TVALID), // input wire [0:0]  probe1
	.probe2(axis_rxwrite_cmd_TREADY), // input wire [0:0]  probe2
	.probe3(wrCmdCounter)
);
stsIla rxWrStatusIla (
	.clk(axi_clk), // input wire clk
	.probe0(axis_rxwrite_sts_TDATA), // input wire [7:0]  probe0
	.probe1(1'b0), // input wire [0:0]  probe1
	.probe2(axis_rxwrite_sts_TVALID) // input wire [0:0]  probe2
);*/
/*
sessionIla sessionProbe (
	.clk(axi_clk), // input wire clk
	.probe0(regSessionCount), // input wire [15:0]  probe0
	.probe1(relSessionCount) // input wire [15:0]  probe1
);
slupIla slupProbe (
	.clk(axi_clk), // input wire clk
	.probe0(upd_req_TVALID_out), // input wire [0:0]  probe0
	.probe1(upd_req_TREADY_out), // input wire [0:0]  probe1
	.probe2(upd_req_TDATA_out), // input wire [0:0]  probe2
	.probe3(upd_rsp_TVALID_out), // input wire [0:0]  probe3
	.probe4(upd_rsp_TREADY_out) // input wire [0:0]  probe4
);*/
endmodule