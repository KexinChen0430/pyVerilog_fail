module fifo_buffer (push, pop, data_in, data_out, clk, rst_n);
   // max no. of entries
   parameter int unsigned size = 4;
   input     push, pop;
   input     fifo_elements_t data_in;
   output    fifo_elements_t data_out;
   input     clk, rst_n;
//   reg [size-1:0] rd_ptr, wt_ptr;
   logic unsigned [size-1:0] rd_ptr, wt_ptr;
   fifo_elements_t fifo_mem[0:size-1];
   logic select_bypass;
   integer i,j;
   always@(posedge clk) begin
      assert (size>=2) else $fatal();
      if (!rst_n) begin
        rd_ptr<={{size-1{1'b0}},1'b1};
        wt_ptr<={{size-1{1'b0}},1'b1};
      end else begin
	 if (push) begin
	    // enqueue new data
	    for (i=0; i<size; i++) begin
	       if (wt_ptr[i]==1'b1) begin
		  fifo_mem[i] <= data_in;
	       end
	    end
	 end
	 if (push) begin
	    // rotate write pointer
	    wt_ptr <= {wt_ptr[size-2:0], wt_ptr[size-1]};
	 end
	 if (pop) begin
	    // rotate read pointer
            rd_ptr <= {rd_ptr[size-2:0], rd_ptr[size-1]};
	 end
      end // else: !if(!rst_n)
   end // always@ (posedge clk)
   /*
    */
   always_comb begin
      // one bit of read pointer is always set, ensure synthesis tool
      // doesn't add logic to force a default
      data_out = 'x;
      for (j=0; j<size; j++) begin
	 if (rd_ptr[j]==1'b1) begin
	    // output entry pointed to by read pointer
	    data_out = fifo_mem[j];
	 end
      end
   end
endmodule