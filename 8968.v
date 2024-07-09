module body
	// delay d
	always @(posedge clk)
	  if (ena)
	    id <= #1 d;
	// check z, take abs value
	always @(posedge clk)
	  if (ena)
	    if (z[z_width-1])
	       iz <= #1 ~z +1'h1;
	    else
	       iz <= #1 z;
	// generate spipe (sign bit pipe)
	integer n;
	always @(posedge clk)
	  if(ena)
	  begin
	      spipe[0] <= #1 z[z_width-1];
	      for(n=1; n <= d_width+1; n=n+1)
	         spipe[n] <= #1 spipe[n-1];
	  end
	// hookup non-restoring divider
	div_uu #(z_width, d_width)
	divider (
		.clk(clk),
		.ena(ena),
		.z(iz),
		.d(id),
		.q(iq),
		.s(is),
		.div0(idiv0),
		.ovf(iovf)
	);
	// correct divider results if 'd' was negative
	always @(posedge clk)
	  if(ena)
	    if(spipe[d_width+1])
	    begin
	        q <= #1 (~iq) + 1'h1;
	        s <= #1 (~is) + 1'h1;
	    end
	    else
	    begin
	        q <= #1 {1'b0, iq};
	        s <= #1 {1'b0, is};
	    end
	// delay flags same as results
	always @(posedge clk)
	  if(ena)
	  begin
	      div0 <= #1 idiv0;
	      ovf  <= #1 iovf;
	  end
endmodule