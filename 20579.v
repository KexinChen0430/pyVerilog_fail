module LAG_pipelined_channel (data_in, ctrl_in, data_out, ctrl_out, clk, rst_n);
   parameter stages = 0;
   parameter nPC = 1; // Number of physical channels per trunk
   input     flit_t data_in[nPC-1:0];
   input     chan_cntrl_t ctrl_in;
   output    flit_t data_out[nPC-1:0];
   output    chan_cntrl_t ctrl_out;
   input     clk, rst_n;
   genvar    st, pc;
   flit_t ch_reg[stages-1:0][nPC-1:0];
   chan_cntrl_t ctrl_reg[stages-1:0];
   generate
      if (stages==0) begin
	 // no registers in channel
	 assign data_out = data_in;
	 assign ctrl_out = ctrl_in;
      end else begin
	 for (st=0; st<stages; st++) begin:eachstage
	    if (st==0) begin
	       for (pc = 0; pc < nPC; pc++) begin:eachPC1
            LAG_data_reg data_rg (.data_in(data_in[pc]), .data_out(ch_reg[0][pc]), .clk, .rst_n);
         end
         //LAG_ctrl_reg ctrl_rg (.ctrl_in(ctrl_in), .ctrl_out(ctrl_reg[0]), .clk, .rst_n);
      end else begin
	       for (pc = 0; pc < nPC; pc++) begin:eachPC2
	         LAG_data_reg data_rg (.data_in(ch_reg[st-1][pc]), .data_out(ch_reg[st][pc]), .clk, .rst_n);
	       end
	       //LAG_ctrl_reg ctrl_rg (.ctrl_in(ctrl_reg[st-1]), .ctrl_out(ctrl_reg[st]), .clk, .rst_n);
      end
	 end
   assign data_out = ch_reg[stages-1];
   //assign ctrl_out = ctrl_reg[stages-1];
	 assign ctrl_out = ctrl_in;
      end
endgenerate
endmodule