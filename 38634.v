module is working, I can take this check out since it is
	// internal to the system.  There is no separate read check.
	//The user application (port B) should only read or write values when the
	// run register is high
	//Do not remove these checks since these ports are connected to external signals
	//Notice that this is a 255 location register file.  Location 256 is the run register.
	blk_mem_gen_paramReg register32File(
		.clka(controllerSideClock),
		.dina(rx_reg_value),
		.addra(rx_reg_address),
		.wea((userRunRegisterControllerSide == 0) ? register32InternalWriteEnable : 1'b0),
		.douta(register32InternalReadData),
		.clkb(userInterfaceClock),
		.dinb(register32WriteData),
		.addrb(register32Address),
		.web((userRunRegisterUserSide == 1 && register32CmdReq == 1) ? register32WriteEn : 1'b0),
		.doutb(register32ExternalReadData)
	);
	assign register32ReadData = (userRunRegisterUserSide == 1 && register32ReadDataValid ==1) ? register32ExternalReadData : 32'd0;
	//Handle the handshaking protocol
	//Since we are only using block memory, we will always accept read requests on the same cycle
	// they are sent
	assign register32CmdAck = userRunRegisterUserSide;
	//The block memory will respond on next clock cycle if there was a valid read request issued
	initial begin
		register32ReadDataValid = 0;
	end
	always @(posedge userInterfaceClock) begin
		register32ReadDataValid <= (userRunRegisterUserSide == 1) && (register32CmdReq == 1) && (register32WriteEn == 0);
	end
	//**********SystemACE controller
	// Take care of the inout port
	reg [15:0] sysACE_MPDATA_In;
	wire [15:0] sysACE_MPDATA_Out;
	iobuf16 sysACEIO(
		.IO(sysACE_MPDATA),
		.I(sysACE_MPDATA_In),
		.O(sysACE_MPDATA_Out),
		.T(~sysACE_MPOE && ~sysACE_MPCE)	//Output is active only when the chip is enabled and chip output is enabled
	);
	// Shift the systemACE clock
	wire sysACE_clk_o;
	wire sysACE_delay_clk;
	wire sysACEPllFB;
	wire sysACEPllLock;
	wire sysACEreset;
	PLL_BASE #(
		.COMPENSATION("SYSTEM_SYNCHRONOUS"), 	// "SYSTEM_SYNCHRONOUS",
		.BANDWIDTH("OPTIMIZED"), 					// "HIGH", "LOW" or "OPTIMIZED"
		.CLKFBOUT_MULT(14), 							// Multiplication factor for all output clocks
		.DIVCLK_DIVIDE(1), 							// Division factor for all clocks (1 to 52)
		.CLKFBOUT_PHASE(0),		 					// Phase shift (degrees) of all output clocks
		.REF_JITTER(0.100), 							// Input reference jitter (0.000 to 0.999 UI%)
		.CLKIN_PERIOD(30.303), 						// Clock period (ns) of input clock on CLKIN
		.CLKOUT0_DIVIDE(14), 						// Division factor (1 to 128)
		.CLKOUT0_PHASE(118.929),						// Phase shift (degrees) (0.0 to 360.0)
		.CLKOUT0_DUTY_CYCLE(0.5) 					// Duty cycle (0.01 to 0.99)
	) clkBPLL (
		.CLKOUT0(sysACE_delay_clk),				// 33 MHz phase shifted by 9 ns
		.CLKFBOUT(sysACEPllFB),						// General output feedback signal
		.CLKIN(sysACE_CLK),							// Clock input
		.CLKFBIN(sysACEPllFB), 						// Clock feedback input
		.LOCKED(sysACEPllLock),						// Active high PLL lock signal
		.RST(1'b0)
	);
	assign sysACEreset = reset | ~sysACEPllLock;
	BUFG bufSysACEClk (.O(sysACE_clk_o), .I(sysACE_delay_clk));
	//Instantiate FIFOs between the ethernet controller and the SystemACE
	//Wires to and from fifos
	wire toSysACEFifoEmpty;
	wire [1:0] fifoToSysACECommand;
	wire [6:0] fifoToSysACEAddress;
	wire [15:0] fifoToSysACEData;
	reg fifoToSysACERead;
	wire fromSysACEFifoFull;
	reg sysACEToFifoWrite;
	fifo36Wrapper EthToSysACEFifo(
		.writeClk(controllerSideClock),
		.writeData({ethToFifoCommand, ethToFifoAddress, ethToFifoData}),
		.writeEnable(ethToFifoWrite),
		.full(toSysACEFifoFull),
		.readClk(sysACE_clk_o),
		.readData({fifoToSysACECommand, fifoToSysACEAddress, fifoToSysACEData}),
		.readEnable(fifoToSysACERead),
		.empty(toSysACEFifoEmpty),
		.reset(sysACEreset)
	);
	fifo36Wrapper SysACEToEthFifo(
		.writeClk(sysACE_clk_o),
		.writeData({sysACE_MPADD ,sysACE_MPDATA_Out}),
		.writeEnable(sysACEToFifoWrite),
		.full(fromSysACEFifoFull),
		.readClk(controllerSideClock),
		.readData({fifoToEthAddress, fifoToEthData}),
		.readEnable(fifoToEthRead),
		.empty(fromSysACEFifoEmpty),
		.reset(sysACEreset)
	);
	// SystemACE controller state machine
	localparam	PROCESS_CONFIGFROMCF = 1;		// Writing the values to reboot the system from a specific configuration on the CF
	localparam	PROCESS_SA_WRITE = 2;			// Writing one value out to the SystemACE registers
	localparam	PROCESS_SA_READ = 3;				// Read one value from the SystemACE registers
	//For the ML50X board, the SystemACE seems to come up in 16-bit mode automatically
	//Values used for the control register
	//0) Force MPU lock request - 1 => 0
	//1) Make lock request - 1 => 0
	//2) Override the config address - 1
	//3) Override the config mode pin - 1
	//4) Start the configuration process after reset - 1
	//5) Start the configuration process - 1
	//6) Configure from CF - 0
	//7) Reset the controllers - 1 => 0
	//8) Disable data buffer ready interrupts - 0
	//9) Disable error interrupts - 0
	//10) Disable configuration done interrupts - 0
	//11) Reset the interrupt request line - 0
	//12) not used
	//13-15) configuration address
	localparam FORCECFRESET = 13'b0000010111111;
	localparam FORCECFUNRESET = 13'b0000000111100;
	reg [2:0] sysACE_state;
	reg [2:0] sysACECounter;
	assign sysACE_MPCE = 0;		//Chip is always enabled
	initial begin
		sysACE_MPADD = 0;
		sysACE_MPWE = 0;		//Come up writing a 1 to register 0 of the SystemACE
		sysACE_MPDATA_In = 16'd1;
		sysACE_MPOE = 1;
		sysACE_state = IDLE;
		fifoToSysACERead = 0;
		sysACEToFifoWrite = 0;
	end
	always @(posedge sysACE_clk_o) begin
		if(sysACEreset == 1) begin
			sysACE_MPADD <= 0;
			sysACE_MPWE <= 0;		//Come up writing a 1 to register 0 of the SystemACE to put it into 16-bit mode
			sysACE_MPDATA_In <= 16'd1;
			sysACE_MPOE <= 1;
			sysACE_state <= IDLE;
			fifoToSysACERead <= 0;
			sysACEToFifoWrite <= 0;
		end
		else begin
			case(sysACE_state)
				IDLE: begin
					//We might have come out of reset, in which case we just wrote to register 0
					sysACE_MPWE <= 1;
					//We might have just done a last register read, in which case we have to stop the output
					// and stop writing to the SystemACE to eth fifo.
					sysACE_MPOE <= 1;
					sysACEToFifoWrite	<= 0;
					if(toSysACEFifoEmpty == 0) begin
						//Don't do anything until something shows up in the fifo, then take 1 item out
						fifoToSysACERead <= 1;
						if(fifoToSysACECommand == CONFIGFROMCF) begin
							//Let's start writing the start reconfiguring value to register 0x18
							sysACE_MPADD <= 6'h18;
							sysACE_MPDATA_In <= {fifoToSysACEData[2:0], 13'h00BF};
							sysACE_MPWE <= 0;
							sysACECounter <= 2;
							sysACE_state <= PROCESS_CONFIGFROMCF;
						end
						else if(fifoToSysACECommand == WRITE_SA_REG) begin
							//Let's start writing to the appropriate register
							sysACE_MPADD <= fifoToSysACEAddress;
							sysACE_MPDATA_In <= fifoToSysACEData;
							sysACE_MPWE <= 0;
							sysACE_state <= PROCESS_SA_WRITE;
						end
						else if(fifoToSysACECommand == READ_SA_REG) begin
							//Let's start reading from the appropriate register
							sysACE_MPADD <= fifoToSysACEAddress;
							sysACE_MPOE <= 0;
							sysACE_state <= PROCESS_SA_READ;
						end
					end
				end
				PROCESS_CONFIGFROMCF: begin
					//Stop reading from the fifo
					fifoToSysACERead <= 0;
					sysACECounter <= sysACECounter - 1;
					sysACE_MPWE <= ~sysACE_MPWE;
					if(sysACECounter == 2) begin
						//Write the stop resetting value to register 0x18 during the next cycle
						sysACE_MPDATA_In <= {fifoToSysACEData[2:0], 13'h003C};
					end
					if(sysACECounter == 0) begin
						sysACE_state <= IDLE;
					end
				end
				PROCESS_SA_WRITE: begin
					//Stop reading from the fifo
					fifoToSysACERead <= 0;
					//Stop writing to the register
					sysACE_state <= IDLE;
					sysACE_MPWE <= 1;
				end
				PROCESS_SA_READ: begin
					//Stop reading from the fifo
					fifoToSysACERead <= 0;
					//If there is space in the outgoing fifo, put the value read from the SystemACE in
					if(fromSysACEFifoFull == 0) begin
						//Write the value we get back from the SystemACE into the fifo in the next cycle
						sysACEToFifoWrite	<= 1;
						sysACE_state <= IDLE;
					end
				end
			endcase
		end
	end
endmodule