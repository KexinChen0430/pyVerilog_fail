module v_jtag (
	       input wire clk_i,
	       output wire tms_o,
               output wire tck_o,
	       output wire trst_o,
	       output wire tdi_o,
               input wire  tdo_i,
	       input wire tdo_oe_i
	       );
        reg [4:0]          memory;
        reg [3:0]          in_word_r;
        reg [5:0]          clk_count;
`ifdef JTAG_INPUT_FILE
	reg [8:0] 	   c;
	integer 	   t;
        integer            fd_in;
        integer            fd_out;
        integer            read_count;
`endif
        // Handle commands from the upper level
        initial begin
	        in_word_r  = 5'b0;
	        memory     = 5'b0;
`ifndef JTAG_INPUT_FILE
	        $jp_init(`JP_PORT);
`else
                fd_in  = $fopen(`JTAG_INPUT_FILE, "r");
                if (fd_in == 0)
                        $display ("JTAG: stimulus file wasn't found");
                fd_out  = $fopen(`JTAG_OUTPUT_FILE, "w");
`endif
	        #5500;  // Wait until reset is complete
	        while(1) begin
	                #1;
`ifndef JTAG_INPUT_FILE
	                $jp_in(memory);  // This will not change memory if no command has been sent from jp
`else
			memory[4] = 1;
			if (fd_in)
				read_count  = $fscanf (fd_in, "%b", memory[3:0]);
                        if (!read_count) begin
				c      = $fgetc(fd_in);
                                if (c == "\#") begin
					// Comment
                                        while ($fgetc(fd_in) != "\n")
                                                #0;
                                end
				else if (c  == "\S") begin
					// Sleep
					read_count  = $fscanf (fd_in, "%b", t);
					while(t) begin
						t  = t - 1;
						#1;
					end
				end
			end // if (!read_count)
			#100; // jtag is supposed to be much slower then the cpu
`endif
	                if(memory[4]) begin
		                in_word_r = memory[3:0];
		                memory = memory & 4'b1111;
		                clk_count = 6'b000000;  // Reset the timeout clock in case jp wants to wait for a timeout / half TCK period
	                end
	        end
        end
        // Send the output bit to the upper layer
`ifndef JTAG_INPUT_FILE
        always @ (tdo_i)
	        $jp_out(tdo_i);
`else
        always @ (posedge tck_o)
		if (tdo_oe_i)
			$fwrite(fd_out, "%b", tdo_i);
`endif
        assign tck_o  = in_word_r[0];
        assign trst_o = in_word_r[1];
        assign tdi_o  = in_word_r[2];
        assign tms_o  = in_word_r[3];
        // Send timeouts / wait periods to the upper layer
        always @ (posedge clk_i) begin
	        if(clk_count < `TIMEOUT_COUNT) clk_count[5:0] = clk_count[5:0] + 1;
	        else if(clk_count == `TIMEOUT_COUNT) begin //
`ifndef JTAG_INPUT_FILE
	                $jp_wait_time();                   //
`endif
	                clk_count[5:0] = clk_count[5:0] + 1;
	        end  //
	        // else it's already timed out, don't do anything
        end
endmodule