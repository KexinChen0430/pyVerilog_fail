module rptr_empty
  #(parameter ADDRSIZE = 3,
    parameter ALMOST_EMPTY_SIZE=3)
  (output reg rempty,
   output reg r_almost_empty,
   output [ADDRSIZE-1:0] raddr,
   output reg [ADDRSIZE :0] rptr,
   input [ADDRSIZE :0] rq2_wptr,
   input rinc, rclk, rrst_n);
   reg [ADDRSIZE:0] rbin;
   wire [ADDRSIZE:0] rgraynext, rbinnext;
   reg [ADDRSIZE :0] rq2_wptr_bin;
   integer 	     i;
   // GRAYSTYLE2 pointer
   always @(posedge rclk or negedge rrst_n)
     if (!rrst_n) {rbin, rptr} <= 0;
     else {rbin, rptr} <= {rbinnext, rgraynext};
   // Memory read-address pointer (okay to use binary to address memory)
   assign 	     raddr = rbin[ADDRSIZE-1:0];
   assign 	     rbinnext = rbin + (rinc & ~rempty);
   assign 	     rgraynext = (rbinnext>>1) ^ rbinnext;
   // FIFO empty when the next rptr == synchronized wptr or on reset
   wire 	     rempty_val = (rgraynext == rq2_wptr);
   // Gray code to Binary code conversion
   always @(rq2_wptr)
     for (i=0; i<(ADDRSIZE+1); i=i+1)
       rq2_wptr_bin[i] = ^ (rq2_wptr >> i);
   wire [ADDRSIZE:0] subtract = (rbinnext + ALMOST_EMPTY_SIZE)-rq2_wptr_bin;
   wire r_almost_empty_val = ~subtract[ADDRSIZE];
   always @(posedge rclk or negedge rrst_n)
     if (!rrst_n) begin
	rempty <= 1'b1;
	r_almost_empty <= 1'b 1;
     end
     else begin
	rempty <= rempty_val;
	r_almost_empty <= r_almost_empty_val;
     end
endmodule