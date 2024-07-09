module header
    // Internal signals
		// Generated Signal List
			wire  s_eo1; // __W_PORT_SIGNAL_MAP_REQ
			wire  s_eo2; // __W_PORT_SIGNAL_MAP_REQ
			wire  s_eo3; // __W_PORT_SIGNAL_MAP_REQ
			wire  s_eo4; // __W_PORT_SIGNAL_MAP_REQ
			wire  s_eo5; // __W_PORT_SIGNAL_MAP_REQ
		// End of Generated Signal List
    // %COMPILER_OPTS%
	// Generated Signal Assignments
			assign	p_mix_s_eo1_go = s_eo1;  // __I_O_BIT_PORT
			assign	p_mix_s_eo2_go = s_eo2;  // __I_O_BIT_PORT
			assign	p_mix_s_eo3_go = s_eo3;  // __I_O_BIT_PORT
			assign	s_eo4 = p_mix_s_eo4_gi;  // __I_I_SLICE_PORT // __I_SINGLE_BIT (0)
			assign	p_mix_s_eo5_go = s_eo5;  // __I_O_BIT_PORT
    // Generated Instances
    // wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_eaa
		inst_eaa_e inst_eaa(
			.s_eo1(s_eo1),
			.s_eo2(s_eo2),
			.s_eo3(s_eo3),
			.s_eo4(s_eo4),
			.s_eo5(s_eo5)
		);
		// End of Generated Instance Port Map for inst_eaa
		// Generated Instance Port Map for inst_eab
		inst_eab_e inst_eab(
		);
		// End of Generated Instance Port Map for inst_eab
		// Generated Instance Port Map for inst_eac
		inst_eac_e inst_eac(
		);
		// End of Generated Instance Port Map for inst_eac
endmodule