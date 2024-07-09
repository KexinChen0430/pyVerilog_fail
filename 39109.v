module bsg_fifo_1r1w_large #(parameter `BSG_INV_PARAM(width_p)
                             , parameter `BSG_INV_PARAM(els_p)
                             )
   (input                  clk_i
    , input                reset_i
    , input [width_p-1:0]  data_i
    , input                v_i
    , output               ready_o
    , output               v_o
    , output [width_p-1:0] data_o
    , input                yumi_i
    );
   initial assert ((els_p & 1) == 0) else
     $error("odd number of elements for two port fifo not handled.");
   wire [width_p*2-1:0] data_sipo;
   wire [1:0]          valid_sipo;
   wire [1:0]          yumi_cnt_sipo;
   // we had to bump els_p to 3 because of the case
   // where the little fifos have 3 elements (blocking
   // us from restoring from the 1RW FIFO), and where
   // the sipo has only one element (blocking us from
   // spooling to the 1RW fifo.) If we simultaneously
   // have enque and deque requests, then the sipo will
   // need to spool at the same time that we need to
   // access the 1RW fifo to prevent empty. the solution
   // is to add one extra element to the sipo so that it
   // can hold off one more cycle before spooling. then
   // we can restore 2 words from the fifo, and spool
   // on the next cycle.
   bsg_serial_in_parallel_out #(.width_p(width_p)
                                ,.els_p(3)
                                ,.out_els_p(2)
                                ) sipo
   (.clk_i      (clk_i)
    ,.reset_i   (reset_i)
    ,.valid_i   (v_i)
    ,.data_i    (data_i)
    ,.ready_o   (ready_o)
    ,.valid_o   (valid_sipo)
    ,.data_o    (data_sipo)
    ,.yumi_cnt_i(yumi_cnt_sipo)
    );
   wire [2*width_p-1:0] big_data_lo;
   wire                 big_valid, big_full_lo, big_empty_lo;
   logic                big_enq, big_deq,   big_deq_r;
   always_ff @(posedge clk_i)
     big_deq_r <= big_deq;
   bsg_fifo_1rw_large #(.width_p(width_p*2)
                        ,.els_p (els_p >> 1)
                        ) big1p
     (.clk_i         (clk_i       )
      ,.reset_i      (reset_i     )
      // low bits are older element
      ,.data_i       (data_sipo )
      ,.v_i          (big_valid)
      ,.enq_not_deq_i(big_enq)
      ,.full_o   (big_full_lo )
      ,.empty_o  (big_empty_lo)
      ,.data_o   (big_data_lo )
      );
   wire [2*width_p-1:0] little_data_rot;
   wire [1:0]           little_valid, little_ready;
   wire [1:0]           little_ready_rot, little_valid_rot;
   wire [1:0]           valid_int;
   // we are in bypass mode if we can directly bypass
   // to the small fifos.
   // data from the big fifo; the small fifo we would like
   // to use cannot be full, and the big fifo must be empty.
   wire bypass_mode    = ~big_deq_r & little_ready[0] & big_empty_lo;
   wire can_spill     = ~big_full_lo & ~bypass_mode;
   // we have an emergency if both little fifos can receive data
   // (i.e. <= 2 elements) and we did not just fetch from the big fifo
   // and we have data in the big fifo. if we don't transfer now, we
   // will have a bubble.
   wire emergency     = (&little_ready_rot) & ~big_empty_lo & ~big_deq_r;
   // we will spill if we are in spill mode; and we have two elements
   // to spill, and the big fifo is not full.
   wire will_spill    = can_spill & (&valid_sipo) & ~emergency;
   // we deque if we are not spilling, big fifo has data available
   // and the small fifos has two elements free with an enque pending
   // or one element free with no enque pending
   assign big_deq     = ~will_spill & ~big_empty_lo
                        & (big_deq_r
                           ? (~|valid_int)         // small fifos are empty
                           : (&little_ready_rot)); // both fifos > 1 el free, no enq pending
   assign big_valid = will_spill | big_deq;
   assign big_enq   = will_spill;
   wire [2*width_p-1:0] little_data  = big_deq_r ? big_data_lo : data_sipo;
   wire [1:0] bypass_vector = valid_sipo & { bypass_mode, bypass_mode };
   assign               little_valid = big_deq_r ? 2'b11       : bypass_vector;
   wire [1:0]           cnt;
   bsg_thermometer_count #(.width_p(2)) thermo(.i(little_ready & bypass_vector)
                                               ,.o(cnt));
   assign yumi_cnt_sipo = will_spill
                          ? 2'b10
                          : cnt;
   bsg_round_robin_2_to_2 #(.width_p(width_p))
     rr222
       (.clk_i(clk_i)
        ,.reset_i(reset_i)
        ,.data_i(little_data)
        ,.v_i    (little_valid)
        ,.ready_o(little_ready)
        ,.data_o(little_data_rot)
        ,.v_o   (little_valid_rot)
        ,.ready_i(little_ready_rot)
        );
   wire [1:0][width_p-1:0] data_int;
   wire [1:0]           yumi_int;
   genvar               i;
   for (i = 0; i < 2; i++)
     begin : twofer
        bsg_two_fifo #(.width_p(width_p)) little
            (.clk_i   (clk_i)
             ,.reset_i(reset_i)
             ,.ready_o(little_ready_rot[i]                 )
             ,.data_i (little_data_rot [i*width_p+:width_p])
             ,.v_i    (little_valid_rot[i]                 )
             ,.v_o    (valid_int [i])
             ,.data_o (data_int  [i])
             ,.yumi_i (yumi_int  [i])
             );
     end
  bsg_round_robin_n_to_1 #(.width_p(width_p)
                            ,.num_in_p(2)
			    ,.strict_p(1)
                            ) round_robin_n_to_1
     (.clk_i   (clk_i     )
      ,.reset_i(reset_i   )
      ,.data_i (data_int )
      ,.v_i(valid_int)
      ,.yumi_o (yumi_int )
      ,.data_o (data_o    )
      ,.v_o(v_o       )
      ,.tag_o  ()
      ,.yumi_i (yumi_i    )
      );
   // synopsys translate_off
   // this sums up all of the storage in this fifo
   wire [31:0] num_elements_debug
               = 2*big1p.num_elements_debug
               + valid_int[0] + valid_int[1]
               + sipo.valid_r[0] + sipo.valid_r[1]
               + !little_ready_rot[0] + !little_ready_rot[1];
   // synopsys translate_on
endmodule