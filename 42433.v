module InternetChecksum32bit#(
	parameter RESET_VALUE = 16'h0000
)(
	input wire			clk,
	input wire			load,
	input wire			reset,
	input wire			process,
	input wire[31:0]	din,
	output reg[15:0]	sumout	= 0,
	output reg[15:0]	csumout	= 0
	);
	////////////////////////////////////////////////////////////////////////////////////////////////
	// Checksum computation
	wire[17:0]	sumout_temp  = din[15:0] + din[31:16] + sumout;			//first stage of summation
	wire[16:0]	sumout_temp2 = sumout_temp[15:0] + sumout_temp[17:16];	//second stage, extra bit to catch carries
	wire[15:0]	sumout_temp3 = sumout_temp2[15:0] + sumout_temp2[16];	//add in the carry, if there is one
																		//(should not be possible to carry out here)
	always @(posedge clk) begin
		if(reset) begin
			sumout	<= RESET_VALUE;
			csumout	<= ~RESET_VALUE;
		end
		else if(load) begin
			sumout	<= din[15:0];
			csumout	<= ~din[15:0];
		end
		else if(process) begin
			sumout	<= sumout_temp3;
			csumout	<= ~sumout_temp3;
		end
	end
endmodule