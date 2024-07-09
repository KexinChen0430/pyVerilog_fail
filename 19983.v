module.
	localparam [7*7-1:0] PWM_DutyCycle_List = { 7'd100, 7'd50, 7'd25, 7'd13, 7'd6, 7'd3, 7'd1 };
	wire [6:0] pwm_channel_sigs;
	genvar i;  // General purpose variable used by generate for loops
	generate
	begin
		for (i=0; i < 7; i=i+1)
		begin : PWM_Channels
			// PWM Duty Cycle Timer
			CLS_PWM_DutyCycle_Timer
			#(
				.CLK_RATE_HZ( CLK_RATE_HZ ), // MHz
				.DUTY_RATE_HZ( PWM_DUTY_RATE ), // Hz
				.DUTY_PERCENT( PWM_DutyCycle_List[7*i +:7] ) // Cycle On-time %
			)
			pwm_dutycycle_timer
			(
				// Input Signals
				.PWM_INTERVAL_TICK( pwm_timer_tick ),
				// Output Signals
				.PWM_OUT( pwm_channel_sigs[i] ),
				// System Signals
				.CLK( CLK )
			);
		end
	end
	endgenerate
	///////////////////////////////////////////////////////
	// LED Position Shift Register
	reg [LED_NUM-1:0] led_pos_reg;
	initial
	begin
		led_pos_reg <= { {LED_NUM-1{1'b0}}, 1'b1 };		// Initialize 1 LED on
		led_pos_reg[LED_NUM-1:1] = 15'h00;
	end
	// !! LAB 3: Add Shift Register Implementation Here !!
	// always @(posedge fadeout_tick )
	always @(posedge CLK)
	begin
	if (RIGHT_KEY_EVENT)
		// Rotate Data Right
		led_pos_reg <= { led_pos_reg[LED_NUM-2:0], led_pos_reg[LED_NUM-1] };
	else if (LEFT_KEY_EVENT)
		// Rotate Data Left
		led_pos_reg <= { led_pos_reg[0], led_pos_reg[LED_NUM-1:1]};
	else led_pos_reg <= led_pos_reg;
	end
	///////////////////////////////////////////////////////
	// LED Output Faders
	// !! LAB 3: Add CLS_LED_Output_Fader Generation Block Here !!
	 // General purpose variable used by generate for loops
	generate
	begin
		for (i=0; i < 16; i=i+1)
		begin : PWM_Channels_0
			// Creating 16 cls_led_output_fader
			CLS_LED_Output_Fader cls_led_output_fader
			(
				// Input Signals
				.LED_FULL_ON(led_pos_reg[i]),
				.PWM_CHANNEL_SIGS(pwm_channel_sigs),
				.PWM_TIMER_TICK(pwm_timer_tick),
				.FADE_TIMER_TICK(fadeout_tick),
				// Output Signals
				.LEDR(LED_OUT[i]),
				.CLK(CLK)
			);
		end
	end
	endgenerate
endmodule