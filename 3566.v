module BATTERY(n p);
	parameter value=1;
	vsource #(.dc(value)) v(n,p);
endmodule