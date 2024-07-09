module is the master control for a phase delay board.  Its operation is as follows:
1. Read sigIn every clock cycle
	a. create a period counter which counts one period.
2. sigOut is a delayed version of sigIn - state changes are delayed by an amount contained in a register set by parsed input from progIn.  It will not be buferred - merely, state changes are delayed.
progIn is a serial input in this version.
Ted Golfinopoulos, 8 Aug 2012
PIN ASSIGNMENTS
14 Sep 2012
Ok		clk	Location	PIN_H5	Yes		CLOCK
Ok		progIn[7]	Location	PIN_A7	Yes		2A/PIN_65 - Program number - phase delay is specified here.
Ok		progIn[6]	Location	PIN_A8	Yes		2C / PIN_64
Ok		progIn[5]	Location	PIN_A9	Yes		4C / PIN_63
Ok		progIn[4]	Location	PIN_A12	Yes		7A / PIN_60
Ok		progIn[3]	Location	PIN_E16	Yes		7C / PIN_51
Ok		progIn[2]	Location	PIN_F16	Yes		9C / PIN_49
Ok		progIn[1]	Location	PIN_A13	Yes		11A / PIN_58
Ok		progIn[0]	Location	PIN_A15	Yes		11C / PIN_57
Ok		sigIn	Location	PIN_G1	Yes		Input 1 / PIN_79 / Ch 1 + in / Carries input TTL signal to delay.
Ok		sigOut	Location	PIN_N1	Yes		Output 4 / PIN_9 / Delayed signal.
Ok		divOut	Location	PIN_K1	Yes		Diagnostic output to test internal divided-down input signal.
//parameter F_CLK=16000000; //64000000; //Clock frequency in Hz
//parameter NUM_CYCLE_DIV=64; //Divide a phase cycle into this number of divisions - shift output signal by discrete fractional amounts up to this number.  When progNum=NUM_CYCLE_DIV, the output signal is delayed by 360 degrees.
parameter PROG_NUM_SIZE=6; //Number of bits in prog number register.
parameter N_CLK_SIZE=9; //Pick this from ceil(log2(F_CLK/F_SIG_MIN))
parameter WAIT_NUMERATOR_SIZE=PROG_NUM_SIZE+N_CLK_SIZE;
input [PROG_NUM_SIZE-1:0] progIn;
input clk, sigIn;
output wire sigOut;
wire [N_CLK_SIZE-1:0] n_clk;
//progNum is a number from 0 to NUM_CYCLE_DIV-1 specifying the percentage of a phase cycle to delay the output signal from the input signal.
wire [(PROG_NUM_SIZE-1):0] progNum;
reg [(PROG_NUM_SIZE-1):0] progNumLast;
reg [N_CLK_SIZE-1:0] waitCnt; //Wait this number of cycles when delaying state changes in sigOut.
//Calculation for delay time is tau = (phi/(2*pi))*T, where T=period of sigIn, phi=desired phase delay in radians.
//This is tau=progNum*T/(NUM_CYCLE_DIV).
//We will make NUM_CYCLE_DIV be a power of 2; then the division will become approximated by a bit shift equal to log2(NUM_CYCLE_DIV).  An intermediate result, waitNumerator, stores the numerator, and this is then divided via a bit shift.
reg [WAIT_NUMERATOR_SIZE-1:0] waitNumerator; //This is progNum*T, where T is the period in clock cycles, and progNum the fractional phase delay over NUM_CYCLE_DIV
counter c(clk,sigIn,n_clk);
defparam c.N_CLK_SIZE=N_CLK_SIZE;
DecoderSerial dec(clk, progIn, progNum);
defparam dec.PROG_NUM_SIZE=PROG_NUM_SIZE;
//assign progNum=6'b111111;
//Clock the wait time calculation with the signal - this is the fastest rate that
//the period value, n_clk, can change, and progNum should change more slowly.
//It should allow more time for the multiplication calculation to complete.
always @(posedge sigIn) begin
	waitNumerator=progNum*n_clk;
	//For use with edge or cache delay.
	waitCnt=waitNumerator[WAIT_NUMERATOR_SIZE-1:PROG_NUM_SIZE];
end
CacheDelay d(clk, sigIn, waitCnt, sigOut);
defparam d.WAIT_CNT_SIZE=N_CLK_SIZE;
defparam d.CACHE_SIZE=550; //defparam d.CACHE_SIZE=1650;
endmodule