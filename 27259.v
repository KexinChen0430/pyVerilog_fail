module header
	// Internal signals
		// Generated Signal List
			wire  BC_RA_02_fail; // __W_PORT_SIGNAL_MAP_REQ
			//  __I_IN_OPEN wire	[4:4]	cvbs_c_tbo_1	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire	[4:4]	cvbs_c_tbo_2	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire		i2s_ws_en_out1	;  // __W_BAD_BRANCH
			//  __I_OUT_OPEN wire		i2s_ws_out1_in	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire		i2s_ws_out1_out	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire	[5:0]	iom_mux_control	;  // __W_BAD_BRANCH
			//  __I_OUT_OPEN wire	[2:2]	kl_123456a2345b_c	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire		lfsr_out_7	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire	[4:4]	postproc_out_b_tbo	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire	[4:4]	rgb_c_tbo_1	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire	[4:4]	rgb_c_tbo_2	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire		scan_out_7	;  // __W_BAD_BRANCH
			//  __I_OUT_OPEN wire	[6:6]	test_in_0	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire	[6:6]	test_out_0	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire		test_pad_oen_0	;  // __W_BAD_BRANCH
			//  __I_OUT_OPEN wire	[2:2]	ts_adc_samples_1	;  // __W_BAD_BRANCH
			//  __I_OUT_OPEN wire	[2:2]	ts_adc_samples_2	;  // __W_BAD_BRANCH
			//  __I_IN_OPEN wire	[4:4]	ts_intsig1	;  // __W_BAD_BRANCH
		// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
			assign	BC_RA_02_fail = BC_RA_02_fail_i;  // __I_I_BIT_PORT
	// Generated Instances
	// wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for iom_i2s_ws_out1
		wire 	mix_dmy_open_0; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_1; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_2; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_3; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_4; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_5; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_6; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_7; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_8; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_9; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_10; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_11; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_12; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_13; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_14; //__I_OPEN_DUMMY
		iom_24 iom_i2s_ws_out1 (
			.dot_i({ 1'b0, lfsr_out_7, test_out_0, 1'b0, 1'b0, i2s_ws_out1_out, i2s_ws_out1_out, 1'b0, 1'b0, ts_intsig1, rgb_c_tbo_2, rgb_c_tbo_1, cvbs_c_tbo_2, cvbs_c_tbo_1, postproc_out_b_tbo, 1'b0, 1'b0, BC_RA_02_fail, scan_out_7, i2s_ws_out1_out }), // __W_PORT (x7) // __I_BIT_TO_BUSPORT (x13) // __I_COMBINE_SPLICES
			.ena_i({ 1'b0, 1'b1, test_pad_oen_0, 1'b0, 1'b0, i2s_ws_en_out1, i2s_ws_en_out1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, i2s_ws_en_out1 }), // __I_BIT_TO_BUSPORT (x20) // __I_COMBINE_SPLICES
			.ret_o({ mix_dmy_open_6, mix_dmy_open_5, test_in_0, ts_adc_samples_2, ts_adc_samples_1, mix_dmy_open_4, mix_dmy_open_3, mix_dmy_open_2, mix_dmy_open_1, mix_dmy_open_0, mix_dmy_open_14, mix_dmy_open_13, mix_dmy_open_12, mix_dmy_open_11, mix_dmy_open_10, kl_123456a2345b_c, mix_dmy_open_9, mix_dmy_open_8, mix_dmy_open_7, i2s_ws_out1_in }) // __W_PORT (x4) // __I_BIT_TO_BUSPORT (x16) // __I_COMBINE_SPLICES
		);
		// End of Generated Instance Port Map for iom_i2s_ws_out1
endmodule