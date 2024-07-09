module RegFileTestbench;
   reg [31:0] data;
   reg [4:0] addrA, addrB, addrC;
   wire [31:0] outA;
   wire [31:0] outB;
   reg clks, clr, WE;
   integer ctr;
   registerfile UUT(addrA, outA, addrB, outB, addrC, data, clks, clr, WE);
   initial begin
       clks = 0;
       #10 clr = 0;
       WE = 0;
       for (ctr=0; ctr<31; ctr = ctr+1)
       begin
           #25 addrA <= ctr;
               addrB = ctr+1;
       end
       addrA = 2;
       addrB = 3;
       addrC = 3;
       WE = 1;
       for (ctr=0; ctr<10; ctr = ctr+1)
       begin
           #25 data <= ctr;
       end
       WE = 0;
   end
   initial
       forever #20 clks = ~clks;
   initial
      #1100 $stop;
endmodule