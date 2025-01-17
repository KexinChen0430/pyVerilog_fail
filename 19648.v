module phase_shift_check_tb ();
	reg rst;
	reg clk;
	wire clk_shifted;
	reg LOCKED;
	wire fail;
	integer shift;
	integer pass_count;
	integer fail_count;
	/* adjust according to the number of test cases */
	localparam total = 4;
	phase_shift_check dut (
		.desired_shift_1000(`DESIRED_SHIFT * 1000),
		.clk_period_1000(`CLK_PERIOD * 1000),
		.clk_shifted(clk_shifted),
		.clk(clk),
		.rst(rst),
		.LOCKED(LOCKED),
		.fail(fail));
	phase_shift ps (
		.PWRDWN(1'b0),
		.RST(rst),
		.clk(clk),
		.shift(shift),
		.clk_period_1000(`CLK_PERIOD * 1000),
		.duty_cycle(50),
		.clk_shifted(clk_shifted));
	initial begin
		$dumpfile("phase_shift_check_tb.vcd");
		$dumpvars(0, phase_shift_check_tb);
		rst = 0;
		shift = `DESIRED_SHIFT;
		clk = 0;
		LOCKED = 0;
		pass_count = 0;
		fail_count = 0;
		#10;
		rst = 1;
		#10;
		if (fail == 1'b0) begin
			$display("PASSED: rst");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: rst");
			fail_count = fail_count + 1;
		end
		rst = 0;
		#(`CLK_PERIOD * 2);
		if (fail == 1'b0) begin
			$display("PASSED: LOCKED");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: LOCKED");
			fail_count = fail_count + 1;
		end
		LOCKED = 1;
		#`WAIT_INTERVAL;
		if (fail == 1'b0) begin
			$display("PASSED: shifts match");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: shifts match");
			fail_count = fail_count + 1;
		end
		shift = shift + 45;
		#`WAIT_INTERVAL;
		if (fail == 1'b1) begin
			$display("PASSED: shifts don't match");
			pass_count = pass_count + 1;
		end else begin
			$display("FAILED: shifts don't match");
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
	always #(`CLK_PERIOD / 2.0) clk <= ~clk;
endmodule