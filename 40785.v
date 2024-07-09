module will reset
    // all the lanes if this occurs while they are all in the lane ready state (i.e. lane_up
    // is asserted for all.
    // Counter logic
    always @(posedge USER_CLK)
        if(RX_SP|!ready_r)  counter4_r  <=  `DLY    {ready_r,counter4_r[0:14]};
    // The counter is done when bit 15 of the shift register goes high.
    assign remote_reset_watchdog_done_r = counter4_r[15];
    //__________________________Counter 5, internal watchdog timer __________________
    // This counter puts an upper limit on the number of cycles the state machine can
    // spend in the ack state before it gives up and resets.
    // The counter is implemented as a shift register extending counter 1.  The counter
    // clears out in all non-ack cycles by keeping CE asserted.  When it gets into the
    // ack state, CE is asserted only when there is a transition on the most
    // significant bit of counter 1.  This happens every 128 cycles.  We count out 32
    // of these transitions to get a count of approximately 4096 cycles.  The actual
    // number of cycles is less than this because we don't reset counter1, so it starts
    // off about 34 cycles into its count.
    // Counter logic
    always @(posedge USER_CLK)
        if(do_watchdog_count_r|!ack_r)  counter5_r  <=  `DLY    {ack_r,counter5_r[0:14]};
    // Store the count_128d_done_r result from the previous cycle.
    always @(posedge USER_CLK)
        prev_count_128d_done_r  <=  `DLY    count_128d_done_r;
    // Trigger CE only when the previous 128d_done is not the same as the
    // current one, and the current value is high.
    always @(posedge USER_CLK)
        do_watchdog_count_r <=  `DLY    count_128d_done_r & !prev_count_128d_done_r;
    // The counter is done when bit 15 of the shift register goes high.
    assign watchdog_done_r = counter5_r[15];
    //___________________________Polarity Control_____________________________
    // sp_polarity_c, is low if neg symbols received, otherwise high.
    assign  sp_polarity_c   =   !RX_NEG;
    // The Polarity flop drives the polarity setting of the GTP.  We initialize it for the
    // sake of simulation. In hardware, it is initialized after configuration.
    initial
        rx_polarity_r <=  1'b0;
    always @(posedge USER_CLK)
        if(polarity_r & !sp_polarity_c)  rx_polarity_r <=  `DLY    ~rx_polarity_r;
    // Drive the rx_polarity register value on the interface.
    assign  RX_POLARITY =   rx_polarity_r;
endmodule