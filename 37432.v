module vlog_tap_generator
  #(parameter TAPFILE          = "",
    parameter NUM_TESTS        = 0,
    parameter MAX_STRING_LEN   = 80,
    parameter MAX_FILENAME_LEN = 1024);
   integer f; //File handle
   integer cur_tc = 0; //Current testcase index
   integer numtests = NUM_TESTS; //Total number of testcases
   reg [MAX_FILENAME_LEN*8-1:0] tapfile; //TAP file to write
   initial begin
      //Grab CLI parameters and use parameters for default values
      if(!$value$plusargs("tapfile=%s", tapfile))
	tapfile = TAPFILE;
   end
   task set_file;
      input [MAX_FILENAME_LEN*8-1:0] f;
      begin
	 if (cur_tc)
	   $display("Error: Can't change file. Already started writing to %0s", tapfile);
	 else
	   tapfile = f;
      end
   endtask
   task set_numtests;
      input integer i;
      begin
	 if (cur_tc)
	   $display("Error: Can't change number of tests. Already started writing to %0s", tapfile);
	 else
	   numtests = i;
      end
   endtask
   task write_tc;
      input [MAX_STRING_LEN*8-1:0] description;
      input 			   ok_i;
      begin
	 if (f === 32'dx) begin
	    if(tapfile == 0)
	      $display("No TAP file specified");
	    else if (numtests == 0)
	      $display("Number of tests must be specified");
	    else begin
	       f = $fopen(tapfile,"w");
	       $fwrite(f, "1..%0d\n", numtests);
	    end
	 end
	 if (f) begin
	    cur_tc=cur_tc+1;
	    if (!ok_i)
	      $fwrite(f, "not ");
	    $fwrite(f, "ok %0d - %0s\n", cur_tc, description);
	 end
      end
   endtask
   task ok;
      input [MAX_STRING_LEN*8-1:0] description;
      begin
	 write_tc(description, 1);
      end
   endtask
   task nok;
      input [MAX_STRING_LEN*8-1:0] description;
      begin
	 write_tc(description, 0);
      end
   endtask
endmodule