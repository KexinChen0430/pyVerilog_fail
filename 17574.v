module FifoBuffer(
	din,
	rd_clk,
	rd_en,
	rst,
	wr_clk,
	wr_en,
	dout,
	empty,
	full);
input [31 : 0] din;
input rd_clk;
input rd_en;
input rst;
input wr_clk;
input wr_en;
output [31 : 0] dout;
output empty;
output full;
wire full_wire, wr_ack_wire;
async_fifo buffer_fifo (.din(din), .rd_clk(rd_clk), .rd_en(rd_en), .rst(rst), .wr_clk(wr_clk), .wr_en(wr_en), .dout(dout), .full(full_wire), .wr_ack(wr_ack_wire), .empty(empty) );
    defparam buffer_fifo.FIFO_WIDTH = 32;
	defparam buffer_fifo.FIFO_DEPTH = 10;
	defparam buffer_fifo.DEVICE = "7SERIES" ;
 	defparam buffer_fifo.FIFO_RAM_TYPE = "BLOCKRAM";
 //	defparam buffer_fifo.OPTIMIZE = "POWER";
assign full = full_wire;
endmodule