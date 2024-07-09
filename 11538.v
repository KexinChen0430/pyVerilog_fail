module async_fifo (
  wrclk, wrreset, rdclk, rdreset,
  // write path
  space_avail, wrenb, wrdata,
  // read path
  read_req, data_avail,
  data_valid, data_out);
parameter ASYNC_FIFO_MAXINDEX = 3;
parameter ASYNC_FIFO_MAXDATA = 31;
parameter ASYNC_FIFO_FULLTHRESHOLD = 4;		// full when only 4 words remain
input wrclk, wrreset;
input rdclk, rdreset;
// Write path...
output space_avail;
input wrenb;
input [ASYNC_FIFO_MAXDATA:0] wrdata;
// Read path...
input read_req;
output data_avail, data_valid;
output [ASYNC_FIFO_MAXDATA:0] data_out;
wire [ASYNC_FIFO_MAXINDEX+1:0] stable_wrptr, stable_rdptr;
wire [ASYNC_FIFO_MAXINDEX:0] ram_wraddr, ram_rdaddr;
wire [ASYNC_FIFO_MAXDATA:0] ram_wrdata, ram_rddata;
// Instantiate RAM...
async_fifo_ram ram (
  wrclk, rdclk,
  ram_wrenb, ram_wraddr, ram_wrdata,
  ram_rdenb, ram_rdaddr, ram_rddata);
defparam ram.ASYNC_FIFO_MAXINDEX = ASYNC_FIFO_MAXINDEX;
defparam ram.ASYNC_FIFO_MAXDATA = ASYNC_FIFO_MAXDATA;
// Instantiate write path...
async_fifo_wrpath wrpath (
  wrclk, wrreset,
  space_avail, wrenb, wrdata,
  ram_wrenb, ram_wraddr, ram_wrdata,
  stable_wrptr, stable_rdptr);
defparam wrpath.ASYNC_FIFO_MAXINDEX = ASYNC_FIFO_MAXINDEX;
defparam wrpath.ASYNC_FIFO_MAXDATA = ASYNC_FIFO_MAXDATA;
defparam wrpath.ASYNC_FIFO_FULLTHRESHOLD = ASYNC_FIFO_FULLTHRESHOLD;
// Instantiate read path...
async_fifo_rdpath rdpath (
  rdclk, rdreset,
  read_req, data_avail,
  data_valid, data_out,
  ram_rdenb, ram_rdaddr, ram_rddata,
  stable_wrptr, stable_rdptr);
defparam rdpath.ASYNC_FIFO_MAXINDEX = ASYNC_FIFO_MAXINDEX;
defparam rdpath.ASYNC_FIFO_MAXDATA = ASYNC_FIFO_MAXDATA;
endmodule