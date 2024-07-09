module
    clk_gen clk_gen (
        .clk_ref        (clk_ref        ),
        .reset_sw       (reset_sw       ),
        .clk            (clk            ),
        .clk_n          (clk_n          ),
        .chip_reset     (chip_reset     )
    );
    // 4.2 the cpu chip
    chip chip (
        .clk            (clk            ),
        .clk_n          (clk_n          ),
        .reset          (chip_reset     )
        /********** UART **********/
    `ifdef IMPLEMENT_UART
        , .uart_rx      (uart_rx        )
        , .uart_tx      (uart_tx        )
    `endif
    `ifdef IMPLEMENT_GPIO
    `ifdef GPIO_IN_CH
        , .gpio_in      (gpio_in        )
    `endif
    `ifdef GPIO_OUT_CH
        , .gpio_out     (gpio_out       )
    `endif
    `ifdef GPIO_IO_CH
        , .gpio_io      (gpio_io        )
    `endif
    `endif
    );
endmodule