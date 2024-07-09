module PWM_0
   (LED_G_PWM_OBUF,
    ETH_CLK_OBUF);
  output LED_G_PWM_OBUF;
  input ETH_CLK_OBUF;
  wire \COUNT[0]_i_1__2_n_0 ;
  wire \COUNT[1]_i_1__2_n_0 ;
  wire \COUNT[1]_i_2__0_n_0 ;
  wire \COUNT[2]_i_1__1_n_0 ;
  wire \COUNT[3]_i_1__0_n_0 ;
  wire \COUNT[3]_i_2__0_n_0 ;
  wire \COUNT[4]_i_1__0_n_0 ;
  wire \COUNT[5]_i_1__0_n_0 ;
  wire \COUNT[6]_i_1__0_n_0 ;
  wire \COUNT[7]_i_1__0_n_0 ;
  wire \COUNT[7]_i_2__0_n_0 ;
  wire \COUNT[7]_i_3__0_n_0 ;
  wire \COUNT_reg_n_0_[0] ;
  wire \COUNT_reg_n_0_[1] ;
  wire \COUNT_reg_n_0_[2] ;
  wire \COUNT_reg_n_0_[3] ;
  wire \COUNT_reg_n_0_[4] ;
  wire \COUNT_reg_n_0_[5] ;
  wire \COUNT_reg_n_0_[6] ;
  wire \COUNT_reg_n_0_[7] ;
  wire ETH_CLK_OBUF;
  wire LED_G_PWM_OBUF;
  wire OUT_BIT_i_10__0_n_0;
  wire OUT_BIT_i_1__0_n_0;
  wire OUT_BIT_i_3__0_n_0;
  wire OUT_BIT_i_4__0_n_0;
  wire OUT_BIT_i_5__0_n_0;
  wire OUT_BIT_i_6__0_n_0;
  wire OUT_BIT_i_7__0_n_0;
  wire OUT_BIT_i_8__0_n_0;
  wire OUT_BIT_i_9__0_n_0;
  wire [9:0]TIMER;
  wire \TIMER[4]_i_2__0_n_0 ;
  wire \TIMER[9]_i_2__0_n_0 ;
  wire \TIMER_reg_n_0_[0] ;
  wire \TIMER_reg_n_0_[1] ;
  wire \TIMER_reg_n_0_[2] ;
  wire \TIMER_reg_n_0_[3] ;
  wire \TIMER_reg_n_0_[4] ;
  wire \TIMER_reg_n_0_[5] ;
  wire \TIMER_reg_n_0_[6] ;
  wire \TIMER_reg_n_0_[7] ;
  wire \TIMER_reg_n_0_[8] ;
  wire \TIMER_reg_n_0_[9] ;
  wire p_0_in;
  wire [2:0]NLW_OUT_BIT_reg_i_2__0_CO_UNCONNECTED;
  wire [3:0]NLW_OUT_BIT_reg_i_2__0_O_UNCONNECTED;
  LUT6 #(
    .INIT(64'h2333333333333333))
    \COUNT[0]_i_1__2
       (.I0(\COUNT[7]_i_3__0_n_0 ),
        .I1(\COUNT_reg_n_0_[0] ),
        .I2(\COUNT_reg_n_0_[5] ),
        .I3(\COUNT_reg_n_0_[4] ),
        .I4(\COUNT_reg_n_0_[7] ),
        .I5(\COUNT_reg_n_0_[6] ),
        .O(\COUNT[0]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'h00FFBF00))
    \COUNT[1]_i_1__2
       (.I0(\COUNT[1]_i_2__0_n_0 ),
        .I1(\COUNT_reg_n_0_[3] ),
        .I2(\COUNT_reg_n_0_[2] ),
        .I3(\COUNT_reg_n_0_[1] ),
        .I4(\COUNT_reg_n_0_[0] ),
        .O(\COUNT[1]_i_1__2_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF))
    \COUNT[1]_i_2__0
       (.I0(\COUNT_reg_n_0_[5] ),
        .I1(\COUNT_reg_n_0_[4] ),
        .I2(\COUNT_reg_n_0_[7] ),
        .I3(\COUNT_reg_n_0_[6] ),
        .O(\COUNT[1]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *)
  LUT5 #(
    .INIT(32'hFFC011C0))
    \COUNT[2]_i_1__1
       (.I0(\COUNT_reg_n_0_[3] ),
        .I1(\COUNT_reg_n_0_[0] ),
        .I2(\COUNT_reg_n_0_[1] ),
        .I3(\COUNT_reg_n_0_[2] ),
        .I4(\COUNT[3]_i_2__0_n_0 ),
        .O(\COUNT[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *)
  LUT5 #(
    .INIT(32'hFF805580))
    \COUNT[3]_i_1__0
       (.I0(\COUNT_reg_n_0_[2] ),
        .I1(\COUNT_reg_n_0_[1] ),
        .I2(\COUNT_reg_n_0_[0] ),
        .I3(\COUNT_reg_n_0_[3] ),
        .I4(\COUNT[3]_i_2__0_n_0 ),
        .O(\COUNT[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h15555555FFFFFFFF))
    \COUNT[3]_i_2__0
       (.I0(\COUNT_reg_n_0_[0] ),
        .I1(\COUNT_reg_n_0_[5] ),
        .I2(\COUNT_reg_n_0_[4] ),
        .I3(\COUNT_reg_n_0_[7] ),
        .I4(\COUNT_reg_n_0_[6] ),
        .I5(\COUNT_reg_n_0_[1] ),
        .O(\COUNT[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FF7F00FF0000))
    \COUNT[4]_i_1__0
       (.I0(\COUNT_reg_n_0_[7] ),
        .I1(\COUNT_reg_n_0_[6] ),
        .I2(\COUNT_reg_n_0_[5] ),
        .I3(\COUNT[7]_i_3__0_n_0 ),
        .I4(\COUNT_reg_n_0_[0] ),
        .I5(\COUNT_reg_n_0_[4] ),
        .O(\COUNT[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAABFFFFF55000000))
    \COUNT[5]_i_1__0
       (.I0(\COUNT[7]_i_3__0_n_0 ),
        .I1(\COUNT_reg_n_0_[7] ),
        .I2(\COUNT_reg_n_0_[6] ),
        .I3(\COUNT_reg_n_0_[0] ),
        .I4(\COUNT_reg_n_0_[4] ),
        .I5(\COUNT_reg_n_0_[5] ),
        .O(\COUNT[5]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hF01CF0F0F0F0F0F0))
    \COUNT[6]_i_1__0
       (.I0(\COUNT_reg_n_0_[7] ),
        .I1(\COUNT_reg_n_0_[0] ),
        .I2(\COUNT_reg_n_0_[6] ),
        .I3(\COUNT[7]_i_3__0_n_0 ),
        .I4(\COUNT_reg_n_0_[5] ),
        .I5(\COUNT_reg_n_0_[4] ),
        .O(\COUNT[6]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001))
    \COUNT[7]_i_1__0
       (.I0(\TIMER_reg_n_0_[9] ),
        .I1(\TIMER_reg_n_0_[7] ),
        .I2(\TIMER_reg_n_0_[5] ),
        .I3(\TIMER_reg_n_0_[6] ),
        .I4(\TIMER_reg_n_0_[8] ),
        .I5(\TIMER[9]_i_2__0_n_0 ),
        .O(\COUNT[7]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFF7FF08000000))
    \COUNT[7]_i_2__0
       (.I0(\COUNT_reg_n_0_[4] ),
        .I1(\COUNT_reg_n_0_[5] ),
        .I2(\COUNT[7]_i_3__0_n_0 ),
        .I3(\COUNT_reg_n_0_[6] ),
        .I4(\COUNT_reg_n_0_[0] ),
        .I5(\COUNT_reg_n_0_[7] ),
        .O(\COUNT[7]_i_2__0_n_0 ));
  LUT3 #(
    .INIT(8'h7F))
    \COUNT[7]_i_3__0
       (.I0(\COUNT_reg_n_0_[3] ),
        .I1(\COUNT_reg_n_0_[2] ),
        .I2(\COUNT_reg_n_0_[1] ),
        .O(\COUNT[7]_i_3__0_n_0 ));
  FDRE #(
    .INIT(1'b0))
    \COUNT_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[7]_i_1__0_n_0 ),
        .D(\COUNT[0]_i_1__2_n_0 ),
        .Q(\COUNT_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \COUNT_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[7]_i_1__0_n_0 ),
        .D(\COUNT[1]_i_1__2_n_0 ),
        .Q(\COUNT_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \COUNT_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[7]_i_1__0_n_0 ),
        .D(\COUNT[2]_i_1__1_n_0 ),
        .Q(\COUNT_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \COUNT_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[7]_i_1__0_n_0 ),
        .D(\COUNT[3]_i_1__0_n_0 ),
        .Q(\COUNT_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \COUNT_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[7]_i_1__0_n_0 ),
        .D(\COUNT[4]_i_1__0_n_0 ),
        .Q(\COUNT_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \COUNT_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[7]_i_1__0_n_0 ),
        .D(\COUNT[5]_i_1__0_n_0 ),
        .Q(\COUNT_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \COUNT_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[7]_i_1__0_n_0 ),
        .D(\COUNT[6]_i_1__0_n_0 ),
        .Q(\COUNT_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \COUNT_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(\COUNT[7]_i_1__0_n_0 ),
        .D(\COUNT[7]_i_2__0_n_0 ),
        .Q(\COUNT_reg_n_0_[7] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1))
    OUT_BIT_i_10__0
       (.I0(\COUNT_reg_n_0_[0] ),
        .I1(\COUNT_reg_n_0_[1] ),
        .O(OUT_BIT_i_10__0_n_0));
  LUT1 #(
    .INIT(2'h1))
    OUT_BIT_i_1__0
       (.I0(p_0_in),
        .O(OUT_BIT_i_1__0_n_0));
  LUT2 #(
    .INIT(4'hE))
    OUT_BIT_i_3__0
       (.I0(\COUNT_reg_n_0_[6] ),
        .I1(\COUNT_reg_n_0_[7] ),
        .O(OUT_BIT_i_3__0_n_0));
  LUT2 #(
    .INIT(4'hE))
    OUT_BIT_i_4__0
       (.I0(\COUNT_reg_n_0_[4] ),
        .I1(\COUNT_reg_n_0_[5] ),
        .O(OUT_BIT_i_4__0_n_0));
  LUT2 #(
    .INIT(4'hE))
    OUT_BIT_i_5__0
       (.I0(\COUNT_reg_n_0_[2] ),
        .I1(\COUNT_reg_n_0_[3] ),
        .O(OUT_BIT_i_5__0_n_0));
  LUT2 #(
    .INIT(4'hE))
    OUT_BIT_i_6__0
       (.I0(\COUNT_reg_n_0_[0] ),
        .I1(\COUNT_reg_n_0_[1] ),
        .O(OUT_BIT_i_6__0_n_0));
  LUT2 #(
    .INIT(4'h1))
    OUT_BIT_i_7__0
       (.I0(\COUNT_reg_n_0_[6] ),
        .I1(\COUNT_reg_n_0_[7] ),
        .O(OUT_BIT_i_7__0_n_0));
  LUT2 #(
    .INIT(4'h1))
    OUT_BIT_i_8__0
       (.I0(\COUNT_reg_n_0_[4] ),
        .I1(\COUNT_reg_n_0_[5] ),
        .O(OUT_BIT_i_8__0_n_0));
  LUT2 #(
    .INIT(4'h1))
    OUT_BIT_i_9__0
       (.I0(\COUNT_reg_n_0_[2] ),
        .I1(\COUNT_reg_n_0_[3] ),
        .O(OUT_BIT_i_9__0_n_0));
  FDRE OUT_BIT_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(OUT_BIT_i_1__0_n_0),
        .Q(LED_G_PWM_OBUF),
        .R(1'b0));
  CARRY4 OUT_BIT_reg_i_2__0
       (.CI(1'b0),
        .CO({p_0_in,NLW_OUT_BIT_reg_i_2__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({OUT_BIT_i_3__0_n_0,OUT_BIT_i_4__0_n_0,OUT_BIT_i_5__0_n_0,OUT_BIT_i_6__0_n_0}),
        .O(NLW_OUT_BIT_reg_i_2__0_O_UNCONNECTED[3:0]),
        .S({OUT_BIT_i_7__0_n_0,OUT_BIT_i_8__0_n_0,OUT_BIT_i_9__0_n_0,OUT_BIT_i_10__0_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair49" *)
  LUT1 #(
    .INIT(2'h1))
    \TIMER[0]_i_1__1
       (.I0(\TIMER_reg_n_0_[0] ),
        .O(TIMER[0]));
  (* SOFT_HLUTNM = "soft_lutpair49" *)
  LUT2 #(
    .INIT(4'h9))
    \TIMER[1]_i_1__0
       (.I0(\TIMER_reg_n_0_[1] ),
        .I1(\TIMER_reg_n_0_[0] ),
        .O(TIMER[1]));
  LUT3 #(
    .INIT(8'hA9))
    \TIMER[2]_i_1__1
       (.I0(\TIMER_reg_n_0_[2] ),
        .I1(\TIMER_reg_n_0_[0] ),
        .I2(\TIMER_reg_n_0_[1] ),
        .O(TIMER[2]));
  LUT6 #(
    .INIT(64'hF0F0F0F0F0F0F00E))
    \TIMER[3]_i_1__0
       (.I0(\TIMER[4]_i_2__0_n_0 ),
        .I1(\TIMER_reg_n_0_[4] ),
        .I2(\TIMER_reg_n_0_[3] ),
        .I3(\TIMER_reg_n_0_[1] ),
        .I4(\TIMER_reg_n_0_[0] ),
        .I5(\TIMER_reg_n_0_[2] ),
        .O(TIMER[3]));
  LUT6 #(
    .INIT(64'hFFFE0001FFFE0000))
    \TIMER[4]_i_1__0
       (.I0(\TIMER_reg_n_0_[3] ),
        .I1(\TIMER_reg_n_0_[1] ),
        .I2(\TIMER_reg_n_0_[0] ),
        .I3(\TIMER_reg_n_0_[2] ),
        .I4(\TIMER_reg_n_0_[4] ),
        .I5(\TIMER[4]_i_2__0_n_0 ),
        .O(TIMER[4]));
  LUT5 #(
    .INIT(32'hFFFFFFFE))
    \TIMER[4]_i_2__0
       (.I0(\TIMER_reg_n_0_[8] ),
        .I1(\TIMER_reg_n_0_[6] ),
        .I2(\TIMER_reg_n_0_[5] ),
        .I3(\TIMER_reg_n_0_[7] ),
        .I4(\TIMER_reg_n_0_[9] ),
        .O(\TIMER[4]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA9))
    \TIMER[5]_i_1__0
       (.I0(\TIMER_reg_n_0_[5] ),
        .I1(\TIMER_reg_n_0_[3] ),
        .I2(\TIMER_reg_n_0_[1] ),
        .I3(\TIMER_reg_n_0_[0] ),
        .I4(\TIMER_reg_n_0_[2] ),
        .I5(\TIMER_reg_n_0_[4] ),
        .O(TIMER[5]));
  LUT3 #(
    .INIT(8'hE1))
    \TIMER[6]_i_1__1
       (.I0(\TIMER[9]_i_2__0_n_0 ),
        .I1(\TIMER_reg_n_0_[5] ),
        .I2(\TIMER_reg_n_0_[6] ),
        .O(TIMER[6]));
  (* SOFT_HLUTNM = "soft_lutpair46" *)
  LUT4 #(
    .INIT(16'hFE01))
    \TIMER[7]_i_1__1
       (.I0(\TIMER[9]_i_2__0_n_0 ),
        .I1(\TIMER_reg_n_0_[6] ),
        .I2(\TIMER_reg_n_0_[5] ),
        .I3(\TIMER_reg_n_0_[7] ),
        .O(TIMER[7]));
  (* SOFT_HLUTNM = "soft_lutpair46" *)
  LUT5 #(
    .INIT(32'hFFFE0001))
    \TIMER[8]_i_1__1
       (.I0(\TIMER[9]_i_2__0_n_0 ),
        .I1(\TIMER_reg_n_0_[7] ),
        .I2(\TIMER_reg_n_0_[5] ),
        .I3(\TIMER_reg_n_0_[6] ),
        .I4(\TIMER_reg_n_0_[8] ),
        .O(TIMER[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000001))
    \TIMER[9]_i_1__0
       (.I0(\TIMER[9]_i_2__0_n_0 ),
        .I1(\TIMER_reg_n_0_[8] ),
        .I2(\TIMER_reg_n_0_[6] ),
        .I3(\TIMER_reg_n_0_[5] ),
        .I4(\TIMER_reg_n_0_[7] ),
        .I5(\TIMER_reg_n_0_[9] ),
        .O(TIMER[9]));
  LUT5 #(
    .INIT(32'hFFFFFFFE))
    \TIMER[9]_i_2__0
       (.I0(\TIMER_reg_n_0_[3] ),
        .I1(\TIMER_reg_n_0_[1] ),
        .I2(\TIMER_reg_n_0_[0] ),
        .I3(\TIMER_reg_n_0_[2] ),
        .I4(\TIMER_reg_n_0_[4] ),
        .O(\TIMER[9]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b1))
    \TIMER_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TIMER[0]),
        .Q(\TIMER_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1))
    \TIMER_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TIMER[1]),
        .Q(\TIMER_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1))
    \TIMER_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TIMER[2]),
        .Q(\TIMER_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \TIMER_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TIMER[3]),
        .Q(\TIMER_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \TIMER_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TIMER[4]),
        .Q(\TIMER_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1))
    \TIMER_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TIMER[5]),
        .Q(\TIMER_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1))
    \TIMER_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TIMER[6]),
        .Q(\TIMER_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1))
    \TIMER_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TIMER[7]),
        .Q(\TIMER_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1))
    \TIMER_reg[8]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TIMER[8]),
        .Q(\TIMER_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1))
    \TIMER_reg[9]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TIMER[9]),
        .Q(\TIMER_reg_n_0_[9] ),
        .R(1'b0));
endmodule