module header
	// Internal signals
		// Generated Signal List
			wire [12:0] c_addr; // __W_PORT_SIGNAL_MAP_REQ
			wire [31:0] c_bus_in; // __W_PORT_SIGNAL_MAP_REQ
		// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
			assign	c_addr = p_mix_c_addr_12_0_gi;  // __I_I_BUS_PORT
			assign	c_bus_in = p_mix_c_bus_in_31_0_gi;  // __I_I_BUS_PORT
	// Generated Instances
	// wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_eda
		inst_eda_e inst_eda (
		);
		// End of Generated Instance Port Map for inst_eda
		// Generated Instance Port Map for inst_edb
		inst_edb_e inst_edb (
			.c_add(c_addr),
			.c_bus_in(c_bus_in)	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
		);
		// End of Generated Instance Port Map for inst_edb
endmodule