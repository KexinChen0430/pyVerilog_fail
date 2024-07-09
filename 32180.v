module display (
    input [159:0] floor,
    input clk,
	input resetn,
    output reg [7:0] x,
    output reg [6:0] y,
    output reg [2:0] colour
    );
    // initialization
    reg [7:0] x_init=8'd2;
    reg [6:0] y_init = 7'd80;
    reg [2:0] count = 3'b000;
	reg [10:0] counter = 11'b0;
	// counts from 0 to 9 for the first two pixel for the runner
	reg [4:0] runner_count; = 5'b0;
	reg [2:0] runner_height = 3'b0;
	// copy of floor value, will do left shift on local value
	reg [159:0] local_draw;
	// reg [159:0] local_draw =
    always@(posedge clk) begin
		if (!resetn) begin
			x_init <= 8'd2;
			y_init <= 7'd80;
			count <= 3'b000;
			counter <= 11'b0;
			local_draw <= floor<<2;
		end
		else begin
			if (counter < 11'd652) begin
				// fisrt 20 counts used to display runner
				if (counter < 11'd20) begin
					// fisrt or second pixel
					if counter < 11'd10
						x <= 8'd0;
					else
						x <= 8'd1;
					// stands for current display height
					runner_count = counter % 10;
					y = y_init - runner_count;
					// runner's height
					runner_height = floor[159:158] * 2;
					if (runner_count == 5'd0)
						// base line
						colour = 3'b110;
					else if (runner_count < runner_height || runner_count > runner_height + 3)
						// dark part
						colour = 3'b000;
					else
						// runner part
						colour = 3'b101;
				end
				else
				// next 632 counts (158 pixels) to display obstacles
				begin
					count = (counter-20) % 8;
					// x_init starts from 2
					x <= x_init + count[2];
					// the base line case
					if (count[1:0] == 2'b00) begin
						colour <= 3'b110;
						y <= y_init;
					end
					else begin
						/*if (counter < 11'd8) begin
							// the runner case
							// make the height of runner: draw * 2
							y_init = 7'd80 - local_draw[159:158] * 2;
							colour = 3'b101;
						end
						else begin
						*/
						//y_init = 7'd80;
						//if (count[1:0] == 2'b00)
						//	colour = 3'b110;
						//else
						if (count[1:0] > local_draw[159:158])
							colour = 3'b000;
						else
							colour = 3'b011;
						//end
						y <= y_init - count[1:0];
					end
					if (count == 3'b111)
					begin
						x_init <= x_init + 2;
						local_draw <= local_draw << 2;
					end
				end
				counter = counter + 1;
			end
			else begin
				x_init <= 8'd2;
				y_init <= 7'd80;
				count <= 3'b000;
				counter <= 11'b0;
				local_draw <= floor << 2;
			end
		end
	end
endmodule