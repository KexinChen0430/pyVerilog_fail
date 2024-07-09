module header
	// Internal signals
		// Generated Signal List
			wire	[4:0]	top_rs_selclk_out2_par;
		// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
			assign top_rs_selclk_out2_par[4:4] = `top_rs_selclk_out2_par_c;
	// Generated Instances
	// wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for i_avfb_cgu
		cgu i_avfb_cgu (
			.selclk_out2_par_i(top_rs_selclk_out2_par)
		);
		// End of Generated Instance Port Map for i_avfb_cgu
		// Generated Instance Port Map for i_avfb_logic
		avfb_logic i_avfb_logic (
			.top_rs_selclk_out2_par_go(top_rs_selclk_out2_par)
		);
		// End of Generated Instance Port Map for i_avfb_logic
endmodule