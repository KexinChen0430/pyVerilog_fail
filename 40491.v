module works by assuming the msbs were the bit pairs in, k+2*n-1 assures the instantiation goes down the line as genvar goes up.
	      doublencomparator dnc(.x0(x[2*n-1-k]), .x1(x[2*n-2-k]), .y0(y[2*n-1-k]), .y1(y[2*n-2-k]),
	                              .eqin(eqcarry[k/2]), .gtin(gtcarry[k/2]), .ltin(ltcarry[k/2]),
	                              .eqout(eqcarry[k/2+1]), .gtout(gtcarry[k/2+1]), .ltout(ltcarry[k/2+1]));  //just trying out this syntax.
  endgenerate
  assign eqbit = eqcarry[n];
  assign gtbit = gtcarry[n];
  assign ltbit = ltcarry[n];
  assign eqdbbit = x == y;
  assign gtdbbit = x > y;
  assign ltdbbit = ~(eqdbbit | gtdbbit);
  assign agree = {eqdbbit, gtdbbit, ltdbbit} == {eqbit, gtbit, ltbit};
  always @(agree)
  begin
    if (~agree)
      begin: monitor_output
        $display("Simulation disagreed on x = %b , y = %b", x, y);
        $display("eqbit: %b , eqdbbit: %b", eqbit, eqdbbit);
        $display("gtbit: %b , gtdbbit: %b", gtbit, gtdbbit);
        $display("ltbit: %b , ltdbbit: %b", ltbit, ltdbbit);
      end
  end
  always @(x[2*n-1])
    if ((x == 8'b0) && (y == 8'b11111111))
      $display("All variations compared");
endmodule