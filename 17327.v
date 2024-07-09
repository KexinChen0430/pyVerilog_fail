module tb_micro_uart();
	localparam HCLK = 5;
	localparam PCLK = 2*HCLK;	/* Clock period */
	/* Micro UART register offsets */
	localparam [`ADDR_WIDTH-1:0] CHARREG = 32'h000;	/* Character register */
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
	begin
		@(posedge clk)
		begin
			MAddr <= addr;
			MData <= data;
			MByteEn <= 4'hf;
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
		$dumpvars(0, tb_micro_uart);
		clk = 1;
		nrst = 0;
		MAddr = 0;
		MData = 0;
		MByteEn = 0;
		MCmd = 0;
		#(10*PCLK) nrst = 1;
		#(2*PCLK)
		/* Read char register */
		bus_read(CHARREG);
		/* Write char register */
		bus_write(CHARREG, "H");
		bus_write(CHARREG, "e");
		bus_write(CHARREG, "l");
		bus_write(CHARREG, "l");
		bus_write(CHARREG, "o");
		bus_write(CHARREG, "\n");
		#500 $finish;
	end
	/* Instantiate micro UART */
	micro_uart uart(
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