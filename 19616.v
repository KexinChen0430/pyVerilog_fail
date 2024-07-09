module header
	// Internal signals
	// Generated Signal List
		wire		sig_01; // __W_PORT_SIGNAL_MAP_REQ
		wire	[4:0]	sig_02;
		wire		sig_03; // __W_PORT_SIGNAL_MAP_REQ
		wire		sig_04; // __W_PORT_SIGNAL_MAP_REQ
		wire	[3:0]	sig_05; // __W_PORT_SIGNAL_MAP_REQ
		wire	[3:0]	sig_06; // __W_PORT_SIGNAL_MAP_REQ
		wire	[6:0]	sig_14;
		wire	[6:0]	sig_i_ae; // __W_PORT_SIGNAL_MAP_REQ
		wire	[7:0]	sig_o_ae; // __W_PORT_SIGNAL_MAP_REQ
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	p_mix_sig_01_go	=	sig_01;  // __I_O_BIT_PORT
		assign	p_mix_sig_03_go	=	sig_03;  // __I_O_BIT_PORT
		assign	sig_04	=	p_mix_sig_04_gi;  // __I_I_BIT_PORT
		assign	p_mix_sig_05_2_1_go[1:0]	=	sig_05[2:1];  // __I_O_SLICE_PORT
		assign	sig_06	=	p_mix_sig_06_gi;  // __I_I_BUS_PORT
		assign	sig_i_ae	=	p_mix_sig_i_ae_gi;  // __I_I_BUS_PORT
		assign	p_mix_sig_o_ae_go	=	sig_o_ae;  // __I_O_BUS_PORT
	// Generated Instances and Port Mappings
`ifdef exclude_inst_aa
			// assign sig_04 = open;
			assign sig_01 = some_val;
			assign sig_02 = some_val;
			assign sig_03 = some_val;
			assign sig_05 = some_val;
			assign sig_06 = some_val;
			assign sig_07 = some_val;
			assign sig_08 = 7'b1111111;
			assign sig_13 = 5'b00000;
			assign sig_14 = 7'b0000000;
`else
		// Generated Instance Port Map for inst_aa
		ent_aa inst_aa (
			.port_aa_1(sig_01),	// Use internally test1Will create p_mix_sig_1_go port
			.port_aa_2(sig_02[0]),	// Use internally test2, no port generated
			.port_aa_3(sig_03),	// Interhierachy link, will create p_mix_sig_3_go
			.port_aa_4(sig_04),	// Interhierachy link, will create p_mix_sig_4_gi
			.port_aa_5(sig_05),	// Bus, single bits go to outsideBus, single bits go to outside, will create p_mix_sig_5_2_2_goBu...
			.port_aa_6(sig_06),	// Conflicting definition (X2)
			.sig_07(sig_07),	// Conflicting definition, IN false!
			.sig_08(sig_08),	// VHDL intermediate needed (port name)
			.sig_13(sig_13),	// Create internal signal name
			.sig_14(sig_14)	// Multiline comment 1
					// Multiline comment 2
					// Multiline comment 3
		);
		// End of Generated Instance Port Map for inst_aa
`endif
`ifdef exclude_inst_ab
			// assign sig_01 = open;
			// assign sig_13 = open;
			// assign sig_14 = open;
			assign sig_02 = some_val;
`else
		// Generated Instance Port Map for inst_ab
		ent_ab inst_ab (
			.port_ab_1(sig_01),	// Use internally test1Will create p_mix_sig_1_go port
			.port_ab_2(sig_02[1]),	// Use internally test2, no port generated
			.sig_13(sig_13),	// Create internal signal name
			.sig_14(sig_14)	// Multiline comment 1
					// Multiline comment 2
					// Multiline comment 3
		);
		// End of Generated Instance Port Map for inst_ab
`endif
`ifdef exclude_inst_ac
			assign sig_02 = 1'b0;
`else
		// Generated Instance Port Map for inst_ac
		ent_ac inst_ac (
			.port_ac_2(sig_02[3])	// Use internally test2, no port generated
		);
		// End of Generated Instance Port Map for inst_ac
`endif
`ifdef exclude_inst_ad
			assign sig_02 = 1'b0;
`else
		// Generated Instance Port Map for inst_ad
		ent_ad inst_ad (
			.port_ad_2(sig_02[4])	// Use internally test2, no port generated
		);
		// End of Generated Instance Port Map for inst_ad
`endif
`ifdef exclude_inst_ae
			// assign sig_02 = open;
			// assign sig_05 = open;
			// assign sig_06 = open;
			// assign sig_07 = open;
			// assign sig_08 = open;
			// assign sig_i_ae = open;
			assign sig_o_ae = 8'b00000000;
`else
		// Generated Instance Port Map for inst_ae
		ent_ae inst_ae (
			.port_ae_2[1:0](sig_02[1:0]), 	// Use internally test2, no port generated// __E_CANNOT_COMBINE_SPLICES
			.port_ae_2[4:3](sig_02[4:3]), 	// Use internally test2, no port generated// __E_CANNOT_COMBINE_SPLICES
			.port_ae_5(sig_05),	// Bus, single bits go to outsideBus, single bits go to outside, will create p_mix_sig_5_2_2_goBu...
			.port_ae_6(sig_06),	// Conflicting definition (X2)
			.sig_07(sig_07),	// Conflicting definition, IN false!
			.sig_08(sig_08),	// VHDL intermediate needed (port name)
			.sig_i_ae(sig_i_ae),	// Input Bus
			.sig_o_ae(sig_o_ae)	// Output Bus
		);
		// End of Generated Instance Port Map for inst_ae
`endif
endmodule