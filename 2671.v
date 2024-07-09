module
	clock_generator my_clock_gen(
		// inputs
		clock2_50,
		reset,
		// outputs
		aud_xck
	);
	audio_and_video_config cfg(
		// Inputs
		clock50,
		reset,
		// Bidirectionals
		fpga_i2c_sdat,
		fpga_i2c_sclk
	);
	audio_codec codec(
		// Inputs
		clock50,
		reset,
		read,	write,
		writedata_left, writedata_right,
		aud_adcdat,
		// Bidirectionals
		aud_bclk,
		aud_adclrck,
		aud_daclrck,
		// Outputs
		read_ready, write_ready,
		readdata_left, readdata_right,
		aud_dacdat
	);
endmodule