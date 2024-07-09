module's valid out
   // depends on the incoming retry (e.g. retry->valid)
   // but we need to interface to a valid/yumi.
   // which means we need a 2-element fifo.
   wire [nodes_p-1:0] block_2_switchValid_2;
   wire [nodes_p-1:0] block_2_switchReady;
   bsg_flow_convert #(.width_p(nodes_p)
                      ,.send_retry_then_v_p(1)
                      ,.recv_v_and_ready_p(1)
                      ) b2s
   (.v_i  (block_2_switchValid)
    ,.fc_o(block_2_switchRetry)
    ,.v_o(block_2_switchValid_2)
    ,.fc_i(block_2_switchReady)
    );
   genvar i;
   for (i = 0; i < nodes_p; i++)
     begin : n
        bsg_two_fifo #(.width_p(ring_width_p))
        twofer (.clk_i(clk_i)
                ,.reset_i(reset_i[i])
                ,.ready_o(block_2_switchReady[i])
                ,.data_i (block_2_switchData[i] )
                ,.v_i    (block_2_switchValid[i])
                ,.v_o    (v_o[i]      )
                ,.data_o (data_o[i])
                ,.yumi_i (yumi_i[i]   )
                );
     end
endmodule