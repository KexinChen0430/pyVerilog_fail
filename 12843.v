module BCD_Binary_Encoder
#(
	parameter BIN_WIDTH = 8,
	parameter BDC_DIGITS = 2
)
(
	// Input Signals
	input                      CONVERT,
	output reg                 DONE,
	input      [BIN_WIDTH-1:0] BIN_IN,
	// BCD Data Output Signals
	output reg [BDC_DIGITS*4-1:0] BCD_OUT, // Packed Array
	output reg                    BCD_OVERFLOW,
	// System Signals
	input CLK,
	input RESET
);
	// Include Standard Functions header file (needed for bit_index())
	`include "StdFunctions.vh"
	// BCD Register Width is 4-bits per BCD Digit
	reg [4:0] State;
	localparam [4:0]
	S0 = 5'b00001,
	S1 = 5'b00010,
	S2 = 5'b00100,
	S3 = 5'b01000,
	S4 = 5'b10000;
	localparam BCD_WIDTH = 4 * BDC_DIGITS;
	reg [BIN_WIDTH-1:0] bin_shift_reg;
	reg [BCD_WIDTH-1:0] bcd_shift_reg;
	reg [BCD_WIDTH-1:0] bcd_adder_sum;
	// Shift Counter tracks number of BIN_IN bits shifted (using a Rollover Counter)
	localparam SHIFT_COUNTER_WIDTH = bit_index( BIN_WIDTH );
	localparam [SHIFT_COUNTER_WIDTH:0] SHIFT_COUNTER_LOADVAL = { 1'b1, {SHIFT_COUNTER_WIDTH{1'b0}} } - BIN_WIDTH[SHIFT_COUNTER_WIDTH:0] + 1'b1;
	reg [SHIFT_COUNTER_WIDTH:0] shift_counter_reg;
	// Shift Count Done when the counter rollsover
	wire shift_counter_done = shift_counter_reg[SHIFT_COUNTER_WIDTH];
	// BCD Column Adders
	// After each shift, add 3 to any column equaling 5 or greater.
	// One adder will be generated per BCD Digit.
	// The selective adding is done by LUT instead of an actual adder.
	genvar i;
	generate
	begin
		for (i = 0; i < BDC_DIGITS; i=i+1)
		begin : bcd_adders
			always @*
			begin
				case (bcd_shift_reg[i*4 +: 4])
					// No Add
					4'b0000 : bcd_adder_sum[i*4 +: 4] <= 4'b0000; // 0 => 0
					4'b0001 : bcd_adder_sum[i*4 +: 4] <= 4'b0001; // 1 => 1
					4'b0010 : bcd_adder_sum[i*4 +: 4] <= 4'b0010; // 2 => 2
					4'b0011 : bcd_adder_sum[i*4 +: 4] <= 4'b0011; // 3 => 3
					4'b0100 : bcd_adder_sum[i*4 +: 4] <= 4'b0100; // 4 => 4
					// Add 3
					4'b0101 : bcd_adder_sum[i*4 +: 4] <= 4'b1000; // 5 => 8
					4'b0110 : bcd_adder_sum[i*4 +: 4] <= 4'b1001; // 6 => 9
					4'b0111 : bcd_adder_sum[i*4 +: 4] <= 4'b1010; // 7 => 10
					4'b1000 : bcd_adder_sum[i*4 +: 4] <= 4'b1011; // 8 => 11
					4'b1001 : bcd_adder_sum[i*4 +: 4] <= 4'b1100; // 9 => 12
					// Invalid Inputs
					4'b1010 : bcd_adder_sum[i*4 +: 4] <= 4'b0000; // 10
					4'b1011 : bcd_adder_sum[i*4 +: 4] <= 4'b0000; // 11
					4'b1100 : bcd_adder_sum[i*4 +: 4] <= 4'b0000; // 12
					4'b1101 : bcd_adder_sum[i*4 +: 4] <= 4'b0000; // 13
					4'b1110 : bcd_adder_sum[i*4 +: 4] <= 4'b0000; // 14
					4'b1111 : bcd_adder_sum[i*4 +: 4] <= 4'b0000; // 15
				endcase
			end
		end
	end
	endgenerate
	// BCD Binary Encoder State Machine
	reg  overflow_flag;
	// !! Lab 4: Implement the BCD Binary Encoder State Machine here !!
	always @(posedge CLK, posedge RESET)
begin
	if (RESET)
	begin
	 State <= S0;
	 DONE <= 1'b0;
	 BCD_OUT <= {BDC_DIGITS*4{1'b0}};
	 BCD_OVERFLOW <= 1'b0;
	 shift_counter_reg <= {SHIFT_COUNTER_WIDTH+1{1'b0}};
	 bin_shift_reg <= {BIN_WIDTH{1'b0}};
	 bcd_shift_reg	<= {BCD_WIDTH{1'b0}};
	 overflow_flag <= 1'b0;
	end
	else
	begin
		case (State)
			S0 :
			begin
				DONE <= 1'b0;
				if(CONVERT)
					State <= S1;
			end
			S1 :
			begin
			bin_shift_reg <= BIN_IN;
			bcd_shift_reg <= {BCD_WIDTH{1'b0}};
			shift_counter_reg <= SHIFT_COUNTER_LOADVAL;
			overflow_flag <= 1'b0;
			State <= S2;
			end
			S2 :
			begin
			overflow_flag <= overflow_flag | bcd_shift_reg[BCD_WIDTH-1];
			bcd_shift_reg <= { bcd_shift_reg[BCD_WIDTH-2:0], bin_shift_reg[BIN_WIDTH-1] };
			bin_shift_reg <= { bin_shift_reg[BIN_WIDTH-2:0], 1'b0 };
			if(shift_counter_done)
				State <= S4;
			else
				State <= S3;
			end
			S3 :
			begin
			bcd_shift_reg <= bcd_adder_sum;
			shift_counter_reg <= shift_counter_reg + 1'b1;
			State <= S2;
			end
			S4:
			begin
			BCD_OUT <= bcd_shift_reg;
			BCD_OVERFLOW <= overflow_flag;
			DONE <= 1'b1;
			State <= S0;
			end
		endcase
	end
end
endmodule