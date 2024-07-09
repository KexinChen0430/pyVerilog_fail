module async_fifo_rdpath (
  clk, reset,
  read_req, data_avail,
  data_valid, data_out,
  ram_rdenb, ram_rdaddr, ram_rddata,
  stable_wrptr, stable_rdptr);
parameter ASYNC_FIFO_MAXINDEX = 3;
parameter ASYNC_FIFO_MAXDATA = 31;
input clk, reset;
// FIFO interface...
input read_req;
output data_avail, data_valid;
output [ASYNC_FIFO_MAXDATA:0] data_out;
// RAM interface...
output ram_rdenb;
output [ASYNC_FIFO_MAXINDEX:0] ram_rdaddr;
input [ASYNC_FIFO_MAXDATA:0] ram_rddata;
// Sync interface...
input [ASYNC_FIFO_MAXINDEX+1:0] stable_wrptr;
output [ASYNC_FIFO_MAXINDEX+1:0] stable_rdptr;
localparam WIDTH = ASYNC_FIFO_MAXINDEX+2;
`include "gray.v"
// Registers...
reg [ASYNC_FIFO_MAXINDEX+1:0] stable_rdptr, next_stable_rdptr;
reg [ASYNC_FIFO_MAXINDEX+1:0] wrptr, next_wrptr;
reg data_avail, next_data_avail;
reg data_valid, next_data_valid;
reg [ASYNC_FIFO_MAXINDEX+1:0] rdptr, next_rdptr;
reg [ASYNC_FIFO_MAXDATA:0] data_out, next_data_out;
wire ram_rdenb = data_avail;
reg [ASYNC_FIFO_MAXINDEX:0] ram_rdaddr;
wire [ASYNC_FIFO_MAXINDEX+1:0] rdptr_plus1 = rdptr+1'b1;
wire [ASYNC_FIFO_MAXINDEX+1:0] gray_wrptr;
full_synchronizer #(WIDTH) sync_gray_wrptr (clk, reset, stable_wrptr, gray_wrptr);
// Sample stable singals...
initial
begin
  stable_rdptr = 0;
  wrptr = 0;
end
always @ (posedge clk or posedge reset)
begin
  if (reset)
    begin
      stable_rdptr = 0;
      wrptr = 0;
    end
  else
    begin
      stable_rdptr = next_stable_rdptr;
      wrptr = next_wrptr;
    end
end
always @(*)
begin
  #1;
  next_stable_rdptr = bin2gray(rdptr);
  next_wrptr = gray2bin(gray_wrptr);
end
// Control logic...
initial
begin
  rdptr = 0;
  data_avail = 1'b0;
  data_valid = 1'b0;
end
always @ (posedge clk or posedge reset)
begin
  if (reset)
    begin
      rdptr = 0;
      data_avail = 1'b0;
      data_valid = 1'b0;
    end
  else
    begin
      rdptr = next_rdptr;
      data_avail = next_data_avail;
      data_valid = next_data_valid;
    end
end
always @ (posedge clk) data_out = next_data_out;
always @(*)
begin
  #1;
  next_rdptr = rdptr;
  next_data_out = {(ASYNC_FIFO_MAXDATA+1){data_avail}} & ram_rddata;
  next_data_valid = 1'b0;
  if (read_req && data_avail)
    begin
      next_data_valid = 1'b1;
      next_rdptr = rdptr_plus1;
    end
  next_data_avail = (next_wrptr != next_rdptr);
  ram_rdaddr = next_rdptr[ASYNC_FIFO_MAXINDEX:0];
end
endmodule