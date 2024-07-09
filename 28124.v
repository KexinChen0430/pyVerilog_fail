module count_hours(
	twentyfour_mode,
	manual_inc,
	automatic_inc,
	ones_digit,
	tens_digit,
	am,
	pm,
	count_out
);
// port declarations
input					twentyfour_mode;
input					manual_inc;
input					automatic_inc;
output	[3:0]		ones_digit;
output	[3:0]		tens_digit;
output	reg		am;
output	reg		pm;
output 	reg		count_out;
// wire declarations
wire carry;
reg module_reset;
reg pre_count;
reg increment;
// teh logikz
initial module_reset <= 0;
bcd_counter u1(
	module_reset,
	increment,
	ones_digit,
	carry
);
bcd_counter u2(
	module_reset,
	carry,
	tens_digit,
);
always begin
	// We handle manual increments by making it
	if (manual_inc) begin
		count_out <= 0;
		increment <= 1;
	// Since twelve hour mode cannot allow 0 hours (damn you, non computer
	// - scientists / engineers!), we have to take care of the case in which
	// - it becomes zero.
	end else if (!twentyfour_mode && tens_digit == 4'h0 && ones_digit == 4'h0)
		begin
		increment <= 1;
		#1 increment <= 0;
		// I had to add this here to make it work; I don't know why.
		increment <= automatic_inc;
	// This is the general case.
	end else begin
		increment <= automatic_inc;
		count_out <= module_reset;
	end
	module_reset <= (
		!twentyfour_mode && tens_digit == 4'h1 && ones_digit == 4'h3
		|| twentyfour_mode && tens_digit == 4'h2 && ones_digit == 4'h4
	);
end
always @ (posedge module_reset) begin
	if (!twentyfour_mode)
		if (am) begin
			pm <= 1;
			am <= 0;
		end else begin
			am <= 1;
			pm <= 0;
		end
	else begin
		am <= 0;
		pm <= 0;
	end
end
endmodule