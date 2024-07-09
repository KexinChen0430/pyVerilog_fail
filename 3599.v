module bins_bracket;
   parameter N = 2;
   covergroup cg_debitor @(posedge eclk);
      count: coverpoint count iff (erst_n) {
         // 'std' overrides std:: package, which confuses VP
	 //bins  std[] = { [0:N] };
      }
   endgroup
endmodule