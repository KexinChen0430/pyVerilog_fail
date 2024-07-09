module SERIAL_INPUT
   (write_enable_reg,
    OUT1_STB,
    OUT1,
    OUT1_ACK,
    INTERNAL_RST_reg,
    ETH_CLK_OBUF,
    RX);
  output write_enable_reg;
  output OUT1_STB;
  output [7:0]OUT1;
  input OUT1_ACK;
  input INTERNAL_RST_reg;
  input ETH_CLK_OBUF;
  input RX;
  wire [11:0]BAUD_COUNT;
  wire \BAUD_COUNT[11]_i_2_n_0 ;
  wire \BAUD_COUNT[11]_i_3_n_0 ;
  wire \BAUD_COUNT[11]_i_5_n_0 ;
  wire \BAUD_COUNT_reg[4]_i_2__0_n_0 ;
  wire \BAUD_COUNT_reg[8]_i_2__0_n_0 ;
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
  wire \BIT_SPACING[0]_i_1_n_0 ;
  wire \BIT_SPACING[0]_i_2_n_0 ;
  wire \BIT_SPACING[1]_i_1_n_0 ;
  wire \BIT_SPACING[2]_i_1_n_0 ;
  wire \BIT_SPACING[2]_i_2_n_0 ;
  wire \BIT_SPACING[2]_i_3_n_0 ;
  wire \BIT_SPACING[3]_i_1_n_0 ;
  wire \BIT_SPACING[3]_i_2_n_0 ;
  wire \BIT_SPACING[3]_i_3_n_0 ;
  wire \BIT_SPACING[3]_i_4_n_0 ;
  wire \BIT_SPACING[3]_i_5_n_0 ;
  wire \BIT_SPACING_reg_n_0_[0] ;
  wire \BIT_SPACING_reg_n_0_[1] ;
  wire \BIT_SPACING_reg_n_0_[2] ;
  wire \BIT_SPACING_reg_n_0_[3] ;
  wire \COUNT[0]_i_1_n_0 ;
  wire \COUNT[1]_i_1_n_0 ;
  wire \COUNT_reg_n_0_[0] ;
  wire \COUNT_reg_n_0_[1] ;
  wire ETH_CLK_OBUF;
  wire \FSM_sequential_STATE[0]_i_1__0_n_0 ;
  wire \FSM_sequential_STATE[1]_i_1__0_n_0 ;
  wire \FSM_sequential_STATE[2]_i_1__0_n_0 ;
  wire \FSM_sequential_STATE[3]_i_1__0_n_0 ;
  wire \FSM_sequential_STATE[3]_i_2__0_n_0 ;
  wire \FSM_sequential_STATE[3]_i_3__0_n_0 ;
  wire \FSM_sequential_STATE[3]_i_4_n_0 ;
  wire \FSM_sequential_STATE[3]_i_5_n_0 ;
  wire \FSM_sequential_STATE[3]_i_6_n_0 ;
  wire \FSM_sequential_STATE[3]_i_7_n_0 ;
  wire INTERNAL_RST_reg;
  wire INT_SERIAL_i_1_n_0;
  wire INT_SERIAL_reg_n_0;
  wire [7:0]OUT1;
  wire \OUT1[0]_i_1_n_0 ;
  wire \OUT1[1]_i_1_n_0 ;
  wire \OUT1[2]_i_1_n_0 ;
  wire \OUT1[3]_i_1_n_0 ;
  wire \OUT1[3]_i_2_n_0 ;
  wire \OUT1[4]_i_1_n_0 ;
  wire \OUT1[4]_i_2_n_0 ;
  wire \OUT1[5]_i_1_n_0 ;
  wire \OUT1[5]_i_2_n_0 ;
  wire \OUT1[6]_i_1_n_0 ;
  wire \OUT1[7]_i_1_n_0 ;
  wire OUT1_ACK;
  wire OUT1_STB;
  wire OUT1_STB_i_1_n_0;
  wire OUT1_STB_i_2_n_0;
  wire RX;
  (* RTL_KEEP = "yes" *) wire [3:0]STATE;
  wire X16CLK_EN7_out;
  wire X16CLK_EN_reg_n_0;
  wire [11:1]data0;
  wire p_0_in;
  wire p_0_in3_in;
  wire [1:1]p_0_in__0;
  wire write_enable_reg;
  wire [3:0]\NLW_BAUD_COUNT_reg[11]_i_4__0_CO_UNCONNECTED ;
  wire [3:3]\NLW_BAUD_COUNT_reg[11]_i_4__0_O_UNCONNECTED ;
  wire [2:0]\NLW_BAUD_COUNT_reg[4]_i_2__0_CO_UNCONNECTED ;
  wire [2:0]\NLW_BAUD_COUNT_reg[8]_i_2__0_CO_UNCONNECTED ;
  (* SOFT_HLUTNM = "soft_lutpair59" *)
  LUT3 #(
    .INIT(8'h0E))
    \BAUD_COUNT[0]_i_1__0
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(\BAUD_COUNT_reg_n_0_[0] ),
        .O(BAUD_COUNT[0]));
  (* SOFT_HLUTNM = "soft_lutpair64" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[10]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[10]),
        .O(BAUD_COUNT[10]));
  (* SOFT_HLUTNM = "soft_lutpair64" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[11]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[11]),
        .O(BAUD_COUNT[11]));
  LUT5 #(
    .INIT(32'hFFFFFFFE))
    \BAUD_COUNT[11]_i_2
       (.I0(\BAUD_COUNT_reg_n_0_[10] ),
        .I1(\BAUD_COUNT_reg_n_0_[11] ),
        .I2(\BAUD_COUNT_reg_n_0_[9] ),
        .I3(\BAUD_COUNT_reg_n_0_[8] ),
        .I4(\BAUD_COUNT_reg_n_0_[7] ),
        .O(\BAUD_COUNT[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0707FF07))
    \BAUD_COUNT[11]_i_3
       (.I0(\BAUD_COUNT_reg_n_0_[4] ),
        .I1(\BAUD_COUNT_reg_n_0_[3] ),
        .I2(\BAUD_COUNT_reg_n_0_[5] ),
        .I3(\BAUD_COUNT_reg_n_0_[6] ),
        .I4(\BAUD_COUNT_reg_n_0_[7] ),
        .I5(\BAUD_COUNT[11]_i_5_n_0 ),
        .O(\BAUD_COUNT[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDFFFFFFFFFFFF))
    \BAUD_COUNT[11]_i_5
       (.I0(\BAUD_COUNT_reg_n_0_[4] ),
        .I1(\BAUD_COUNT_reg_n_0_[8] ),
        .I2(\BAUD_COUNT_reg_n_0_[5] ),
        .I3(\BAUD_COUNT_reg_n_0_[2] ),
        .I4(\BAUD_COUNT_reg_n_0_[0] ),
        .I5(\BAUD_COUNT_reg_n_0_[1] ),
        .O(\BAUD_COUNT[11]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[1]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[1]),
        .O(BAUD_COUNT[1]));
  (* SOFT_HLUTNM = "soft_lutpair60" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[2]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[2]),
        .O(BAUD_COUNT[2]));
  (* SOFT_HLUTNM = "soft_lutpair61" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[3]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[3]),
        .O(BAUD_COUNT[3]));
  (* SOFT_HLUTNM = "soft_lutpair62" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[4]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[4]),
        .O(BAUD_COUNT[4]));
  (* SOFT_HLUTNM = "soft_lutpair63" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[5]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[5]),
        .O(BAUD_COUNT[5]));
  (* SOFT_HLUTNM = "soft_lutpair60" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[6]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[6]),
        .O(BAUD_COUNT[6]));
  (* SOFT_HLUTNM = "soft_lutpair61" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[7]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[7]),
        .O(BAUD_COUNT[7]));
  (* SOFT_HLUTNM = "soft_lutpair62" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[8]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[8]),
        .O(BAUD_COUNT[8]));
  (* SOFT_HLUTNM = "soft_lutpair63" *)
  LUT3 #(
    .INIT(8'hE0))
    \BAUD_COUNT[9]_i_1
       (.I0(\BAUD_COUNT[11]_i_2_n_0 ),
        .I1(\BAUD_COUNT[11]_i_3_n_0 ),
        .I2(data0[9]),
        .O(BAUD_COUNT[9]));
  FDRE \BAUD_COUNT_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[0]),
        .Q(\BAUD_COUNT_reg_n_0_[0] ),
        .R(INTERNAL_RST_reg));
  FDRE \BAUD_COUNT_reg[10]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[10]),
        .Q(\BAUD_COUNT_reg_n_0_[10] ),
        .R(INTERNAL_RST_reg));
  FDRE \BAUD_COUNT_reg[11]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[11]),
        .Q(\BAUD_COUNT_reg_n_0_[11] ),
        .R(INTERNAL_RST_reg));
  CARRY4 \BAUD_COUNT_reg[11]_i_4__0
       (.CI(\BAUD_COUNT_reg[8]_i_2__0_n_0 ),
        .CO(\NLW_BAUD_COUNT_reg[11]_i_4__0_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_BAUD_COUNT_reg[11]_i_4__0_O_UNCONNECTED [3],data0[11:9]}),
        .S({1'b0,\BAUD_COUNT_reg_n_0_[11] ,\BAUD_COUNT_reg_n_0_[10] ,\BAUD_COUNT_reg_n_0_[9] }));
  FDRE \BAUD_COUNT_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[1]),
        .Q(\BAUD_COUNT_reg_n_0_[1] ),
        .R(INTERNAL_RST_reg));
  FDRE \BAUD_COUNT_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[2]),
        .Q(\BAUD_COUNT_reg_n_0_[2] ),
        .R(INTERNAL_RST_reg));
  FDRE \BAUD_COUNT_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[3]),
        .Q(\BAUD_COUNT_reg_n_0_[3] ),
        .R(INTERNAL_RST_reg));
  FDRE \BAUD_COUNT_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[4]),
        .Q(\BAUD_COUNT_reg_n_0_[4] ),
        .R(INTERNAL_RST_reg));
  CARRY4 \BAUD_COUNT_reg[4]_i_2__0
       (.CI(1'b0),
        .CO({\BAUD_COUNT_reg[4]_i_2__0_n_0 ,\NLW_BAUD_COUNT_reg[4]_i_2__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(\BAUD_COUNT_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S({\BAUD_COUNT_reg_n_0_[4] ,\BAUD_COUNT_reg_n_0_[3] ,\BAUD_COUNT_reg_n_0_[2] ,\BAUD_COUNT_reg_n_0_[1] }));
  FDRE \BAUD_COUNT_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[5]),
        .Q(\BAUD_COUNT_reg_n_0_[5] ),
        .R(INTERNAL_RST_reg));
  FDRE \BAUD_COUNT_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[6]),
        .Q(\BAUD_COUNT_reg_n_0_[6] ),
        .R(INTERNAL_RST_reg));
  FDRE \BAUD_COUNT_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[7]),
        .Q(\BAUD_COUNT_reg_n_0_[7] ),
        .R(INTERNAL_RST_reg));
  FDRE \BAUD_COUNT_reg[8]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[8]),
        .Q(\BAUD_COUNT_reg_n_0_[8] ),
        .R(INTERNAL_RST_reg));
  CARRY4 \BAUD_COUNT_reg[8]_i_2__0
       (.CI(\BAUD_COUNT_reg[4]_i_2__0_n_0 ),
        .CO({\BAUD_COUNT_reg[8]_i_2__0_n_0 ,\NLW_BAUD_COUNT_reg[8]_i_2__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S({\BAUD_COUNT_reg_n_0_[8] ,\BAUD_COUNT_reg_n_0_[7] ,\BAUD_COUNT_reg_n_0_[6] ,\BAUD_COUNT_reg_n_0_[5] }));
  FDRE \BAUD_COUNT_reg[9]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(BAUD_COUNT[9]),
        .Q(\BAUD_COUNT_reg_n_0_[9] ),
        .R(INTERNAL_RST_reg));
  LUT6 #(
    .INIT(64'h3222332232223222))
    \BIT_SPACING[0]_i_1
       (.I0(\FSM_sequential_STATE[3]_i_4_n_0 ),
        .I1(\BIT_SPACING_reg_n_0_[0] ),
        .I2(\BIT_SPACING[3]_i_4_n_0 ),
        .I3(\BIT_SPACING[0]_i_2_n_0 ),
        .I4(p_0_in),
        .I5(\FSM_sequential_STATE[3]_i_6_n_0 ),
        .O(\BIT_SPACING[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF))
    \BIT_SPACING[0]_i_2
       (.I0(\BIT_SPACING_reg_n_0_[3] ),
        .I1(\BIT_SPACING_reg_n_0_[2] ),
        .I2(\BIT_SPACING_reg_n_0_[0] ),
        .I3(\BIT_SPACING_reg_n_0_[1] ),
        .O(\BIT_SPACING[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6660666666606660))
    \BIT_SPACING[1]_i_1
       (.I0(\BIT_SPACING_reg_n_0_[1] ),
        .I1(\BIT_SPACING_reg_n_0_[0] ),
        .I2(\FSM_sequential_STATE[3]_i_4_n_0 ),
        .I3(\BIT_SPACING[3]_i_4_n_0 ),
        .I4(p_0_in),
        .I5(\FSM_sequential_STATE[3]_i_6_n_0 ),
        .O(\BIT_SPACING[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF888FF88F888F888))
    \BIT_SPACING[2]_i_1
       (.I0(\FSM_sequential_STATE[3]_i_4_n_0 ),
        .I1(\BIT_SPACING[2]_i_2_n_0 ),
        .I2(\BIT_SPACING[3]_i_4_n_0 ),
        .I3(\BIT_SPACING[2]_i_3_n_0 ),
        .I4(p_0_in),
        .I5(\FSM_sequential_STATE[3]_i_6_n_0 ),
        .O(\BIT_SPACING[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6C))
    \BIT_SPACING[2]_i_2
       (.I0(\BIT_SPACING_reg_n_0_[1] ),
        .I1(\BIT_SPACING_reg_n_0_[2] ),
        .I2(\BIT_SPACING_reg_n_0_[0] ),
        .O(\BIT_SPACING[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h78))
    \BIT_SPACING[2]_i_3
       (.I0(\BIT_SPACING_reg_n_0_[1] ),
        .I1(\BIT_SPACING_reg_n_0_[0] ),
        .I2(\BIT_SPACING_reg_n_0_[2] ),
        .O(\BIT_SPACING[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h55FF0001))
    \BIT_SPACING[3]_i_1
       (.I0(STATE[3]),
        .I1(STATE[0]),
        .I2(STATE[1]),
        .I3(STATE[2]),
        .I4(X16CLK_EN_reg_n_0),
        .O(\BIT_SPACING[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF888FF88F888F888))
    \BIT_SPACING[3]_i_2
       (.I0(\FSM_sequential_STATE[3]_i_4_n_0 ),
        .I1(\BIT_SPACING[3]_i_3_n_0 ),
        .I2(\BIT_SPACING[3]_i_4_n_0 ),
        .I3(\BIT_SPACING[3]_i_5_n_0 ),
        .I4(p_0_in),
        .I5(\FSM_sequential_STATE[3]_i_6_n_0 ),
        .O(\BIT_SPACING[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h52F0F0F0))
    \BIT_SPACING[3]_i_3
       (.I0(\BIT_SPACING_reg_n_0_[1] ),
        .I1(X16CLK_EN_reg_n_0),
        .I2(\BIT_SPACING_reg_n_0_[3] ),
        .I3(\BIT_SPACING_reg_n_0_[2] ),
        .I4(\BIT_SPACING_reg_n_0_[0] ),
        .O(\BIT_SPACING[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h4000))
    \BIT_SPACING[3]_i_4
       (.I0(STATE[2]),
        .I1(STATE[3]),
        .I2(STATE[1]),
        .I3(STATE[0]),
        .O(\BIT_SPACING[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7F80))
    \BIT_SPACING[3]_i_5
       (.I0(\BIT_SPACING_reg_n_0_[1] ),
        .I1(\BIT_SPACING_reg_n_0_[0] ),
        .I2(\BIT_SPACING_reg_n_0_[2] ),
        .I3(\BIT_SPACING_reg_n_0_[3] ),
        .O(\BIT_SPACING[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h80000000))
    \BIT_SPACING[3]_i_6
       (.I0(\BIT_SPACING_reg_n_0_[3] ),
        .I1(\BIT_SPACING_reg_n_0_[1] ),
        .I2(\BIT_SPACING_reg_n_0_[0] ),
        .I3(\BIT_SPACING_reg_n_0_[2] ),
        .I4(X16CLK_EN_reg_n_0),
        .O(p_0_in));
  FDRE \BIT_SPACING_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\BIT_SPACING[3]_i_1_n_0 ),
        .D(\BIT_SPACING[0]_i_1_n_0 ),
        .Q(\BIT_SPACING_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \BIT_SPACING_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\BIT_SPACING[3]_i_1_n_0 ),
        .D(\BIT_SPACING[1]_i_1_n_0 ),
        .Q(\BIT_SPACING_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \BIT_SPACING_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(\BIT_SPACING[3]_i_1_n_0 ),
        .D(\BIT_SPACING[2]_i_1_n_0 ),
        .Q(\BIT_SPACING_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \BIT_SPACING_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\BIT_SPACING[3]_i_1_n_0 ),
        .D(\BIT_SPACING[3]_i_2_n_0 ),
        .Q(\BIT_SPACING_reg_n_0_[3] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h8FE0))
    \COUNT[0]_i_1
       (.I0(p_0_in3_in),
        .I1(\COUNT_reg_n_0_[1] ),
        .I2(X16CLK_EN_reg_n_0),
        .I3(\COUNT_reg_n_0_[0] ),
        .O(\COUNT[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *)
  LUT4 #(
    .INIT(16'hECC4))
    \COUNT[1]_i_1
       (.I0(X16CLK_EN_reg_n_0),
        .I1(\COUNT_reg_n_0_[1] ),
        .I2(p_0_in3_in),
        .I3(\COUNT_reg_n_0_[0] ),
        .O(\COUNT[1]_i_1_n_0 ));
  FDRE \COUNT_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\COUNT[0]_i_1_n_0 ),
        .Q(\COUNT_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \COUNT_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\COUNT[1]_i_1_n_0 ),
        .Q(\COUNT_reg_n_0_[1] ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h07))
    \FSM_sequential_STATE[0]_i_1__0
       (.I0(STATE[2]),
        .I1(STATE[3]),
        .I2(STATE[0]),
        .O(\FSM_sequential_STATE[0]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h152A))
    \FSM_sequential_STATE[1]_i_1__0
       (.I0(STATE[1]),
        .I1(STATE[2]),
        .I2(STATE[3]),
        .I3(STATE[0]),
        .O(\FSM_sequential_STATE[1]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h006A))
    \FSM_sequential_STATE[2]_i_1__0
       (.I0(STATE[2]),
        .I1(STATE[1]),
        .I2(STATE[0]),
        .I3(STATE[3]),
        .O(\FSM_sequential_STATE[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFA8FF20))
    \FSM_sequential_STATE[3]_i_1__0
       (.I0(\FSM_sequential_STATE[3]_i_3__0_n_0 ),
        .I1(\BIT_SPACING_reg_n_0_[3] ),
        .I2(\FSM_sequential_STATE[3]_i_4_n_0 ),
        .I3(\FSM_sequential_STATE[3]_i_5_n_0 ),
        .I4(\FSM_sequential_STATE[3]_i_6_n_0 ),
        .I5(\FSM_sequential_STATE[3]_i_7_n_0 ),
        .O(\FSM_sequential_STATE[3]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h1580))
    \FSM_sequential_STATE[3]_i_2__0
       (.I0(STATE[2]),
        .I1(STATE[1]),
        .I2(STATE[0]),
        .I3(STATE[3]),
        .O(\FSM_sequential_STATE[3]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'h8000))
    \FSM_sequential_STATE[3]_i_3__0
       (.I0(X16CLK_EN_reg_n_0),
        .I1(\BIT_SPACING_reg_n_0_[2] ),
        .I2(\BIT_SPACING_reg_n_0_[0] ),
        .I3(\BIT_SPACING_reg_n_0_[1] ),
        .O(\FSM_sequential_STATE[3]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'h0004))
    \FSM_sequential_STATE[3]_i_4
       (.I0(STATE[3]),
        .I1(STATE[0]),
        .I2(STATE[2]),
        .I3(STATE[1]),
        .O(\FSM_sequential_STATE[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000010))
    \FSM_sequential_STATE[3]_i_5
       (.I0(STATE[1]),
        .I1(STATE[2]),
        .I2(X16CLK_EN_reg_n_0),
        .I3(INT_SERIAL_reg_n_0),
        .I4(STATE[3]),
        .I5(STATE[0]),
        .O(\FSM_sequential_STATE[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h337C))
    \FSM_sequential_STATE[3]_i_6
       (.I0(STATE[0]),
        .I1(STATE[3]),
        .I2(STATE[1]),
        .I3(STATE[2]),
        .O(\FSM_sequential_STATE[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00800000))
    \FSM_sequential_STATE[3]_i_7
       (.I0(STATE[0]),
        .I1(STATE[1]),
        .I2(STATE[3]),
        .I3(STATE[2]),
        .I4(OUT1_ACK),
        .O(\FSM_sequential_STATE[3]_i_7_n_0 ));
  (* KEEP = "yes" *)
  FDRE \FSM_sequential_STATE_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\FSM_sequential_STATE[3]_i_1__0_n_0 ),
        .D(\FSM_sequential_STATE[0]_i_1__0_n_0 ),
        .Q(STATE[0]),
        .R(INTERNAL_RST_reg));
  (* KEEP = "yes" *)
  FDRE \FSM_sequential_STATE_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\FSM_sequential_STATE[3]_i_1__0_n_0 ),
        .D(\FSM_sequential_STATE[1]_i_1__0_n_0 ),
        .Q(STATE[1]),
        .R(INTERNAL_RST_reg));
  (* KEEP = "yes" *)
  FDRE \FSM_sequential_STATE_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(\FSM_sequential_STATE[3]_i_1__0_n_0 ),
        .D(\FSM_sequential_STATE[2]_i_1__0_n_0 ),
        .Q(STATE[2]),
        .R(INTERNAL_RST_reg));
  (* KEEP = "yes" *)
  FDRE \FSM_sequential_STATE_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\FSM_sequential_STATE[3]_i_1__0_n_0 ),
        .D(\FSM_sequential_STATE[3]_i_2__0_n_0 ),
        .Q(STATE[3]),
        .R(INTERNAL_RST_reg));
  (* SOFT_HLUTNM = "soft_lutpair56" *)
  LUT5 #(
    .INIT(32'hEAAAA8AA))
    INT_SERIAL_i_1
       (.I0(INT_SERIAL_reg_n_0),
        .I1(\COUNT_reg_n_0_[1] ),
        .I2(\COUNT_reg_n_0_[0] ),
        .I3(X16CLK_EN_reg_n_0),
        .I4(p_0_in3_in),
        .O(INT_SERIAL_i_1_n_0));
  FDRE INT_SERIAL_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(INT_SERIAL_i_1_n_0),
        .Q(INT_SERIAL_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000))
    \OUT1[0]_i_1
       (.I0(INT_SERIAL_reg_n_0),
        .I1(p_0_in),
        .I2(STATE[1]),
        .I3(STATE[2]),
        .I4(\OUT1[4]_i_2_n_0 ),
        .I5(OUT1[0]),
        .O(\OUT1[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF8FFFFFF08000000))
    \OUT1[1]_i_1
       (.I0(INT_SERIAL_reg_n_0),
        .I1(\OUT1[3]_i_2_n_0 ),
        .I2(STATE[2]),
        .I3(p_0_in),
        .I4(\OUT1[5]_i_2_n_0 ),
        .I5(OUT1[1]),
        .O(\OUT1[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000))
    \OUT1[2]_i_1
       (.I0(INT_SERIAL_reg_n_0),
        .I1(STATE[2]),
        .I2(\OUT1[4]_i_2_n_0 ),
        .I3(STATE[1]),
        .I4(p_0_in),
        .I5(OUT1[2]),
        .O(\OUT1[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000))
    \OUT1[3]_i_1
       (.I0(INT_SERIAL_reg_n_0),
        .I1(STATE[2]),
        .I2(\OUT1[3]_i_2_n_0 ),
        .I3(STATE[1]),
        .I4(p_0_in),
        .I5(OUT1[3]),
        .O(\OUT1[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2))
    \OUT1[3]_i_2
       (.I0(STATE[0]),
        .I1(STATE[3]),
        .O(\OUT1[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF80000000))
    \OUT1[4]_i_1
       (.I0(INT_SERIAL_reg_n_0),
        .I1(p_0_in),
        .I2(STATE[1]),
        .I3(STATE[2]),
        .I4(\OUT1[4]_i_2_n_0 ),
        .I5(OUT1[4]),
        .O(\OUT1[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1))
    \OUT1[4]_i_2
       (.I0(STATE[0]),
        .I1(STATE[3]),
        .O(\OUT1[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hBFFF8000))
    \OUT1[5]_i_1
       (.I0(INT_SERIAL_reg_n_0),
        .I1(STATE[2]),
        .I2(p_0_in),
        .I3(\OUT1[5]_i_2_n_0 ),
        .I4(OUT1[5]),
        .O(\OUT1[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h08))
    \OUT1[5]_i_2
       (.I0(STATE[1]),
        .I1(STATE[0]),
        .I2(STATE[3]),
        .O(\OUT1[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000))
    \OUT1[6]_i_1
       (.I0(INT_SERIAL_reg_n_0),
        .I1(STATE[0]),
        .I2(STATE[3]),
        .I3(STATE[1]),
        .I4(p_0_in),
        .I5(OUT1[6]),
        .O(\OUT1[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000))
    \OUT1[7]_i_1
       (.I0(INT_SERIAL_reg_n_0),
        .I1(STATE[3]),
        .I2(STATE[0]),
        .I3(STATE[1]),
        .I4(p_0_in),
        .I5(OUT1[7]),
        .O(\OUT1[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h10FF1000))
    OUT1_STB_i_1
       (.I0(STATE[2]),
        .I1(STATE[0]),
        .I2(p_0_in),
        .I3(OUT1_STB_i_2_n_0),
        .I4(OUT1_STB),
        .O(OUT1_STB_i_1_n_0));
  LUT6 #(
    .INIT(64'h080C000008000000))
    OUT1_STB_i_2
       (.I0(OUT1_ACK),
        .I1(STATE[3]),
        .I2(STATE[2]),
        .I3(STATE[0]),
        .I4(STATE[1]),
        .I5(p_0_in),
        .O(OUT1_STB_i_2_n_0));
  FDRE OUT1_STB_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(OUT1_STB_i_1_n_0),
        .Q(OUT1_STB),
        .R(INTERNAL_RST_reg));
  FDRE \OUT1_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\OUT1[0]_i_1_n_0 ),
        .Q(OUT1[0]),
        .R(1'b0));
  FDRE \OUT1_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\OUT1[1]_i_1_n_0 ),
        .Q(OUT1[1]),
        .R(1'b0));
  FDRE \OUT1_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\OUT1[2]_i_1_n_0 ),
        .Q(OUT1[2]),
        .R(1'b0));
  FDRE \OUT1_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\OUT1[3]_i_1_n_0 ),
        .Q(OUT1[3]),
        .R(1'b0));
  FDRE \OUT1_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\OUT1[4]_i_1_n_0 ),
        .Q(OUT1[4]),
        .R(1'b0));
  FDRE \OUT1_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\OUT1[5]_i_1_n_0 ),
        .Q(OUT1[5]),
        .R(1'b0));
  FDRE \OUT1_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\OUT1[6]_i_1_n_0 ),
        .Q(OUT1[6]),
        .R(1'b0));
  FDRE \OUT1_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\OUT1[7]_i_1_n_0 ),
        .Q(OUT1[7]),
        .R(1'b0));
  FDSE \SERIAL_DEGLITCH_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(RX),
        .Q(p_0_in__0),
        .S(INTERNAL_RST_reg));
  FDSE \SERIAL_DEGLITCH_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(p_0_in__0),
        .Q(p_0_in3_in),
        .S(INTERNAL_RST_reg));
  LUT3 #(
    .INIT(8'h01))
    X16CLK_EN_i_1
       (.I0(INTERNAL_RST_reg),
        .I1(\BAUD_COUNT[11]_i_2_n_0 ),
        .I2(\BAUD_COUNT[11]_i_3_n_0 ),
        .O(X16CLK_EN7_out));
  FDRE X16CLK_EN_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(X16CLK_EN7_out),
        .Q(X16CLK_EN_reg_n_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h7))
    \result[31]_i_4
       (.I0(OUT1_STB),
        .I1(OUT1_ACK),
        .O(write_enable_reg));
endmodule