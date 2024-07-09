module dbg_comm_vpi (
		       SYS_CLK,
		       P_TMS,
		       P_TCK,
		       P_TRST,
		       P_TDI,
		       P_TDO
		       );
   //parameter Tp = 20;
   input     SYS_CLK;
   output    P_TMS;
   output    P_TCK;
   output    P_TRST;
   output    P_TDI;
   input     P_TDO;
   reg [4:0] memory;  // [0:0];
   wire      P_TCK;
   wire      P_TRST;
   wire      P_TDI;
   wire      P_TMS;
   wire      P_TDO;
   reg [3:0] in_word_r;
   reg [5:0] clk_count;
   // Handle commands from the upper level
   initial
     begin
	in_word_r = 5'b0;
	memory = 5'b0;
	$jp_init(`JP_PORT);
	#5500;  // Wait until reset is complete
	while(1)
	  begin
	     #1;
	     $jp_in(memory);  // This will not change memory[][] if no command has been sent from jp
	     if(memory[4])  // was memory[0][4]
	       begin
		  in_word_r = memory[3:0];
		  memory = memory & 4'b1111;
		  clk_count = 6'b000000;  // Reset the timeout clock in case jp wants to wait for a timeout / half TCK period
	       end
	  end
     end
   // Send the output bit to the upper layer
   always @ (P_TDO)
     begin
	$jp_out(P_TDO);
     end
   assign P_TCK  = in_word_r[0];
   assign P_TRST = in_word_r[1];
   assign P_TDI  = in_word_r[2];
   assign P_TMS  = in_word_r[3];
   // Send timeouts / wait periods to the upper layer
   always @ (posedge SYS_CLK)
     begin
	if(clk_count < `TIMEOUT_COUNT) clk_count[5:0] = clk_count[5:0] + 1;
	else if(clk_count == `TIMEOUT_COUNT) begin
	   $jp_wait_time();
	   clk_count[5:0] = clk_count[5:0] + 1;
	end
	// else it's already timed out, don't do anything
     end
endmodule