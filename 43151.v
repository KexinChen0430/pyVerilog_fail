module WcaReadPort(
	 input 	wire				reset,
	 input 	wire				port_enable, //Enables/Disable port writing.
	 input 	wire 			 	rd_clk,	// Clock read input..
	 input   wire         	rd_en,  	// Enables reading.
	 output  wire  [31:0] 	rd_out,	// Read Data output.
	 output  wire   			empty,	// Active high indicates buffer is empty.
	 output  wire   			full,		// Active high indicates buffer is full.
	 output  wire   			prog_empty,		// Active high indicates buffer is almost empty (at or below 160 samples).
	 output  wire   			prog_full,		// Active high indicates buffer is almost full (at or above 352 samples).
	 //Port Controller interface.
	 inout  [31:0]  						pifData,		// 32 bit port interface data bus.
	 input  wire [(NBITS_ADDR+2):0] 	portCtrl, 	// Port State Control bits {addr[NBITS_ADDR:0], read, write, clk }
	 output wire [1:0]				  	portCmd  	// Port Command ID
    );
parameter ADDR_PORT  = 0;
parameter NBITS_ADDR = 2;
	wire isAddr  = (ADDR_PORT == portCtrl[NBITS_ADDR+2:3]);
	wire wr_en   =  isAddr & portCtrl[2];
	assign portCmd =  (isAddr ) ? ((prog_empty & port_enable) ? `PIFCMD_READ : `PIFCMD_IDLE) : 2'bz;
	FiFo512Core32W32R fifo512 (
	  .rst(reset), 			// input rst
	  .wr_clk(portCtrl[0]), // input wr_clk
	  .rd_clk(rd_clk), // input rd_clk
	  .din(pifData), // input [31 : 0] din
	  .wr_en(wr_en), // input wr_en
	  .rd_en(rd_en & port_enable), // input rd_en
	  .dout(rd_out), // output [31 : 0] dout
	  .full(full), // output full
	  .empty(empty), // output empty
	  .prog_full(prog_full), // output prog_full threhold at 388 DWORDS
	  .prog_empty(prog_empty) // output prog_empty	 threshold at 256 DWORDS
	);
endmodule