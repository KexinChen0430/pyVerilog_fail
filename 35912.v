module header
	// Internal signals
	// Generated Signal List
		wire		ebi_cs2_s_io;
		wire		ebi_cs3_s_io;
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for ebi_cs2_ioc
		iocell ebi_cs2_ioc (
			.core_i(ebi_cs2_s_io)	// EBI bug missing generated port
		);
		// End of Generated Instance Port Map for ebi_cs2_ioc
		// Generated Instance Port Map for ebi_cs3_ioc
		iocell ebi_cs3_ioc (
			.core_i(ebi_cs3_s_io)	// EBI bug, worked because only one step
		);
		// End of Generated Instance Port Map for ebi_cs3_ioc
		// Generated Instance Port Map for vgch_core_i
		vgch_core vgch_core_i (
			.p_mix_ebi_cs2_s_io_go(ebi_cs2_s_io),	// EBI bug missing generated port
			.p_mix_ebi_cs3_s_io_go(ebi_cs3_s_io)	// EBI bug, worked because only one step
		);
		// End of Generated Instance Port Map for vgch_core_i
endmodule