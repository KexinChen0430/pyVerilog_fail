module DSP48A1 (
    input signed [17:0] A,
    input signed [17:0] B,
    input signed [47:0] C,
    input signed [17:0] D,
    input signed [47:0] PCIN,
    input CARRYIN,
    input [7:0] OPMODE,
    output signed [35:0] M,
    output signed [47:0] P,
    output signed [17:0] BCOUT,
    output signed [47:0] PCOUT,
    output CARRYOUT,
    output CARRYOUTF,
    (* clkbuf_sink *)
    input CLK,
    input CEA,
    input CEB,
    input CEC,
    input CED,
    input CEM,
    input CECARRYIN,
    input CEOPMODE,
    input CEP,
    input RSTA,
    input RSTB,
    input RSTC,
    input RSTD,
    input RSTM,
    input RSTCARRYIN,
    input RSTOPMODE,
    input RSTP
);
parameter integer A0REG = 0;
parameter integer A1REG = 1;
parameter integer B0REG = 0;
parameter integer B1REG = 1;
parameter integer CREG = 1;
parameter integer DREG = 1;
parameter integer MREG = 1;
parameter integer CARRYINREG = 1;
parameter integer CARRYOUTREG = 1;
parameter integer OPMODEREG = 1;
parameter integer PREG = 1;
parameter CARRYINSEL = "OPMODE5";
parameter RSTTYPE = "SYNC";
wire signed [35:0] M_MULT;
wire signed [47:0] P_IN;
wire signed [17:0] A0_OUT;
wire signed [17:0] B0_OUT;
wire signed [17:0] A1_OUT;
wire signed [17:0] B1_OUT;
wire signed [17:0] B1_IN;
wire signed [47:0] C_OUT;
wire signed [17:0] D_OUT;
wire signed [7:0] OPMODE_OUT;
wire CARRYIN_OUT;
wire CARRYOUT_IN;
wire CARRYIN_IN;
reg signed [47:0] XMUX;
reg signed [47:0] ZMUX;
// The registers.
reg signed [17:0] A0_REG;
reg signed [17:0] A1_REG;
reg signed [17:0] B0_REG;
reg signed [17:0] B1_REG;
reg signed [47:0] C_REG;
reg signed [17:0] D_REG;
reg signed [35:0] M_REG;
reg signed [47:0] P_REG;
reg [7:0] OPMODE_REG;
reg CARRYIN_REG;
reg CARRYOUT_REG;
initial begin
	A0_REG = 0;
	A1_REG = 0;
	B0_REG = 0;
	B1_REG = 0;
	C_REG = 0;
	D_REG = 0;
	M_REG = 0;
	P_REG = 0;
	OPMODE_REG = 0;
	CARRYIN_REG = 0;
	CARRYOUT_REG = 0;
end
generate
if (RSTTYPE == "SYNC") begin
	always @(posedge CLK) begin
		if (RSTA) begin
			A0_REG <= 0;
			A1_REG <= 0;
		end else if (CEA) begin
			A0_REG <= A;
			A1_REG <= A0_OUT;
		end
	end
	always @(posedge CLK) begin
		if (RSTB) begin
			B0_REG <= 0;
			B1_REG <= 0;
		end else if (CEB) begin
			B0_REG <= B;
			B1_REG <= B1_IN;
		end
	end
	always @(posedge CLK) begin
		if (RSTC) begin
			C_REG <= 0;
		end else if (CEC) begin
			C_REG <= C;
		end
	end
	always @(posedge CLK) begin
		if (RSTD) begin
			D_REG <= 0;
		end else if (CED) begin
			D_REG <= D;
		end
	end
	always @(posedge CLK) begin
		if (RSTM) begin
			M_REG <= 0;
		end else if (CEM) begin
			M_REG <= M_MULT;
		end
	end
	always @(posedge CLK) begin
		if (RSTP) begin
			P_REG <= 0;
		end else if (CEP) begin
			P_REG <= P_IN;
		end
	end
	always @(posedge CLK) begin
		if (RSTOPMODE) begin
			OPMODE_REG <= 0;
		end else if (CEOPMODE) begin
			OPMODE_REG <= OPMODE;
		end
	end
	always @(posedge CLK) begin
		if (RSTCARRYIN) begin
			CARRYIN_REG <= 0;
			CARRYOUT_REG <= 0;
		end else if (CECARRYIN) begin
			CARRYIN_REG <= CARRYIN_IN;
			CARRYOUT_REG <= CARRYOUT_IN;
		end
	end
end else begin
	always @(posedge CLK, posedge RSTA) begin
		if (RSTA) begin
			A0_REG <= 0;
			A1_REG <= 0;
		end else if (CEA) begin
			A0_REG <= A;
			A1_REG <= A0_OUT;
		end
	end
	always @(posedge CLK, posedge RSTB) begin
		if (RSTB) begin
			B0_REG <= 0;
			B1_REG <= 0;
		end else if (CEB) begin
			B0_REG <= B;
			B1_REG <= B1_IN;
		end
	end
	always @(posedge CLK, posedge RSTC) begin
		if (RSTC) begin
			C_REG <= 0;
		end else if (CEC) begin
			C_REG <= C;
		end
	end
	always @(posedge CLK, posedge RSTD) begin
		if (RSTD) begin
			D_REG <= 0;
		end else if (CED) begin
			D_REG <= D;
		end
	end
	always @(posedge CLK, posedge RSTM) begin
		if (RSTM) begin
			M_REG <= 0;
		end else if (CEM) begin
			M_REG <= M_MULT;
		end
	end
	always @(posedge CLK, posedge RSTP) begin
		if (RSTP) begin
			P_REG <= 0;
		end else if (CEP) begin
			P_REG <= P_IN;
		end
	end
	always @(posedge CLK, posedge RSTOPMODE) begin
		if (RSTOPMODE) begin
			OPMODE_REG <= 0;
		end else if (CEOPMODE) begin
			OPMODE_REG <= OPMODE;
		end
	end
	always @(posedge CLK, posedge RSTCARRYIN) begin
		if (RSTCARRYIN) begin
			CARRYIN_REG <= 0;
			CARRYOUT_REG <= 0;
		end else if (CECARRYIN) begin
			CARRYIN_REG <= CARRYIN_IN;
			CARRYOUT_REG <= CARRYOUT_IN;
		end
	end
end
endgenerate
// The register enables.
assign A0_OUT = (A0REG == 1) ? A0_REG : A;
assign A1_OUT = (A1REG == 1) ? A1_REG : A0_OUT;
assign B0_OUT = (B0REG == 1) ? B0_REG : B;
assign B1_OUT = (B1REG == 1) ? B1_REG : B1_IN;
assign C_OUT = (CREG == 1) ? C_REG : C;
assign D_OUT = (DREG == 1) ? D_REG : D;
assign M = (MREG == 1) ? M_REG : M_MULT;
assign P = (PREG == 1) ? P_REG : P_IN;
assign OPMODE_OUT = (OPMODEREG == 1) ? OPMODE_REG : OPMODE;
assign CARRYIN_OUT = (CARRYINREG == 1) ? CARRYIN_REG : CARRYIN_IN;
assign CARRYOUT = (CARRYOUTREG == 1) ? CARRYOUT_REG : CARRYOUT_IN;
assign CARRYOUTF = CARRYOUT;
// The pre-adder.
wire signed [17:0] PREADDER;
assign B1_IN = OPMODE_OUT[4] ? PREADDER : B0_OUT;
assign PREADDER = OPMODE_OUT[6] ? D_OUT - B0_OUT : D_OUT + B0_OUT;
// The multiplier.
assign M_MULT = A1_OUT * B1_OUT;
// The carry in selection.
assign CARRYIN_IN = (CARRYINSEL == "OPMODE5") ? OPMODE_OUT[5] : CARRYIN;
// The post-adder inputs.
always @* begin
	case (OPMODE_OUT[1:0])
		2'b00: XMUX <= 0;
		2'b01: XMUX <= M;
		2'b10: XMUX <= P;
		2'b11: XMUX <= {D_OUT[11:0], A1_OUT, B1_OUT};
		default: XMUX <= 48'hxxxxxxxxxxxx;
	endcase
end
always @* begin
	case (OPMODE_OUT[3:2])
		2'b00: ZMUX <= 0;
		2'b01: ZMUX <= PCIN;
		2'b10: ZMUX <= P;
		2'b11: ZMUX <= C_OUT;
		default: ZMUX <= 48'hxxxxxxxxxxxx;
	endcase
end
// The post-adder.
wire signed [48:0] X_EXT;
wire signed [48:0] Z_EXT;
assign X_EXT = {1'b0, XMUX};
assign Z_EXT = {1'b0, ZMUX};
assign {CARRYOUT_IN, P_IN} = OPMODE_OUT[7] ? (Z_EXT - (X_EXT + CARRYIN_OUT)) : (Z_EXT + X_EXT + CARRYIN_OUT);
// Cascade outputs.
assign BCOUT = B1_OUT;
assign PCOUT = P;
endmodule