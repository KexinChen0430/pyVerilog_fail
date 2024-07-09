module tb_sim_control();
	localparam HCLK = 5;
	localparam PCLK = 2*HCLK;	/* Clock period */
	/* Control device registers */
	localparam [`ADDR_WIDTH-1:0] CTRLREG = 32'h000;	/* Control register */
	localparam [`ADDR_WIDTH-1:0] DELYREG = 32'h004;	/* Delay register */
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
		$dumpvars(0, tb_sim_control);
		clk = 1;
		nrst = 0;
		MAddr = 0;
		MData = 0;
		MByteEn = 0;
		MCmd = 0;
		#(10*PCLK) nrst = 1;
		#(2*PCLK)
		/* Write control register */
		bus_write(CTRLREG, 32'h000f_fff0);
		/* Read control register */
		bus_read(CTRLREG);
		#(2*PCLK)
		/* Write delay register */
		bus_write(DELYREG, 32'h0000_0008);
		/* Read delay register */
		bus_read(DELYREG);
		#(16*PCLK)
		/* Write control register and finish simulation */
		bus_write(CTRLREG, 32'h0000_0001);	/* Normal termination */
		/* bus_write(CTRLREG, 32'h8000_0001);*/	/* Termination with error */
		#500 $finish;
	end
	/* Instantiate control device */
	sim_control sim_ctl(
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