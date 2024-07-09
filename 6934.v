module.
	localparam [7*7-1:0] PWM_DutyCycle_List = { 7'd100, 7'd50, 7'd25, 7'd13, 7'd6, 7'd3, 7'd1 };
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
				.PWM_INTERVAL_TICK( PWM_TIMER_TICK ),
				// Output Signals
				.PWM_OUT( PWM_CHANNEL_SIGS[i] ),
				// System Signals
				.CLK( CLOCK_50 )
			);
		end
	end
	endgenerate
	// Test Stimulus
	initial
	begin
		// Initialize Signals
		LED_FULL_ON = 1'b0;
		#1000;
		// Begin Testing
		// Wait for two PWM Timer cycles
		@(posedge PWM_TIMER_TICK);
		@(posedge PWM_TIMER_TICK);
		// Activate the LED for one Fade Timer cycle
		@(posedge CLOCK_50);  // Align input signals with Clock
		LED_FULL_ON = 1'b1;
		@(posedge FADE_TIMER_TICK);
		// Deassert the LED_FULL_ON signal
		@(posedge CLOCK_50);
		LED_FULL_ON = 1'b0;
		// Verify Fadeout Sequence
		// Simulate 1 mS of time for full sequence
	end
endmodule