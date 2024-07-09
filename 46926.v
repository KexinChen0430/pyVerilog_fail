module MMCME2_BASE_tb();
	wire CLKOUT[0:6];
	wire CLKOUTB[0:3];
	wire CLKFBOUT;
	wire CLKFBOUTB;
	wire LOCKED;
	reg CLKIN1;
	reg PWRDWN;
	reg RST;
	wire CLKFBIN;
	integer	pass_count;
	integer	fail_count;
	/* change according to the number of test cases */
	localparam total = 31;
	reg reset;
	wire [31:0] period_1000[0:6];
	wire [31:0] period_1000_fb;
	wire dcc_fail[0:6];
	wire dcc_fail_fb;
	wire psc_fail[0:6];
	wire psc_fail_fb;
	wire [31:0] CLKOUT_DIVIDE_1000[0:6];
	assign CLKOUT_DIVIDE_1000[0] = `CLKOUT0_DIVIDE_F * 1000;
	assign CLKOUT_DIVIDE_1000[1] = `CLKOUT1_DIVIDE * 1000;
	assign CLKOUT_DIVIDE_1000[2] = `CLKOUT2_DIVIDE * 1000;
	assign CLKOUT_DIVIDE_1000[3] = `CLKOUT3_DIVIDE * 1000;
	assign CLKOUT_DIVIDE_1000[4] = `CLKOUT4_DIVIDE * 1000;
	assign CLKOUT_DIVIDE_1000[5] = `CLKOUT5_DIVIDE * 1000;
	assign CLKOUT_DIVIDE_1000[6] = `CLKOUT6_DIVIDE * 1000;
	wire [31:0] CLKOUT_DUTY_CYCLE_1000[0:6];
	assign CLKOUT_DUTY_CYCLE_1000[0] = (`CLKOUT0_DUTY_CYCLE * 1000);
	assign CLKOUT_DUTY_CYCLE_1000[1] = (`CLKOUT1_DUTY_CYCLE * 1000);
	assign CLKOUT_DUTY_CYCLE_1000[2] = (`CLKOUT2_DUTY_CYCLE * 1000);
	assign CLKOUT_DUTY_CYCLE_1000[3] = (`CLKOUT3_DUTY_CYCLE * 1000);
	assign CLKOUT_DUTY_CYCLE_1000[4] = (`CLKOUT4_DUTY_CYCLE * 1000);
	assign CLKOUT_DUTY_CYCLE_1000[5] = (`CLKOUT5_DUTY_CYCLE * 1000);
	assign CLKOUT_DUTY_CYCLE_1000[6] = (`CLKOUT6_DUTY_CYCLE * 1000);
	wire [31:0] CLKOUT_PHASE_1000[0:6];
	assign CLKOUT_PHASE_1000[0] = (`CLKOUT0_PHASE * 1000);
	assign CLKOUT_PHASE_1000[1] = (`CLKOUT1_PHASE * 1000);
	assign CLKOUT_PHASE_1000[2] = (`CLKOUT2_PHASE * 1000);
	assign CLKOUT_PHASE_1000[3] = (`CLKOUT3_PHASE * 1000);
	assign CLKOUT_PHASE_1000[4] = (`CLKOUT4_PHASE * 1000);
	assign CLKOUT_PHASE_1000[5] = (`CLKOUT5_PHASE * 1000);
	assign CLKOUT_PHASE_1000[6] = (`CLKOUT6_PHASE * 1000);
	/* instantiate PLLE2_BASE with default values for all the attributes */
	MMCME2_BASE #(
 		.BANDWIDTH(`BANDWIDTH),
 		.CLKFBOUT_MULT_F(`CLKFBOUT_MULT_F),
		.CLKFBOUT_PHASE(`CLKFBOUT_PHASE),
		.CLKIN1_PERIOD(`CLKIN1_PERIOD),
		.CLKOUT0_DIVIDE_F(`CLKOUT0_DIVIDE_F),
		.CLKOUT1_DIVIDE(`CLKOUT1_DIVIDE),
		.CLKOUT2_DIVIDE(`CLKOUT2_DIVIDE),
		.CLKOUT3_DIVIDE(`CLKOUT3_DIVIDE),
		.CLKOUT4_DIVIDE(`CLKOUT4_DIVIDE),
		.CLKOUT5_DIVIDE(`CLKOUT5_DIVIDE),
		.CLKOUT6_DIVIDE(`CLKOUT6_DIVIDE),
		.CLKOUT0_DUTY_CYCLE(`CLKOUT0_DUTY_CYCLE),
		.CLKOUT1_DUTY_CYCLE(`CLKOUT1_DUTY_CYCLE),
		.CLKOUT2_DUTY_CYCLE(`CLKOUT2_DUTY_CYCLE),
		.CLKOUT3_DUTY_CYCLE(`CLKOUT3_DUTY_CYCLE),
		.CLKOUT4_DUTY_CYCLE(`CLKOUT4_DUTY_CYCLE),
		.CLKOUT5_DUTY_CYCLE(`CLKOUT5_DUTY_CYCLE),
		.CLKOUT6_DUTY_CYCLE(`CLKOUT6_DUTY_CYCLE),
		.CLKOUT0_PHASE(`CLKOUT0_PHASE),
		.CLKOUT1_PHASE(`CLKOUT1_PHASE),
		.CLKOUT2_PHASE(`CLKOUT2_PHASE),
		.CLKOUT3_PHASE(`CLKOUT3_PHASE),
		.CLKOUT4_PHASE(`CLKOUT4_PHASE),
		.CLKOUT5_PHASE(`CLKOUT5_PHASE),
		.CLKOUT6_PHASE(`CLKOUT6_PHASE),
		.CLKOUT4_CASCADE(`CLKOUT4_CASCADE),
		.DIVCLK_DIVIDE(`DIVCLK_DIVIDE),
		.REF_JITTER1(`REF_JITTER1),
		.STARTUP_WAIT(`STARTUP_WAIT))
	dut (
		.CLKOUT0(CLKOUT[0]),
		.CLKOUT1(CLKOUT[1]),
		.CLKOUT2(CLKOUT[2]),
		.CLKOUT3(CLKOUT[3]),
		.CLKOUT4(CLKOUT[4]),
		.CLKOUT5(CLKOUT[5]),
		.CLKOUT6(CLKOUT[6]),
		.CLKOUT0B(CLKOUTB[0]),
		.CLKOUT1B(CLKOUTB[1]),
		.CLKOUT2B(CLKOUTB[2]),
		.CLKOUT3B(CLKOUTB[3]),
		.CLKFBOUT(CLKFBOUT),
		.CLKFBOUTB(CLKFBOUTB),
		.LOCKED(LOCKED),
		.CLKIN1(CLKIN1),
		.PWRDWN(PWRDWN),
		.RST(RST),
		.CLKFBIN(CLKFBIN));
	genvar i;
	generate
		for (i = 0; i <= 6; i = i + 1) begin : period_count
			period_count #(
				.RESOLUTION(0.01))
			period_count (
				.RST(reset),
				.clk(CLKOUT[i]),
				.period_length_1000(period_1000[i]));
		end
		for (i = 0; i <= 6; i = i + 1) begin : dcc
			if (i == 4 && `CLKOUT4_CASCADE == "TRUE") begin
				duty_cycle_check dcc (
					.desired_duty_cycle_1000(CLKOUT_DUTY_CYCLE_1000[i]),
					.clk_period_1000(`CLKIN1_PERIOD * ((`DIVCLK_DIVIDE * ((CLKOUT_DIVIDE_1000[4] * CLKOUT_DIVIDE_1000[6]) / 1000.0)) / `CLKFBOUT_MULT_F)),
					.clk(CLKOUT[i]),
					.reset(reset),
					.LOCKED(LOCKED),
					.fail(dcc_fail[i]));
			end else if (i == 6 && `CLKOUT4_CASCADE == "TRUE") begin
				duty_cycle_check dcc (
					.desired_duty_cycle_1000(CLKOUT_DUTY_CYCLE_1000[i]),
					.clk_period_1000(1000 * `CLKIN1_PERIOD * (`DIVCLK_DIVIDE / `CLKFBOUT_MULT_F)),
					.clk(CLKOUT[i]),
					.reset(reset),
					.LOCKED(LOCKED),
					.fail(dcc_fail[i]));
			end else begin
				duty_cycle_check dcc (
					.desired_duty_cycle_1000(CLKOUT_DUTY_CYCLE_1000[i]),
					.clk_period_1000(`CLKIN1_PERIOD * ((`DIVCLK_DIVIDE * CLKOUT_DIVIDE_1000[i]) / `CLKFBOUT_MULT_F)),
					.clk(CLKOUT[i]),
					.reset(reset),
					.LOCKED(LOCKED),
					.fail(dcc_fail[i]));
			end
		end
		for (i = 0; i <= 6; i = i + 1) begin : psc
			phase_shift_check psc (
				.desired_shift_1000(CLKOUT_PHASE_1000[i]),
				.clk_period_1000(`CLKIN1_PERIOD * ((`DIVCLK_DIVIDE * CLKOUT_DIVIDE_1000[i]) / `CLKFBOUT_MULT_F)),
				.clk_shifted(CLKOUT[i]),
				.clk(CLKFBOUT),
				.rst(RST),
				.LOCKED(LOCKED),
				.fail(psc_fail[i]));
		end
	endgenerate
	period_count period_count_fb (
		.RST(reset),
		.clk(CLKFBOUT),
		.period_length_1000(period_1000_fb));
	phase_shift_check pscfb (
		.desired_shift_1000(`CLKFBOUT_PHASE * 1000),
		.clk_period_1000(`CLKIN1_PERIOD * (`DIVCLK_DIVIDE / `CLKFBOUT_MULT_F) * 1000),
		.clk_shifted(CLKFBOUT),
		.clk(CLKIN1),
		.rst(RST),
		.LOCKED(LOCKED),
		.fail(psc_fail_fb));
/* ------------ BEGIN TEST CASES ------------- */
	/* default loop variable */
	integer k;
	initial begin
		$dumpfile("mmcme2_base_tb.vcd");
		$dumpvars(0, MMCME2_BASE_tb);
		pass_count = 0;
		fail_count = 0;
		reset = 0;
		CLKIN1 = 0;
		RST = 0;
		PWRDWN = 0;
		#10;
		reset = 1;
		RST = 1;
		#10;
		if ((CLKOUT[0] & CLKOUT[1] & CLKOUT[2] & CLKOUT[3] & CLKOUT[4] & CLKOUT[5] & CLKOUT[6] & ~CLKOUTB[0] & ~CLKOUTB[1] & ~CLKOUTB[2] & ~CLKOUTB[3] & CLKFBOUT & ~CLKFBOUTB & LOCKED) == 0) begin
			$display("PASSED: RST signal");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: RST signal");
			fail_count = fail_count + 1;
		end
		reset = 0;
		RST = 0;
		/* Test for correct number of highs for the given parameters.
		 */
		#`WAIT_INTERVAL;
		if (LOCKED === 1'b1) begin
			$display("PASSED: LOCKED");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: LOCKED");
			fail_count = fail_count + 1;
		end
		/*------- INVERTED OUTPUTS --*/
		for (k = 0; k <= 3; k = k + 1) begin
			if (CLKOUTB[k] == ~CLKOUT[k]) begin
				$display("PASSED: CLKOUT%0d inverted output", k);
				pass_count = pass_count + 1;
			end else begin
				$display("FAILED: CLKOUT%0d inverted output", k);
				fail_count = fail_count + 1;
			end
		end
		if (CLKFBOUTB == ~CLKFBOUT) begin
			$display("PASSED: CLKFBOUT inverted output");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: CLKFBOUT inverted output");
			fail_count = fail_count + 1;
		end
		/*------- FREQUENCY ---------*/
		for (k = 0; k <= 6; k = k + 1) begin
			if (k == 4 && `CLKOUT4_CASCADE == "TRUE") begin
				// Check for CLKOUT4 correctly, if CLKOUT4_CASCADE is set
				if ((period_1000[k] / 1000.0) == (`CLKIN1_PERIOD * ((`DIVCLK_DIVIDE * ((CLKOUT_DIVIDE_1000[k] * CLKOUT_DIVIDE_1000[k+2]) / (1000.0 * 1000.0)))/ `CLKFBOUT_MULT_F))) begin
					$display("PASSED: CLKOUT%0d frequency with CLKOUT4_CASCADE", k);
					pass_count = pass_count + 1;
				end else begin
					$display("FAILED: CLKOUT%0d frequency with CLKOUT4_CASCADE", k);
					fail_count = fail_count + 1;
				end
			end else if (k == 6 && `CLKOUT4_CASCADE == "TRUE") begin
				/* Don't check against the CLKOUT6 divider, because it is
				if ((period_1000[k] / 1000.0) == `CLKIN1_PERIOD * ((`DIVCLK_DIVIDE * 1.0) / `CLKFBOUT_MULT_F)) begin
					$display("PASSED: CLKOUT%0d frequeny with CLKOUT4_CASCADE", k);
					pass_count = pass_count + 1;
				end else begin
					$display("FAILED: CLKOUT%0d frequeny with CLKOUT4_CASCADE", k);
					fail_count = fail_count + 1;
				end
			end else begin
				if ((period_1000[k] / 1000.0) == `CLKIN1_PERIOD * ((`DIVCLK_DIVIDE * (CLKOUT_DIVIDE_1000[k] / 1000.0) * 1.0) / `CLKFBOUT_MULT_F)) begin
					$display("PASSED: CLKOUT%0d frequency", k);
					pass_count = pass_count + 1;
				end else begin
					$display("FAILED: CLKOUT%0d frequency", k);
					fail_count = fail_count + 1;
				end
			end
		end
		if ((period_1000_fb / 1000.0) == (`CLKIN1_PERIOD * ((`DIVCLK_DIVIDE * 1.0) / `CLKFBOUT_MULT_F))) begin
			$display("PASSED: CLKFBOUT frequency");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: CLKFBOUT frequency");
			fail_count = fail_count + 1;
		end
		/*------- DUTY CYCLE ---------*/
		for (k = 0; k <= 6; k = k + 1) begin
			if (dcc_fail[k] !== 1'b1) begin
				$display("PASSED: CLKOUT%0d duty cycle", k);
				pass_count = pass_count + 1;
			end else begin
				$display("FAILED: CLKOUT%0d duty cycle", k);
				fail_count = fail_count + 1;
			end
		end
		/*------- PHASE SHIFT ---------*/
		for (k = 0; k <= 6; k = k + 1) begin
			if (psc_fail[k] !== 1'b1) begin
				$display("PASSED: CLKOUT%0d phase shift", k);
				pass_count = pass_count + 1;
			end else begin
				$display("FAILED: CLKOUT%0d phase shift", k);
				fail_count = fail_count + 1;
			end
		end
		if (psc_fail_fb !== 1'b1) begin
			$display("PASSED: CLKOUTFB phase shift");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: CLKOUTFB phase shift");
			fail_count = fail_count + 1;
		end
		PWRDWN = 1;
		#100;
		if ((CLKOUT[0] & CLKOUT[1] & CLKOUT[2] & CLKOUT[3] & CLKOUT[4] & CLKOUT[5] & CLKOUT[6] & CLKOUTB[0] & CLKOUTB[1] & CLKOUTB[2] & CLKOUTB[3] & CLKFBOUT & CLKFBOUTB & LOCKED) === 1'bx) begin
			$display("PASSED: PWRDWN");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: PWRDWN");
			fail_count = fail_count + 1;
		end
		if ((pass_count + fail_count) == total) begin
			$display("PASSED: number of test cases");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: number of test cases");
			fail_count = fail_count + 1;
		end
		$display("%0d/%0d PASSED", pass_count, (total + 1));
		$finish;
	end
	/* connect CLKFBIN with CLKFBOUT to use internal feedback */
	assign CLKFBIN = CLKFBOUT;
	always #(`CLKIN1_PERIOD / 2) CLKIN1 = ~CLKIN1;
endmodule