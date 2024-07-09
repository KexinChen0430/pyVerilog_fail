module to compute the specified operation
	operation #(16) instantiateOperation(
		.Ain(Ain),
		.Bin(Bin),
		.overflow(overflow),
		.addSubVals(addSubVals),
		.andVals(andVals),
		.notBVal(notBVal),
		.sub(sub),
		.computedValue(ALUComputedValue)
		);
endmodule