module that reads in ram
sram_interface RAM_module(.rst(1'b0), .clk(clk_half), .addr(address), .dout(indata), .rdy(memrdy),
								  .sram_clk(ram_clk), .sram_adv(ram_adv), .sram_cre(ram_cre), .sram_ce(ram_ce), .sram_oe(ram_oe), .sram_we(ram_we),
								  .sram_lb(ram_lb), .sram_ub(ram_ub), .sram_data(ram_data), .sram_addr(ram_address));
initial begin
	clk_half = 0;
	beatcount = 0; //
	pixelcount = vpb/2; // to adjust timing
	bcount = 0;
	count = 0;
	started = 0;
	address = 0;
	readmem = 0;
	// audio
	pwmcount = 0;
	pwm_input = 0;
	// game stuff
	hitnote1 = 0;
	hitnote2 = 0;
	streak1 = 5'b00000;
	streak2 = 5'b00000;
	points1 = 0;
	points2 = 0;
	// music data (from bram)
	targetnote = 0;
	hitdata = 0;
end
// YOUR BOARD RUNS ON 100 MHz :)
always @(posedge clk_100mhz) begin
    clk = ~clk;
end
//YOUR MONITOR RUNS ON 25 MHz FREQUENCY
always @(posedge clk) begin
	clk_half = ~clk_half;
	// THIS IS 50 MHz
	// audio stuff
	if (pwmcount == 1 && started) begin
		readmem = 1;
		address = address + 1'b1;
	end
	// three cycles after telling mem_module to read (80 ns)
	if (pwmcount > 1 && pwmcount < 11 && memrdy && readmem) begin
		// read in
		readmem = 0;
		pwm_input[15:0] = indata[15:0];
		// convert to unsigned
		if (pwm_input[15]) begin
			pwm_input = ~pwm_input;
			pwm_input = pwm_input + 1'b1;
			pwm_input = 16'b1000000000000000 - pwm_input;
		end else begin
			pwm_input = pwm_input + 16'b1000000000000000;
		end
	end
	pwmcount = pwmcount + started;
	if (pwmcount > pwmfull)
		pwmcount = 0;
	// reset (for stuff in this always@ block)
	if (select_press) begin // reset song
		address = 0;
		readmem = 0;
		pwmcount = 0;
		pwm_input = 0;
	end
end
always @(posedge clk_half) begin
	// THIS IS 25 MHz
	// check for end of song
	if (beatcount == 1150) begin // couple measures after end
		started = 0;
	end
	// deal with timing for PS2 submodule. solid 500 kHz signal.
	guitarcounter = guitarcounter + 1;
	if (guitarcounter == 25) begin
		guitarcounter = 0;
		guitarclock = ~guitarclock;
	end
	// debug info
	LEDout[7:5] = beatcount[2:0];
	LEDout[4:0] = notedata[4:0];
	// check key stuff
	dstrum1[2:0] = {dstrum1[1:0], PSkeys1[2]};
	dstrum2[2:0] = {dstrum2[1:0], PSkeys2[2]};
	dstart[2:0] = {dstart[1:0], PSkeys1[1]};
	dselect[2:0] = {dselect[1:0], PSkeys1[0]};
	if (start_press && beatcount < 1136)			// if start button has been pressed (downstroke) and not end of song
		started = ~started;	// start song
	if (select_press) begin // reset song
		beatcount = 0;
		pixelcount = vpb/2;
		bcount = 0;
		count = 0;
		started = 0;
		hitnote1 = 0;
		hitnote2 = 0;
		streak1 = 5'b0000;
		streak2 = 5'b0000;
		points1 = 0;
		points2 = 0;
		targetnote = 0;
		hitdata = 0;
	end
	// update movement
	// count is current cycle to next vline
	count = count + started;
	if (count == 25000000*60/bpm/vpb) begin  // cycles per vline of movement
		// increment pixel count, check beat count
		count = 0;
		pixelcount = pixelcount + 1; // move stuff down
		//fdelta = fdelta + 1; // fret adjustment, see video counters below
		if (pixelcount == vpb) begin
			hitnote1[1] = hitnote1[0]; // move hit beats down (hiding notes that were hit)
			hitnote1[0] = 0; // next note, haven't hit it yet
			hitnote2[1] = hitnote2[0]; // bass
			hitnote2[0] = 0;
			pixelcount = 0;
			beatcount = beatcount + 1;
		end
	end
	// check for hitting a note
	// third note down on fretboard is 384 pixels. hitbar: 405 to 435
	// aiming for middle of note (pixelcount) to be in hitbar: 405 < 384 + x < 435
	if (started && hitdata[4:0] != 5'b00000) begin // if the song is playing
		if (pixelcount >= 8 && pixelcount <= 56 && !hitnote1[0]) begin // if we're in range and haven't hit it yet
			// on a beat
			if (PSkeys1[7:3] == hitdata[4:0] && strum1) begin // keys match, and we strum
				hitnote1[0] = 1; // hitnote is reset in pixelcount
				if (streak1 < 15)
					streak1 = streak1 + 1;
				// add point stuff here
				if (streak1 == 15)
					points1 = points1 + 4;
				else if (streak1 >= 10)
					points1 = points1 + 3;
				else if (streak1 >= 5)
					points1 = points1 + 2;
				else
					points1 = points1 + 1;
			end else	if (pixelcount == 56) begin
				// strummed on beat, but wrong note (or already hit)
				streak1 = 0;
			end
		end
	end else if (started) begin // on a blank note
		if (strum1)
			streak1 = 0;	// strummed, so missed
	end
	// bass
	if (started && hitdata[9:5] != 5'b00000) begin // if the song is playing
		if (pixelcount >= 8 && pixelcount <= 56 && !hitnote2[0]) begin // if we're in range and haven't hit it yet
			// on a beat
			if (PSkeys2[7:3] == hitdata[9:5] && strum2) begin // keys match, and we strum
				hitnote2[0] = 1; // hitnote is reset in pixelcount
				if (streak2 < 15)
					streak2 = streak2 + 1;
				// add point stuff here
				if (streak2 == 15)
					points2 = points2 + 4;
				else if (streak2 >= 10)
					points2 = points2 + 3;
				else if (streak2 >= 5)
					points2 = points2 + 2;
				else
					points2 = points2 + 1;
			end else	if (pixelcount == 56) begin
				// strummed on beat, but wrong note (or already hit)
				streak2 = 0;
			end
		end
	end else if (started) begin // on a blank note
		if (strum2)
			streak2 = 0;	// strummed, so missed
	end
	// ----- counters for video
	// ncount: halfheight of notes on fretboard
	// goes from 5 to 10, for a note size of 10 to 20 pixels.
	// increases down the screen.
	// fcount: distance between frets. moves from half vpb at top to full vpb at the bottom near the hitbar
	// used to properly draw perspective
	// fline: next fretline down the screen to draw
	if (hcount == 0 && vcount == 0) begin // reset counters
		ncounter = 0;
		ncount = 5;
		fcounter = 0;
		bcount = beatcount;
		targetnote = beatcount+7; // when set to = beatcount, first note is on 23
										// first note is 16 in bram, so +7;
		fcount = vpb/2;
		fline = fretstart+pixelcount/2;
		// reset slope counters
		slope1 = 32;
		slope2 = 19;
		slope3 = 6;
		slope1counter = 0;
		slope2counter = 0;
		slope3counter = 0;
	end
	if (hcount == 0) begin
	    slope1counter = slope1counter + 1;
	    slope2counter = slope2counter + 1;
	    slope3counter = slope3counter + 1;
	    // partial slopes because the overall slopes are 15/4, 25/4, and 75/4, which aren't integers
	    if (slope1counter == 4 | slope1counter == 8 | slope1counter == 12) begin
            slope1 = slope1 + 1;
        end
        if (slope2counter == 6 | slope2counter == 12 | slope2counter == 18) begin
            slope2 = slope2 + 1;
        end
        if (slope3counter == 19 | slope3counter == 37 | slope3counter == 56) begin
            slope3 = slope3 + 1;
        end
	    if (slope1counter == 15) begin
	        slope1counter = 0;
	        slope1 = slope1 + 1;
	    end
        if (slope2counter == 25) begin
            slope2counter = 0;
            slope2 = slope2 + 1;
        end
        if (slope3counter == 75) begin
            slope3counter = 0;
            slope3 = slope3 + 1;
        end
    end
	if (hcount == 0 && vcount > fretstart) begin
		ncounter = ncounter + 1;
		if (ncounter == fretlength/5) begin
			ncounter = 0;
			ncount = ncount + 1;
		end
	end
	if (hcount == 0 && vcount > fretstart) begin
		fcounter = fcounter + 1;
		if (fcounter == hitlength/(vpb/2)) begin
			fcounter = 0;
			fcount = fcount + 1;
			if (vcount < fline) // adjust previous estimation
				fline = fline + 1;
		end
	end
	if (vcount > fline + (fcount)/2) begin// if the current vcount is > than half to the next fline, set next fline
		bcount = bcount + 1;
		targetnote = targetnote - 1;
		fline = fline + fcount;
	end
	// calculate note stuff
	// targetnote = (480-vcount+pixelcount)/vpb+beatcount; // old equation for constant velocity
	// now counts with vga. targetnote is reset in vga counters
	if (targetnote == beatcount && pixelcount < 7)
		hitdata[9:0] = notedata[9:0];
	if (targetnote == beatcount) begin
		shownote1 = ~hitnote1[0];
		shownote2 = ~hitnote2[0];
	end else if (targetnote == beatcount-1) begin
		shownote1 = ~hitnote1[1];
		shownote2 = ~hitnote2[1];
	end else begin
		shownote1 = 1'b1;
		shownote2 = 1'b1;
	end
	// VIDEO!!!!1!!!111!111one!!eleven!1!1
	case (blank)
		1: begin
			rgb = 0;
		end
		0: begin
			// draw ALL THE THINGS
			// background color
			rgb = 12'b0100_0100_0100; // gray
			// point bar for player 1
			if (hcount >= 136-slope1 && hcount <= 155-slope1 && vcount >= 60 && vcount <= 374) begin
				// black border
				if (hcount == 136-slope1 || hcount == 155-slope1 || vcount == 60 || vcount == 374) begin
				    rgb = 12'b0000_0000_0000;
                end else begin
                    if (vcount*10 > 3740-points1*2 || points1 > 1670)
                        rgb = 12'b0000_1010_0000; // green point bar
                end
			end
			// inside fretboard 1 (to simplify things)
			if (hcount >= 160-slope1 && hcount <= 161+slope1 && vcount >= 60) begin
				// fretboard background
				rgb = 12'b0110_0010_0000; // brown
				// fretlines
				if (vcount == fline && bcount[0] == 1)
					rgb = 12'b1100_1100_1100; // white fretline
				if (vcount == fline && bcount[0] == 0)
					rgb = 12'b0110_0110_1000; // grey fretline
				if (vcount > fline-ncount && vcount < fline+ncount && shownote1) begin // draw notes
					// green notes column
					if (hcount >= 164-slope1 && hcount <= 156-slope2 && notedata[4]) begin
						rgb = 12'b0000_1110_0000;
					end
					// red notes column
					if (hcount >= 164-slope2 && hcount <= 156-slope3 && notedata[3]) begin
						rgb = 12'b1110_0000_0000;
					end
					// yellow notes column
					if (hcount >= 164-slope3 && hcount <= 157+slope3 && notedata[2]) begin
						rgb = 12'b1110_1110_0000;
					end
					// blue notes column
					if (hcount >= 165+slope3 && hcount <= 157+slope2 && notedata[1]) begin
						rgb = 12'b0000_0000_1100;
					end
					// orange notes column
					if (hcount >= 165+slope2 && hcount <= 157+slope1 && notedata[0]) begin
						rgb = 12'b1110_0110_0000;
					end
				end
				// hitbar lines
				if (vcount == 435 || vcount == 436 ||   // bottom bar bottom line
				    vcount == 405 || vcount == 406)     // bottom bar top line
					rgb = 12'b1111_1010_0000; //12'b1111_1111_1111;
				// draw the pressed button things
				if (vcount > 409 && vcount < 432) begin
					// green
					if (hcount >= 164-slope1 && hcount <= 156-slope2 && PSkeys1[7])
						rgb = 12'b0000_1110_0000;
					// red
					if (hcount >= 164-slope2 && hcount <= 156-slope3 && PSkeys1[6])
						rgb = 12'b1110_0000_0000;
					// yellow
					if (hcount >= 164-slope3 && hcount <= 157+slope3 && PSkeys1[5])
						rgb = 12'b1110_1110_0000;
					// blue
					if (hcount >= 165+slope3 && hcount <= 157+slope2 && PSkeys1[4])
						rgb = 12'b0000_0000_1100;
					// orange
					if (hcount >= 165+slope2 && hcount <= 157+slope1 && PSkeys1[3])
						rgb = 12'b1110_0110_0000;
				end
				// draw the fretboard vertical lines
                if (hcount == 160-slope1)   rgb = 12'b1111_1111_1111; // left outer to inner lines
                if (hcount == 160-slope2)   rgb = 12'b1111_1111_1111;
                if (hcount == 160-slope3)   rgb = 12'b1111_1111_1111; // shallowest, middle
                if (hcount == 161+slope3)   rgb = 12'b1111_1111_1111;
                if (hcount == 161+slope2)   rgb = 12'b1111_1111_1111;
                if (hcount == 161+slope1)   rgb = 12'b1111_1111_1111;
			end // of fretboard 1
			// streak meter for fretboard 1
			if (hcount >= 165+slope1 && hcount <= 184+slope1 && vcount >= 253 && vcount <= 374) begin
				// outline
				if (hcount == 165+slope1 || hcount == 184+slope1 || vcount == 253 || vcount == 374) begin
				    rgb = 12'b0000_0000_0000;
                end else if (vcount > 374-streak1*8) begin
                    // if within the area we want to fill, set color based on streak amount
					if (streak1 == 15)
						rgb = 12'b0110_0000_1100; // purple
					else if (streak1 >= 10)
						rgb = 12'b0100_0110_1100; // light blue
					else if (streak1 >= 5)
						rgb = 12'b0010_1110_0100; // light green
					else
						rgb = 12'b1110_1110_0100; // light yellow
				end
			end
			// point bar for player 2
			//if (4*(vcount - 180) <= 15*(hcount - 564) && 4*(vcount - 180) > 15*(hcount - 584) && vcount >= 60 && vcount < 375) begin
			if (hcount >= 486+slope1 && hcount <= 505+slope1 && vcount >= 60 && vcount <= 374) begin
				// black border
				if (hcount == 486+slope1 || hcount == 505+slope1 || vcount == 60 || vcount == 374) begin
				    rgb = 12'b0000_0000_0000;
				end else begin //if (4*(vcount - 180) <= 15*(hcount - 565) && 4*(vcount - 180) > 15*(hcount - 583) && vcount > 60 && vcount < 374) begin
					if (vcount*10 > 3740-points2*2 || points2 > 1670)
						rgb = 12'b0000_1010_0000; // green point bar
				end
			end
			// inside fretboard 2 (to simplify things)
			//if (-4*(vcount - 180) <= 15*(hcount - 400) && 4*(vcount - 180) > 15*(hcount - 561) && vcount >= 60 && hcount > 320) begin
            if (hcount >= 480-slope1 && hcount <= 481+slope1 && vcount >= 60) begin
				// fretboard background
                rgb = 12'b0110_0010_0000; // brown
                // fretlines
                if (vcount == fline && bcount[0] == 1)
                    rgb = 12'b1101_1100_1100; // white fretline
                if (vcount == fline && bcount[0] == 0)
                    rgb = 12'b0111_0110_1000; // grey fretline
				if (vcount > fline-ncount && vcount < fline+ncount && shownote2) begin // draw notes
					// green notes column
					//if (-4*(vcount - 180) <= 15*(hcount - 404) && -4*(vcount - 180) > 25*(hcount - 429) && notedata[9]) begin
                    if (hcount >= 484-slope1 && hcount <= 476-slope2 && notedata[9]) begin
						rgb = 12'b0000_1110_0000;
					end
					// red notes column
					//if (-4*(vcount - 180) <= 25*(hcount - 436) && -4*(vcount - 180) > 75*(hcount - 461) && notedata[8]) begin
					if (hcount >= 484-slope2 && hcount <= 476-slope3 && notedata[8]) begin
						rgb = 12'b1110_0000_0000;
					end
					// yellow notes column
					//if (-4*(vcount - 180) <= 75*(hcount - 468) && 4*(vcount - 180) > 75*(hcount - 493) && notedata[7]) begin
					if (hcount >= 484-slope3 && hcount <= 477+slope3 && notedata[7]) begin
						rgb = 12'b1110_1110_0000;
					end
					// blue notes column
					//if (4*(vcount - 180) <= 75*(hcount - 500) && 4*(vcount - 180) > 25*(hcount - 525) && notedata[6]) begin
					if (hcount >= 485+slope3 && hcount <= 477+slope2 && notedata[6]) begin
						rgb = 12'b0000_0000_1100;
					end
					// orange notes column
					//if (4*(vcount - 180) <= 25*(hcount - 532) && 4*(vcount - 180) > 15*(hcount - 557) && notedata[5]) begin
					if (hcount >= 485+slope2 && hcount <= 477+slope1 && notedata[5]) begin
						rgb = 12'b1110_0110_0000;
					end
				end
				// hitbar lines
				if (vcount == 435 || vcount == 436 ||   // bottom bar bottom line
                    vcount == 405 || vcount == 406)     // bottom bar top line
					rgb = 12'b1111_1111_1111;
				// draw the pressed button things
				if (vcount > 409 && vcount < 432) begin
					// green
					if (hcount >= 484-slope1 && hcount <= 476-slope2 && PSkeys2[7])
						rgb = 12'b0000_1110_0000;
					// red
					if (hcount >= 484-slope2 && hcount <= 476-slope3 && PSkeys2[6])
						rgb = 12'b1110_0000_0000;
					// yellow
					if (hcount >= 484-slope3 && hcount <= 477+slope3 && PSkeys2[5])
						rgb = 12'b1110_1110_0000;
					// blue
					if (hcount >= 485+slope3 && hcount <= 477+slope2 && PSkeys2[4])
						rgb = 12'b0000_0000_1100;
					// orange
					if (hcount >= 485+slope2 && hcount <= 477+slope1 && PSkeys2[3])
						rgb = 12'b1110_0110_0000;
				end
				// draw the fretboard vertical lines
                if (hcount == 480-slope1)   rgb = 12'b1111_1111_1111;   // left outer to inner lines
                if (hcount == 480-slope2)   rgb = 12'b1111_1111_1111;
                if (hcount == 480-slope3)   rgb = 12'b1111_1111_1111;   // shallowest, middle
                if (hcount == 481+slope3)   rgb = 12'b1110_1110_1110;
                if (hcount == 481+slope2)   rgb = 12'b1110_1110_1110;
                if (hcount == 481+slope1)   rgb = 12'b1110_1110_1110;
			end // of fretboard 2
			// streak meter for fretboard 2
			/*if (-4*(vcount - 180) <= 15*(hcount - 376) && -4*(vcount - 180) > 15*(hcount - 396) && vcount > 253 && vcount < 375) begin
				// border
				rgb = 8'b00000000;
				if (-4*(vcount - 180) <= 15*(hcount - 377) && -4*(vcount - 180) > 15*(hcount - 395) && vcount > 254 && vcount < 374) begin
					if (streak2 == 15) begin
						rgb = 8'b01100011; // purple
					end else if (streak2 >= 10) begin
						rgb = 8'b01001111; // light blue
					end else if (streak2 >= 5) begin
						rgb = 8'b00111101; // light green
					end else
						rgb = 8'b11111101; // light yellow
					// draw the empty space on the streak
					if (vcount < 375-streak2*8) begin
						rgb = 8'b01001001; // background
					end
				end
			end*/
			// more drawing can go here
			//if (hcount == vcount)
			// rgb = 8'b11100000;
		end// of draw
	endcase
end // always @
endmodule