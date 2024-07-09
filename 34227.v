module top_test ();
	reg clk;
	reg reset;
	initial clk = 0;
	parameter half_cycle = 5;
	localparam cycle = 2 * half_cycle;
	localparam timeout = 100;
	always #(half_cycle) clk = ~clk;
	wire [(`STR_LEN * 8) - 1:0] s;
	top top(.clk(clk), .reset(reset));
	inst_decoder id(.str(s),
		.jump_target(top.dpath.jump_target),
		.branch_target(top.dpath.branch_target),
		.inst(top.dpath.inst));
	integer i;
	initial begin
		$dumpvars();
		i = 0;
		/* toggle reset */
		#(cycle);
		reset = 1;
		#(cycle);
		reset = 0;
		#(cycle);
		while (top.dpath.cp.tohost == 0 && i < timeout) begin
			#(cycle);
			i = i + 1;
			$display("C %10d: pc=[%08x] [%s] W[r%2d=%08x][%b] R[r%2d=%08x] R[r%2d=%08x] inst=[%08x] %s",
				i, top.dpath.pc, top.stall ? "S" : " ",
				top.dpath.ex_wd, top.dpath.rf_wdata, top.dpath.rf_wr_en,
				top.dpath.ex_rs1, top.dpath.rf_rd1,
				top.dpath.ex_rs2, top.dpath.rf_rd2,
				top.dpath.inst,
				top.stall ? "" : s);
		end
		if (i == timeout) begin
			$display("*** TIMEOUT ***");
			$finish();
		end
		if (top.dpath.cp.tohost == 1) begin
			$display("*** SUCCESS (tohost = 1) ***");
		end else begin
			$display("*** FAILURE (tohost = %d) ***", top.dpath.cp.tohost);
		end
		$finish();
	end
endmodule