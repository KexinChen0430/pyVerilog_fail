module header
	// Internal signals
	// Generated Signal List
		wire	[12:0]	c_addr; // __W_PORT_SIGNAL_MAP_REQ
		wire	[31:0]	c_bus_in; // __W_PORT_SIGNAL_MAP_REQ
		wire	[12:0]	tmi_sbist_fail; // __W_PORT_SIGNAL_MAP_REQ
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	c_addr	=	p_mix_c_addr_12_0_gi;  // __I_I_BUS_PORT
		assign	c_bus_in	=	p_mix_c_bus_in_31_0_gi;  // __I_I_BUS_PORT
		assign	p_mix_tmi_sbist_fail_12_10_go[2:0]	=	tmi_sbist_fail[12:10];  // __I_O_SLICE_PORT
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_eba
		inst_eba_e inst_eba (
			.c_addr_i(c_addr),
			.c_bus_i(c_bus_in),	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
			.mbist_aci_fail_o(tmi_sbist_fail[10]),
			.mbist_vcd_fail_o(tmi_sbist_fail[11])
		);
		// End of Generated Instance Port Map for inst_eba
		// Generated Instance Port Map for inst_ebb
		inst_ebb_e inst_ebb (
			.c_addr_i(c_addr),
			.c_bus_i(c_bus_in),	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
			.mbist_sum_fail_o(tmi_sbist_fail[12])
		);
		// End of Generated Instance Port Map for inst_ebb
		// Generated Instance Port Map for inst_ebc
		inst_ebc_e inst_ebc (
			.c_addr(c_addr),
			.c_bus_in(c_bus_in)	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
		);
		// End of Generated Instance Port Map for inst_ebc
endmodule