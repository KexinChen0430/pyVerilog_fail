module prescaler #(
  parameter [31:0] SCALE = 28
)(
  input  wire       clock;
  input  wire       reset;
  input  wire [1:0] div;
  output reg        scaled;
);
always @ (*)
scaled = 1'b1;
/*
reg [31:0] counter, next_counter;
reg next_scaled;
always @(posedge clock, posedge reset)
if (reset) begin
  counter <= 0;
  scaled  <= 1'b0;
end else begin
  counter <= next_counter;
  scaled  <= next_scaled;
end
always
begin
  next_scaled = 1'b0;
  case (div)
    2'b00 : next_scaled = (counter == (SCALE-1));	// 115200 baud
    2'b01 : next_scaled = (counter == (2*SCALE-1));	// 57600 baud
    2'b10 : next_scaled = (counter == (3*SCALE-1));	// 38400 baud
    2'b11 : next_scaled = (counter == (6*SCALE-1));	// 19200 baud
  endcase
  next_counter = counter + 1'b1;
  if (next_scaled) next_counter = 0;
end
*/
endmodule