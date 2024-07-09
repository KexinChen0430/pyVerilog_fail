module header
	// Internal signals
	// Generated Signal List
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for reallity_i1
		reallity reallity_i1 (	// LP reallity
			.extout1_i(ext1_pad_do),	// from bluePAD <-> Iocell connect (IO)
			.extout2_i(ext2_pad_do),	// from bluePAD <-> Iocell connect (IO)
			.gimick_o(reallity_gimick_s),	// from reallityto blue
			.in2_o(reallity_in2_s),	// from reallity (X4)to blue
			.out2_i(blue_out2_s),	// to reallityfrom blue
			.sig_o(),	// to blue
			.tes_i(tes_s),	// to reallityfrom blue
			.test5_i(test5_s),	// to reallityfrom blue
			.test_o(reallity_test_s)	// from reallityto blue
		);
		// End of Generated Instance Port Map for reallity_i1
endmodule