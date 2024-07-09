module header
	// Internal signals
	// Generated Signal List
		wire	[2:0]	non_open;
		wire		non_open_bit;
		wire	[3:0]	wire_open;
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for inst_a
		wire [3:0] mix_dmy_open_0; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_1; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_2; //__I_OPEN_DUMMY
		wire 	mix_dmy_open_3; //__I_OPEN_DUMMY
		wire [2:0] mix_dmy_open_4; //__I_OPEN_DUMMY
		inst_a_e inst_a (
			.open_bit(),
			.open_bus(),
			.open_bus_9(),
			.open_in_bit_11(),
			.open_in_bus_10(),
			.open_part12({ non_open_bit, mix_dmy_open_0, non_open }), // __W_PORT	// from 5 to 3 // __W_PORT // __I_BIT_TO_BUSPORT // __I_COMBINE_SPLICES
			.open_part13({ mix_dmy_open_3, non_open_bit, mix_dmy_open_2, mix_dmy_open_1, non_open }), // __W_PORT // __I_BIT_TO_BUSPORT (x4) // __I_COMBINE_SPLICES
			.openport14(),	// check width and type
			.wire_open({ mix_dmy_open_4, wire_open }), // __W_PORT (x2) // __I_COMBINE_SPLICES
			.wire_open_in(wire_open)
		);
		// End of Generated Instance Port Map for inst_a
		// Generated Instance Port Map for inst_b
		inst_b_e inst_b (
			.mix_key_open(),	// replace name
			.non_open(non_open),
			.non_open_bit(non_open_bit),
			.open_bit_2(),
			.open_bit_3(),
			.open_bit_4()
		);
		// End of Generated Instance Port Map for inst_b
endmodule