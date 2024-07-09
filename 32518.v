module TestBench_Lab2 (
			  output reg 	   clk,
			  output reg [8:0] key_input
       );
   initial
     begin
	clk = 0;
	key_input = 9'b0;
     end
   always
     begin
	#5 clk = ~clk;
     end
   // For the test case assigned below, the LED output should be 5'b00001
   // There is an initial delay of 500 ns because the slow clock (in pwm_controller.v file) needs to be set up
   // This slow clock is at 1 MHz while system clock is at 100 MHz
   initial begin
     # 500
     #10000000
	  key_input <= {2'b00, 7'b0000001};
      $display("key_input = %b ", key_input);
     #10000000
	key_input <= {2'b00, 7'b0000001};
      $display("key_input = %b ", key_input);
     #10000000
	key_input <= {2'b01, 7'b0000010};
      $display("key_input = %b ", key_input);
     #10000000
	key_input <= {2'b01, 7'b0000100};
      $display("key_input = %b ", key_input);
     #10000000
	key_input <= {2'b10, 7'b0001000};
      $display("key_input = %b ", key_input);
     #10000000
	key_input <= {2'b10, 7'b0010000};
      $display("key_input = %b ", key_input);
     #10000000
	key_input <= {2'b00, 7'b0100000};
      $display("key_input = %b ", key_input);
     #10000000
	key_input <= {2'b11, 7'b1000000};
      $display("key_input = %b ", key_input);
    #10000000 $finish;
   end
endmodule