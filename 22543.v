module header
    // Internal signals
		// Generated Signal List
			wire  s_eo3; // __W_PORT_SIGNAL_MAP_REQ
		// End of Generated Signal List
    // %COMPILER_OPTS%
	// Generated Signal Assignments
			assign	p_mix_s_eo3_go = s_eo3;  // __I_O_BIT_PORT
    // Generated Instances
    // wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_ea
		inst_ea_e inst_ea(
			.p_mix_s_eo1_go(s_eo1),
			.p_mix_s_eo2_go(s_eo2),
			.p_mix_s_eo3_go(s_eo3),
			.p_mix_s_eo4_gi(s_eo4),
			.p_mix_s_eo5_go(s_eo5)
		);
		// End of Generated Instance Port Map for inst_ea
		// Generated Instance Port Map for inst_eb
		inst_eb_e inst_eb(
			.p_mix_s_eo2_gi(s_eo2)
		);
		// End of Generated Instance Port Map for inst_eb
endmodule