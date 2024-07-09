module
    always @(posedge clk) begin
        if (uart_wr & uart_enable) begin
            case (uart_address)
                RX_TX_BUFFER : begin tx_input_data <= uart_data_i; uart_ready <= 1'b1; end
                default      : begin tx_input_data <= 8'hxx;       uart_ready <= 1'b1; end
            endcase
        end
        else begin
            tx_input_data <= 8'hxx;
            uart_ready <= 1'b0;
        end
    end
    // Instantiate modules
    uart_clock clks (
        .clk           ( clk           ),
        .uart_tick     ( uart_tick     ),
        .uart_tick_16x ( uart_tick_16x )
    );
    uart_tx tx (
        .clk       ( clk              ),
        .rst       ( rst              ),
        .uart_tick ( uart_tick        ),
        .TxD_data  ( tx_fifo_data_out ),
        .TxD_start ( tx_start         ),
        .ready     ( tx_free          ),
        .TxD       ( uart_tx          )
    );
    uart_rx rx (
        .clk           ( clk           ),
        .rst           ( rst           ),
        .RxD           ( uart_rx       ),
        .uart_tick_16x ( uart_tick_16x ),
        .RxD_data      ( rx_data       ),
        .ready         ( rx_data_ready )
    );
    fifo #(
        .DATA_WIDTH     (DATA_WIDTH),
        .ADDR_WIDTH     (ADDR_WIDTH))
    tx_buffer (
        .clk     ( clk                                 ),
        .rst     ( rst                                 ),
        .enqueue ( uart_wr & uart_enable & ~uart_ready ),
        .dequeue ( tx_fifo_deQ                         ),
        .data_i  ( tx_input_data                       ),
        .data_o  ( tx_fifo_data_out                    ),
        .count   ( tx_count                            ),
        .empty   ( tx_fifo_empty                       ),
        .full    (                                     )
    );
    fifo #(
        .DATA_WIDTH     (DATA_WIDTH),
        .ADDR_WIDTH     (ADDR_WIDTH))
    rx_buffer (
        .clk     ( clk                                  ),
        .rst     ( rst                                  ),
        .enqueue ( rx_data_ready                        ),
        .dequeue ( ~uart_wr & uart_enable & ~uart_ready ),
        .data_i  ( rx_data                              ),
        .data_o  ( rx_read_data                         ),
        .count   ( rx_count                             ),
        .empty   ( rx_fifo_empty                        ),
        .full    ( uart_rx_full_int                     )
    );
endmodule