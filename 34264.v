module header
	// Internal signals
	// Generated Signal List
		wire		mix_logic1_0;
		wire	[3:0]	mix_logic1_bus_1;
		wire		mix_logic0_1;
		wire	[3:0]	mix_logic0_bus_2;
		wire	[6:0]	mix_logic0_bus_3;
		wire	[3:0]	part_zero;
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	mix_logic1_0 = 1'b1;
		assign	mix_logic1_bus_1 = 4'b1111;
		assign	mix_logic0_1 = 1'b0;
		assign	mix_logic0_bus_2 = 4'b0000;
		assign	mix_logic0_bus_3 = 7'b0000000;
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_aa
		ent_aa inst_aa (
			.high_bus_3_0(mix_logic1_bus_1),	// Ground wire_low port
			.low_bit_aa(mix_logic0_1),
			.mix_logic0_bus_2(mix_logic0_bus_2),	// Ground port
			.mix_logic1_0(mix_logic1_0),	//  Wire bit to high
			.part_zero(part_zero)	// Wire two bits to port
		);
		// End of Generated Instance Port Map for inst_aa
		// Generated Instance Port Map for inst_ab
		ent_ab inst_ab (
			.low_bus_6_0(mix_logic0_bus_3),	// Wide low port
			.port_part_zero_u({ 2'b00, part_zero[3:2] }) // __W_PORT	// Wire two bits to low // 	// Wire two bits to port // __I_COMBINE_SPLICES
		);
		// End of Generated Instance Port Map for inst_ab
		// Generated Instance Port Map for inst_ac
		ent_ac inst_ac (
		);
		// End of Generated Instance Port Map for inst_ac
		// Generated Instance Port Map for inst_ad
		ent_ad inst_ad (
		);
		// End of Generated Instance Port Map for inst_ad
		// Generated Instance Port Map for inst_ae
		ent_ae inst_ae (
		);
		// End of Generated Instance Port Map for inst_ae
endmodule