module sync
    (input wire OutputClock,  //
    input  wire reset_b,      //
    input  wire InputData,    //
    output wire OutputData);  //
    /*************************************************************************
    wire synch_flop_1;
    /*************************************************************************
    dff_async_reset
        dff_1
        (// Global Signals                  // ----------------------------
        .clk     (OutputClock),
        .reset_b (reset_b),
        .d       (InputData),
        .q       (synch_flop_1));
    dff_async_reset
        dff_2
        (// Global Signals                  // ----------------------------
        .clk     (OutputClock),
        .reset_b (reset_b),
        .d       (synch_flop_1),
        .q       (OutputData));
endmodule