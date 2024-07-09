module testbed_lo_read;
	reg  pck0;
	reg  [7:0] adc_d;
	reg  lo_is_125khz;
	reg [15:0] divisor;
	wire pwr_lo;
	wire adc_clk;
	wire ck_1356meg;
	wire ck_1356megb;
	wire ssp_frame;
	wire ssp_din;
	wire ssp_clk;
	reg ssp_dout;
	wire pwr_hi;
	wire pwr_oe1;
	wire pwr_oe2;
	wire pwr_oe3;
	wire pwr_oe4;
	wire cross_lo;
	wire cross_hi;
	wire dbg;
	lo_read #(5,10) dut(
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
	.dbg(dbg),
	.lo_is_125khz(lo_is_125khz),
	.divisor(divisor)
	);
	integer idx, i, adc_val=8;
	// main clock
	always #5 pck0 = !pck0;
	task crank_dut;
	begin
		@(posedge adc_clk) ;
		adc_d = adc_val;
		adc_val = (adc_val *2) + 53;
	end
	endtask
	initial begin
		// init inputs
		pck0 = 0;
		adc_d = 0;
		ssp_dout = 0;
		lo_is_125khz = 1;
		divisor = 255;  //min 16, 95=125Khz, max 255
		// simulate 4 A/D cycles at 125Khz
		for (i = 0 ;  i < 8 ;  i = i + 1) begin
			crank_dut;
		end
		$finish;
	end
endmodule