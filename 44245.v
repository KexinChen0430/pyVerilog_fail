module with mode and line_ready inputs, and valid-and-credit
// protocol on both directions to meso-channel , and valid-and-ready protocol
// on both directions to core
bsg_mesosync_core #( .width_p(width_lp-2)
                   , .els_p(loopback_els_p)
                   , .credit_initial_p(credit_initial_p)
                   , .credit_max_val_p(credit_max_val_p)
                   , .decimation_p(decimation_p)
                   ) mesosync_core
    ( .clk_i(clk)
    , .reset_i(channel_reset)
    , .loopback_en_i(loopback_en)
    , .line_ready_i(ready)
    // Connection to mesosync_link
    , .meso_data_i(from_meso_input[width_lp-1:2])
    , .meso_v_i(valid & from_meso_input[0])
    , .meso_token_o(to_meso_output[1])
    , .meso_v_o(to_meso_output[0])
    , .meso_data_o(to_meso_output[width_lp-1:2])
    , .meso_token_i(valid & from_meso_input[1])
    // connection to core
    , .data_i(data_i)
    , .v_i(v_i)
    , .ready_o(ready_o)
    , .v_o(v_o)
    , .data_o(data_o)
    , .ready_i(ready_i)
    );
endmodule