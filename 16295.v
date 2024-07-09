module bsg_fifo_1r1w_small #( parameter `BSG_INV_PARAM(width_p      )
                            , parameter `BSG_INV_PARAM(els_p        )
                            , parameter harden_p     = 0
                            , parameter ready_THEN_valid_p = 0
                            )
    ( input                clk_i
    , input                reset_i
    , input                v_i
    , output               ready_o
    , input [width_p-1:0]  data_i
    , output               v_o
    , output [width_p-1:0] data_o
    , input                yumi_i
    );
  if (harden_p == 0)
    begin: unhardened
      if (els_p == 2) begin:tf
        bsg_two_fifo #(.width_p(width_p)
                      ,.ready_THEN_valid_p(ready_THEN_valid_p)
        ) twof
        (.*);
      end
      else begin:un
        bsg_fifo_1r1w_small_unhardened #(.width_p(width_p)
                                        ,.els_p(els_p)
                                        ,.ready_THEN_valid_p(ready_THEN_valid_p)
                                        ) fifo
        (.*);
      end
    end
  else
    begin: hardened
      bsg_fifo_1r1w_small_hardened #(.width_p(width_p)
                                    ,.els_p(els_p)
                                    ,.ready_THEN_valid_p(ready_THEN_valid_p)
                                    ) fifo
      (.*);
    end
endmodule