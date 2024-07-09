module async_fifo_wrpath (
  clk, reset,
  space_avail, data_valid, wrdata,
  ram_wrenb, ram_wraddr, ram_wrdata,
  stable_wrptr, stable_rdptr);
parameter ASYNC_FIFO_MAXINDEX = 3;
parameter ASYNC_FIFO_MAXDATA = 31;
parameter ASYNC_FIFO_FULLTHRESHOLD = 4;
input clk, reset;
// FIFO interface...
output space_avail;
input data_valid;
input [ASYNC_FIFO_MAXDATA:0] wrdata;
// RAM interface...
output ram_wrenb;
output [ASYNC_FIFO_MAXINDEX:0] ram_wraddr;
output [ASYNC_FIFO_MAXDATA:0] ram_wrdata;
// Sync interface...
output [ASYNC_FIFO_MAXINDEX+1:0] stable_wrptr;
input [ASYNC_FIFO_MAXINDEX+1:0] stable_rdptr;
localparam WIDTH = ASYNC_FIFO_MAXINDEX+2;
`include "gray.v"
// Registers...
reg [ASYNC_FIFO_MAXINDEX+1:0] stable_wrptr, next_stable_wrptr;
reg [ASYNC_FIFO_MAXINDEX+1:0] wrptr, next_wrptr;
reg [ASYNC_FIFO_MAXINDEX+1:0] rdptr, next_rdptr;
reg space_avail, next_space_avail;
wire [ASYNC_FIFO_MAXINDEX+1:0] wrptr_plus1 = wrptr+1'b1;
wire [ASYNC_FIFO_MAXINDEX+1:0] fifo_depth = wrptr-rdptr;
wire [ASYNC_FIFO_MAXINDEX+1:0] gray_rdptr;
full_synchronizer #(WIDTH) sync_gray_rdptr (clk, reset, stable_rdptr, gray_rdptr);
// RAM interface...
wire ram_wrenb = data_valid;
wire [ASYNC_FIFO_MAXINDEX:0] ram_wraddr = wrptr[ASYNC_FIFO_MAXINDEX:0];
wire [ASYNC_FIFO_MAXDATA:0] ram_wrdata = wrdata;
// Sample stable singals...
initial
begin
  stable_wrptr = 0;
  rdptr = 0;
end
always @ (posedge clk or posedge reset)
begin
  if (reset)
    begin
      stable_wrptr = 0;
      rdptr = 0;
    end
  else
    begin
      stable_wrptr = next_stable_wrptr;
      rdptr = next_rdptr;
    end
end
always @(*)
begin
  #1;
  next_stable_wrptr = bin2gray(next_wrptr);
  next_rdptr = gray2bin(gray_rdptr);
end
// Control logic...
initial
begin
  space_avail = 0;
  wrptr = 0;
end
always @ (posedge clk or posedge reset)
begin
  if (reset)
    begin
      space_avail = 1'b1;
      wrptr = 0;
    end
  else
    begin
      space_avail = next_space_avail;
      wrptr = next_wrptr;
      // synthesis translate_off
      if (data_valid)
	begin
          #1;
	  if (fifo_depth >= (1<<(ASYNC_FIFO_MAXINDEX+1)))
            begin
              $display ("%t: FIFO OVERFLOW!",$realtime);
              $finish;
            end
	end
      // synthesis translate_on
    end
end
always @(*)
begin
  #1;
  next_space_avail = fifo_depth<((1<<(ASYNC_FIFO_MAXINDEX+1))-ASYNC_FIFO_FULLTHRESHOLD);
  next_wrptr = (data_valid && space_avail) ? wrptr_plus1 : wrptr;
end
endmodule