module main();
   reg rst, clk;
   wire `REQ req, req1, req2, reqA, reqB;
   wire `RES res, res1, res2, resA, resB;
   wire [31:0] addr1 = req1`A;
   wire        read1 = req1`R;
   wire        wai1  = res1`WAIT;
   wire [31:0] data1 = res1`RD;
   wire [31:0] addr2 = req2`A;
   wire        read2 = req2`R;
   wire        wai2  = res2`WAIT;
   wire [31:0] data2 = res2`RD;
   reader  #(1) reader1(clk, rst, req1, res1);
   writer  #(2) writer2(clk, rst, req2, res2);
   slowtarget #(1) target1(clk, rst, reqA, resA);
   slowtarget #(2) target2(clk, rst, reqB, resB);
   xbar2x2    xbar(clk,
                   addr1[2], req1, res1,
                   addr2[2], req2, res2,
                   reqA, resA,
                   reqB, resB);
   always # 5 clk = ~clk;
   initial begin
      $monitor(// "%d%d %4d 1: %x %d %d %x  2: %x %d %d %x",
               "%4d 1: %x %d %d %x  2: %x %d %d %x",
               // rst, clk,
               $time,
               addr1, read1, wai1, data1,
               addr2, read2, wai2, data2);
      clk = 1;
      rst = 1;
      #15 rst = 0;
      #20000 $finish;
   end
endmodule