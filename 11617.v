module CLS_PWM_DutyCycle_Timer
#(
	parameter CLK_RATE_HZ = 50000000, // Hz
	parameter DUTY_RATE_HZ = 1000,    // Hz
	parameter DUTY_PERCENT = 50       // Cycle On-time %
)
(
	// Input Signals
	input PWM_INTERVAL_TICK,
	// Output Signals
	output reg PWM_OUT,
	// System Signals
	input CLK
);
	// Include Standard Functions header file (needed for bit_index())
	`include "StdFunctions.vh"
	// Initial register settings
	initial
	begin
		PWM_OUT = 1'b0;
	end
	//!! Add Implementation Here !!
	localparam PWM_INV_TICKS = CLK_RATE_HZ / DUTY_RATE_HZ;
	localparam PWM_REG_WIDTH = bit_index(PWM_INV_TICKS);
	// Compute the PWM Duty Cycle Counter Parameters
	localparam integer PDC_OFF_TICKS = PWM_INV_TICKS * (100.0-DUTY_PERCENT) / 100;
	localparam [PWM_REG_WIDTH:0] PDC_LOADVAL = {1'b1, {PWM_REG_WIDTH{1'b0}}} - PDC_OFF_TICKS[PWM_REG_WIDTH:0];
	reg  [PWM_REG_WIDTH:0] pdc_count_reg;
	// Initialize Registers
	initial
	begin
		pdc_count_reg = PDC_LOADVAL;
	end
	// PWM Duty Cycle Counter
	always @(posedge CLK)
	begin
		if (PWM_INTERVAL_TICK)
			pdc_count_reg <= PDC_LOADVAL;
		else
			pdc_count_reg <= pdc_count_reg + 1'b1;
	end
	// PWM Output Register
	always @(posedge CLK)
	begin
		PWM_OUT <= pdc_count_reg[PWM_REG_WIDTH];
	end
endmodule