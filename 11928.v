module ram_sync_nolatch_6r2w(
 input wire 			       clk,
 input wire [BRAM_ADDR_WIDTH-1:0]       raddr1,
 input wire [BRAM_ADDR_WIDTH-1:0]       raddr2,
 input wire [BRAM_ADDR_WIDTH-1:0]       raddr3,
 input wire [BRAM_ADDR_WIDTH-1:0]       raddr4,
 input wire [BRAM_ADDR_WIDTH-1:0]       raddr5,
 input wire [BRAM_ADDR_WIDTH-1:0]       raddr6,
 output wire [BRAM_DATA_WIDTH-1:0] rdata1,
 output wire [BRAM_DATA_WIDTH-1:0] rdata2,
 output wire [BRAM_DATA_WIDTH-1:0] rdata3,
 output wire [BRAM_DATA_WIDTH-1:0] rdata4,
 output wire [BRAM_DATA_WIDTH-1:0] rdata5,
 output wire [BRAM_DATA_WIDTH-1:0] rdata6,
 input wire [BRAM_ADDR_WIDTH-1:0]       waddr1,
 input wire [BRAM_ADDR_WIDTH-1:0]       waddr2,
 input wire [BRAM_DATA_WIDTH-1:0]       wdata1,
 input wire [BRAM_DATA_WIDTH-1:0]       wdata2,
 input wire 			       we1,
 input wire 			       we2
 );
 parameter BRAM_ADDR_WIDTH = `ADDR_LEN;
 parameter BRAM_DATA_WIDTH = `DATA_LEN;
 parameter DATA_DEPTH      = 32;
 ram_sync_nolatch_2r2w
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
 ram_sync_nolatch_2r2w
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
 ram_sync_nolatch_2r2w
 #(BRAM_ADDR_WIDTH, BRAM_DATA_WIDTH, DATA_DEPTH)
 mem2(
 .clk(clk),
 .raddr1(raddr5),
 .raddr2(raddr6),
 .rdata1(rdata5),
 .rdata2(rdata6),
 .waddr1(waddr1),
 .waddr2(waddr2),
 .wdata1(wdata1),
 .wdata2(wdata2),
 .we1(we1),
 .we2(we2)
 );
 endmodule