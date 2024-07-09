module testbed_lo_simulate;
	reg  pck0;
	reg  [7:0] adc_d;
	wire pwr_lo;
	wire adc_clk;
	wire ck_1356meg;
	wire ck_1356megb;
	wire ssp_frame;
	wire ssp_din;
	wire ssp_clk;
	reg  ssp_dout;
	wire pwr_hi;
	wire pwr_oe1;
	wire pwr_oe2;
	wire pwr_oe3;
	wire pwr_oe4;
	reg  cross_lo;
	wire cross_hi;
	wire dbg;
	lo_simulate #(5,200) dut(
	.pck0(pck0),
	.ck_1356meg(ck_1356meg),
	.ck_1356megb(ck_1356megb),
	.pwr_lo(pwr_lo),
	.pwr_hi(pwr_hi),
	.pwr_oe1(pwr_oe1),
	.pwr_oe2(pwr_oe2),
	.pwr_oe3(pwr_oe3),
	.pwr_oe4(pwr_oe4),
	.adc_d(adc_d),
	.adc_clk(adc_clk),
	.ssp_frame(ssp_frame),
	.ssp_din(ssp_din),
	.ssp_dout(ssp_dout),
	.ssp_clk(ssp_clk),
	.cross_hi(cross_hi),
	.cross_lo(cross_lo),
	.dbg(dbg)
	);
	integer i, counter=0;
	// main clock
	always #5 pck0 = !pck0;
	//cross_lo is not really synced to pck0 but it's roughly pck0/192 (24Mhz/192=125Khz)
	task crank_dut;
	begin
		@(posedge pck0) ;
		counter = counter + 1;
		if (counter == 192) begin
			counter = 0;
			ssp_dout = $random;
			cross_lo = 1;
		end else begin
			cross_lo = 0;
		end
	end
	endtask
	initial begin
		pck0 = 0;
		for (i = 0 ;  i < 4096 ;  i = i + 1) begin
			crank_dut;
		end
		$finish;
	end
endmodule