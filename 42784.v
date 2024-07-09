module is responsible for handling one bank
	// of the 1R1W FIFO.
	// we exploit the property of the bsg_fifo_1r1w_pseudo_large fifo
	// that it will never read-stall on us if we have a conflict run
	// of 1 element and write data every other cycle.
        bsg_fifo_1r1w_pseudo_large #(.width(width_p)
                                     ,.els_p(els_p >> 1)
				     ,.early_yumi_p(1)
				     // ,.max_conflict_run_p (1)
                                     ) bank
            (.clk_i   (clk_i)
             ,.reset_i(reset_i)
             ,.v_i(v_i_demux  [i])
             ,.data_i (data_i        )
             ,.ready_o(ready_o_mux[i])
             ,.v_o    (v_int   [i])
             ,.data_o (data_int[i])
             ,.yumi_i (yumi_int[i])
             );
     end
   bsg_round_robin_n_to_1 #(.width(width_p)
                            ,.num_in_p(2)
                            ) round_robin_n_to_1
     (.clk_i   (clk_i     )
      ,.reset_i(reset_i   )
      ,.data_i (data_int )
      ,.valid_i(valid_int)
      ,.yumi_o (yumi_int )
      ,.data_o (data_o    )
      ,.valid_o(valid_o   )
      ,.yumi_i (yumi_i    )
      );
endmodule