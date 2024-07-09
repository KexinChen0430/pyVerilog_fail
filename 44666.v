module top_test;
  localparam WIDTH = 8;
  localparam UART_WIDTH = $clog2(WIDTH);
  localparam OUTPUT_CNT = 12;
  reg clk = 1;
  reg uart_clk = 0;
  reg receiving = 0;
  reg display = 0;
  reg [UART_WIDTH-1 : 0] serial_cnt = 0;
  reg [WIDTH-1 : 0] serial_data;
  reg [WIDTH-1 : 0] expected_output = 80; //'P'
  wire uart_tx;
  always #2 clk = !clk;
  always #8 uart_clk = !uart_clk; //For sim. UART TX clock gets divided by 4
  top t(
    .clk(clk),
    .uart_tx_line(uart_tx));
  initial begin
    #9999 $display("Test timeout!\n");
    #10000 $finish;
  end
  always @ (posedge uart_clk) begin
    if (receiving) begin
      if (serial_cnt == WIDTH - 1 ) begin
        receiving <= 0;
        display <= 1;
      end
      serial_data[serial_cnt] <= uart_tx;
      serial_cnt <= serial_cnt + 1;
    end else if (display) begin
      if (serial_data == expected_output) begin
        $display("%s\ttest pass\n", `TEST_NAME);
        $finish;
      end else begin
        $display("%s\ttest failed!\n", `TEST_NAME);
        $finish;
      end
      display <= 0;
    end else begin
      if (uart_tx == 0) begin
        receiving <= 1;
      end
    end
  end
endmodule