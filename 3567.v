module VOLTAGE_SOURCE(1 2);
	parameter value=1;
	vsource #(.dc(value)) v(1 2);
endmodule