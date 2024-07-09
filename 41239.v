module %m.");
     end
   // synopsys translate_on
   generate
      if(error_capture_mode != `ERROR_CAPTURE_MODE_NONE)
	begin
	   wire [0:2+num_vcs*2-1] errors_s, errors_q;
	   assign errors_s = {error_unmatched,
			      error_multimatch,
			      fcs_errors_ovc};
	   c_err_rpt
	     #(.num_errors(2+num_vcs*2),
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