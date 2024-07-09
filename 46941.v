module ex_statcou( CLK, RST_N, STATSIGS, ADDR, DATA);
input			CLK;
input			RST_N;
input	 [7:0]	STATSIGS;
input	 [2:0]	ADDR;
output	[31:0]	DATA;
integer 		i;
reg		[31:0]	counter	[0:7];
	always @(posedge CLK or negedge RST_N)
		for (i=0; i<=7; i=i+1)
			if (!RST_N) counter[i] <= 32'd0;
				else counter[i] <= counter[i] + {31'd0,STATSIGS[i]};
	assign DATA = counter[ADDR];
endmodule