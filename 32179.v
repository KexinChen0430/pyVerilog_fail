module datapath (
    input clk,
    input start,
    input move,
    input jump,
    input [27:0] rate,
	input resetn,
	output reg [159:0] draw,
	output [9:0] LEDR
    );
    //1011011100011011000000
    reg [27:0] count;
	// reg [159:0] out;
	reg [319:0] obstacles;
	// the height control
    reg [1:0] height = 2'b00;
	// press jump will only allow the runner to jump once
	reg jumpOnce = 1'b0;
    // going up or down, add or subtract height by 1
    reg going_up = 1'b1;
    always@(posedge clk) begin
		if (!resetn) begin
			count <= rate;
			height <= 2'b00;
			going_up <= 1'b1;
			jumpOnce <= 1'b0;
		end
        else if (start) begin
        	count <= rate;
        	height <= 2'b00;
         	draw <= 160'b0;
			obstacles[319:0] <= 320'b00000000000000000100000000000100000000001000000000000000001000000000000000000100000000000000010000000000110000000000000000010000000000000000010000000000000001000000000001000000000000100000000000000001000000000000000011000000000000000010000000000000000001000000000000110000000000001100000000000000000100000000000000001100;
			going_up <= 1'b1;
        end
		else begin
            if (count == 28'b0) begin
                count <= rate;
                draw = draw << 2;
				draw[1:0] = obstacles[319:318];
				obstacles[319:0] = {obstacles[317:0], obstacles[319:318]};
				// height will change if it is already jumping or jump button
				// is pushed
				if (jump || (height) != 2'b00) begin
					if (height == 2'b11)
						going_up = 1'b0;
					if (going_up)
						height += 1;
					else
						height -= 1
					if (height == 2'b00)
						going_up = 1'b1;
				end
				draw[159:158] = height;
            else
				count <= count - 1;
				/*if (jump) begin
					if (height == 2'b11)
						going_up = 1'b0;
					if (going_up) begin
						if (!jumpOnce)
							height <= height + 1;
					end
					else begin
						if (!jumpOnce)
							height <= height - 1;
					end
					if (height == 2'b00) begin
						if (!going_up)
						//going_up = 1'b1;
							jumpOnce = 1'b1;
					end
					// leftmost two digits of draw used as runner
					draw[159:158] = height;
				end
				else
					// runner not jumping
					draw[159:158] = 2'b00;
					jumpOnce = 1'b0;
					going_up = 1'b1;
				*/
        end
    end
	assign LEDR[4] = jumpOnce;
    assign LEDR[6] = going_up;
    assign LEDR[9:8] = height;
endmodule