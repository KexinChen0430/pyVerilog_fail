module.
	input  [15:0] Datain , // Data to   Stack/Queue.
	output [15:0] Dataout, // Data from Stack/Queue.
	output Full,  // Stack is Full  Signal, High = True.
	output Empty  // Stack is Empty Signal, High = True.
    );
	//Parameters
	parameter MODE  = 0                 ; // Mode Selection: 0 for Stack mode, 1 for Queue mode.
	parameter DEPTH = (1 << ADDR_WIDTH) ; // Stack/Queue Size
	parameter SIZE  = 8                 ; // Word Size (8-32 bits)
	parameter ADDR_WIDTH = 3            ; // Address Size
	//Internal variables
	reg  [ADDR_WIDTH-1:0] wr_pointer;
	reg  [ADDR_WIDTH-1:0] rd_pointer;
	reg  [ADDR_WIDTH  :0] status_cnt;
	reg  [SIZE-1:0] data_out ;
	wire [SIZE-1:0] data_ram ;
	//Inputs,Outputs
	//Wires
	//Internal Circuitry
	//Ram Instantiation
	ram #(
		.dat_width(SIZE),
		.adr_width(ADDR_WIDTH),
		.mem_size (DEPTH)
	) XIFO_RAM(
			.dat_i(data_ram)       ,
			.dat_o(Dataout)        ,
			.adr_wr_i(wr_pointer)  ,
			.adr_rd_i(rd_pointer)  ,
			.we_i(Wren)            ,
			.rde_i(Rden)           ,
			.clk(Rdclk)
	);
endmodule