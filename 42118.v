module header
	// Internal signals
	// Generated Signal List
		wire		signal_aa_ba; // __W_PORT_SIGNAL_MAP_REQ
		wire	[7:0]	signal_bb_ab; // __W_PORT_SIGNAL_MAP_REQ
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	signal_aa_ba	=	p_mix_signal_aa_ba_gi;  // __I_I_BIT_PORT
		assign	p_mix_signal_bb_ab_go	=	signal_bb_ab;  // __I_O_BUS_PORT
udc: THIS ARE TWO LINES in BODY of inst_b_i
SECOND LINE
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_ba_i
		inst_xa_e inst_ba_i (	// mulitple instantiated
			.port_xa_i(signal_aa_ba),	// signal test aa to ba
			.port_xa_o()	// open signal to create port
		);
		// End of Generated Instance Port Map for inst_ba_i
		// Generated Instance Port Map for inst_bb_i
		inst_bb_e inst_bb_i (	// bb instance
			.port_bb_o(signal_bb_ab)	// vector test bb to ab
		);
		// End of Generated Instance Port Map for inst_bb_i
		// Generated Instance Port Map for inst_bc1_i
		inst_vb_e inst_bc1_i (	// verilog udc inst_bc2_i
		);
		// End of Generated Instance Port Map for inst_bc1_i
udc: preinst_udc for inst_bc2_i
		// Generated Instance Port Map for inst_bc2_i
		inst_vb_e inst_bc2_i (	// verilog udc inst_bc2_i
		);
		// End of Generated Instance Port Map for inst_bc2_i
udc: post_inst_udc for inst_bc2_i
		// Generated Instance Port Map for inst_be_i
		inst_be_i inst_be_i (	// no verilog udc here
		);
		// End of Generated Instance Port Map for inst_be_i
		// Generated Instance Port Map for inst_bf_i
		inst_be_i inst_bf_i (	// no verilog udc here
		);
		// End of Generated Instance Port Map for inst_bf_i
endmodule