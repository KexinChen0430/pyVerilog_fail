module samples an input bit, sigIn.  It copies this output to sigOut, but delays state changes by a variable input, waitCnt, number of clock cycles.  Only the most recent state change is stored.
This scheme fails for cases where the wait time is longer than half the signal period.
Ted Golfinopoulos, 9 August 2012
*/
parameter WAIT_CNT_SIZE=11;
input clk, sigIn;
input [WAIT_CNT_SIZE-1:0] waitCnt; //Delay time - number of clk cycles to delay state changes in output
output wire sigOut;
reg sigOutReg, sigInLast;
reg [WAIT_CNT_SIZE-1:0] timer; //Counter for timing delays for state changes to output.
initial begin
	#0
	sigInLast=1'b0;
	sigOutReg=1'b0;
	timer=1'b0;
end
//Check for state changes.  Wait a specified delay time, and then impose the corresponding change in the output signal.  Fails for the case where the delay time is longer than half the signal period.
always @(posedge clk) begin
	//Check input.  If there is a state change, reset timer and record new state.
	if(sigInLast != sigIn) begin //Begin timer.  Really want to begin timer on rising edge of sigIn.
		timer=1'b0; //Reset timer
		sigInLast=sigIn; //Update sigInLast register.
	end
	//Delay timer.
	//If timer has been reset, start counting until wait limit is reached.  Then, stop and update output.
	//Output gets continually updated to registered input state in steady state.
	if(timer<waitCnt) begin
		timer=timer+1'b1;
	end else begin //Leave timer locked at waitCnt
		sigOutReg=sigInLast; //Update output signal.
	end
end
assign sigOut=sigOutReg; //Tie output to corresponding register.
endmodule