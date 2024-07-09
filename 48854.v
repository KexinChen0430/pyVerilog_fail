module will be replaced with the nf10 "data plane"
// + The 128b of TUSER are assigned as follows:
// TUSER[15:0]   Transfer Length in Bytes  (provided by OPED AXIS Master; ignored by OPED AXIS Slave since TLAST implicit length)
// TUSER[23:16]  Source Port (SPT) (provided by OPED AXIS Master from DP0 opcode; ignored by OPED AXIS Slave)
// TUSER[31:24]  Destination Port (DPT) (driven to 8'h01 by OPED AXIS Master;  used by OPED AXIS Slave to make DP1 opcode)
// TUSER[127:32] User metadata bits, un-used by OPED. driven to 0 by OPED AXIS master; un-used by OPED AXIS slave
// Note that OPED is "port-encoding-agnostic" with respect to the values on SPT and DPT:
//  a. In the case of packets moving downstream from host to NF10, OPED places DP0 opcode metadata on SPT
//  b. In the case of packets moving upstream from NF10 to host, OPED captures DPT and places it in DP1 opcode
//  The value 8'h01 is placed as a constant in the DPT output of the OPED AXIS Master
// Note that OPED does nothing with the TUSER[127:32] user metadata bits.
// a. It drives them to 0 on the AXIS Master
// b. it ignores them on the the AXIS Slave
 AXIS_LOOPBACK axisLoopback (
  .ACLK              (ACLK),
  .ARESETN           (ARESETN),
  .S_AXIS_DAT_TDATA  (M_AXIS_DAT_TDATA),
  .S_AXIS_DAT_TVALID (M_AXIS_DAT_TVALID),
  .S_AXIS_DAT_TSTRB  (M_AXIS_DAT_TSTRB),
  .S_AXIS_DAT_TUSER  (M_AXIS_DAT_TUSER),
  .S_AXIS_DAT_TLAST  (M_AXIS_DAT_TLAST),
  .S_AXIS_DAT_TREADY (M_AXIS_DAT_TREADY),
  .M_AXIS_DAT_TDATA  (S_AXIS_DAT_TDATA),
  .M_AXIS_DAT_TVALID (S_AXIS_DAT_TVALID),
  .M_AXIS_DAT_TSTRB  (S_AXIS_DAT_TSTRB),
  .M_AXIS_DAT_TUSER  (S_AXIS_DAT_TUSER),
  .M_AXIS_DAT_TLAST  (S_AXIS_DAT_TLAST),
  .M_AXIS_DAT_TREADY (S_AXIS_DAT_TREADY)
);
/*
nf10_axis_converter
#(  .C_M_AXIS_DATA_WIDTH (64),
    .C_S_AXIS_DATA_WIDTH (256),
    .C_USER_WIDTH (128),
    .C_LEN_WIDTH (16),
    .C_SPT_WIDTH (8),
    .C_DPT_WIDTH (8),
    .C_DEFAULT_VALUE_ENABLE (0),
    .C_DEFAULT_SRC_PORT (0),
    .C_DEFAULT_DST_PORT (0))   conv_i0
(
    .axi_aclk      (ACLK),
    .axi_resetn    (ARESETN),
    .s_axis_tdata  (M_AXIS_DAT_TDATA),
    .s_axis_tstrb  (M_AXIS_DAT_TSTRB),
    .s_axis_tuser  (M_AXIS_DAT_TUSER),
    .s_axis_tvalid (M_AXIS_DAT_TVALID),
    .s_axis_tready (M_AXIS_DAT_TREADY),
    .s_axis_tlast  (M_AXIS_DAT_TLAST),
    .m_axis_tdata  (I_AXIS_DAT_TDATA),
    .m_axis_tstrb  (I_AXIS_DAT_TSTRB),
    .m_axis_tuser  (I_AXIS_DAT_TUSER),
    .m_axis_tvalid (I_AXIS_DAT_TVALID),
    .m_axis_tready (I_AXIS_DAT_TREADY),
    .m_axis_tlast  (I_AXIS_DAT_TLAST)
);
nf10_axis_converter
#(  .C_M_AXIS_DATA_WIDTH (256),
    .C_S_AXIS_DATA_WIDTH (64),
    .C_USER_WIDTH (128),
    .C_LEN_WIDTH (16),
    .C_SPT_WIDTH (8),
    .C_DPT_WIDTH (8),
    .C_DEFAULT_VALUE_ENABLE (0),
    .C_DEFAULT_SRC_PORT (0),
    .C_DEFAULT_DST_PORT (0)) conv_i1
(
    .axi_aclk      (ACLK),
    .axi_resetn    (ARESETN),
    .s_axis_tdata  (I_AXIS_DAT_TDATA),
    .s_axis_tstrb  (I_AXIS_DAT_TSTRB),
    .s_axis_tuser  (I_AXIS_DAT_TUSER),
    .s_axis_tvalid (I_AXIS_DAT_TVALID),
    .s_axis_tready (I_AXIS_DAT_TREADY),
    .s_axis_tlast  (I_AXIS_DAT_TLAST),
    .m_axis_tdata  (S_AXIS_DAT_TDATA),
    .m_axis_tstrb  (S_AXIS_DAT_TSTRB),
    .m_axis_tuser  (S_AXIS_DAT_TUSER),
    .m_axis_tvalid (S_AXIS_DAT_TVALID),
    .m_axis_tready (S_AXIS_DAT_TREADY),
    .m_axis_tlast  (S_AXIS_DAT_TLAST)
);
*/
endmodule