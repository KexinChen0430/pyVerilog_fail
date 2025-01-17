module loopbacktest;
	// Inputs
	reg sys_clk;
	reg RTS;
	reg RX;
	// Outputs
	wire CTS;
	wire TX;
	// Instantiate the Unit Under Test (UUT)
	UART_LOOPBACK uut (
		.sys_clk(sys_clk),
		.CTS(CTS),
		.RTS(RTS),
		.TX(TX),
		.RX(RX)
	);
	initial begin
		// Initialize Inputs
		sys_clk = 0;
		RTS = 0;
		RX = 1;
		//RxD_par = 0;
		//RxD_start = 0;
		// Wait 100 ns for global reset to finish
		#5000;
		// Add stimulus here
		#0 RX = 0; //Start bit
		#8680 RX = 0; //bit 0
		#8680 RX = 1; //bit 1
		#8680 RX = 0; //bit 2
		#8680 RX = 1; //bit 3
		#8680 RX = 0; //bit 4
		#8680 RX = 1; //bit 5
		#8680 RX = 0; //bit 6
		#8680 RX = 0; //bit 7
		#8680 RX = 1; //Stop bit
		#8680 RX = 0; //Start bit
		#8680 RX = 1; //bit 0
		#8680 RX = 1; //bit 1
		#8680 RX = 0; //bit 2
		#8680 RX = 1; //bit 3
		#8680 RX = 0; //bit 4
		#8680 RX = 1; //bit 5
		#8680 RX = 0; //bit 6
		#8680 RX = 1; //bit 7
		#8680 RX = 1; //Stop bit
		#8680 RX = 0; //Start bit
		#8680 RX = 1; //bit 0
		#8680 RX = 1; //bit 1
		#8680 RX = 0; //bit 2
		#8680 RX = 1; //bit 3
		#8680 RX = 0; //bit 4
		#8680 RX = 1; //bit 5
		#8680 RX = 0; //bit 6
		#8680 RX = 1; //bit 7
		#8680 RX = 1; //Stop bit
		#8680 RX = 0; //Start bit
		#8680 RX = 1; //bit 0
		#8680 RX = 1; //bit 1
		#8680 RX = 0; //bit 2
		#8680 RX = 1; //bit 3
		#8680 RX = 0; //bit 4
		#8680 RX = 1; //bit 5
		#8680 RX = 0; //bit 6
		#8680 RX = 1; //bit 7
		#8680 RX = 1; //Stop bit
		#20000
		#8680 RX = 0; //Start bit
		#8680 RX = 1; //bit 0
		#8680 RX = 1; //bit 1
		#8680 RX = 0; //bit 2
		#8680 RX = 1; //bit 3
		#8680 RX = 0; //bit 4
		#8680 RX = 1; //bit 5
		#8680 RX = 0; //bit 6
		#8680 RX = 1; //bit 7
		#8680 RX = 1; //Stop bit
	end
	always begin
		#2.5 sys_clk <= !sys_clk;
	end
endmodule