module header
	// Internal signals
	// Generated Signal List
		wire		sig_01;
		wire		sig_03;
		wire		sig_04;
		wire	[3:0]	sig_05;
		wire	[3:0]	sig_06;
		wire	[5:0]	sig_07;
		wire	[8:2]	sig_08;
		//  __I_OUT_OPEN wire	[4:0]	sig_13;  // __W_BAD_BRANCH
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
	// Generated Instances and Port Mappings
	`ifdef insert_emu_mux_inst_a
		// Emulator Data Injection Path, generated by MIX
		wire emu_mux_inst_a = 1'b0;
		wire		sig_04_emux_s;
		wire		sig_04_vc_s;
		wire	[3:0]	sig_06_emux_s;
		wire	[3:0]	sig_06_vc_s;
		wire	[6:0]	sig_i_ae_emux_s;
		wire	[6:0]	sig_i_ae_vc_s;
		wire		sig_i_a_emux_s;
		wire		sig_i_a_vc_s;
		wire	[5:0]	sig_07_emux_s;
		wire	[5:0]	sig_07_vc_s;
		wire		sig_i_a2_emux_s;
		wire		sig_i_a2_vc_s;
		assign sig_04_emux_s	= emu_mux_inst_a ? sig_04_vc_s	: sig_04;
		assign sig_06_emux_s	= emu_mux_inst_a ? sig_06_vc_s	: sig_06;
		assign sig_i_ae_emux_s	= emu_mux_inst_a ? sig_i_ae_vc_s	: sig_i_ae;
		assign sig_i_a_emux_s	= emu_mux_inst_a ? sig_i_a_vc_s	: sig_i_a;
		assign sig_07_emux_s	= emu_mux_inst_a ? sig_07_vc_s	: sig_07;
		assign sig_i_a2_emux_s	= emu_mux_inst_a ? sig_i_a2_vc_s	: sig_i_a2;
	`endif
		// Generated Instance Port Map for inst_a
		ent_a inst_a (
			.p_mix_sig_01_go(sig_01),	// Use internally test1Will create p_mix_sig_1_go port
			.p_mix_sig_03_go(sig_03),	// Interhierachy link, will create p_mix_sig_3_go
		`ifdef insert_emu_mux_inst_a
			.p_mix_sig_04_gi(sig_04_emux_s),
		`else
			.p_mix_sig_04_gi(sig_04),	// Interhierachy link, will create p_mix_sig_4_gi
		`endif
			.p_mix_sig_05_2_1_go(sig_05[2:1]),	// Bus, single bits go to outsideBus, single bits go to outside, will create p_mix_sig_5_2_2_goBu...
		`ifdef insert_emu_mux_inst_a
			.p_mix_sig_06_gi(sig_06_emux_s),
		`else
			.p_mix_sig_06_gi(sig_06),	// Conflicting definition (X2)
		`endif
		`ifdef insert_emu_mux_inst_a
			.p_mix_sig_i_ae_gi(sig_i_ae_emux_s),
		`else
			.p_mix_sig_i_ae_gi(sig_i_ae),	// Input Bus
		`endif
			.p_mix_sig_o_ae_go(sig_o_ae),	// Output Bus
		`ifdef insert_emu_mux_inst_a
			.port_i_a(sig_i_a_emux_s),
		`else
			.port_i_a(sig_i_a),	// Input Port
		`endif
			.port_o_a(sig_o_a),	// Output Port
		`ifdef insert_emu_mux_inst_a
			.sig_07(sig_07_emux_s),
		`else
			.sig_07(sig_07),	// Conflicting definition, IN false!
		`endif
			.sig_08(sig_08),	// VHDL intermediate needed (port name)
			.sig_13(),	// Create internal signal name
		`ifdef insert_emu_mux_inst_a
			.sig_i_a2(sig_i_a2_emux_s),
		`else
			.sig_i_a2(sig_i_a2),	// Input Port
		`endif
			.sig_o_a2(sig_o_a2)	// Output Port
		);
		// End of Generated Instance Port Map for inst_a
	`ifdef insert_emu_mux_inst_b
		// Emulator Data Injection Path, generated by MIX
		wire emu_mux_inst_b = 1'b0;
		wire		sig_01_emux_s;
		wire		sig_01_vc_s;
		wire		sig_03_emux_s;
		wire		sig_03_vc_s;
		wire		sig_05_2_emux_s;
		wire		sig_05_2_vc_s;
		wire		sig_05_1_emux_s;
		wire		sig_05_1_vc_s;
		wire	[3:0]	sig_06_emux_s;
		wire	[3:0]	sig_06_vc_s;
		wire	[3:0]	sig_06_emux_s;
		wire	[3:0]	sig_06_vc_s;
		wire	[5:0]	sig_07_emux_s;
		wire	[5:0]	sig_07_vc_s;
		wire	[8:2]	sig_08_emux_s;
		wire	[8:2]	sig_08_vc_s;
		assign sig_01_emux_s	= emu_mux_inst_b ? sig_01_vc_s	: sig_01;
		assign sig_03_emux_s	= emu_mux_inst_b ? sig_03_vc_s	: sig_03;
		assign sig_05_2_emux_s	= emu_mux_inst_b ? sig_05_2_vc_s	: sig_05[2];
		assign sig_05_1_emux_s	= emu_mux_inst_b ? sig_05_1_vc_s	: sig_05[1];
		assign sig_06	= emu_mux_inst_b ? sig_06_vc_s	: sig_06_emux_s;
		assign sig_06	= emu_mux_inst_b ? sig_06_vc_s	: sig_06_emux_s;
		assign sig_07_emux_s	= emu_mux_inst_b ? sig_07_vc_s	: sig_07;
		assign sig_08_emux_s	= emu_mux_inst_b ? sig_08_vc_s	: sig_08;
	`endif
		// Generated Instance Port Map for inst_b
		ent_b inst_b (
		`ifdef insert_emu_mux_inst_b
			.port_b_1(sig_01_emux_s),
		`else
			.port_b_1(sig_01),	// Use internally test1Will create p_mix_sig_1_go port
		`endif
		`ifdef insert_emu_mux_inst_b
			.port_b_3(sig_03_emux_s),
		`else
			.port_b_3(sig_03),	// Interhierachy link, will create p_mix_sig_3_go
		`endif
			.port_b_4(sig_04),	// Interhierachy link, will create p_mix_sig_4_gi
		`ifdef insert_emu_mux_inst_b
			.port_b_5_1(sig_05_2_emux_s),
		`else
			.port_b_5_1(sig_05[2]),	// Bus, single bits go to outsideBus, single bits go to outside, will create p_mix_sig_5_2_2_goBu...
		`endif
		`ifdef insert_emu_mux_inst_b
			.port_b_5_2(sig_05_1_emux_s),
		`else
			.port_b_5_2(sig_05[1]),	// Bus, single bits go to outsideBus, single bits go to outside, will create p_mix_sig_5_2_2_goBu...
		`endif
		`ifdef insert_emu_mux_inst_b
			.port_b_6i(sig_06_emux_s),
		`else
			.port_b_6i(sig_06),	// Conflicting definition (X2)
		`endif
		`ifdef insert_emu_mux_inst_b
			.port_b_6o(sig_06_emux_s),
		`else
			.port_b_6o(sig_06),	// Conflicting definition (X2)
		`endif
		`ifdef insert_emu_mux_inst_b
			.sig_07(sig_07_emux_s),
		`else
			.sig_07(sig_07),	// Conflicting definition, IN false!
		`endif
		`ifdef insert_emu_mux_inst_b
			.sig_08(sig_08_emux_s)
		`else
			.sig_08(sig_08)	// VHDL intermediate needed (port name)
		`endif
		);
		// End of Generated Instance Port Map for inst_b
endmodule