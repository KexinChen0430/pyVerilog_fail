module top();
  reg consumer_iclk;
  reg producer_iclk;
  wire cr;
  wire [3:0] cd;
  wire [3:0] pd;
  reg clk;
  always@(posedge clk)
    begin
      #10 assign consumer_iclk = ~consumer_iclk;
      #5 assign producer_iclk = ~producer_iclk;
    end
  always
    #1 assign clk = ~clk;
  initial
         begin
           /*
		  consumer_iclk = 0;
		  producer_iclk = 0;
		  cr =0;
		  cd=0;
		  pd=0;
  */
   #5000 $finish;
         end
  producer p1(
    pd
    );
  fifo f1(
    cd,
    pd,
    cr
  );
  consumer c1(
    cr,
    cd
  );
endmodule