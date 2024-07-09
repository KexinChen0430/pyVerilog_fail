module rxleds #(
         parameter BAUDRATE = `B115200
)(
         input wire clk,         //-- System clock
         input wire rx,          //-- Serial input
         output reg [3:0] leds   //-- Red leds
);
wire rcv;
wire [7:0] data;
reg rstn = 0;
always @(posedge clk)
  rstn <= 1;
uart_rx #(BAUDRATE)
  RX0 (.clk(clk),      //-- System clock
       .rstn(rstn),    //-- Reset (Active low)
       .rx(rx),        //-- Serial input
       .rcv(rcv),      //-- Character received notification (1)
       .data(data)     //-- Character received
      );
always @(posedge clk)
    if (!rstn)
      leds <= 0;
    else if (rcv == 1'b1)
      leds <= data[3:0];
endmodule