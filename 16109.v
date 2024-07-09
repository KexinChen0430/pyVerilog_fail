module FIFO_testbench();
  reg clk;
  reg reset;
  reg write;
  reg read;
  reg [7:0] data_in;
  wire [7:0] data_out;
  wire full;
  wire empty;
  FIFO_four u1 (clk, reset, write, read, data_in, data_out, full, empty);
  always
    begin
     #5 clk <= ~clk;
    end
  initial
    begin
      clk = 1;
      #20
      reset = 0;
      write = 0;
      read = 0;
      data_in = 0;
      #20
      reset = 1;
      #20
      repeat(18)
        begin
          #10
          write = 1;
          data_in = data_in + 2;
          #10
          write = 0;
        end
      $finish;
    end
endmodule