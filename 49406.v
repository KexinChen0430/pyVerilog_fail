module compare_cla #(
	parameter N = 7,
	parameter [N-1:0] CONST = 0,
	parameter EQ = 1,
	parameter W = 1		/* Number of LUT bits needed per input */
) (
	input [N-1:0] in,
	output out
);
	if (!`CONFIG_HAS_CARRY4 || N * W <= `CONFIG_LUT_MAX_SZ)
		assign out = (in != CONST) ^ EQ;
	else begin
		localparam OPTIM = (CONST[0] == EQ) && W == 1;
		localparam _N = OPTIM ? (N - 1) : N;
		wire [_N-1:0] _in;
		/* We have the possibility to save a bit */
		if (OPTIM)
			assign _in = in >> 1;
		else
			assign _in = in;
		localparam _B = `CONFIG_LUT_SZ / W; /* Inputs per LUT */
		localparam B = _B ? _B : 1;
		localparam LUTS = (_N  + B - 1) / B;
		localparam C = (LUTS + 3) / 4; /* Number of carry chains */
		wire [C*4-1:0] co;
		wire [C*4-1:0] _sin;
		wire [C-1:0] _cin;
		wire [LUTS-1:0] luts;
		genvar i;
		assign out = co[LUTS-1];
		/*
		 */
		for (i = 0; i < LUTS; i = i + 1) begin : LUT
			if ((i + 1) * B > N)
				/* partial LUT */
				assign luts[i] = _in[N-1:(LUTS-1)*B] == CONST[N-1:(LUTS-1)*B];
			else
				assign luts[i] = _in[i*B+:B] == CONST[i*B+:B];
		end
		assign _sin = luts;
		for (i = 0; i < C; i = i + 1) begin : CIN
			if (OPTIM)
				assign _cin[i] = i ? co[i*4-1] : in[0];
			else
				assign _cin[i] = i ? co[i*4-1] : EQ;
		end
		CARRY4 u_CARRY4 (
			.CO(co[3:0]),
			.O(),
			.CI(),
			.CYINIT(_cin[0]),
			.DI({4{!EQ}}),
			.S(_sin[3:0])
		);
		if (C > 1) begin
			CARRY4 u_CARRY4 [C-1:1] (
				.CO(co[C*4-1:4]),
				.O(),
				.CI(_cin[C-1:1]),
				.CYINIT(),
				.DI({4{!EQ}}),
				.S(_sin[C*4-1:4])
			);
		end
	end
endmodule