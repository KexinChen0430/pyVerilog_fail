module LCD(
input wire Clock,
input wire Reset,
//output wire oLCD_Enabled,
output reg oLCD_RegisterSelect, //0=Command, 1=Data
output wire oLCD_StrataFlashControl,
output wire oLCD_ReadWrite,
output reg[3:0] oLCD_Data
    );
reg rWrite_Enabled;
assign oLCD_ReadWrite = 0; //I only Write to the LCD display, never Read from it
assign oLCD_StrataFlashControl = 1; //StrataFlash disabled. Full read/write access to LCD
reg [7:0] rCurrentState,rNextState;
reg [31:0] rTimeCount;
reg rTimeCountReset;
wire wWriteDone;
//Next State and delay logic
	always
	begin
		#1500000  rWrite_Enabled =  ! rWrite_Enabled;
	end
initial
begin
		rWrite_Enabled = 0;
end
always @ ( posedge Clock )
begin
if (Reset)
	begin
		rCurrentState <= `STATE_RESET;
		rTimeCount <= 32'b0;
//		rWrite_Enabled = 0;
	end
else
	begin
		if (rTimeCountReset)
			begin
			rTimeCount <= 32'b0;
			end
		else
			begin
			rTimeCount <= rTimeCount + 32'b1;
			end
		rCurrentState <= rNextState;
	end
end
//Current state and output logic
always @ ( * )
begin
case (rCurrentState)
`STATE_RESET:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0;
rTimeCountReset = 1'b0;
rNextState = `STATE_POWERON_INIT_0_A;
end
/*
Wait 15 ms or longer.
The 15 ms interval is 750,000 clock cycles at 50 MHz.
*/
`STATE_POWERON_INIT_0_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd4870000)
//if (rTimeCount > 32'd7500 )
 rNextState = `STATE_POWERON_INIT_0_B;
else
 rNextState = `STATE_POWERON_INIT_0_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_POWERON_INIT_0_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_POWERON_INIT_1_low;
end
/*
Write SF_D<11:8> = 0x3, pulse LCD_E High for 12 clock cycles
*/
`STATE_POWERON_INIT_1_low:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'h2;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
//rNextState = `STATE_POWERON_INIT_1_wait_A;
//else
rNextState = `STATE_POWERON_INIT_1_wait_A;
end
`STATE_POWERON_INIT_1_wait_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h2;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd3000000)
//if (rTimeCount > 32'd1 )
 rNextState = `STATE_POWERON_INIT_1_wait_B;
else
 rNextState = `STATE_POWERON_INIT_1_wait_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_POWERON_INIT_1_wait_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h8;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_FUNCTIONSET_wait_high_A;
end
/*
`STATE_POWERON_INIT_1_high:
begin
rWrite_Enabled = 1'b1;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_POWERON_INIT_2_A;
//else
//rNextState = `STATE_POWERON_INIT_1_high;
end
/*
Wait 4.1 ms or longer, which is 205,000 clock cycles at 50 MHz.
`STATE_POWERON_INIT_2_A:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
 rTimeCountReset = 1'b0;
if (rTimeCount > 32'd2050000)
//if (rTimeCount > 32'd2050 )
rNextState = `STATE_POWERON_INIT_2_B;
else
rNextState = `STATE_POWERON_INIT_2_A;
end
`STATE_POWERON_INIT_2_B:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
 rTimeCountReset = 1'b1;
 rNextState = `STATE_POWERON_INIT_3_low;
end
`STATE_POWERON_INIT_3_low:
begin
rWrite_Enabled = 1'b1;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_POWERON_INIT_3_wait_A;
//else
//rNextState = `STATE_POWERON_INIT_3_low;
end
`STATE_POWERON_INIT_3_wait_A:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1000)
// if (rTimeCount > 32'd1 )
 rNextState = `STATE_POWERON_INIT_3_wait_B;
else
 rNextState = `STATE_POWERON_INIT_3_wait_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_POWERON_INIT_3_wait_B:
 begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_POWERON_INIT_3_high;
end
`STATE_POWERON_INIT_3_high:
begin
rWrite_Enabled = 1'b1;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_POWERON_INIT_4_A;
//else
//rNextState = `STATE_POWERON_INIT_3_high;
end
//WAIT 100US
`STATE_POWERON_INIT_4_A:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
 rTimeCountReset = 1'b0;
if (rTimeCount > 32'd2050000)
//if (rTimeCount > 32'd2050 )
rNextState = `STATE_POWERON_INIT_4_B;
else
rNextState = `STATE_POWERON_INIT_4_A;
end
`STATE_POWERON_INIT_4_B:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
 rTimeCountReset = 1'b1;
rNextState = `STATE_POWERON_INIT_5_low;
end
`STATE_POWERON_INIT_5_low:
begin
rWrite_Enabled = 1'b1;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_POWERON_INIT_5_wait_A;
//else
//rNextState = `STATE_POWERON_INIT_5_low;
end
`STATE_POWERON_INIT_5_wait_A:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd7500000)
//if (rTimeCount > 32'd7500 )
 rNextState = `STATE_POWERON_INIT_5_wait_B;
else
 rNextState = `STATE_POWERON_INIT_5_wait_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_POWERON_INIT_5_wait_B:
 begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_POWERON_INIT_5_high;
end
`STATE_POWERON_INIT_5_high:
begin
rWrite_Enabled = 1'b1;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//	if ( wWriteDone )
		rNextState = `STATE_POWERON_INIT_6_A;
	//else
		//rNextState = `STATE_POWERON_INIT_5_high;
end
//WAIT 40us
`STATE_POWERON_INIT_6_A:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
 rTimeCountReset = 1'b0;
if (rTimeCount > 32'd2050000)
//if (rTimeCount > 32'd2050 )
rNextState = `STATE_POWERON_INIT_6_B;
else
rNextState = `STATE_POWERON_INIT_6_A;
end
`STATE_POWERON_INIT_6_B:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h3;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
rNextState = `STATE_POWERON_INIT_7_low;
end
`STATE_POWERON_INIT_7_low:
begin
rWrite_Enabled = 1'b1;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_POWERON_INIT_7_wait_A;
//else
//rNextState = `STATE_POWERON_INIT_7_low;
end
`STATE_POWERON_INIT_7_wait_A:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd7500000)
// if (rTimeCount > 32'd7500 )
 rNextState = `STATE_POWERON_INIT_7_wait_B;
else
 rNextState = `STATE_POWERON_INIT_7_wait_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_POWERON_INIT_7_wait_B:
 begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_POWERON_INIT_7_high;
end
`STATE_POWERON_INIT_7_high:
begin
rWrite_Enabled = 1'b1;
oLCD_Data = 4'h2;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
	//if ( wWriteDone )
		rNextState = `STATE_POWERON_INIT_8_A;
	//else
		//rNextState = `STATE_POWERON_INIT_7_high;
end
//wait 40 us
`STATE_POWERON_INIT_8_A:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h2;
oLCD_RegisterSelect = 1'b0; //these are commands
 rTimeCountReset = 1'b0;
if (rTimeCount > 32'd2050000)
//if (rTimeCount > 32'd2050)
rNextState = `STATE_POWERON_INIT_8_B;
else
rNextState = `STATE_POWERON_INIT_8_A;
end
`STATE_POWERON_INIT_8_B:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h2;
oLCD_RegisterSelect = 1'b0; //these are commands
 rTimeCountReset = 1'b1;
rNextState = `STATE_FUNCTIONSET_low;
end
`STATE_FUNCTIONSET_low:
begin
rWrite_Enabled = 1'b1;
oLCD_Data = 4'h2;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_FUNCTIONSET_wait_A;
//else
//rNextState = `STATE_FUNCTIONSET_low;
end
`STATE_FUNCTIONSET_wait_A:
begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h2;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1000)
//if (rTimeCount > 32'd1 )
 rNextState = `STATE_FUNCTIONSET_wait_B;
else
 rNextState = `STATE_FUNCTIONSET_wait_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_FUNCTIONSET_wait_B:
 begin
rWrite_Enabled = 1'b0;
oLCD_Data = 4'h2;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_FUNCTIONSET_high;
end
`STATE_FUNCTIONSET_high:
begin
rWrite_Enabled = 1'b1;
oLCD_Data = 4'h8;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
	//if ( wWriteDone )
		rNextState = `STATE_FUNCTIONSET_wait_high_A;
	//else
		//rNextState = `STATE_FUNCTIONSET_high;
end
*/
//AQUI WAIT EN MEDIO DE FUNCTIONSET Y ENTRYMODE (CHECK ENTRY_A)
`STATE_FUNCTIONSET_wait_high_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h8;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1650000)
//if (rTimeCount > 32'd20 )
 rNextState = `STATE_FUNCTIONSET_wait_high_B;
else
 rNextState = `STATE_FUNCTIONSET_wait_high_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_FUNCTIONSET_wait_high_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h8;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_ENTRY_low;
end
`STATE_ENTRY_low:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_ENTRY_wait_A;
//else
//rNextState = `STATE_ENTRY_low;
end
`STATE_ENTRY_wait_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1650000)
//if (rTimeCount > 32'd1 )
 rNextState = `STATE_ENTRY_wait_B;
else
 rNextState = `STATE_ENTRY_wait_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_ENTRY_wait_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_ENTRY_high;
end
`STATE_ENTRY_high:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'h6;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
	//if ( wWriteDone )
		rNextState = `STATE_ENTRY_wait_high_A;
	//else
		//rNextState = `STATE_ENTRY_high;
end
`STATE_ENTRY_wait_high_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h6;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1400000)
//if (rTimeCount > 32'd20)
 rNextState = `STATE_ENTRY_wait_high_B;
else
 rNextState = `STATE_ENTRY_wait_high_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_ENTRY_wait_high_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_DISPLAY_CONTROL_low;
end
`STATE_DISPLAY_CONTROL_low:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_DISPLAY_CONTROL_wait_A;
//else
//rNextState = `STATE_DISPLAY_CONTROL_low;
end
`STATE_DISPLAY_CONTROL_wait_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1400000 )
//if (rTimeCount > 32'd1 )
 rNextState = `STATE_DISPLAY_CONTROL_wait_B;
else
 rNextState = `STATE_DISPLAY_CONTROL_wait_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_DISPLAY_CONTROL_wait_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_DISPLAY_CONTROL_high;
end
`STATE_DISPLAY_CONTROL_high:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'hC;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//	if ( wWriteDone )
		rNextState = `STATE_DISPLAY_CONTROL_wait_high_A;
	//else
		//rNextState = `STATE_DISPLAY_CONTROL_high;
end
`STATE_DISPLAY_CONTROL_wait_high_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'hC;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1400000)
//if (rTimeCount > 32'd20 )
 rNextState = `STATE_DISPLAY_CONTROL_wait_high_B;
else
 rNextState = `STATE_DISPLAY_CONTROL_wait_high_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_DISPLAY_CONTROL_wait_high_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'hC;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_DISPLAY_CLEAR_low;
end
`STATE_DISPLAY_CLEAR_low:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_DISPLAY_CLEAR_wait_A;
//else
//rNextState = `STATE_DISPLAY_CLEAR_low;
end
`STATE_DISPLAY_CLEAR_wait_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1400000)
// if (rTimeCount > 32'd1)
 rNextState = `STATE_DISPLAY_CLEAR_wait_B;
else
 rNextState = `STATE_DISPLAY_CLEAR_wait_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_DISPLAY_CLEAR_wait_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_DISPLAY_CLEAR_high;
end
`STATE_DISPLAY_CLEAR_high:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'h1;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1;
	//if ( wWriteDone )
		rNextState = `STATE_DISPLAY_CLEAR_wait_high_A;
//	else
	//	rNextState = `STATE_DISPLAY_CLEAR_high;
end
//Wait de 1.3ms mas 4us
`STATE_DISPLAY_CLEAR_wait_high_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h1;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1400000)
// if (rTimeCount > 32'd30)
 rNextState = `STATE_DISPLAY_CLEAR_wait_high_B;
else
 rNextState = `STATE_DISPLAY_CLEAR_wait_high_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_DISPLAY_CLEAR_wait_high_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h1;
oLCD_RegisterSelect = 1'b0; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_WRITE_H_low;
end
`STATE_WRITE_H_low:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'h4;
oLCD_RegisterSelect = 1'b1; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_WRITE_H_wait_A;
end
`STATE_WRITE_H_wait_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h4;
oLCD_RegisterSelect = 1'b1; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1400000)
// if (rTimeCount > 32'd1)
 rNextState = `STATE_WRITE_H_wait_B;
else
 rNextState = `STATE_WRITE_H_wait_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_WRITE_H_wait_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h4;
oLCD_RegisterSelect = 1'b1; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_WRITE_H_high;
end
`STATE_WRITE_H_high:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'h8;
oLCD_RegisterSelect = 1'b1; //these are commands
rTimeCountReset = 1'b1;
	//if ( wWriteDone )
		rNextState = `STATE_WRITE_H2_low;
//	else
	//	rNextState = `STATE_DISPLAY_CLEAR_high;
end
`STATE_WRITE_H2_low:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'h8;
oLCD_RegisterSelect = 1'b1; //these are commands
rTimeCountReset = 1'b1;
//if ( wWriteDone )
rNextState = `STATE_WRITE_H2_wait_A;
end
`STATE_WRITE_H2_wait_A:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h8;
oLCD_RegisterSelect = 1'b1; //these are commands
rTimeCountReset = 1'b0;
if (rTimeCount > 32'd1400000)
// if (rTimeCount > 32'd1)
 rNextState = `STATE_WRITE_H2_wait_B;
else
 rNextState = `STATE_WRITE_H2_wait_A;
end
//Estado para reiniciar el contador de tiempo
 `STATE_WRITE_H2_wait_B:
 begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h8;
oLCD_RegisterSelect = 1'b1; //these are commands
rTimeCountReset = 1'b1; //Reset the counter here
rNextState = `STATE_WRITE_H2_high;
end
`STATE_WRITE_H2_high:
begin
//rWrite_Enabled = 1'b1;
oLCD_Data = 4'h8;
oLCD_RegisterSelect = 1'b1; //these are commands
rTimeCountReset = 1'b1;
	//if ( wWriteDone )
		rNextState = `STATE_WRITE_H2_high;
//	else
	//	rNextState = `STATE_DISPLAY_CLEAR_high;
end
default:
begin
//rWrite_Enabled = 1'b0;
oLCD_Data = 4'h0;
oLCD_RegisterSelect = 1'b0;
rTimeCountReset = 1'b0;
rNextState = `STATE_RESET;
end
endcase
end
endmodule