module txchar (
          input wire clk,   //-- System clock
          input wire rstn,  //-- Reset (active low)
          output wire tx    //-- Serial data output
);
uart_tx #(
    .BAUDRATE(`B115200)  //-- Set the baudrate
  ) TX0 (
    .clk(clk),
    .rstn(rstn),
    .data("A"),    //-- Fixed character to transmit (always the same)
    .start(1'b1),  //-- Start signal always set to 1
    .tx(tx)
);                 //-- Port ready not used
endmodule