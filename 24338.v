module's configurable parameters */
	parameter refresh_rate = 1000;      // Refresh rate in Hz
	parameter sys_clk_freq = 100000000; // Input clock frequency in Hz
	/* Pre-calculate the clock divider */
	localparam clk_divider = sys_clk_freq / (refresh_rate * 3);
	/* 32 bits should be enough for any reasonable clock/freq combo */
	reg [31:0] divider;
	/*
	 */
	reg [7:0] segments_out;
	reg [2:0] segments_enable_out;
	assign segments = ~segments_out;
	assign segments_enable = ~segments_enable_out;
	/* Declare the wires the segment data will be output to */
	wire [7:0] high_segments;
	wire [7:0] low_segments;
	/* Instantiate the nibble to segments converters */
	nibble_to_segments high_nib(hex_byte[7:4], high_segments);
	nibble_to_segments low_nib(hex_byte[3:0], low_segments);
	always @(posedge clk) begin
		if (divider < clk_divider)
			/* Increment the counter by one to count the delay cycles */
			divider <= divider + 1;
		else begin
			/* Reset the counter (divider) */
			divider <= 0;
			/*
			 */
			case (segments_enable_out)
				3'b001: begin
					segments_out <= 8'b00101110;   // 'h'
					segments_enable_out <= 3'b100; // The left display
				end
				3'b100: begin
					segments_out <= high_segments; // The high nibble
					segments_enable_out <= 3'b010; // The center display
				end
				3'b010: begin
					segments_out <= low_segments;  // The low nibble
					segments_enable_out <= 3'b001; // The right display
				end
				default: begin
					segments_out <= 8'h00;         // Turn all segments off
					segments_enable_out <= 3'b001; // The right display
				end
			endcase
		end
	end
endmodule