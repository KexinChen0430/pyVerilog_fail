module test_engine_nic_output_block
	(
		input  wire clk,
		input  wire reset,
	// -- inputs from pn ----------------------------------------- >>>>>
		input  wire 							done_strobe_din,
		input  wire [(2* `CHANNEL_WIDTH)-1:0] 	wordC_din,
		input  wire [(2* `CHANNEL_WIDTH)-1:0] 	wordD_din,
		input  wire [`CHANNEL_WIDTH-1:0] 		shifted_header_din,
	// -- to input block ----------------------------------------- >>>>>
		output wire zero_credits_dout,
	// -- output port -------------------------------------------- >>>>>
		input  wire 					credit_in_din,
		output reg [`CHANNEL_WIDTH-1:0]	output_channel_dout
	);
/*
-- Instancia:	test_engine_nic_output_control_unit
-- Descripcion: Unidad de control para el bloque de salida de la
				interfaz de red. Este bloque se encarga de organizar la
				salida de flits para su transporte por medio del router
				de un nodo.
				El control de creditos se encuentra implementado dentro
				de este modulo.
*/
	wire [2:0]	output_selector;
	test_engine_nic_output_control_unit  test_engine_nic_output_control_unit
		(
			.clk	(clk),
			.reset	(reset),
		// -- inputs --------------------------------------------- >>>>>
			.credit_in_din			(credit_in_din),
			.done_strobe_din		(done_strobe_din),
		// -- outputs -------------------------------------------- >>>>>
			.zero_credits_dout		(zero_credits_dout),
			.output_selector_dout	(output_selector)
		);
/*
	-- Registros
	-- Descripcion: Registros de captura del resultado del elemento de
					procesamiento. Estos registros (64 bits c/u)
					almacenan el resultado del procesamiento, previo a
					su liberacion a la red.
*/
	reg [(2* `CHANNEL_WIDTH)-1:0] wordC_reg;
	reg [(2* `CHANNEL_WIDTH)-1:0] wordD_reg;
	always @(posedge clk)
		if (done_strobe_din)
			wordC_reg <= wordC_din;
	always @(posedge clk)
		if (done_strobe_din)
			wordD_reg <= wordD_din;
/*
	-- Multiplexor
	-- Descripcion: Multiplexor para la seleccion del flit que saldra
					a la red durante el siguiente ciclo de reloj.
					Los datos de entrada para el multiplexor, son los
					registros de resultado del PE y el flit de cabecera
					modificado.
					Si no existe transito de flits el multiplexor, este
					mantiene el canal de salida en un valor de 0.
*/
	always @(*)
		begin
			output_channel_dout = {`CHANNEL_WIDTH{1'b0}};
			case (output_selector)
				3'b101: output_channel_dout = shifted_header_din;
				3'b100:	output_channel_dout = wordC_reg[`CHANNEL_WIDTH-1:0];						//-- Flit de datos 1
				3'b011:	output_channel_dout = wordC_reg[(2 * `CHANNEL_WIDTH)-1:`CHANNEL_WIDTH];		//-- Flit de datos 2
				3'b010: output_channel_dout = wordD_reg[`CHANNEL_WIDTH-1:0];						//-- Flit de datos 3
				3'b001: output_channel_dout = wordD_reg[(2 * `CHANNEL_WIDTH)-1:`CHANNEL_WIDTH];		//-- Flit de datos 4
				3'b000: output_channel_dout = {`CHANNEL_WIDTH{1'b0}};
			endcase
		end
endmodule