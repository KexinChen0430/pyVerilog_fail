module header
	// Internal signals
	// Generated Signal List
		wire		clk;
		wire		clk2_i;
		wire		data;
		wire		data2_i;
		wire		ready0;
		wire		ready1;
		wire		ready2_0;
		wire		ready2_1;
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for M0
		m0 M0 (
			.clk2_o(clk2_i),
			.clk_o(clk),
			.data2_o(data2_i),
			.data_o(data),
			.ready0_i(ready0),
			.ready1_i(ready1),
			.ready2_0(ready2_0),
			.ready2_1(ready2_1)
		);
		// End of Generated Instance Port Map for M0
		// Generated Instance Port Map for N0
		n0 N0 (
			.clk2_i_i(clk2_i),
			.clk_i(clk),
			.data2_i_i(data2_i),
			.data_i(data),
			.ready0_o(ready0),
			.ready1_o(ready1),
			.ready2_0_o(ready2_0),
			.ready2_1_o(ready2_1)
		);
		// End of Generated Instance Port Map for N0
endmodule