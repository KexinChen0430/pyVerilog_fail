module gpio (
	/********** NbN & Zbg **********/
	input  wire						clk,	 // NbN
	input  wire						reset,	 // Zbg
	/********** oXC^tF[X **********/
	input  wire						cs_,	 // `bvZNg
	input  wire						as_,	 // AhXXg[u
	input  wire						rw,		 // Read / Write
	input  wire [`GpioAddrBus]		addr,	 // AhX
	input  wire [`WordDataBus]		wr_data, // «Ýf[^
	output reg	[`WordDataBus]		rd_data, // ÇÝoµf[^
	output reg						rdy_	 // fB
	/********** ÄpüoÍ|[g **********/
`ifdef GPIO_IN_CH	 // üÍ|[gÌÀ
	, input wire [`GPIO_IN_CH-1:0]	gpio_in	 // üÍ|[gi§äWX^0j
`endif
`ifdef GPIO_OUT_CH	 // oÍ|[gÌÀ
	, output reg [`GPIO_OUT_CH-1:0] gpio_out // oÍ|[gi§äWX^1j
`endif
`ifdef GPIO_IO_CH	 // üoÍ|[gÌÀ
	, inout wire [`GPIO_IO_CH-1:0]	gpio_io	 // üoÍ|[gi§äWX^2j
`endif
);
`ifdef GPIO_IO_CH	 // üoÍ|[gÌ§ä
	/********** üoÍM **********/
	wire [`GPIO_IO_CH-1:0]			io_in;	 // üÍf[^
	reg	 [`GPIO_IO_CH-1:0]			io_out;	 // oÍf[^
	reg	 [`GPIO_IO_CH-1:0]			io_dir;	 // üoÍûüi§äWX^3j
	reg	 [`GPIO_IO_CH-1:0]			io;		 // üoÍ
	integer							i;		 // Ce[^
	/********** üoÍMÌp±ãü **********/
	assign io_in	   = gpio_io;			 // üÍf[^
	assign gpio_io	   = io;				 // üoÍ
	/********** üoÍûüÌ§ä **********/
	always @(*) begin
		for (i = 0; i < `GPIO_IO_CH; i = i + 1) begin : IO_DIR
			io[i] = (io_dir[i] == `GPIO_DIR_IN) ? 1'bz : io_out[i];
		end
	end
`endif
	/********** GPIOÌ§ä **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ñ¯úZbg */
			rd_data	 <= #1 `WORD_DATA_W'h0;
			rdy_	 <= #1 `DISABLE_;
`ifdef GPIO_OUT_CH	 // oÍ|[gÌZbg
			gpio_out <= #1 {`GPIO_OUT_CH{`LOW}};
`endif
`ifdef GPIO_IO_CH	 // üoÍ|[gÌZbg
			io_out	 <= #1 {`GPIO_IO_CH{`LOW}};
			io_dir	 <= #1 {`GPIO_IO_CH{`GPIO_DIR_IN}};
`endif
		end else begin
			/* fBÌ¶¬ */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_)) begin
				rdy_	 <= #1 `ENABLE_;
			end else begin
				rdy_	 <= #1 `DISABLE_;
			end
			/* ÇÝoµANZX */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) && (rw == `READ)) begin
				case (addr)
`ifdef GPIO_IN_CH	// üÍ|[gÌÇÝoµ
					`GPIO_ADDR_IN_DATA	: begin // §äWX^ 0
						rd_data	 <= #1 {{`WORD_DATA_W-`GPIO_IN_CH{1'b0}},
										gpio_in};
					end
`endif
`ifdef GPIO_OUT_CH	// oÍ|[gÌÇÝoµ
					`GPIO_ADDR_OUT_DATA : begin // §äWX^ 1
						rd_data	 <= #1 {{`WORD_DATA_W-`GPIO_OUT_CH{1'b0}},
										gpio_out};
					end
`endif
`ifdef GPIO_IO_CH	// üoÍ|[gÌÇÝoµ
					`GPIO_ADDR_IO_DATA	: begin // §äWX^ 2
						rd_data	 <= #1 {{`WORD_DATA_W-`GPIO_IO_CH{1'b0}},
										io_in};
					 end
					`GPIO_ADDR_IO_DIR	: begin // §äWX^ 3
						rd_data	 <= #1 {{`WORD_DATA_W-`GPIO_IO_CH{1'b0}},
										io_dir};
					end
`endif
				endcase
			end else begin
				rd_data	 <= #1 `WORD_DATA_W'h0;
			end
			/* «ÝANZX */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) && (rw == `WRITE)) begin
				case (addr)
`ifdef GPIO_OUT_CH	// oÍ|[gÖÌ«±Ý
					`GPIO_ADDR_OUT_DATA : begin // §äWX^ 1
						gpio_out <= #1 wr_data[`GPIO_OUT_CH-1:0];
					end
`endif
`ifdef GPIO_IO_CH	// üoÍ|[gÖÌ«±Ý
					`GPIO_ADDR_IO_DATA	: begin // §äWX^ 2
						io_out	 <= #1 wr_data[`GPIO_IO_CH-1:0];
					 end
					`GPIO_ADDR_IO_DIR	: begin // §äWX^ 3
						io_dir	 <= #1 wr_data[`GPIO_IO_CH-1:0];
					end
`endif
				endcase
			end
		end
	end
endmodule