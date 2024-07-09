module
   assign credit_local_return_data_o = credit_data_lo[0+:num_in_p*lg_remote_credits_lp];
   assign credit_local_return_v_o    = credit_v_lo;
   // compute remote credit arithmetic
   wire [num_in_p-1:0] sent = v_o & yumi_i;
   genvar              i;
   // keep track of how many credits need to be send back
   for (i = 0; i < num_in_p; i=i+1)
     begin: rof
        bsg_counter_clear_up #(.max_val_p  (remote_credits_p)
                               ,.init_val_p(0)
                               ) ctr
            (.clk_i
             ,.reset_i
             ,.clear_i (credit_remote_return_yumi_i   )
             ,.up_i    (sent[i]                       )
             ,.count_o (credit_remote_return_data_o[i])
             );
     end
endmodule