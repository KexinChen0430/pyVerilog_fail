module is reset *after*
//it's clock has begun
always @(negedge i2c_clk_in) begin
	if (reset == 1) begin
		i2c_reset <= 1;
	end else begin
		i2c_reset <= 0;
	end
end //posedge clk_i2c_in
endmodule