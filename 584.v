module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outreadylatency_check ( .error(1'b1) );
		end
	endgenerate
	TimeHoldOver_Qsys_mm_interconnect_0_avalon_st_adapter_015_error_adapter_0 error_adapter_0 (
		.clk       (in_clk_0_clk),    //   clk.clk
		.reset_n   (~in_rst_0_reset), // reset.reset_n
		.in_data   (in_0_data),       //    in.data
		.in_valid  (in_0_valid),      //      .valid
		.in_ready  (in_0_ready),      //      .ready
		.out_data  (out_0_data),      //   out.data
		.out_valid (out_0_valid),     //      .valid
		.out_ready (out_0_ready),     //      .ready
		.out_error (out_0_error)      //      .error
	);
endmodule