module bsg_round_robin_fifo_to_fifo
  #(parameter `BSG_INV_PARAM(width_p)
    ,parameter `BSG_INV_PARAM(num_in_p)
    ,parameter num_out_p=1
    // bitvector; set bit "X" if you want to
    // support a mode where a subset X of channels are enabled
    // note each bit set adds a couple of shifters
    // so this is not free. default is to not support any subsets
    ,parameter in_channel_count_mask_p = (1 << (num_in_p-1))
    ,parameter out_channel_count_mask_p = (1 << (num_out_p-1))
    )
   (input clk, input  reset
    // input side
    , input  [num_in_p-1:0] valid_i
    , input  [width_p-1:0]  data_i [num_in_p-1:0]
    , output [num_in_p-1:0] yumi_o
    // high water mark of how many total channels are activated.
    // e.g; if one channel is activated, it would be at 0.
    , input  [`BSG_MAX($clog2(num_in_p)-1,0):0]  in_top_channel_i
    , input  [`BSG_MAX($clog2(num_out_p)-1,0):0] out_top_channel_i
    // output side
    , output [num_out_p-1:0]   valid_o
    , output [width_p-1:0]     data_o [num_out_p-1:0]
    , input  [num_out_p-1:0]   ready_i
    );
   localparam middle_meet_lp= `BSG_MIN(num_in_p,num_out_p);
   wire [middle_meet_lp-1:0]   go_channels;
   wire [middle_meet_lp*width_p-1:0] data_head  [num_in_p-1:0];
   wire [middle_meet_lp-1:0]         valid_head [num_in_p-1:0];
   wire [middle_meet_lp-1:0]         ready_head [num_out_p-1:0];
   wire [num_in_p-1:0]         yumi_int_o [num_in_p-1:0];
   wire [num_out_p-1:0]         valid_int_o[num_out_p-1:0];
   wire [width_p*num_out_p-1:0] data_int_o[num_out_p-1:0];
   // this is for supporting variable numbers of active
   // input and output channels
   assign yumi_o  = yumi_int_o[in_top_channel_i];
   assign valid_o = valid_int_o[out_top_channel_i];
   typedef logic [width_p*num_out_p-1:0] bsg_round_robin_fifo_to_fifo_t;
   wire [width_p*num_out_p-1:0] data_o_flat = data_int_o[out_top_channel_i];
   bsg_round_robin_fifo_to_fifo_t zero_flat;
   wire [$clog2(middle_meet_lp+1)-1:0]   go_cnt;
   assign zero_flat = bsg_round_robin_fifo_to_fifo_t ' (0);
   // 2D array format converters
   // bsg_flatten_2D_array #(.width_p(width_p), .items_p(num_in_p)) bf2Da (.i(data_i),           .o(data_i_flat));
   bsg_make_2D_array #(.width_p(width_p), .items_p(num_out_p))
   bm2Da (.i(data_o_flat), .o(data_o));
   genvar                      i,j;
   // we generate separate input side logic to handle
   // different numbers of input channels
   for (i = 0; i < num_in_p; i++)
     begin: ic
        if (in_channel_count_mask_p[i])
          begin : in_chan
             wire [width_p-1:0] data_head_tmp [middle_meet_lp-1:0];
             //bsg_flatten_2D_array #(.width_p(width_p), .items_p(middle_meet_lp))
             //bf2Da (.i(data_head_tmp),.o(data_head[i]));
	     assign data_head[i] = { >> {data_head_tmp} };
             // INPUT SIDE (input: valid_i, data_i; middle input; go_channels)
             bsg_rr_f2f_input #(.width_p(width_p)
                                ,.num_in_p(i+1)
                                ,.middle_meet_p(middle_meet_lp)
                                ) bsg_rr_ff_in
               (.clk(clk), .reset(reset | (in_top_channel_i != i))
                , .valid_i(valid_i[i:0])               // inputs
                , .data_i(data_i[i:0])
                , .data_head_o(data_head_tmp)         // back to us
                ,. valid_head_o(valid_head[i])
                , .go_channels_i(go_channels[`BSG_MIN(i+1,middle_meet_lp)-1:0])     // back to them
                , .go_cnt_i(go_cnt[$clog2(`BSG_MIN(i+1,middle_meet_lp)+1)-1:0])
                , .yumi_o(yumi_int_o[i][i:0])                 // final output
                );
	     // MBT: this is redundant with the cast inside bsg_rr_f2f_input
	     // and results in a synthesis warning
	     /*
             for (j = i+1; j < middle_meet_lp; j=j+1)
	       begin
                  assign valid_head[i][j] = 1'b0;
	       end
	      */
             for (j = i+1; j < num_in_p; j=j+1)
	       begin
                  assign yumi_int_o[i][j] = 1'b0;
	       end
          end // if (in_channel_count_mask_p[i])
     end // block: c
   // MIDDLE (ties INPUT to OUTPUT)
   bsg_rr_f2f_middle #(.width_p(width_p)
                       ,.middle_meet_p(middle_meet_lp)
                       ) brrf2fm
   (.valid_head_i(valid_head[in_top_channel_i])
    , .ready_head_i(ready_head[out_top_channel_i])
    , .go_channels_o(go_channels)
    , .go_cnt_o(go_cnt)
    );
   // OUTPUT SIDE
   for (i = 0; i < num_out_p; i++)
     begin: oc
        if (out_channel_count_mask_p[i])
              begin: out_chan
                 wire [width_p-1:0] data_head_array [`BSG_MIN(i+1,middle_meet_lp)-1:0];
                 wire [width_p-1:0] data_o_array [i:0];
                 bsg_make_2D_array #(.width_p(width_p), .items_p(`BSG_MIN(i+1,middle_meet_lp)))
                 bm2Da (.i( data_head[in_top_channel_i][0+:`BSG_MIN(i+1,middle_meet_lp)*width_p])
                        ,.o(data_head_array));
                 //bsg_flatten_2D_array #(.width_p(width_p), .items_p(i+1))
                 //bf2Da (.i(data_o_array), .o(data_int_o[i][width_p*(i+1)-1:0]));
		 assign data_int_o[i][width_p*(i+1)-1:0] = { >> {data_o_array}};
                 bsg_rr_f2f_output #(.width_p(width_p)
                                     ,.num_out_p(i+1)
                                     ,.middle_meet_p(middle_meet_lp)
                                     ) bsg_rr_ff_out
                   (.clk(clk), .reset(reset | (out_top_channel_i != i))
                    , .ready_i(ready_i[i:0])
                    , .ready_head_o(ready_head[i])   // back to us
                    , .go_channels_i(go_channels[`BSG_MIN(i+1,middle_meet_lp)-1:0]) // back to them
                    , .go_cnt_i(go_cnt[$clog2(`BSG_MIN(i+1,middle_meet_lp)+1)-1:0])
                    , .data_head_i(data_head_array)
                    , .valid_o(valid_int_o[i][i:0])           // final outputs
                    , .data_o(data_o_array)
                    );
                 for (j = i+1; j < num_out_p; j=j+1)
                   begin
                      assign valid_int_o[i][j] = 1'b0;
                   end
                 if (num_out_p - i > 1)
                   assign data_int_o[i][width_p*num_out_p-1:width_p*(i+1)]
                     = zero_flat[0+: (width_p*(num_out_p-(i+1)))];
              end // block: iff
     end // block: c
endmodule