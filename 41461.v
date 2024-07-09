module bus_addr_dec (
	/********** µØÖ· **********/
	input  wire [`WordAddrBus] s_addr, // ×ÜÏß×Ü¿ØÌá¹©µÄµØÖ·ÐÅºÅ
	/********** Êä³öÆ¬Ñ¡ÐÅºÅ **********/
	output reg				   s0_cs_, // 0ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡ÐÅºÅ
	output reg				   s1_cs_, // 1ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡ÐÅºÅ
	output reg				   s2_cs_, // 2ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡ÐÅºÅ
	output reg				   s3_cs_, // 3ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡ÐÅºÅ
	output reg				   s4_cs_, // 4ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡ÐÅºÅ
	output reg				   s5_cs_, // 5ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡ÐÅºÅ
	output reg				   s6_cs_, // 6ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡ÐÅºÅ
	output reg				   s7_cs_  // 7ºÅ×ÜÏß´ÓÊôÆ¬Ñ¡ÐÅºÅ
);
	/********** ×ÜÏß´ÓÊôË÷Òý **********/
	wire [`BusSlaveIndexBus] s_index = s_addr[`BusSlaveIndexLoc]; // È¡µØÖ·ÖÐ¸ß3Î»±íÊ¾µÄ´ÓÊôºÅ
	/********** ×ÜÏß´ÓÊô¶àÂ·¸´ÓÃÆ÷**********/
	always @(*) begin
		/* ³õÊ¼»¯Æ¬Ñ¡ÐÅºÅ */
		s0_cs_ = `DISABLE_;
		s1_cs_ = `DISABLE_;
		s2_cs_ = `DISABLE_;
		s3_cs_ = `DISABLE_;
		s4_cs_ = `DISABLE_;
		s5_cs_ = `DISABLE_;
		s6_cs_ = `DISABLE_;
		s7_cs_ = `DISABLE_;
		/* Ñ¡ÔñµØÖ·¶ÔÓ¦µÄ´ÓÊô */
		case (s_index)
			`BUS_SLAVE_0 : begin // 0ºÅ×ÜÏß´ÓÊô
				s0_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_1 : begin // 1ºÅ×ÜÏß´ÓÊô
				s1_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_2 : begin // 2ºÅ×ÜÏß´ÓÊô
				s2_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_3 : begin // 0ºÅ×ÜÏß´ÓÊô
				s3_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_4 : begin // 4ºÅ×ÜÏß´ÓÊô
				s4_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_5 : begin // 5ºÅ×ÜÏß´ÓÊô
				s5_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_6 : begin // 6ºÅ×ÜÏß´ÓÊô
				s6_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_7 : begin // 7ºÅ×ÜÏß´ÓÊô
				s7_cs_	= `ENABLE_;
			end
		endcase
	end
endmodule