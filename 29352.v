module
Reset_Delay			u2	(	.iCLK(CLOCK2_50),
							.iRST(KEY[0]),
							.oRST_0(DLY_RST_0),
							.oRST_1(DLY_RST_1),
							.oRST_2(DLY_RST_2),
							.oRST_3(DLY_RST_3),
							.oRST_4(DLY_RST_4)
						);
//D5M image capture
CCD_Capture			u3	(	.oDATA(mCCD_DATA),
							.oDVAL(mCCD_DVAL),
							.oX_Cont(X_Cont),
							.oY_Cont(Y_Cont),
							.oFrame_Cont(Frame_Cont),
							.iDATA(rCCD_DATA),
							.iFVAL(rCCD_FVAL),
							.iLVAL(rCCD_LVAL),
							.iSTART(!KEY[3]|auto_start),
							.iEND(!KEY[2]),
							.iCLK(~D5M_PIXLCLK),
							.iRST(DLY_RST_2),
							.New_Frame(new_frame)
						);
//D5M raw date convert to RGB data
`ifdef VGA_640x480p60
RAW2RGB				u4	(	.iCLK(D5M_PIXLCLK),
							.iRST(DLY_RST_1),
							.iDATA(mCCD_DATA),
							.iDVAL(mCCD_DVAL),
							.oRed(sCCD_R),
							.oGreen(sCCD_G),
							.oBlue(sCCD_B),
							.oDVAL(sCCD_DVAL),
							.iX_Cont(X_Cont),
							.iY_Cont(Y_Cont)
						);
`else
RAW2RGB				u4	(	.iCLK(D5M_PIXLCLK),
							.iRST_n(DLY_RST_1),
							.iData(mCCD_DATA),
							.iDval(mCCD_DVAL),
							.oRed(sCCD_R),
							.oGreen(sCCD_G),
							.oBlue(sCCD_B),
							.oDval(sCCD_DVAL),
							.iZoom(SW[16]),
							.iX_Cont(X_Cont),
							.iY_Cont(Y_Cont)
						);
`endif
//Frame count display
SEG7_LUT_8 			u5	(	.oSEG0(HEX0),.oSEG1(HEX1),
							.oSEG2(HEX2),.oSEG3(HEX3),
							.oSEG4(HEX4),.oSEG5(HEX5),
							.oSEG6(HEX6),.oSEG7(HEX7),
							.iDIG(position[31:0])
						);
sdram_pll 			u6	(
							.inclk0(CLOCK2_50),
							.c0(sdram_ctrl_clk),
							.c1(DRAM_CLK),
							.c2(D5M_XCLKIN), //25M
`ifdef VGA_640x480p60
							.c3(VGA_CLK)     //25M
`else
						    .c4(VGA_CLK)     //40M
`endif
						);
//SDRam Read and Write as Frame Buffer
Sdram_Control	u7	(	//	HOST Side
							.trigger(trigger),
						    .RESET_N(KEY[0]),
							.CLK(sdram_ctrl_clk),
							//	FIFO Write Side 1
							.WR1_DATA({1'b0,5'b00000,G}),
							.WR1(sCCD_DVAL),
							.WR1_ADDR(0),
`ifdef VGA_640x480p60
						    .WR1_MAX_ADDR(640*480/2),
						    .WR1_LENGTH(8'h50),
`else
							.WR1_MAX_ADDR(800*600/2),
							.WR1_LENGTH(8'h80),
`endif
							.WR1_LOAD(!DLY_RST_0),
							.WR1_CLK(D5M_PIXLCLK),
							//	FIFO Write Side 2
							.WR2_DATA({1'b0,5'b00000,P}),
							.WR2(sCCD_DVAL),
							.WR2_ADDR(23'h100000),
`ifdef VGA_640x480p60
						    .WR2_MAX_ADDR(23'h100000+640*480/2),
							.WR2_LENGTH(8'h50),
`else
							.WR2_MAX_ADDR(23'h100000+800*600/2),
							.WR2_LENGTH(8'h80),
`endif
							.WR2_LOAD(!DLY_RST_0),
							.WR2_CLK(D5M_PIXLCLK),
							//	FIFO Read Side 1
						    .RD1_DATA(Read_DATA1),
				        	.RD1(Read),
				        	.RD1_ADDR(0),
`ifdef VGA_640x480p60
						    .RD1_MAX_ADDR(640*480/2),
							.RD1_LENGTH(8'h50),
`else
							.RD1_MAX_ADDR(800*600/2),
							.RD1_LENGTH(8'h80),
`endif
							.RD1_LOAD(!DLY_RST_0),
							.RD1_CLK(~VGA_CTRL_CLK),
							//	FIFO Read Side 2
						    .RD2_DATA(Read_DATA2),
							.RD2(Read),
							.RD2_ADDR(23'h100000),
`ifdef VGA_640x480p60
						    .RD2_MAX_ADDR(23'h100000+640*480/2),
							.RD2_LENGTH(8'h50),
`else
							.RD2_MAX_ADDR(23'h100000+800*600/2),
							.RD2_LENGTH(8'h80),
`endif
				        	.RD2_LOAD(!DLY_RST_0),
							.RD2_CLK(~VGA_CTRL_CLK),
							//	SDRAM Side
						    .SA(DRAM_ADDR),
							.BA(DRAM_BA),
							.CS_N(DRAM_CS_N),
							.CKE(DRAM_CKE),
							.RAS_N(DRAM_RAS_N),
							.CAS_N(DRAM_CAS_N),
							.WE_N(DRAM_WE_N),
							.DQ(DRAM_DQ),
							.DQM(DRAM_DQM)
						);
//D5M I2C control
I2C_CCD_Config 		u8	(	//	Host Side
							.iCLK(CLOCK2_50),
							.iRST_N(DLY_RST_2),
							.iEXPOSURE_ADJ(KEY[1]),
							.iEXPOSURE_DEC_p(SW[0]),
							.iZOOM_MODE_SW(SW[16]),
							//	I2C Side
							.I2C_SCLK(D5M_SCLK),
							.I2C_SDAT(D5M_SDATA)
						);
//VGA DISPLAY
VGA_Controller		u1	(	//	Host Side
							.oRequest(Read),
							.iRed(Read_DATA2[9:0]),
							.iGreen({Read_DATA1[14:10],Read_DATA2[14:10]}),
							.iBlue(Read_DATA1[9:0]),
							//	VGA Side
							.oVGA_R(oVGA_R),
							.oVGA_G(oVGA_G),
							.oVGA_B(oVGA_B),
							.oVGA_H_SYNC(VGA_HS),
							.oVGA_V_SYNC(VGA_VS),
							.oVGA_SYNC(VGA_SYNC_N),
							.oVGA_BLANK(VGA_BLANK_N),
							//	Control Signal
							.iCLK(VGA_CTRL_CLK),
							.iRST_N(DLY_RST_2),
							.iZOOM_MODE_SW(SW[16])
						);
wire	trigger;
assign trigger = (Frame_Cont == 32'h00000100) ? 1'b1 : 1'b0;
rgb2hsv   			r2h(
							.clk(D5M_PIXLCLK),
							.clk_en(1'b1),
							.rst(1'b0),
							.RGB({sCCD_B[11:4],sCCD_G[11:4],sCCD_R[11:4],8'h00}),
								//xxx,
							.HSV(i_HSV)
						);
cvinrange			cir(
							.HSV1(i_HSV),
							.HSV2(i_HSV),
							.outHSV(w_HSV)
						);
/*
assign H = {w_HSV[31:24],2'b00};
assign S = {w_HSV[23:16],2'b00};
assign V = {w_HSV[15:8],2'b00};
*/
//Till this point I am sure that this P refers to pink and G refers to green
//but after those lines the connections to sdram and vga controllers  are mixed
//but it doesn't matter
//because we use those for displaying only and the important is seeing a difference not
//seeing the true colors
assign P = {w_HSV[7:0],2'b00};
assign G = {w_HSV[15:8],2'b00};
assign	LEDR		=	{new_frame,w_HSV[7:0],VGA_VS,position[31:24]};
wire new_frame;
//center_pos  my_center (.x_row(X_Cont),.y_col(Y_Cont),.reset(new_frame),.clk (D5M_PIXLCLK),.center_x(position [31:16]),.center_y( position [15:0]),.valid(w_HSV));
GET_CENTER gc(.clk(D5M_PIXLCLK),.x_pos(X_Cont),.y_pos(Y_Cont),.rst(KEY[0]),.binary_pink(w_HSV[0]),.binary_green(w_HSV[8]),.new_frame(new_frame),.center(position));
wire [31:0] position ;
endmodule