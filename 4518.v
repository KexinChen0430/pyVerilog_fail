module LAG_pl_buffers (push, pop, data_in,
		      data_out, flags,
		      clk, rst_n);
   // length of PL FIFOs
   parameter size = 3;
   // number of physical channels
   parameter n = 4;
   input     [n-1:0] push;
   input     [n-1:0] pop;
   input     fifo_elements_t data_in [n-1:0];
   output    fifo_elements_t data_out [n-1:0];
   output    fifov_flags_t flags [n-1:0];
   input     clk, rst_n;
   genvar i;
   generate
   for (i=0; i<n; i++) begin:plbufs
	 // **********************************
	 // SINGLE FIFO holds complete flit
	 // **********************************
	 LAG_fifo_v #(.size(size)
		     ) pl_fifo
	   (.push(push[i]),
	    .pop(pop[i]),
	    .data_in(data_in[i]),
	    .data_out(data_out[i]),
	    .flags(flags[i]),
	    .clk, .rst_n);
   end
   endgenerate
endmodule