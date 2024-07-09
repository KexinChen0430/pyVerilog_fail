module acp_generator(
        // Declare the attributes above the port declaration
        (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 IN_CLK CLK" *)
        // Supported parameters: ASSOCIATED_CLKEN, ASSOCIATED_RESET, ASSOCIATED_ASYNC_RESET, ASSOCIATED_BUSIF, CLK_DOMAIN, PHASE, FREQ_HZ
        // Output clocks will require FREQ_HZ to be set (note the value is in HZ and an integer is expected).
        (* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000" *)
        input IN_CLK, //  (required)
        output RADAR_ACP //  (required)
    );
    // 100_000_000 MHz / 146484 = 682 Hz
    clk_divider #(146484) cd(
        .IN_SIG(IN_CLK),
        .OUT_SIG(RADAR_ACP)
    );
endmodule