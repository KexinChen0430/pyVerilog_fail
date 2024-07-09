module write_netlist_v8_1
#(
   parameter	     C_AXI_TYPE = 0
 )
 (
    S_ACLK, S_ARESETN, S_AXI_AWVALID, S_AXI_WVALID, S_AXI_BREADY,
    w_last_c, bready_timeout_c, aw_ready_r, S_AXI_WREADY, S_AXI_BVALID,
    S_AXI_WR_EN, addr_en_c, incr_addr_c, bvalid_c
  );
    input S_ACLK;
    input S_ARESETN;
    input S_AXI_AWVALID;
    input S_AXI_WVALID;
    input S_AXI_BREADY;
    input w_last_c;
    input bready_timeout_c;
    output aw_ready_r;
    output S_AXI_WREADY;
    output S_AXI_BVALID;
    output S_AXI_WR_EN;
    output addr_en_c;
    output incr_addr_c;
    output bvalid_c;
 //AXI LITE
generate if (C_AXI_TYPE == 0 ) begin : gbeh_axi_lite_sm
  wire w_ready_r_7;
  wire w_ready_c;
  wire aw_ready_c;
  wire NlwRenamedSignal_bvalid_c;
  wire NlwRenamedSignal_incr_addr_c;
  wire present_state_FSM_FFd3_13;
  wire present_state_FSM_FFd2_14;
  wire present_state_FSM_FFd1_15;
  wire present_state_FSM_FFd4_16;
  wire present_state_FSM_FFd4_In;
  wire present_state_FSM_FFd3_In;
  wire present_state_FSM_FFd2_In;
  wire present_state_FSM_FFd1_In;
  wire present_state_FSM_FFd4_In1_21;
  wire [0:0] Mmux_aw_ready_c ;
begin
  assign
  S_AXI_WREADY = w_ready_r_7,
  S_AXI_BVALID = NlwRenamedSignal_incr_addr_c,
  S_AXI_WR_EN = NlwRenamedSignal_bvalid_c,
  incr_addr_c = NlwRenamedSignal_incr_addr_c,
  bvalid_c = NlwRenamedSignal_bvalid_c;
  assign NlwRenamedSignal_incr_addr_c = 1'b0;
  beh_vlog_ff_clr_v8_1 #(
      .INIT (1'b0))
  aw_ready_r_2 (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( aw_ready_c),
      .Q ( aw_ready_r)
    );
  beh_vlog_ff_clr_v8_1 #(
      .INIT (1'b0))
  w_ready_r (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( w_ready_c),
      .Q ( w_ready_r_7)
    );
  beh_vlog_ff_pre_v8_1  #(
      .INIT (1'b1))
  present_state_FSM_FFd4 (
      .C ( S_ACLK),
      .D ( present_state_FSM_FFd4_In),
      .PRE ( S_ARESETN),
      .Q ( present_state_FSM_FFd4_16)
    );
 beh_vlog_ff_clr_v8_1 #(
      .INIT (1'b0))
  present_state_FSM_FFd3 (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( present_state_FSM_FFd3_In),
      .Q ( present_state_FSM_FFd3_13)
    );
  beh_vlog_ff_clr_v8_1 #(
      .INIT (1'b0))
  present_state_FSM_FFd2 (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( present_state_FSM_FFd2_In),
      .Q ( present_state_FSM_FFd2_14)
    );
beh_vlog_ff_clr_v8_1 #(
      .INIT (1'b0))
  present_state_FSM_FFd1 (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( present_state_FSM_FFd1_In),
      .Q ( present_state_FSM_FFd1_15)
    );
STATE_LOGIC_v8_1 #(
      .INIT (64'h0000000055554440))
  present_state_FSM_FFd3_In1 (
      .I0 ( S_AXI_WVALID),
      .I1 ( S_AXI_AWVALID),
      .I2 ( present_state_FSM_FFd2_14),
      .I3 ( present_state_FSM_FFd4_16),
      .I4 ( present_state_FSM_FFd3_13),
      .I5 (1'b0),
      .O ( present_state_FSM_FFd3_In)
    );
STATE_LOGIC_v8_1 #(
      .INIT (64'h0000000088880800))
  present_state_FSM_FFd2_In1 (
      .I0 ( S_AXI_AWVALID),
      .I1 ( S_AXI_WVALID),
      .I2 ( bready_timeout_c),
      .I3 ( present_state_FSM_FFd2_14),
      .I4 ( present_state_FSM_FFd4_16),
      .I5 (1'b0),
      .O ( present_state_FSM_FFd2_In)
    );
STATE_LOGIC_v8_1 #(
      .INIT (64'h00000000AAAA2000))
  Mmux_addr_en_c_0_1 (
      .I0 ( S_AXI_AWVALID),
      .I1 ( bready_timeout_c),
      .I2 ( present_state_FSM_FFd2_14),
      .I3 ( S_AXI_WVALID),
      .I4 ( present_state_FSM_FFd4_16),
      .I5 (1'b0),
      .O ( addr_en_c)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'hF5F07570F5F05500))
  Mmux_w_ready_c_0_1 (
      .I0 ( S_AXI_WVALID),
      .I1 ( bready_timeout_c),
      .I2 ( S_AXI_AWVALID),
      .I3 ( present_state_FSM_FFd3_13),
      .I4 ( present_state_FSM_FFd4_16),
      .I5 ( present_state_FSM_FFd2_14),
      .O ( w_ready_c)
    );
STATE_LOGIC_v8_1 #(
      .INIT (64'h88808880FFFF8880))
  present_state_FSM_FFd1_In1 (
      .I0 ( S_AXI_WVALID),
      .I1 ( bready_timeout_c),
      .I2 ( present_state_FSM_FFd3_13),
      .I3 ( present_state_FSM_FFd2_14),
      .I4 ( present_state_FSM_FFd1_15),
      .I5 ( S_AXI_BREADY),
      .O ( present_state_FSM_FFd1_In)
    );
STATE_LOGIC_v8_1 #(
      .INIT (64'h00000000000000A8))
  Mmux_S_AXI_WR_EN_0_1 (
      .I0 ( S_AXI_WVALID),
      .I1 ( present_state_FSM_FFd2_14),
      .I2 ( present_state_FSM_FFd3_13),
      .I3 (1'b0),
      .I4 (1'b0),
      .I5 (1'b0),
      .O ( NlwRenamedSignal_bvalid_c)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h2F0F27072F0F2200))
  present_state_FSM_FFd4_In1 (
      .I0 ( S_AXI_WVALID),
      .I1 ( bready_timeout_c),
      .I2 ( S_AXI_AWVALID),
      .I3 ( present_state_FSM_FFd3_13),
      .I4 ( present_state_FSM_FFd4_16),
      .I5 ( present_state_FSM_FFd2_14),
      .O ( present_state_FSM_FFd4_In1_21)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h00000000000000F8))
  present_state_FSM_FFd4_In2 (
      .I0 ( present_state_FSM_FFd1_15),
      .I1 ( S_AXI_BREADY),
      .I2 ( present_state_FSM_FFd4_In1_21),
      .I3 (1'b0),
      .I4 (1'b0),
      .I5 (1'b0),
      .O ( present_state_FSM_FFd4_In)
    );
STATE_LOGIC_v8_1 #(
      .INIT (64'h7535753575305500))
  Mmux_aw_ready_c_0_1 (
      .I0 ( S_AXI_AWVALID),
      .I1 ( bready_timeout_c),
      .I2 ( S_AXI_WVALID),
      .I3 ( present_state_FSM_FFd4_16),
      .I4 ( present_state_FSM_FFd3_13),
      .I5 ( present_state_FSM_FFd2_14),
      .O ( Mmux_aw_ready_c[0])
    );
STATE_LOGIC_v8_1 #(
      .INIT (64'h00000000000000F8))
  Mmux_aw_ready_c_0_2 (
      .I0 ( present_state_FSM_FFd1_15),
      .I1 ( S_AXI_BREADY),
      .I2 ( Mmux_aw_ready_c[0]),
      .I3 (1'b0),
      .I4 (1'b0),
      .I5 (1'b0),
      .O ( aw_ready_c)
    );
end
end
endgenerate
  // AXI FULL
generate if (C_AXI_TYPE == 1 ) begin : gbeh_axi_full_sm
  wire w_ready_r_8;
  wire w_ready_c;
  wire aw_ready_c;
  wire NlwRenamedSig_OI_bvalid_c;
  wire present_state_FSM_FFd1_16;
  wire present_state_FSM_FFd4_17;
  wire present_state_FSM_FFd3_18;
  wire present_state_FSM_FFd2_19;
  wire present_state_FSM_FFd4_In;
  wire present_state_FSM_FFd3_In;
  wire present_state_FSM_FFd2_In;
  wire present_state_FSM_FFd1_In;
  wire present_state_FSM_FFd2_In1_24;
  wire present_state_FSM_FFd4_In1_25;
  wire N2;
  wire N4;
begin
assign
  S_AXI_WREADY = w_ready_r_8,
  bvalid_c = NlwRenamedSig_OI_bvalid_c,
  S_AXI_BVALID = 1'b0;
beh_vlog_ff_clr_v8_1 #(
      .INIT (1'b0))
  aw_ready_r_2
    (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( aw_ready_c),
      .Q ( aw_ready_r)
    );
beh_vlog_ff_clr_v8_1 #(
      .INIT (1'b0))
  w_ready_r
    (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( w_ready_c),
      .Q ( w_ready_r_8)
    );
 beh_vlog_ff_pre_v8_1  #(
      .INIT (1'b1))
  present_state_FSM_FFd4
    (
      .C ( S_ACLK),
      .D ( present_state_FSM_FFd4_In),
      .PRE ( S_ARESETN),
      .Q ( present_state_FSM_FFd4_17)
    );
beh_vlog_ff_clr_v8_1 #(
      .INIT (1'b0))
  present_state_FSM_FFd3
    (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( present_state_FSM_FFd3_In),
      .Q ( present_state_FSM_FFd3_18)
    );
beh_vlog_ff_clr_v8_1 #(
      .INIT (1'b0))
  present_state_FSM_FFd2
    (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( present_state_FSM_FFd2_In),
      .Q ( present_state_FSM_FFd2_19)
    );
 beh_vlog_ff_clr_v8_1 #(
      .INIT (1'b0))
  present_state_FSM_FFd1
    (
      .C ( S_ACLK),
      .CLR ( S_ARESETN),
      .D ( present_state_FSM_FFd1_In),
      .Q ( present_state_FSM_FFd1_16)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h0000000000005540))
  present_state_FSM_FFd3_In1
    (
      .I0 ( S_AXI_WVALID),
      .I1 ( present_state_FSM_FFd4_17),
      .I2 ( S_AXI_AWVALID),
      .I3 ( present_state_FSM_FFd3_18),
      .I4 (1'b0),
      .I5 (1'b0),
      .O ( present_state_FSM_FFd3_In)
    );
STATE_LOGIC_v8_1 #(
      .INIT (64'hBF3FBB33AF0FAA00))
  Mmux_aw_ready_c_0_2
    (
      .I0 ( S_AXI_BREADY),
      .I1 ( bready_timeout_c),
      .I2 ( S_AXI_AWVALID),
      .I3 ( present_state_FSM_FFd1_16),
      .I4 ( present_state_FSM_FFd4_17),
      .I5 ( NlwRenamedSig_OI_bvalid_c),
      .O ( aw_ready_c)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'hAAAAAAAA20000000))
  Mmux_addr_en_c_0_1
    (
      .I0 ( S_AXI_AWVALID),
      .I1 ( bready_timeout_c),
      .I2 ( present_state_FSM_FFd2_19),
      .I3 ( S_AXI_WVALID),
      .I4 ( w_last_c),
      .I5 ( present_state_FSM_FFd4_17),
      .O ( addr_en_c)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h00000000000000A8))
  Mmux_S_AXI_WR_EN_0_1
    (
      .I0 ( S_AXI_WVALID),
      .I1 ( present_state_FSM_FFd2_19),
      .I2 ( present_state_FSM_FFd3_18),
      .I3 (1'b0),
      .I4 (1'b0),
      .I5 (1'b0),
      .O ( S_AXI_WR_EN)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h0000000000002220))
  Mmux_incr_addr_c_0_1
    (
      .I0 ( S_AXI_WVALID),
      .I1 ( w_last_c),
      .I2 ( present_state_FSM_FFd2_19),
      .I3 ( present_state_FSM_FFd3_18),
      .I4 (1'b0),
      .I5 (1'b0),
      .O ( incr_addr_c)
    );
STATE_LOGIC_v8_1 #(
      .INIT (64'h0000000000008880))
  Mmux_aw_ready_c_0_11
    (
      .I0 ( S_AXI_WVALID),
      .I1 ( w_last_c),
      .I2 ( present_state_FSM_FFd2_19),
      .I3 ( present_state_FSM_FFd3_18),
      .I4 (1'b0),
      .I5 (1'b0),
      .O ( NlwRenamedSig_OI_bvalid_c)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h000000000000D5C0))
  present_state_FSM_FFd2_In1
    (
      .I0 ( w_last_c),
      .I1 ( S_AXI_AWVALID),
      .I2 ( present_state_FSM_FFd4_17),
      .I3 ( present_state_FSM_FFd3_18),
      .I4 (1'b0),
      .I5 (1'b0),
      .O ( present_state_FSM_FFd2_In1_24)
    );
STATE_LOGIC_v8_1 #(
      .INIT (64'hFFFFAAAA08AAAAAA))
  present_state_FSM_FFd2_In2
    (
      .I0 ( present_state_FSM_FFd2_19),
      .I1 ( S_AXI_AWVALID),
      .I2 ( bready_timeout_c),
      .I3 ( w_last_c),
      .I4 ( S_AXI_WVALID),
      .I5 ( present_state_FSM_FFd2_In1_24),
      .O ( present_state_FSM_FFd2_In)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h00C0004000C00000))
  present_state_FSM_FFd4_In1
    (
      .I0 ( S_AXI_AWVALID),
      .I1 ( w_last_c),
      .I2 ( S_AXI_WVALID),
      .I3 ( bready_timeout_c),
      .I4 ( present_state_FSM_FFd3_18),
      .I5 ( present_state_FSM_FFd2_19),
      .O ( present_state_FSM_FFd4_In1_25)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h00000000FFFF88F8))
  present_state_FSM_FFd4_In2
    (
      .I0 ( present_state_FSM_FFd1_16),
      .I1 ( S_AXI_BREADY),
      .I2 ( present_state_FSM_FFd4_17),
      .I3 ( S_AXI_AWVALID),
      .I4 ( present_state_FSM_FFd4_In1_25),
      .I5 (1'b0),
      .O ( present_state_FSM_FFd4_In)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h0000000000000007))
  Mmux_w_ready_c_0_SW0
    (
      .I0 ( w_last_c),
      .I1 ( S_AXI_WVALID),
      .I2 (1'b0),
      .I3 (1'b0),
      .I4 (1'b0),
      .I5 (1'b0),
      .O ( N2)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'hFABAFABAFAAAF000))
  Mmux_w_ready_c_0_Q
    (
      .I0 ( N2),
      .I1 ( bready_timeout_c),
      .I2 ( S_AXI_AWVALID),
      .I3 ( present_state_FSM_FFd4_17),
      .I4 ( present_state_FSM_FFd3_18),
      .I5 ( present_state_FSM_FFd2_19),
      .O ( w_ready_c)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h0000000000000008))
  Mmux_aw_ready_c_0_11_SW0
    (
      .I0 ( bready_timeout_c),
      .I1 ( S_AXI_WVALID),
      .I2 (1'b0),
      .I3 (1'b0),
      .I4 (1'b0),
      .I5 (1'b0),
      .O ( N4)
    );
 STATE_LOGIC_v8_1 #(
      .INIT (64'h88808880FFFF8880))
  present_state_FSM_FFd1_In1
    (
      .I0 ( w_last_c),
      .I1 ( N4),
      .I2 ( present_state_FSM_FFd2_19),
      .I3 ( present_state_FSM_FFd3_18),
      .I4 ( present_state_FSM_FFd1_16),
      .I5 ( S_AXI_BREADY),
      .O ( present_state_FSM_FFd1_In)
    );
end
end
endgenerate
endmodule