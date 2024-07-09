module test_case #(parameter width_p, parameter banks_p) (input clk_i, input go_i, output finish_o);
  reg [width_p-1:0] lo;
  reg [width_p:0] in_r;
  wire [$clog2((2**width_p+banks_p-1)/banks_p)-1:0] index_lo;
  wire [`BSG_SAFE_CLOG2(banks_p)-1:0] bank_lo;
//  bsg_nonsynth_clock_gen #(.cycle_time_p(5)) clkgen (.o(clk));
  bsg_hash_bank #(.banks_p(banks_p), .width_p(width_p))
             hashme (/* .clk,*/
                     .i( in_r[width_p-1:0] ),
//                     .i({in_r[1:0],in_r[5:2]}),
                     .bank_o(bank_lo),
                     .index_o(index_lo)
                    );
  bsg_hash_bank_reverse #(.banks_p(banks_p), .width_p(width_p))
                          unhashme (/* .clk,*/
                                    .o( lo ),
                                    //                     .i({in_r[1:0],in_r[5:2]}),
                                    .bank_i(bank_lo),
                     .index_i(index_lo)
                    );
  initial in_r = 0;
  reg finish_r;
  initial finish_r = 0;
  always @(posedge clk_i)
    begin
      if (!finish_r & go_i)
	begin
	   in_r <= in_r + 1;
	   finish_r <= in_r[width_p];
	end
    end
  assign finish_o = finish_r;
  always @(negedge clk_i)
    begin
      // $display ("%b -> %b %b -> %b", in_r, bucket_lo, index_lo,lo);
      if (lo != in_r[width_p-1:0])
        $display("(%3d,%3d) MISMATCH: %b -> %b %b -> %b",width_p,banks_p,in_r[width_p-1:0],bank_lo, index_lo, lo);
      else
	if (!finish_r & go_i)
        $display("(%3d,%3d) match:    %b -> %b %b -> %b",width_p,banks_p,in_r[width_p-1:0],bank_lo, index_lo, lo);
    end
endmodule