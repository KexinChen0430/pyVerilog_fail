module uart_decoder #(
    parameter BAUD_RATE = 115200
    )(
    input             clk,
    input             uart_rx,
    output  reg [7:0] rx_data
    );
    // localparams
    localparam UART_PERIOD = 1000000000/BAUD_RATE;   // nS
    // each clock, trigger the task
    always @(posedge clk) begin
        task_uart_rx;
    end
    // task
    task task_uart_rx;
        reg [7:0] rx_buffer;    // input buffer
        integer rx_cnt;         // counter
        // task
        begin
            #(1);                   // delay FTW
            @(negedge uart_rx);     // wait start bit
            rx_buffer = 0;          //
            #(3*UART_PERIOD/2);     // ignore start bit
            // get frame
            for (rx_cnt = 0; rx_cnt < 8; rx_cnt = rx_cnt + 1) begin
                rx_buffer = {uart_rx, rx_buffer[7:1]};      // shifter
                #(UART_PERIOD);                     // wait for next bit
            end
            //$display("%c", rx_buffer);        // display the char
            rx_data = rx_buffer;       // return data
        end
    endtask
endmodule