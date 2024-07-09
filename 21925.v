module master_tb();
	parameter ADDR_WIDTH = 16;
	parameter AW = ADDR_WIDTH - 1;
	reg	[11:0]	story_to;
	reg		clk_i, reset_i, fault_to;
	wire	[AW:0]	adr_o;
	wire		cyc_o, stb_o, we_o;
	reg		ack_i;
	reg		dreq_i;
	wire		dack_o;
	always begin
		#5 clk_i <= ~clk_i;
	end
	master #(
		.ADDR_WIDTH(ADDR_WIDTH)
	) m(
		.clk_i(clk_i),
		.reset_i(reset_i),
		.dreq_i(dreq_i),
		.dack_o(dack_o),
		.adr_o(adr_o),
		.cyc_o(cyc_o),
		.stb_o(stb_o),
		.we_o(we_o),
		.ack_i(ack_i)
	);
	`STANDARD_FAULT
	`DEFASSERT(adr, AW, o)
	`DEFASSERT0(cyc, o)
	`DEFASSERT0(stb, o)
	`DEFASSERT0(we, o)
	`DEFASSERT0(dack, o)
	initial begin
		$dumpfile("master.vcd");
		$dumpvars;
		{ack_i, dreq_i, clk_i, reset_i, fault_to} <= 0;
		wait(~clk_i); wait(clk_i);
		reset_i <= 1;
		wait(~clk_i); wait(clk_i);
		reset_i <= 0;
		story_to <= 12'h000;
		wait(~clk_i); wait(clk_i); #1;
		assert_adr(0);
		assert_cyc(0);
		assert_stb(0);
		assert_we(0);
		assert_dack(0);
		// Given CYC_O is negated,
		// When DREQ_I is asserted,
		// I want CYC_O to assert
		// and a valid SIA address presented
		// and a read command offered.
		dreq_i <= 1;
		wait(~clk_i); wait(clk_i); #1;
		assert_cyc(1);
		assert_stb(1);
		assert_we(0);
		assert_adr(`IPL_READ_ADDR);
		assert_dack(1);
		// Given CYC_O is asserted,
		// If DREQ_I is (still) asserted,
		// I want the STB_O to negate to avoid re-reading the same address before we're ready.
		dreq_i <= 0;
		wait(~clk_i); wait(clk_i); #1;
		assert_cyc(1);
		assert_stb(0);
		assert_we(0);
		assert_adr(0);
		assert_dack(0);
		// Given CYC_O is asserted,
		// and a read cycle is in progress,
		// If ACK_I is asserted,
		// I want the cycle to end, and the data latched for the subsequent write cycle.
		ack_i <= 1;
		wait(~clk_i); wait(clk_i); #1;
		assert_cyc(1);
		assert_stb(1);
		assert_we(1);
		assert_adr(`IPL_WRITE_ADDR);
		assert_dack(0);
		// Given CYC_O is asserted during a write cycle,
		// If unacknowledged,
		// I want the cycle to continue as-is.
		ack_i <= 0;
		wait(~clk_i); wait(clk_i); #1;
		assert_cyc(1);
		assert_stb(0);
		assert_we(0);
		assert_adr(0);
		assert_dack(0);
		// Given CYC_O is asserted during a write cycle,
		// When acknowledged,
		// I want the cycle to terminate.
		ack_i <= 1;
		wait(~clk_i); wait(clk_i); #1;
		assert_cyc(0);
		assert_stb(0);
		assert_we(0);
		assert_adr(0);
		assert_dack(0);
		// ATTENTION: This works on my simulator (iverilog).
		// UNSURE if this will work on yours or on real hardware.
		// When we peg DREQ_I and ACK_I to an asserted state,
		// I want back-to-back transactions to occur in as few cycles as possible.
		// N.B.: This means 2 cycles (one read, one write).
		ack_i <= 0;
		wait(~clk_i); wait(clk_i);
		dreq_i <= 1;
		wait(~clk_i); wait(clk_i); #1;
		ack_i <= 1;
		assert_cyc(1);
		assert_stb(1);
		assert_we(0);
		assert_adr(`IPL_READ_ADDR);
		assert_dack(1);
		wait(~clk_i); wait(clk_i); #1;
		assert_cyc(1);
		assert_stb(1);
		assert_we(1);
		assert_adr(`IPL_WRITE_ADDR);
		assert_dack(0);
		wait(~clk_i); wait(clk_i); #1;
		assert_cyc(1);
		assert_stb(1);
		assert_we(0);
		assert_adr(`IPL_READ_ADDR);
		assert_dack(1);
		wait(~clk_i); wait(clk_i); #1;
		dreq_i <= 0;
		assert_cyc(1);
		assert_stb(1);
		assert_we(1);
		assert_adr(`IPL_WRITE_ADDR);
		assert_dack(0);
		wait(~clk_i); wait(clk_i);
		ack_i <= 0;
		$display("@I Done.");
		onFault;
	end
endmodule