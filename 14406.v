module
	SircHandler #(
		//Forward parameters to user circuit
		.INMEM_BYTE_WIDTH(INMEM_USER_BYTE_WIDTH),
		.OUTMEM_BYTE_WIDTH(OUTMEM_USER_BYTE_WIDTH),
		.INMEM_ADDRESS_WIDTH(INMEM_USER_ADDRESS_WIDTH),
		.OUTMEM_ADDRESS_WIDTH(OUTMEM_USER_ADDRESS_WIDTH)
	) sh(
      .clk(clk_user_interface),										//For simplicity sake (although it doesn't have to), the entire user circuit can run off of the same
																					//		clock used to synchronize the interface.
      .reset(userLogicReset),											//When this signal is asserted (it is synchronous to userInterfaceClk), the user's circuit should reset
		.userRunValue(userRunValue),										//Read run register value - when this is asserted, the user's circuit has control over the i/o buffers & register file
		.userRunClear(userRunClear),										//Reset run register	- assert this signal for 1 clock cycle to indicate that the user's circuit has completed computation and
																					//		wishes to return control over the i/o buffers and register file back to the controller
		//User interface to parameter register file
		.register32CmdReq(register32CmdReq),							//Parameter register handshaking request signal
		.register32CmdAck(register32CmdAck),							//Parameter register handshaking acknowledgment signal
		.register32WriteData(register32WriteData),					//Parameter register write data
		.register32Address(register32Address),						//Parameter register address
		.register32WriteEn(register32WriteEn),						//Parameter register write enable
		.register32ReadDataValid(register32ReadDataValid),		//Indicates that a read request has returned with data
		.register32ReadData(register32ReadData),						//Parameter register read data
		//User interface to input memory
		.inputMemoryReadReq(inputMemoryReadReq),						//Input memory handshaking request signal - assert to begin a read request
		.inputMemoryReadAck(inputMemoryReadAck),						//Input memory handshaking acknowledgement signal - when the req and ack are both true for 1 clock cycle, the request has been accepted
		.inputMemoryReadAdd(inputMemoryReadAdd),						//Input memory read address - can be set the same cycle that the req line is asserted
		.inputMemoryReadDataValid(inputMemoryReadDataValid),		//After a read request is accepted, this line indicates that the read has returned and that the data is ready
		.inputMemoryReadData(inputMemoryReadData),					//Input memory read data
		//User interface to output memory
		.outputMemoryWriteReq(outputMemoryWriteReq),				//Output memory handshaking request signal - assert to begin a write request
		.outputMemoryWriteAck(outputMemoryWriteAck),				//Output memory handshaking acknowledgement signal - when the req and ack are both true for 1 clock cycle, the request has been accepted
		.outputMemoryWriteAdd(outputMemoryWriteAdd),				//Output memory write address - can be set the same cycle that the req line is asserted
		.outputMemoryWriteData(outputMemoryWriteData),				//Output memory write data
		.outputMemoryWriteByteMask(outputMemoryWriteByteMask),	//Allows byte-wise writes when multibyte words are used - each of the OUTMEM_USER_BYTE_WIDTH line can be 0 (do not write byte) or 1 (write byte)
		//Optional connection to 8 LEDs for debugging, etc.
		.LED(LED),
		.RST(RST),
		.start(start),
		.sw(sw)
		 );
endmodule