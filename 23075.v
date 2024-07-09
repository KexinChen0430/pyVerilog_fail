module itself
	spi2 spi2(
		.clock(fclk),
		.sck(sdclk),
		.sdo(sddo ),
		.sdi(sddi ),
		.start(sd_start  ),
		.din  (sd_datain ),
		.dout (sd_dataout),
		.speed(2'b00)
	);
	// control locking/arbitrating between ifaces
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
		avr_lock_out <= 1'b0;
	else // posedge fclk
	begin
		if( sdcs_n )
			avr_lock_out <= avr_lock_in;
	end
	// control cs_n to SDcard
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
		sdcs_n <= 1'b1;
	else // posedge fclk
	begin
		if( avr_lock_out )
			sdcs_n <= avr_sdcs_n;
		else // !avr_lock_out
			if( zx_sdcs_n_stb )
				sdcs_n <= zx_sdcs_n_val;
	end
	// control start and outgoing data to spi2
	assign sd_start = avr_lock_out ? avr_sd_start : zx_sd_start;
	assign sd_datain = avr_lock_out ? avr_sd_datain : zx_sd_datain;
endmodule