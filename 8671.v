module alu (
	input  wire [`WordDataBus] in_0,  // üÍ 0
	input  wire [`WordDataBus] in_1,  // üÍ 1
	input  wire [`AluOpBus]	   op,	  // Iy[V
	output reg	[`WordDataBus] out,	  // oÍ
	output reg				   of	  // I[ot[
);
	/********** t«üoÍM **********/
	wire signed [`WordDataBus] s_in_0 = $signed(in_0); // t«üÍ 0
	wire signed [`WordDataBus] s_in_1 = $signed(in_1); // t«üÍ 1
	wire signed [`WordDataBus] s_out  = $signed(out);  // t«oÍ
	/********** Zp_Z **********/
	always @(*) begin
		case (op)
			`ALU_OP_AND	 : begin // _ÏiANDj
				out	  = in_0 & in_1;
			end
			`ALU_OP_OR	 : begin // _aiORj
				out	  = in_0 | in_1;
			end
			`ALU_OP_XOR	 : begin // r¼I_aiXORj
				out	  = in_0 ^ in_1;
			end
			`ALU_OP_ADDS : begin // t«ÁZ
				out	  = in_0 + in_1;
			end
			`ALU_OP_ADDU : begin // ÈµÁZ
				out	  = in_0 + in_1;
			end
			`ALU_OP_SUBS : begin // t«¸Z
				out	  = in_0 - in_1;
			end
			`ALU_OP_SUBU : begin // Èµ¸Z
				out	  = in_0 - in_1;
			end
			`ALU_OP_SHRL : begin // _EVtg
				out	  = in_0 >> in_1[`ShAmountLoc];
			end
			`ALU_OP_SHLL : begin // _¶Vtg
				out	  = in_0 << in_1[`ShAmountLoc];
			end
			default		 : begin // ftHgl (No Operation)
				out	  = in_0;
			end
		endcase
	end
	/********** I[ot[`FbN **********/
	always @(*) begin
		case (op)
			`ALU_OP_ADDS : begin // ÁZI[ot[Ì`FbN
				if (((s_in_0 > 0) && (s_in_1 > 0) && (s_out < 0)) ||
					((s_in_0 < 0) && (s_in_1 < 0) && (s_out > 0))) begin
					of = `ENABLE;
				end else begin
					of = `DISABLE;
				end
			end
			`ALU_OP_SUBS : begin // ¸ZI[ot[Ì`FbN
				if (((s_in_0 < 0) && (s_in_1 > 0) && (s_out > 0)) ||
					((s_in_0 > 0) && (s_in_1 < 0) && (s_out < 0))) begin
					of = `ENABLE;
				end else begin
					of = `DISABLE;
				end
			end
			default		: begin // ftHgl
				of = `DISABLE;
			end
		endcase
	end
endmodule