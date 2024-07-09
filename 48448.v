module header
	// Internal signals
	// Generated Signal List
		wire		ebi_cs2_s_io; // __W_PORT_SIGNAL_MAP_REQ
		wire		ebi_cs3_s_io; // __W_PORT_SIGNAL_MAP_REQ
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	p_mix_ebi_cs2_s_io_go	=	ebi_cs2_s_io;  // __I_O_BIT_PORT
		assign	p_mix_ebi_cs3_s_io_go	=	ebi_cs3_s_io;  // __I_O_BIT_PORT
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for vgch_suba_i
		vgch_suba vgch_suba_i (
		);
		// End of Generated Instance Port Map for vgch_suba_i
		// Generated Instance Port Map for vgch_subb_i
		vgch_subb vgch_subb_i (
			.ebi_cs3_s_io_go(ebi_cs3_s_io),	// EBI bug, worked because only one step
			.p_mix_ebi_cs2_s_io_go(ebi_cs2_s_io)	// EBI bug missing generated port
		);
		// End of Generated Instance Port Map for vgch_subb_i
endmodule