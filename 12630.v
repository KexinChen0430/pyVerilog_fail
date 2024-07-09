module that gives the input to logic anlzer has 2 cycle
// delay and input_clk_counter is comapred with value 2 to get the actual edge.
// If input_clk_divider is 0 every edge is correct, and if input_clk_divider is 1,
// when input_counter_r is zero is the actual edge.
assign delayed_input_clk_edge =  (input_clk_divider<maxDivisionWidth_p'(2))  ?
                                 (input_counter_r == maxDivisionWidth_p'(0)) :
                                 (input_counter_r == maxDivisionWidth_p'(2)) ;
// when data is ready to send from Logic Analyzer FIFO to output, fifo will
// be dequed until it gets empty.
// Due to output_ready signal which is reset dependent, this singal does not
// assert during reset.
assign LA_deque   = ready_to_LA & LA_valid;
// Due to fifo_relays in both mesosync_input and mesosync_output, we need
// 2 less elements in logic analyzer's fifo (each fifo_relay keeps 2 one bit
// values, hence we would get 2 two bit fifos in totall).
bsg_logic_analyzer #( .line_width_p(width_lp)
                    , .LA_els_p(LA_els_p)
                    ) logic_analyzer
       ( .clk(clk)
       , .reset(channel_reset)
       , .valid_en_i(output_mode_is_LA)
       , .posedge_value_i(posedge_synchronized)
       , .negedge_value_i(negedge_synchronized)
       , .input_bit_selector_i(la_input_bit_selector)
       , .start_i(LA_trigger)
       , .ready_o()
       , .logic_analyzer_data_o(LA_data)
       , .v_o(LA_valid)
       , .deque_i(LA_deque)
       );
endmodule