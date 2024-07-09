module tb(input clk_i);
   localparam tests_p = 10;
   wire [tests_p-1:0] finish_lo;
   test_case #(6,1)  tc61  (.clk_i,.finish_o(finish_lo[0]),.go_i(1));
   test_case #(6,2)  tc62  (.clk_i,.finish_o(finish_lo[1]),.go_i(finish_lo[0]));
   test_case #(6,3)  tc63  (.clk_i,.finish_o(finish_lo[2]),.go_i(finish_lo[1]));
   test_case #(6,4)  tc64  (.clk_i,.finish_o(finish_lo[3]),.go_i(finish_lo[2]));
   test_case #(6,6)  tc66  (.clk_i,.finish_o(finish_lo[4]),.go_i(finish_lo[3]));
   test_case #(6,7)  tc67  (.clk_i,.finish_o(finish_lo[5]),.go_i(finish_lo[4]));
   test_case #(8,7)  tc87  (.clk_i,.finish_o(finish_lo[6]),.go_i(finish_lo[5]));
   test_case #(6,8)  tc68  (.clk_i,.finish_o(finish_lo[7]),.go_i(finish_lo[6]));
   test_case #(6,12) tc612 (.clk_i,.finish_o(finish_lo[8]),.go_i(finish_lo[7]));
   test_case #(8,15) tc815 (.clk_i,.finish_o(finish_lo[9]),.go_i(finish_lo[8]));
   always @(*)
   if (&finish_lo)
     $finish();
endmodule