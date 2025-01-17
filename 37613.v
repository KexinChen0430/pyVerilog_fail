module SSY0Y1DX0X1_TEND	#(
							parameter X_WIDTH 		= 5,
							parameter Y_WIDTH 		= 5,
							parameter PROC_CYCLES 	= 5
						)
	(
		input wire clk,
		input wire reset,
	// -- rx :: channels  ---------------------------------------- >>>>>
		input  wire [0:(Y_WIDTH * `CHANNEL_WIDTH)-1] 	yneg_inports_din,
		output wire [0:Y_WIDTH-1]						yneg_credits_dout,
		input  wire [0:(Y_WIDTH * `CHANNEL_WIDTH)-1] 	ypos_inports_din,
		output wire [0:Y_WIDTH-1]						ypos_credits_dout,
	// -- tx :: channels ----------------------------------------- >>>>>
		output wire [0:(X_WIDTH * `CHANNEL_WIDTH)-1] 	yneg_outports_dout,
		input  wire [0:X_WIDTH-1]						yneg_credits_din,
		output wire [0:(X_WIDTH * `CHANNEL_WIDTH)-1] 	ypos_outports_dout,
		input  wire [0:X_WIDTH-1]						ypos_credits_din
	);
/*
-- Instacia :: 	TENC - Test Engine Network Core
-- Descripcion:
*/
	// -- inports  ------------------------------------------- >>>>>
		wire [0:(Y_WIDTH * `CHANNEL_WIDTH)-1] 	xpos_inports;			// -- Deflector
		wire [0:Y_WIDTH-1]						xpos_credits_outports;	// -- Deflector
		wire [0:(Y_WIDTH * `CHANNEL_WIDTH)-1] 	xneg_inports;			// -- Deflector
		wire [0:Y_WIDTH-1]						xneg_credits_outports;	// -- Deflector
		wire [0:(X_WIDTH * `CHANNEL_WIDTH)-1] 	ypos_inports;			// -- TXRX
		wire [0:X_WIDTH-1]						ypos_credits_outports;	// -- TXRX
		wire [0:(X_WIDTH * `CHANNEL_WIDTH)-1] 	yneg_inports;			// -- TXRX
		wire [0:X_WIDTH-1]						yneg_credits_outports;	// -- TXRX
	// -- outports ----------------------------------------------- >>>>>
		wire [0:(Y_WIDTH * `CHANNEL_WIDTH)-1] 	xpos_outports;			// -- Deflector
		wire [0:Y_WIDTH-1]						xpos_credits_inports;	// -- Deflector
		wire [0:(Y_WIDTH * `CHANNEL_WIDTH)-1] 	xneg_outports;			// -- Deflector
		wire [0:Y_WIDTH-1]						xneg_credits_inports;	// -- Deflector
		wire [0:(X_WIDTH * `CHANNEL_WIDTH)-1] 	ypos_outports;			// -- TXRX
		wire [0:X_WIDTH-1]						ypos_credits_inports;	// -- TXRX
		wire [0:(X_WIDTH * `CHANNEL_WIDTH)-1] 	yneg_outports;			// -- TXRX
		wire [0:X_WIDTH-1]						yneg_credits_inports;	// -- TXRX
/*
	-- Descripcion:	Asignacion de señales del Network Core a entradas
					y salidas del modulo top level.
*/
	// -- rx ----------------------------------------------------- >>>>>
		assign yneg_inports 		= yneg_inports_din;
		assign yneg_credits_dout	= yneg_credits_outports;
		assign ypos_inports 		= ypos_inports_din;
		assign ypos_credits_dout	= ypos_credits_outports;
	// -- tx ----------------------------------------------------- >>>>>
		assign yneg_outports_dout	= yneg_outports;
		assign yneg_credits_inports = yneg_credits_din;
		assign ypos_outports_dout	= ypos_outports;
		assign ypos_credits_inports = ypos_credits_din;
/*
-- Instacia :: Nucleo de red
-- Descripcion:
-- Salidas:
*/
	test_engine_network_core
		#(
			.X_WIDTH(X_WIDTH),
			.Y_WIDTH(Y_WIDTH),
			.PROC_CYCLES(PROC_CYCLES)
		)
	TENC_I0
		(
			.clk					(clk),
			.reset					(reset),
		// -- inports  ----------------------------------------------- >>>>>
			.xpos_inports 			(xpos_inports),
			.xpos_credits_outports	(xpos_credits_outports),
			.xneg_inports 			(xneg_inports),
			.xneg_credits_outports 	(xneg_credits_outports),
			.ypos_inports 			(ypos_inports),
			.ypos_credits_outports 	(ypos_credits_outports),
			.yneg_inports 			(yneg_inports),
			.yneg_credits_outports 	(yneg_credits_outports),
		// -- outports ----------------------------------------------- >>>>>
			.xpos_outports 			(xpos_outports),
			.xpos_credits_inports 	(xpos_credits_inports),
			.xneg_outports 			(xneg_outports),
			.xneg_credits_inports 	(xneg_credits_inports),
			.ypos_outports 			(ypos_outports),
			.ypos_credits_inports  	(ypos_credits_inports),
			.yneg_outports 			(yneg_outports),
			.yneg_credits_inports 	(yneg_credits_inports)
		);
/*
-- Instacia :: Deflectores :: DX0X1_ND
-- Descripcion:
-- Salidas:
*/
	genvar channel;
	wire [`CHANNEL_WIDTH-1:0] xpos_in_channels	[0:Y_WIDTH];
	wire 					  xpos_out_credits 	[0:Y_WIDTH];
	wire [`CHANNEL_WIDTH-1:0] xpos_out_channels	[0:Y_WIDTH];
	wire 					  xpos_in_credits 	[0:Y_WIDTH];
	wire [`CHANNEL_WIDTH-1:0] xneg_in_channels	[0:Y_WIDTH];
	wire 					  xneg_out_credits 	[0:Y_WIDTH];
	wire [`CHANNEL_WIDTH-1:0] xneg_out_channels	[0:Y_WIDTH];
	wire 					  xneg_in_credits 	[0:Y_WIDTH];
	generate
		for (channel = 0; channel < Y_WIDTH; channel = channel + 1)
			begin
				assign xpos_inports [channel * `CHANNEL_WIDTH:(channel * `CHANNEL_WIDTH + `CHANNEL_WIDTH) - 1] 	= xpos_in_channels[channel];
				assign xpos_out_channels[channel] 	= xpos_outports [channel * `CHANNEL_WIDTH:(channel * `CHANNEL_WIDTH + `CHANNEL_WIDTH) - 1];
			end
	endgenerate // Generacion de canales X+
	generate
		for (channel = 0; channel < Y_WIDTH; channel = channel + 1)
			begin
				assign xneg_inports	[channel * `CHANNEL_WIDTH:(channel * `CHANNEL_WIDTH + `CHANNEL_WIDTH) - 1] = xneg_in_channels[channel];
				assign xneg_out_channels[channel] 	= xneg_outports 		[channel * `CHANNEL_WIDTH:(channel * `CHANNEL_WIDTH + `CHANNEL_WIDTH) - 1];
			end
	endgenerate // Generacion de canales X-
genvar index;
	generate
		for (index = 0; index < Y_WIDTH; index = index + 1)
			begin: deflector_xpos
				DX0X1_ND	#(
								.X_WIDTH(X_WIDTH),
								.Y_WIDTH(Y_WIDTH),
								.X_LOCAL(X_WIDTH + 1),
								.Y_LOCAL(index   + 1)
							)
				deflector_xpos
					(
						.clk				(clk),
						.reset 				(reset),
					// -- puertos de entrada --------------------- >>>>>
						.credit_out_dout 	(xpos_credits_inports[index]),
						.channel_din 		(xpos_out_channels[index]),
					// -- puertos de salida ---------------------- >>>>>
						.credit_in_din 		(xpos_credits_outports[index]),
						.channel_dout 		(xpos_in_channels[index])
				    );
			end
	endgenerate
	generate
		for (index = 0; index < Y_WIDTH; index = index + 1)
			begin: deflector_xneg
				DX0X1_ND	#(
								.X_WIDTH(X_WIDTH),
								.Y_WIDTH(Y_WIDTH),
								.X_LOCAL(0),
								.Y_LOCAL(index + 1)
							)
				deflector_xneg
					(
						.clk				(clk),
						.reset 				(reset),
					// -- puertos de entrada --------------------- >>>>>
						.credit_out_dout 	(xneg_credits_inports[index]),
						.channel_din 		(xneg_out_channels[index]),
					// -- puertos de salida ---------------------- >>>>>
						.credit_in_din 		(xneg_credits_outports[index]),
						.channel_dout 		(xneg_in_channels[index])
				    );
			end
	endgenerate
endmodule