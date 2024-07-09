module xrs(
	input		clk_i,
	input	[4:0]	rd_i,
	input	[63:0]	rdat_i,
	input	[2:0]	rwe_i,
	output	[63:0]	rdata_o,
	output	[63:0]	rdatb_o,
	input	[4:0]	ra_i,
	input	[4:0]	rb_i
);
	wire	[63:0]	rx_dat  = ((rwe_i == `XRS_RWE_U8) ? {56'd0, rdat_i[7:0]} : 0)
				| ((rwe_i == `XRS_RWE_U16) ? {48'd0, rdat_i[15:0]} : 0)
				| ((rwe_i == `XRS_RWE_U32) ? {32'd0, rdat_i[31:0]} : 0)
				| ((rwe_i == `XRS_RWE_S8) ? {{56{rdat_i[7]}}, rdat_i[7:0]} : 0)
				| ((rwe_i == `XRS_RWE_S16) ? {{48{rdat_i[15]}}, rdat_i[15:0]} : 0)
				| ((rwe_i == `XRS_RWE_S32) ? {{32{rdat_i[31]}}, rdat_i[31:0]} : 0)
				| ((rwe_i == `XRS_RWE_S64) ? rdat_i : 0)
				;
	wire	wen = |rwe_i;
	wire	[63:0]	data_o, datb_o;
	reg	[4:0]	ra_r, rb_r;
	assign rdata_o = (|ra_r) ? data_o : 0;
	assign rdatb_o = (|rb_r) ? datb_o : 0;
	always @(posedge clk_i) begin
		ra_r <= ra_i;
		rb_r <= rb_i;
	end
	ram64b port0(
		.wdata(rx_dat),
		.wen(wen),
		.waddr(rd_i),
		.wclk(clk_i),
		.rdata(data_o),
		.raddr(ra_i),
		.rclk(clk_i)
	);
	ram64b port1(
		.wdata(rx_dat),
		.wen(wen),
		.waddr(rd_i),
		.wclk(clk_i),
		.rdata(datb_o),
		.raddr(rb_i),
		.rclk(clk_i)
	);
endmodule