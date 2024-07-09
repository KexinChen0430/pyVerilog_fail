module
/*
wire [N_CLK_SIZE-1:0] waitCnt;
wire [NUM_SIZE-1:0] progNum;
wire [N_CLK_SIZE-1:0] n_clk;
*/
integer i;
PhaseDelaySerialInMain myMain(clk, progIn, f1, sigOut);
//PhaseDelaySerialInMain myMain(clk, progIn, f1, sigOut, waitCnt, n_clk, progNum); //With diagnostic outputs
defparam myMain.F_CLK=F_CLK;
defparam myMain.PROG_NUM_SIZE=NUM_SIZE;
defparam myMain.NUM_CYCLE_DIV=PROG_NUM_MAX; //2^NUM_SIZE.
defparam myMain.N_CLK_SIZE=N_CLK_SIZE;
initial begin
	$dumpfile ("TestPhaseDelayMainTestbench.vcd");
	$dumpvars;
end
initial begin
//	$display("\tTime \t sigIn\t sigOut\t progIn\t progNum\t n_clk\t waitCnt");
//	$monitor("\t%d\t%b\t%d\t%d\t%d\t%d\t%d",$time, f1, sigOut,progIn, progNum, n_clk,waitCnt);
	$display("\tTime \t sigIn\t sigOut");
	$monitor("\t%d\t%b\t%b",$time, f1, sigOut);
end
initial begin
	#0
	clk=1'b1;
	clkDiv=0;
	f1=1'b0;
	seq1=0; //In phase
	seq2=PROG_NUM_MAX/4; //90 degrees out of phase
	seq3=PROG_NUM_MAX/2-1; //180 degrees out of phase
	seq4=3*PROG_NUM_MAX/4; //270 degrees out of phase
	#10
	progIn=seq1;
	#((F_CLK/F_SIG)*NUM_CLOCKS_PER_TEST)
	progIn=seq2;
	#((F_CLK/F_SIG)*NUM_CLOCKS_PER_TEST)
	progIn=seq3;
	#((F_CLK/F_SIG)*NUM_CLOCKS_PER_TEST)
	progIn=seq4;
	#((F_CLK/F_SIG)*NUM_CLOCKS_PER_TEST)
	$finish; //Stop simulation.
end
//Synthesize signals at different frequencies
always @(posedge clk) begin
	clkDiv=clkDiv+1;
	//Assume clkFreq=20E6; then 1/200 is 100 kHz
	if(clkDiv%(F_CLK/(2*F_SIG))==0) f1=~f1; //100 kHz, since period of signal is two inversions.
end
//Make clock
always begin
	#1
	clk=~clk; //Invert clock
end
endmodule