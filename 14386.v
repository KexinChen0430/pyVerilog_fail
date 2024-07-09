module
	interrupts my_interrupts( .clk_24mhz(clk_24mhz),
	                          .clk_z80(clk_fpga),
	                          .m1_n(m1_n),
	                          .iorq_n(iorq_n),
	                          .int_n(int_n) );
// MP3, SDcard spi modules
	spi2 spi_mp3_data( .clock(clk_fpga),
	                   .sck(mp3_clk),
	                   .sdo(mp3_dat),
	                   .bsync(mp3_sync),
	                   .din(md_din),
	                   .start(md_start),
	                   .speed( {1'b0,md_halfspeed} ),
	                   .sdi(1'b0) );
	spi2 spi_mp3_control( .clock(clk_fpga),
	                      .sck(ma_clk),
	                      .sdo(ma_do),
	                      .sdi(ma_di),
	                      .din(mc_din),
	                      .dout(mc_dout),
	                      .start(mc_start),
	                      .rdy(mc_rdy),
	                      .speed(mc_speed) );
	spi2 spi_sd( .clock(clk_fpga),
	             .sck(sd_clk),
	             .sdo(sd_do),
	             .sdi(sd_di),
	             .din(sd_din),
	             .dout(sd_dout),
	             .start(sd_start),
	             .speed(2'b00) );
endmodule