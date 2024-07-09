module timing_gen
  	#(
		parameter module_id = "Video Timing Generator"
	)
	(
		input clk_in,
		input sclr_in,
		input ce_in,
		input [31:0] field_in,
		input [31:0] frame_total_in,
		input [31:0] active_rows_in,
		input [31:0] active_cols_in,
		input [31:0] hblank_width_in,
		input [31:0] vblank_width_in,
		input [31:0] hblank_width_max,
		input [31:0] vblank_width_max,
		input [31:0] hblank_width_min,
		input [31:0] vblank_width_min,
		output reg hblank_out,
		output reg vblank_out,
		output reg active_video_out,
		output reg vsync_out,
		output reg hsync_out,
		output reg field_id_out,
		output reg active_chroma_out
	);
	event done;
	// Controls
	integer total_cols;
	integer total_rows;
	integer total_frames;
	integer inactive_left  = `INACTIVE_LEFT;
	integer inactive_right = `INACTIVE_RIGHT;
	integer hblank_width;
	integer vblank_width;
	integer hval  = 0;
	integer vval  = 0;
	integer frame = 0;
	reg enable = 0;
	reg random_blanking = 0; 	// 1'b0   : blanking widths are fixed
	reg ce_in_d;
								// 1'b1   : blanking widths are random bound from *blank_width_min to *blank_width_max
	task start;
	begin
	    total_cols   = active_cols_in;
		total_rows   = active_rows_in;
		total_frames = frame_total_in;
		if(field_in != 0)
		begin
			//total_rows   = total_rows/2;
			total_rows   = total_rows;
			total_frames = total_frames*1; // Fix by Jude
			//total_frames = total_frames*2;
		end
		hblank_width = hblank_width_in;
		vblank_width = vblank_width_in;
		hval 		 = 0;
		vval 		 = 0;
		frame 		 = 0;
		enable 		 = 1;
		$display("@%10t : [%s] STARTED", $time, module_id);
	end
	endtask
	task start_random_blanking;
	begin
	    total_cols   = active_cols_in;
		total_rows   = active_rows_in;
		total_frames = frame_total_in;
		if(field_in != 0)
		begin
			total_rows   = total_rows/2;
			total_frames = total_frames*2;
		end
		hblank_width = ($random % hblank_width_max ) + 1;
		vblank_width = ($random % vblank_width_max ) + 1;
		if (hblank_width < hblank_width_min) hblank_width = hblank_width_min;
		if (vblank_width < vblank_width_min) vblank_width = vblank_width_min;
		$display("@ %10t : TIMING GEN STARTED", $time);
		$display("RANDOMIZED HBLANK WIDTH TO : %d", hblank_width);
		$display("RANDOMIZED VBLANK WIDTH TO : %d", vblank_width);
		hval   = 0;
		vval   = 0;
		frame  = 0;
		enable = 1;
	end
	endtask
	task stop;
	begin
		enable = 0;
	end
	endtask
	//always @ (negedge clk_in)
	//begin
	//	if (sclr_in)
	//		ce_in_d <= 1'b0;
	//	else
	//		ce_in_d <= ce_in;
	//end
	//always @ (posedge clk_in)
	always @ (negedge clk_in)
	begin
		#1;
		if (sclr_in)
		begin
			hval	 			<= 0;
			vval 				<= 0;
			frame 				<= 0;
			enable 				<= 0;
			vblank_out			<= 0;
			hblank_out		        <= 0;
			active_video_out	        <= 0;
			vsync_out			<= 0;
			hsync_out			<= 0;
			field_id_out	        	<= 0;
			active_chroma_out	        <= 0;
		end
		else if (enable && ce_in && (frame < total_frames))
		begin
			if(field_in == 0)
			begin
				field_id_out <= 0;
			end
			else begin
				if((hval == 0)&&(vval == 0))
				begin
					if(frame == 0)
					begin
						if(field_in == 1) field_id_out <= 0;
						if(field_in == 2) field_id_out <= 1;
					end
					else
					begin
						field_id_out <= ~field_id_out;
					end
				end
			end
	            	//Vertical Blanking Period
		    	if (vval < vblank_width)
		    	begin
				active_video_out		<= 0;
				active_chroma_out		<= 0;
				vblank_out			<= 1;
				if (hval < hblank_width)
				begin
					hblank_out		<= 1;
					hval 			<= hval+1;
				end
				else if ((hval >= hblank_width)&&(hval < total_cols + inactive_left + hblank_width + inactive_right - 1))
				begin
					hblank_out				<= 0;
					hval 					<= hval+1;
				end
				else // if (hval >= total_cols + inactive_video + hblank_width)
				begin
					hblank_out				<= 0;
					hval					<= 0;
					vval					<= vval+1;
				end
			end
	     		//Normal line until Last line
			else if (vval >= vblank_width)// && (vval <= (total_rows + vblank_width)))
			begin
				vblank_out				<= 0;
				if (hval < hblank_width)
				begin
					hblank_out			<= 1;
					active_video_out		<= 0;
					active_chroma_out		<= 0;
					hval				<= hval+1;
				end
				else if ((hval >= hblank_width)&&(hval < hblank_width + inactive_left))
				begin
					hblank_out		<= 0;
					active_video_out        <= 0;
					active_chroma_out       <= 0;
					hval <= hval + 1;
				end
				else if ((hval >= hblank_width + inactive_left)&&(hval < (total_cols + hblank_width + inactive_left)))
				begin
					hblank_out		<= 0;
					active_video_out	<= 1;
					if(`ACTIVE_CHROMA_IN_GEN)
					begin
						if((vval % 2)!=0)
						active_chroma_out   <= 1;
						else
						active_chroma_out   <= 0;
					end
					else begin
						active_chroma_out   <= 1;
					end
					hval <= hval+1;
				end
				else if ((hval >= total_cols + hblank_width + inactive_left)&&(hval < total_cols + hblank_width + inactive_left + inactive_right - 1))
				begin
					hblank_out		<= 0;
					active_video_out	<= 0;
					active_chroma_out   	<= 0;
                                        hval <= hval+1;
				end
				else
				begin
					hval			<= 0;
					//if (vval == total_cols + vblank_width)
					if (vval == total_cols +  vblank_width - 1)
					begin
						vval <= 0;
						frame = frame+1;
					end
					else
					begin
						vval <= vval+1;
					end
				end
			end
        end
		else if  ((!enable) || (frame >= total_frames))
		begin
			if (frame >= total_frames)
			begin
				-> done;
				$display("@%10t : [%s] FINISHED", $time, module_id);
			end
			hval	            <= 0;
			vval                <= 0;
			frame 	            <= 0;
			vblank_out	    <= 0;
			hblank_out	    <= 0;
			active_video_out    <= 0;
			active_chroma_out   <= 0;
			vsync_out	    <= 0;
			hsync_out	    <= 0;
			field_id_out	    <= 0;
			active_chroma_out   <= 0;
			enable              <= 0;
		end
    end
endmodule