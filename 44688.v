module TOP;
	reg in0;
	wire in1;
	reg  out0, out1;
	wire dummy;
	clk_gen #(.HALF_PERIOD(4)) clk(in1);
	// prsim stuff
	initial
	begin
		// @haco@ inverters-separate.haco-c
		$prsim("inverters-separate.haco-c");
		$prsim_cmd("echo $start of simulation");
		$prsim_cmd("unstable warn");
		$prsim_cmd("unstable-dequeue");
		$prsim_cmd("watchall");
		$to_prsim("TOP.in0",   "in0");
		$to_prsim("TOP.in1",   "in1");
		$from_prsim("out0","TOP.out0");
		$from_prsim("out1","TOP.out1");
	#100	in0 = 1'b0;
	#100	in0 = 1'b1;
	#100	in0 = 1'b0;
		$prsim_cmd("queue");
	// deliberate instability to trigger bug
	#5	in0 = 1'b1;
		$prsim_cmd("queue");
	#5	in0 = 1'b0;
		$prsim_cmd("queue");
	#90	in0 = 1'b1;
	#100	$finish;
	end
/**
	// optional: produce vector file for dump
	initial begin
		$dumpfile ("test.dump");
		$dumpvars(0,TOP);
	end
	always @(in0)
	begin
		$display("at time %7.3f, observed in0 %b", $realtime,in0);
	end
	always @(out0)
	begin
		$display("at time %7.3f, observed out0 = %b", $realtime,out0);
	end
endmodule