module bsg_1_to_n_tagged #(
                           parameter `BSG_INV_PARAM(num_out_p)
                           ,parameter tag_width_lp = `BSG_SAFE_CLOG2(num_out_p)
                           )
   (input  clk_i
    , input  reset_i
    , input                   v_i
    , input [tag_width_lp-1:0]  tag_i
    , output                   yumi_o
    , output [num_out_p-1:0]   v_o
    , input  [num_out_p-1:0]   ready_i
    // to downstream
    );
  wire unused0 = clk_i;
  wire unused1 = reset_i;
   if (num_out_p == 1)
     begin : one
        assign v_o = v_i;
        assign yumi_o  = ready_i & v_i;
     end
   else
     begin: many
        genvar                  i;
        bsg_decode_with_v #(.num_out_p(num_out_p)) bdv
          (.i(tag_i)
           ,.v_i(v_i)
           ,.o(v_o)
           );
        assign yumi_o = ready_i[tag_i] & v_i;
     end
endmodule