module with zeros when the blank signal
// is high.
wire [10:0]		write_addr = {!line_count0[0], pixel_count0[9:0]};
wire [10:0]		read_addr = {line_count0[0], pixel_count0[9:0]};
wire				write_enable = 1'b1; // write every clock posedge
reg [7:0] 		red_rainbow;
reg [7:0] 		green_rainbow;
reg [7:0] 		blue_rainbow;
// directions: 2'b00 == hold, 2'b01 == increase, 2'b10 == decrease
reg [1:0] 		red_direction;
reg [1:0] 		green_direction;
reg [1:0] 		blue_direction;
// compensate for the delay caused by displaying the previous line while
// calculating the current line by using a line counter that is one line
// ahead of the original line counter
always @ (posedge pixel_clock) begin
	if ((line_count0 == (`V_TOTAL - 2)) & (pixel_count0 == (`H_TOTAL - 3)))
		// last pixel in last line of frame, so reset line counter
		line_count <= 10'h000;
	else if (pixel_count0 == (`H_TOTAL - 3))
		// last pixel but not last line, so increment line counter
		line_count <= line_count + 1;
end
// compensate for putting the pixel_count generation and the code that
// checks it on the same clock edge
always @ (posedge pixel_clock) begin
	if ((pixel_count0 == (`H_TOTAL - 3)))
		// last pixel in last line of frame, so reset line counter
		pixel_count <= 10'h000;
	else
		// last pixel but not last line, so increment line counter
		pixel_count <= pixel_count + 1;
end
// cycle through all of the possible hues in a rainbow pattern
always @ (posedge pixel_clock) begin
	// start last color bar at pure red
	if (reset) begin
		red_rainbow <= 8'hFF;
		green_rainbow <= 8'h00;
		blue_rainbow <= 8'h00;
		red_direction <= 2'b00;
		green_direction <= 2'b01;
		blue_direction <= 2'b00;
	end
	else begin
		// on the first line that is past the active region displayed,
		// calculate the color for the last color bar
		if ((pixel_count == 0) & (line_count == 480)) begin
			if (red_direction[0]) begin
				if (red_rainbow == 8'hFF) begin
					red_direction <= 2'b00;
					blue_direction <= 2'b10;
				end
				else
					red_rainbow <= red_rainbow + 8'h01;
			end
			if (red_direction[1]) begin
				if (red_rainbow == 8'h00) begin
					red_direction <= 2'b00;
					blue_direction <= 2'b01;
				end
				else
					red_rainbow <= red_rainbow - 8'h01;
			end
			if (green_direction[0]) begin
				if (green_rainbow == 8'hFF) begin
					green_direction <= 2'b00;
					red_direction <= 2'b10;
				end
				else
					green_rainbow <= green_rainbow + 8'h01;
			end
			if (green_direction[1]) begin
				if (green_rainbow == 8'h00) begin
					green_direction <= 2'b00;
					red_direction <= 2'b01;
				end
				else
					green_rainbow <= green_rainbow - 8'h01;
			end
			if (blue_direction[0]) begin
				if (blue_rainbow == 8'hFF) begin
					blue_direction <= 2'b00;
					green_direction <= 2'b10;
				end
				else
					blue_rainbow <= blue_rainbow + 8'h01;
			end
			if (blue_direction[1]) begin
				if (blue_rainbow == 8'h00) begin
					blue_direction <= 2'b00;
					green_direction <= 2'b01;
				end
				else
					blue_rainbow <= blue_rainbow - 8'h01;
			end
		end
	end
end
// select the color based on the horizontal position
always @ (posedge pixel_clock) begin
	if (pixel_count < 79) begin											//red
		red_data		<= 1'b1;
		green_data	<= 1'b0;
		blue_data	<= 1'b0;
	end
	else if ((pixel_count > 80) & (pixel_count < 159)) begin		//yellow
		red_data		<= 1'b1;
		green_data	<= 1'b1;
		blue_data	<= 1'b0;
	end
	else if ((pixel_count > 160) & (pixel_count < 239)) begin	//green
		red_data		<= 1'b0;
		green_data	<= 1'b1;
		blue_data	<= 1'b0;
	end
	else if ((pixel_count > 240) & (pixel_count < 319)) begin	//cyan
		red_data		<= 1'b0;
		green_data	<= 1'b1;
		blue_data	<= 1'b1;
	end
	else if ((pixel_count > 320) & (pixel_count < 399)) begin	//blue
		red_data		<= 1'b0;
		green_data	<= 1'b0;
		blue_data	<= 1'b1;
	end
	else if ((pixel_count > 400) & (pixel_count < 479)) begin	//magenta
		red_data		<= 1'b1;
		green_data	<= 1'b0;
		blue_data	<= 1'b1;
	end
	else if ((pixel_count > 480) & (pixel_count < 559)) begin	//white
		red_data		<= 1'b1;
		green_data	<= 1'b1;
		blue_data	<= 1'b1;
	end
	else if (pixel_count > 560) begin									//rainbow pattern
		red_data		<= red_rainbow[7];
		green_data	<= green_rainbow[7];
		blue_data	<= blue_rainbow[7];
	end
	else begin																	//black
		red_data		<= 1'b0;
		green_data	<= 1'b0;
		blue_data	<= 1'b0;
	end
end
// Instantiate the video RAM
VIDEO_RAM VIDEO_RAM
(
pixel_clock,		// write clock
write_enable,		// write eanble
write_addr,			// write address
write_data,			// write data
pixel_clock,		// read clock
read_addr,			// read address
read_data			// read data
);
endmodule