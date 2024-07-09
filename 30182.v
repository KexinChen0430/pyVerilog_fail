module so we can cluster this logic in physical design
   // wire [num_out_p*2-1:0] 		  ready_head_o_pretr = { 2 { ready_i } } >> optr_r;
   wire [num_out_p-1:0] 		  ready_head_o_pretr;
   bsg_rotate_right #(.width_p(num_out_p)) ready_rr (.data_i(ready_i), .rot_i(optr_r), .o(ready_head_o_pretr));
   wire [num_out_p*2-1:0]    valid_pretr;
   if (num_out_p >= middle_meet_p)
     begin
        assign ready_head_o  = ready_head_o_pretr[0+:middle_meet_p];
        assign valid_pretr   = { 2 { num_out_p ' (go_channels_i) } } << optr_r;
     end
   else
     begin
        assign ready_head_o  = middle_meet_p ' (ready_head_o_pretr[0+:num_out_p]);
        assign valid_pretr   = {2 { go_channels_i } } << optr_r;
     end
   assign valid_o                     = valid_pretr[num_out_p+:num_out_p];
   genvar                 i;
   wire [width_p-1:0] data_head_double [num_out_p*2-1:0];
   for (i = 0; i < num_out_p; i=i+1)
     begin
        if (i < middle_meet_p)
          begin
             assign data_head_double[i]            = data_head_i[i];
             assign data_head_double[i+num_out_p]  = data_head_i[i];
          end
        else
          begin
             assign data_head_double[i]            = width_p ' (0);
             assign data_head_double[i+num_out_p]  = width_p ' (0);
          end
        assign data_o[i] = data_head_double[(i+num_out_p)-optr_r_data];
     end
   bsg_circular_ptr #(.slots_p(num_out_p)
                      ,.max_add_p(min_out_middle_meet_lp)
                      ) c_ptr
     (.clk(clk), .reset_i(reset)
      ,.add_i(go_cnt_i)
      ,.o(optr_r)
      ,.n_o()
      );
   // duplicate logic for physical design
   bsg_circular_ptr #(.slots_p(num_out_p)
                      ,.max_add_p(min_out_middle_meet_lp)
                      ) c_ptr_data
     (.clk(clk), .reset_i(reset)
      ,.add_i(go_cnt_i)
      ,.o(optr_r_data)
      ,.n_o()
      );
endmodule