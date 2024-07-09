module
		input [7:0] ram,
		input ram_e,
		// Extended Ram modules
		input [7:0] eram,
		input u_ram_e,
		// Standard 8255 PIO
		input [7:0] pio8255,
		input pio8255_e,
		// Printer IO
		input [7:0] io,
		input io_e,
		// FDC IO
		input [7:0] fdc,
		input fdc_e
	);
	// Wire definitions ===========================================================================
	// Registers ==================================================================================
	// Assignments ================================================================================
	// Module connections =========================================================================
	// Simulation branches and control ============================================================
	// Other logic ================================================================================
	//always @(negedge clock_i)
	assign D =	(l_rom_e) ? l_rom :
					(u_rom_e) ? u_rom :
					(u_ram_e) ? eram :
					(ram_e) ? ram :
					(pio8255_e) ? pio8255 :
					(io_e) ? io :
					(fdc_e) ? fdc :
					8'd255;
endmodule