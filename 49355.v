module Module_LCD_Control
  (
    input wire Clock,
    input wire Reset,
    output wire oLCD_Enabled,
    output reg oLCD_RegisterSelect, //0=Command, 1=Data
    output wire oLCD_StrataFlashControl,
    output wire oLCD_ReadWrite,
    input wire iDoWrite;
    input wire[7:0] iData;
    output reg oSetupReady;
    output reg oWriteDone;
    output reg[3:0] oLCD_Data
  );
reg rWrite_Enabled ;
assign  oLCD_Enabled = rWrite_Enabled ;
  assign oLCD_ReadWrite = 0; //I only Write to the LCD display, never Read from it
  assign oLCD_StrataFlashControl = 1; //StrataFlash disabled. Full read/write access to LCD
  reg [7:0] rCurrentState,rNextState;
  reg [31:0] rTimeCount;
  reg rTimeCountReset;
  reg[4:0]wWriteDone;
  reg rWriteDoneReset;
  //Next State and delay logic
  always @ ( posedge Clock )
    if (Reset)
      begin
        rCurrentState <= `STATE_RESET;
        rTimeCount <= 32'b0;
      end
  else
  begin
    begin
	 if(~rWriteDoneReset)
		wWriteDone<= 4'b0;
	else
      wWriteDone <= wWriteDone + 4'b1;
		end
		begin
    if (rTimeCountReset)
       rTimeCount <= 32'b0;
      else
        rTimeCount <= rTimeCount + 32'b1;
      rCurrentState <= rNextState;
		end
    end
  //Current state and output logic
  always @ ( * )
    begin
      case (rCurrentState)
        `STATE_RESET:
          begin
            rWrite_Enabled = 1'b0;
            oLCD_Data = 4'h0;
            oLCD_RegisterSelect = 1'b0;
            rTimeCountReset = 1'b0;
            rNextState = `STATE_POWERON_INIT_0;
          end
/*
Wait 15 ms or longer.
The 15 ms interval is 750,000 clock cycles at 50 MHz.
*/
      `STATE_POWERON_INIT_0:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h0;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd750000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_POWERON_INIT_1;
              rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_POWERON_INIT_0;
				  rWriteDoneReset=1'b1;
            end
        end
/*
Write SF_D<11:8> = 0x3, pulse LCD_E High for 12 clock cycles
  */
      `STATE_POWERON_INIT_1:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'h3;
			 rWriteDoneReset=1'b1;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_POWERON_INIT_2;
          else
            rNextState = `STATE_POWERON_INIT_1;
        end
/*
Wait 4.1 ms or longer, which is 205,000 clock cycles at 50 MHz.
*/
      `STATE_POWERON_INIT_2:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd205000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_POWERON_INIT_3;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_POWERON_INIT_2;
				  rWriteDoneReset=1'b1;
            end
        end
/*
Write SF_D<11:8> = 0x3, pulse LCD_E High for 12 clock cycles
  */
      `STATE_POWERON_INIT_3:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			 rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_POWERON_INIT_4;
          else
            rNextState = `STATE_POWERON_INIT_3;
        end
 /* Wait 100 μs or longer, which is 5,000 clock cycles at 50 MHz.
 */
        `STATE_POWERON_INIT_4:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd5000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_POWERON_INIT_5;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_POWERON_INIT_4;
				    rWriteDoneReset=1'b1;
            end
        end
/*Write SF_D<11:8> = 0x3, pulse LCD_E High for 12 clock cycles
  */
      `STATE_POWERON_INIT_5:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			   rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_POWERON_INIT_6;
          else
            rNextState = `STATE_POWERON_INIT_5;
        end
 /* Wait 40 μs or longer, which is 2,000 clock cycles at 50 MHz.
 */
        `STATE_POWERON_INIT_6:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd2000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_POWERON_INIT_7;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_POWERON_INIT_6;
				    rWriteDoneReset=1'b1;
            end
        end
  /*Write SF_D<11:8> = 0x2, pulse LCD_E High for 12 clock cycles
  */
      `STATE_POWERON_INIT_7:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'h2;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			   rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_POWERON_INIT_8;
          else
            rNextState = `STATE_POWERON_INIT_7;
        end
       /* Wait 40 μs or longer, which is 2,000 clock cycles at 50 MHz.*/
        `STATE_POWERON_INIT_8:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd2000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_CONFIG_0;
              rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_POWERON_INIT_8;
				    rWriteDoneReset=1'b1;
            end
        end
//Initialization completed
 //Starting Configuration //fUNCTIONsET
        `STATE_DISPLAY_CONFIG_0:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'd2;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			   rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_CONFIG_1;
          else
            rNextState = `STATE_DISPLAY_CONFIG_0;
        end
        `STATE_DISPLAY_CONFIG_1:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd50 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_CONFIG_2;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_CONFIG_1;
				    rWriteDoneReset=1'b1;
            end
        end
         `STATE_DISPLAY_CONFIG_2:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'd8;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			   rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_CONFIG_3;
          else
            rNextState = `STATE_DISPLAY_CONFIG_2;
        end
        `STATE_DISPLAY_CONFIG_3:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd2000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_CONFIG_4;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_CONFIG_3;
				    rWriteDoneReset=1'b1;
            end
        end
 //Entry Mode Set
     `STATE_DISPLAY_CONFIG_4:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'b0;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			   rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_CONFIG_5;
          else
            rNextState = `STATE_DISPLAY_CONFIG_4;
        end
        `STATE_DISPLAY_CONFIG_5:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd50)
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_CONFIG_6;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_CONFIG_5;
				   rWriteDoneReset=1'b1;
            end
        end
         `STATE_DISPLAY_CONFIG_6:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'd6;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			  rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_CONFIG_7;
          else
            rNextState = `STATE_DISPLAY_CONFIG_6;
        end
        `STATE_DISPLAY_CONFIG_7:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd2000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_CONFIG_8;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_CONFIG_7;
				   rWriteDoneReset=1'b1;
            end
        end
 //DisplayonOff
  `STATE_DISPLAY_CONFIG_8:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'b0;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			  rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_CONFIG_9;
          else
            rNextState = `STATE_DISPLAY_CONFIG_8;
        end
        `STATE_DISPLAY_CONFIG_9:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd50 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_CONFIG_10;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_CONFIG_9;
				   rWriteDoneReset=1'b1;
            end
        end
         `STATE_DISPLAY_CONFIG_10:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'hC;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			  rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_CONFIG_11;
          else
            rNextState = `STATE_DISPLAY_CONFIG_10;
        end
        `STATE_DISPLAY_CONFIG_11:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd2000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_CONFIG_12;
              rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_CONFIG_11;
				   rWriteDoneReset=1'b1;
            end
        end
 //ClearDisplay
 `STATE_DISPLAY_CONFIG_12:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'b0;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			  rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_CONFIG_13;
          else
            rNextState = `STATE_DISPLAY_CONFIG_12;
        end
        `STATE_DISPLAY_CONFIG_13:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd50 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_CONFIG_14;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_CONFIG_13;
				   rWriteDoneReset=1'b1;
            end
        end
         `STATE_DISPLAY_CONFIG_14:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'b1;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			  rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_CONFIG_15;
          else
            rNextState = `STATE_DISPLAY_CONFIG_14;
        end
        `STATE_DISPLAY_CONFIG_15:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd82000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_WRITE_0;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_CONFIG_15;
				   rWriteDoneReset=1'b1;
            end
        end
//Set Starting Address
`STATE_DISPLAY_WRITE_0:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'd8;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			  rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_WRITE_1;
          else
            rNextState = `STATE_DISPLAY_WRITE_0;
        end
        `STATE_DISPLAY_WRITE_1:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd50 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_WRITE_2;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_WRITE_1;
				   rWriteDoneReset=1'b1;
            end
        end
         `STATE_DISPLAY_WRITE_2:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'b0;
          oLCD_RegisterSelect = 1'b0; //these are commands
          rTimeCountReset = 1'b1;
			  rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_WRITE_3;
          else
            rNextState = `STATE_DISPLAY_WRITE_2;
        end
        `STATE_DISPLAY_WRITE_3:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd2000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_WRITE_4;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_WRITE_3;
				   rWriteDoneReset=1'b1;
            end
        end
//WRITE H
`STATE_DISPLAY_WRITE_4:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'd4;
          oLCD_RegisterSelect = 1'b1; //these are commands
          rTimeCountReset = 1'b1;
			  rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_WRITE_5;
          else
            rNextState = `STATE_DISPLAY_WRITE_4;
        end
        `STATE_DISPLAY_WRITE_5:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd50 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_WRITE_6;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_WRITE_5;
				   rWriteDoneReset=1'b1;
            end
        end
         `STATE_DISPLAY_WRITE_6:
        begin
          rWrite_Enabled = 1'b1;
          oLCD_Data = 4'd8;
          oLCD_RegisterSelect = 1'b1; //these are commands
          rTimeCountReset = 1'b1;
			  rWriteDoneReset=1'b1;
          if ( wWriteDone >4'd12 )
            rNextState = `STATE_DISPLAY_WRITE_7;
          else
            rNextState = `STATE_DISPLAY_WRITE_6;
        end
        `STATE_DISPLAY_WRITE_7:
        begin
          rWrite_Enabled = 1'b0;
          oLCD_Data = 4'h3;
          oLCD_RegisterSelect = 1'b0; //these are commands
          if (rTimeCount > 32'd2000 )
            begin
              rTimeCountReset = 1'b1;
              rNextState = `STATE_DISPLAY_WRITE_8;
               rWriteDoneReset=1'b0;
            end
          else
            begin
              rTimeCountReset = 1'b0;
              rNextState = `STATE_DISPLAY_WRITE_7;
				   rWriteDoneReset=1'b1;
            end
        end
        default:
          begin
            rWrite_Enabled = 1'b0;
            oLCD_Data = 4'h2;
            oLCD_RegisterSelect = 1'b0;
            rTimeCountReset = 1'b0;
            rNextState = `STATE_RESET;
          end
      endcase
    end
endmodule