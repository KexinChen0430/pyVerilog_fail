module bsg_parallel_in_serial_out_passthrough_dynamic
 #(parameter `BSG_INV_PARAM(width_p)
  ,parameter `BSG_INV_PARAM(max_els_p)
  ,parameter lg_max_els_lp = `BSG_SAFE_CLOG2(max_els_p)
  )
  (input                               clk_i
  ,input                               reset_i
  // Data Input Channel
  ,input                               v_i
  ,input  [max_els_p-1:0][width_p-1:0] data_i
  ,output                              ready_and_o
  // Data Output Channel
  ,output                              v_o
  ,output [width_p-1:0]                data_o
  ,input  [lg_max_els_lp-1:0]          len_i
  ,input                               ready_and_i
  );
  if (max_els_p == 1)
  begin : single_word
    assign v_o         = v_i;
    assign data_o      = data_i;
    assign ready_and_o = ready_and_i;
  end
  else
  begin : multi_word
    logic [lg_max_els_lp-1:0] count_r, len_lo;
    logic is_zero, is_last, en_li, clear_li, up_li;
    logic [max_els_p-1:0][width_p-1:0] data_lo;
    bsg_counter_clear_up
   #(.max_val_p (max_els_p-1)
    ,.init_val_p(0          )
    ) ctr
    (.clk_i     (clk_i      )
    ,.reset_i   (reset_i    )
    ,.clear_i   (clear_li   )
    ,.up_i      (up_li      )
    ,.count_o   (count_r    )
    );
    // reset len_lo to prevent X-pessimism in simulation
    bsg_dff_reset_en_bypass
   #(.width_p    (lg_max_els_lp)
    ,.reset_val_p(0            )
    ) len_dff
    (.clk_i      (clk_i        )
    ,.reset_i    (reset_i      )
    ,.en_i       (en_li        )
    ,.data_i     (len_i        )
    ,.data_o     (len_lo       )
    );
    assign data_lo[0] = data_i[0];
    bsg_dff_en_bypass
   #(.width_p((max_els_p-1)*width_p )
    ) data_dff
    (.clk_i  (clk_i                 )
    ,.en_i   (en_li                 )
    ,.data_i (data_i [max_els_p-1:1])
    ,.data_o (data_lo[max_els_p-1:1])
    );
    assign is_zero     = count_r == (lg_max_els_lp)'(0);
    assign is_last     = count_r == len_lo;
    assign en_li       = v_i & is_zero;
    assign up_li       = v_o & ready_and_i & ~is_last;
    assign clear_li    = v_o & ready_and_i & is_last;
    assign v_o         = v_i | ~is_zero;
    assign ready_and_o = ready_and_i & is_zero;
    bsg_mux
   #(.width_p(width_p  )
    ,.els_p  (max_els_p)
    ) data_mux
    (.data_i (data_lo  )
    ,.sel_i  (count_r  )
    ,.data_o (data_o   )
    );
*/
  end
endmodule