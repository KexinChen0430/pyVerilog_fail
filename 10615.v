module    stratixv_termination_logic    (
    s2pload,
    serdata,
    scanenable,
    scanclk,
	enser,
    seriesterminationcontrol,
    parallelterminationcontrol
    );
    parameter    lpm_type    =    "stratixv_termination_logic";
    parameter 	 a_iob_oct_test = "a_iob_oct_test_off";
    input  s2pload;
    input  serdata;
    input  scanenable;
    input  scanclk;
	input enser;
    output [15 : 0] parallelterminationcontrol;
    output [15 : 0] seriesterminationcontrol;
    stratixv_termination_logic_encrypted inst (
        .s2pload(s2pload),
        .serdata(serdata),
        .scanenable(scanenable),
        .scanclk(scanclk),
			.enser(enser),
        .seriesterminationcontrol(seriesterminationcontrol),
        .parallelterminationcontrol(parallelterminationcontrol)
	);
    defparam inst.lpm_type = lpm_type;
    defparam  inst.a_iob_oct_test  = a_iob_oct_test;
endmodule