module header
	// Internal signals
	// Generated Signal List
		wire		bidi_pad_di;
		wire		bidi_pad_do;
		wire		bidi_pad_en;
		wire		ext0_pad_di;
		wire		ext1_pad_do;
		wire		ext2_pad_do;
		wire		vec_in_0_pad_di;
		wire		vec_in_1_pad_di;
		wire		vec_in_2_pad_di;
		wire		vec_in_3_pad_di;
		wire		vec_in_4_pad_di;
		wire		vec_in_5_pad_di;
		wire		vec_in_6_pad_di;
		wire		vec_in_7_pad_di;
		wire		vec_out_0_pad_do;
		wire		vec_out_1_pad_do;
		wire		vec_out_2_pad_do;
		wire		vec_out_3_pad_do;
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for lp_bs_i1
		lp_bs lp_bs_i1 (	// LP bs
			.bidi_pad_di(bidi_pad_di),	// from EXTERNALPAD <-> Iocell connect (IO)
			.bidi_pad_do(bidi_pad_do),	// to EXTERNALPAD <-> Iocell connect (IO)
			.bidi_pad_en(bidi_pad_en),	// to EXTERNALPAD <-> Iocell connect (IO)
			.ext0_pad_di(ext0_pad_di),	// from EXTERNALPAD <-> Iocell connect (IO)
			.ext1_pad_do(ext1_pad_do),	// from bluePAD <-> Iocell connect (IO)
			.ext2_pad_do(ext2_pad_do),	// from bluePAD <-> Iocell connect (IO)
			.vec_in_0_pad_di(vec_in_0_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_1_pad_di(vec_in_1_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_2_pad_di(vec_in_2_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_3_pad_di(vec_in_3_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_4_pad_di(vec_in_4_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_5_pad_di(vec_in_5_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_6_pad_di(vec_in_6_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_7_pad_di(vec_in_7_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_out_0_pad_do(vec_out_0_pad_do),	// testPAD <-> Iocell connect (IO)
			.vec_out_1_pad_do(vec_out_1_pad_do),	// testPAD <-> Iocell connect (IO)
			.vec_out_2_pad_do(vec_out_2_pad_do),	// testPAD <-> Iocell connect (IO)
			.vec_out_3_pad_do(vec_out_3_pad_do)	// testPAD <-> Iocell connect (IO)
		);
		// End of Generated Instance Port Map for lp_bs_i1
		// Generated Instance Port Map for lp_padframe_i1
		lp_padframe lp_padframe_i1 (	// LP padframe
			.bidi(bidi),	// PAD <-> Iocell connect (IO)
			.bidi_pad_di(bidi_pad_di),	// from EXTERNALPAD <-> Iocell connect (IO)
			.bidi_pad_do(bidi_pad_do),	// to EXTERNALPAD <-> Iocell connect (IO)
			.bidi_pad_en(bidi_pad_en),	// to EXTERNALPAD <-> Iocell connect (IO)
			.ext0(ext0),	// PAD <-> Iocell connect (IO)
			.ext0_pad_di(ext0_pad_di),	// from EXTERNALPAD <-> Iocell connect (IO)
			.ext1(ext1),	// PAD <-> Iocell connect (IO)
			.ext1_pad_do(ext1_pad_do),	// from bluePAD <-> Iocell connect (IO)
			.ext2(ext2),	// PAD <-> Iocell connect (IO)
			.ext2_pad_do(ext2_pad_do),	// from bluePAD <-> Iocell connect (IO)
			.vec_in_0(vec_in_0),	// PAD <-> Iocell connect (IO)
			.vec_in_0_pad_di(vec_in_0_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_1(vec_in_1),	// PAD <-> Iocell connect (IO)
			.vec_in_1_pad_di(vec_in_1_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_2(vec_in_2),	// PAD <-> Iocell connect (IO)
			.vec_in_2_pad_di(vec_in_2_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_3(vec_in_3),	// PAD <-> Iocell connect (IO)
			.vec_in_3_pad_di(vec_in_3_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_4(vec_in_4),	// PAD <-> Iocell connect (IO)
			.vec_in_4_pad_di(vec_in_4_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_5(vec_in_5),	// PAD <-> Iocell connect (IO)
			.vec_in_5_pad_di(vec_in_5_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_6(vec_in_6),	// PAD <-> Iocell connect (IO)
			.vec_in_6_pad_di(vec_in_6_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_in_7(vec_in_7),	// PAD <-> Iocell connect (IO)
			.vec_in_7_pad_di(vec_in_7_pad_di),	// testPAD <-> Iocell connect (IO)
			.vec_out_0(vec_out_0),	// PAD <-> Iocell connect (IO)
			.vec_out_0_pad_do(vec_out_0_pad_do),	// testPAD <-> Iocell connect (IO)
			.vec_out_1(vec_out_1),	// PAD <-> Iocell connect (IO)
			.vec_out_1_pad_do(vec_out_1_pad_do),	// testPAD <-> Iocell connect (IO)
			.vec_out_2(vec_out_2),	// PAD <-> Iocell connect (IO)
			.vec_out_2_pad_do(vec_out_2_pad_do),	// testPAD <-> Iocell connect (IO)
			.vec_out_3(vec_out_3),	// PAD <-> Iocell connect (IO)
			.vec_out_3_pad_do(vec_out_3_pad_do)	// testPAD <-> Iocell connect (IO)
		);
		// End of Generated Instance Port Map for lp_padframe_i1
endmodule