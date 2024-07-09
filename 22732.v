module
  .O_DA(),
  .O_DA_OE_L(),
  // control
  .I_A9_L(`LO),			// Not used
  .I_A8(`HI),				// Not used
  .I_BDIR(ppic_o[7]),
  .I_BC2(`HI),
  .I_BC1(ppic_o[6]),
  .I_SEL_L(`HI),			// Default - clock divisor select - none
  .O_AUDIO(audio_o),
  // port a
  .I_IOA(8'hff),
  .O_IOA(),
  .O_IOA_OE_L(),
  // port b
  .I_IOB(8'hff),
  .O_IOB(),
  .O_IOB_OE_L(),
  .ENA(`HI),          // Check this clock enable for higher speed operation
  .RESET_L(nreset_i),
  .CLK(clk_1)
  );
`endif
	// FDC Logic
	fdc floppy (
		// CPC Interface
		.clk_i(clk_4),
		.reset_i(~nreset_i),
		.enable_i(A[15:1] == (16'hfb7f>>1)),
		.data_i(DO),
		.data_o(fdc_o),
		.regsel_i(A[0]),
		.rd_i(!nIORD),
		.wr_i(!nIOWR),
		.activity_o(fdc_activity),
		.motor_i(fdc_motor),
		// Drive interface
		.sup_clk_i(S_clk_i),
		.A(S_A_i),
		.D_i(S_D_i),
		.D_o(S_D_o),
		.sup_rd_i(S_rd_i),
		.sup_wr_i(S_wr_i),
		.sup_enable_i(S_enable_i),
		.sup_int_o(S_fdc_int_o)	// Interrupt
	);
	// Motor control
	reg [1:0] track_motor_rise = 2'd0;
	always @(posedge clk_16)
		track_motor_rise = {track_motor_rise[0], !nIOWR && (A[15:0] == 16'hfa7e)};
	wire motor_rise = (track_motor_rise == 2'b01);
	always @(negedge clk_16)
		if( motor_rise ) fdc_motor <= DO[0];
endmodule