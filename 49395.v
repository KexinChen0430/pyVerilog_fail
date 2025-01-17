module outputs
  wire [7 : 0] VGA_B, VGA_G, VGA_R;
  wire [3 : 0] LED;
  wire VGA_BLANK_n, VGA_HS, VGA_SYNC_n, VGA_VS;
  // inlined wires
  wire led_data_lat_0$whas,
       vga_blue_lat_0$whas,
       vga_green_lat_0$whas,
       vga_horizontalSync_lat_0$whas,
       vga_red_lat_0$whas,
       vga_verticalSync_lat_0$whas;
  // register frameCounter
  reg [5 : 0] frameCounter;
  wire [5 : 0] frameCounter$D_IN;
  wire frameCounter$EN;
  // register ledState
  reg ledState;
  wire ledState$D_IN, ledState$EN;
  // register led_data_dummy2_0
  reg led_data_dummy2_0;
  wire led_data_dummy2_0$D_IN, led_data_dummy2_0$EN;
  // register led_data_dummy2_1
  reg led_data_dummy2_1;
  wire led_data_dummy2_1$D_IN, led_data_dummy2_1$EN;
  // register led_data_rl
  reg [3 : 0] led_data_rl;
  wire [3 : 0] led_data_rl$D_IN;
  wire led_data_rl$EN;
  // register lineCount
  reg [10 : 0] lineCount;
  wire [10 : 0] lineCount$D_IN;
  wire lineCount$EN;
  // register pixelCount
  reg [11 : 0] pixelCount;
  wire [11 : 0] pixelCount$D_IN;
  wire pixelCount$EN;
  // register vga_blank_dummy2_0
  reg vga_blank_dummy2_0;
  wire vga_blank_dummy2_0$D_IN, vga_blank_dummy2_0$EN;
  // register vga_blank_dummy2_1
  reg vga_blank_dummy2_1;
  wire vga_blank_dummy2_1$D_IN, vga_blank_dummy2_1$EN;
  // register vga_blank_rl
  reg vga_blank_rl;
  wire vga_blank_rl$D_IN, vga_blank_rl$EN;
  // register vga_blue_dummy2_0
  reg vga_blue_dummy2_0;
  wire vga_blue_dummy2_0$D_IN, vga_blue_dummy2_0$EN;
  // register vga_blue_dummy2_1
  reg vga_blue_dummy2_1;
  wire vga_blue_dummy2_1$D_IN, vga_blue_dummy2_1$EN;
  // register vga_blue_rl
  reg [7 : 0] vga_blue_rl;
  wire [7 : 0] vga_blue_rl$D_IN;
  wire vga_blue_rl$EN;
  // register vga_green_dummy2_0
  reg vga_green_dummy2_0;
  wire vga_green_dummy2_0$D_IN, vga_green_dummy2_0$EN;
  // register vga_green_dummy2_1
  reg vga_green_dummy2_1;
  wire vga_green_dummy2_1$D_IN, vga_green_dummy2_1$EN;
  // register vga_green_rl
  reg [7 : 0] vga_green_rl;
  wire [7 : 0] vga_green_rl$D_IN;
  wire vga_green_rl$EN;
  // register vga_horizontalSync_dummy2_0
  reg vga_horizontalSync_dummy2_0;
  wire vga_horizontalSync_dummy2_0$D_IN, vga_horizontalSync_dummy2_0$EN;
  // register vga_horizontalSync_dummy2_1
  reg vga_horizontalSync_dummy2_1;
  wire vga_horizontalSync_dummy2_1$D_IN, vga_horizontalSync_dummy2_1$EN;
  // register vga_horizontalSync_rl
  reg vga_horizontalSync_rl;
  wire vga_horizontalSync_rl$D_IN, vga_horizontalSync_rl$EN;
  // register vga_red_dummy2_0
  reg vga_red_dummy2_0;
  wire vga_red_dummy2_0$D_IN, vga_red_dummy2_0$EN;
  // register vga_red_dummy2_1
  reg vga_red_dummy2_1;
  wire vga_red_dummy2_1$D_IN, vga_red_dummy2_1$EN;
  // register vga_red_rl
  reg [7 : 0] vga_red_rl;
  wire [7 : 0] vga_red_rl$D_IN;
  wire vga_red_rl$EN;
  // register vga_verticalSync_dummy2_0
  reg vga_verticalSync_dummy2_0;
  wire vga_verticalSync_dummy2_0$D_IN, vga_verticalSync_dummy2_0$EN;
  // register vga_verticalSync_dummy2_1
  reg vga_verticalSync_dummy2_1;
  wire vga_verticalSync_dummy2_1$D_IN, vga_verticalSync_dummy2_1$EN;
  // register vga_verticalSync_rl
  reg vga_verticalSync_rl;
  wire vga_verticalSync_rl$D_IN, vga_verticalSync_rl$EN;
  // rule scheduling signals
  wire WILL_FIRE_RL_doHBackPorch,
       WILL_FIRE_RL_doHFrontPorch,
       WILL_FIRE_RL_doHSync,
       WILL_FIRE_RL_doHVisible,
       WILL_FIRE_RL_doLed,
       WILL_FIRE_RL_doVBackPorch,
       WILL_FIRE_RL_doVFrontPorch,
       WILL_FIRE_RL_doVSync,
       WILL_FIRE_RL_doVVisible;
  // inputs to muxes for submodule ports
  wire [7 : 0] MUX_vga_blue_lat_0$wset_1__VAL_1,
	       MUX_vga_green_lat_0$wset_1__VAL_1,
	       MUX_vga_red_lat_0$wset_1__VAL_1;
  wire MUX_vga_blue_dummy2_0$write_1__SEL_2,
       MUX_vga_blue_lat_0$wset_1__SEL_1,
       MUX_vga_green_lat_0$wset_1__SEL_1,
       MUX_vga_red_lat_0$wset_1__SEL_1;
  // remaining internal signals
  wire [7 : 0] IF_vga_blue_lat_0_whas__4_THEN_vga_blue_lat_0__ETC___d27,
	       IF_vga_green_lat_0_whas__7_THEN_vga_green_lat__ETC___d20,
	       IF_vga_red_lat_0_whas__0_THEN_vga_red_lat_0_wg_ETC___d13,
	       upd__h12511,
	       upd__h12604,
	       upd__h12697;
  wire [5 : 0] x__h8419;
  wire [3 : 0] IF_led_data_lat_0_whas_THEN_led_data_lat_0_wge_ETC___d6,
	       upd__h12412;
  wire IF_vga_horizontalSync_lat_0_whas__8_THEN_vga_h_ETC___d41,
       IF_vga_verticalSync_lat_0_whas__5_THEN_vga_ver_ETC___d48,
       frameCounter_5_ULT_60___d60,
       lineCount_0_ULT_227___d91,
       lineCount_0_ULT_27___d65,
       lineCount_0_ULT_427___d93,
       lineCount_0_ULT_627___d68,
       upd__h12984,
       upd__h13077;
  // value method ledout_ledOutput
  assign LED = IF_led_data_lat_0_whas_THEN_led_data_lat_0_wge_ETC___d6 ;
  // value method vgaout_redOut
  assign VGA_R = IF_vga_red_lat_0_whas__0_THEN_vga_red_lat_0_wg_ETC___d13 ;
  // value method vgaout_greenOut
  assign VGA_G = IF_vga_green_lat_0_whas__7_THEN_vga_green_lat__ETC___d20 ;
  // value method vgaout_blueOut
  assign VGA_B = IF_vga_blue_lat_0_whas__4_THEN_vga_blue_lat_0__ETC___d27 ;
  // value method vgaout_blankOut
  assign VGA_BLANK_n = vga_blank_rl ;
  // value method vgaout_syncOut
  assign VGA_SYNC_n = 1'b0 ;
  // value method vgaout_horizontalSyncOut
  assign VGA_HS = IF_vga_horizontalSync_lat_0_whas__8_THEN_vga_h_ETC___d41 ;
  // value method vgaout_verticalSyncOut
  assign VGA_VS = IF_vga_verticalSync_lat_0_whas__5_THEN_vga_ver_ETC___d48 ;
  // rule RL_doLed
  assign WILL_FIRE_RL_doLed = lineCount == 11'd628 && pixelCount == 12'd1056 ;
  // rule RL_doVSync
  assign WILL_FIRE_RL_doVSync = lineCount < 11'd4 ;
  // rule RL_doVBackPorch
  assign WILL_FIRE_RL_doVBackPorch =
	     lineCount >= 11'd4 && lineCount_0_ULT_27___d65 ;
  // rule RL_doVVisible
  assign WILL_FIRE_RL_doVVisible =
	     !lineCount_0_ULT_27___d65 && lineCount_0_ULT_627___d68 ;
  // rule RL_doVFrontPorch
  assign WILL_FIRE_RL_doVFrontPorch =
	     !lineCount_0_ULT_627___d68 && lineCount < 11'd628 ;
  // rule RL_doHSync
  assign WILL_FIRE_RL_doHSync =
	     pixelCount <= 12'd127 && !lineCount_0_ULT_27___d65 &&
	     lineCount_0_ULT_627___d68 ;
  // rule RL_doHBackPorch
  assign WILL_FIRE_RL_doHBackPorch =
	     pixelCount >= 12'd128 && pixelCount < 12'd215 &&
	     !lineCount_0_ULT_27___d65 &&
	     lineCount_0_ULT_627___d68 ;
  // rule RL_doHVisible
  assign WILL_FIRE_RL_doHVisible =
	     pixelCount >= 12'd216 && pixelCount <= 12'd1015 &&
	     !lineCount_0_ULT_27___d65 &&
	     lineCount_0_ULT_627___d68 ;
  // rule RL_doHFrontPorch
  assign WILL_FIRE_RL_doHFrontPorch =
	     pixelCount >= 12'd1016 && pixelCount <= 12'd1055 &&
	     !lineCount_0_ULT_27___d65 &&
	     lineCount_0_ULT_627___d68 ;
  // inputs to muxes for submodule ports
  assign MUX_vga_blue_dummy2_0$write_1__SEL_2 =
	     WILL_FIRE_RL_doHFrontPorch || WILL_FIRE_RL_doHBackPorch ||
	     WILL_FIRE_RL_doHSync ;
  assign MUX_vga_blue_lat_0$wset_1__SEL_1 = WILL_FIRE_RL_doHVisible && 1'b1 ;
  assign MUX_vga_green_lat_0$wset_1__SEL_1 = WILL_FIRE_RL_doHVisible && 1'b1 ;
  assign MUX_vga_red_lat_0$wset_1__SEL_1 = WILL_FIRE_RL_doHVisible && 1'b1 ;
  assign MUX_vga_blue_lat_0$wset_1__VAL_1 =
	     lineCount_0_ULT_227___d91 ?
	       8'd0 :
	       ((!lineCount_0_ULT_227___d91 && lineCount_0_ULT_427___d93) ?
		  8'd0 :
		  8'd255) ;
  assign MUX_vga_green_lat_0$wset_1__VAL_1 =
	     lineCount_0_ULT_227___d91 ?
	       8'd0 :
	       ((!lineCount_0_ULT_227___d91 && lineCount_0_ULT_427___d93) ?
		  8'd255 :
		  8'd0) ;
  assign MUX_vga_red_lat_0$wset_1__VAL_1 =
	     lineCount_0_ULT_227___d91 ? 8'd255 : 8'd0 ;
  // inlined wires
  assign led_data_lat_0$whas = WILL_FIRE_RL_doLed && frameCounter == 6'd0 ;
  assign vga_red_lat_0$whas =
	     WILL_FIRE_RL_doHVisible && 1'b1 || WILL_FIRE_RL_doHFrontPorch ||
	     WILL_FIRE_RL_doHBackPorch ||
	     WILL_FIRE_RL_doHSync ;
  assign vga_green_lat_0$whas =
	     WILL_FIRE_RL_doHVisible && 1'b1 || WILL_FIRE_RL_doHFrontPorch ||
	     WILL_FIRE_RL_doHBackPorch ||
	     WILL_FIRE_RL_doHSync ;
  assign vga_blue_lat_0$whas =
	     WILL_FIRE_RL_doHVisible && 1'b1 || WILL_FIRE_RL_doHFrontPorch ||
	     WILL_FIRE_RL_doHBackPorch ||
	     WILL_FIRE_RL_doHSync ;
  assign vga_horizontalSync_lat_0$whas =
	     WILL_FIRE_RL_doHSync || WILL_FIRE_RL_doHFrontPorch ||
	     WILL_FIRE_RL_doHBackPorch ;
  assign vga_verticalSync_lat_0$whas =
	     WILL_FIRE_RL_doVSync || WILL_FIRE_RL_doVFrontPorch ||
	     WILL_FIRE_RL_doVVisible ||
	     WILL_FIRE_RL_doVBackPorch ;
  // register frameCounter
  assign frameCounter$D_IN = frameCounter_5_ULT_60___d60 ? x__h8419 : 6'd0 ;
  assign frameCounter$EN =
	     WILL_FIRE_RL_doLed &&
	     (frameCounter_5_ULT_60___d60 || frameCounter == 6'd60) ;
  // register ledState
  assign ledState$D_IN = !ledState ;
  assign ledState$EN = led_data_lat_0$whas ;
  // register led_data_dummy2_0
  assign led_data_dummy2_0$D_IN = 1'd1 ;
  assign led_data_dummy2_0$EN = led_data_lat_0$whas ;
  // register led_data_dummy2_1
  assign led_data_dummy2_1$D_IN = 1'b0 ;
  assign led_data_dummy2_1$EN = 1'b0 ;
  // register led_data_rl
  assign led_data_rl$D_IN =
	     IF_led_data_lat_0_whas_THEN_led_data_lat_0_wge_ETC___d6 ;
  assign led_data_rl$EN = 1'd1 ;
  // register lineCount
  assign lineCount$D_IN = (lineCount == 11'd628) ? 11'd0 : lineCount + 11'd1 ;
  assign lineCount$EN = pixelCount == 12'd0 ;
  // register pixelCount
  assign pixelCount$D_IN =
	     (pixelCount == 12'd1056) ? 12'd0 : pixelCount + 12'd1 ;
  assign pixelCount$EN = 1'd1 ;
  // register vga_blank_dummy2_0
  assign vga_blank_dummy2_0$D_IN = 1'b0 ;
  assign vga_blank_dummy2_0$EN = 1'b0 ;
  // register vga_blank_dummy2_1
  assign vga_blank_dummy2_1$D_IN = 1'b0 ;
  assign vga_blank_dummy2_1$EN = 1'b0 ;
  // register vga_blank_rl
  assign vga_blank_rl$D_IN = vga_blank_rl ;
  assign vga_blank_rl$EN = 1'd1 ;
  // register vga_blue_dummy2_0
  assign vga_blue_dummy2_0$D_IN = 1'd1 ;
  assign vga_blue_dummy2_0$EN =
	     WILL_FIRE_RL_doHVisible && 1'b1 || WILL_FIRE_RL_doHFrontPorch ||
	     WILL_FIRE_RL_doHBackPorch ||
	     WILL_FIRE_RL_doHSync ;
  // register vga_blue_dummy2_1
  assign vga_blue_dummy2_1$D_IN = 1'b0 ;
  assign vga_blue_dummy2_1$EN = 1'b0 ;
  // register vga_blue_rl
  assign vga_blue_rl$D_IN =
	     IF_vga_blue_lat_0_whas__4_THEN_vga_blue_lat_0__ETC___d27 ;
  assign vga_blue_rl$EN = 1'd1 ;
  // register vga_green_dummy2_0
  assign vga_green_dummy2_0$D_IN = 1'd1 ;
  assign vga_green_dummy2_0$EN =
	     WILL_FIRE_RL_doHVisible && 1'b1 || WILL_FIRE_RL_doHFrontPorch ||
	     WILL_FIRE_RL_doHBackPorch ||
	     WILL_FIRE_RL_doHSync ;
  // register vga_green_dummy2_1
  assign vga_green_dummy2_1$D_IN = 1'b0 ;
  assign vga_green_dummy2_1$EN = 1'b0 ;
  // register vga_green_rl
  assign vga_green_rl$D_IN =
	     IF_vga_green_lat_0_whas__7_THEN_vga_green_lat__ETC___d20 ;
  assign vga_green_rl$EN = 1'd1 ;
  // register vga_horizontalSync_dummy2_0
  assign vga_horizontalSync_dummy2_0$D_IN = 1'd1 ;
  assign vga_horizontalSync_dummy2_0$EN =
	     MUX_vga_blue_dummy2_0$write_1__SEL_2 ;
  // register vga_horizontalSync_dummy2_1
  assign vga_horizontalSync_dummy2_1$D_IN = 1'b0 ;
  assign vga_horizontalSync_dummy2_1$EN = 1'b0 ;
  // register vga_horizontalSync_rl
  assign vga_horizontalSync_rl$D_IN =
	     IF_vga_horizontalSync_lat_0_whas__8_THEN_vga_h_ETC___d41 ;
  assign vga_horizontalSync_rl$EN = 1'd1 ;
  // register vga_red_dummy2_0
  assign vga_red_dummy2_0$D_IN = 1'd1 ;
  assign vga_red_dummy2_0$EN =
	     WILL_FIRE_RL_doHVisible && 1'b1 || WILL_FIRE_RL_doHFrontPorch ||
	     WILL_FIRE_RL_doHBackPorch ||
	     WILL_FIRE_RL_doHSync ;
  // register vga_red_dummy2_1
  assign vga_red_dummy2_1$D_IN = 1'b0 ;
  assign vga_red_dummy2_1$EN = 1'b0 ;
  // register vga_red_rl
  assign vga_red_rl$D_IN =
	     IF_vga_red_lat_0_whas__0_THEN_vga_red_lat_0_wg_ETC___d13 ;
  assign vga_red_rl$EN = 1'd1 ;
  // register vga_verticalSync_dummy2_0
  assign vga_verticalSync_dummy2_0$D_IN = 1'd1 ;
  assign vga_verticalSync_dummy2_0$EN =
	     WILL_FIRE_RL_doVFrontPorch || WILL_FIRE_RL_doVVisible ||
	     WILL_FIRE_RL_doVBackPorch ||
	     WILL_FIRE_RL_doVSync ;
  // register vga_verticalSync_dummy2_1
  assign vga_verticalSync_dummy2_1$D_IN = 1'b0 ;
  assign vga_verticalSync_dummy2_1$EN = 1'b0 ;
  // register vga_verticalSync_rl
  assign vga_verticalSync_rl$D_IN =
	     IF_vga_verticalSync_lat_0_whas__5_THEN_vga_ver_ETC___d48 ;
  assign vga_verticalSync_rl$EN = 1'd1 ;
  // remaining internal signals
  assign IF_led_data_lat_0_whas_THEN_led_data_lat_0_wge_ETC___d6 =
	     led_data_lat_0$whas ? upd__h12412 : led_data_rl ;
  assign IF_vga_blue_lat_0_whas__4_THEN_vga_blue_lat_0__ETC___d27 =
	     vga_blue_lat_0$whas ? upd__h12697 : vga_blue_rl ;
  assign IF_vga_green_lat_0_whas__7_THEN_vga_green_lat__ETC___d20 =
	     vga_green_lat_0$whas ? upd__h12604 : vga_green_rl ;
  assign IF_vga_horizontalSync_lat_0_whas__8_THEN_vga_h_ETC___d41 =
	     vga_horizontalSync_lat_0$whas ?
	       upd__h12984 :
	       vga_horizontalSync_rl ;
  assign IF_vga_red_lat_0_whas__0_THEN_vga_red_lat_0_wg_ETC___d13 =
	     vga_red_lat_0$whas ? upd__h12511 : vga_red_rl ;
  assign IF_vga_verticalSync_lat_0_whas__5_THEN_vga_ver_ETC___d48 =
	     vga_verticalSync_lat_0$whas ? upd__h13077 : vga_verticalSync_rl ;
  assign frameCounter_5_ULT_60___d60 = frameCounter < 6'd60 ;
  assign lineCount_0_ULT_227___d91 = lineCount < 11'd227 ;
  assign lineCount_0_ULT_27___d65 = lineCount < 11'd27 ;
  assign lineCount_0_ULT_427___d93 = lineCount < 11'd427 ;
  assign lineCount_0_ULT_627___d68 = lineCount < 11'd627 ;
  assign upd__h12412 = { 3'd0, ledState } ;
  assign upd__h12511 =
	     MUX_vga_red_lat_0$wset_1__SEL_1 ?
	       MUX_vga_red_lat_0$wset_1__VAL_1 :
	       8'd0 ;
  assign upd__h12604 =
	     MUX_vga_green_lat_0$wset_1__SEL_1 ?
	       MUX_vga_green_lat_0$wset_1__VAL_1 :
	       8'd0 ;
  assign upd__h12697 =
	     MUX_vga_blue_lat_0$wset_1__SEL_1 ?
	       MUX_vga_blue_lat_0$wset_1__VAL_1 :
	       8'd0 ;
  assign upd__h12984 = !WILL_FIRE_RL_doHSync ;
  assign upd__h13077 = !WILL_FIRE_RL_doVSync ;
  assign x__h8419 = frameCounter + 6'd1 ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        frameCounter <= `BSV_ASSIGNMENT_DELAY 6'd0;
	ledState <= `BSV_ASSIGNMENT_DELAY 1'd0;
	led_data_dummy2_0 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	led_data_dummy2_1 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	led_data_rl <= `BSV_ASSIGNMENT_DELAY 4'd0;
	lineCount <= `BSV_ASSIGNMENT_DELAY 11'd0;
	pixelCount <= `BSV_ASSIGNMENT_DELAY 12'd0;
	vga_blank_dummy2_0 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_blank_dummy2_1 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_blank_rl <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_blue_dummy2_0 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_blue_dummy2_1 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_blue_rl <= `BSV_ASSIGNMENT_DELAY 8'd0;
	vga_green_dummy2_0 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_green_dummy2_1 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_green_rl <= `BSV_ASSIGNMENT_DELAY 8'd0;
	vga_horizontalSync_dummy2_0 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_horizontalSync_dummy2_1 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_horizontalSync_rl <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_red_dummy2_0 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_red_dummy2_1 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_red_rl <= `BSV_ASSIGNMENT_DELAY 8'd0;
	vga_verticalSync_dummy2_0 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_verticalSync_dummy2_1 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	vga_verticalSync_rl <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (frameCounter$EN)
	  frameCounter <= `BSV_ASSIGNMENT_DELAY frameCounter$D_IN;
	if (ledState$EN) ledState <= `BSV_ASSIGNMENT_DELAY ledState$D_IN;
	if (led_data_dummy2_0$EN)
	  led_data_dummy2_0 <= `BSV_ASSIGNMENT_DELAY led_data_dummy2_0$D_IN;
	if (led_data_dummy2_1$EN)
	  led_data_dummy2_1 <= `BSV_ASSIGNMENT_DELAY led_data_dummy2_1$D_IN;
	if (led_data_rl$EN)
	  led_data_rl <= `BSV_ASSIGNMENT_DELAY led_data_rl$D_IN;
	if (lineCount$EN) lineCount <= `BSV_ASSIGNMENT_DELAY lineCount$D_IN;
	if (pixelCount$EN)
	  pixelCount <= `BSV_ASSIGNMENT_DELAY pixelCount$D_IN;
	if (vga_blank_dummy2_0$EN)
	  vga_blank_dummy2_0 <= `BSV_ASSIGNMENT_DELAY vga_blank_dummy2_0$D_IN;
	if (vga_blank_dummy2_1$EN)
	  vga_blank_dummy2_1 <= `BSV_ASSIGNMENT_DELAY vga_blank_dummy2_1$D_IN;
	if (vga_blank_rl$EN)
	  vga_blank_rl <= `BSV_ASSIGNMENT_DELAY vga_blank_rl$D_IN;
	if (vga_blue_dummy2_0$EN)
	  vga_blue_dummy2_0 <= `BSV_ASSIGNMENT_DELAY vga_blue_dummy2_0$D_IN;
	if (vga_blue_dummy2_1$EN)
	  vga_blue_dummy2_1 <= `BSV_ASSIGNMENT_DELAY vga_blue_dummy2_1$D_IN;
	if (vga_blue_rl$EN)
	  vga_blue_rl <= `BSV_ASSIGNMENT_DELAY vga_blue_rl$D_IN;
	if (vga_green_dummy2_0$EN)
	  vga_green_dummy2_0 <= `BSV_ASSIGNMENT_DELAY vga_green_dummy2_0$D_IN;
	if (vga_green_dummy2_1$EN)
	  vga_green_dummy2_1 <= `BSV_ASSIGNMENT_DELAY vga_green_dummy2_1$D_IN;
	if (vga_green_rl$EN)
	  vga_green_rl <= `BSV_ASSIGNMENT_DELAY vga_green_rl$D_IN;
	if (vga_horizontalSync_dummy2_0$EN)
	  vga_horizontalSync_dummy2_0 <= `BSV_ASSIGNMENT_DELAY
	      vga_horizontalSync_dummy2_0$D_IN;
	if (vga_horizontalSync_dummy2_1$EN)
	  vga_horizontalSync_dummy2_1 <= `BSV_ASSIGNMENT_DELAY
	      vga_horizontalSync_dummy2_1$D_IN;
	if (vga_horizontalSync_rl$EN)
	  vga_horizontalSync_rl <= `BSV_ASSIGNMENT_DELAY
	      vga_horizontalSync_rl$D_IN;
	if (vga_red_dummy2_0$EN)
	  vga_red_dummy2_0 <= `BSV_ASSIGNMENT_DELAY vga_red_dummy2_0$D_IN;
	if (vga_red_dummy2_1$EN)
	  vga_red_dummy2_1 <= `BSV_ASSIGNMENT_DELAY vga_red_dummy2_1$D_IN;
	if (vga_red_rl$EN)
	  vga_red_rl <= `BSV_ASSIGNMENT_DELAY vga_red_rl$D_IN;
	if (vga_verticalSync_dummy2_0$EN)
	  vga_verticalSync_dummy2_0 <= `BSV_ASSIGNMENT_DELAY
	      vga_verticalSync_dummy2_0$D_IN;
	if (vga_verticalSync_dummy2_1$EN)
	  vga_verticalSync_dummy2_1 <= `BSV_ASSIGNMENT_DELAY
	      vga_verticalSync_dummy2_1$D_IN;
	if (vga_verticalSync_rl$EN)
	  vga_verticalSync_rl <= `BSV_ASSIGNMENT_DELAY
	      vga_verticalSync_rl$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    frameCounter = 6'h2A;
    ledState = 1'h0;
    led_data_dummy2_0 = 1'h0;
    led_data_dummy2_1 = 1'h0;
    led_data_rl = 4'hA;
    lineCount = 11'h2AA;
    pixelCount = 12'hAAA;
    vga_blank_dummy2_0 = 1'h0;
    vga_blank_dummy2_1 = 1'h0;
    vga_blank_rl = 1'h0;
    vga_blue_dummy2_0 = 1'h0;
    vga_blue_dummy2_1 = 1'h0;
    vga_blue_rl = 8'hAA;
    vga_green_dummy2_0 = 1'h0;
    vga_green_dummy2_1 = 1'h0;
    vga_green_rl = 8'hAA;
    vga_horizontalSync_dummy2_0 = 1'h0;
    vga_horizontalSync_dummy2_1 = 1'h0;
    vga_horizontalSync_rl = 1'h0;
    vga_red_dummy2_0 = 1'h0;
    vga_red_dummy2_1 = 1'h0;
    vga_red_rl = 8'hAA;
    vga_verticalSync_dummy2_0 = 1'h0;
    vga_verticalSync_dummy2_1 = 1'h0;
    vga_verticalSync_rl = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule