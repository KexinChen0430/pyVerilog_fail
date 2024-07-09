module control
    reg enable    = 0;
    reg debug     = 0;
    reg throttle  = 0;
    reg [31:0] throttlewidth = 10;
    reg [31:0] throttlewait  = 5;
    reg [50*8:0] file_name   = "./stimuli/stimuli_1.txt";
    // container for file read data
    reg [63:0] file_data;
    // containers for pixel components
    integer compA;
    integer compB;
    integer compC;
    integer compD;
    // containers for header data
    integer header_mode;
    integer header_frames;
    integer header_field;
    integer header_rows;
    integer header_cols;
    integer header_bpp;
    // variables for file handle operations
    integer file_handler;
    integer file_eof;
    integer isim_eof;
    // variables for flow control
    integer timeout_ctr;
    integer timeout;
    integer pixel_count =0;
    integer line_count  =0;
    integer frame_count =0;
    integer eol_count   =0;
    integer sof_count   =0;
    reg     eol_on      =0;
    reg     sof_on      =0;
    integer throttle_data_cnt;
    integer throttle_wait_cnt;
    integer sof_phase = 0;
    integer eol_phase = 0;
    reg fetch_new_data;
    reg pending_tx;
    reg tvalid_state;
    integer remove_count=0;
    reg ramp_gen  = 0;
    integer ramp_rows   = 128;
    integer ramp_cols   = 128;
    integer ramp_frames = 1;
    reg skip_sof = 0;
    //events
    event aclk_rise;
    event aclk_fall;
    event aresetn_rise;
    event aresetn_fall;
    always @(posedge aclk) if(aclken)    -> aclk_rise;
    always @(negedge aclk) if(aclken)    -> aclk_fall;
    always @(posedge aresetn) -> aresetn_rise;
    always @(negedge aresetn) -> aresetn_fall;
    initial
    begin
	if((drive_edge != "rise")&&(drive_edge != "fall"))
	begin
	    $display("@%10t : [%s] \"%s\" is not a valid drive_edge parameter value ...", $time, module_id, drive_edge);
	    $finish;
	end
	init;
    end
  //=============//
  // USER TASKS  //
  //=============//
    task init;
    begin
        tdata_d0             = 0;
	tvalid_d0            = 0;
	sof_d0              = 0;
	eol_d0               = 0;
	tstrb_d0             = 1;
	tkeep_d0             = 1;
	tdest_d0             = 0;
	tid_d0               = 0;
	EOF               = 0;
	throttle_data_cnt = throttlewidth;
	throttle_wait_cnt = throttlewait;
	file_data         = 0;
	enable    = 0;
	debug     = 0;
	throttle  = 0;
	eol_phase = 0;
	sof_phase = 0;
	timeout_ctr    = 0;
//	timeout        = 10000;
    end
    endtask
    task set_timeout;
      input integer timeout_in;
      begin
        timeout = timeout_in;
      end
    endtask
    task use_file;
    input [50*8:0] filenum;
    begin
      ramp_gen  = 0;
      file_name = filenum;
      $display("@%10t : [%s] attaching %s ...", $time, module_id, file_name);
    end
    endtask
    task is_ramp_gen;
    input integer ramp_row_v;
    input integer ramp_col_v;
    input integer ramp_frame_v;
    begin
        ramp_rows   = ramp_row_v;
	ramp_cols   = ramp_col_v;
	ramp_frames = ramp_frame_v;
	ramp_gen    = 1;
    end
    endtask
    task skip_sof_on;
	begin
	    skip_sof =1;
	end
    endtask
    task skip_sof_off;
	begin
	    skip_sof =0;
	end
    endtask
    task start;
    begin
        EOF            = 0;
        tvalid_d0      = 0;
        pixel_count    = 0;
	line_count     = 0;
	frame_count    = 0;
	eol_count      = 0;
	sof_count      = 0;
	eol_on         = 0;
	sof_on         = 0;
	fetch_new_data = 1;
	pending_tx     = 0;
	isim_eof       = 0;
	timeout_ctr    = 0;
	if(!ramp_gen)
	begin
        file_handler   = $fopen(file_name, "r");
        if (file_handler == 0)
        begin
            $display("ERROR : %s cannot be opened.... Simulation Stopped", file_name);
            $finish;
        end
	    //GET THE MODE
            file_eof = $fscanf(file_handler,"%s",file_data);
            file_eof = $fscanf(file_handler,"%d",file_data);
            header_mode    =  file_data;
            //GET THE NUMBER OF FRAMES
            file_eof = $fscanf(file_handler,"%s",file_data);
            file_eof = $fscanf(file_handler,"%d",file_data);
            header_frames =  file_data;
            //GET THE FIELD THAT COMES FIRST
            file_eof = $fscanf(file_handler,"%s",file_data);
            file_eof = $fscanf(file_handler,"%d",file_data);
            header_field =  file_data;
            //GET THE NUMBER OF ROWS
            file_eof = $fscanf(file_handler,"%s",file_data);
            file_eof = $fscanf(file_handler,"%d",file_data);
            header_rows    =  file_data;
            //GET THE NUMBER OF COLUMNS
            file_eof = $fscanf(file_handler,"%s",file_data);
            file_eof = $fscanf(file_handler,"%d",file_data);
            header_cols =  file_data;
            //GET THE NUMBER OF BITS
            file_eof = $fscanf(file_handler,"%s",file_data);
            file_eof = $fscanf(file_handler,"%d",file_data);
            header_bpp =  file_data;
	end
	else
	begin
	    header_mode   = 0;
	    header_frames = ramp_frames;
	    header_field  = 0;
	    header_rows   = ramp_rows;
	    header_cols   = ramp_cols;
	end
        enable = 1;
        $display("@%10t : [%s] STARTED", $time, module_id);
    end
    endtask
    task stop;
    begin
	if(!ramp_gen)
	begin
          if(pixel_count > 0)
          begin
              $fclose(file_handler);
              pixel_count = 0;
          end
        end
        enable = 0;
	$display("@%10t : [%s] STOPPED", $time, module_id);
        EOF = 0;
    end
    endtask
    task pause;
    begin
	tvalid_state = tvalid_d0;
        enable = 0;
	tvalid_d0 = 0;
	tvalid    = 0;
	if(debug) $display("@%10t : [%s] PAUSED TX", $time, module_id);
    end
    endtask
    task resume;
    begin
	tvalid    = tvalid_state;
	tvalid_d0 = tvalid_state;
        enable = 1;
	if(debug) $display("@%10t : [%s] RESUME TX", $time, module_id);
    end
    endtask
    function integer poll_line_num;
    input [31:0] a;
    begin
	if(a==0) poll_line_num = (((pixel_count)/header_cols) + 1);
	else if(a == ((pixel_count)/header_cols) + 1) poll_line_num = 1;
	else poll_line_num = 0;
    end
    endfunction
    function integer poll_frame_num;
    input [31:0] a;
    begin
	if(a==0) poll_frame_num = (((pixel_count)/(header_cols*header_rows)) + 1);
	else if(a == ((pixel_count)/(header_cols*header_rows) + 1)) poll_frame_num = 1;
	else poll_frame_num = 0;
    end
    endfunction
    task debug_on;
    begin
	$display("@%10t : [%s] Debug Messages ON", $time, module_id);
	debug = 1;
    end
    endtask
    task debug_off;
    begin
	$display("@%10t : [%s] Debug Messages OFF", $time, module_id);
        debug = 0;
    end
    endtask
    task throttle_on;
    begin
	if(debug)
	begin
             $display("@%10t : [%s] Data Throttle Turned ON", $time, module_id);
	end
	throttle = 1;
	throttle_data_cnt = throttlewidth;
	throttle_wait_cnt = throttlewait;
    end
    endtask
    task throttle_off;
    begin
	if(debug)
	begin
             $display("@%10t : [%s] Data Throttle Turned OFF", $time, module_id);
	end
	throttle = 0;
    end
    endtask
    task set_throttle_valid;
    input [31:0] width;
    begin
	if(debug)
	begin
	    $display("@%10t : [%s] Data Throttle Width set to %d", $time, module_id, width);
	end
	throttlewidth  = width;
	throttle_data_cnt = width;
    end
    endtask
    task set_throttle_wait;
    input [31:0] width;
    begin
	if(debug)
	begin
	    $display("@%10t : [%s] Data Throttle Wait  set to %d", $time, module_id, width);
	end
	throttlewait  = width;
	throttle_wait_cnt = width;
    end
    endtask
    task set_sof_phase;
    input integer switch;
    begin
        if(switch < 0)
	begin
            sof_phase = 0;
	    $display("@%10t : [%s] (%d) Negative SOF Phase not supported. SOF Phase will be set to 0", $time, module_id, switch);
	end
	else
	    sof_phase = switch;
	if(debug)
	begin
	    $display("@%10t : [%s] SOF Phase set to %d", $time, module_id, sof_phase);
        end
    end
    endtask
    task set_eol_phase;
    input integer switch;
    begin
	if(debug)
	begin
	    $display("@%10t : [%s] EOL Phase set to %d", $time, module_id, switch);
	end
        eol_phase = switch;
    end
    endtask
  //=================//
  // INTERNAL TASKS  //
  //=================//
    task drive_output;
    integer cntr;
    begin
	if(drive_edge == "fall") @aclk_fall;
        tdata_d0   <= file_data;
        tvalid_d0  <= 1;
	// SOF GENERATION
        if(sof_count > 0)
	    sof_count <= sof_count - 1;
        if((sof_on)&&(!skip_sof))
	    sof_d0<= 1;
	else
	    sof_d0<= 0;
        // EOL GENERATION
	if(eol_on)
	    eol_d0 <= 1;
	else
	    eol_d0 <= 0;
	if(debug)
	begin
	    $display("@%10t : [%s] Tx Data = %8h",  $time, module_id, file_data);
	end
    end
    endtask
    task undrive_output;
    begin
	if(drive_edge == "fall") @aclk_fall;
        tvalid_d0 <= 0;
        sof_d0   <= 0;
        eol_d0    <= 0;
    end
    endtask
    task fetch_data;
    begin
      if(!ramp_gen)
      begin
          file_data = 0;
      end
      // FOR SOF PHASE ALIGNMENT
      if((sof_phase > 0) && (pixel_count%(header_cols*header_rows) == 0) && (sof_count==0))
	   sof_count = sof_phase + 1;
      if(pixel_count%(header_cols*header_rows) == 0)
      begin
	  if((sof_phase == 0)||((sof_count == 1)&&(sof_phase >0)))
	  begin
	      sof_on = 1;
	      sof_count = 0;
	  end
	  else
	      sof_on = 0;
      end
      else
	  sof_on = 0;
      // FOR EOL PHASE ALIGNMENT
      if(((eol_phase == 0) && ((pixel_count+1)%header_cols == 0)) ||
         ((eol_phase < 0) && ((pixel_count+1)%header_cols == header_cols+eol_phase)))
	  eol_on = 1;
      if(((eol_phase == 0) && ((pixel_count+1)%header_cols != 0)) ||
         ((eol_phase < 0) && ((pixel_count+1)%header_cols != header_cols+eol_phase)))
	  eol_on = 0;
      if((eol_phase > 0) && ((pixel_count+1)%header_cols == 1) && (pixel_count >= header_cols))
      begin
          eol_count = eol_phase;
      end
      if(eol_count > 0)
      begin
          if(eol_count == 1)
	      eol_on = 1;
	  else
	      eol_on = 0;
	  eol_count = eol_count-1;
          if(debug) $display("@%10t : [%s] Padding extra pixel for late eol ", $time, module_id);
      end
      else
      begin
	if((eol_phase < 0) && ((pixel_count+1)%header_cols == header_cols+eol_phase)) remove_count =eol_phase;
	else remove_count = 0;
        for(remove_count=remove_count; (remove_count<=0)&&(sof_count==0); remove_count=remove_count+1)
        begin
	if(!ramp_gen)
	begin
        file_data = 0;
        case(header_mode)
        0,4,11,100,104,111 : begin
            file_eof = $fscanf(file_handler,"%d", compA); //Mono
	    if(compA == 16777215) compA = 0;              //Don't Care place holder 16777215.
            isim_eof = $feof(file_handler);
	    if((header_mode == 4)||(header_mode == 11)||(header_mode == 104)||(header_mode == 111))
	    begin
               file_eof = $fscanf(file_handler,"%d", compB); //alpha or motion
	       if(compB == 16777215) compB = 0;              //Don't Care place holder 16777215.
	       isim_eof = $feof(file_handler);
	       file_data = compB;
	       file_data = file_data << header_bpp;
	    end
	    file_data = file_data + compA;
           end
	 8,9,10,108,109,110 : begin
            file_eof = $fscanf(file_handler,"%d", compA); //R
	    file_eof = $fscanf(file_handler,"%d", compB); //G
	    file_eof = $fscanf(file_handler,"%d", compC); //B
	    if(compA == 16777215) compA = 0;              //Don't Care place holder 16777215.
	    if(compB == 16777215) compB = 0;              //Don't Care place holder 16777215.
	    if(compC == 16777215) compC = 0;              //Don't Care place holder 16777215.
	    isim_eof = $feof(file_handler);
	    if((header_mode == 9)||(header_mode == 10)||(header_mode == 109)||(header_mode == 110))
	    begin
	      file_eof = $fscanf(file_handler,"%d", compD); //alpha or motion
	      if(compD == 16777215) compD = 0;              //Don't Care place holder 16777215.
	      isim_eof = $feof(file_handler);
	      file_data = compD;
	      file_data = file_data << header_bpp;
	    end
	    file_data = file_data + compA;
	    file_data = file_data << header_bpp;
	    file_data = file_data + compC;
	    file_data = file_data << header_bpp;
	    file_data = file_data + compB;
	 end
	 3,7,103,107 : begin
            file_eof = $fscanf(file_handler,"%d", compA); //Y
	    file_eof = $fscanf(file_handler,"%d", compB); //Cb
	    file_eof = $fscanf(file_handler,"%d", compC); //Cr
	    if(compA == 16777215) compA = 0;              //Don't Care place holder 16777215.
	    if(compB == 16777215) compB = 0;              //Don't Care place holder 16777215.
	    if(compC == 16777215) compC = 0;              //Don't Care place holder 16777215.
	    isim_eof = $feof(file_handler);
	    if((header_mode == 7)||(header_mode == 107))
	    begin
	      file_eof = $fscanf(file_handler,"%d", compD); //alpha or motion
	      if(compD == 16777215) compD = 0;              //Don't Care place holder 16777215.
	      isim_eof = $feof(file_handler);
	      file_data = compD;
	      file_data = file_data << header_bpp;
	    end
	    file_data = file_data + compC;
	    file_data = file_data << header_bpp;
	    file_data = file_data + compB;
	    file_data = file_data << header_bpp;
	    file_data = file_data + compA;
	 end
	 1,2,5,6,101,102,105,106 : begin
            file_eof = $fscanf(file_handler,"%d", compA); //Y
            file_eof = $fscanf(file_handler,"%d", compB); //Cr or Cb
	    if(compA == 16777215) compA = 0;              //Don't Care place holder 16777215.
	    if(compB == 16777215) compB = 0;              //Don't Care place holder 16777215.
            isim_eof = $feof(file_handler);
	    if((header_mode == 5)||(header_mode == 6)||(header_mode == 105)||(header_mode == 106))
	    begin
	      file_eof = $fscanf(file_handler,"%d", compC); //alpha or motion
	      if(compC == 16777215) compC = 0;              //Don't Care place holder 16777215.
	      isim_eof = $feof(file_handler);
	      file_data = compC;
	      file_data = file_data << header_bpp;
	    end
	    file_data = file_data + compB;
	    file_data = file_data << header_bpp;
	    file_data = file_data + compA;
	 end
        default : begin
                $display("@%10t : [%s] MODE is UNKNOWN... Data set to 0x0", $time, module_id);
        end
        endcase
        end
	else
	begin
	    file_data = file_data+1;
	    if(frame_count > ramp_frames) isim_eof = 1;
	end
        pixel_count = pixel_count+1;
        line_count  = pixel_count/header_cols + 1;
        frame_count = pixel_count/(header_cols*header_rows) + 1;
        end
      end
    end
    endtask
  //================//
  // RESET FUNCTION //
  //================//
    always @(negedge aresetn)
    begin
      //aresetn assertion//
      if(debug == 1)
      begin
	  $display("@%10t : [%s] RESET asserted...", $time, module_id);
      end
      EOF   <= 0;
      tdata_d0 <= 0;
      undrive_output;
      if(pixel_count > 0)
      begin
          $fclose(file_handler);
          pixel_count = 0;
      end
      enable      = 0;
      timeout_ctr = 0;
      @aresetn_rise;
      if(debug == 1)
      begin
	  $display("@%10t : [%s] RESET deasserted...", $time, module_id);
      end
    end
  //==============================================//
  // MAIN FUNCTION                                //
  //==============================================//
  //NOTE: sampling is always @rising edge of aclk //
  //     drive edge depends on drive_edge setting //
  //==============================================//
    always @(aclk_rise)
    begin
      //normal operation//
      if ((EOF === 1'h0)&&(enable))
      begin
        if(pending_tx == 1)
	begin
	    if(tready == 1)
	    begin
		pending_tx  = 0;
		timeout_ctr <= 0;
	    end
	    else
	    begin
		if(timeout_ctr > timeout)
	        begin
		    $display("@%10t : [%s] TIMEOUT ERROR : TREADY has not asserted for %d cycles .. Terminating the test....", $time, module_id, timeout);
		    $finish;
		end
		else  timeout_ctr <= timeout_ctr + 1;
	    end
	end
	if(pending_tx == 0)
	begin
	    if(fetch_new_data == 1)
	    begin
	        fetch_data;
	    end
            if(isim_eof == 0)
            begin
	        if((throttle==1)&&(throttle_wait_cnt > 0)&&(throttle_data_cnt==0))
	        begin
		    throttle_wait_cnt <= throttle_wait_cnt - 1;
		    fetch_new_data    <= 0;
		    undrive_output;
		end
		else
		begin
		    pending_tx     <= 1;
		    fetch_new_data <= 1;
	    	    drive_output;
		    if(throttle == 1)
		    begin
		      if((throttle_data_cnt == 0)&&(throttle_wait_cnt == 0))
		      begin
			  throttle_data_cnt <= throttlewidth - 1;
			  throttle_wait_cnt <= throttlewait;
		      end
		      else
		      begin
			  throttle_data_cnt <= throttle_data_cnt - 1;
		      end
		    end
		end
	    end
            else // if(isim_eof == 1)
            begin
		if(!ramp_gen)
		begin
                $fclose(file_handler);
                $display("@%10t : [%s] TOTAL PIXELS TRANSMITTED = %8d", $time, module_id, pixel_count-1);
                $display("@%10t : [%s] DATA TX FINISHED", $time, module_id);
		if((pixel_count-1)!=(header_cols*header_rows*header_frames))
		    $display("@%10t : [%s] WARNING : TOTAL PIXELS TRANSMITTED DO NOT MATCH FILE HEADER", $time, module_id);
	        end
                pixel_count <= 0;
		pending_tx  <= 0;
                enable      <= 0;
                EOF         <= 1;
		undrive_output;
            end
	end
      end
      else tvalid_d0 <= 0;
    end
  endmodule