module t (/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
   logic   rst = 1'b1;  // reset
   integer rst_cnt = 0;
   // reset is removed after a delay
   always @ (posedge clk)
   begin
      rst_cnt <= rst_cnt + 1;
      rst     <= rst_cnt <= 3;
   end
   // counters
   int cnt;
   int cnt_src;
   int cnt_drn;
   // add all counters
   assign cnt = cnt_src + cnt_drn + inf.cnt;
   // finish report
   always @ (posedge clk)
   if (cnt == 3*16) begin
      $write("*-* All Finished *-*\n");
      $finish;
   end
   // interface instance
   handshake inf (
      .clk (clk),
      .rst (rst)
   );
   // source instance
   source #(
      .RW  (8),
      .RP  (8'b11100001)
   ) source (
      .clk  (clk),
      .rst  (rst),
      .inf  (inf),
      .cnt  (cnt_src)
   );
   // drain instance
   drain #(
      .RW  (8),
      .RP  (8'b11010100)
   ) drain (
      .clk  (clk),
      .rst  (rst),
      .inf  (inf),
      .cnt  (cnt_drn)
   );
endmodule