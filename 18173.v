module alu (
	input  wire [`WordDataBus] in_0,  // ÈëÁ¦ 0
	input  wire [`WordDataBus] in_1,  // ÈëÁ¦ 1
	input  wire [`AluOpBus]	   op,	  // ¥ª¥Ú¥ì©`¥·¥ç¥ó
	output reg	[`WordDataBus] out,	  // ³öÁ¦
	output reg				   of	  // ¥ª©`¥Ð¥Õ¥í©`
);
	/********** ·ûºÅ¸¶¤­Èë³öÁ¦ÐÅºÅ **********/
	wire signed [`WordDataBus] s_in_0 = $signed(in_0); // ·ûºÅ¸¶¤­ÈëÁ¦ 0
	wire signed [`WordDataBus] s_in_1 = $signed(in_1); // ·ûºÅ¸¶¤­ÈëÁ¦ 1
	wire signed [`WordDataBus] s_out  = $signed(out);  // ·ûºÅ¸¶¤­³öÁ¦
	/********** ËãÐgÕÀíÑÝËã **********/
	always @(*) begin
		case (op)
			`ALU_OP_AND	 : begin // ÕÀí·e£¨AND£©
				out	  = in_0 & in_1;
			end
			`ALU_OP_OR	 : begin // ÕÀíºÍ£¨OR£©
				out	  = in_0 | in_1;
			end
			`ALU_OP_XOR	 : begin // ÅÅËûµÄÕÀíºÍ£¨XOR£©
				out	  = in_0 ^ in_1;
			end
			`ALU_OP_ADDS : begin // ·ûºÅ¸¶¤­¼ÓËã
				out	  = in_0 + in_1;
			end
			`ALU_OP_ADDU : begin // ·ûºÅ¤Ê¤·¼ÓËã
				out	  = in_0 + in_1;
			end
			`ALU_OP_SUBS : begin // ·ûºÅ¸¶¤­pËã
				out	  = in_0 - in_1;
			end
			`ALU_OP_SUBU : begin // ·ûºÅ¤Ê¤·pËã
				out	  = in_0 - in_1;
			end
			`ALU_OP_SHRL : begin // ÕÀíÓÒ¥·¥Õ¥È
				out	  = in_0 >> in_1[`ShAmountLoc];
			end
			`ALU_OP_SHLL : begin // ÕÀí×ó¥·¥Õ¥È
				out	  = in_0 << in_1[`ShAmountLoc];
			end
			default		 : begin // ¥Ç¥Õ¥©¥ë¥È (No Operation)
				out	  = in_0;
			end
		endcase
	end
	/********** ¥ª©`¥Ð¥Õ¥í©`¥Á¥§¥Ã¥¯ **********/
	always @(*) begin
		case (op)
			`ALU_OP_ADDS : begin // ¼ÓËã¥ª©`¥Ð¥Õ¥í©`¤Î¥Á¥§¥Ã¥¯
				if (((s_in_0 > 0) && (s_in_1 > 0) && (s_out < 0)) ||
					((s_in_0 < 0) && (s_in_1 < 0) && (s_out > 0))) begin
					of = `ENABLE;
				end else begin
					of = `DISABLE;
				end
			end
			`ALU_OP_SUBS : begin // pËã¥ª©`¥Ð¥Õ¥í©`¤Î¥Á¥§¥Ã¥¯
				if (((s_in_0 < 0) && (s_in_1 > 0) && (s_out > 0)) ||
					((s_in_0 > 0) && (s_in_1 < 0) && (s_out < 0))) begin
					of = `ENABLE;
				end else begin
					of = `DISABLE;
				end
			end
			default		: begin // ¥Ç¥Õ¥©¥ë¥È
				of = `DISABLE;
			end
		endcase
	end
endmodule