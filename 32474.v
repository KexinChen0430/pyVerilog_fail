module control (
	input CLOCK_50,
	input CLOCK_27,
	input [3:0] KEY,
	input [3:0] SW,
	output [17:0] LEDR,
	output [7:6] LEDG,
	output [2:0] GPIO_1,
	output [6:0] HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0,
	//	LCD Module 16X2
   output LCD_ON,
   output LCD_BLON,
   output LCD_RW,
   output LCD_EN,
   output LCD_RS,
   inout [7:0] LCD_DATA,
	// Speakers
	input	AUD_ADCDAT,
	// Bidirectionals
	inout	AUD_BCLK,
	inout	AUD_ADCLRCK,
	inout	AUD_DACLRCK,
	inout	I2C_SDAT,
	// Outputs
	output AUD_XCK,
	output AUD_DACDAT,
	output I2C_SCLK
	);
	// 1hz Clock
	wire Clk_1hz;
	clk_convert c0 (CLOCK_50, 1, 1, Clk_1hz);
	// reset delay gives some time for peripherals to initialize
	wire DLY_RST;
	Reset_Delay r0(.iCLK(CLOCK_50),.oRESET(DLY_RST));
	// turn LCD ON
	assign	LCD_ON = 1'b1;
	assign	LCD_BLON	= 1'b1;
	// assignments to incorporate lcd display
	LCD_Display u1(
	// Host Side
   .iCLK_50MHZ(CLOCK_50),
   .iRST_N(DLY_RST),
   .state_code(STATE),
	// LCD Side
   .DATA_BUS(LCD_DATA),
   .LCD_RW(LCD_RW),
   .LCD_E(LCD_EN),
   .LCD_RS(LCD_RS)
	);
	// assignments to incorporate the speakers
	DE2_Audio_Example ex1 (
	CLOCK_50,
	CLOCK_27,
	AUD_ADCDAT,
	AUD_BCLK,
	AUD_ADCLRCK,
	AUD_DACLRCK,
	I2C_SDAT,
	AUD_XCK,
	AUD_DACDAT,
	I2C_SCLK,
	ME
	);
	//Feed Beep FSM
	reg [4:0] STATE;
	wire O;
	assign O = KEY[0];
	parameter [4:0] A = 5'b00000, B = 5'b00001,
						  C = 5'b00010, D = 5'b00100,
	 					  E = 5'b01000, F = 5'b10000;
	assign LEDR[16]=STATE[0];//enableB
	assign LEDR[15]=STATE[1];//enC
	assign LEDR[14]=STATE[2];//enD
	assign LEDR[13]=STATE[3];//enE
	assign LEDR[12]=STATE[4];//enF
	//The FSM controls bellow circuit using the ones of the One-Hot-Encoding
	always @(posedge O)
		case(STATE)
			A:
				if(O) STATE=B;
				else STATE=A;
			B:
				if(O) STATE=C;
				else STATE=B;
			C:
				if(O) STATE=D;
				else STATE=C;
			D:
				if(O) STATE=E;
				else STATE=D;
			E:
				if(O) STATE=F;
				else STATE=E;
			F:
				if(O) STATE=A;
				else STATE=F;
		default: STATE=5'bxxxxx;
		endcase
	// Operations with state dependance
	wire
	RExe = KEY[3], Add = KEY[1], RClk = KEY[2], SDispl = SW[0];
	// Need different times.
	wire [3:0] hour2, hour1, minute2, minute1, second2, second1;//initial time
	wire [3:0] chour2, chour1, cminute2, cminute1, csecond2, csecond1;//current time
	wire [3:0] mhour2, mhour1, mminute2, mminute1, msecond2, msecond1;//meal time
	reg [3:0] dhour2, dhour1, dminute2, dminute1, dsecond2, dsecond1;//display time
	// Circuits and variables for Setting Up (initial and meal) Time and Running (current time)))
	//SW[5]&~SW[4] to set hours, opposite for setting minutes
	set_time s0 (Add, SW[2]&(STATE[0]|STATE[2]), SW[1]&(STATE[0]|STATE[2]), hour2, hour1, minute2, minute1, second2, second1);
	set_time s1 (Add, SW[2]&(STATE[0]|STATE[2]), SW[1]&(STATE[0]|STATE[2]), mhour2, mhour1, mminute2, mminute1, msecond2, msecond1);
	run_clock rclk0 (RClk, Clk_1hz, hour2, hour1, minute2, minute1, second2, second1, chour2, chour1, cminute2, cminute1, csecond2, csecond1);
	// Circuits and variables for Control of motor
	// Motor Enable, Motor Terminal 1 & 2
	wire ME, MT1, MT2;
	assign LEDR[0] = ME; assign LEDG[7] = MT1; assign LEDG[6] = MT2;
	assign GPIO_1[2] = ME; assign GPIO_1[1] = MT1; assign GPIO_1[0] = MT2;
	reg [31:0] delay;
	always @(SW[3])
		if(~SW[3]) delay = 32'd100000000;
		else delay = 32'd250000000;
	executer e0 (CLOCK_50, KEY[3], delay, 2333333,
	mhour2, mhour1, mminute2, mminute1, msecond2, msecond1,
	chour2, chour1, cminute2, cminute1, csecond2, csecond1,
	ME, MT1, MT2);
	//Circuits for displaying time
	always @ (SDispl)
	if (~SDispl)
		begin
		dhour2 = hour2; dhour1 = hour1; dminute2 = minute2; dminute1 = minute1; dsecond2 = second2; dsecond1 = second1;
		end
	else
		begin
		dhour2 = chour2; dhour1 = chour1; dminute2 = cminute2; dminute1 = cminute1; dsecond2 = csecond2; dsecond1 = csecond1;
		end
	display_time d0 (dhour2, dhour1, dminute2, dminute1, dsecond2, dsecond1, HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
endmodule