module header
    // Internal signals
		// Generated Signal List
			wire  sig_in_01; // __W_PORT_SIGNAL_MAP_REQ
			wire [7:0] sig_in_03; // __W_PORT_SIGNAL_MAP_REQ
			wire [5:0] sig_io_05; // __W_PORT_SIGNAL_MAP_REQ
			wire [6:0] sig_io_06; // __W_PORT_SIGNAL_MAP_REQ
			wire  sig_out_02; // __W_PORT_SIGNAL_MAP_REQ
			wire [7:0] sig_out_04; // __W_PORT_SIGNAL_MAP_REQ
		// End of Generated Signal List
    // %COMPILER_OPTS%
	// Generated Signal Assignments
			assign	sig_in_01 = p_mix_sig_in_01_gi;  // __I_I_BIT_PORT
			assign	sig_in_03 = p_mix_sig_in_03_gi;  // __I_I_BUS_PORT
			assign	sig_io_05 = p_mix_sig_io_05_gc;  // __I_I_BUS_PORT
			assign	sig_io_06 = p_mix_sig_io_06_gc;  // __I_I_BUS_PORT
			assign	p_mix_sig_out_02_go = sig_out_02;  // __I_O_BIT_PORT
			assign	p_mix_sig_out_04_go = sig_out_04;  // __I_O_BUS_PORT
    // Generated Instances
    // wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_aa
		inst_aa_e inst_aa(
			.sig_in_01_p(sig_in_01),
			.sig_in_03_p(sig_in_03),
			.sig_io_out_05_p(sig_io_05),
			.sig_io_out_06_p(sig_io_06),
			.sig_out_02_p(sig_out_02),
			.sig_out_04_p(sig_out_04)
		);
		// End of Generated Instance Port Map for inst_aa
		// Generated Instance Port Map for inst_ab
		inst_ab_e inst_ab(
		);
		// End of Generated Instance Port Map for inst_ab
		// Generated Instance Port Map for inst_ac
		inst_ac_e inst_ac(
		);
		// End of Generated Instance Port Map for inst_ac
endmodule