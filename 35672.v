module DE2_synthesizer (
		////////////////////	Clock Input	 	////////////////////
		CLOCK_27,							//	27 MHz
		CLOCK_50,							//	50 MHz
		////////////////////	Push Button		////////////////////
		START_KEY1,
		START_KEY2,
		////////////////////	DPDT Switch		////////////////////
		SW_MUTE,
		////////////////////	I2C		////////////////////////////
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,						//	Audio CODEC ADC Data
		AUD_DACLRCK,					//	Audio CODEC DAC LR Clock
		AUD_DACDAT,						//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		TD_RESET,						//	TV Decoder Reset
	);
	input			CLOCK_27;					//	27 MHz
	input			CLOCK_50;					//	50 MHz
	input			START_KEY1;
	input			START_KEY2;
	input 		SW_MUTE;
	inout			I2C_SDAT;				//	I2C Data
	output		I2C_SCLK;				//	I2C Clock
	inout			AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
	inout			AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
	input			AUD_ADCDAT;			    //	Audio CODEC ADC Data
	output		AUD_DACDAT;				//	Audio CODEC DAC Data
	inout			AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
	output		AUD_XCK;				//	Audio CODEC Chip Clock
	output		TD_RESET;				//	TV Decoder Reset
	assign  TD_RESET    =   1;
//  I2C
	wire I2C_END;
	I2C_AV_Config 		u7	(	//	Host Side
								.iCLK		( CLOCK_50 ),
								.iRST_N		( 1'b1 ),
								.o_I2C_END	( I2C_END ),
								//	I2C Side
								.I2C_SCLK	( I2C_SCLK ),
								.I2C_SDAT	( I2C_SDAT )
								);
//	AUDIO SOUND
	wire    AUD_CTRL_CLK;
	assign	AUD_ADCLRCK	=	AUD_DACLRCK;
	assign	AUD_XCK		=	AUD_CTRL_CLK;
//  AUDIO PLL
	VGA_Audio_PLL 		u1	(
								.areset ( ~I2C_END ),
								.inclk0 ( CLOCK_27 ),
								.c1		( AUD_CTRL_CLK )
								);
// Music Synthesizer Block //
// TIME & CLOCK Generater //
	reg    [31:0]VGA_CLK_o;
	wire   keyboard_sysclk = VGA_CLK_o[11];
	wire   demo_clock1      = VGA_CLK_o[10];
	wire   demo_clock2      = VGA_CLK_o[18];
	always @( posedge CLOCK_50 ) VGA_CLK_o = VGA_CLK_o + 1;
// DEMO SOUND //
// DEMO Sound (CH1) //
	wire [7:0]demo_code1;
	wire [7:0]demo_code2;
	wire [7:0]demo_code;
	assign demo_code = (START_KEY1 == 1'b0) ? demo_code1 : demo_code2;
	demo_sound1	ticking1(
		.clock   ( demo_clock1 ),
		.key_code( demo_code1 ),
		.k_tr    ( START_KEY1 )
	);
	demo_sound2	johncena(
		.clock   ( demo_clock2 ),
		.key_code( demo_code2 ),
		.k_tr    ( START_KEY2 )
	);
	wire [15:0]sound1;
	wire sound_off1;
// Staff Display & Sound Output //
	staff st1(
		.scan_code1( demo_code ),
		.sound1( sound1 ),
		.sound_off1( sound_off1 )
	);
// 2CH Audio Sound output -- Audio Generater //
	adio_codec ad1	(
		// AUDIO CODEC //
		.oAUD_BCK ( AUD_BCLK ),
		.oAUD_DATA( AUD_DACDAT ),
		.oAUD_LRCK( AUD_DACLRCK ),
		.iCLK_18_4( AUD_CTRL_CLK ),
		// KEY //
		.iRST_N( 1'b1 ),
		.iSrc_Select( 2'b00 ),
		// Sound Control //
		.key1_on( ~SW_MUTE & sound_off1 ),//CH1 ON / OFF
		.sound1( sound1 )// CH1 Freq
	);
endmodule