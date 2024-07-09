module i2s_out(input clock, input reset, input[15:0] left_data,
 input[15:0] right_data, output mclk, output lrck, output sclk, output reg sdin);
	reg [3:0] data_pos;
	initial
		begin
			data_pos <= 4'b0;
		end
	/** mclk es igual al clock . 50Mhz */
	assign mclk = clock;
	/** mclk/lrck = 64 entonces lrck se hace de 781250Hz */
	lrck_divider lrck_gen(
			  .clock(clock),
			  .reset(reset),
			  .clock_out(lrck)
			  );
	/** sclk/lrck = 32 y mclk/sclk = 2. Entonces sclk = 25Mhz*/
	sclk_divider sclk_gen(
			  .clock(clock),
			  .reset(reset),
			  .clock_out(sclk)
			  );
	/**
	always @ (negedge sclk)
		begin
			if(lrck)
				begin
					if(data_pos == 4'b0)
						begin
							sdin <= left_data[data_pos];
							end
					else
						begin
							sdin <= right_data[data_pos];
						end
				end
			else
				begin
					if(data_pos == 4'b0)
						begin
							sdin <= right_data[data_pos];
						end
					else
						begin
							sdin <= left_data[data_pos];
						end
				end
			/** Siempre hay que cambiar la posicion */
			data_pos <= data_pos - 1;
		end
endmodule