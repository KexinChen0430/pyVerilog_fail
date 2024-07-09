module uart_rx #(
         parameter BAUDRATE = `B115200   //-- Default baudrate
)(
         input wire clk,         //-- System clock (12MHz in the ICEstick)
         input wire rstn,        //-- Reset (Active low)
         input wire rx,          //-- Serial data input
         output reg rcv,         //-- Data is available (1)
         output reg [7:0] data   //-- Data received
);
wire clk_baud;
reg bauden;  //-- Enable the baud generator
reg clear;   //-- Clear the bit counter
reg load;    //-- Load the received character into the data register
reg rx_r;
always @(posedge clk)
  rx_r <= rx;
baudgen_rx #(BAUDRATE)
  baudgen0 (
    .rstn(rstn),
    .clk(clk),
    .clk_ena(bauden),
    .clk_out(clk_baud)
  );
reg [3:0] bitc;
always @(posedge clk)
  if (clear)
    bitc <= 4'd0;
  else if (clear == 0 && clk_baud == 1)
    bitc <= bitc + 1;
reg [9:0] raw_data;
always @(posedge clk)
  if (clk_baud == 1) begin
    raw_data <= {rx_r, raw_data[9:1]};
  end
always @(posedge clk)
  if (rstn == 0)
    data <= 0;
  else if (load)
    data <= raw_data[8:1];
localparam IDLE = 2'd0;  //-- IDLEde reposo
localparam RECV = 2'd1;  //-- Receiving data
localparam LOAD = 2'd2;  //-- Storing the character received
localparam DAV = 2'd3;   //-- Data is available
reg [1:0] state;
reg [1:0] next_state;
always @(posedge clk)
  if (!rstn)
    state <= IDLE;
  else
    state <= next_state;
always @(*) begin
  next_state = state;      //-- Stay in the same state by default
  bauden = 0;
  clear = 0;
  load = 0;
  case(state)
    IDLE: begin
      clear = 1;
      rcv = 0;
      if (rx_r == 0)
        next_state = RECV;
    end
    RECV: begin
      bauden = 1;
      rcv = 0;
      if (bitc == 4'd10)
        next_state = LOAD;
    end
    LOAD: begin
      load = 1;
      rcv = 0;
      next_state = DAV;
    end
    DAV: begin
      rcv = 1;
      next_state = IDLE;
    end
    default:
      rcv = 0;
  endcase
end
endmodule