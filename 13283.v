module rom (
	/********** NbN & Zbg **********/
	input  wire				   clk,		// NbN
	input  wire				   reset,	// ñ¯úZbg
	/********** oXC^tF[X **********/
	input  wire				   cs_,		// `bvZNg
	input  wire				   as_,		// AhXXg[u
	input  wire [`RomAddrBus]  addr,	// AhX
	output wire [`WordDataBus] rd_data, // ÇÝoµf[^
	output reg				   rdy_		// fB
);
	/********** Xilinx FPGA Block RAM : VO|[gROM **********/
	x_s3e_sprom x_s3e_sprom (
		.clka  (clk),					// NbN
		.addra (addr),					// AhX
		.douta (rd_data)				// ÇÝoµf[^
	);
	/********** fBÌ¶¬ **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ñ¯úZbg */
			rdy_ <= #1 `DISABLE_;
		end else begin
			/* fBÌ¶¬ */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_)) begin
				rdy_ <= #1 `ENABLE_;
			end else begin
				rdy_ <= #1 `DISABLE_;
			end
		end
	end
endmodule