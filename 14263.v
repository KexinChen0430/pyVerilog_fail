module is instantiated from another file, 'State_Machine.v'
		//It contains a Moore state machine that will take a clock and reset, and output LED combinations
		Sec5_SM FSM_1(
			.DigitalLDir(DigitalLDir),
			.DigitalRDir(DigitalRDir),
			.clk_i(clk_2),
			.reset_n(reset_n),
			.outputs(outputs)
			/*.Len(Len),
			.Ldir(Ldir),
			.Ren(Ren),
			.Rdir(Rdir)*/
			);
endmodule