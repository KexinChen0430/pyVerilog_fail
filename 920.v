module bus_master_mux (
	/********** ÊäÈëÊä³öÐÅºÅ **********/
	// 0ºÅ×ÜÏßÖ÷¿Ø
	input  wire [`WordAddrBus] m0_addr,	   // µØÖ·
	input  wire				   m0_as_,	   // µØÖ·Ñ¡Í¨
	input  wire				   m0_rw,	   // ¶Á/Ð´
	input  wire [`WordDataBus] m0_wr_data, // Ð´ÈëµÄÊý¾Ý
	input  wire				   m0_grnt_,   // ¸³Óè×ÜÏß
	// 1ºÅ×ÜÏßÖ÷¿Ø
	input  wire [`WordAddrBus] m1_addr,	   // µØÖ·
	input  wire				   m1_as_,	   // µØÖ·Ñ¡Í¨
	input  wire				   m1_rw,	   // ¶Á/Ð´
	input  wire [`WordDataBus] m1_wr_data, // Ð´ÈëµÄÊý¾Ý
	input  wire				   m1_grnt_,   // ¸³Óè×ÜÏß
	// 3ºÅ×ÜÏßÖ÷¿Ø
	input  wire [`WordAddrBus] m2_addr,	   // µØÖ·
	input  wire				   m2_as_,	   // µØÖ·Ñ¡Í¨
	input  wire				   m2_rw,	   // ¶Á/Ð´
	input  wire [`WordDataBus] m2_wr_data, // Ð´ÈëµÄÊý¾Ý
	input  wire				   m2_grnt_,   // ¸³Óè×ÜÏß
	// 3ºÅ×ÜÏßÖ÷¿Ø
	input  wire [`WordAddrBus] m3_addr,	   // µØÖ·
	input  wire				   m3_as_,	   // µØÖ·Ñ¡Í¨
	input  wire				   m3_rw,	   // ¶Á/Ð´
	input  wire [`WordDataBus] m3_wr_data, // Ð´ÈëµÄÊý¾Ý
	input  wire				   m3_grnt_,   // ¸³Óè×ÜÏß
	/********** ¹²ÏíÐÅºÅ×ÜÏß´ÓÊô **********/
	output reg	[`WordAddrBus] s_addr,	   // µØÖ·
	output reg				   s_as_,	   // µØÖ·Ñ¡Í¨
	output reg				   s_rw,	   // ¶Á/Ð´
	output reg	[`WordDataBus] s_wr_data   // Ð´ÈëµÄÊý¾Ý
);
	/********** ×ÜÏßÖ÷¿Ø¶àÂ·¸´ÓÃÆ÷ **********/
	always @(*) begin
		/* Ñ¡Ôñ³ÖÓÐ×ÜÏßÊ¹ÓÃÈ¨µÄÖ÷¿Ø */
		if (m0_grnt_ == `ENABLE_) begin			 // 0ºÅ×ÜÏß×Ü¿Ø
			s_addr	  = m0_addr;
			s_as_	  = m0_as_;
			s_rw	  = m0_rw;
			s_wr_data = m0_wr_data;
		end else if (m1_grnt_ == `ENABLE_) begin // 1ºÅ×ÜÏß×Ü¿Ø
			s_addr	  = m1_addr;
			s_as_	  = m1_as_;
			s_rw	  = m1_rw;
			s_wr_data = m1_wr_data;
		end else if (m2_grnt_ == `ENABLE_) begin // 2ºÅ×ÜÏß×Ü¿Ø
			s_addr	  = m2_addr;
			s_as_	  = m2_as_;
			s_rw	  = m2_rw;
			s_wr_data = m2_wr_data;
		end else if (m3_grnt_ == `ENABLE_) begin // 3ºÅ×ÜÏß×Ü¿Ø
			s_addr	  = m3_addr;
			s_as_	  = m3_as_;
			s_rw	  = m3_rw;
			s_wr_data = m3_wr_data;
		end else begin							 // Ä¬ÈÏÖµ
			s_addr	  = `WORD_ADDR_W'h0;
			s_as_	  = `DISABLE_;
			s_rw	  = `READ;
			s_wr_data = `WORD_DATA_W'h0;
		end
	end
endmodule