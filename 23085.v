module dram_2048x2(
		  input 		      w_clk,
		  input 		      r_clk,
		  input 		      w_clk_en,
		  input 		      r_clk_en,
		  input 		      we,
		  input [ADDR_WIDTH - 1 : 0]  waddr,
		  input [DATA_WIDTH - 1 : 0]  d,
		  input 		      re,
		  input [ADDR_WIDTH - 1 : 0]  raddr,
		  output [DATA_WIDTH - 1 : 0] q
		  );
   localparam DATA_WIDTH = 2;
   localparam ADDR_WIDTH = 11;
   localparam RAM_DATA_WIDTH = 16;
   localparam RAM_ADDR_WIDTH = 11;
   wire [RAM_DATA_WIDTH - 1 : 0] 	      _d, _q;
   wire [RAM_ADDR_WIDTH - 1 : 0] 	      _waddr, _raddr;
   assign _waddr = waddr;
   assign _raddr = raddr;
   genvar 				      i;
   for (i = 0; i < 2; i=i+1)
     begin
	assign _d[i * 8 + 2 : i * 8]     = 0;
	assign _d[i * 8 + 3]             = d[i];
	assign _d[i * 8 + 7 : i * 8 + 4] = 0;
	assign q[i] = _q[i * 8 + 3];
     end
   dram_#(
	  .MODE(3)
	  ) dram_(
			.w_clk(w_clk),
			.r_clk(r_clk),
			.w_clk_en(w_clk_en),
			.r_clk_en(r_clk_en),
			.we(we),
			.waddr(_waddr),
			.d(_d),
			.re(re),
			.raddr(_raddr),
			.q(_q),
			.mask(16'b0)
			);
endmodule