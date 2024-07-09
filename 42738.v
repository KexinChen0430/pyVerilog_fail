module
	ID_EX idex(.clk(clk), .ctlwb_out(ctlwb_out), .ctlm_out(ctlm_out),
		.ctlex_out(ctlex_out), .npc(npc), .readdat1(readdat1), .readdat2(readdat2),
		.signext_out(signext_out), .instr_2016(instr_2016), .instr_1511(instr_1511),
		.wb_ctlout(wb_ctlout), .m_ctlout(m_ctlout), .ex_ctlout(ex_ctlout),
		.npcout(npcout), .rdata1out(rdata1out), .rdata2out(rdata2out),
		.s_extendout(s_extendout), .instrout_2016(instrout_2016),
		.instrout_1511(instrout_1511));
	initial begin
		// Initialize Inputs
		clk = 1;
		ctlwb_out = 0;
		ctlm_out = 0;
		ctlex_out = 0;
		npc = 0;
		readdat1 = 0;
		readdat2 = 0;
		signext_out = 0;
		instr_2016 = 0;
		instr_1511 = 0;
		// Wait 100 ns for global reset to finish
		$display("Waiting for the global reset...");
		#100;
		// Test values
		$display("Testing values...");
		#20;
		ctlwb_out = 1;
		ctlm_out = 2;
		ctlex_out = 8;
		npc = 32'h0000AA01;
		readdat1 = 32'h0011CC00;
		readdat2 = 32'h00FFFF11;
		signext_out = -254;
		instr_2016 = 20;
		instr_1511 = 15;
		#20;
		ctlwb_out = 3;
		ctlm_out = 4;
		ctlex_out = 5;
		npc = 32'h0020B000;
		readdat1 = 32'h0000FF01;
		readdat2 = 32'h00101234;
		signext_out = 89;
		instr_2016 = 16;
		instr_1511 = 11;
		#20;
		$finish;
	end
	// Monitor values
	initial begin
		$monitor("ctlwb_out = %b\t ctlm_out = %b\t ctlex_out = %b\t npc = %h\t ",
					ctlwb_out, ctlm_out, ctlex_out, npc,
					"readdat1 = %h\t readdat2 = %h\t signext_out = %d\t instr_2016 = %b\t ",
					readdat1, readdat2, $signed(signext_out), instr_2016,
					"instr_1511 = %b\t wb_ctlout = %b\t m_ctlout = %b\t ex_ctlout = %b\t ",
					instr_1511, wb_ctlout, m_ctlout, ex_ctlout,
					"npcout = %h\t rdata1out = %h\t rdata2out = %h\t s_extendout = %d\t ",
					npcout, rdata1out, rdata2out, $signed(s_extendout),
					"instrout_2016 = %b\t instrout_1511 = %b\t",
					instrout_2016, instrout_1511);
	end
	// Clock
	initial begin
		forever begin
			#10 clk = ~clk;
		end
	end
endmodule