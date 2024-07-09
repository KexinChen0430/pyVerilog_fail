module counter)
reg [N-1:0] divcounter = 0;
always @(posedge clk or negedge rstn)
	if (!rstn)
		divcounter <= 0;
	else if (clk_ena)
		//-- Normal working: counting. When the maximum count is reached, it starts from 0
		divcounter <= (divcounter == BAUDRATE - 1) ? 0 : divcounter + 1;
	else
		//-- Counter fixed to its maximum value
		//-- When it is resumed it start from 0
		divcounter <= BAUDRATE - 1;
assign clk_out = (divcounter == M2) ? clk_ena : 0;
endmodule