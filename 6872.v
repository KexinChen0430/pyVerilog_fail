module TOP;
	reg	l0, l1, re;
	wire	le, r0, r1;
	DELAY #(.delay(`inv_delay)) d0(l0, r0);
	DELAY #(.delay(`inv_delay)) d1(l1, r1);
	DELAY #(.delay(`inv_delay)) de(re, le);
	// prsim stuff
	initial
	begin
	// @haco@ channel-source-sink.haco-c
		$prsim_options("-I subdir");
		$prsim("channel-source-sink.haco-c");
		$prsim_cmd("echo $start of simulation");
		$prsim_cmd("echo-commands on");
//		$prsim_cmd("addpath subdir");
		$from_prsim("L.d[0]","TOP.l0");
		$from_prsim("L.d[1]","TOP.l1");
		$to_prsim("TOP.le", "L.e");
		$to_prsim("TOP.r0", "R.d[0]");
		$to_prsim("TOP.r1", "R.d[1]");
		$from_prsim("R.e", "TOP.re");
		$prsim_cmd("breaks");
		$prsim_cmd("watchall");
		// $prsim_cmd("watchall-queue");
		$prsim_cmd("channel L e:0 :0 d:2");
		$prsim_cmd("channel R e:1 :0 d:2");
		$prsim_cmd("channel-source-file-loop L channel-values-X.txt");
		$prsim_cmd("channel-sink R");
		$prsim_cmd("channel-watchall");
		$prsim_cmd("channel-reset-all");
		$prsim_cmd("channel-show-all");
		$prsim_cmd("breaks");
	end
	initial #5 $prsim_cmd("channel-release-all");
	initial #5 $prsim_cmd("channel-show-all");
	initial #6 $prsim_cmd("nowatchall");
	initial #9 $prsim_cmd("why-not-verbose R.e");
	initial #9 $prsim_cmd("why-not-verbose R.d[0]");
	initial #10 $finish;
/**
	initial
	$monitor("@%7.3f: l = %d,%d:%d; r = %d,%d:%d", $realtime,
		l0, l1, le, r0, r1, re);
endmodule