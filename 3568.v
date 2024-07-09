module CURRENT_SOURCE(1 2);
	parameter value=1;
	isource #(.dc(value)) i(1 2);
endmodule