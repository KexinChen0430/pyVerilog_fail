module line_buffer#(
  parameter WIDTH=1,
  parameter LINE_LENGTH=1,
  parameter NUM_LINES=1,
  parameter WINDOW_WIDTH=1
  ) (
    input wire clk,
    input wire rst,
    input wire  [WIDTH-1:0] inp,
    output wire [WIDTH*NUM_LINES*WINDOW_WIDTH-1:0] outp
  );
  localparam OUT_WIDTH = WIDTH*NUM_LINES*WINDOW_WIDTH;
  localparam TAP_WIDTH = WIDTH*WINDOW_WIDTH;
  wire[WIDTH*WINDOW_WIDTH-1:0] window_line[NUM_LINES];
  wire[WIDTH-1:0] next_line[NUM_LINES];
  tapped_fifo#(.WIDTH(WIDTH), .DEPTH(WINDOW_WIDTH))
      tf(clk, rst, inp, window_line[0], next_line[0]);
  assign outp[(OUT_WIDTH-1):(OUT_WIDTH-TAP_WIDTH)] = window_line[0];
  genvar i;
  generate
  for (i = 1; i < NUM_LINES; i++) begin : lines
    wire[WIDTH-1:0] connection;
    fifo#(.WIDTH(WIDTH), .DEPTH(LINE_LENGTH-WINDOW_WIDTH))
         f(clk, rst, next_line[i-1], connection);
    tapped_fifo#(.WIDTH(WIDTH), .DEPTH(WINDOW_WIDTH))
         tf(clk, rst, connection, window_line[i], next_line[i]);
    assign outp[(OUT_WIDTH-TAP_WIDTH*(i)-1):(OUT_WIDTH-TAP_WIDTH*(i+1))] =
      window_line[i];
  end
  endgenerate
endmodule