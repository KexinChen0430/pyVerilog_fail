module is the main task list for the renderer, it can be utilized in a variety of ways to render information.
		if (data_index == NUM_LABEL_TASKS + 4) ins_sw <= reg_index;
		if (data_index == NUM_LABEL_TASKS + 5) ins_sw <= reg_index + 32; //this code requests the data from memory to be printed on screen
		if (data_index == NUM_LABEL_TASKS + 6) mem_sw <= reg_index;
		if (data_index == NUM_LABEL_TASKS + 7) mem_sw <= reg_index + 32; //it always request the data one clock ahead of time, so that the data is ready when the system reads it
		// Following two lines added by Nicholas LaJoie (@spudniche on github)
		if (data_index == NUM_LABEL_TASKS + 8) reg_sw <= reg_index;
		//if (data_index == NUM_LABEL_TASKS + 9) reg_sw <= reg_index + 32;  //this line is unnecessary for a 32-entry register file-- Tristan
		case (data_index)
		//in the case of text labels, the hex_buffer is set manually for each character, and the data is only written to memory once.
			0: begin //"INS. MEMORY" label
				hex_buffer[10] <= 6'h12;
				hex_buffer[9] <= 6'h17;
				hex_buffer[8] <= 6'h1C;
				hex_buffer[7] <= 6'h28;
				hex_buffer[6] <= 6'h24;
				hex_buffer[5] <= 6'h16;
				hex_buffer[4] <= 6'h0E;
				hex_buffer[3] <= 6'h16;
				hex_buffer[2] <= 6'h18;
				hex_buffer[1] <= 6'h1B;
				hex_buffer[0] <= 6'h22;
				row = 0;
				column = 0;
				num_chars = 11;
				end
			1: begin //"DATA MEMORY" label
					hex_buffer[10] <= 6'h0D;
					hex_buffer[9] <= 6'h0A;
					hex_buffer[8] <= 6'h1D;
					hex_buffer[7] <= 6'h0A;
					hex_buffer[6] <= 6'h24;
					hex_buffer[5] <= 6'h16;
					hex_buffer[4] <= 6'h0E;
					hex_buffer[3] <= 6'h16;
					hex_buffer[2] <= 6'h18;
					hex_buffer[1] <= 6'h1B;
					hex_buffer[0] <= 6'h22;
					row = 0;
					column = 25;
					num_chars = 11;
				end
			2: begin //"REGISTERS" label
					hex_buffer[8] <= 6'h1B;
					hex_buffer[7] <= 6'h0E;
					hex_buffer[6] <= 6'h10;
					hex_buffer[5] <= 6'h12;
					hex_buffer[4] <= 6'h1C;
					hex_buffer[3] <= 6'h1D;
					hex_buffer[2] <= 6'h0E;
					hex_buffer[1] <= 6'h1B;
					hex_buffer[0] <= 6'h1C;
					row = 0;
					column = 50;
					num_chars = 9;
				end
				3: begin //PC HISTORY label
						hex_buffer[9] <= 6'h19;
						hex_buffer[8] <= 6'h0C;
						hex_buffer[7] <= 6'h24;
						hex_buffer[6] <= 6'h11;
						hex_buffer[5] <= 6'h12;
						hex_buffer[4] <= 6'h1C;
						hex_buffer[3] <= 6'h1D;
						hex_buffer[2] <= 6'h18;
						hex_buffer[1] <= 6'h1B;
						hex_buffer[0] <= 6'h22;
						row  = 0;
						column = 63;
						num_chars = 10;
					end
				4: begin //CYCLES label
						hex_buffer[6] <= 6'h0C;
						hex_buffer[5] <= 6'h22;
						hex_buffer[4] <= 6'h0C;
						hex_buffer[3] <= 6'h15;
						hex_buffer[2] <= 6'h0E;
						hex_buffer[1] <= 6'h1C;
						hex_buffer[0] <= 6'h27;
						row = 35;
						column = 0;
						num_chars = 7;
					end
				5: begin //DEBUG label
						hex_buffer[4] <= 6'h0D;
						hex_buffer[3] <= 6'h0E;
						hex_buffer[2] <= 6'h0B;
						hex_buffer[1] <= 6'h1E;
						hex_buffer[0] <= 6'h10;
						row = 39;
						column = 0;
						num_chars = 5;
					end
				6: begin //GP REGISTER 1 label
						hex_buffer[12] <= 6'h10;
						hex_buffer[11] <= 6'h19;
						hex_buffer[10] <= 6'h24;
						hex_buffer[9] <= 6'h1B;
						hex_buffer[8] <= 6'h0E;
						hex_buffer[7] <= 6'h10;
						hex_buffer[6] <= 6'h12;
						hex_buffer[5] <= 6'h1C;
						hex_buffer[4] <= 6'h1D;
						hex_buffer[3] <= 6'h0E;
						hex_buffer[2] <= 6'h1B;
						hex_buffer[1] <= 6'h24;
						hex_buffer[0] <= 6'h01;
						row = 13;
						column = 63;
						num_chars = 13;
					end
				7: begin //GP REGISTER 2 label
						hex_buffer[12] <= 6'h10;
						hex_buffer[11] <= 6'h19;
						hex_buffer[10] <= 6'h24;
						hex_buffer[9] <= 6'h1B;
						hex_buffer[8] <= 6'h0E;
						hex_buffer[7] <= 6'h10;
						hex_buffer[6] <= 6'h12;
						hex_buffer[5] <= 6'h1C;
						hex_buffer[4] <= 6'h1D;
						hex_buffer[3] <= 6'h0E;
						hex_buffer[2] <= 6'h1B;
						hex_buffer[1] <= 6'h24;
						hex_buffer[0] <= 6'h02;
						row = 16;
						column = 63;
						num_chars = 13;
					end
				8: begin //GP REGISTER 3 label
						hex_buffer[12] <= 6'h10;
						hex_buffer[11] <= 6'h19;
						hex_buffer[10] <= 6'h24;
						hex_buffer[9] <= 6'h1B;
						hex_buffer[8] <= 6'h0E;
						hex_buffer[7] <= 6'h10;
						hex_buffer[6] <= 6'h12;
						hex_buffer[5] <= 6'h1C;
						hex_buffer[4] <= 6'h1D;
						hex_buffer[3] <= 6'h0E;
						hex_buffer[2] <= 6'h1B;
						hex_buffer[1] <= 6'h24;
						hex_buffer[0] <= 6'h03;
						row = 19;
						column = 63;
						num_chars = 13;
					end
				9: begin //GP REGISTER 4 label
						hex_buffer[12] <= 6'h10;
						hex_buffer[11] <= 6'h19;
						hex_buffer[10] <= 6'h24;
						hex_buffer[9] <= 6'h1B;
						hex_buffer[8] <= 6'h0E;
						hex_buffer[7] <= 6'h10;
						hex_buffer[6] <= 6'h12;
						hex_buffer[5] <= 6'h1C;
						hex_buffer[4] <= 6'h1D;
						hex_buffer[3] <= 6'h0E;
						hex_buffer[2] <= 6'h1B;
						hex_buffer[1] <= 6'h24;
						hex_buffer[0] <= 6'h04;
						row = 22;
						column = 63;
						num_chars = 13;
					end
				10: begin //00-15: label
						hex_buffer[5] <= 6'h00;
						hex_buffer[4] <= 6'h00;
						hex_buffer[3] <= 6'h26;
						hex_buffer[2] <= 6'h01;
						hex_buffer[1] <= 6'h05;
						hex_buffer[0] <= 6'h27;
						row = 40;
						column = 0;
						num_chars = 6;
					end
				11: begin //16-31: label
						hex_buffer[5] <= 6'h01;
						hex_buffer[4] <= 6'h06;
						hex_buffer[3] <= 6'h26;
						hex_buffer[2] <= 6'h03;
						hex_buffer[1] <= 6'h01;
						hex_buffer[0] <= 6'h27;
						row = 42;
						column = 0;
						num_chars = 6;
					end
				12: begin //debug 0-15 task
					z = 0;
					while (z <= 19) begin
						hex_buffer[z] = debug_buffer[z];
						z = z + 1;
					end
					column = 6;
					row = 40;
					num_chars = 20;
				end
			13: begin //debug 16-31 task
					z = 0;
					while (z <= 18) begin
						hex_buffer[z] = debug_buffer[z + 20];
						z = z + 1;
					end
					column = 6;
					row = 42;
					num_chars = 19;
				end
				//data tasks send an address to various sources, and render the received data using the decoder.
			(NUM_LABEL_TASKS + 1): begin //instruction memory indexes 00-31
					data <= reg_index;
					column = 0;
					row = reg_index + 1;
					num_chars = 2;
				end
			(NUM_LABEL_TASKS + 2): begin //instruction memory indexes 32-63
					data <= reg_index + 32;
					column = 12;
					row = reg_index + 1;
					num_chars = 2;
				end
			(NUM_LABEL_TASKS + 3): begin //data_memory indexes 00-31
					data <= reg_index;
					column = 25;
					row = reg_index + 1;
					num_chars = 2;
				end
			(NUM_LABEL_TASKS + 4): begin //data_memory indexes 32-63
					data <= reg_index + 32;
					column = 37;
					row = reg_index + 1;
					num_chars = 2;
				end
			(NUM_LABEL_TASKS + 5): begin //instruction memory data 00-31
					data <= ins_data;
					column = 2;
					row = reg_index + 1;
					num_chars = 9;
					hex_buffer[8] <= 6'h27;
				end
			(NUM_LABEL_TASKS + 6): begin //instruction memory data 32-63
					data <= ins_data;
					column = 14;
					row = reg_index + 1;
					num_chars = 9;
					hex_buffer[8] <= 6'h27;
				end
			(NUM_LABEL_TASKS + 7): begin //data memory data 00-31
					data <= mem_data;
					column = 27;
					row = reg_index + 1;
					num_chars = 9;
					hex_buffer[8] <= 6'h27;
				end
			(NUM_LABEL_TASKS + 8): begin //data memory data 31-63
					data <= mem_data;
					column = 39;
					row = reg_index + 1;
					num_chars = 9;
					hex_buffer[8] <= 6'h27;
				end
			(NUM_LABEL_TASKS + 9): begin //register indexes
					data <= 0;
					data[4:0] <= reg_index;
					column = 50;
					row = reg_index + 1;
					num_chars = 2;
				end
			(NUM_LABEL_TASKS + 10): begin // register data
					reg_sw <= reg_index;
					data <= reg_data;
					column = 52;
					row = reg_index + 1;
					num_chars = 9;
					hex_buffer[8] <= 6'h27;
					if (slice_delay == 1) reg_index = reg_index + 1;
					if (reg_index == 32) begin //this resets the register index variable to zero once it reaches 32
						reg_index = 0;
					end
				end
			(NUM_LABEL_TASKS + 11): begin //Cycles data
					data <= cycle_counter;
					column = 8;
					row = 35;
					num_chars = 4;
				end
			(NUM_LABEL_TASKS + 12): begin //pc history data
					if (reg_index <= 9) begin
						data <= pc_history[reg_index];
						row = reg_index + 1;
						column = 63;
						num_chars = 4;
					end
					else num_chars = 0; //setting num chars to 0 causes nothing to be written to memory, essentially aborting the source_data task
				end
			(NUM_LABEL_TASKS + 13): begin
					data <= gp_reg_1;
					column = 63;
					row = 14;
					num_chars = 8;
				end
			(NUM_LABEL_TASKS + 14): begin
					data <= gp_reg_2;
					column = 63;
					row = 17;
					num_chars = 8;
				end
			(NUM_LABEL_TASKS + 15): begin
					data <= gp_reg_3;
					column = 63;
					row = 20;
					num_chars = 8;
				end
			(NUM_LABEL_TASKS + 16): begin
					data <= gp_reg_4;
					column = 63;
					row = 23;
					num_chars = 8;
				end
			default: data_index = NUM_LABEL_TASKS;
		endcase
	endtask
	task slice_data; //I tried other ways of doing this, but the straightforward approach works better.
		hex_buffer[7] <= data[31:28];
		hex_buffer[6] <= data[27:24];
		hex_buffer[5] <= data[23:20];
		hex_buffer[4] <= data[19:16];
		hex_buffer[3] <= data[15:12];
		hex_buffer[2] <= data[11:8];
		hex_buffer[1] <= data[7:4];
		hex_buffer[0] <= data[3:0];
	endtask
	task decode_hex;
		case (hex_digit)
			6'h00: begin //zero
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b01000010;
					mem_buffer[39:32] <= 8'b01000010;
					mem_buffer[47:40] <= 8'b01000010;
					mem_buffer[55:48] <= 8'b01000010;
					mem_buffer[63:56] <= 8'b00111100;
					end
			6'h01: begin //one
					mem_buffer[7:0] <=   8'b00011000;
					mem_buffer[15:8] <=  8'b00111000;
					mem_buffer[23:16] <= 8'b01111000;
					mem_buffer[31:24] <= 8'b00011000;
					mem_buffer[39:32] <= 8'b00011000;
					mem_buffer[47:40] <= 8'b00011000;
					mem_buffer[55:48] <= 8'b00011000;
					mem_buffer[63:56] <= 8'b01111110;
					end
			6'h02: begin //two
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01100110;
					mem_buffer[23:16] <= 8'b01100110;
					mem_buffer[31:24] <= 8'b00001100;
					mem_buffer[39:32] <= 8'b00011000;
					mem_buffer[47:40] <= 8'b00110000;
					mem_buffer[55:48] <= 8'b01100000;
					mem_buffer[63:56] <= 8'b01111110;
					end
			6'h03: begin //three
					mem_buffer[7:0] <=   8'b01111100;
					mem_buffer[15:8] <=  8'b00000110;
					mem_buffer[23:16] <= 8'b00000110;
					mem_buffer[31:24] <= 8'b01111100;
					mem_buffer[39:32] <= 8'b00000110;
					mem_buffer[47:40] <= 8'b00000110;
					mem_buffer[55:48] <= 8'b00000110;
					mem_buffer[63:56] <= 8'b01111100;
					end
			6'h04: begin //four
					mem_buffer[7:0] <=   8'b00001110;
					mem_buffer[15:8] <=  8'b00010110;
					mem_buffer[23:16] <= 8'b00100110;
					mem_buffer[31:24] <= 8'b01000110;
					mem_buffer[39:32] <= 8'b01000110;
					mem_buffer[47:40] <= 8'b01111110;
					mem_buffer[55:48] <= 8'b00000110;
					mem_buffer[63:56] <= 8'b00000110;
					end
			6'h05: begin //five
					mem_buffer[7:0] <=   8'b01111110;
					mem_buffer[15:8] <=  8'b01100000;
					mem_buffer[23:16] <= 8'b01100000;
					mem_buffer[31:24] <= 8'b01111000;
					mem_buffer[39:32] <= 8'b00001100;
					mem_buffer[47:40] <= 8'b00000110;
					mem_buffer[55:48] <= 8'b00001100;
					mem_buffer[63:56] <= 8'b01111000;
					end
			6'h06: begin //six
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01000000;
					mem_buffer[23:16] <= 8'b01000000;
					mem_buffer[31:24] <= 8'b01111100;
					mem_buffer[39:32] <= 8'b01000010;
					mem_buffer[47:40] <= 8'b01000010;
					mem_buffer[55:48] <= 8'b01000010;
					mem_buffer[63:56] <= 8'b00111100;
					end
			6'h07: begin //seven
					mem_buffer[7:0] <=   8'b01111110;
					mem_buffer[15:8] <=  8'b00000110;
					mem_buffer[23:16] <= 8'b00000110;
					mem_buffer[31:24] <= 8'b00000110;
					mem_buffer[39:32] <= 8'b00001100;
					mem_buffer[47:40] <= 8'b00011000;
					mem_buffer[55:48] <= 8'b00110000;
					mem_buffer[63:56] <= 8'b01100000;
					end
			6'h08: begin //eight
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b00111100;
					mem_buffer[39:32] <= 8'b01000010;
					mem_buffer[47:40] <= 8'b01000010;
					mem_buffer[55:48] <= 8'b01000010;
					mem_buffer[63:56] <= 8'b00111100;
					end
			6'h09: begin //nine
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01000110;
					mem_buffer[23:16] <= 8'b01000110;
					mem_buffer[31:24] <= 8'b01000110;
					mem_buffer[39:32] <= 8'b00111110;
					mem_buffer[47:40] <= 8'b00000110;
					mem_buffer[55:48] <= 8'b00000110;
					mem_buffer[63:56] <= 8'b00000110;
					end
			6'h0A: begin //A
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b01000010;
					mem_buffer[39:32] <= 8'b01111110;
					mem_buffer[47:40] <= 8'b01000010;
					mem_buffer[55:48] <= 8'b01000010;
					mem_buffer[63:56] <= 8'b01000010;
					end
			6'h0B: begin //B
					mem_buffer[7:0] <=   8'b01111100;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b01111100;
					mem_buffer[39:32] <= 8'b01000110;
					mem_buffer[47:40] <= 8'b01000010;
					mem_buffer[55:48] <= 8'b01000110;
					mem_buffer[63:56] <= 8'b01111100;
					end
			6'h0C: begin //C
					mem_buffer[7:0] <=   8'b00111110;
					mem_buffer[15:8] <=  8'b01100000;
					mem_buffer[23:16] <= 8'b01100000;
					mem_buffer[31:24] <= 8'b01100000;
					mem_buffer[39:32] <= 8'b01100000;
					mem_buffer[47:40] <= 8'b01100000;
					mem_buffer[55:48] <= 8'b01100000;
					mem_buffer[63:56] <= 8'b00111110;
					end
			6'h0D: begin //D
					mem_buffer[7:0] <=   8'b01111100;
					mem_buffer[15:8] <=  8'b01100010;
					mem_buffer[23:16] <= 8'b01100010;
					mem_buffer[31:24] <= 8'b01100010;
					mem_buffer[39:32] <= 8'b01100010;
					mem_buffer[47:40] <= 8'b01100010;
					mem_buffer[55:48] <= 8'b01100010;
					mem_buffer[63:56] <= 8'b01111100;
					end
			6'h0E: begin //E
					mem_buffer[7:0] <=   8'b00111110;
					mem_buffer[15:8] <=  8'b01100000;
					mem_buffer[23:16] <= 8'b01100000;
					mem_buffer[31:24] <= 8'b01111110;
					mem_buffer[39:32] <= 8'b01100000;
					mem_buffer[47:40] <= 8'b01100000;
					mem_buffer[55:48] <= 8'b01100000;
					mem_buffer[63:56] <= 8'b00111110;
					end
			6'h0F: begin //F
					mem_buffer[7:0] <=   8'b01111110;
					mem_buffer[15:8] <=  8'b01100000;
					mem_buffer[23:16] <= 8'b01100000;
					mem_buffer[31:24] <= 8'b01111110;
					mem_buffer[39:32] <= 8'b01100000;
					mem_buffer[47:40] <= 8'b01100000;
					mem_buffer[55:48] <= 8'b01100000;
					mem_buffer[63:56] <= 8'b01100000;
					end
			6'h10: begin //G
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01100000;
					mem_buffer[23:16] <= 8'b01100000;
					mem_buffer[31:24] <= 8'b01101110;
					mem_buffer[39:32] <= 8'b01100110;
					mem_buffer[47:40] <= 8'b01100110;
					mem_buffer[55:48] <= 8'b01100110;
					mem_buffer[63:56] <= 8'b00111100;
					end
			6'h11: begin //H
					mem_buffer[7:0] <=   8'b01100110;
					mem_buffer[15:8] <=  8'b01100110;
					mem_buffer[23:16] <= 8'b01100110;
					mem_buffer[31:24] <= 8'b01111110;
					mem_buffer[39:32] <= 8'b01100110;
					mem_buffer[47:40] <= 8'b01100110;
					mem_buffer[55:48] <= 8'b01100110;
					mem_buffer[63:56] <= 8'b01100110;
					end
			6'h12: begin //I
					mem_buffer[7:0] <=   8'b01111110;
					mem_buffer[15:8] <=  8'b00011000;
					mem_buffer[23:16] <= 8'b00011000;
					mem_buffer[31:24] <= 8'b00011000;
					mem_buffer[39:32] <= 8'b00011000;
					mem_buffer[47:40] <= 8'b00011000;
					mem_buffer[55:48] <= 8'b00011000;
					mem_buffer[63:56] <= 8'b01111110;
					end
			6'h13: begin //J
					mem_buffer[7:0] <=   8'b01111110;
					mem_buffer[15:8] <=  8'b00000110;
					mem_buffer[23:16] <= 8'b00000110;
					mem_buffer[31:24] <= 8'b00000110;
					mem_buffer[39:32] <= 8'b00000110;
					mem_buffer[47:40] <= 8'b00000110;
					mem_buffer[55:48] <= 8'b01100110;
					mem_buffer[63:56] <= 8'b00111100;
					end
			6'h14: begin //K
					mem_buffer[7:0] <=   8'b01100110;
					mem_buffer[15:8] <=  8'b01100110;
					mem_buffer[23:16] <= 8'b01101100;
					mem_buffer[31:24] <= 8'b01110000;
					mem_buffer[39:32] <= 8'b01110000;
					mem_buffer[47:40] <= 8'b01101100;
					mem_buffer[55:48] <= 8'b01100110;
					mem_buffer[63:56] <= 8'b01100110;
					end
			6'h15: begin //I
					mem_buffer[7:0] <=   8'b01100000;
					mem_buffer[15:8] <=  8'b01100000;
					mem_buffer[23:16] <= 8'b01100000;
					mem_buffer[31:24] <= 8'b01100000;
					mem_buffer[39:32] <= 8'b01100000;
					mem_buffer[47:40] <= 8'b01100000;
					mem_buffer[55:48] <= 8'b01100000;
					mem_buffer[63:56] <= 8'b01111110;
					end
			6'h16: begin //M
					mem_buffer[7:0] <=   8'b01000010;
					mem_buffer[15:8] <=  8'b01100110;
					mem_buffer[23:16] <= 8'b01011010;
					mem_buffer[31:24] <= 8'b01011010;
					mem_buffer[39:32] <= 8'b01000010;
					mem_buffer[47:40] <= 8'b01000010;
					mem_buffer[55:48] <= 8'b01000010;
					mem_buffer[63:56] <= 8'b01000010;
					end
			6'h17: begin //N
					mem_buffer[7:0] <=   8'b01000010;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01100010;
					mem_buffer[31:24] <= 8'b01010010;
					mem_buffer[39:32] <= 8'b01001010;
					mem_buffer[47:40] <= 8'b01000110;
					mem_buffer[55:48] <= 8'b01000010;
					mem_buffer[63:56] <= 8'b01000010;
					end
			6'h18: begin //O
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b01000010;
					mem_buffer[39:32] <= 8'b01000010;
					mem_buffer[47:40] <= 8'b01000010;
					mem_buffer[55:48] <= 8'b01000010;
					mem_buffer[63:56] <= 8'b00111100;
					end
			6'h19: begin //P
					mem_buffer[7:0] <=   8'b01111100;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b01000010;
					mem_buffer[39:32] <= 8'b01111100;
					mem_buffer[47:40] <= 8'b01100000;
					mem_buffer[55:48] <= 8'b01100000;
					mem_buffer[63:56] <= 8'b01100000;
					end
			6'h1A: begin //Q
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b01000010;
					mem_buffer[39:32] <= 8'b01000010;
					mem_buffer[47:40] <= 8'b01000010;
					mem_buffer[55:48] <= 8'b01000100;
					mem_buffer[63:56] <= 8'b00111010;
					end
			6'h1B: begin //R
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b01000010;
					mem_buffer[39:32] <= 8'b01111100;
					mem_buffer[47:40] <= 8'b01011000;
					mem_buffer[55:48] <= 8'b01001100;
					mem_buffer[63:56] <= 8'b01000110;
					end
			6'h1C: begin //S
					mem_buffer[7:0] <=   8'b00111100;
					mem_buffer[15:8] <=  8'b01000000;
					mem_buffer[23:16] <= 8'b01000000;
					mem_buffer[31:24] <= 8'b00111100;
					mem_buffer[39:32] <= 8'b00000010;
					mem_buffer[47:40] <= 8'b00000010;
					mem_buffer[55:48] <= 8'b00000010;
					mem_buffer[63:56] <= 8'b00111100;
					end
			6'h1D: begin //T
					mem_buffer[7:0] <=   8'b01111110;
					mem_buffer[15:8] <=  8'b00011000;
					mem_buffer[23:16] <= 8'b00011000;
					mem_buffer[31:24] <= 8'b00011000;
					mem_buffer[39:32] <= 8'b00011000;
					mem_buffer[47:40] <= 8'b00011000;
					mem_buffer[55:48] <= 8'b00011000;
					mem_buffer[63:56] <= 8'b00011000;
					end
			6'h1E: begin //U
					mem_buffer[7:0] <=   8'b01000010;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b01000010;
					mem_buffer[39:32] <= 8'b01000010;
					mem_buffer[47:40] <= 8'b01000010;
					mem_buffer[55:48] <= 8'b01000010;
					mem_buffer[63:56] <= 8'b00111100;
					end
			6'h1F: begin //V
					mem_buffer[7:0] <=   8'b01000010;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b01000010;
					mem_buffer[39:32] <= 8'b01000010;
					mem_buffer[47:40] <= 8'b01000010;
					mem_buffer[55:48] <= 8'b00100100;
					mem_buffer[63:56] <= 8'b00011000;
					end
			6'h20: begin //W
					mem_buffer[7:0] <=   8'b01000010;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b01000010;
					mem_buffer[39:32] <= 8'b01011010;
					mem_buffer[47:40] <= 8'b01011010;
					mem_buffer[55:48] <= 8'b01100110;
					mem_buffer[63:56] <= 8'b01000010;
					end
			6'h21: begin //X
					mem_buffer[7:0] <=   8'b01000010;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b00100100;
					mem_buffer[31:24] <= 8'b00011000;
					mem_buffer[39:32] <= 8'b00011000;
					mem_buffer[47:40] <= 8'b00100100;
					mem_buffer[55:48] <= 8'b01000010;
					mem_buffer[63:56] <= 8'b01000010;
					end
			6'h22: begin //Y
					mem_buffer[7:0] <=   8'b01000010;
					mem_buffer[15:8] <=  8'b01000010;
					mem_buffer[23:16] <= 8'b01000010;
					mem_buffer[31:24] <= 8'b00100100;
					mem_buffer[39:32] <= 8'b00011000;
					mem_buffer[47:40] <= 8'b00011000;
					mem_buffer[55:48] <= 8'b00011000;
					mem_buffer[63:56] <= 8'b00011000;
					end
			6'h23: begin //Z
					mem_buffer[7:0] <=   8'b01111110;
					mem_buffer[15:8] <=  8'b00000110;
					mem_buffer[23:16] <= 8'b00000110;
					mem_buffer[31:24] <= 8'b00001100;
					mem_buffer[39:32] <= 8'b00110000;
					mem_buffer[47:40] <= 8'b01100000;
					mem_buffer[55:48] <= 8'b01100000;
					mem_buffer[63:56] <= 8'b01111110;
					end
			6'h24: begin //space
					mem_buffer[7:0] <=   8'b00000000;
					mem_buffer[15:8] <=  8'b00000000;
					mem_buffer[23:16] <= 8'b00000000;
					mem_buffer[31:24] <= 8'b00000000;
					mem_buffer[39:32] <= 8'b00000000;
					mem_buffer[47:40] <= 8'b00000000;
					mem_buffer[55:48] <= 8'b00000000;
					mem_buffer[63:56] <= 8'b00000000;
					end
			6'h25: begin //Filled
					mem_buffer[7:0] <=   8'b11111111;
					mem_buffer[15:8] <=  8'b11111111;
					mem_buffer[23:16] <= 8'b11111111;
					mem_buffer[31:24] <= 8'b11111111;
					mem_buffer[39:32] <= 8'b11111111;
					mem_buffer[47:40] <= 8'b11111111;
					mem_buffer[55:48] <= 8'b11111111;
					mem_buffer[63:56] <= 8'b11111111;
					end
			6'h26: begin //-
					mem_buffer[7:0] <=   8'b00000000;
					mem_buffer[15:8] <=  8'b00000000;
					mem_buffer[23:16] <= 8'b00000000;
					mem_buffer[31:24] <= 8'b01111110;
					mem_buffer[39:32] <= 8'b00000000;
					mem_buffer[47:40] <= 8'b00000000;
					mem_buffer[55:48] <= 8'b00000000;
					mem_buffer[63:56] <= 8'b00000000;
					end
			6'h27: begin //:
					mem_buffer[7:0] <=   8'b00000000;
					mem_buffer[15:8] <=  8'b00011000;
					mem_buffer[23:16] <= 8'b00011000;
					mem_buffer[31:24] <= 8'b00000000;
					mem_buffer[39:32] <= 8'b00000000;
					mem_buffer[47:40] <= 8'b00011000;
					mem_buffer[55:48] <= 8'b00011000;
					mem_buffer[63:56] <= 8'b00000000;
					end
			6'h28: begin //.
					mem_buffer[7:0] <=   8'b00000000;
					mem_buffer[15:8] <=  8'b00000000;
					mem_buffer[23:16] <= 8'b00000000;
					mem_buffer[31:24] <= 8'b00000000;
					mem_buffer[39:32] <= 8'b00000000;
					mem_buffer[47:40] <= 8'b00000000;
					mem_buffer[55:48] <= 8'b11000000;
					mem_buffer[63:56] <= 8'b11000000;
					end
			default: mem_buffer <= 63'h0000000000000000;
		endcase
	endtask
endmodule