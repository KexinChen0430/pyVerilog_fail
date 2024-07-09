module header
	// Internal signals
	// Generated Signal List
		wire		sc_sig_1; // __W_PORT_SIGNAL_MAP_REQ
		wire	[31:0]	sc_sig_2; // __W_PORT_SIGNAL_MAP_REQ
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	p_mix_sc_sig_1_go	=	sc_sig_1;  // __I_O_BIT_PORT
		assign	p_mix_sc_sig_2_go	=	sc_sig_2;  // __I_O_BUS_PORT
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_aba
		ent_aba inst_aba (	// is i_mic32_top / hier inst_ab inst_aba inst_ab
			.sc_p_1(sc_sig_1),	// bad conection bits detected
			.sc_p_2(sc_sig_2)	// reverse orderreverse order
					// multiline comments
		);
		// End of Generated Instance Port Map for inst_aba
endmodule