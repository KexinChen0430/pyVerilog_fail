module test_engine 	#(
						parameter ROUNDS = 16
					)
	(
		input wire clk,
		input wire reset,
	// -- inputs ------------------------------------------------- >>>>>
		input wire 			start_strobe_din,
		input wire [63:0]	wordA_din,
		input wire [63:0]	wordB_din,
	// -- outputs ------------------------------------------------ >>>>>
		output wire 		done_strobe_dout,
		output wire 		active_test_engine_dout,
		output wire [63:0]	wordC_dout,
		output wire [63:0]	wordD_dout
	);
	localparam IDLE 	= 1'b0;
	localparam ACTIVE 	= 1'b1;
	localparam RND_WIDTH = clog2(ROUNDS);
	/*-- Contador de rondas -------------------------------------- >>>>>
		-- Descripcion:	Contador de rondas. El numero de rondas que se
						han llevado a cabo durante la ejecucion en
						curso.
						El contador ejecuta la cuenta de manera inversa,
						terminando su operacion al llegar a 0.
	// -------------------------------------------------------------- */
		reg 	[RND_WIDTH-1:0] round_counter_reg;
		wire 	[RND_WIDTH-1:0] round_counter_next;
		// --  Elemento de memoria ------------------------------- >>>>>
			always @(posedge clk)
				if (reset)
					round_counter_reg <= ROUNDS;
				else
					round_counter_reg <= round_counter_next;
		// -- Logica de estado siguiente ------------------------- >>>>>
			assign round_counter_next = (state_reg  == ACTIVE && state_next == ACTIVE) 	? round_counter_reg - 1'b1	:
										(state_reg  == ACTIVE && state_next == IDLE)	? ROUNDS 					:
										round_counter_reg;
	// -- FSM ---------------------------------------------------- >>>>>
		/* -- Elementos de memoria ------------------------------- >>>>>
			-- Descripcion:	Maquina de estados para el control de flujo
							de datos a travez del datapath. Solo se
							tienen 2 estados: IDLE y ACTIVE.
							IDLE:	Estado de reposo. No se lleva a cabo
									trabajo durante este estado.
							ACTIVE:	Estado de trabajo, se ejecuta
									durante ROUNDS + 1 ciclos de reloj.
									El ciclo extra se utiliza para la
									captura de los nuevos datos de
									trabajo, los restantes son para el
									procesamiento de los datos.
		// ---------------------------------------------------------- */
		reg 	state_reg;
		reg 	state_next;
			always @(posedge clk)
				if (reset)
					state_reg <= IDLE;
				else
					state_reg <= state_next;
		// -- State Next logic ----------------------------------- >>>>>
		always @(*)
			begin
				state_next = state_reg;
				case (state_reg)
					IDLE:
						if (start_strobe_din)
							state_next = ACTIVE;
					ACTIVE:
						if (~|round_counter_reg)
							state_next = IDLE;
				endcase
			end
		/* -- Logica de  salida ---------------------------------- >>>>>
			-- Descripcion:	Señales de salida para datapath y para fuera
							del modulo.
								active_test_engine: indicador que el
								nucleo se encuentra dentro de un loop de
								procesamiento.
								word_ena: Habilitador de registros de
								trabajo (wordA y wordB).
								done_strobe: pulso de finalizacion de
								loop de procesamiento. Indica que los
								datos en los puertos de salida wordC y
								wordD son validos.
		// ---------------------------------------------------------- */
		wire word_ena;
		assign active_test_engine_dout = (state_reg  == ACTIVE)							? 1'b1 : 1'b0;
		assign word_ena 			   = (state_next == ACTIVE) 						? 1'b1 : 1'b0;
		assign done_strobe_dout 	   = (state_reg  == ACTIVE && state_next == IDLE) 	? 1'b1 : 1'b0;
	// -- Registers ---------------------------------------------- >>>>>
	reg 	[63:0]	wordA_reg;
	wire 	[63:0]	wordA_next;
	reg 	[63:0]	wordB_reg;
	wire 	[63:0]	wordB_next;
	// -- Registros A y B ---------------------------------------- >>>>>
		always @(posedge clk)
			if (word_ena)
				wordA_reg <= wordA_next;
		always @(posedge clk)
			if (word_ena)
				wordB_reg <= wordB_next;
	/* -- Next State Logic --------------------------------------- >>>>>
		-- Descripcion: Multiplexores para la seleccion de nuevos
						valores para los registros de trabajo.
	// -------------------------------------------------------------- */
		assign wordA_next = (start_strobe_din) 	? wordA_din : wordA_reg ^ {wordB_reg[31:0], wordB_reg[63:32]};
		assign wordB_next = (start_strobe_din)	? wordB_din : wordA_reg;
	// -- Salidas ------------------------------------------------ >>>>>
		assign wordC_dout = wordA_reg;
		assign wordD_dout = wordB_reg;
	// -- Funciones ---------------------------------------------- >>>>>
			//  Funcion de calculo: log2(x) ---------------------- >>>>>
			function integer clog2;
				input integer depth;
					for (clog2=0; depth>0; clog2=clog2+1)
						depth = depth >> 1;
			endfunction
endmodule