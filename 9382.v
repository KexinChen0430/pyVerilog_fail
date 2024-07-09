module B_AudioClkGen_v0_83 (
	clkout,
	clk,
	sync_sof
);
	output  clkout;
	input   clk;
	input   sync_sof;
//`#start body` -- edit after this line, do not edit this line
	wire transfer;
	wire sync_ready;
	wire sync_done;
	wire value;
	wire delta;
	wire trigger_shaper;
	wire clk_async;
//SOFConunter to sync to USB
cy_psoc3_udb_clock_enable_v1_0 #(.sync_mode(`FALSE)) CtlClkSync
        (
            /* input  */    .clock_in(clk),
            /* input  */    .enable(1'b1),
            /* output */    .clock_out(clk_async)
        );
SOFCounter sync(
	.done(sync_done),
	.ready(sync_ready),
	.value(value),
	.clk(clk_async),
	.sof(sync_sof),
	.start(transfer)
);
Shaper1stOrder shaper(
	.delta(delta),
	.transfer(transfer),
	.clk(clk_async),
	.done(sync_done),
	.ready(sync_ready),
	.start(trigger_shaper),
	.value(value)
);
DivNorNPlus1 div(
	.clkout(clkout),
	.start(trigger_shaper),
	.clk(clk_async),
	.delta(delta)
);
//`#end` -- edit above this line, do not edit this line
endmodule