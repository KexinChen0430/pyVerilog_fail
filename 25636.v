module LAG_pipelined_channel (data_in, data_out, clk, rst_n);
   parameter stages = 0;
   parameter nPC = 1; // Number of physical channels per trunk
   input     flit_t data_in[nPC-1:0];
   output    flit_t data_out[nPC-1:0];
   input     clk, rst_n;
   genvar    st, pc;
   flit_t ch_reg[stages-1:0][nPC-1:0];
   generate
      if (stages==0) begin
	 // no registers in channel
	 assign data_out = data_in;
      end else begin
	 for (st=0; st<stages; st++) begin:eachstage
	    if (st==0) begin
	       for (pc = 0; pc < nPC; pc++) begin:eachPC1
            LAG_reg rg (.data_in(data_in[pc]), .data_out(ch_reg[0][pc]), .clk, .rst_n);
         end
	    end else begin
	       for (pc = 0; pc < nPC; pc++) begin:eachPC2
	         LAG_reg rg (.data_in(ch_reg[st-1][pc]), .data_out(ch_reg[st][pc]), .clk, .rst_n);
	       end
      end
	 end
   assign data_out = ch_reg[stages-1];
      end
endgenerate
endmodule