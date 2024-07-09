module LAG_fifo_v_ (push, pop, data_in, data_out, flags, clk, rst_n);
   // max no. of entries
   parameter size = 8;
   input     push, pop;
   output    fifov_flags_t flags;
   input     fifo_elements_t data_in;
   output    fifo_elements_t data_out;
   input     clk, rst_n;
   logic fifo_push, fifo_pop;
   fifo_elements_t fifo_data_out, data_out_tmp;
   fifo_buffer_ #(.size(size))
         fifo_buf (push, pop, data_in, data_out_tmp, clk, rst_n);
    assign data_out = flags.empty ? '0 : data_out_tmp;
    fifo_flags_ #(.size(size))
      gen_flags(push, pop, flags, clk, rst_n);
endmodule