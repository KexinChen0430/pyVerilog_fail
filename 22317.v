module
	 clock_div clock_div_25 (
		 .CLKIN_IN(clk),
		 .CLKDV_OUT(clk_25),
		 .CLKIN_IBUFG_OUT(),
		 .CLK0_OUT()
    );
	 counter#(.CNT_MAX(800), .DATA_WIDTH(10))
	 H_counter
	 (
		.clk (clk_25),
		.en_in (VGA_en),
		.cnt (H_cnt),
		.en_out (V_cnt_en)
	 );
	 counter#(.CNT_MAX(521), .DATA_WIDTH(10))
	 V_counter
	 (
		.clk (clk_25),
		.en_in (V_cnt_en),
		.cnt (V_cnt),
		.en_out ()
	 );
	// sync part for H and V sync signals
	always @(posedge clk_25) begin
		H_sync_reg	<= H_sync_next;
		V_sync_reg	<= V_sync_next;
		H_DEN_reg	<= H_DEN_next;
		V_DEN_reg	<= V_DEN_next;
	end
	// Combinatoric part H sync pulse
	always @* begin
		if (H_cnt < 95) begin
			H_sync_next <= 0;
			H_DEN_next	<= 0;
		end else if ((H_cnt > 142) & (H_cnt < 783)) begin // random values
			H_sync_next <= 1;
			H_DEN_next	<= 1;
		end else if (H_cnt == 799) begin
			H_sync_next <= 0;
			H_DEN_next	<= 0;
		end else begin
			H_sync_next <= 1;
			H_DEN_next	<= 0;
		end
	end
	// Combinatoric part V sync pulse
	always @* begin
		if (V_cnt < 2) begin
			V_sync_next <= 0;
			V_DEN_next	<= 0;
		end else if ((V_cnt > 30) & (V_cnt < 510)) begin // random values
			V_sync_next <= 1;
			V_DEN_next	<= 1;
		end else begin
			V_sync_next <= 1;
			V_DEN_next	<= 0;
		end
	end
	always @* begin
		if ((V_DEN_reg) & (H_DEN_reg)) begin
			H_disp <= H_cnt - 144;
			V_disp <= V_cnt - 31;
		end else begin
			H_disp <= 0;
			V_disp <= 0;
		end
	end
	// Output logic
	assign rgb = ((V_DEN_reg) & (H_DEN_reg)) ? d_in : 0;
	assign D_En = ((V_DEN_reg) & (H_DEN_reg));
	assign Hs = H_sync_reg;
	assign Vs = V_sync_reg;
	assign H_count = H_disp;
	assign V_count = V_disp;
endmodule