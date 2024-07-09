module bsg_fifo_1r1w_pseudo_large #(parameter `BSG_INV_PARAM(width_p )
                                      , parameter `BSG_INV_PARAM(els_p )
                                      // Future extensions: need to add max_conflict_run_p;
                                      // currently it is "1" and only if early_yumi_p = 1.
                                      // to implement this, we need to parameterize the fifo
                                      // to be of size (max_conflict_run_p+2-early_yumi_p)
                                      // if yumi is on critical path; you can change this to 0.
                                      // but to maintain performance, we would need to
                                      // implement the max_conflict_run_p parameter.
                                      , parameter early_yumi_p = 1
                                      , parameter verbose_p = 0
                                      )
   (input   clk_i
    , input reset_i
    , input [width_p-1:0] data_i
    , input v_i
    , output ready_o
    , output v_o
    , output [width_p-1:0] data_o
    , input  yumi_i
    );
   wire big_full_lo, big_empty_lo;
   wire [width_p-1:0] big_data_lo;
   logic               big_enq, big_deq, big_deq_r;
   wire               little_ready_lo, little_will_have_space;
   logic              little_valid, big_valid;
   if (early_yumi_p)
     assign little_will_have_space = little_ready_lo | yumi_i;
   else
     assign little_will_have_space = little_ready_lo;
   // whether we dequed something on the last cycle
   always_ff @(posedge clk_i)
     if (reset_i)
       big_deq_r <= 1'b0;
     else
       big_deq_r <= big_deq;
   // if the big fifo is not full, then we can take more data
   wire ready_o_int = ~big_full_lo;
   assign ready_o   = ready_o_int;
   // for debugging; whether we are bypassing the big fifo
   // synopsys translate_off
   wire bypass_mode = v_i & ~ big_enq;
   // sum up all of the storage in this fifo
   wire [31:0] num_elements_debug = big1p.num_elements_debug + big_deq_r + little2p.num_elements_debug;
   logic big_enq_r;
   always_ff @(posedge clk_i)
     if (reset_i)
       big_enq_r <= 0;
     else
       big_enq_r <= big_enq_r | big_enq;
   always_ff @(negedge clk_i)
     if (verbose_p & (reset_i === 0) & (~big_enq_r & big_enq))
       $display("## %L: overflowing into big fifo for the first time (%m)");
   // synopsys translate_on
   always_comb
     begin
        // if we fetch an element last cycle, we need to enque
        // it into the little fifo
        if (big_deq_r)
          begin
             // we dequed last cycle, so there must be room
             // in both big and little fifos
             little_valid = 1'b1;
             big_enq      = v_i;
             // if there is data in big fifo
             // and we are not enqueing to the big fifo
             // and the little fifo is empty
             // we can grab another word
             // we do not test for the yumi signal here
             // because an empty little fifo cannot have a yumi.
             big_deq      = (~big_empty_lo & ~big_enq & ~v_o);
          end
        else
          begin
             // clean through bypass mode; skip
             // big fifo and go to little fifo
             if (big_empty_lo)
               begin
                  little_valid = v_i  & little_will_have_space;
                  big_enq      = v_i  & ~little_will_have_space;
                  big_deq      = 1'b0; // big FIFO is empty, can't deque
               end
             else
               // there is data in the big fifo
               // but we did not fetch from it
               // last cycle.
               // we cannot enque anything into
               // the little fifo this cycle.
               begin
                  little_valid = 1'b0;
                  big_enq = v_i  & ~big_full_lo;
                  big_deq = ~big_enq & little_will_have_space;
               end
          end // else: !if(big_deq_r)
        big_valid    = big_enq | big_deq;
     end
   // if we dequed from the big queue last cycle
   // then we enque it into the little fifo
   wire [width_p-1:0] little_data = big_deq_r ? big_data_lo : data_i;
   bsg_fifo_1rw_large #(.width_p(width_p)
                        ,.els_p(els_p)
                        ,.verbose_p(verbose_p)
                        ) big1p
     (.clk_i         (clk_i       )
      ,.reset_i      (reset_i     )
      ,.data_i       (data_i      )
      ,.v_i          (big_valid)
      ,.enq_not_deq_i(big_enq)
      ,.full_o   (big_full_lo )
      ,.empty_o  (big_empty_lo)
      ,.data_o   (big_data_lo )
      );
   bsg_two_fifo #(.width_p(width_p)
                  ,. verbose_p(verbose_p)
                  ,. allow_enq_deq_on_full_p(early_yumi_p)) little2p
     (.clk_i   (clk_i)
      ,.reset_i(reset_i)
      ,.ready_o(little_ready_lo)
      ,.data_i (little_data)
      ,.v_i    (little_valid)
      ,.v_o    (v_o)
      ,.data_o (data_o)
      ,.yumi_i (yumi_i)
      );
endmodule