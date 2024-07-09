module data_memory();
	parameter	ROWS = 133;
	parameter	COLS = 200;
	// -- Modelo de memoria -------------------------------------- >>>>>
		reg [7:0] MEM [0:(ROWS*COLS)-1];
	// -- Rutina de inicializacion de memoria -------------------- >>>>>
		initial
			$readmemh("/home/hcabrera/Dropbox/tesis/noc/work/verilog/project_lancetfish/shared/scripts/python/data/133x200.dat", MEM);
	// -- Task --------------------------------------------------- >>>>>
		reg [0:63]	memory_data;
		task read;
			input [31:0]	address;
			begin
				address = address * 8;
				$display("Address: ",address);
				memory_data =  {MEM[address], 		MEM[address + 1],
								MEM[address + 2], 	MEM[address + 3],
								MEM[address + 4], 	MEM[address + 5],
								MEM[address + 6], 	MEM[address + 7]};
			end
		endtask : read
endmodule