module Switch_Synchronizer_Bank
#(
	parameter SWITCH_SYNC_CHANNELS = 1,
	parameter CLK_RATE_HZ = 50000000, // Hz
	parameter DEBOUNCE_TIME = 10000, // ns
	parameter SIG_OUT_INIT = 1'b0
)
(
	// Input  Signals (asynchronous)
	input  [SWITCH_SYNC_CHANNELS-1:0] SIG_IN,
	// Output Signals (synchronized to CLK domain)
	output [SWITCH_SYNC_CHANNELS-1:0] SIG_OUT,
	// System Signals
	input CLK
);
	// Switch Input Debounce Synchronizers
	genvar i;
	generate
	begin
		for (i = 0; i < SWITCH_SYNC_CHANNELS; i=i+1)
		begin : sw_sync_gen
			Switch_Debounce_Synchronizer
			#(
				.CLK_RATE_HZ( CLK_RATE_HZ ),
				.DEBOUNCE_TIME( DEBOUNCE_TIME ),
				.SIG_OUT_INIT( SIG_OUT_INIT )
			)
			sw_synchronizer
			(
				// Input  Signals (asynchronous)
				.SIG_IN( SIG_IN[i] ),
				// Output Signals (synchronized to CLK domain)
				.SIG_OUT( SIG_OUT[i] ),
				// System Signals
				.CLK( CLK )
			);
		end
	end
	endgenerate
endmodule