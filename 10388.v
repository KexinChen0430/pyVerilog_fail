module, integrated by testbench
	pipe3 pipe3_1(	dataIn, 		dataIn3,
					wbyteen2, 		wbyteen3,
					regwren2, 		regwren3,
					rwraddrd2, 		rwraddrd3,
					reginmuxop2, 	reginmuxop3,
					aluOut, 		aluOut3,
					instruction2, 	instruction3,
					clk,
					reset);
	// -------------  Stage 4 WB  ---------------------
	mux128 reginmux(aluOut3,
					dataIn,
									wrdata,
					reginmuxop3				);
	// WR inputs of previously instantiated regfile used
	// -------------  Hazard Detection -----------------
	hazard_detect hazard_detect1(instruction1, instruction2, instruction3,
		 hz1_a_or_d, hz1_b, hz3_a_or_d, hz3_b);
endmodule