module read_netlist_v8_0 #(
      parameter C_AXI_TYPE                 = 1,
      parameter C_ADDRB_WIDTH              = 12
      ) ( S_AXI_R_LAST_INT, S_ACLK, S_ARESETN, S_AXI_ARVALID,
          S_AXI_RREADY,S_AXI_INCR_ADDR,S_AXI_ADDR_EN,
          S_AXI_SINGLE_TRANS,S_AXI_MUX_SEL, S_AXI_R_LAST, S_AXI_ARREADY,
          S_AXI_RLAST, S_AXI_RVALID, S_AXI_RD_EN, S_AXI_ARLEN);
    input S_AXI_R_LAST_INT;
    input S_ACLK;
    input S_ARESETN;
    input S_AXI_ARVALID;
    input S_AXI_RREADY;
    output S_AXI_INCR_ADDR;
    output S_AXI_ADDR_EN;
    output S_AXI_SINGLE_TRANS;
    output S_AXI_MUX_SEL;
    output S_AXI_R_LAST;
    output S_AXI_ARREADY;
    output S_AXI_RLAST;
    output S_AXI_RVALID;
    output S_AXI_RD_EN;
    input [7:0] S_AXI_ARLEN;
  wire present_state_FSM_FFd1_13 ;
  wire present_state_FSM_FFd2_14 ;
  wire gaxi_full_sm_outstanding_read_r_15 ;
  wire gaxi_full_sm_ar_ready_r_16 ;
  wire gaxi_full_sm_r_last_r_17 ;
  wire NlwRenamedSig_OI_gaxi_full_sm_r_valid_r ;
  wire gaxi_full_sm_r_valid_c ;
  wire S_AXI_RREADY_gaxi_full_sm_r_valid_r_OR_9_o ;
  wire gaxi_full_sm_ar_ready_c ;
  wire gaxi_full_sm_outstanding_read_c ;
  wire NlwRenamedSig_OI_S_AXI_R_LAST ;
  wire S_AXI_ARLEN_7_GND_8_o_equal_1_o ;
  wire present_state_FSM_FFd2_In ;
  wire present_state_FSM_FFd1_In ;
  wire Mmux_S_AXI_R_LAST13 ;
  wire N01 ;
  wire N2 ;
  wire Mmux_gaxi_full_sm_ar_ready_c11 ;
  wire N4 ;
  wire N8 ;
  wire N9 ;
  wire N10 ;
  wire N11 ;
  wire N12 ;
  wire N13 ;
  assign
  S_AXI_R_LAST = NlwRenamedSig_OI_S_AXI_R_LAST,
  S_AXI_ARREADY = gaxi_full_sm_ar_ready_r_16,
  S_AXI_RLAST = gaxi_full_sm_r_last_r_17,
  S_AXI_RVALID = NlwRenamedSig_OI_gaxi_full_sm_r_valid_r;
  beh_vlog_ff_clr_v8_0 #(
      .INIT (1'b0))
  gaxi_full_sm_outstanding_read_r (
      .C (S_ACLK),
      .CLR(S_ARESETN),
      .D(gaxi_full_sm_outstanding_read_c),
      .Q(gaxi_full_sm_outstanding_read_r_15)
    );
  beh_vlog_ff_ce_clr_v8_0 #(
      .INIT (1'b0))
  gaxi_full_sm_r_valid_r (
      .C (S_ACLK),
      .CE (S_AXI_RREADY_gaxi_full_sm_r_valid_r_OR_9_o),
      .CLR (S_ARESETN),
      .D (gaxi_full_sm_r_valid_c),
      .Q (NlwRenamedSig_OI_gaxi_full_sm_r_valid_r)
    );
  beh_vlog_ff_clr_v8_0 #(
      .INIT (1'b0))
  gaxi_full_sm_ar_ready_r (
      .C (S_ACLK),
      .CLR (S_ARESETN),
      .D (gaxi_full_sm_ar_ready_c),
      .Q (gaxi_full_sm_ar_ready_r_16)
    );
  beh_vlog_ff_ce_clr_v8_0 #(
      .INIT(1'b0))
  gaxi_full_sm_r_last_r (
      .C (S_ACLK),
      .CE (S_AXI_RREADY_gaxi_full_sm_r_valid_r_OR_9_o),
      .CLR (S_ARESETN),
      .D (NlwRenamedSig_OI_S_AXI_R_LAST),
      .Q (gaxi_full_sm_r_last_r_17)
    );
  beh_vlog_ff_clr_v8_0 #(
      .INIT (1'b0))
  present_state_FSM_FFd2 (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( present_state_FSM_FFd2_In),
      .Q ( present_state_FSM_FFd2_14)
    );
  beh_vlog_ff_clr_v8_0 #(
      .INIT (1'b0))
  present_state_FSM_FFd1 (
      .C (S_ACLK),
      .CLR (S_ARESETN),
      .D (present_state_FSM_FFd1_In),
      .Q (present_state_FSM_FFd1_13)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h000000000000000B))
  S_AXI_RREADY_gaxi_full_sm_r_valid_r_OR_9_o1 (
      .I0 ( S_AXI_RREADY),
      .I1 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I2 (1'b0),
      .I3 (1'b0),
      .I4 (1'b0),
      .I5 (1'b0),
      .O (S_AXI_RREADY_gaxi_full_sm_r_valid_r_OR_9_o)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h0000000000000008))
  Mmux_S_AXI_SINGLE_TRANS11 (
      .I0 (S_AXI_ARVALID),
      .I1 (S_AXI_ARLEN_7_GND_8_o_equal_1_o),
      .I2 (1'b0),
      .I3 (1'b0),
      .I4 (1'b0),
      .I5 (1'b0),
      .O (S_AXI_SINGLE_TRANS)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h0000000000000004))
  Mmux_S_AXI_ADDR_EN11 (
      .I0 (present_state_FSM_FFd1_13),
      .I1 (S_AXI_ARVALID),
      .I2 (1'b0),
      .I3 (1'b0),
      .I4 (1'b0),
      .I5 (1'b0),
      .O (S_AXI_ADDR_EN)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'hECEE2022EEEE2022))
  present_state_FSM_FFd2_In1 (
      .I0 ( S_AXI_ARVALID),
      .I1 ( present_state_FSM_FFd1_13),
      .I2 ( S_AXI_RREADY),
      .I3 ( S_AXI_ARLEN_7_GND_8_o_equal_1_o),
      .I4 ( present_state_FSM_FFd2_14),
      .I5 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .O ( present_state_FSM_FFd2_In)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h0000000044440444))
  Mmux_S_AXI_R_LAST131 (
      .I0 ( present_state_FSM_FFd1_13),
      .I1 ( S_AXI_ARVALID),
      .I2 ( present_state_FSM_FFd2_14),
      .I3 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I4 ( S_AXI_RREADY),
      .I5 (1'b0),
      .O ( Mmux_S_AXI_R_LAST13)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h4000FFFF40004000))
  Mmux_S_AXI_INCR_ADDR11 (
      .I0 ( S_AXI_R_LAST_INT),
      .I1 ( S_AXI_RREADY_gaxi_full_sm_r_valid_r_OR_9_o),
      .I2 ( present_state_FSM_FFd2_14),
      .I3 ( present_state_FSM_FFd1_13),
      .I4 ( S_AXI_ARLEN_7_GND_8_o_equal_1_o),
      .I5 ( Mmux_S_AXI_R_LAST13),
      .O ( S_AXI_INCR_ADDR)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h00000000000000FE))
  S_AXI_ARLEN_7_GND_8_o_equal_1_o_7_SW0 (
      .I0 ( S_AXI_ARLEN[2]),
      .I1 ( S_AXI_ARLEN[1]),
      .I2 ( S_AXI_ARLEN[0]),
      .I3 ( 1'b0),
      .I4 ( 1'b0),
      .I5 ( 1'b0),
      .O ( N01)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h0000000000000001))
  S_AXI_ARLEN_7_GND_8_o_equal_1_o_7_Q (
      .I0 ( S_AXI_ARLEN[7]),
      .I1 ( S_AXI_ARLEN[6]),
      .I2 ( S_AXI_ARLEN[5]),
      .I3 ( S_AXI_ARLEN[4]),
      .I4 ( S_AXI_ARLEN[3]),
      .I5 ( N01),
      .O ( S_AXI_ARLEN_7_GND_8_o_equal_1_o)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h0000000000000007))
  Mmux_gaxi_full_sm_outstanding_read_c1_SW0 (
      .I0 ( S_AXI_ARVALID),
      .I1 ( S_AXI_ARLEN_7_GND_8_o_equal_1_o),
      .I2 ( 1'b0),
      .I3 ( 1'b0),
      .I4 ( 1'b0),
      .I5 ( 1'b0),
      .O ( N2)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h0020000002200200))
  Mmux_gaxi_full_sm_outstanding_read_c1 (
      .I0 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I1 ( S_AXI_RREADY),
      .I2 ( present_state_FSM_FFd1_13),
      .I3 ( present_state_FSM_FFd2_14),
      .I4 ( gaxi_full_sm_outstanding_read_r_15),
      .I5 ( N2),
      .O ( gaxi_full_sm_outstanding_read_c)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h0000000000004555))
  Mmux_gaxi_full_sm_ar_ready_c12 (
      .I0 ( S_AXI_ARVALID),
      .I1 ( S_AXI_RREADY),
      .I2 ( present_state_FSM_FFd2_14),
      .I3 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I4 ( 1'b0),
      .I5 ( 1'b0),
      .O ( Mmux_gaxi_full_sm_ar_ready_c11)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h00000000000000EF))
  Mmux_S_AXI_R_LAST11_SW0 (
      .I0 ( S_AXI_ARLEN_7_GND_8_o_equal_1_o),
      .I1 ( S_AXI_RREADY),
      .I2 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I3 ( 1'b0),
      .I4 ( 1'b0),
      .I5 ( 1'b0),
      .O ( N4)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'hFCAAFC0A00AA000A))
  Mmux_S_AXI_R_LAST11 (
      .I0 ( S_AXI_ARVALID),
      .I1 ( gaxi_full_sm_outstanding_read_r_15),
      .I2 ( present_state_FSM_FFd2_14),
      .I3 ( present_state_FSM_FFd1_13),
      .I4 ( N4),
      .I5 ( S_AXI_RREADY_gaxi_full_sm_r_valid_r_OR_9_o),
      .O ( gaxi_full_sm_r_valid_c)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h00000000AAAAAA08))
  S_AXI_MUX_SEL1 (
      .I0 (present_state_FSM_FFd1_13),
      .I1 (NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I2 (S_AXI_RREADY),
      .I3 (present_state_FSM_FFd2_14),
      .I4 (gaxi_full_sm_outstanding_read_r_15),
      .I5 (1'b0),
      .O (S_AXI_MUX_SEL)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'hF3F3F755A2A2A200))
  Mmux_S_AXI_RD_EN11 (
      .I0 ( present_state_FSM_FFd1_13),
      .I1 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I2 ( S_AXI_RREADY),
      .I3 ( gaxi_full_sm_outstanding_read_r_15),
      .I4 ( present_state_FSM_FFd2_14),
      .I5 ( S_AXI_ARVALID),
      .O ( S_AXI_RD_EN)
    );
  beh_vlog_muxf7_v8_0 present_state_FSM_FFd1_In3 (
      .I0 ( N8),
      .I1 ( N9),
      .S ( present_state_FSM_FFd1_13),
      .O ( present_state_FSM_FFd1_In)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h000000005410F4F0))
  present_state_FSM_FFd1_In3_F (
      .I0 ( S_AXI_RREADY),
      .I1 ( present_state_FSM_FFd2_14),
      .I2 ( S_AXI_ARVALID),
      .I3 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I4 ( S_AXI_ARLEN_7_GND_8_o_equal_1_o),
      .I5 ( 1'b0),
      .O ( N8)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h0000000072FF7272))
  present_state_FSM_FFd1_In3_G (
      .I0 ( present_state_FSM_FFd2_14),
      .I1 ( S_AXI_R_LAST_INT),
      .I2 ( gaxi_full_sm_outstanding_read_r_15),
      .I3 ( S_AXI_RREADY),
      .I4 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I5 ( 1'b0),
      .O ( N9)
    );
  beh_vlog_muxf7_v8_0 Mmux_gaxi_full_sm_ar_ready_c14 (
      .I0 ( N10),
      .I1 ( N11),
      .S ( present_state_FSM_FFd1_13),
      .O ( gaxi_full_sm_ar_ready_c)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h00000000FFFF88A8))
  Mmux_gaxi_full_sm_ar_ready_c14_F (
      .I0 ( S_AXI_ARLEN_7_GND_8_o_equal_1_o),
      .I1 ( S_AXI_RREADY),
      .I2 ( present_state_FSM_FFd2_14),
      .I3 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I4 ( Mmux_gaxi_full_sm_ar_ready_c11),
      .I5 ( 1'b0),
      .O ( N10)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h000000008D008D8D))
  Mmux_gaxi_full_sm_ar_ready_c14_G (
      .I0 ( present_state_FSM_FFd2_14),
      .I1 ( S_AXI_R_LAST_INT),
      .I2 ( gaxi_full_sm_outstanding_read_r_15),
      .I3 ( S_AXI_RREADY),
      .I4 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I5 ( 1'b0),
      .O ( N11)
    );
  beh_vlog_muxf7_v8_0 Mmux_S_AXI_R_LAST1 (
      .I0 ( N12),
      .I1 ( N13),
      .S ( present_state_FSM_FFd1_13),
      .O ( NlwRenamedSig_OI_S_AXI_R_LAST)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h0000000088088888))
  Mmux_S_AXI_R_LAST1_F (
      .I0 ( S_AXI_ARLEN_7_GND_8_o_equal_1_o),
      .I1 ( S_AXI_ARVALID),
      .I2 ( present_state_FSM_FFd2_14),
      .I3 ( S_AXI_RREADY),
      .I4 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I5 ( 1'b0),
      .O ( N12)
    );
  STATE_LOGIC_v8_0 #(
      .INIT (64'h00000000E400E4E4))
  Mmux_S_AXI_R_LAST1_G (
      .I0 ( present_state_FSM_FFd2_14),
      .I1 ( gaxi_full_sm_outstanding_read_r_15),
      .I2 ( S_AXI_R_LAST_INT),
      .I3 ( S_AXI_RREADY),
      .I4 ( NlwRenamedSig_OI_gaxi_full_sm_r_valid_r),
      .I5 ( 1'b0),
      .O ( N13)
    );
endmodule