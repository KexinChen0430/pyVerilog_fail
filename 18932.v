module
		.chanAddr_in(chanAddr),
		.h2fData_in(h2fData),
		.h2fValid_in(h2fValid),
		.h2fReady_out(h2fReady),
		.f2hData_out(f2hData),
		.f2hValid_out(f2hValid),
		.f2hReady_in(f2hReady),
		// External interface
		.sseg_out(sseg_out),
		.anode_out(anode_out),
		.led_out(led_out),
		.sw_in(sw_in)
	);
endmodule