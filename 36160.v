module WcaPortNull(
	 //Port Controller interface.
	 inout  [31:0]  						pifData,		// 32 bit port interface data bus.
	 input  wire [(NBITS_ADDR+2):0] 	portCtrl, 	// Port State Control bits {addr[NBITS_ADDR:0], read, write, clk }
	 output wire [1:0]				  	portCmd  	// Port Command ID
    );
parameter ADDR_PORT = 0;
parameter NBITS_ADDR = 2;
	wire   isAddr  = (ADDR_PORT == portCtrl[NBITS_ADDR+2:3]);
	assign portCmd =  (isAddr ) ? `PIFCMD_IDLE : 2'bz;
endmodule