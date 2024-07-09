module bus_arbiter (
	/********** NbN & Zbg **********/
	input  wire		   clk,		 // NbN
	input  wire		   reset,	 // ñ¯úZbg
	/********** A[rg[VM **********/
	// oX}X^0Ô
	input  wire		   m0_req_,	 // oXNGXg
	output reg		   m0_grnt_, // oXOg
	// oX}X^1Ô
	input  wire		   m1_req_,	 // oXNGXg
	output reg		   m1_grnt_, // oXOg
	// oX}X^2Ô
	input  wire		   m2_req_,	 // oXNGXg
	output reg		   m2_grnt_, // oXOg
	// oX}X^3Ô
	input  wire		   m3_req_,	 // oXNGXg
	output reg		   m3_grnt_	 // oXOg
);
	/********** àM **********/
	reg [`BusOwnerBus] owner;	 // oX ÌLÒ
	/********** oXOgÌ¶¬ **********/
	always @(*) begin
		/* oXOgÌú» */
		m0_grnt_ = `DISABLE_;
		m1_grnt_ = `DISABLE_;
		m2_grnt_ = `DISABLE_;
		m3_grnt_ = `DISABLE_;
		/* oXOgÌ¶¬ */
		case (owner)
			`BUS_OWNER_MASTER_0 : begin // oX}X^0Ô
				m0_grnt_ = `ENABLE_;
			end
			`BUS_OWNER_MASTER_1 : begin // oX}X^1Ô
				m1_grnt_ = `ENABLE_;
			end
			`BUS_OWNER_MASTER_2 : begin // oX}X^2Ô
				m2_grnt_ = `ENABLE_;
			end
			`BUS_OWNER_MASTER_3 : begin // oX}X^3Ô
				m3_grnt_ = `ENABLE_;
			end
		endcase
	end
	/********** oX ÌA[rg[V **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ñ¯úZbg */
			owner <= #1 `BUS_OWNER_MASTER_0;
		end else begin
			/* A[rg[V */
			case (owner)
				`BUS_OWNER_MASTER_0 : begin // oX LÒFoX}X^0Ô
					/* ÉoX ðl¾·é}X^ */
					if (m0_req_ == `ENABLE_) begin			// oX}X^0Ô
						owner <= #1 `BUS_OWNER_MASTER_0;
					end else if (m1_req_ == `ENABLE_) begin // oX}X^1Ô
						owner <= #1 `BUS_OWNER_MASTER_1;
					end else if (m2_req_ == `ENABLE_) begin // oX}X^2Ô
						owner <= #1 `BUS_OWNER_MASTER_2;
					end else if (m3_req_ == `ENABLE_) begin // oX}X^3Ô
						owner <= #1 `BUS_OWNER_MASTER_3;
					end
				end
				`BUS_OWNER_MASTER_1 : begin // oX LÒFoX}X^1Ô
					/* ÉoX ðl¾·é}X^ */
					if (m1_req_ == `ENABLE_) begin			// oX}X^1Ô
						owner <= #1 `BUS_OWNER_MASTER_1;
					end else if (m2_req_ == `ENABLE_) begin // oX}X^2Ô
						owner <= #1 `BUS_OWNER_MASTER_2;
					end else if (m3_req_ == `ENABLE_) begin // oX}X^3Ô
						owner <= #1 `BUS_OWNER_MASTER_3;
					end else if (m0_req_ == `ENABLE_) begin // oX}X^0Ô
						owner <= #1 `BUS_OWNER_MASTER_0;
					end
				end
				`BUS_OWNER_MASTER_2 : begin // oX LÒFoX}X^2Ô
					/* ÉoX ðl¾·é}X^ */
					if (m2_req_ == `ENABLE_) begin			// oX}X^2Ô
						owner <= #1 `BUS_OWNER_MASTER_2;
					end else if (m3_req_ == `ENABLE_) begin // oX}X^3Ô
						owner <= #1 `BUS_OWNER_MASTER_3;
					end else if (m0_req_ == `ENABLE_) begin // oX}X^0Ô
						owner <= #1 `BUS_OWNER_MASTER_0;
					end else if (m1_req_ == `ENABLE_) begin // oX}X^1Ô
						owner <= #1 `BUS_OWNER_MASTER_1;
					end
				end
				`BUS_OWNER_MASTER_3 : begin // oX LÒFoX}X^3Ô
					/* ÉoX ðl¾·é}X^ */
					if (m3_req_ == `ENABLE_) begin			// oX}X^3Ô
						owner <= #1 `BUS_OWNER_MASTER_3;
					end else if (m0_req_ == `ENABLE_) begin // oX}X^0Ô
						owner <= #1 `BUS_OWNER_MASTER_0;
					end else if (m1_req_ == `ENABLE_) begin // oX}X^1Ô
						owner <= #1 `BUS_OWNER_MASTER_1;
					end else if (m2_req_ == `ENABLE_) begin // oX}X^2Ô
						owner <= #1 `BUS_OWNER_MASTER_2;
					end
				end
			endcase
		end
	end
endmodule