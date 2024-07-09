module DE1_SoCPhaseIItester (CLOCK_50, LEDR, SW, KEY);
	output reg CLOCK_50;  // connect to system 50 MHz clock
	input  [9:0] LEDR;
	output reg [9:0] SW;
	output [3:0] KEY;
	parameter d = 20;
	// generate a clock
	always #(d/2) CLOCK_50 = ~CLOCK_50;
	initial // Response
	begin
		$display("CLOCK_50 \t LEDR \t SW \t\t KEY \t ");
		#d;
	end
	initial
	begin
		$monitor("%b \t %b \t %b \t %b \t %b \t ", CLOCK_50, LEDR, SW, KEY, $time);
		SW[9] = 1'b1; #d
		SW[9] = 1'b0; #(300*d)
		SW[6] = 1'b1; #(300*d)
		$stop;
		$finish;
	end
endmodule