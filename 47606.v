module header
	// Internal signals
	// Generated Signal List
		wire		test1;
		wire	[127:0]	unsplice_a1_no3;
		wire	[127:0]	unsplice_a2_all128;
		wire	[127:0]	unsplice_a3_up100;
		wire	[127:0]	unsplice_a4_mid100;
		wire	[127:0]	unsplice_a5_midp100;
		wire	[127:0]	unsplice_bad_a;
		wire	[127:0]	unsplice_bad_b;
		// __I_NODRV_I wire	[3:0]	video_i;  // __W_BAD_BRANCH
		wire	[31:0]	widemerge_a1;
		wire	[31:0]	widesig;
		wire		widesig_r_0;
		wire		widesig_r_1;
		wire		widesig_r_10;
		wire		widesig_r_11;
		wire		widesig_r_12;
		wire		widesig_r_13;
		wire		widesig_r_14;
		wire		widesig_r_15;
		wire		widesig_r_16;
		wire		widesig_r_17;
		wire		widesig_r_18;
		wire		widesig_r_19;
		wire		widesig_r_2;
		wire		widesig_r_20;
		wire		widesig_r_21;
		wire		widesig_r_22;
		wire		widesig_r_23;
		wire		widesig_r_24;
		wire		widesig_r_25;
		wire		widesig_r_26;
		wire		widesig_r_27;
		wire		widesig_r_28;
		wire		widesig_r_29;
		wire		widesig_r_3;
		wire		widesig_r_30;
		wire		widesig_r_4;
		wire		widesig_r_5;
		wire		widesig_r_6;
		wire		widesig_r_7;
		wire		widesig_r_8;
		wire		widesig_r_9;
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_a
		inst_a_e inst_a (
			.p_mix_test1_go(test1),	// Use internally test1
			.unsplice_a1_no3(unsplice_a1_no3),	// leaves 3 unconnected
			.unsplice_a2_all128(unsplice_a2_all128),	// full 128 bit port
			.unsplice_a3_up100(unsplice_a3_up100),	// connect 100 bits from 0
			.unsplice_a4_mid100(unsplice_a4_mid100),	// connect mid 100 bits
			.unsplice_a5_midp100(unsplice_a5_midp100),	// connect mid 100 bits
			.unsplice_bad_a(unsplice_bad_a),
			.unsplice_bad_b(unsplice_bad_b),	// # conflict
			.widemerge_a1(widemerge_a1),
			.widesig_o(widesig),
			.widesig_r_0(widesig_r_0),
			.widesig_r_1(widesig_r_1),
			.widesig_r_10(widesig_r_10),
			.widesig_r_11(widesig_r_11),
			.widesig_r_12(widesig_r_12),
			.widesig_r_13(widesig_r_13),
			.widesig_r_14(widesig_r_14),
			.widesig_r_15(widesig_r_15),
			.widesig_r_16(widesig_r_16),
			.widesig_r_17(widesig_r_17),
			.widesig_r_18(widesig_r_18),
			.widesig_r_19(widesig_r_19),
			.widesig_r_2(widesig_r_2),
			.widesig_r_20(widesig_r_20),
			.widesig_r_21(widesig_r_21),
			.widesig_r_22(widesig_r_22),
			.widesig_r_23(widesig_r_23),
			.widesig_r_24(widesig_r_24),
			.widesig_r_25(widesig_r_25),
			.widesig_r_26(widesig_r_26),
			.widesig_r_27(widesig_r_27),
			.widesig_r_28(widesig_r_28),
			.widesig_r_29(widesig_r_29),
			.widesig_r_3(widesig_r_3),
			.widesig_r_30(widesig_r_30),
			.widesig_r_4(widesig_r_4),
			.widesig_r_5(widesig_r_5),
			.widesig_r_6(widesig_r_6),
			.widesig_r_7(widesig_r_7),
			.widesig_r_8(widesig_r_8),
			.widesig_r_9(widesig_r_9)
		);
		// End of Generated Instance Port Map for inst_a
		// Generated Instance Port Map for inst_b
		inst_b_e inst_b (
			.port_b_1(test1)	// Use internally test1
		);
		// End of Generated Instance Port Map for inst_b
		// Generated Instance Port Map for inst_c
		inst_c_e inst_c (
		);
		// End of Generated Instance Port Map for inst_c
		// Generated Instance Port Map for inst_d
		inst_d_e inst_d (
		);
		// End of Generated Instance Port Map for inst_d
		// Generated Instance Port Map for inst_e
		inst_e_e inst_e (
			.p_mix_unsplice_a1_no3_125_0_gi(unsplice_a1_no3[125:0]),	// leaves 3 unconnected
			.p_mix_unsplice_a1_no3_127_127_gi(unsplice_a1_no3[127]),	// leaves 3 unconnected
			.p_mix_unsplice_a2_all128_127_0_gi(unsplice_a2_all128),	// full 128 bit port
			.p_mix_unsplice_a3_up100_100_0_gi(unsplice_a3_up100[100:0]),	// connect 100 bits from 0
			.p_mix_unsplice_a4_mid100_99_2_gi(unsplice_a4_mid100[99:2]),	// connect mid 100 bits
			.p_mix_unsplice_a5_midp100_99_2_gi(unsplice_a5_midp100[99:2]),	// connect mid 100 bits
			.p_mix_unsplice_bad_a_1_1_gi(unsplice_bad_a[1]),
			.p_mix_unsplice_bad_b_1_0_gi(unsplice_bad_b[1:0]),	// # conflict
			.p_mix_widemerge_a1_31_0_gi(widemerge_a1),
			.p_mix_widesig_r_0_gi(widesig_r_0),
			.p_mix_widesig_r_10_gi(widesig_r_10),
			.p_mix_widesig_r_11_gi(widesig_r_11),
			.p_mix_widesig_r_12_gi(widesig_r_12),
			.p_mix_widesig_r_13_gi(widesig_r_13),
			.p_mix_widesig_r_14_gi(widesig_r_14),
			.p_mix_widesig_r_15_gi(widesig_r_15),
			.p_mix_widesig_r_16_gi(widesig_r_16),
			.p_mix_widesig_r_17_gi(widesig_r_17),
			.p_mix_widesig_r_18_gi(widesig_r_18),
			.p_mix_widesig_r_19_gi(widesig_r_19),
			.p_mix_widesig_r_1_gi(widesig_r_1),
			.p_mix_widesig_r_20_gi(widesig_r_20),
			.p_mix_widesig_r_21_gi(widesig_r_21),
			.p_mix_widesig_r_22_gi(widesig_r_22),
			.p_mix_widesig_r_23_gi(widesig_r_23),
			.p_mix_widesig_r_24_gi(widesig_r_24),
			.p_mix_widesig_r_25_gi(widesig_r_25),
			.p_mix_widesig_r_26_gi(widesig_r_26),
			.p_mix_widesig_r_27_gi(widesig_r_27),
			.p_mix_widesig_r_28_gi(widesig_r_28),
			.p_mix_widesig_r_29_gi(widesig_r_29),
			.p_mix_widesig_r_2_gi(widesig_r_2),
			.p_mix_widesig_r_30_gi(widesig_r_30),
			.p_mix_widesig_r_3_gi(widesig_r_3),
			.p_mix_widesig_r_4_gi(widesig_r_4),
			.p_mix_widesig_r_5_gi(widesig_r_5),
			.p_mix_widesig_r_6_gi(widesig_r_6),
			.p_mix_widesig_r_7_gi(widesig_r_7),
			.p_mix_widesig_r_8_gi(widesig_r_8),
			.p_mix_widesig_r_9_gi(widesig_r_9),
			// __I_NODRV_I .video_i(video_i/__nodrv__),
			.widesig_i(widesig)
		);
		// End of Generated Instance Port Map for inst_e
endmodule