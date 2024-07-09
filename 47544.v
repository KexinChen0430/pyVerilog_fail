module (Slave mode)
    // Only if boot-loader mode == 0
    // The core reads words (ALWAYS), so we need to concatenate the registers.
    // Search for a better way to do this.
    assign uart_tx_count[15:FIFO_ADDR_WIDTH+1] = 0;  // clear the remaining bytes.
    assign uart_rx_count[15:FIFO_ADDR_WIDTH+1] = 0;  // clear the remaining bytes.
    always @(posedge clk) begin
        if (~uart_wr & uart_enable & ~bootloader_reset_core) begin
            case (uart_address[2])
                1'b0    : begin uart_data_o <= {uart_rx_count[7:0], uart_tx_count[15:0], uart_data_out}; uart_ready <= 1'b1; end
                1'b1    : begin uart_data_o <= {24'b0, uart_rx_count[15:8]};                             uart_ready <= 1'b1; end
                default : begin uart_data_o <= 32'hDEAD_F00D;                                            uart_ready <= 1'b1; end
            endcase
        end
        else if (uart_wr & uart_enable & ~bootloader_reset_core) begin
            case (uart_address)
                RX_TX_BUFFER : begin tx_input_data <= uart_data_i; uart_ready <= 1'b1; end
                default      : begin tx_input_data <= 8'hxx;       uart_ready <= 1'b1; end
            endcase
        end
        else begin
            tx_input_data <= 8'hxx;
            uart_data_o <= 32'hxx;
            uart_ready  <= 1'b0;
        end
    end
    // Instantiate modules
    uart_min #(
        .FIFO_ADDR_WIDTH (FIFO_ADDR_WIDTH),               // Address width.
        .BUS_FREQ        (BUS_FREQ)
        )
        uart(
        .clk                ( clk                         ),
        .rst                ( rst                         ),
        .write              ( uart_write                  ),
        .data_i             ( uart_data_in[7:0]           ),
        .read               ( uart_read                   ),
        .data_o             ( uart_data_out[7:0]          ),
        .data_ready         ( uart_data_ready             ),
        .rx_count           ( uart_rx_count[FIFO_ADDR_WIDTH:0] ),
        .tx_count           ( uart_tx_count[FIFO_ADDR_WIDTH:0] ),
        .tx_free            ( tx_free                     ),
        .uart_rx_ready_int  ( uart_rx_ready_int           ),
        .uart_rx_full_int   ( uart_rx_full_int            ),
        .uart_rx            ( uart_rx                     ),
        .uart_tx            ( uart_tx                     )
        );
endmodule