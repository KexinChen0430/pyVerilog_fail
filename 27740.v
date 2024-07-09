module fifo
	(
		input 	wire 	clk,
		input 	wire 	reset,
	// -- inputs ------------------------------------------------- >>>>>
		input 	wire 						write_strobe_din,
		input 	wire 						read_strobe_din,
		input 	wire [`CHANNEL_WIDTH-1:0]	write_data_din,
	// -- outputs ------------------------------------------------ >>>>>
		output 	wire 	full_dout,
		output 	wire 	empty_dout,
		output 	wire [`CHANNEL_WIDTH-1:0]	read_data_dout
    );
	localparam  ADDR_WIDTH = clog2(`BUFFER_DEPTH);
/*
-- Instancia :: Unidad de Control de FIFO
-- Descripcion:	Implementacion de estructura de control para FIFO.
				Incluye punteros para el camculo de la direccion a
				escribir y a leer.
*/
	// -- Unidad de Control -------------------------------------- >>>>>
	wire 	[ADDR_WIDTH-1:0]	write_addr;
	wire 	[ADDR_WIDTH-1:0]	read_addr;
	wire 						write_enable;
		fifo_control_unit fifo_control_unit
			(
				.clk	(clk),
				.reset 	(reset),
			// -- inputs ----------------------------------------- >>>>>
				.write_strobe_din	(write_strobe_din),
				.read_strobe_din	(read_strobe_din),
			// -- outputs ---------------------------------------- >>>>>
				.full_dout			(full_dout),
				.empty_dout			(empty_dout),
				.write_addr_dout	(write_addr),
				.read_addr_dout 	(read_addr)
			);
	assign write_enable = write_strobe_din & ~full_dout;
/*
-- Instancia :: Banco de registros
-- Descripcion:	Elemento de almacenamiento del FIFO. Puede intercambiar
				la implementacion del banco de memoria (Memoria
				Distribuida / Bloque de Memoria).
*/
	// -- Banco de Registros ------------------------------------- >>>>>
			register_file	register_file
				(
					.clk(clk),
				// -- inputs ------------------------------------- >>>>>
					.write_strobe_din 	(write_enable),
					.write_address_din 	(write_addr),
					.write_data_din 	(write_data_din),
					.read_address_din 	(read_addr),
				// -- outputs ------------------------------------ >>>>>
					.read_data_dout 	(read_data_dout)
			    );
	// -- Funciones ---------------------------------------------- >>>>>
			//  Funcion de calculo: log2(x) ---------------------- >>>>>
			function integer clog2;
				input integer depth;
					for (clog2=0; depth>0; clog2=clog2+1)
						depth = depth >> 1;
			endfunction
endmodule