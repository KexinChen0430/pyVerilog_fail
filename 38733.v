module header
    // Internal signals
		// Generated Signal List
			wire [7:0] bus20040728_altop; // __W_PORT_SIGNAL_MAP_REQ
			wire [7:0] bus20040728_top; // __W_PORT_SIGNAL_MAP_REQ
		// End of Generated Signal List
    // %COMPILER_OPTS%
	// Generated Signal Assignments
			assign	bus20040728_altop = bus20040728_altop_i;  // __I_I_BUS_PORT
			assign	bus20040728_top[7:4] = p_mix_bus20040728_top_7_4_gi[3:0];  // __I_I_SLICE_PORT
    // Generated Instances
    // wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_aea
		inst_aea_e inst_aea(
			.bus20040728_altop_i(bus20040728_altop),
			.bus20040728_top_i(bus20040728_top)
		);
		// End of Generated Instance Port Map for inst_aea
endmodule