module body
	always @(posedge clk)
	  if(ena & deni)
	    begin
	        size <= #1 sizei;
	        rlen <= #1 rleni;
	        amp  <= #1 ampi;
	    end
	always @(posedge clk)
	  if(ena)
	    begin
	        sizeo <= #1 size;
	        rleno <= #1 rlen;
	        ampo  <= #1 amp;
	        dc    <= #1 dci;
	        dco   <= #1 dc;
	    end
	assign zerobl = &rleni &  ~|sizei & deni;
	assign eob    = ~|{rleni, sizei} & deni & ~dci;
	always @(posedge clk or negedge rst)
	  if (!rst)
	     begin
	         state <= #1 1'b0;
	         den   <= #1 1'b0;
	         deno  <= #1 1'b0;
	     end
	  else
	    if(ena)
	      case (state) // synopsys full_case parallel_case
	         1'b0:
	             begin
	                 if (zerobl)
	                    begin
	                        state <= #1 1'b1; // go to zero-detection state
	                        den   <= #1 1'b0; // do not yet set data output enable
	                        deno  <= #1 den;  // output previous data
	                    end
	                 else
	                    begin
	                        state <= #1 1'b0; // stay in 'normal' state
	                        den   <= #1 deni; // set data output enable
	                        deno  <= #1 den;  // output previous data
	                    end
	             end
	         1'b1:
	             begin
	                 deno <= #1 1'b0;
	                 if (deni)
	                    if (zerobl)
	                       begin
	                           state <= #1 1'b1; // stay in zero-detection state
	                           den   <= #1 1'b0; // hold current zer-block
	                           deno  <= #1 1'b1; // output previous zero-block
	                       end
	                    else if (eob)
	                       begin
	                           state <= #1 1'b0; // go to 'normal' state
	                           den   <= #1 1'b1; // set output enable for EOB
	                           deno  <= #1 1'b0; // (was already zero), maybe optimize ??
	                       end
	                    else
	                       begin
	                           state <= #1 1'b0; // go to normal state
	                           den   <= #1 1'b1; // set data output enable
	                           deno  <= #1 1'b1; // oops, zero-block should have been output
	                       end
	             end
	      endcase
endmodule