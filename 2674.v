module
   // NOTE: Because we need to clear it in the cycle after a flit / credit has
   // been transmitted, this register cannot be included in any of the other
   // clock gating domains. If we could change things such that flits are
   // transmitted using edge-based signaling (i.e., transitions), they could be
   // included in the clock gating domain controlled by alloc_active.
   // Alternatively, we could include the flit_sent_prev term in alloc_active;
   // this would allow us to include flit_validq in the gating domain at
   // the cost of some unnecessary activity. As synthesis will probably not
   // create a clock gating domain for just these two registers, they currently
   // will most likely end up being free-running, so this may be a reasonable
   // tradeoff.
   wire 			      flit_sent_prev;
   wire 			      flit_valid_active;
   assign flit_valid_active = alloc_active | flit_sent_prev;
   wire 			      flit_valid_s, flit_valid_q;
   assign flit_valid_s = flit_sent;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_validq
     (.clk(clk),
      .reset(reset),
      .active(flit_valid_active),
      .d(flit_valid_s),
      .q(flit_valid_q));
   assign flit_sent_prev = flit_valid_q;
   c_select_1ofn
     #(.num_ports(num_vcs),
       .width(1))
   flit_head_sel
     (.select(sw_sel_ivc),
      .data_in(flit_head_ivc),
      .data_out(flit_head));
   wire 			      flit_head_s, flit_head_q;
   assign flit_head_s = flit_head;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_headq
     (.clk(clk),
      .reset(1'b0),
      .active(alloc_active),
      .d(flit_head_s),
      .q(flit_head_q));
   assign flit_head_prev = flit_head_q;
   // generate outgoing flow control signals
   rtr_flow_ctrl_output
     #(.num_vcs(num_vcs),
       .flow_ctrl_type(flow_ctrl_type),
       .reset_type(reset_type))
   fco
     (.clk(clk),
      .reset(reset),
      .active(alloc_active),
      .fc_event_valid_in(flit_sent),
      .fc_event_sel_in_ivc(sw_sel_ivc),
      .flow_ctrl_out(flow_ctrl_out));
   // error checking
   generate
      if(error_capture_mode != `ERROR_CAPTURE_MODE_NONE)
	begin
	   wire [0:num_vcs*3+num_vcs*2-1] errors_s, errors_q;
	   assign errors_s = {ivcc_errors_ivc, fb_errors_ivc};
	   c_err_rpt
	     #(.num_errors(num_vcs*3+num_vcs*2),
	       .capture_mode(error_capture_mode),
	       .reset_type(reset_type))
	   chk
	     (.clk(clk),
	      .reset(reset),
	      .active(1'b1),
	      .errors_in(errors_s),
	      .errors_out(errors_q));
	   assign error = |errors_q;
	end
      else
	assign error = 1'bx;
   endgenerate
endmodule