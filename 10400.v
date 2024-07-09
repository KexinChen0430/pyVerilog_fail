module body
	assign icoef = { {(mwidth-cwidth){coef[cwidth-1]}}, coef};
	assign idin  = { {(mwidth-dwidth){din[dwidth-1]}}, din};
	// generate multiplier structure
	always @(posedge clk)
	  if(ena)
	    mult_res <= #1 icoef * idin;
	assign ext_mult_res = { {3{mult_res[mwidth-1]}}, mult_res};
	// generate adder structure
	always @(posedge clk)
	  if(ena)
	    if(dclr)
	      result <= #1 ext_mult_res;
	    else
	      result <= #1 ext_mult_res + result;
endmodule