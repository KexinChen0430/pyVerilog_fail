module bus_slave_mux (
	/********** `bvZNg **********/
	input  wire				   s0_cs_,	   // oXX[u0Ô
	input  wire				   s1_cs_,	   // oXX[u1Ô
	input  wire				   s2_cs_,	   // oXX[u2Ô
	input  wire				   s3_cs_,	   // oXX[u3Ô
	input  wire				   s4_cs_,	   // oXX[u4Ô
	input  wire				   s5_cs_,	   // oXX[u5Ô
	input  wire				   s6_cs_,	   // oXX[u6Ô
	input  wire				   s7_cs_,	   // oXX[u7Ô
	/********** oXX[uM **********/
	// oXX[u0Ô
	input  wire [`WordDataBus] s0_rd_data, // ÇÝoµf[^
	input  wire				   s0_rdy_,	   // fB
	// oXX[u1Ô
	input  wire [`WordDataBus] s1_rd_data, // ÇÝoµf[^
	input  wire				   s1_rdy_,	   // fB
	// oXX[u2Ô
	input  wire [`WordDataBus] s2_rd_data, // ÇÝoµf[^
	input  wire				   s2_rdy_,	   // fB
	// oXX[u3Ô
	input  wire [`WordDataBus] s3_rd_data, // ÇÝoµf[^
	input  wire				   s3_rdy_,	   // fB
	// oXX[u4Ô
	input  wire [`WordDataBus] s4_rd_data, // ÇÝoµf[^
	input  wire				   s4_rdy_,	   // fB
	// oXX[u5Ô
	input  wire [`WordDataBus] s5_rd_data, // ÇÝoµf[^
	input  wire				   s5_rdy_,	   // fB
	// oXX[u6Ô
	input  wire [`WordDataBus] s6_rd_data, // ÇÝoµf[^
	input  wire				   s6_rdy_,	   // fB
	// oXX[u7Ô
	input  wire [`WordDataBus] s7_rd_data, // ÇÝoµf[^
	input  wire				   s7_rdy_,	   // fB
	/********** oX}X^¤ÊM **********/
	output reg	[`WordDataBus] m_rd_data,  // ÇÝoµf[^
	output reg				   m_rdy_	   // fB
);
	/********** oXX[u}`vNT **********/
	always @(*) begin
		/* `bvZNgÉÎ·éX[uÌIð */
		if (s0_cs_ == `ENABLE_) begin		   // oXX[u0Ô
			m_rd_data = s0_rd_data;
			m_rdy_	  = s0_rdy_;
		end else if (s1_cs_ == `ENABLE_) begin // oXX[u1Ô
			m_rd_data = s1_rd_data;
			m_rdy_	  = s1_rdy_;
		end else if (s2_cs_ == `ENABLE_) begin // oXX[u2Ô
			m_rd_data = s2_rd_data;
			m_rdy_	  = s2_rdy_;
		end else if (s3_cs_ == `ENABLE_) begin // oXX[u3Ô
			m_rd_data = s3_rd_data;
			m_rdy_	  = s3_rdy_;
		end else if (s4_cs_ == `ENABLE_) begin // oXX[u4Ô
			m_rd_data = s4_rd_data;
			m_rdy_	  = s4_rdy_;
		end else if (s5_cs_ == `ENABLE_) begin // oXX[u5Ô
			m_rd_data = s5_rd_data;
			m_rdy_	  = s5_rdy_;
		end else if (s6_cs_ == `ENABLE_) begin // oXX[u6Ô
			m_rd_data = s6_rd_data;
			m_rdy_	  = s6_rdy_;
		end else if (s7_cs_ == `ENABLE_) begin // oXX[u7Ô
			m_rd_data = s7_rd_data;
			m_rdy_	  = s7_rdy_;
		end else begin						   // ftHgl
			m_rd_data = `WORD_DATA_W'h0;
			m_rdy_	  = `DISABLE_;
		end
	end
endmodule