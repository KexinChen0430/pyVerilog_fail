module of core 'X' signals are system inputs
   // and 'Y' signals are system outputs
   dft_top dft_top_instance (.clk(clk), .reset(reset), .next(next), .next_out(next_out),
    .X0(X0), .Y0(Y0),
    .X1(X1), .Y1(Y1),
    .X2(X2), .Y2(Y2),
    .X3(X3), .Y3(Y3));
   // You can use this counter to verify that the gap and latency are as expected.
   always @(posedge clk) begin
      if (clrCnt) counter <= 0;
      else counter <= counter+1;
   end
   initial begin
      @(posedge clk);
      @(posedge clk);
      // On the next cycle, begin loading input vector.
      next <= 1;
      clrCnt <= 1;
      @(posedge clk);
      clrCnt <= 0;
      next <= 0;
      // The 2048 complex data points enter the system over 1024 cycles
      for (j=0; j < 1023; j = j+1) begin
          // Input: 2 complex words per cycle
         for (k=0; k < 4; k = k+1) begin
            in[k] <= j*4 + k;
         end
         @(posedge clk);
      end
      j = 1023;
      for (k=0; k < 4; k = k+1) begin
         in[k] <= j*4 + k;
      end
      @(posedge clk);
      // Wait until the next data vector can be entered
      while (counter < 11285)
        @(posedge clk);
      // On the next cycle, we will start the next data vector
      next <= 1;
      clrCnt <= 1;
      @(posedge clk);
      clrCnt <= 0;
      next <= 0;
      // Start entering next input vector
      for (j=0; j < 1023; j = j+1) begin
         // Input 4 words per cycle
         for (k=0; k < 4; k = k+1) begin
            in[k] <= 4096 + j*4 + k;
          end
          @(posedge clk);
       end
       j = 1023;
       for (k=0; k < 4; k = k+1) begin
          in[k] <= 4096 + j*4 + k;
       end
   end
   initial begin
      // set initial values
      in[0] <= 0;
      in[1] <= 0;
      in[2] <= 0;
      in[3] <= 0;
      next <= 0;
      reset <= 0;
      @(posedge clk);
      reset <= 1;
      @(posedge clk);
      reset <= 0;
      @(posedge clk);
      @(posedge clk);
      // Wait until next_out goes high, then wait one clock cycle and begin receiving data
      @(posedge next_out);
      @(posedge clk); #1;
      $display("--- begin output 1---");
      for (m=0; m < 1023; m=m+1) begin
         $display("%x", Y0);
         $display("%x", Y1);
         $display("%x", Y2);
         $display("%x", Y3);
         @(posedge clk); #1;
      end
      $display("%x", Y0);
      $display("%x", Y1);
      $display("%x", Y2);
      $display("%x", Y3);
      // Wait until next_out goes high, then wait one clock cycle and begin receiving data
      @(posedge next_out);
      @(posedge clk); #1;
      $display("--- begin output 2---");
      for (m=0; m < 1023; m=m+1) begin
         $display("%x", Y0);
         $display("%x", Y1);
         $display("%x", Y2);
         $display("%x", Y3);
         @(posedge clk); #1;
      end
      $display("%x", Y0);
      $display("%x", Y1);
      $display("%x", Y2);
      $display("%x", Y3);
      $finish;
   end
endmodule