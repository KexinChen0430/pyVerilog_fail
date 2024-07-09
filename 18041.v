module used for frequency checks */
	wire [31:0] highs_counted;
	integer	pass_count;
	integer	fail_count;
	/* adjust according to the number of test cases */
	localparam total = 6;
	freq_gen dut (
		.M_1000(`M_1000),
		.D(`D),
		.O_1000(`O_1000),
		.RST(RST),
		.PWRDWN(PWRDWN),
		.ref_period_1000(ref_period_length_1000),
		.clk(clk),
		.out(out),
		.out_period_length_1000(out_period_length_1000),
		.period_stable(period_stable));
	high_counter high_counter (
		.clk(out),
		.rst(~period_stable),
		.count(highs_counted));
	initial begin
		$dumpfile("freq_gen_tb.vcd");
		$dumpvars(0, freq_gen_tb);
		RST = 0;
		PWRDWN = 0;
		period_stable = 0;
		clk = 0;
		ref_period_length_1000 = 20 * 1000;
		pass_count = 0;
		fail_count = 0;
		#10;
		RST = 1;
		#10;
		if (out === 1'b0) begin
			$display("PASSED: RST");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: RST");
			fail_count = fail_count + 1;
		end
		period_stable = 1;
		RST = 0;
		#((ref_period_length_1000 / 1000.0) + 11);
		if (out === 1'b1) begin
			$display("PASSED: rising edge detection");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: rising edge detection");
			fail_count = fail_count + 1;
		end
		#(`WAIT_INTERVAL - ((ref_period_length_1000 / 1000.0) + 11));
		/* use 1.0 to calculate floating point numbers */
		if ($floor(`WAIT_INTERVAL / highs_counted) == $floor((ref_period_length_1000 / 1000.0) * ((`D * (`O_1000 / 1000.0) * 1.0) / (`M_1000 / 1000.0)))) begin
			$display("PASSED: ref period = 20");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: ref period = 20");
			fail_count = fail_count + 1;
		end
		period_stable = 0;
		ref_period_length_1000 = 10 * 1000;
		#`WAIT_INTERVAL;
		period_stable = 1;
		#`WAIT_INTERVAL;
		if ($floor(`WAIT_INTERVAL / highs_counted) == $floor((ref_period_length_1000 / 1000.0) * ((`D * (`O_1000 / 1000.0) * 1.0) / (`M_1000 / 1000.0)))) begin
			$display("PASSED: ref period = 10");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: ref period = 10");
			fail_count = fail_count + 1;
		end
		period_stable = 0;
		ref_period_length_1000 = 5600;
		#`WAIT_INTERVAL;
		period_stable = 1;
		#`WAIT_INTERVAL;
		if ($floor(`WAIT_INTERVAL / highs_counted) == $floor((ref_period_length_1000 / 1000.0) * ((`D * (`O_1000 / 1000.0) * 1.0) / (`M_1000 / 1000.0)))) begin
			$display("PASSED: ref period = 5.6");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: ref period = 5.6");
			fail_count = fail_count + 1;
		end
		if ($floor((`WAIT_INTERVAL + (ref_period_length_1000 / 1000.0)) / highs_counted) == $floor(out_period_length_1000 / 1000.0)) begin
			$display("PASSED: period length output");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: period length output");
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
	always #((ref_period_length_1000 / 1000.0) / 2.0) clk <= ~clk;
endmodule