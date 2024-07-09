module BSP
   (CLK_IN,
    RST,
    ETH_CLK,
    PHY_RESET_N,
    RXDV,
    RXER,
    RXD,
    TXD,
    TXEN,
    JC,
    SDA,
    SCL,
    KD,
    KC,
    AUDIO,
    AUDIO_EN,
    VGA_R,
    VGA_G,
    VGA_B,
    HSYNCH,
    VSYNCH,
    GPIO_LEDS,
    GPIO_SWITCHES,
    GPIO_BUTTONS,
    LED_R_PWM,
    LED_G_PWM,
    LED_B_PWM,
    SEVEN_SEGMENT_CATHODE,
    SEVEN_SEGMENT_ANNODE,
    RS232_RX,
    RS232_TX);
  input CLK_IN;
  input RST;
  output ETH_CLK;
  output PHY_RESET_N;
  input RXDV;
  input RXER;
  input [1:0]RXD;
  output [1:0]TXD;
  output TXEN;
  inout [7:0]JC;
  inout SDA;
  inout SCL;
  input KD;
  input KC;
  output AUDIO;
  output AUDIO_EN;
  output [3:0]VGA_R;
  output [3:0]VGA_G;
  output [3:0]VGA_B;
  output HSYNCH;
  output VSYNCH;
  output [15:0]GPIO_LEDS;
  input [15:0]GPIO_SWITCHES;
  input [4:0]GPIO_BUTTONS;
  output LED_R_PWM;
  output LED_G_PWM;
  output LED_B_PWM;
  output [6:0]SEVEN_SEGMENT_CATHODE;
  output [7:0]SEVEN_SEGMENT_ANNODE;
  input RS232_RX;
  output RS232_TX;
  wire AUDIO;
  wire AUDIO_EN;
  wire CLKFB;
  wire CLKIN;
  (* IBUF_LOW_PWR *) wire CLK_IN;
  wire ETH_CLK;
  wire ETH_CLK_OBUF;
  wire \GPIO_BUTTONS[0] ;
  wire \GPIO_BUTTONS[0]_IBUF ;
  wire \GPIO_BUTTONS[1] ;
  wire \GPIO_BUTTONS[1]_IBUF ;
  wire \GPIO_BUTTONS[2] ;
  wire \GPIO_BUTTONS[2]_IBUF ;
  wire \GPIO_BUTTONS[3] ;
  wire \GPIO_BUTTONS[3]_IBUF ;
  wire \GPIO_BUTTONS[4] ;
  wire \GPIO_BUTTONS[4]_IBUF ;
  wire [15:0]GPIO_LEDS;
  wire \GPIO_SWITCHES[0] ;
  wire \GPIO_SWITCHES[0]_IBUF ;
  wire \GPIO_SWITCHES[10] ;
  wire \GPIO_SWITCHES[10]_IBUF ;
  wire \GPIO_SWITCHES[11] ;
  wire \GPIO_SWITCHES[11]_IBUF ;
  wire \GPIO_SWITCHES[12] ;
  wire \GPIO_SWITCHES[12]_IBUF ;
  wire \GPIO_SWITCHES[13] ;
  wire \GPIO_SWITCHES[13]_IBUF ;
  wire \GPIO_SWITCHES[14] ;
  wire \GPIO_SWITCHES[14]_IBUF ;
  wire \GPIO_SWITCHES[15] ;
  wire \GPIO_SWITCHES[15]_IBUF ;
  wire \GPIO_SWITCHES[1] ;
  wire \GPIO_SWITCHES[1]_IBUF ;
  wire \GPIO_SWITCHES[2] ;
  wire \GPIO_SWITCHES[2]_IBUF ;
  wire \GPIO_SWITCHES[3] ;
  wire \GPIO_SWITCHES[3]_IBUF ;
  wire \GPIO_SWITCHES[4] ;
  wire \GPIO_SWITCHES[4]_IBUF ;
  wire \GPIO_SWITCHES[5] ;
  wire \GPIO_SWITCHES[5]_IBUF ;
  wire \GPIO_SWITCHES[6] ;
  wire \GPIO_SWITCHES[6]_IBUF ;
  wire \GPIO_SWITCHES[7] ;
  wire \GPIO_SWITCHES[7]_IBUF ;
  wire \GPIO_SWITCHES[8] ;
  wire \GPIO_SWITCHES[8]_IBUF ;
  wire \GPIO_SWITCHES[9] ;
  wire \GPIO_SWITCHES[9]_IBUF ;
  wire HSYNCH;
  wire HSYNCH_OBUF;
  wire IN1_ACK;
  wire IN1_STB;
  wire INTERNAL_RST_reg_n_0;
  wire [7:0]JC;
  wire [1:1]JC_IBUF;
  wire KC;
  wire KC_IBUF;
  wire KD;
  wire KD_IBUF;
  wire LED_B_PWM;
  wire LED_B_PWM_OBUF;
  wire LED_G_PWM;
  wire LED_G_PWM_OBUF;
  wire LED_R_PWM;
  wire LED_R_PWM_OBUF;
  wire NOT_LOCKED;
  wire NOT_LOCKED_i_1_n_0;
  wire [7:0]OUT1;
  wire OUT1_ACK;
  wire OUT1_STB;
  wire PHY_RESET_N;
  wire PHY_RESET_N_OBUF;
  wire RS232_RX;
  wire RS232_RX_IBUF;
  wire RS232_TX;
  wire RS232_TX_OBUF;
  wire RST;
  wire RST_IBUF;
  wire RXDV;
  wire RXDV_IBUF;
  wire \RXD[0] ;
  wire \RXD[0]_IBUF ;
  wire \RXD[1] ;
  wire \RXD[1]_IBUF ;
  wire RXER;
  wire RXER_IBUF;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire SCL;
  wire SCL_IBUF;
  wire SCL_TRI;
  wire SDA;
  wire SDA_IBUF;
  wire SDA_TRI;
  wire [7:0]SEVEN_SEGMENT_ANNODE;
  wire [6:0]SEVEN_SEGMENT_CATHODE;
  wire [1:0]TXD;
  wire [1:0]TXD_OBUF;
  wire TXEN;
  wire TXEN_OBUF;
  wire USER_DESIGN_INST_1_n_2;
  wire USER_DESIGN_INST_1_n_3;
  wire USER_DESIGN_INST_1_n_4;
  wire USER_DESIGN_INST_1_n_5;
  wire USER_DESIGN_INST_1_n_6;
  wire USER_DESIGN_INST_1_n_7;
  wire USER_DESIGN_INST_1_n_8;
  wire USER_DESIGN_INST_1_n_9;
  wire [3:0]VGA_B;
  wire [0:0]VGA_B_OBUF;
  wire [3:0]VGA_G;
  wire [3:0]VGA_R;
  wire VSYNCH;
  wire VSYNCH_OBUF;
  wire clk0;
  wire clkdv;
  wire locked_internal;
  wire NLW_dcm_sp_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKOUT0_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKOUT1_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKOUT2_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKOUT3_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKOUT5_UNCONNECTED;
  wire NLW_dcm_sp_inst_CLKOUT6_UNCONNECTED;
  wire NLW_dcm_sp_inst_DRDY_UNCONNECTED;
  wire NLW_dcm_sp_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_dcm_sp_inst_DO_UNCONNECTED;
  wire NLW_ethernet_inst_1_RXDV_IBUF_UNCONNECTED;
  wire NLW_ethernet_inst_1_RXER_IBUF_UNCONNECTED;
  wire [1:0]NLW_ethernet_inst_1_D_UNCONNECTED;
PULLUP pullup_KC
       (.O(KC));
PULLUP pullup_KD
       (.O(KD));
initial begin
 $sdf_annotate("cpu_impl_netlist.sdf",,,,"tool_control");
end
  assign \GPIO_BUTTONS[0]  = GPIO_BUTTONS[0];
  assign \GPIO_BUTTONS[1]  = GPIO_BUTTONS[1];
  assign \GPIO_BUTTONS[2]  = GPIO_BUTTONS[2];
  assign \GPIO_BUTTONS[3]  = GPIO_BUTTONS[3];
  assign \GPIO_BUTTONS[4]  = GPIO_BUTTONS[4];
  assign \GPIO_SWITCHES[0]  = GPIO_SWITCHES[0];
  assign \GPIO_SWITCHES[10]  = GPIO_SWITCHES[10];
  assign \GPIO_SWITCHES[11]  = GPIO_SWITCHES[11];
  assign \GPIO_SWITCHES[12]  = GPIO_SWITCHES[12];
  assign \GPIO_SWITCHES[13]  = GPIO_SWITCHES[13];
  assign \GPIO_SWITCHES[14]  = GPIO_SWITCHES[14];
  assign \GPIO_SWITCHES[15]  = GPIO_SWITCHES[15];
  assign \GPIO_SWITCHES[1]  = GPIO_SWITCHES[1];
  assign \GPIO_SWITCHES[2]  = GPIO_SWITCHES[2];
  assign \GPIO_SWITCHES[3]  = GPIO_SWITCHES[3];
  assign \GPIO_SWITCHES[4]  = GPIO_SWITCHES[4];
  assign \GPIO_SWITCHES[5]  = GPIO_SWITCHES[5];
  assign \GPIO_SWITCHES[6]  = GPIO_SWITCHES[6];
  assign \GPIO_SWITCHES[7]  = GPIO_SWITCHES[7];
  assign \GPIO_SWITCHES[8]  = GPIO_SWITCHES[8];
  assign \GPIO_SWITCHES[9]  = GPIO_SWITCHES[9];
  assign \RXD[0]  = RXD[0];
  assign \RXD[1]  = RXD[1];
  OBUF AUDIO_EN_OBUF_inst
       (.I(1'b1),
        .O(AUDIO_EN));
  OBUF AUDIO_OBUF_inst
       (.I(1'b0),
        .O(AUDIO));
  (* box_type = "PRIMITIVE" *)
  BUFG BUFG_INST1
       (.I(clkdv),
        .O(ETH_CLK_OBUF));
  (* box_type = "PRIMITIVE" *)
  BUFG BUFG_INST2
       (.I(clk0),
        .O(CLKFB));
  CHARSVGA CHARSVGA_INST_1
       (.ETH_CLK_OBUF(ETH_CLK_OBUF),
        .HSYNCH(HSYNCH_OBUF),
        .INTERNAL_RST_reg(INTERNAL_RST_reg_n_0),
        .VGA_B_OBUF(VGA_B_OBUF),
        .VSYNCH(VSYNCH_OBUF));
  OBUF ETH_CLK_OBUF_inst
       (.I(ETH_CLK_OBUF),
        .O(ETH_CLK));
  (* OPT_INSERTED *)
  IBUF \GPIO_BUTTONS[0]_IBUF_inst
       (.I(\GPIO_BUTTONS[0] ),
        .O(\GPIO_BUTTONS[0]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_BUTTONS[1]_IBUF_inst
       (.I(\GPIO_BUTTONS[1] ),
        .O(\GPIO_BUTTONS[1]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_BUTTONS[2]_IBUF_inst
       (.I(\GPIO_BUTTONS[2] ),
        .O(\GPIO_BUTTONS[2]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_BUTTONS[3]_IBUF_inst
       (.I(\GPIO_BUTTONS[3] ),
        .O(\GPIO_BUTTONS[3]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_BUTTONS[4]_IBUF_inst
       (.I(\GPIO_BUTTONS[4] ),
        .O(\GPIO_BUTTONS[4]_IBUF ));
  OBUF \GPIO_LEDS_OBUF[0]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[0]));
  OBUF \GPIO_LEDS_OBUF[10]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[10]));
  OBUF \GPIO_LEDS_OBUF[11]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[11]));
  OBUF \GPIO_LEDS_OBUF[12]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[12]));
  OBUF \GPIO_LEDS_OBUF[13]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[13]));
  OBUF \GPIO_LEDS_OBUF[14]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[14]));
  OBUF \GPIO_LEDS_OBUF[15]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[15]));
  OBUF \GPIO_LEDS_OBUF[1]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[1]));
  OBUF \GPIO_LEDS_OBUF[2]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[2]));
  OBUF \GPIO_LEDS_OBUF[3]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[3]));
  OBUF \GPIO_LEDS_OBUF[4]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[4]));
  OBUF \GPIO_LEDS_OBUF[5]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[5]));
  OBUF \GPIO_LEDS_OBUF[6]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[6]));
  OBUF \GPIO_LEDS_OBUF[7]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[7]));
  OBUF \GPIO_LEDS_OBUF[8]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[8]));
  OBUF \GPIO_LEDS_OBUF[9]_inst
       (.I(1'b0),
        .O(GPIO_LEDS[9]));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[0]_IBUF_inst
       (.I(\GPIO_SWITCHES[0] ),
        .O(\GPIO_SWITCHES[0]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[10]_IBUF_inst
       (.I(\GPIO_SWITCHES[10] ),
        .O(\GPIO_SWITCHES[10]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[11]_IBUF_inst
       (.I(\GPIO_SWITCHES[11] ),
        .O(\GPIO_SWITCHES[11]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[12]_IBUF_inst
       (.I(\GPIO_SWITCHES[12] ),
        .O(\GPIO_SWITCHES[12]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[13]_IBUF_inst
       (.I(\GPIO_SWITCHES[13] ),
        .O(\GPIO_SWITCHES[13]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[14]_IBUF_inst
       (.I(\GPIO_SWITCHES[14] ),
        .O(\GPIO_SWITCHES[14]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[15]_IBUF_inst
       (.I(\GPIO_SWITCHES[15] ),
        .O(\GPIO_SWITCHES[15]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[1]_IBUF_inst
       (.I(\GPIO_SWITCHES[1] ),
        .O(\GPIO_SWITCHES[1]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[2]_IBUF_inst
       (.I(\GPIO_SWITCHES[2] ),
        .O(\GPIO_SWITCHES[2]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[3]_IBUF_inst
       (.I(\GPIO_SWITCHES[3] ),
        .O(\GPIO_SWITCHES[3]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[4]_IBUF_inst
       (.I(\GPIO_SWITCHES[4] ),
        .O(\GPIO_SWITCHES[4]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[5]_IBUF_inst
       (.I(\GPIO_SWITCHES[5] ),
        .O(\GPIO_SWITCHES[5]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[6]_IBUF_inst
       (.I(\GPIO_SWITCHES[6] ),
        .O(\GPIO_SWITCHES[6]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[7]_IBUF_inst
       (.I(\GPIO_SWITCHES[7] ),
        .O(\GPIO_SWITCHES[7]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[8]_IBUF_inst
       (.I(\GPIO_SWITCHES[8] ),
        .O(\GPIO_SWITCHES[8]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \GPIO_SWITCHES[9]_IBUF_inst
       (.I(\GPIO_SWITCHES[9] ),
        .O(\GPIO_SWITCHES[9]_IBUF ));
  OBUF HSYNCH_OBUF_inst
       (.I(HSYNCH_OBUF),
        .O(HSYNCH));
  I2C I2C_INST_1
       (.ETH_CLK_OBUF(ETH_CLK_OBUF),
        .INTERNAL_RST_reg(INTERNAL_RST_reg_n_0),
        .SCL_IBUF(SCL_IBUF),
        .SCL_TRI(SCL_TRI),
        .SDA_IBUF(SDA_IBUF),
        .SDA_TRI(SDA_TRI));
  FDRE INTERNAL_RST_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(NOT_LOCKED),
        .Q(INTERNAL_RST_reg_n_0),
        .R(1'b0));
  OBUF \JC_OBUF[0]_inst
       (.I(1'b1),
        .O(JC[0]));
  OBUF \JC_OBUF[1]_inst
       (.I(JC_IBUF),
        .O(JC[1]));
  (* OPT_INSERTED *)
  IBUF KC_IBUF_inst
       (.I(KC),
        .O(KC_IBUF));
  (* OPT_INSERTED *)
  IBUF KD_IBUF_inst
       (.I(KD),
        .O(KD_IBUF));
  OBUF LED_B_PWM_OBUF_inst
       (.I(LED_B_PWM_OBUF),
        .O(LED_B_PWM));
  OBUF LED_G_PWM_OBUF_inst
       (.I(LED_G_PWM_OBUF),
        .O(LED_G_PWM));
  OBUF LED_R_PWM_OBUF_inst
       (.I(LED_R_PWM_OBUF),
        .O(LED_R_PWM));
  LUT1 #(
    .INIT(2'h1))
    NOT_LOCKED_i_1
       (.I0(locked_internal),
        .O(NOT_LOCKED_i_1_n_0));
  FDRE NOT_LOCKED_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(NOT_LOCKED_i_1_n_0),
        .Q(NOT_LOCKED),
        .R(1'b0));
  OBUF PHY_RESET_N_OBUF_inst
       (.I(PHY_RESET_N_OBUF),
        .O(PHY_RESET_N));
  LUT1 #(
    .INIT(2'h1))
    PHY_RESET_N_OBUF_inst_i_1
       (.I0(INTERNAL_RST_reg_n_0),
        .O(PHY_RESET_N_OBUF));
  PWM PWM_INST_1
       (.ETH_CLK_OBUF(ETH_CLK_OBUF),
        .LED_R_PWM_OBUF(LED_R_PWM_OBUF));
  PWM_0 PWM_INST_2
       (.ETH_CLK_OBUF(ETH_CLK_OBUF),
        .LED_G_PWM_OBUF(LED_G_PWM_OBUF));
  PWM_1 PWM_INST_3
       (.ETH_CLK_OBUF(ETH_CLK_OBUF),
        .LED_B_PWM_OBUF(LED_B_PWM_OBUF));
  IBUF RS232_RX_IBUF_inst
       (.I(RS232_RX),
        .O(RS232_RX_IBUF));
  OBUF RS232_TX_OBUF_inst
       (.I(RS232_TX_OBUF),
        .O(RS232_TX));
  IBUF RST_IBUF_inst
       (.I(RST),
        .O(RST_IBUF));
  (* OPT_INSERTED *)
  IBUF RXDV_IBUF_inst
       (.I(RXDV),
        .O(RXDV_IBUF));
  (* OPT_INSERTED *)
  IBUF \RXD[0]_IBUF_inst
       (.I(\RXD[0] ),
        .O(\RXD[0]_IBUF ));
  (* OPT_INSERTED *)
  IBUF \RXD[1]_IBUF_inst
       (.I(\RXD[1] ),
        .O(\RXD[1]_IBUF ));
  (* OPT_INSERTED *)
  IBUF RXER_IBUF_inst
       (.I(RXER),
        .O(RXER_IBUF));
  IOBUF_HD3 SCL_IOBUF_inst
       (.I(1'b0),
        .IO(SCL),
        .O(SCL_IBUF),
        .T(SCL_TRI));
  IOBUF_UNIQ_BASE_ SDA_IOBUF_inst
       (.I(1'b0),
        .IO(SDA),
        .O(SDA_IBUF),
        .T(SDA_TRI));
  SERIAL_INPUT SERIAL_INPUT_INST_1
       (.ETH_CLK_OBUF(ETH_CLK_OBUF),
        .INTERNAL_RST_reg(INTERNAL_RST_reg_n_0),
        .OUT1(OUT1),
        .OUT1_ACK(OUT1_ACK),
        .OUT1_STB(OUT1_STB),
        .RX(RS232_RX_IBUF));
  serial_output SERIAL_OUTPUT_INST_1
       (.ETH_CLK_OBUF(ETH_CLK_OBUF),
        .IN1_ACK(IN1_ACK),
        .IN1_STB(IN1_STB),
        .INTERNAL_RST_reg(INTERNAL_RST_reg_n_0),
        .Q({USER_DESIGN_INST_1_n_2,USER_DESIGN_INST_1_n_3,USER_DESIGN_INST_1_n_4,USER_DESIGN_INST_1_n_5,USER_DESIGN_INST_1_n_6,USER_DESIGN_INST_1_n_7,USER_DESIGN_INST_1_n_8,USER_DESIGN_INST_1_n_9}),
        .RS232_TX_OBUF(RS232_TX_OBUF));
  OBUF \SEVEN_SEGMENT_ANNODE_OBUF[0]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_ANNODE[0]));
  OBUF \SEVEN_SEGMENT_ANNODE_OBUF[1]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_ANNODE[1]));
  OBUF \SEVEN_SEGMENT_ANNODE_OBUF[2]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_ANNODE[2]));
  OBUF \SEVEN_SEGMENT_ANNODE_OBUF[3]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_ANNODE[3]));
  OBUF \SEVEN_SEGMENT_ANNODE_OBUF[4]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_ANNODE[4]));
  OBUF \SEVEN_SEGMENT_ANNODE_OBUF[5]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_ANNODE[5]));
  OBUF \SEVEN_SEGMENT_ANNODE_OBUF[6]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_ANNODE[6]));
  OBUF \SEVEN_SEGMENT_ANNODE_OBUF[7]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_ANNODE[7]));
  OBUF \SEVEN_SEGMENT_CATHODE_OBUF[0]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_CATHODE[0]));
  OBUF \SEVEN_SEGMENT_CATHODE_OBUF[1]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_CATHODE[1]));
  OBUF \SEVEN_SEGMENT_CATHODE_OBUF[2]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_CATHODE[2]));
  OBUF \SEVEN_SEGMENT_CATHODE_OBUF[3]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_CATHODE[3]));
  OBUF \SEVEN_SEGMENT_CATHODE_OBUF[4]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_CATHODE[4]));
  OBUF \SEVEN_SEGMENT_CATHODE_OBUF[5]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_CATHODE[5]));
  OBUF \SEVEN_SEGMENT_CATHODE_OBUF[6]_inst
       (.I(1'b1),
        .O(SEVEN_SEGMENT_CATHODE[6]));
  OBUF \TXD_OBUF[0]_inst
       (.I(TXD_OBUF[0]),
        .O(TXD[0]));
  OBUF \TXD_OBUF[1]_inst
       (.I(TXD_OBUF[1]),
        .O(TXD[1]));
  OBUF TXEN_OBUF_inst
       (.I(TXEN_OBUF),
        .O(TXEN));
  user_design USER_DESIGN_INST_1
       (.ETH_CLK_OBUF(ETH_CLK_OBUF),
        .IN1_ACK(IN1_ACK),
        .IN1_STB(IN1_STB),
        .INTERNAL_RST_reg(INTERNAL_RST_reg_n_0),
        .OUT1(OUT1),
        .OUT1_ACK(OUT1_ACK),
        .OUT1_STB(OUT1_STB),
        .output_rs232_out({USER_DESIGN_INST_1_n_2,USER_DESIGN_INST_1_n_3,USER_DESIGN_INST_1_n_4,USER_DESIGN_INST_1_n_5,USER_DESIGN_INST_1_n_6,USER_DESIGN_INST_1_n_7,USER_DESIGN_INST_1_n_8,USER_DESIGN_INST_1_n_9}));
  OBUF \VGA_B_OBUF[0]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_B[0]));
  OBUF \VGA_B_OBUF[1]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_B[1]));
  OBUF \VGA_B_OBUF[2]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_B[2]));
  OBUF \VGA_B_OBUF[3]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_B[3]));
  OBUF \VGA_G_OBUF[0]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_G[0]));
  OBUF \VGA_G_OBUF[1]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_G[1]));
  OBUF \VGA_G_OBUF[2]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_G[2]));
  OBUF \VGA_G_OBUF[3]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_G[3]));
  OBUF \VGA_R_OBUF[0]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_R[0]));
  OBUF \VGA_R_OBUF[1]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_R[1]));
  OBUF \VGA_R_OBUF[2]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_R[2]));
  OBUF \VGA_R_OBUF[3]_inst
       (.I(VGA_B_OBUF),
        .O(VGA_R[3]));
  OBUF VSYNCH_OBUF_inst
       (.I(VSYNCH_OBUF),
        .O(VSYNCH));
  (* CAPACITANCE = "DONT_CARE" *)
  (* IBUF_DELAY_VALUE = "0" *)
  (* XILINX_LEGACY_PRIM = "IBUFG" *)
  (* box_type = "PRIMITIVE" *)
  IBUF #(
    .IOSTANDARD("DEFAULT"))
    clkin1_buf
       (.I(CLK_IN),
        .O(CLKIN));
  (* XILINX_LEGACY_PRIM = "DCM_SP" *)
  (* XILINX_TRANSFORM_PINMAP = "STATUS[7]:DO[7] STATUS[6]:DO[6] STATUS[5]:DO[5] STATUS[4]:DO[4] STATUS[3]:DO[3] STATUS[2]:DO[2] STATUS[1]:DO[1] STATUS[0]:DO[0] CLKIN:CLKIN1 CLKFX:CLKOUT0 CLKFX180:CLKOUT0B CLK2X:CLKOUT1 CLK2X180:CLKOUT1B CLK90:CLKOUT2 CLK270:CLKOUT2B CLKDV:CLKOUT4 CLK0:CLKFBOUT CLK180:CLKFBOUTB CLKFB:CLKFBIN" *)
  (* box_type = "PRIMITIVE" *)
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(8.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(10.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(2.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(4),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(8),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(90.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(8),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(16),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(1),
    .IS_PSINCDEC_INVERTED(1'b1),
    .IS_RST_INVERTED(1'b1),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .STARTUP_WAIT("FALSE"))
    dcm_sp_inst
       (.CLKFBIN(CLKFB),
        .CLKFBOUT(clk0),
        .CLKFBOUTB(NLW_dcm_sp_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_dcm_sp_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(CLKIN),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_dcm_sp_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(NLW_dcm_sp_inst_CLKOUT0_UNCONNECTED),
        .CLKOUT0B(NLW_dcm_sp_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_dcm_sp_inst_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_dcm_sp_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_dcm_sp_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_dcm_sp_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_dcm_sp_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_dcm_sp_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(clkdv),
        .CLKOUT5(NLW_dcm_sp_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_dcm_sp_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_dcm_sp_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_dcm_sp_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(locked_internal),
        .PSCLK(1'b0),
        .PSDONE(NLW_dcm_sp_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(RST_IBUF));
  rmii_ethernet ethernet_inst_1
       (.D(NLW_ethernet_inst_1_D_UNCONNECTED[1:0]),
        .ETH_CLK_OBUF(ETH_CLK_OBUF),
        .INTERNAL_RST_reg(INTERNAL_RST_reg_n_0),
        .RXDV_IBUF(NLW_ethernet_inst_1_RXDV_IBUF_UNCONNECTED),
        .RXER_IBUF(NLW_ethernet_inst_1_RXER_IBUF_UNCONNECTED),
        .TXD_OBUF(TXD_OBUF),
        .TXEN_OBUF(TXEN_OBUF));
  pwm_audio pwm_audio_inst_1
       (.ETH_CLK_OBUF(ETH_CLK_OBUF),
        .INTERNAL_RST_reg(INTERNAL_RST_reg_n_0),
        .JC_IBUF(JC_IBUF));
endmodule