module header
	// Internal signals
		// Generated Signal List
			wire [4:0] top_rs_selclk_out2_par; // __W_PORT_SIGNAL_MAP_REQ
		// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
			assign top_rs_selclk_out2_par[4:4] = `top_rs_selclk_out2_par_c;
			assign	top_rs_selclk_out2_par_go = top_rs_selclk_out2_par;  // __I_O_BUS_PORT
	// Generated Instances
	// wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for i_avfb_top_rs
		avfb_top_rs i_avfb_top_rs (
			.selclk_out2_par_o(top_rs_selclk_out2_par)
		);
		// End of Generated Instance Port Map for i_avfb_top_rs
endmodule