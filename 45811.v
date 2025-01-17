module tb_memory();
	localparam HCLK = 5;
	localparam PCLK = 2*HCLK;	/* Clock period */
	reg clk;
	reg nrst;
	reg [`ADDR_WIDTH-1:0]	MAddr;
	reg [2:0]		MCmd;
	reg [`DATA_WIDTH-1:0]	MData;
	reg [`BEN_WIDTH-1:0]	MByteEn;
	wire			SCmdAccept;
	wire [`DATA_WIDTH-1:0]	SData;
	wire [1:0]		SResp;
	always
		#HCLK clk = !clk;
	/* Issue bus read */
	task bus_read;
	input [`ADDR_WIDTH-1:0] addr;
	begin
		@(posedge clk)
		begin
			MAddr <= addr;
			MByteEn <= 4'hf;
			MCmd <= `OCP_CMD_READ;
		end
		@(posedge clk)
		begin
			MAddr <= 0;
			MByteEn <= 4'h0;
			MCmd <= `OCP_CMD_IDLE;
		end
	end
	endtask
	/* Issue bus write */
	task bus_write;
	input [`ADDR_WIDTH-1:0] addr;
	input [`DATA_WIDTH-1:0] data;
	input [`BEN_WIDTH-1:0] ben;
	begin
		@(posedge clk)
		begin
			MAddr <= addr;
			MData <= data;
			MByteEn <= ben;
			MCmd <= `OCP_CMD_WRITE;
		end
		@(posedge clk)
		begin
			MAddr <= 0;
			MData <= 0;
			MByteEn <= 4'h0;
			MCmd <= `OCP_CMD_IDLE;
		end
	end
	endtask
	initial
	begin
		/* Set tracing */
		$dumpfile(`TRACE_FILE);
		$dumpvars(0, tb_memory);
		clk = 1;
		nrst = 0;
		MAddr = 0;
		MData = 0;
		MByteEn = 0;
		MCmd = 0;
		#(10*PCLK) nrst = 1;
		#(2*PCLK)
		/* Write data to address 0 */
		bus_write(32'h0000_0000, 32'hdead_beef, 4'hf);
		/* Read data at address 0 */
		bus_read(32'h0000_0000);
		/* Write data to address 0 with byte enables (two low bytes only) */
		bus_write(32'h0000_0000, 32'hbeef_dead, 4'h3);
		/* Read data at address 0 */
		bus_read(32'h0000_0000);
		/* Read data at address 4 */
		bus_read(32'h0000_0004);
		#500 $finish;
	end
	/* Instantiate memory */
	memory mem(
		.clk(clk),
		.nrst(nrst),
		.i_MAddr(MAddr),
		.i_MCmd(MCmd),
		.i_MData(MData),
		.i_MByteEn(MByteEn),
		.o_SCmdAccept(SCmdAccept),
		.o_SData(SData),
		.o_SResp(SResp)
	);
endmodule