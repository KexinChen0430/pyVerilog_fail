module mem_ctrl (
	/********** EX/MEM¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	input  wire				   ex_en,		   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	input  wire [`MemOpBus]	   ex_mem_op,	   // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`WordDataBus] ex_mem_wr_data, // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	input  wire [`WordDataBus] ex_out,		   // IÀí½Y¹û
	/********** ¥á¥â¥ê¥¢¥¯¥»¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	input  wire [`WordDataBus] rd_data,		   // Õi¤ß³ö¤·¥Ç©`¥¿
	output wire [`WordAddrBus] addr,		   // ¥¢¥É¥ì¥¹
	output reg				   as_,			   // ¥¢¥É¥ì¥¹ÓÐ¿
	output reg				   rw,			   // Õi¤ß£¯ø¤­
	output wire [`WordDataBus] wr_data,		   // ø¤­Þz¤ß¥Ç©`¥¿
	/********** ¥á¥â¥ê¥¢¥¯¥»¥¹½Y¹û **********/
	output reg [`WordDataBus]  out	 ,		   // ¥á¥â¥ê¥¢¥¯¥»¥¹½Y¹û
	output reg				   miss_align	   // ¥ß¥¹¥¢¥é¥¤¥ó
);
	/********** ÄÚ²¿ÐÅºÅ **********/
	wire [`ByteOffsetBus]	 offset;		   // ¥ª¥Õ¥»¥Ã¥È
	/********** ³öÁ¦¤Î¥¢¥µ¥¤¥ó **********/
	assign wr_data = ex_mem_wr_data;		   // ø¤­Þz¤ß¥Ç©`¥¿
	assign addr	   = ex_out[`WordAddrLoc];	   // ¥¢¥É¥ì¥¹
	assign offset  = ex_out[`ByteOffsetLoc];   // ¥ª¥Õ¥»¥Ã¥È
	/********** ¥á¥â¥ê¥¢¥¯¥»¥¹¤ÎÖÆÓù **********/
	always @(*) begin
		/* ¥Ç¥Õ¥©¥ë¥È */
		miss_align = `DISABLE;
		out		   = `WORD_DATA_W'h0;
		as_		   = `DISABLE_;
		rw		   = `READ;
		/* ¥á¥â¥ê¥¢¥¯¥»¥¹ */
		if (ex_en == `ENABLE) begin
			case (ex_mem_op)
				`MEM_OP_LDW : begin // ¥ï©`¥ÉÕi¤ß³ö¤·
					/* ¥Ð¥¤¥È¥ª¥Õ¥»¥Ã¥È¤Î¥Á¥§¥Ã¥¯ */
					if (offset == `BYTE_OFFSET_WORD) begin // ¥¢¥é¥¤¥ó
						out			= rd_data;
						as_		   = `ENABLE_;
					end else begin						   // ¥ß¥¹¥¢¥é¥¤¥ó
						miss_align	= `ENABLE;
					end
				end
				`MEM_OP_STW : begin // ¥ï©`¥Éø¤­Þz¤ß
					/* ¥Ð¥¤¥È¥ª¥Õ¥»¥Ã¥È¤Î¥Á¥§¥Ã¥¯ */
					if (offset == `BYTE_OFFSET_WORD) begin // ¥¢¥é¥¤¥ó
						rw			= `WRITE;
						as_		   = `ENABLE_;
					end else begin						   // ¥ß¥¹¥¢¥é¥¤¥ó
						miss_align	= `ENABLE;
					end
				end
				default		: begin // ¥á¥â¥ê¥¢¥¯¥»¥¹¤Ê¤·
					out			= ex_out;
				end
			endcase
		end
	end
endmodule