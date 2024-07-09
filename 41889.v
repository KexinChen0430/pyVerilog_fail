module range_counter(
    /*  input */ clk, reset, en,
    /* output */ out, empty, full
  );
  parameter integer MIN = 0;
  parameter integer MAX = 255;
  parameter integer INC = 1;    // increment (per enabled cycle)
  input clk, reset, en;
  output integer out;
  output reg empty; // true for at most one cycle
  output reg full; // true for at most one cycle
  always @(posedge clk)
    if (reset) begin
      out <= MIN;
      full <= 0;
      empty <= 0;
    end else if (en) begin
      full  <= (out == MAX - INC);
      empty <= (out == MAX);
      out   <= (out == MAX) ? MIN : out + INC;
    end else begin
      // not reset, and not enabled, so leave `out` alone
      full <= 0;
      empty <= 0;
    end
endmodule