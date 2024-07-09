module EggTimer(
	input [7:0]SW,
	input [2:0]KEY,
	input CLOCK_50,
	output [6:0]HEX0,
	output [6:0]HEX1,
	output [6:0]HEX2,
	output [6:0]HEX3,
	output [9:0]LEDR,
	output [7:0]LEDG
	);
	reg [3:0] counter0 = 0;
	reg [3:0] counter1 = 0;
	reg [3:0] counter2 = 0;
	reg [3:0] counter3 = 0;
	reg [9:0] ledr_buf = 10'b0000000000;
	reg [0:0] pause = 0; //0 is pause, 1 is continue
	reg [0:0] reset_buf = 1;
	wire RESET;
	wire KEY2 = KEY[2];
	//Get clock signal of period=1000ms
	ClkDivider(CLOCK_50, CLK);
	/*
	 */
	TFlipFlop(.t(~KEY2), .clk(CLOCK_50), .q(PAUSE));
	TFlipFlop(.t(~KEY[1]), .clk(CLOCK_50), .q(MINUTE));
	DFlipFlop(.d(~KEY[0]), .clk(CLOCK_50), .q(RESET));
	assign LEDG[0] = RESET;
	assign LEDG[1] = ~KEY2;
	assign LEDG[2] = pause;
	assign LEDG[3] = reset_buf;
	always @(posedge CLK or posedge RESET or posedge ~KEY2) begin
		if (~KEY2 == 1'b1) begin
			pause <= ~PAUSE;
			reset_buf <= 0;
		end else
		if (RESET == 1'b1) begin
			reset_buf <= 1;
			pause <= 0;
			counter0 <= 0;
			counter1 <= 0;
			counter2 <= 0;
			counter3 <= 0;
			ledr_buf <= 0;
		end else
		if (CLK == 1'b1) begin
			if (pause == 1'b0) begin
				if (reset_buf == 1) begin
					if (MINUTE == 1'b0) begin
						if (SW[3:0] <= 9) begin
							counter0 <= SW[3:0];
						end else begin
							counter0 <= 9;
						end
						if (SW[7:4] <= 5) begin
							counter1 <= SW[7:4];
						end else begin
							counter1 <= 5;
						end
					end
					if (MINUTE == 1'b1) begin
						if (SW[3:0] <= 9) begin
							counter2 <= SW[3:0];
						end else begin
							counter2 <= 9;
						end
						if (SW[7:4] <= 5) begin
							counter3 <= SW[7:4];
						end else begin
							counter3 <= 5;
						end
					end
				end
			end else	if (pause == 1'b1) begin
				if (counter0 != 0) begin
					counter0 <= counter0 - 1;
				end else if (counter1 != 0) begin
					counter1 <= counter1 - 1;
					counter0 <= 9;
				end else if (counter2 != 0) begin
					counter2 <= counter2 - 1;
					counter1 <= 5;
					counter0 <= 9;
				end else if (counter3 != 0) begin
					counter3 <= counter3 - 1;
					counter2 <= 9;
					counter1 <= 5;
					counter0 <= 9;
				end else
				if (reset_buf == 0) begin
					ledr_buf <= ~ledr_buf;
				end
			end
		end
	end
	seven_seg(counter0, HEX0);
	seven_seg(counter1, HEX1);
	seven_seg(counter2, HEX2);
	seven_seg(counter3, HEX3);
	ledr(ledr_buf, LEDR[9:0]);
endmodule