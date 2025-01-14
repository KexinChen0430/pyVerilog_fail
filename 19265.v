module header
	// Internal signals
	// Generated Signal List
		wire	[12:0]	c_addr; // __W_PORT_SIGNAL_MAP_REQ
		wire	[31:0]	c_bus_in; // __W_PORT_SIGNAL_MAP_REQ
		wire	[6:0]	cp_lcmd; // __W_PORT_SIGNAL_MAP_REQ
		wire	[6:0]	cp_lcmd_2; // __W_PORT_SIGNAL_MAP_REQ
		wire	[5:0]	cp_lcmd_2_tolow;
		wire	[6:0]	cp_lcmd_3; // __W_PORT_SIGNAL_MAP_REQ
		wire	[12:0]	tmi_sbist_fail; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_a1_no3; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_a2_all128; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_a3_up100; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_a4_mid100; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_a5_midp100; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_bad_a; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_bad_b; // __W_PORT_SIGNAL_MAP_REQ
		wire	[5:0]	v_select; // __W_PORT_SIGNAL_MAP_REQ
		wire	[31:0]	widemerge_a1; // __W_PORT_SIGNAL_MAP_REQ
		wire	[31:0]	widesig; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_0; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_1; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_10; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_11; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_12; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_13; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_14; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_15; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_16; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_17; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_18; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_19; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_2; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_20; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_21; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_22; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_23; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_24; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_25; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_26; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_27; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_28; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_29; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_3; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_30; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_4; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_5; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_6; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_7; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_8; // __W_PORT_SIGNAL_MAP_REQ
		wire		widesig_r_9; // __W_PORT_SIGNAL_MAP_REQ
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	c_addr	=	p_mix_c_addr_12_0_gi;  // __I_I_BUS_PORT
		assign	c_bus_in	=	p_mix_c_bus_in_31_0_gi;  // __I_I_BUS_PORT
		assign	cp_lcmd[6]	=	p_mix_cp_lcmd_6_6_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
		assign	cp_lcmd_2[6]	=	p_mix_cp_lcmd_2_6_6_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
		assign	cp_lcmd_2_tolow	= `cp_lcmd_2_tolow_c;
		assign	cp_lcmd_3[6]	=	p_mix_cp_lcmd_3_6_6_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
		assign	tmi_sbist_fail[11:10]	=	p_mix_tmi_sbist_fail_11_10_gi[1:0];  // __I_I_SLICE_PORT
		assign	p_mix_tmi_sbist_fail_9_0_go[9:0]	=	tmi_sbist_fail[9:0];  // __I_O_SLICE_PORT
		assign	unsplice_a1_no3[125:0]	=	p_mix_unsplice_a1_no3_125_0_gi[125:0];  // __I_I_SLICE_PORT
		assign	unsplice_a1_no3[127]	=	p_mix_unsplice_a1_no3_127_127_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
		assign	unsplice_a2_all128	=	p_mix_unsplice_a2_all128_127_0_gi;  // __I_I_BUS_PORT
		assign	unsplice_a3_up100[100:0]	=	p_mix_unsplice_a3_up100_100_0_gi[100:0];  // __I_I_SLICE_PORT
		assign	unsplice_a4_mid100[99:2]	=	p_mix_unsplice_a4_mid100_99_2_gi[97:0];  // __I_I_SLICE_PORT
		assign	unsplice_a5_midp100[99:2]	=	p_mix_unsplice_a5_midp100_99_2_gi[97:0];  // __I_I_SLICE_PORT
		assign	unsplice_bad_a[1]	=	p_mix_unsplice_bad_a_1_1_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
		assign	unsplice_bad_b[1:0]	=	p_mix_unsplice_bad_b_1_0_gi[1:0];  // __I_I_SLICE_PORT
		assign	v_select[5]	=	p_mix_v_select_5_5_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
		assign	v_select[2]	=	p_mix_v_select_2_2_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
		assign	widemerge_a1	=	p_mix_widemerge_a1_31_0_gi;  // __I_I_BUS_PORT
		assign	widesig	=	p_mix_widesig_31_0_gi;  // __I_I_BUS_PORT
		assign	widesig_r_0	=	p_mix_widesig_r_0_gi;  // __I_I_BIT_PORT
		assign	widesig_r_1	=	p_mix_widesig_r_1_gi;  // __I_I_BIT_PORT
		assign	widesig_r_10	=	p_mix_widesig_r_10_gi;  // __I_I_BIT_PORT
		assign	widesig_r_11	=	p_mix_widesig_r_11_gi;  // __I_I_BIT_PORT
		assign	widesig_r_12	=	p_mix_widesig_r_12_gi;  // __I_I_BIT_PORT
		assign	widesig_r_13	=	p_mix_widesig_r_13_gi;  // __I_I_BIT_PORT
		assign	widesig_r_14	=	p_mix_widesig_r_14_gi;  // __I_I_BIT_PORT
		assign	widesig_r_15	=	p_mix_widesig_r_15_gi;  // __I_I_BIT_PORT
		assign	widesig_r_16	=	p_mix_widesig_r_16_gi;  // __I_I_BIT_PORT
		assign	widesig_r_17	=	p_mix_widesig_r_17_gi;  // __I_I_BIT_PORT
		assign	widesig_r_18	=	p_mix_widesig_r_18_gi;  // __I_I_BIT_PORT
		assign	widesig_r_19	=	p_mix_widesig_r_19_gi;  // __I_I_BIT_PORT
		assign	widesig_r_2	=	p_mix_widesig_r_2_gi;  // __I_I_BIT_PORT
		assign	widesig_r_20	=	p_mix_widesig_r_20_gi;  // __I_I_BIT_PORT
		assign	widesig_r_21	=	p_mix_widesig_r_21_gi;  // __I_I_BIT_PORT
		assign	widesig_r_22	=	p_mix_widesig_r_22_gi;  // __I_I_BIT_PORT
		assign	widesig_r_23	=	p_mix_widesig_r_23_gi;  // __I_I_BIT_PORT
		assign	widesig_r_24	=	p_mix_widesig_r_24_gi;  // __I_I_BIT_PORT
		assign	widesig_r_25	=	p_mix_widesig_r_25_gi;  // __I_I_BIT_PORT
		assign	widesig_r_26	=	p_mix_widesig_r_26_gi;  // __I_I_BIT_PORT
		assign	widesig_r_27	=	p_mix_widesig_r_27_gi;  // __I_I_BIT_PORT
		assign	widesig_r_28	=	p_mix_widesig_r_28_gi;  // __I_I_BIT_PORT
		assign	widesig_r_29	=	p_mix_widesig_r_29_gi;  // __I_I_BIT_PORT
		assign	widesig_r_3	=	p_mix_widesig_r_3_gi;  // __I_I_BIT_PORT
		assign	widesig_r_30	=	p_mix_widesig_r_30_gi;  // __I_I_BIT_PORT
		assign	widesig_r_4	=	p_mix_widesig_r_4_gi;  // __I_I_BIT_PORT
		assign	widesig_r_5	=	p_mix_widesig_r_5_gi;  // __I_I_BIT_PORT
		assign	widesig_r_6	=	p_mix_widesig_r_6_gi;  // __I_I_BIT_PORT
		assign	widesig_r_7	=	p_mix_widesig_r_7_gi;  // __I_I_BIT_PORT
		assign	widesig_r_8	=	p_mix_widesig_r_8_gi;  // __I_I_BIT_PORT
		assign	widesig_r_9	=	p_mix_widesig_r_9_gi;  // __I_I_BIT_PORT
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_eaa
		inst_eaa_e inst_eaa (
			.c_addr_i(c_addr),
			.c_bus_i(c_bus_in),	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
			.mbist_clut_fail_o(tmi_sbist_fail[8]),
			.mbist_fifo_fail_o(tmi_sbist_fail[9]),
			.unsplice_a1_no3[127:4](unsplice_a1_no3[125:2]), 	// leaves 3 unconnected// __E_CANNOT_COMBINE_SPLICES
			.unsplice_a1_no3[1:0](unsplice_a1_no3[1:0]), 	// leaves 3 unconnected// __E_CANNOT_COMBINE_SPLICES
			.unsplice_a1_no3[2](unsplice_a1_no3[127]), 	// leaves 3 unconnected// __E_CANNOT_COMBINE_SPLICES
			.unsplice_a2_all128(unsplice_a2_all128),	// full 128 bit port
			.unsplice_a3_up100(unsplice_a3_up100[100:0]),	// connect 100 bits from 0
			.unsplice_a4_mid100(unsplice_a4_mid100[99:2]),	// connect mid 100 bits
			.unsplice_a5_midp100(unsplice_a5_midp100[99:2]),	// connect mid 100 bits
			.unsplice_bad_b({ unsplice_bad_b[1:0], unsplice_bad_b[1:0] }), // 	// # conflict (x2) // __I_COMBINE_SPLICES
			.video_p_0(video_i[0]),
			.widemerge_a1_p(widemerge_a1),
			.widesig_p({ widesig_r_30, widesig_r_29, widesig_r_28, widesig_r_27, widesig_r_26, widesig_r_25, widesig_r_24, widesig_r_23, widesig_r_22, widesig_r_21, widesig_r_20, widesig_r_19, widesig_r_18, widesig_r_17, widesig_r_16, widesig_r_15, widesig_r_14, widesig_r_13, widesig_r_12, widesig_r_11, widesig_r_10, widesig_r_9, widesig_r_8, widesig_r_7, widesig_r_6, widesig_r_5, widesig_r_4, widesig_r_3, widesig_r_2, widesig_r_1, widesig_r_0 }), // __I_BIT_TO_BUSPORT (x31) // __I_COMBINE_SPLICES
			.widesig_p_0(widesig[0]),
			.widesig_p_1(widesig[1]),
			.widesig_p_10(widesig[10]),
			.widesig_p_11(widesig[11]),
			.widesig_p_12(widesig[12]),
			.widesig_p_13(widesig[13]),
			.widesig_p_14(widesig[14]),
			.widesig_p_15(widesig[15]),
			.widesig_p_16(widesig[16]),
			.widesig_p_17(widesig[17]),
			.widesig_p_18(widesig[18]),
			.widesig_p_19(widesig[19]),
			.widesig_p_2(widesig[2]),
			.widesig_p_20(widesig[20]),
			.widesig_p_21(widesig[21]),
			.widesig_p_22(widesig[22]),
			.widesig_p_23(widesig[23]),
			.widesig_p_24(widesig[24]),
			.widesig_p_25(widesig[25]),
			.widesig_p_26(widesig[26]),
			.widesig_p_27(widesig[27]),
			.widesig_p_28(widesig[28]),
			.widesig_p_29(widesig[29]),
			.widesig_p_3(widesig[3]),
			.widesig_p_30(widesig[30]),
			.widesig_p_31(widesig[31]),
			.widesig_p_4(widesig[4]),
			.widesig_p_5(widesig[5]),
			.widesig_p_6(widesig[6]),
			.widesig_p_7(widesig[7]),
			.widesig_p_8(widesig[8]),
			.widesig_p_9(widesig[9])
			// __E_PRINTCONN unsplice_bad_a => unsplice_bad_a
		);
		// End of Generated Instance Port Map for inst_eaa
		// Generated Instance Port Map for inst_eab
		inst_eab_e inst_eab (
			.c_add(c_addr),
			.c_bus_in(c_bus_in),	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
			.v_select({ v_select[5], 1'b0, 1'b0, v_select[2], 1'b0, 1'b0 }), // 	// RequestBusinterface:RequestBus#6(VPU)VPUinterface (x2) // __I_BIT_TO_BUSPORT (x4) // __I_COMBINE_SPLICES
			.video_p_1(video_i[1])
		);
		// End of Generated Instance Port Map for inst_eab
		// Generated Instance Port Map for inst_eac
		inst_eac_e inst_eac (
			.adp_bist_fail(tmi_sbist_fail[0]),
			.c_addr(c_addr),
			.c_bus_in(c_bus_in),	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
			.cp_lcmd({ cp_lcmd[6], 6'b000000 }), // __W_PORT // 	// GuestBusLBC(memorymappedI/O)Interface // __I_COMBINE_SPLICES
			.cp_lcmd_2({ cp_lcmd_2[6], cp_lcmd_2_tolow }), // __W_PORT // 	// Second way to wire to zero / GuestBusLBC(memorymappedI/O)Interface // __I_COMBINE_SPLICES
			.cp_lcmd_p({ cp_lcmd_3[6], 6'b000000 }), // __W_PORT // 	// Signal name != port name // __I_COMBINE_SPLICES
			.cpu_bist_fail(tmi_sbist_fail[1]),
			.cvi_sbist_fail0(tmi_sbist_fail[10]),
			.cvi_sbist_fail1(tmi_sbist_fail[11]),
			.ema_bist_fail(tmi_sbist_fail[7]),
			.ga_sbist_fail0(tmi_sbist_fail[8]),
			.ga_sbist_fail1(tmi_sbist_fail[9]),
			.ifu_bist_fail(tmi_sbist_fail[6]),
			.mcu_bist_fail(tmi_sbist_fail[2]),
			.pdu_bist_fail0(tmi_sbist_fail[3]),
			.pdu_bist_fail1(tmi_sbist_fail[4]),
			.tsd_bist_fail(tmi_sbist_fail[5]),
			.video_p_2(video_i[2])
		);
		// End of Generated Instance Port Map for inst_eac
		// Generated Instance Port Map for inst_ead
		inst_ead_e inst_ead (
			.video_p_3(video_i[3])
		);
		// End of Generated Instance Port Map for inst_ead
endmodule