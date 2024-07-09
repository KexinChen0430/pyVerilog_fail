module PS2(
	ps2_clock,
	ps2_data,
	rx_data,
	rx_done,
	reset,
	clk
);
	`include "definition/Definition.v"
	inout								ps2_clock;
	inout								ps2_data;
	output	reg		[BYTE-1:0]			rx_data;
	output	reg							rx_done;
	input								reset;
	input								clk;
	localparam	BITTHROUGH		= 10;		// the number of bits to accept including Parity and Stop
	localparam	STATE_IDLE		= 32'd1,
				STATE_RX_BIT	= 32'd2;
			wire						devclk;
			wire						devclkneg;
			wire	[WORD-1:0]			bitcount;
			wire						bitarc;
			reg		[WORD-1:0]			state;
			reg		[BITTHROUGH-1:0]	shift_in;
			reg							postbitarc;
			reg		[BYTE-1:0]			clkbuf;
	// Clock line conditioning
	Debounce #(1*MICROS) stable (
		.linein(ps2_clock),
		.lineout(devclk),
		.reset(reset),
		.clk(clk)
	);
	Negedge tick (
		.linein(devclk),
		.lineout(devclkneg),
		.reset(reset),
		.clk(clk)
	);
	// Bit counting
	Radix_Counter #(BITTHROUGH) countoff (
		.carry_in((state==STATE_RX_BIT) && devclkneg),
		.carry_out(bitarc),
		.count(bitcount),
		.reset(reset),
		.clk(clk)
	);
	// Finite State Machine
	always @(posedge clk) begin
		if(reset)									state	<= STATE_IDLE;
		else if((state==STATE_IDLE) && devclkneg)	state	<= STATE_RX_BIT;
		else if((state==STATE_RX_BIT) && bitarc)	state	<= STATE_IDLE;
		else										state	<= state;
	end
	// Data capture
	always @(posedge clk) begin
		if(reset)			shift_in	<= 0;
		else if(devclkneg)	shift_in	<= {ps2_data, shift_in[BITTHROUGH-1:1]};
		else				shift_in	<= shift_in;
		if(reset)			postbitarc	<= 0;
		else				postbitarc	<= bitarc;
		if(reset)			rx_data	<= 0;
		else if(postbitarc)	rx_data	<= shift_in;
		else				rx_data	<= rx_data;
	end
	always @(posedge clk) begin
		if(reset)			rx_done		<= 0;
		else if(postbitarc)	rx_done		<= 1;
		else				rx_done		<= 0;
	end
endmodule