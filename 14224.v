module ram_sync_4r2w(
		     input 			      clk,
		     input [BRAM_ADDR_WIDTH-1:0]      raddr1,
		     input [BRAM_ADDR_WIDTH-1:0]      raddr2,
		     input [BRAM_ADDR_WIDTH-1:0]      raddr3,
		     input [BRAM_ADDR_WIDTH-1:0]      raddr4,
		     output wire [BRAM_DATA_WIDTH-1:0] rdata1,
		     output wire [BRAM_DATA_WIDTH-1:0] rdata2,
		     output wire [BRAM_DATA_WIDTH-1:0] rdata3,
		     output wire [BRAM_DATA_WIDTH-1:0] rdata4,
		     input [BRAM_ADDR_WIDTH-1:0]      waddr1,
		     input [BRAM_ADDR_WIDTH-1:0]      waddr2,
		     input [BRAM_DATA_WIDTH-1:0]      wdata1,
		     input [BRAM_DATA_WIDTH-1:0]      wdata2,
		     input 			      we1,
		     input 			      we2
		     );
   parameter BRAM_ADDR_WIDTH = `ADDR_LEN;
   parameter BRAM_DATA_WIDTH = `DATA_LEN;
   parameter DATA_DEPTH      = 32;
   ram_sync_2r2w
     #(BRAM_ADDR_WIDTH, BRAM_DATA_WIDTH, DATA_DEPTH)
   mem0(
	.clk(clk),
	.raddr1(raddr1),
	.raddr2(raddr2),
	.rdata1(rdata1),
	.rdata2(rdata2),
	.waddr1(waddr1),
	.waddr2(waddr2),
	.wdata1(wdata1),
	.wdata2(wdata2),
	.we1(we1),
	.we2(we2)
	);
   ram_sync_2r2w
     #(BRAM_ADDR_WIDTH, BRAM_DATA_WIDTH, DATA_DEPTH)
   mem1(
	.clk(clk),
	.raddr1(raddr3),
	.raddr2(raddr4),
	.rdata1(rdata3),
	.rdata2(rdata4),
	.waddr1(waddr1),
	.waddr2(waddr2),
	.wdata1(wdata1),
	.wdata2(wdata2),
	.we1(we1),
	.we2(we2)
	);
endmodule