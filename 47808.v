module test;
reg clk;
wire clk1;
wire clk2;
wire clk3;
integer count;
time	t1;
event xevent;
real  xyz;
initial begin
//	$lxt2_recordvars("space");
	$lxt_recordvars("speed");
	xyz = 0.0001;
	#1
	clk = 0;
	count = 0;
	#500000 $lxt_recordoff();
	#500000 $lxt_recordon();
	#10000000 $finish;
end
always begin
	clk = 0;
	clk <= #5 1;
	#10;
end
always @(posedge clk) begin
	t1 = $time;
	count = count+1;
	xyz = xyz + xyz;
	-> xevent;
end
inv i0(clk1,clk);
inv i1(clk2,clk1);
inv i2(clk3,clk2);
endmodule