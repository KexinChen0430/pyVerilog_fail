module outputs)
   wire			CC;			// From x0 of dcpu16_alu.v
   wire			bra;			// From c0 of dcpu16_ctl.v
   wire			ena;			// From m0 of dcpu16_mbus.v
   wire [15:0]		ireg;			// From c0 of dcpu16_ctl.v
   wire [3:0]		opc;			// From c0 of dcpu16_ctl.v
   wire [1:0]		pha;			// From c0 of dcpu16_ctl.v
   wire [15:0]		regA;			// From m0 of dcpu16_mbus.v
   wire [15:0]		regB;			// From m0 of dcpu16_mbus.v
   wire [15:0]		regO;			// From x0 of dcpu16_alu.v
   wire [15:0]		regR;			// From x0 of dcpu16_alu.v
   wire [2:0]		rra;			// From c0 of dcpu16_ctl.v
   wire [15:0]		rrd;			// From r0 of dcpu16_regs.v
   wire [2:0]		rwa;			// From c0 of dcpu16_ctl.v
   wire [15:0]		rwd;			// From x0 of dcpu16_alu.v
   wire			rwe;			// From c0 of dcpu16_ctl.v
   wire			wpc;			// From m0 of dcpu16_mbus.v
   // End of automatics
   /*AUTOREG*/
   dcpu16_ctl
     c0 (/*AUTOINST*/
	 // Outputs
	 .ireg				(ireg[15:0]),
	 .pha				(pha[1:0]),
	 .opc				(opc[3:0]),
	 .rra				(rra[2:0]),
	 .rwa				(rwa[2:0]),
	 .rwe				(rwe),
	 .bra				(bra),
	 // Inputs
	 .CC				(CC),
	 .wpc				(wpc),
	 .f_dti				(f_dti[15:0]),
	 .f_ack				(f_ack),
	 .clk				(clk),
	 .ena				(ena),
	 .rst				(rst));
   dcpu16_mbus
     m0 (/*AUTOINST*/
	 // Outputs
	 .g_adr				(g_adr[15:0]),
	 .g_stb				(g_stb),
	 .g_wre				(g_wre),
	 .f_adr				(f_adr[15:0]),
	 .f_stb				(f_stb),
	 .f_wre				(f_wre),
	 .ena				(ena),
	 .wpc				(wpc),
	 .regA				(regA[15:0]),
	 .regB				(regB[15:0]),
	 // Inputs
	 .g_dti				(g_dti[15:0]),
	 .g_ack				(g_ack),
	 .f_dti				(f_dti[15:0]),
	 .f_ack				(f_ack),
	 .bra				(bra),
	 .CC				(CC),
	 .regR				(regR[15:0]),
	 .rrd				(rrd[15:0]),
	 .ireg				(ireg[15:0]),
	 .regO				(regO[15:0]),
	 .pha				(pha[1:0]),
	 .clk				(clk),
	 .rst				(rst));
   dcpu16_alu
     x0 (/*AUTOINST*/
	 // Outputs
	 .f_dto				(f_dto[15:0]),
	 .g_dto				(g_dto[15:0]),
	 .rwd				(rwd[15:0]),
	 .regR				(regR[15:0]),
	 .regO				(regO[15:0]),
	 .CC				(CC),
	 // Inputs
	 .regA				(regA[15:0]),
	 .regB				(regB[15:0]),
	 .opc				(opc[3:0]),
	 .clk				(clk),
	 .rst				(rst),
	 .ena				(ena),
	 .pha				(pha[1:0]));
   dcpu16_regs
     r0 (/*AUTOINST*/
	 // Outputs
	 .rrd				(rrd[15:0]),
	 // Inputs
	 .rwd				(rwd[15:0]),
	 .rra				(rra[2:0]),
	 .rwa				(rwa[2:0]),
	 .rwe				(rwe),
	 .rst				(rst),
	 .ena				(ena),
	 .clk				(clk));
endmodule