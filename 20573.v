module bus_slave_mux (
	/********** ÊäÈëÐÅºÅ **********/
	input  wire				   s0_cs_,	   // 0ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡
	input  wire				   s1_cs_,	   // 1ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡
	input  wire				   s2_cs_,	   // 2ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡
	input  wire				   s3_cs_,	   // 3ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡
	input  wire				   s4_cs_,	   // 4ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡
	input  wire				   s5_cs_,	   // 5ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡
	input  wire				   s6_cs_,	   // 6ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡
	input  wire				   s7_cs_,	   // 7ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡
	/********** ¥Ð¥¹¥¹¥ì©`¥ÖÐÅºÅ **********/
	// 0ºÅ×ÜÏß´ÓÊô
	input  wire [`WordDataBus] s0_rd_data, // ¶Á³öµÄÊý¾Ý
	input  wire				   s0_rdy_,	   // ¾ÍÐ÷
	// 1ºÅ×ÜÏß´ÓÊô
	input  wire [`WordDataBus] s1_rd_data, // ¶Á³öµÄÊý¾Ý
	input  wire				   s1_rdy_,	   // ¾ÍÐ÷
	// 2ºÅ×ÜÏß´ÓÊô
	input  wire [`WordDataBus] s2_rd_data, // ¶Á³öµÄÊý¾Ý
	input  wire				   s2_rdy_,	   // ¾ÍÐ÷
	// 3ºÅ×ÜÏß´ÓÊô
	input  wire [`WordDataBus] s3_rd_data, // ¶Á³öµÄÊý¾Ý
	input  wire				   s3_rdy_,	   // ¾ÍÐ÷
	// 4ºÅ×ÜÏß´ÓÊô
	input  wire [`WordDataBus] s4_rd_data, // ¶Á³öµÄÊý¾Ý
	input  wire				   s4_rdy_,	   // ¾ÍÐ÷
	// 5ºÅ×ÜÏß´ÓÊô
	input  wire [`WordDataBus] s5_rd_data, // ¶Á³öµÄÊý¾Ý
	input  wire				   s5_rdy_,	   // ¾ÍÐ÷
	// 6ºÅ×ÜÏß´ÓÊô
	input  wire [`WordDataBus] s6_rd_data, // ¶Á³öµÄÊý¾Ý
	input  wire				   s6_rdy_,	   // ¾ÍÐ÷
	// 7ºÅ×ÜÏß´ÓÊô
	input  wire [`WordDataBus] s7_rd_data, // ¶Á³öµÄÊý¾Ý
	input  wire				   s7_rdy_,	   // ¾ÍÐ÷
	/********** ×ÜÏßÖ÷¿Ø¹²ÏíÐÅºÅ **********/
	output reg	[`WordDataBus] m_rd_data,  // ¶Á³öµÄÊý¾Ý
	output reg				   m_rdy_	   // ¾ÍÐ÷
);
	/********** ×ÜÏß´ÓÊô¶àÂ·¸´ÓÃÆ÷ **********/
	always @(*) begin
		/* Ñ¡ÔñÆ¬Ñ¡ÐÅºÅ¶ÔÓ¦µÄ´ÓÊô */
		if (s0_cs_ == `ENABLE_) begin		   // ·ÃÎÊ0ºÅ×ÜÏß´ÓÊô
			m_rd_data = s0_rd_data;
			m_rdy_	  = s0_rdy_;
		end else if (s1_cs_ == `ENABLE_) begin // ·ÃÎÊ1ºÅ×ÜÏß´ÓÊô
			m_rd_data = s1_rd_data;
			m_rdy_	  = s1_rdy_;
		end else if (s2_cs_ == `ENABLE_) begin // ·ÃÎÊ2ºÅ×ÜÏß´ÓÊô
			m_rd_data = s2_rd_data;
			m_rdy_	  = s2_rdy_;
		end else if (s3_cs_ == `ENABLE_) begin // ·ÃÎÊ3ºÅ×ÜÏß´ÓÊô
			m_rd_data = s3_rd_data;
			m_rdy_	  = s3_rdy_;
		end else if (s4_cs_ == `ENABLE_) begin // ·ÃÎÊ4ºÅ×ÜÏß´ÓÊô
			m_rd_data = s4_rd_data;
			m_rdy_	  = s4_rdy_;
		end else if (s5_cs_ == `ENABLE_) begin // ·ÃÎÊ5ºÅ×ÜÏß´ÓÊô
			m_rd_data = s5_rd_data;
			m_rdy_	  = s5_rdy_;
		end else if (s6_cs_ == `ENABLE_) begin // ·ÃÎÊ6ºÅ×ÜÏß´ÓÊô
			m_rd_data = s6_rd_data;
			m_rdy_	  = s6_rdy_;
		end else if (s7_cs_ == `ENABLE_) begin // ·ÃÎÊ7ºÅ×ÜÏß´ÓÊô
			m_rd_data = s7_rd_data;
			m_rdy_	  = s7_rdy_;
		end else begin						   // Ä¬ÈÏÖµ
			m_rd_data = `WORD_DATA_W'h0;
			m_rdy_	  = `DISABLE_;
		end
	end
endmodule