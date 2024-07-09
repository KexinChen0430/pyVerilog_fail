module t_div_pipelined();
  reg clk, start, reset_n;
  reg [7:0] dividend, divisor;
  wire      data_valid, div_by_zero;
  wire [7:0] quotient, quotient_correct;
  parameter
    BITS  = 8;
  div_pipelined
    #(
      .BITS(BITS)
      )
  div_pipelined
    (
     .clk(clk),
     .reset_n(reset_n),
     .dividend(dividend),
     .divisor(divisor),
     .quotient(quotient),
     .div_by_zero(div_by_zero),
     //     .quotient_correct(quotient_correct),
     .start(start),
     .data_valid(data_valid)
     );
  initial begin
    #10 reset_n  = 0;
    #50 reset_n  = 1;
    #1
    clk          = 0;
    dividend     = -1;
    divisor      = 127;
    #1000 $finish;
  end
//  always
//    #20 dividend  = dividend + 1;
  always begin
    #10 divisor  = divisor - 1; start = 1;
    #10 start    = 0;
  end
  always
    #5 clk  = ~clk;
endmodule