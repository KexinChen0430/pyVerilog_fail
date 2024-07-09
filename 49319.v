module pwm_audio
   (JC_IBUF,
    INTERNAL_RST_reg,
    ETH_CLK_OBUF);
  output [0:0]JC_IBUF;
  input INTERNAL_RST_reg;
  input ETH_CLK_OBUF;
  wire \COUNT[10]_i_2_n_0 ;
  wire \COUNT[10]_i_4_n_0 ;
  wire \COUNT[10]_i_5_n_0 ;
  wire \COUNT[10]_i_6_n_0 ;
  wire \COUNT[9]_i_2_n_0 ;
  wire [10:0]COUNT_reg__0;
  wire ETH_CLK_OBUF;
  wire INTERNAL_RST_reg;
  wire [0:0]JC_IBUF;
  wire STATE;
  wire STATE_i_1_n_0;
  wire STATE_reg_n_0;
  wire S_DATA_IN_ACK_i_1_n_0;
  wire [10:0]p_0_in;
  (* SOFT_HLUTNM = "soft_lutpair239" *)
  LUT1 #(
    .INIT(2'h1))
    \COUNT[0]_i_1__4
       (.I0(COUNT_reg__0[0]),
        .O(p_0_in[0]));
  LUT2 #(
    .INIT(4'h2))
    \COUNT[10]_i_1
       (.I0(JC_IBUF),
        .I1(STATE_reg_n_0),
        .O(STATE));
  LUT2 #(
    .INIT(4'h2))
    \COUNT[10]_i_2
       (.I0(STATE_reg_n_0),
        .I1(\COUNT[10]_i_4_n_0 ),
        .O(\COUNT[10]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A))
    \COUNT[10]_i_3
       (.I0(COUNT_reg__0[10]),
        .I1(\COUNT[10]_i_5_n_0 ),
        .I2(COUNT_reg__0[9]),
        .O(p_0_in[10]));
  LUT6 #(
    .INIT(64'h0000800000000000))
    \COUNT[10]_i_4
       (.I0(COUNT_reg__0[2]),
        .I1(COUNT_reg__0[3]),
        .I2(COUNT_reg__0[6]),
        .I3(COUNT_reg__0[5]),
        .I4(COUNT_reg__0[7]),
        .I5(\COUNT[10]_i_6_n_0 ),
        .O(\COUNT[10]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h80000000))
    \COUNT[10]_i_5
       (.I0(COUNT_reg__0[8]),
        .I1(COUNT_reg__0[7]),
        .I2(\COUNT[9]_i_2_n_0 ),
        .I3(COUNT_reg__0[6]),
        .I4(COUNT_reg__0[5]),
        .O(\COUNT[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004))
    \COUNT[10]_i_6
       (.I0(COUNT_reg__0[9]),
        .I1(COUNT_reg__0[10]),
        .I2(COUNT_reg__0[4]),
        .I3(COUNT_reg__0[8]),
        .I4(COUNT_reg__0[0]),
        .I5(COUNT_reg__0[1]),
        .O(\COUNT[10]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair239" *)
  LUT2 #(
    .INIT(4'h6))
    \COUNT[1]_i_1__4
       (.I0(COUNT_reg__0[0]),
        .I1(COUNT_reg__0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair238" *)
  LUT3 #(
    .INIT(8'h78))
    \COUNT[2]_i_1__3
       (.I0(COUNT_reg__0[0]),
        .I1(COUNT_reg__0[1]),
        .I2(COUNT_reg__0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair238" *)
  LUT4 #(
    .INIT(16'h6AAA))
    \COUNT[3]_i_1__2
       (.I0(COUNT_reg__0[3]),
        .I1(COUNT_reg__0[0]),
        .I2(COUNT_reg__0[1]),
        .I3(COUNT_reg__0[2]),
        .O(p_0_in[3]));
  LUT5 #(
    .INIT(32'h7FFF8000))
    \COUNT[4]_i_1__2
       (.I0(COUNT_reg__0[1]),
        .I1(COUNT_reg__0[0]),
        .I2(COUNT_reg__0[3]),
        .I3(COUNT_reg__0[2]),
        .I4(COUNT_reg__0[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA))
    \COUNT[5]_i_1__2
       (.I0(COUNT_reg__0[5]),
        .I1(COUNT_reg__0[1]),
        .I2(COUNT_reg__0[0]),
        .I3(COUNT_reg__0[3]),
        .I4(COUNT_reg__0[2]),
        .I5(COUNT_reg__0[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair237" *)
  LUT3 #(
    .INIT(8'h6A))
    \COUNT[6]_i_1__2
       (.I0(COUNT_reg__0[6]),
        .I1(\COUNT[9]_i_2_n_0 ),
        .I2(COUNT_reg__0[5]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair237" *)
  LUT4 #(
    .INIT(16'h6AAA))
    \COUNT[7]_i_1__2
       (.I0(COUNT_reg__0[7]),
        .I1(COUNT_reg__0[5]),
        .I2(COUNT_reg__0[6]),
        .I3(\COUNT[9]_i_2_n_0 ),
        .O(p_0_in[7]));
  LUT5 #(
    .INIT(32'h6AAAAAAA))
    \COUNT[8]_i_1
       (.I0(COUNT_reg__0[8]),
        .I1(COUNT_reg__0[7]),
        .I2(\COUNT[9]_i_2_n_0 ),
        .I3(COUNT_reg__0[6]),
        .I4(COUNT_reg__0[5]),
        .O(p_0_in[8]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA))
    \COUNT[9]_i_1
       (.I0(COUNT_reg__0[9]),
        .I1(COUNT_reg__0[5]),
        .I2(COUNT_reg__0[6]),
        .I3(\COUNT[9]_i_2_n_0 ),
        .I4(COUNT_reg__0[7]),
        .I5(COUNT_reg__0[8]),
        .O(p_0_in[9]));
  LUT5 #(
    .INIT(32'h80000000))
    \COUNT[9]_i_2
       (.I0(COUNT_reg__0[4]),
        .I1(COUNT_reg__0[2]),
        .I2(COUNT_reg__0[3]),
        .I3(COUNT_reg__0[0]),
        .I4(COUNT_reg__0[1]),
        .O(\COUNT[9]_i_2_n_0 ));
  FDRE \COUNT_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[0]),
        .Q(COUNT_reg__0[0]),
        .R(STATE));
  FDRE \COUNT_reg[10]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[10]),
        .Q(COUNT_reg__0[10]),
        .R(STATE));
  FDRE \COUNT_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[1]),
        .Q(COUNT_reg__0[1]),
        .R(STATE));
  FDRE \COUNT_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[2]),
        .Q(COUNT_reg__0[2]),
        .R(STATE));
  FDRE \COUNT_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[3]),
        .Q(COUNT_reg__0[3]),
        .R(STATE));
  FDRE \COUNT_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[4]),
        .Q(COUNT_reg__0[4]),
        .R(STATE));
  FDRE \COUNT_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[5]),
        .Q(COUNT_reg__0[5]),
        .R(STATE));
  FDRE \COUNT_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[6]),
        .Q(COUNT_reg__0[6]),
        .R(STATE));
  FDRE \COUNT_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[7]),
        .Q(COUNT_reg__0[7]),
        .R(STATE));
  FDRE \COUNT_reg[8]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[8]),
        .Q(COUNT_reg__0[8]),
        .R(STATE));
  FDRE \COUNT_reg[9]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[10]_i_2_n_0 ),
        .D(p_0_in[9]),
        .Q(COUNT_reg__0[9]),
        .R(STATE));
  LUT3 #(
    .INIT(8'h4E))
    STATE_i_1
       (.I0(STATE_reg_n_0),
        .I1(JC_IBUF),
        .I2(\COUNT[10]_i_4_n_0 ),
        .O(STATE_i_1_n_0));
  FDRE STATE_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(STATE_i_1_n_0),
        .Q(STATE_reg_n_0),
        .R(INTERNAL_RST_reg));
  LUT3 #(
    .INIT(8'h09))
    S_DATA_IN_ACK_i_1
       (.I0(STATE_reg_n_0),
        .I1(JC_IBUF),
        .I2(INTERNAL_RST_reg),
        .O(S_DATA_IN_ACK_i_1_n_0));
  FDRE S_DATA_IN_ACK_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(S_DATA_IN_ACK_i_1_n_0),
        .Q(JC_IBUF),
        .R(1'b0));
endmodule