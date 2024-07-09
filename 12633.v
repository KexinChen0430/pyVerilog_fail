module when ps2_ready signals is asserted,
	// note that the key here is still a scan code, and software needs to transform it into a ASCII code
	assign io_read_clk = Clk_CPU;
	PS2_IO 			U12(
					//wb_input
					.dat_i				(s4_dat_o),
					.adr_i				(s4_adr_o),
					.we_i				(s4_we_o),
					.stb_i				(s4_stb_o),
					//wb_output
					.dat_o				(s4_dat_i),
					.ack_o				(s4_ack_i),
					.io_read_clk 		(io_read_clk),
					.clk_ps2 			(clkdiv[0]),
					.rst 				(rst),
					.PS2_clk 			(PS2_clk),
					.PS2_Data 			(PS2_Data),
					//.ps2_rd 			(ps2_rd),
					.ps2_ready 			(ps2_ready),
					.ps2_irq			(ps2_irq),
					.ps2_iack			(ps2_iack),
					.key_d      		(key_d),
					.key 				(key),
					.ps2_key 			(ps2_key)
					);
	uart			U13(
					//wb_input
					.dat_i				(s0_dat_o),
					.adr_i				(s0_adr_o),
					.we_i				(s0_we_o),
					.stb_i				(s0_stb_o),
					//wb_output
					.dat_o				(s0_dat_i),
					.ack_o				(s0_ack_i),
					.sys_clk			(clk_m),
					.sys_rst			(rst),
					.rx_irq				(rx_irq),
					.rx_iack 			(rx_iack),
					.tx_irq				(),
					.uart_rx			(uart_rx),
					.uart_tx			(uart_tx)
					);
endmodule