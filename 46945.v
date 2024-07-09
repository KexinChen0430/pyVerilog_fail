module chip_top_test;
	/********** üoÍM **********/
	// NbN & Zbg
	reg						clk_ref;	   // îêNbN
	reg						reset_sw;	   // O[oZbg
	// UART
`ifdef IMPLEMENT_UART // UARTÀ
	wire					uart_rx;	   // UARTóMM
	wire					uart_tx;	   // UARTMM
`endif
	// ÄpüoÍ|[g
`ifdef IMPLEMENT_GPIO // GPIOÀ
`ifdef GPIO_IN_CH	 // üÍ|[gÌÀ
	wire [`GPIO_IN_CH-1:0]	gpio_in = {`GPIO_IN_CH{1'b0}}; // üÍ|[g
`endif
`ifdef GPIO_OUT_CH	 // oÍ|[gÌÀ
	wire [`GPIO_OUT_CH-1:0] gpio_out;					   // oÍ|[g
`endif
`ifdef GPIO_IO_CH	 // üoÍ|[gÌÀ
	wire [`GPIO_IO_CH-1:0]	gpio_io = {`GPIO_IO_CH{1'bz}}; // üoÍ|[g
`endif
`endif
	/********** UARTf **********/
`ifdef IMPLEMENT_UART // UARTÀ
	wire					 rx_busy;		  // óMtO
	wire					 rx_end;		  // óM®¹M
	wire [`ByteDataBus]		 rx_data;		  // óMf[^
`endif
	/********** V~[VTCN **********/
	parameter				 STEP = 100.0000; // 10 M
	/********** NbN¶¬ **********/
	always #( STEP / 2 ) begin
		clk_ref <= ~clk_ref;
	end
	/********** chip_topÌCX^X» **********/
	chip_top chip_top (
		/********** NbN & Zbg **********/
		.clk_ref	(clk_ref), // îêNbN
		.reset_sw	(reset_sw) // O[oZbg
		/********** UART **********/
`ifdef IMPLEMENT_UART // UARTÀ
		, .uart_rx	(uart_rx)  // UARTóMM
		, .uart_tx	(uart_tx)  // UARTMM
`endif
	/********** ÄpüoÍ|[g **********/
`ifdef IMPLEMENT_GPIO // GPIOÀ
`ifdef GPIO_IN_CH			   // üÍ|[gÌÀ
		, .gpio_in	(gpio_in)  // üÍ|[g
`endif
`ifdef GPIO_OUT_CH	 // oÍ|[gÌÀ
		, .gpio_out (gpio_out) // oÍ|[g
`endif
`ifdef GPIO_IO_CH	 // üoÍ|[gÌÀ
		, .gpio_io	(gpio_io)  // üoÍ|[g
`endif
`endif
);
	/********** GPIOÌj^O **********/
`ifdef IMPLEMENT_GPIO // GPIOÀ
`ifdef GPIO_IN_CH	 // üÍ|[gÌÀ
	always @(gpio_in) begin	 // gpio_inªÏ»µ½çlðvg
		$display($time, " gpio_in changed  : %b", gpio_in);
	end
`endif
`ifdef GPIO_OUT_CH	 // oÍ|[gÌÀ
	always @(gpio_out) begin // gpio_outªÏ»µ½çlðvg
		$display($time, " gpio_out changed : %b", gpio_out);
	end
`endif
`ifdef GPIO_IO_CH	 // üoÍ|[gÌÀ
	always @(gpio_io) begin // gpio_ioªÏ»µ½çlðvg
		$display($time, " gpio_io changed  : %b", gpio_io);
	end
`endif
`endif
	/********** UARTfÌCX^X» **********/
`ifdef IMPLEMENT_UART // UARTÀ
	/********** óMM **********/
	assign uart_rx = `HIGH;		// ACh
//	  assign uart_rx = uart_tx; // [vobN
	/********** UARTf **********/
	uart_rx uart_model (
		/********** NbN & Zbg **********/
		.clk	  (chip_top.clk),		 // NbN
		.reset	  (chip_top.chip_reset), // ñ¯úZbg
		/********** §äM **********/
		.rx_busy  (rx_busy),			 // óMtO
		.rx_end	  (rx_end),				 // óM®¹M
		.rx_data  (rx_data),			 // óMf[^
		/********** Receive Signal **********/
		.rx		  (uart_tx)				 // UARTóMM
	);
	/********** MMÌj^O **********/
	always @(posedge chip_top.clk) begin
		if (rx_end == `ENABLE) begin // óMµ½ç¶ðoÍ
			$write("%c", rx_data);
		end
	end
`endif
	/********** eXgV[PX **********/
	initial begin
		# 0 begin
			clk_ref	 <= `HIGH;
			reset_sw <= `RESET_ENABLE;
		end
		# ( STEP / 2 )
		# ( STEP / 4 ) begin		  // C[WÌÇÝÝ
			$readmemh(`ROM_PRG, chip_top.chip.rom.x_s3e_sprom.mem);
			$readmemh(`SPM_PRG, chip_top.chip.cpu.spm.x_s3e_dpram.mem);
		end
		# ( STEP * 20 ) begin		  // ZbgÌð
			reset_sw <= `RESET_DISABLE;
		end
		# ( STEP * `SIM_CYCLE ) begin // V~[VÌÀs
			$finish;
		end
	end
	/********** g`ÌoÍ **********/
	initial begin
		$dumpfile("chip_top.vcd");
		$dumpvars(0, chip_top);
	end
endmodule