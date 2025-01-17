module header
	// Internal signals
	// Generated Signal List
		wire	[12:0]	c_addr;
		wire	[31:0]	c_bus_in;
		wire	[6:0]	cp_lcmd;
		wire	[6:0]	cp_lcmd_2;
		wire	[6:0]	cp_lcmd_3;
		wire	[12:0]	tmi_sbist_fail;
		wire	[127:0]	unsplice_a1_no3; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_a2_all128; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_a3_up100; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_a4_mid100; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_a5_midp100; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_bad_a; // __W_PORT_SIGNAL_MAP_REQ
		wire	[127:0]	unsplice_bad_b; // __W_PORT_SIGNAL_MAP_REQ
		wire	[5:0]	v_select;
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
		assign	unsplice_a1_no3[125:0]	=	p_mix_unsplice_a1_no3_125_0_gi[125:0];  // __I_I_SLICE_PORT
		assign	unsplice_a1_no3[127]	=	p_mix_unsplice_a1_no3_127_127_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
		assign	unsplice_a2_all128	=	p_mix_unsplice_a2_all128_127_0_gi;  // __I_I_BUS_PORT
		assign	unsplice_a3_up100[100:0]	=	p_mix_unsplice_a3_up100_100_0_gi[100:0];  // __I_I_SLICE_PORT
		assign	unsplice_a4_mid100[99:2]	=	p_mix_unsplice_a4_mid100_99_2_gi[97:0];  // __I_I_SLICE_PORT
		assign	unsplice_a5_midp100[99:2]	=	p_mix_unsplice_a5_midp100_99_2_gi[97:0];  // __I_I_SLICE_PORT
		assign	unsplice_bad_a[1]	=	p_mix_unsplice_bad_a_1_1_gi;  // __I_I_SLICE_PORT // __W_SINGLE_BIT_SLICE
		assign	unsplice_bad_b[1:0]	=	p_mix_unsplice_bad_b_1_0_gi[1:0];  // __I_I_SLICE_PORT
		assign	widemerge_a1	=	p_mix_widemerge_a1_31_0_gi;  // __I_I_BUS_PORT
		assign	widesig	=	widesig_i;  // __I_I_BUS_PORT
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
		// Generated Instance Port Map for inst_ea
		inst_ea_e inst_ea (
			.p_mix_c_addr_12_0_gi(c_addr),
			.p_mix_c_bus_in_31_0_gi(c_bus_in),	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
			.p_mix_cp_lcmd_2_6_6_gi(cp_lcmd_2[6]),	// Second way to wire to zero / GuestBusLBC(memorymappedI/O)Interface
			.p_mix_cp_lcmd_3_6_6_gi(cp_lcmd_3[6]),	// Signal name != port name
			.p_mix_cp_lcmd_6_6_gi(cp_lcmd[6]),	// GuestBusLBC(memorymappedI/O)Interface
			.p_mix_tmi_sbist_fail_11_10_gi(tmi_sbist_fail[11:10]),
			.p_mix_tmi_sbist_fail_9_0_go(tmi_sbist_fail[9:0]),
			.p_mix_unsplice_a1_no3_125_0_gi(unsplice_a1_no3[125:0]),	// leaves 3 unconnected
			.p_mix_unsplice_a1_no3_127_127_gi(unsplice_a1_no3[127]),	// leaves 3 unconnected
			.p_mix_unsplice_a2_all128_127_0_gi(unsplice_a2_all128),	// full 128 bit port
			.p_mix_unsplice_a3_up100_100_0_gi(unsplice_a3_up100[100:0]),	// connect 100 bits from 0
			.p_mix_unsplice_a4_mid100_99_2_gi(unsplice_a4_mid100[99:2]),	// connect mid 100 bits
			.p_mix_unsplice_a5_midp100_99_2_gi(unsplice_a5_midp100[99:2]),	// connect mid 100 bits
			.p_mix_unsplice_bad_a_1_1_gi(unsplice_bad_a[1]),
			.p_mix_unsplice_bad_b_1_0_gi(unsplice_bad_b[1:0]),	// # conflict
			.p_mix_v_select_2_2_gi(v_select[2]),	// RequestBusinterface:RequestBus#6(VPU)VPUinterface
			.p_mix_v_select_5_5_gi(v_select[5]),	// RequestBusinterface:RequestBus#6(VPU)VPUinterface
			.p_mix_widemerge_a1_31_0_gi(widemerge_a1),
			.p_mix_widesig_31_0_gi(widesig),
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
			.video_i(video_i)
		);
		// End of Generated Instance Port Map for inst_ea
		// Generated Instance Port Map for inst_eb
		inst_eb_e inst_eb (
			.p_mix_c_addr_12_0_gi(c_addr),
			.p_mix_c_bus_in_31_0_gi(c_bus_in),	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
			.p_mix_tmi_sbist_fail_12_10_go(tmi_sbist_fail[12:10])
		);
		// End of Generated Instance Port Map for inst_eb
		// Generated Instance Port Map for inst_ec
		inst_ec_e inst_ec (
			.p_mix_c_addr_12_0_gi(c_addr),
			.p_mix_c_bus_in_31_0_gi(c_bus_in),	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
			.p_mix_v_select_2_2_gi(v_select[2]),	// RequestBusinterface:RequestBus#6(VPU)VPUinterface
			.p_mix_v_select_5_5_gi(v_select[5])	// RequestBusinterface:RequestBus#6(VPU)VPUinterface
		);
		// End of Generated Instance Port Map for inst_ec
		// Generated Instance Port Map for inst_ed
		inst_ed_e inst_ed (
			.p_mix_c_addr_12_0_gi(c_addr),
			.p_mix_c_bus_in_31_0_gi(c_bus_in)	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
		);
		// End of Generated Instance Port Map for inst_ed
		// Generated Instance Port Map for inst_ee
		inst_ee_e inst_ee (
			.tmi_sbist_fail(tmi_sbist_fail)
		);
		// End of Generated Instance Port Map for inst_ee
		// Generated Instance Port Map for inst_ef
		inst_ef_e inst_ef (
			.c_addr(c_addr),
			.c_bus_in(c_bus_in),	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
			.cp_lcmd(cp_lcmd),	// GuestBusLBC(memorymappedI/O)Interface
			.cp_lcmd_2(cp_lcmd_2),	// Second way to wire to zero / GuestBusLBC(memorymappedI/O)Interface
			.cp_lcmd_p(cp_lcmd_3)	// Signal name != port name
		);
		// End of Generated Instance Port Map for inst_ef
		// Generated Instance Port Map for inst_eg
		inst_eg_e inst_eg (
			.c_addr(c_addr),
			.c_bus_in(c_bus_in)	// CBUSinterfacecpui/finputsCPUInterface (X2)C-BusinterfaceCPUinterface
		);
		// End of Generated Instance Port Map for inst_eg
endmodule