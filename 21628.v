module bsg_counter_up_down_variable #( parameter `BSG_INV_PARAM(max_val_p    )
                                     , parameter `BSG_INV_PARAM(init_val_p   )
                                     , parameter `BSG_INV_PARAM(max_step_p   )
                                     //localpara
                                     , parameter step_width_lp =
                                        `BSG_WIDTH(max_step_p)
                                     , parameter ptr_width_lp =
                                        `BSG_WIDTH(max_val_p)
                                     )
    ( input                            clk_i
    , input                            reset_i
    , input        [step_width_lp-1:0] up_i
    , input        [step_width_lp-1:0] down_i
    , output logic [ptr_width_lp-1:0]  count_o
    );
// keeping track of number of entries and updating read and
// write poniteres, and displaying errors in case of overflow
// or underflow
always_ff @(posedge clk_i)
  begin
    if (reset_i)
			count_o <= init_val_p;
    else
      // It was tested on Design Compiler that using a
      // simple minus and plus operation results in smaller
      // design, rather than using xor or other ideas
      // between down_i and up_i
      count_o <= count_o - down_i + up_i;
  end
//synopsys translate_off
  always_ff @ (posedge clk_i) begin
     if ((count_o==max_val_p) & up_i   & (reset_i===0))
       $display("%m error: counter overflow at time %t", $time);
     if ((count_o==0)         & down_i & (reset_i===0))
       $display("%m error: counter underflow at time %t", $time);
  end
//synopsys translate_on
endmodule