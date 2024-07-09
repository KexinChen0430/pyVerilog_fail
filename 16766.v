module.
	EX_MEM ex_mem(.clk(clk), .ctlwb_out(ctlwb_out), .ctlm_out(ctlm_out),
		.adder_out(adder_out), .aluzero(aluzero), .aluout(aluout),
		.readdat2(readdat2), .muxout(muxout), .wb_ctlout(wb_ctlout),
		.m_ctlout(m_ctlout), .add_result(add_result), .zero(zero),
		.alu_result(alu_result), .rdata2out(rdata2out),
		.five_bit_muxout(five_bit_muxout));
	initial begin
		// Initialize inputs.
		clk = 0;
		ctlwb_out = 0;
		ctlm_out = 0;
		adder_out = 0;
		aluzero = 0;
		aluout = 0;
		readdat2 = 0;
		muxout = 0;
		// Wait 100 ns for global reset to finish.
		#100;
		$monitor("ctlwb_out = %b, ctlm_out = %b, adder_out = %b, ",
				    ctlwb_out, ctlm_out, adder_out,
					"aluzero = %b, aluout = %b, readdat2 = %b, muxout = %b",
					 aluzero, aluout, readdat2, muxout);
		ctlwb_out = 2'b01;
		ctlm_out = 3'b101;
		adder_out = 32'h00FF1133;
		aluzero = 0;
		aluout = 32'h00FFFFFF;
		readdat2 = 32'h005100C3;
		muxout = 4'b0101;
		#20;
		ctlwb_out = 2'b10;
		ctlm_out = 3'b001;
		adder_out = 32'h00FF1100;
		aluzero = 0;
		aluout = 32'h00FFFF23;
		readdat2 = 32'h00F3DD10;
		muxout = 4'b0011;
		#20;
		$finish;
	end
	always @ *
		begin
			#10 clk = ~clk;
		end
endmodule