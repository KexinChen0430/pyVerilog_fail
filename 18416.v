module, the output is valid iff data fifo has valid output data.
     */
    assign valid_o = fifo_v_lo;
    /**
     */
    bsg_mux
   #(.width_p(width_p)
    ,.els_p  (els_p)
    ) data_o_mux
    (.data_i (fifo_data_lo)
    ,.sel_i  (shift_ctr_r)
    ,.data_o (data_o)
    );
  end
endmodule