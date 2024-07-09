module Mod_Teste_LCD (
// Parte 1
		////////////////////	LCD Module 16X2		////////////////
		LCD_ON,							//	LCD Power ON/OFF
		LCD_BLON,						//	LCD Back Light ON/OFF
		LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
		LCD_EN,							//	LCD Enable
		LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		LCD_DATA,						//	LCD Data bus 8 bits
		GPIO_0,							// GPIO
		GPIO_1,
	);
// Parte 2
	////////////////////	LCD Module 16X2	////////////////////////////
	inout	[7:0]	LCD_DATA;				//	LCD Data bus 8 bits
	output			LCD_ON;					//	LCD Power ON/OFF
	output			LCD_BLON;				//	LCD Back Light ON/OFF
	output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
	output			LCD_EN;					//	LCD Enable
	output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
	inout	[35:0]	GPIO_0;					//	GPIO Connection 0
	inout	[35:0]	GPIO_1;					//	GPIO Connection 1
//	All inout port turn to tri-state
	assign	GPIO_1		=	36'hzzzzzzzzz;
	assign	GPIO_0		=	36'hzzzzzzzzz;
	//	LCD
	assign	LCD_ON		=	1'b1;
	assign	LCD_BLON		=	1'b1;
	LCD_TEST 			u5	(
							//	Host Side
							.iCLK  	( CLOCK_50 ),
							.iRST_N	( KEY[0] ),
							// Data to display
							.d0 (16'h0000),	// 4 dígitos canto superior esquerdo
							.d1 (16'h1111),	// 4 dígitos superior meio
							.d2 (16'h2222),	// 4 dígitos canto superior direito
							.d3 (16'h3333),	// 4 dígitos canto inferior esquerdo
							.d4 (16'h4444),	// 4 dígitos inferior meio
							.d5 (16'h5555),	// 4 dígitos canto inferior direito
							//	LCD Side
							.LCD_DATA( LCD_DATA ),
							.LCD_RW  ( LCD_RW ),
							.LCD_EN	( LCD_EN ),
							.LCD_RS  ( LCD_RS )
							);
endmodule