module header
	// Internal signals
		// Generated Signal List
			//  __I_IN_OPEN wire		BC_RA_02_fail	;  // __W_BAD_BRANCH
			wire		tc_BC_RA_02_fail;
		// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
	// Generated Instances
	// wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for i_avfb_cgu
		cgu i_avfb_cgu (
		);
		// End of Generated Instance Port Map for i_avfb_cgu
		// Generated Instance Port Map for i_avfb_logic
		avfb_logic i_avfb_logic (
		);
		// End of Generated Instance Port Map for i_avfb_logic
		// Generated Instance Port Map for i_avfb_pad_mux
		avfb_pad_mux i_avfb_pad_mux (
			// __I_RECONN .BC_RA_02_fail_i(),
			.BC_RA_02_fail_i(tc_BC_RA_02_fail)
		);
		// End of Generated Instance Port Map for i_avfb_pad_mux
		// Generated Instance Port Map for i_avfb_tc
		avfb_tc i_avfb_tc (
			.BC_RA_02_fail_o(tc_BC_RA_02_fail)
		);
		// End of Generated Instance Port Map for i_avfb_tc
endmodule