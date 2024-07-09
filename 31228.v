module ram_sync_4r1w #(
		       parameter BRAM_ADDR_WIDTH = `ADDR_LEN,
		       parameter BRAM_DATA_WIDTH = `DATA_LEN,
		       parameter DATA_DEPTH      = 32
		       )
   (
    input wire 			      clk,
    input wire [BRAM_ADDR_WIDTH-1:0]  raddr1,
    input wire [BRAM_ADDR_WIDTH-1:0]  raddr2,
    input wire [BRAM_ADDR_WIDTH-1:0]  raddr3,
    input wire [BRAM_ADDR_WIDTH-1:0]  raddr4,
    output wire [BRAM_DATA_WIDTH-1:0] rdata1,
    output wire [BRAM_DATA_WIDTH-1:0] rdata2,
    output wire [BRAM_DATA_WIDTH-1:0] rdata3,
    output wire [BRAM_DATA_WIDTH-1:0] rdata4,
    input wire [BRAM_ADDR_WIDTH-1:0]  waddr,
    input wire [BRAM_DATA_WIDTH-1:0]  wdata,
    input wire 			      we
    );
   ram_sync_2r1w
     #(BRAM_ADDR_WIDTH, BRAM_DATA_WIDTH, DATA_DEPTH)
   mem0(
	.clk(clk),
	.raddr1(raddr1),
	.raddr2(raddr2),
	.rdata1(rdata1),
	.rdata2(rdata2),
	.waddr(waddr),
	.wdata(wdata),
	.we(we)
	);
   ram_sync_2r1w
     #(BRAM_ADDR_WIDTH, BRAM_DATA_WIDTH, DATA_DEPTH)
   mem1(
	.clk(clk),
	.raddr1(raddr3),
	.raddr2(raddr4),
	.rdata1(rdata3),
	.rdata2(rdata4),
	.waddr(waddr),
	.wdata(wdata),
	.we(we)
	);
endmodule