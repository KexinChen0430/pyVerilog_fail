module LAG_pl_fc_out (flits_valid,
		     channel_cntrl_in,
		     pl_status,          // pl_status[pl]=1 if blocked (fifo is full)
		     // only when using credit-based flow control
		     pl_empty,           // pl_empty[pl]=1 if PL fifo is empty (credits=init_credits)
		     pl_credits,
		     clk, rst_n);
   `include "LAG_functions.v"
   parameter num_pls = 4;
   parameter init_credits = 4;
   parameter optimized_credit_counter = 1;
   // +1 as has to hold 'init_credits' value
   parameter counter_bits = clogb2(init_credits+1);
   input  [num_pls-1:0] flits_valid;
   input  chan_cntrl_t channel_cntrl_in;
   output pl_t pl_status;
   output [num_pls-1:0] pl_empty;
   output [num_pls-1:0][counter_bits-1:0] pl_credits;
   input  clk, rst_n;
   logic [num_pls-1:0][counter_bits-1:0] counter;
   logic [num_pls-1:0] inc, dec;
   // buffer credit and flit pl id.'s so we can move counter in credit counter optimization
   logic [num_pls-1:0] last_flits_valid;
   pl_t last_credits;
   logic [num_pls-1:0][counter_bits-1:0] counter_current;
   logic [num_pls-1:0] 	    pl_empty;
   genvar i;
   // fsm states
   parameter stop=1'b0, go=1'b1;
   logic [num_pls-1:0] current_state, next_state;
   generate
      if (optimized_credit_counter) begin
	 // ***********************************
	 // optimized credit-counter (moves counter logic off critical path)
	 // ***********************************
	 always@(posedge clk) begin
	    last_credits <= channel_cntrl_in.credits;
	    last_flits_valid <= flits_valid;
//	    $display ("empty=%b", pl_empty);
	 end
	 assign pl_credits = counter_current;
	 for (i=0; i<num_pls; i++) begin:perpl1
	    always_comb begin:addsub
	       if (inc[i] && !dec[i])
		  counter_current[i]=counter[i]+1;
	       else if (dec[i] && !inc[i])
		  counter_current[i]=counter[i]-1;
	       else
		 counter_current[i]=counter[i];
	    end
	    always@(posedge clk) begin
	       if (!rst_n) begin
		  counter[i]<=init_credits;
		  pl_empty[i]<='1;
	       end else begin
		  counter[i]<=counter_current[i];
		  if ((counter_current[i]==0) ||
		      ((counter_current[i]==1) && flits_valid[i]) &&
		       !(channel_cntrl_in.credits[i])) begin
		     pl_status[i] <= 1'b1;
		     pl_empty[i] <= 1'b0;
		  end else begin
		     pl_status[i] <= 1'b0;
		     pl_empty[i] <= (counter_current[i]==init_credits);
		  end
	       end // else: !if(!rst_n)
	    end // always@ (posedge clk)
	    assign inc[i] = last_credits[i];
      assign dec[i] = last_flits_valid[i];
	 end
      end else begin
	 assign pl_credits = counter;
	 // ***********************************
	 // unoptimized credit-counter
	 // ***********************************
	 for (i=0; i<num_pls; i++) begin:perpl
	    always@(posedge clk) begin
	       if (!rst_n) begin
		  counter[i]<=init_credits;
	       end else begin
		  if (inc[i] && !dec[i]) begin
		     assert (counter[i]!=init_credits) else $fatal;
		     counter[i]<=counter[i]+1;
		  end
		  if (dec[i] && !inc[i]) begin
		     assert (counter[i]!=0) else $fatal;
		     counter[i]<=counter[i]-1;
		  end
	       end // else: !if(!rst_n)
	    end
	    // received credit for PL i?
	    assign inc[i]= channel_cntrl_in.credits[i];
	    // flit sent, one less credit
	    assign dec[i] = flits_valid[i];
	    // if counter==0, PL is blocked
	    assign pl_status[i]=(counter[i]==0);
	    // if counter==init_credits, PL buffer is empty
	    assign pl_empty[i]=(counter[i]==init_credits);
	 end // block: perpl
      end
      endgenerate
endmodule