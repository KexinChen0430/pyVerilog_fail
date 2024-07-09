module cdn_axi_bfm_0 (m_axis_aclk, m_axis_aresetn,
                                   m_axis_tvalid, m_axis_tready, m_axis_tdata,
m_axis_tkeep,m_axis_tid,m_axis_tdest,m_axis_tuser, m_axis_tlast);
   parameter C_M_AXIS_NAME = "cdn_axi_bfm_0";
   parameter C_M_AXIS_TDATA_WIDTH = 24;
   parameter C_M_AXIS_TID_WIDTH   = 8;
   parameter C_M_AXIS_TDEST_WIDTH = 4;
   parameter C_M_AXIS_TUSER_WIDTH = 8;
   parameter C_M_AXIS_MAX_PACKET_SIZE = 10;
   parameter C_M_AXIS_MAX_OUTSTANDING_TRANSACTIONS = 8;
   parameter C_INTERCONNECT_M_AXIS_WRITE_ISSUING = 8;
   parameter C_M_AXIS_STROBE_NOT_USED = 1;
   parameter C_M_AXIS_KEEP_NOT_USED = 0;
// Signal Definitions
// Global Clock Input. All signals are sampled on the rising edge.
input wire m_axis_aclk;
// Internal Clock created by delaying the input clock and used for sampling
// and driving input and output signals respectively to avoid race conditions.
//wire bfm_aclk;
// Global Reset Input. Active Low.
input wire m_axis_aresetn;
// Transfer Channel Signals.
output wire                                m_axis_tvalid; // Master Transfer Valid.
input  wire                                m_axis_tready; // Slave Transfer Ready.
output wire [C_M_AXIS_TDATA_WIDTH-1:0]     m_axis_tdata;  // Master Transfer Data.
output wire [(C_M_AXIS_TDATA_WIDTH/8)-1:0] m_axis_tkeep;  // Master Transfer Keep.
output wire                                m_axis_tlast;  // Master Transfer Last Flag.
output wire [C_M_AXIS_TID_WIDTH-1:0]       m_axis_tid;    // Master Transfer ID Tag.
output wire [C_M_AXIS_TDEST_WIDTH-1:0]     m_axis_tdest;  // Master Transfer Destination.
output wire [C_M_AXIS_TUSER_WIDTH-1:0]     m_axis_tuser;  // Master Transfer User Defined.
cdn_axi4_streaming_master_bfm #(.NAME(C_M_AXIS_NAME),
                                .DATA_BUS_WIDTH(C_M_AXIS_TDATA_WIDTH),
                                .ID_BUS_WIDTH(C_M_AXIS_TID_WIDTH),
                                .DEST_BUS_WIDTH(C_M_AXIS_TDEST_WIDTH),
                                .USER_BUS_WIDTH(C_M_AXIS_TUSER_WIDTH),
                                .MAX_PACKET_SIZE(C_M_AXIS_MAX_PACKET_SIZE),
                                .MAX_OUTSTANDING_TRANSACTIONS(C_M_AXIS_MAX_OUTSTANDING_TRANSACTIONS),
                                .STROBE_NOT_USED(C_M_AXIS_STROBE_NOT_USED),
                                .KEEP_NOT_USED(C_M_AXIS_KEEP_NOT_USED)
                               )
cdn_axi4_streaming_master_bfm_inst(.ACLK(m_axis_aclk),
                                   .ARESETn(m_axis_aresetn),
                                   .TVALID(m_axis_tvalid),
                                   .TREADY(m_axis_tready),
                                   .TDATA(m_axis_tdata),
                                   .TKEEP(m_axis_tkeep),
                                   .TID(m_axis_tid),
                                   .TDEST(m_axis_tdest),
                                   .TUSER(m_axis_tuser),
                                   .TLAST(m_axis_tlast)
                              );
// These runtime parameters are set based on selection in GUI
// All these parameters can be changed during the runtime in the TB also
initial
begin
cdn_axi4_streaming_master_bfm_inst.set_response_timeout(500);
cdn_axi4_streaming_master_bfm_inst.set_clear_signals_after_handshake(0);
cdn_axi4_streaming_master_bfm_inst.set_stop_on_error(1);
cdn_axi4_streaming_master_bfm_inst.set_channel_level_info(0);
cdn_axi4_streaming_master_bfm_inst.set_packet_transfer_gap(0);
cdn_axi4_streaming_master_bfm_inst.set_task_call_and_reset_handling(0);
cdn_axi4_streaming_master_bfm_inst.set_input_signal_delay(0);
end
endmodule