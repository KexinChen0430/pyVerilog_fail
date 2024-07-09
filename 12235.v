module header
	// Internal signals
		// Generated Signal List
			wire	[7:0]	s_port_offset_01;
			wire	[7:0]	s_port_offset_02;
			wire	[1:0]	s_port_offset_02b;
			wire  test1; // __W_PORT_SIGNAL_MAP_REQ
			wire	[4:0]	test2;
			wire	[3:0]	test3;
		// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
			assign	p_mix_test1_go = test1;  // __I_O_BIT_PORT
	// Generated Instances
	// wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_aa
		ent_aa inst_aa (
			.port_1(test1),	// Use internally test1
			.port_2(test2[0]),	// Bus with hole in the middleNeeds input to be happy
			.port_3(test3[0]),	// Bus combining o.k.
			.port_o(s_port_offset_01),
			.port_o02[10:3](s_port_offset_02),  // __W_PORT// __E_CANNOT_COMBINE_SPLICES
			.port_o02[1:0](s_port_offset_02b)  // __W_PORT// __E_CANNOT_COMBINE_SPLICES
		);
		// End of Generated Instance Port Map for inst_aa
		// Generated Instance Port Map for inst_ab
		ent_ab inst_ab (
			.port_2(test2[1]),	// Bus with hole in the middleNeeds input to be happy
			.port_3(test3[1]),	// Bus combining o.k.
			.port_ab_1(test1),	// Use internally test1
			.port_i(s_port_offset_01),
			.port_i02[10:3](s_port_offset_02),  // __W_PORT// __E_CANNOT_COMBINE_SPLICES
			.port_i02[2:1](s_port_offset_02b)  // __W_PORT// __E_CANNOT_COMBINE_SPLICES
		);
		// End of Generated Instance Port Map for inst_ab
		// Generated Instance Port Map for inst_ac
		ent_ac inst_ac (
			.port_2(test2[3]),	// Bus with hole in the middleNeeds input to be happy
			.port_3(test3[2])	// Bus combining o.k.
		);
		// End of Generated Instance Port Map for inst_ac
		// Generated Instance Port Map for inst_ad
		ent_ad inst_ad (
			.port_2(test2[4]),	// Bus with hole in the middleNeeds input to be happy
			.port_3(test3[3])	// Bus combining o.k.
		);
		// End of Generated Instance Port Map for inst_ad
		// Generated Instance Port Map for inst_ae
		ent_ae inst_ae (
			.port_2(test2),	// Bus with hole in the middleNeeds input to be happy
			.port_3(test3)	// Bus combining o.k.
		);
		// End of Generated Instance Port Map for inst_ae
endmodule