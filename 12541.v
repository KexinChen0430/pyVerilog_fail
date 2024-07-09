module txstr #(
          parameter BAUDRATE = `B115200
)(
          input wire clk,   //-- System clock
          input wire rstn,  //-- Reset (active low)
          output wire tx    //-- Serial data output
);
uart_tx #(
    .BAUDRATE(BAUDRATE)  //-- Set the baudrate
  ) TX0 (
    .clk(clk),
    .rstn(rstn),
    .data(data),
    .start(start),
    .tx(tx),
    .ready(ready)
);
wire ready;
reg start = 0;
reg [7:0] data;
always @*
  case (char_count)
    8'd0: data <= "H";
    8'd1: data <= "e";
    8'd2: data <= "l";
    8'd3: data <= "l";
    8'd4: data <= "o";
    8'd5: data <= "!";
    8'd6: data <= ".";
    8'd7: data <= ".";
    default: data <= ".";
  endcase
reg [2:0] char_count;
reg cena;                //-- Counter enable
always @(posedge clk)
  if (!rstn)
    char_count = 0;
  else if (cena)
    char_count = char_count + 1;
localparam INI = 0;
localparam TXCAR = 1;
localparam NEXTCAR = 2;
localparam STOP = 3;
reg [1:0] state;
reg [1:0] next_state;
always @(posedge clk) begin
  if (!rstn)
    state <= INI;
  else
    state <= next_state;
end
always @(*) begin
  next_state = state;
  start = 0;
  cena = 0;
  case (state)
    INI: begin
      start = 1;
      next_state = TXCAR;
    end
    TXCAR: begin
      if (ready)
        next_state = NEXTCAR;
    end
    NEXTCAR: begin
      cena = 1;
      if (char_count == 7)
        next_state = STOP;
      else
        next_state = INI;
    end
  endcase
end
endmodule