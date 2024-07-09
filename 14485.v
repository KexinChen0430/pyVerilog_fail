module header
	// Internal signals
	// Generated Signal List
		wire	[12:0]	c_addr; // __W_PORT_SIGNAL_MAP_REQ
		wire	[31:0]	c_bus_in; // __W_PORT_SIGNAL_MAP_REQ
		wire	[5:0]	v_select; // __W_PORT_SIGNAL_MAP_REQ
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	c_addr	=	p_mix_c_addr_12_0_gi;  // __I_I_BUS_PORT
		assign	c_bus_in	=	p_mix_c_bus_in_31_0_gi;  // __I_I_BUS_PORT
		assign	v_select[5]	=	p_mix_v_select_5_5_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
		assign	v_select[2]	=	p_mix_v_select_2_2_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_eca
		inst_eca_e inst_eca (
			.c_add(c_addr),
			.c_bus_in(c_bus_in),	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
			.v_select(v_select)	// RequestBusinterface:RequestBus#6(VPU)VPUinterface
		);
		// End of Generated Instance Port Map for inst_eca
		// Generated Instance Port Map for inst_ecb
		inst_ecb_e inst_ecb (
			.c_addr(c_addr),
			.c_bus_in(c_bus_in)	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
		);
		// End of Generated Instance Port Map for inst_ecb
		// Generated Instance Port Map for inst_ecc
		inst_ecc_e inst_ecc (
			.c_addr(c_addr),
			.c_bus_in(c_bus_in)	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
		);
		// End of Generated Instance Port Map for inst_ecc
endmodule