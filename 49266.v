module executer (
	input Clk, nLoad,
	input [31:0] delay, PulseAngleRot,
	input [3:0] shour2, shour1, sminute2, sminute1, ssecond2, ssecond1,
	input [3:0] chour2, chour1, cminute2, cminute1, csecond2, csecond1,
	output reg ME, MT1, MT2);
	reg [3:0] thour2 = 3, thour1, tminute2, tminute1, tsecond2, tsecond1;//temporary
	reg [31:0] count = 0;
	reg active = 0;
	initial begin
	ME <= 0; MT1 <= 0; MT2 <= 0;
	end
	always @ (posedge Clk, negedge nLoad)
	begin
	if (~nLoad)
	begin
		thour2 <= shour2; thour1 <= shour1; tminute2 <= sminute2; tminute1 <= sminute1; tsecond2 <= ssecond2; tsecond1 <= ssecond1;
	end
	else
	begin
	if((thour2 == chour2)&(thour1 == chour1)&(tminute2 == cminute2)&(tminute1 == cminute1)&(tsecond2 == csecond2)&(tsecond1 == csecond1))
		active <= 1;
	if(active)
		begin
		count <= count + 1;
		//open the plate
		if (count < PulseAngleRot) begin
			ME <= 1; MT1 <= 1; MT2 <= 0;
			end
		//delay the plate
		if((count >= PulseAngleRot) & (count < (PulseAngleRot + delay))) begin
			ME <= 0; MT1 <= 0; MT2 <= 0;
			end
		//close the plate
		if((count >= (PulseAngleRot + delay)) & (count <(PulseAngleRot + delay + (PulseAngleRot + 700000) ))) begin
			ME <= 1; MT1 <= 0; MT2 <= 1;
			end
		//reset count, active and make everything ready for next activation
		if(count >= (PulseAngleRot + delay + (PulseAngleRot + 700000))) begin
			ME <= 0; MT1 <= 0; MT2 <= 0;
			count <= 0;
			active <= 0;
			end
		end
	end
	end
endmodule