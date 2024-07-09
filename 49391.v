module RS232TX (
	input clk,
	input Tx_start,
	input [23:0] dbuffer,
	output Tx,
	output Tx_busy
);
wire bittick;
wire[7:0] Tx_data = dbuffer[7:0];
RS232Baud baud(
	.clk(clk),
	.enable(Tx_busy),
	.tick(bittick)
);
reg[3:0] Tx_state = 0;
wire Tx_ready = (Tx_state==0);
assign Tx_busy = ~Tx_ready;
reg[7:0] Tx_shift = 0;
always @(posedge clk)
begin
	if (Tx_ready & Tx_start)
		Tx_shift <= Tx_data;
	else
		if (Tx_state[3] & bittick)
			Tx_shift <= (Tx_shift >> 1);
	case(Tx_state)
		4'b0000: if(Tx_start) Tx_state <= 4'b0100;  // waiting?
		4'b0100: if (bittick) Tx_state <= 4'b1000;  //start bit
		4'b1000: if (bittick) Tx_state <= 4'b1001;  // bit 0
		4'b1001: if (bittick) Tx_state <= 4'b1010;  // bit 1
 		4'b1010: if (bittick) Tx_state <= 4'b1011;  // bit 2
		4'b1011: if (bittick) Tx_state <= 4'b1100;  // bit 3
		4'b1100: if (bittick) Tx_state <= 4'b1101;  // bit 4
		4'b1101: if (bittick) Tx_state <= 4'b1110;  // bit 5
		4'b1110: if (bittick) Tx_state <= 4'b1111;  // bit 6
		4'b1111: if (bittick) Tx_state <= 4'b0010;  // bit 7
		4'b0010: if (bittick) Tx_state <= 4'b0011;  // stop1
		4'b0011: if (bittick) Tx_state <= 4'b0000;  // stop2
		default: if (bittick) Tx_state <= 4'b0000;
	endcase
end
assign Tx = (Tx_state < 4) | (Tx_state[3] & Tx_shift[0]);
endmodule