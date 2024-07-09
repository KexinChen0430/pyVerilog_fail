module body
	// function declarations
	// Function abs; absolute value
	function [10:0] abs;
	  input [11:0] a;
	begin
	  if (a[11])
	      abs = (~a[10:0]) +11'h1;
	  else
	      abs = a[10:0];
	end
	endfunction
	// Function cat, calculates category for Din
	function [3:0] cat;
	  input [11:0] a;
	  reg   [10:0] tmp;
	begin
	    // get absolute value
	    tmp = abs(a);
	    // determine category
	    casex(tmp) // synopsys full_case parallel_case
	      11'b1??_????_???? : cat = 4'hb; // 1024..2047
	      11'b01?_????_???? : cat = 4'ha; //  512..1023
	      11'b001_????_???? : cat = 4'h9; //  256.. 511
	      11'b000_1???_???? : cat = 4'h8; //  128.. 255
	      11'b000_01??_???? : cat = 4'h7; //   64.. 127
	      11'b000_001?_???? : cat = 4'h6; //   32..  63
	      11'b000_0001_???? : cat = 4'h5; //   16..  31
	      11'b000_0000_1??? : cat = 4'h4; //    8..  15
	      11'b000_0000_01?? : cat = 4'h3; //    4..   7
	      11'b000_0000_001? : cat = 4'h2; //    2..   3
	      11'b000_0000_0001 : cat = 4'h1; //    1
	      11'b000_0000_0000 : cat = 4'h0; //    0 (DC only)
	    endcase
	end
	endfunction
	// Function modamp, calculate additional bits per category
	function [10:0] rem;
	  input [11:0] a;
	  reg   [10:0] tmp, tmp_rem;
	begin
	    tmp_rem = a[11] ? (a[10:0] - 10'h1) : a[10:0];
	    if(0)
	    begin
	      // get absolute value
	      tmp = abs(a);
	      casex(tmp) // synopsys full_case parallel_case
	        11'b1??_????_???? : rem = tmp_rem & 11'b111_1111_1111;
	        11'b01?_????_???? : rem = tmp_rem & 11'b011_1111_1111;
	        11'b001_????_???? : rem = tmp_rem & 11'b001_1111_1111;
	        11'b000_1???_???? : rem = tmp_rem & 11'b000_1111_1111;
	        11'b000_01??_???? : rem = tmp_rem & 11'b000_0111_1111;
	        11'b000_001?_???? : rem = tmp_rem & 11'b000_0011_1111;
	        11'b000_0001_???? : rem = tmp_rem & 11'b000_0001_1111;
	        11'b000_0000_1??? : rem = tmp_rem & 11'b000_0000_1111;
	        11'b000_0000_01?? : rem = tmp_rem & 11'b000_0000_0111;
	        11'b000_0000_001? : rem = tmp_rem & 11'b000_0000_0011;
	        11'b000_0000_0001 : rem = tmp_rem & 11'b000_0000_0001;
	        11'b000_0000_0000 : rem = tmp_rem & 11'b000_0000_0000;
	      endcase
	    end
	    else
	      rem = tmp_rem;
	end
	endfunction
	// detect zero
	assign is_zero = ~|din;
	// assign dout
	always @(posedge clk)
	  if (ena)
	      amp <= #1 rem(din);
	// generate sample counter
	always @(posedge clk)
	  if (ena)
	      if (go)
	          sample_cnt <= #1 1; // count AC-terms, 'go=1' is sample-zero
	      else
	          sample_cnt <= #1 sample_cnt +1;
	// generate zero counter
	always @(posedge clk)
	  if (ena)
	      if (is_zero)
	          zero_cnt <= #1 zero_cnt +1;
	      else
	          zero_cnt <= #1 0;
	// statemachine, create intermediate results
	always @(posedge clk or negedge rst)
	  if(!rst)
	    begin
	        state  <= #1 dc;
	        rlen   <= #1 0;
	        size   <= #1 0;
	        den    <= #1 1'b0;
	        dcterm <= #1 1'b0;
	    end
	  else if (ena)
	    case (state) // synopsys full_case parallel_case
	      dc:
	        begin
	            rlen <= #1 0;
	            size <= #1 cat(din);
	            if(go)
	              begin
	                  state  <= #1 ac;
	                  den    <= #1 1'b1;
	                  dcterm <= #1 1'b1;
	              end
	            else
	              begin
	                  state  <= #1 dc;
	                  den    <= #1 1'b0;
	                  dcterm <= #1 1'b0;
	              end
	        end
	      ac:
	        if(&sample_cnt)   // finished current block
	           begin
	               state <= #1 dc;
	               if (is_zero) // last sample zero? send EOB
	                  begin
	                      rlen   <= #1 0;
	                      size   <= #1 0;
	                      den    <= #1 1'b1;
	                      dcterm <= #1 1'b0;
	                  end
	               else
	                  begin
	                      rlen <= #1 zero_cnt;
	                      size <= #1 cat(din);
	                      den  <= #1 1'b1;
	                      dcterm <= #1 1'b0;
	                  end
	           end
	        else
	           begin
	               state  <= #1 ac;
	               rlen   <= #1 zero_cnt;
	               dcterm <= #1 1'b0;
	               if (is_zero)
	                  begin
	                      size   <= #1 0;
	                      den    <= #1 &zero_cnt;
	                  end
	               else
	                  begin
	                      size <= #1 cat(din);
	                      den  <= #1 1'b1;
	                  end
	           end
	    endcase
endmodule