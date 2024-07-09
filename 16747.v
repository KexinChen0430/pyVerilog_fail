module */
	assign sha_init = (pValidPrev[0] && !pValidPrev[1]);
	assign sha_next = 'b0;
	assign sha_mode = 'b1;
	/* Only 32 bytes are used. The rest is set to standard SHA padding */
	assign sha_block = {p_mosi, 1'b1, 255'h100};
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			pValidPrev <= 'b11;
		end
		else begin
			/* pValidPrev[0] holds last p_valid value */
			pValidPrev[0] <= p_valid;
			/* pValidPrev[1] holds second last p_valid value */
			pValidPrev[1] <= pValidPrev[0];
		end
	end
endmodule