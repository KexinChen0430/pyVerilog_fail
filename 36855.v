module outputs)
   wire                 buffer_read;            // From regs of uart_regs.v
   wire                 buffer_write;           // From regs of uart_regs.v
   wire                 enable;                 // From regs of uart_regs.v
   wire [15:0]          uart_clock_divide;      // From regs of uart_regs.v
   wire [7:0]           uart_data_write;        // From regs of uart_regs.v
   wire [7:0]           uart_data_read;         // From regs of uart_regs.v
   // End of automatics
   /*AUTOREG*/
   wire                 TX;
   wire                 baud_rate;
   uart_rx6 receiver(
                     .serial_in(RX),
                     .en_16_x_baud(baud_rate),
                     .data_out(uart_data_read),
                     .buffer_read(buffer_read),
                     .buffer_data_present(rx_data_present),
                     .buffer_half_full(rx_half_full),
                     .buffer_full(rx_full),
                     .buffer_reset(reset),
                     .clk(clk) );
   uart_tx6 transmit(
                     .data_in(uart_data_write),
                     .buffer_write(buffer_write),
                     .buffer_reset(reset),
                     .en_16_x_baud(baud_rate),
                     .serial_out(TX),
                     .buffer_data_present(tx_data_present),
                     .buffer_half_full(tx_half_full),
                     .buffer_full(tx_full),
                     .clk(clk) );
   uart_baud_generator baud(
                            // Outputs
                            .baud_rate(baud_rate),
                            // Inputs
                            .clk(clk),
                            .reset(reset),
                            .enable(1'b1),
                            .clock_divide(uart_clock_divide)
                            ) ;
   pb_uart_regs #(.BASE_ADDRESS(BASE_ADDRESS))
   regs(/*AUTOINST*/
        // Outputs
        .data_out             (data_out[7:0]),
        .interrupt            (interrupt),
        .buffer_write         (buffer_write),
        .uart_data_write      (uart_data_write[7:0]),
        .buffer_read          (buffer_read),
        .enable               (),
        .uart_clock_divide    (uart_clock_divide[15:0]),
        // Inputs
        .clk                  (clk),
        .reset                (reset),
        .port_id              (port_id[7:0]),
        .data_in              (data_in[7:0]),
        .read_strobe          (read_strobe),
        .write_strobe         (write_strobe),
        .uart_data_read       (uart_data_read[7:0]),
        .rx_data_present      (rx_data_present),
        .rx_half_full         (rx_half_full),
        .rx_full              (rx_full),
        .tx_data_present      (tx_data_present),
        .tx_half_full         (tx_half_full),
        .tx_full              (tx_full));
endmodule