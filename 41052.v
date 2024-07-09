module bus_addr_dec (
	/********** AhX **********/
	input  wire [`WordAddrBus] s_addr, // AhX
	/********** `bvZNg **********/
	output reg				   s0_cs_, // oXX[u0Ô
	output reg				   s1_cs_, // oXX[u1Ô
	output reg				   s2_cs_, // oXX[u2Ô
	output reg				   s3_cs_, // oXX[u3Ô
	output reg				   s4_cs_, // oXX[u4Ô
	output reg				   s5_cs_, // oXX[u5Ô
	output reg				   s6_cs_, // oXX[u6Ô
	output reg				   s7_cs_  // oXX[u7Ô
);
	/********** oXX[uCfbNX **********/
	wire [`BusSlaveIndexBus] s_index = s_addr[`BusSlaveIndexLoc];
	/********** oXX[u}`vNT **********/
	always @(*) begin
		/* `bvZNgÌú» */
		s0_cs_ = `DISABLE_;
		s1_cs_ = `DISABLE_;
		s2_cs_ = `DISABLE_;
		s3_cs_ = `DISABLE_;
		s4_cs_ = `DISABLE_;
		s5_cs_ = `DISABLE_;
		s6_cs_ = `DISABLE_;
		s7_cs_ = `DISABLE_;
		/* AhXÉÎ·éX[uÌIð */
		case (s_index)
			`BUS_SLAVE_0 : begin // oXX[u0Ô
				s0_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_1 : begin // oXX[u1Ô
				s1_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_2 : begin // oXX[u2Ô
				s2_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_3 : begin // oXX[u3Ô
				s3_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_4 : begin // oXX[u4Ô
				s4_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_5 : begin // oXX[u5Ô
				s5_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_6 : begin // oXX[u6Ô
				s6_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_7 : begin // oXX[u7Ô
				s7_cs_	= `ENABLE_;
			end
		endcase
	end
endmodule