module main();
   reg rst, clk;
   wire `REQ req;
   wire `RES res;
   wire [31:0] addr = req`A;
   wire        read = req`R;
   wire        wai  = res`WAIT;
   wire [31:0] data = res`RD;
   initiator  initiator1(clk, rst, req1, res1);
   initiator  initiator2(clk, rst, req2, res2);
   mux2       mux_init(clk, req1, res1, req2, res2, req, res);
   slowtarget target(clk, rst, req, res);
   always # 5 clk = ~clk;
   initial begin
      $monitor("%d%d %4d %x %d %d %x", rst, clk, $time, addr, read, wai, data);
      clk = 1;
      rst = 1;
      #15 rst = 0;
      #200 $finish;
   end
endmodule