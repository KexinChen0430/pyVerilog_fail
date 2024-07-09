module uart_send #(
    parameter BAUD_RATE = 115200
    )(
    input             clk,
    input       [7:0] tx_data,
    input             send,
    output  reg       uart_tx,
    output  reg       uart_tx_busy
    );
    // localparams
    localparam UART_PERIOD = 1000000000/BAUD_RATE;   // nS
    // each clock, trigger the task. Only if send == 1'b1
    always @(posedge clk) begin
        if (send) begin
            task_uart_tx;
        end
    end
    // task
    task task_uart_tx;
        reg [9:0] tx_buffer;    // output buffer
        integer tx_cnt;         // counter
        // task
        begin
            #(1);                                   // delay FTW
            uart_tx_busy = 1'b1;                    //
            uart_tx      = 1'b1;                    // idle
            tx_buffer    = {1'b1, tx_data, 1'b0};   // extend data
            for(tx_cnt = 0; tx_cnt < 10; tx_cnt = tx_cnt + 1) begin
                #(UART_PERIOD);
                uart_tx = tx_buffer[tx_cnt];
            end
            uart_tx_busy = 1'b0;
        end
    endtask
endmodule