module serial_output
   (IN1_ACK,
    RS232_TX_OBUF,
    INTERNAL_RST_reg,
    ETH_CLK_OBUF,
    IN1_STB,
    Q);
  output IN1_ACK;
  output RS232_TX_OBUF;
  input INTERNAL_RST_reg;
  input ETH_CLK_OBUF;
  input IN1_STB;
  input [7:0]Q;
  wire [11:0]BAUD_COUNT;
  wire \BAUD_COUNT[11]_i_2__0_n_0 ;
  wire \BAUD_COUNT[11]_i_3__0_n_0 ;
  wire \BAUD_COUNT_reg[4]_i_2_n_0 ;
  wire \BAUD_COUNT_reg[8]_i_2_n_0 ;
  wire \BAUD_COUNT_reg_n_0_[0] ;
  wire \BAUD_COUNT_reg_n_0_[10] ;
  wire \BAUD_COUNT_reg_n_0_[11] ;
  wire \BAUD_COUNT_reg_n_0_[1] ;
  wire \BAUD_COUNT_reg_n_0_[2] ;
  wire \BAUD_COUNT_reg_n_0_[3] ;
  wire \BAUD_COUNT_reg_n_0_[4] ;
  wire \BAUD_COUNT_reg_n_0_[5] ;
  wire \BAUD_COUNT_reg_n_0_[6] ;
  wire \BAUD_COUNT_reg_n_0_[7] ;
  wire \BAUD_COUNT_reg_n_0_[8] ;
  wire \BAUD_COUNT_reg_n_0_[9] ;
  wire \DATA[7]_i_1_n_0 ;
  wire \DATA_reg_n_0_[0] ;
  wire ETH_CLK_OBUF;
  wire \FSM_sequential_STATE[0]_i_1_n_0 ;
  wire \FSM_sequential_STATE[1]_i_1_n_0 ;
  wire \FSM_sequential_STATE[2]_i_1_n_0 ;
  wire \FSM_sequential_STATE[3]_i_1_n_0 ;
  wire \FSM_sequential_STATE[3]_i_2_n_0 ;
  wire IN1_ACK;
  wire IN1_STB;
  wire INTERNAL_RST_reg;
  wire [7:0]Q;
  wire RS232_TX_OBUF;
  (* RTL_KEEP = "yes" *) wire [3:0]STATE;
  wire S_IN1_ACK1;
  wire S_IN1_ACK_i_1_n_0;
  wire TX_i_1_n_0;
  wire TX_i_3_n_0;
  wire TX_i_4_n_0;
  wire TX_i_5_n_0;
  wire TX_i_6_n_0;
  wire TX_reg_i_2_n_0;
  wire X16CLK_EN_i_1__0_n_0;
  wire X16CLK_EN_reg_n_0;
  wire [11:1]data0;
  wire p_0_in;
  wire p_1_in;
  wire p_2_in;
  wire p_3_in;
  wire p_4_in;
  wire p_5_in;
  wire p_6_in;
  wire [3:0]\NLW_BAUD_COUNT_reg[11]_i_4_CO_UNCONNECTED ;
  wire [3:3]\NLW_BAUD_COUNT_reg[11]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_BAUD_COUNT_reg[4]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_BAUD_COUNT_reg[8]_i_2_CO_UNCONNECTED ;
  LUT1 #(
    .INIT(2'h1))
    \BAUD_COUNT[0]_i_1
       (.I0(\BAUD_COUNT_reg_n_0_[0] ),
        .O(BAUD_COUNT[0]));
  (* SOFT_HLUTNM = "soft_lutpair69" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[10]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[10]),
        .O(BAUD_COUNT[10]));
  (* SOFT_HLUTNM = "soft_lutpair70" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[11]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[11]),
        .O(BAUD_COUNT[11]));
  LUT6 #(
    .INIT(64'hFFFFFEFFFFFFFFFF))
    \BAUD_COUNT[11]_i_2__0
       (.I0(\BAUD_COUNT_reg_n_0_[10] ),
        .I1(\BAUD_COUNT_reg_n_0_[9] ),
        .I2(\BAUD_COUNT_reg_n_0_[6] ),
        .I3(\BAUD_COUNT_reg_n_0_[7] ),
        .I4(\BAUD_COUNT_reg_n_0_[11] ),
        .I5(\BAUD_COUNT_reg_n_0_[5] ),
        .O(\BAUD_COUNT[11]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFDFFF))
    \BAUD_COUNT[11]_i_3__0
       (.I0(\BAUD_COUNT_reg_n_0_[8] ),
        .I1(\BAUD_COUNT_reg_n_0_[1] ),
        .I2(\BAUD_COUNT_reg_n_0_[4] ),
        .I3(\BAUD_COUNT_reg_n_0_[0] ),
        .I4(\BAUD_COUNT_reg_n_0_[2] ),
        .I5(\BAUD_COUNT_reg_n_0_[3] ),
        .O(\BAUD_COUNT[11]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[1]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[1]),
        .O(BAUD_COUNT[1]));
  (* SOFT_HLUTNM = "soft_lutpair66" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[2]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[2]),
        .O(BAUD_COUNT[2]));
  (* SOFT_HLUTNM = "soft_lutpair67" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[3]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[3]),
        .O(BAUD_COUNT[3]));
  (* SOFT_HLUTNM = "soft_lutpair67" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[4]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[4]),
        .O(BAUD_COUNT[4]));
  (* SOFT_HLUTNM = "soft_lutpair68" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[5]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[5]),
        .O(BAUD_COUNT[5]));
  (* SOFT_HLUTNM = "soft_lutpair65" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[6]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[6]),
        .O(BAUD_COUNT[6]));
  (* SOFT_HLUTNM = "soft_lutpair68" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[7]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[7]),
        .O(BAUD_COUNT[7]));
  (* SOFT_HLUTNM = "soft_lutpair69" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[8]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[8]),
        .O(BAUD_COUNT[8]));
  (* SOFT_HLUTNM = "soft_lutpair70" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[9]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .I2(data0[9]),
        .O(BAUD_COUNT[9]));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[0]),
        .Q(\BAUD_COUNT_reg_n_0_[0] ),
        .R(INTERNAL_RST_reg));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[10]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[10]),
        .Q(\BAUD_COUNT_reg_n_0_[10] ),
        .R(INTERNAL_RST_reg));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[11]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[11]),
        .Q(\BAUD_COUNT_reg_n_0_[11] ),
        .R(INTERNAL_RST_reg));
  CARRY4 \BAUD_COUNT_reg[11]_i_4
       (.CI(\BAUD_COUNT_reg[8]_i_2_n_0 ),
        .CO(\NLW_BAUD_COUNT_reg[11]_i_4_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_BAUD_COUNT_reg[11]_i_4_O_UNCONNECTED [3],data0[11:9]}),
        .S({1'b0,\BAUD_COUNT_reg_n_0_[11] ,\BAUD_COUNT_reg_n_0_[10] ,\BAUD_COUNT_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[1]),
        .Q(\BAUD_COUNT_reg_n_0_[1] ),
        .R(INTERNAL_RST_reg));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[2]),
        .Q(\BAUD_COUNT_reg_n_0_[2] ),
        .R(INTERNAL_RST_reg));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[3]),
        .Q(\BAUD_COUNT_reg_n_0_[3] ),
        .R(INTERNAL_RST_reg));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[4]),
        .Q(\BAUD_COUNT_reg_n_0_[4] ),
        .R(INTERNAL_RST_reg));
  CARRY4 \BAUD_COUNT_reg[4]_i_2
       (.CI(1'b0),
        .CO({\BAUD_COUNT_reg[4]_i_2_n_0 ,\NLW_BAUD_COUNT_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\BAUD_COUNT_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S({\BAUD_COUNT_reg_n_0_[4] ,\BAUD_COUNT_reg_n_0_[3] ,\BAUD_COUNT_reg_n_0_[2] ,\BAUD_COUNT_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[5]),
        .Q(\BAUD_COUNT_reg_n_0_[5] ),
        .R(INTERNAL_RST_reg));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[6]),
        .Q(\BAUD_COUNT_reg_n_0_[6] ),
        .R(INTERNAL_RST_reg));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[7]),
        .Q(\BAUD_COUNT_reg_n_0_[7] ),
        .R(INTERNAL_RST_reg));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[8]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[8]),
        .Q(\BAUD_COUNT_reg_n_0_[8] ),
        .R(INTERNAL_RST_reg));
  CARRY4 \BAUD_COUNT_reg[8]_i_2
       (.CI(\BAUD_COUNT_reg[4]_i_2_n_0 ),
        .CO({\BAUD_COUNT_reg[8]_i_2_n_0 ,\NLW_BAUD_COUNT_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S({\BAUD_COUNT_reg_n_0_[8] ,\BAUD_COUNT_reg_n_0_[7] ,\BAUD_COUNT_reg_n_0_[6] ,\BAUD_COUNT_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0))
    \BAUD_COUNT_reg[9]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[9]),
        .Q(\BAUD_COUNT_reg_n_0_[9] ),
        .R(INTERNAL_RST_reg));
  LUT6 #(
    .INIT(64'h0000000000001000))
    \DATA[7]_i_1
       (.I0(STATE[1]),
        .I1(STATE[3]),
        .I2(IN1_ACK),
        .I3(IN1_STB),
        .I4(STATE[2]),
        .I5(STATE[0]),
        .O(\DATA[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0))
    \DATA_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\DATA[7]_i_1_n_0 ),
        .D(Q[0]),
        .Q(\DATA_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \DATA_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\DATA[7]_i_1_n_0 ),
        .D(Q[1]),
        .Q(p_6_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \DATA_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(\DATA[7]_i_1_n_0 ),
        .D(Q[2]),
        .Q(p_5_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \DATA_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\DATA[7]_i_1_n_0 ),
        .D(Q[3]),
        .Q(p_4_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \DATA_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(\DATA[7]_i_1_n_0 ),
        .D(Q[4]),
        .Q(p_3_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \DATA_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(\DATA[7]_i_1_n_0 ),
        .D(Q[5]),
        .Q(p_2_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \DATA_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(\DATA[7]_i_1_n_0 ),
        .D(Q[6]),
        .Q(p_1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \DATA_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(\DATA[7]_i_1_n_0 ),
        .D(Q[7]),
        .Q(p_0_in),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h07))
    \FSM_sequential_STATE[0]_i_1
       (.I0(STATE[2]),
        .I1(STATE[3]),
        .I2(STATE[0]),
        .O(\FSM_sequential_STATE[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h152A))
    \FSM_sequential_STATE[1]_i_1
       (.I0(STATE[0]),
        .I1(STATE[2]),
        .I2(STATE[3]),
        .I3(STATE[1]),
        .O(\FSM_sequential_STATE[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0078))
    \FSM_sequential_STATE[2]_i_1
       (.I0(STATE[1]),
        .I1(STATE[0]),
        .I2(STATE[2]),
        .I3(STATE[3]),
        .O(\FSM_sequential_STATE[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0F00FF010F00FE00))
    \FSM_sequential_STATE[3]_i_1
       (.I0(STATE[0]),
        .I1(STATE[1]),
        .I2(STATE[2]),
        .I3(X16CLK_EN_reg_n_0),
        .I4(STATE[3]),
        .I5(S_IN1_ACK1),
        .O(\FSM_sequential_STATE[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0870))
    \FSM_sequential_STATE[3]_i_2
       (.I0(STATE[1]),
        .I1(STATE[0]),
        .I2(STATE[3]),
        .I3(STATE[2]),
        .O(\FSM_sequential_STATE[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8))
    \FSM_sequential_STATE[3]_i_3
       (.I0(IN1_ACK),
        .I1(IN1_STB),
        .O(S_IN1_ACK1));
  (* KEEP = "yes" *)
  FDRE \FSM_sequential_STATE_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\FSM_sequential_STATE[3]_i_1_n_0 ),
        .D(\FSM_sequential_STATE[0]_i_1_n_0 ),
        .Q(STATE[0]),
        .R(INTERNAL_RST_reg));
  (* KEEP = "yes" *)
  FDRE \FSM_sequential_STATE_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\FSM_sequential_STATE[3]_i_1_n_0 ),
        .D(\FSM_sequential_STATE[1]_i_1_n_0 ),
        .Q(STATE[1]),
        .R(INTERNAL_RST_reg));
  (* KEEP = "yes" *)
  FDRE \FSM_sequential_STATE_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(\FSM_sequential_STATE[3]_i_1_n_0 ),
        .D(\FSM_sequential_STATE[2]_i_1_n_0 ),
        .Q(STATE[2]),
        .R(INTERNAL_RST_reg));
  (* KEEP = "yes" *)
  FDRE \FSM_sequential_STATE_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\FSM_sequential_STATE[3]_i_1_n_0 ),
        .D(\FSM_sequential_STATE[3]_i_2_n_0 ),
        .Q(STATE[3]),
        .R(INTERNAL_RST_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000003))
    S_IN1_ACK_i_1
       (.I0(IN1_STB),
        .I1(STATE[1]),
        .I2(STATE[3]),
        .I3(STATE[2]),
        .I4(STATE[0]),
        .I5(IN1_ACK),
        .O(S_IN1_ACK_i_1_n_0));
  FDRE #(
    .INIT(1'b0))
    S_IN1_ACK_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(S_IN1_ACK_i_1_n_0),
        .Q(IN1_ACK),
        .R(INTERNAL_RST_reg));
  LUT6 #(
    .INIT(64'hFFAAAABA00AAAA8A))
    TX_i_1
       (.I0(TX_reg_i_2_n_0),
        .I1(STATE[1]),
        .I2(STATE[0]),
        .I3(STATE[3]),
        .I4(STATE[2]),
        .I5(RS232_TX_OBUF),
        .O(TX_i_1_n_0));
  LUT6 #(
    .INIT(64'h0AC0FFFF0AC00000))
    TX_i_3
       (.I0(p_4_in),
        .I1(p_0_in),
        .I2(STATE[3]),
        .I3(STATE[2]),
        .I4(STATE[1]),
        .I5(TX_i_5_n_0),
        .O(TX_i_3_n_0));
  LUT6 #(
    .INIT(64'h0AFCFFFF0AFC0000))
    TX_i_4
       (.I0(p_3_in),
        .I1(\DATA_reg_n_0_[0] ),
        .I2(STATE[3]),
        .I3(STATE[2]),
        .I4(STATE[1]),
        .I5(TX_i_6_n_0),
        .O(TX_i_4_n_0));
  LUT4 #(
    .INIT(16'h0ACF))
    TX_i_5
       (.I0(p_6_in),
        .I1(p_2_in),
        .I2(STATE[3]),
        .I3(STATE[2]),
        .O(TX_i_5_n_0));
  LUT4 #(
    .INIT(16'h30BB))
    TX_i_6
       (.I0(p_5_in),
        .I1(STATE[2]),
        .I2(p_1_in),
        .I3(STATE[3]),
        .O(TX_i_6_n_0));
  FDSE #(
    .INIT(1'b1))
    TX_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_i_1_n_0),
        .Q(RS232_TX_OBUF),
        .S(INTERNAL_RST_reg));
  MUXF7 TX_reg_i_2
       (.I0(TX_i_3_n_0),
        .I1(TX_i_4_n_0),
        .O(TX_reg_i_2_n_0),
        .S(STATE[0]));
  (* SOFT_HLUTNM = "soft_lutpair65" *)
  LUT2 #(
    .INIT(4'h1))
    X16CLK_EN_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2__0_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3__0_n_0 ),
        .O(X16CLK_EN_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0))
    X16CLK_EN_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(X16CLK_EN_i_1__0_n_0),
        .Q(X16CLK_EN_reg_n_0),
        .R(INTERNAL_RST_reg));
endmodule