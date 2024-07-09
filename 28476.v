module controls the intensity of the
*/
	Pulse_Width_Modulation #(
									.C_CLK_I_FREQUENCY	(9),
									.C_PWM_FREQUENCY		(25000),
									.C_PWM_RESOLUTION		(3)
									)
									pwm
									(
									.CLK_I					(CLK_I),
									.RST_I					(1'b0),
									.DUTY_FACTOR_I			(MSEL_I[2:0]),
									.PWM_O					(int_Bklt)
									);
//	LCD POWER SEQUENCE
	assign BKLT_O	=	(state == STATE_ON)											?	int_Bklt	:1'b0;
	assign VDDEN_O	=	(state == STATE_OFF || state == STATE_POWER_DOWN)	?	1'b0		:1'b1;
	assign DISP_O	=	(state == STATE_OFF || state == STATE_POWER_DOWN || state == STATE_POWER_UP)	?	1'b0	:1'b1;
	assign DE_O		=	(state == STATE_OFF || state == STATE_POWER_DOWN || state == STATE_POWER_UP)	?	'b0	:int_De;
	assign R_O		=	(state == STATE_OFF || state == STATE_POWER_DOWN || state == STATE_POWER_UP)	?	'b0	:int_R;
	assign G_O		=	(state == STATE_OFF || state == STATE_POWER_DOWN || state == STATE_POWER_UP)	?	'b0	:int_G;
	assign B_O		=	(state == STATE_OFF || state == STATE_POWER_DOWN || state == STATE_POWER_UP)	?	'b0	:int_B;
	assign clkStop	=	(state == STATE_OFF || state == STATE_POWER_DOWN || state == STATE_POWER_UP)	?	1'b1	:1'b0;
	assign waitCntEn = 	((state == STATE_POWER_UP || state == STATE_LED_WARM_UP ||
								 state == STATE_LED_COOL_DOWN || state == STATE_POWER_DOWN)&&(state==next_state))?	1'b1	:1'b0;
		always@(posedge CLK_I)
		state	<=	next_state;
		always@*
			case(state)
				STATE_OFF				:	next_state	=	(MSEL_I[3] && ~RST_I)				? STATE_POWER_UP			:STATE_OFF;
				STATE_POWER_UP			:	next_state	=	(waitCnt == TPOWERUP_CYCLES)		? STATE_LED_WARM_UP		:STATE_POWER_UP;
				STATE_LED_WARM_UP		:	next_state	=	(waitCnt == TLEDWARMUP_CYCLES)	? STATE_ON					:STATE_LED_WARM_UP;
				STATE_ON					:	next_state	=	(~MSEL_I[3] && RST_I)				? STATE_LED_COOL_DOWN	:STATE_ON;
				STATE_LED_COOL_DOWN	:	next_state	=	(waitCnt == TLEDCOOLDOWN_CYCLES)	? STATE_POWER_DOWN		:STATE_LED_COOL_DOWN;
				STATE_POWER_DOWN		:	next_state	=	(waitCnt == TPOWERDOWN_CYCLES)	? STATE_OFF					:STATE_POWER_DOWN;
				default					:	next_state	=	STATE_OFF;
			endcase
//	WAIT COUNTER
	always@(posedge CLK_I)
		if(waitCntEn==0)
		waitCnt	<=	0;
		else
		waitCnt	<=	waitCnt+1;
//	CLOCK FORWARDING DONE RIGHT
	ODDR2		#(
					.DDR_ALIGNMENT			("NONE"),			//Set output alignment to "NONE", "C0", "C1"
					.INIT						(1'b0),				//Set initial Q to 0
					.SRTYPE					("SYNC")				//Synchronous reset
				)
				Inst_ODDR2_MCLK_FORWARD
				(
					.Q							(CLK_O),				//Output data
					.C0						(CLK_I),				//Input clock
					.C1						(CLK_180_I),
					.CE						(1'b1),				//Clock enable
					.D0						(1'b1),				//Data associated with C0
					.D1						(1'b0),				//Data associated with C1
					.R							(clkStop),			//Clock reset
					.S							(1'b0)				//Set input
				);
endmodule