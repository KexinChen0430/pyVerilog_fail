module sys_sm_comb(sys_sm_cur, channel_cur, channel_scan, byteaddr, channel_data, hexchar, attention_ch0,
attention_ch1, attention_ch2, attention_ch3, overrun_cur, overrun_ch0, overrun_ch1, overrun_ch2, overrun_ch3,
utxdone, clearoverrun_ch0, clearoverrun_ch1, clearoverrun_ch2, clearoverrun_ch3, txstart, nextbyte,
overrun_next, unload_ch0, unload_ch1, unload_ch2, unload_ch3, next_scan_channel, hexnybble,sys_sm_next, channel_next, txdata);
	input [2:0] sys_sm_cur;
	input [1:0] channel_cur;
	input [1:0] channel_scan;
	input [2:0] byteaddr;
	input [7:0] channel_data;
	input [7:0] hexchar;
	input attention_ch0;
	input attention_ch1;
	input attention_ch2;
	input attention_ch3;
	input overrun_cur;
	input overrun_ch0;
	input overrun_ch1;
	input overrun_ch2;
	input overrun_ch3;
	input utxdone;
	output reg clearoverrun_ch0;
	output reg clearoverrun_ch1;
	output reg clearoverrun_ch2;
	output reg clearoverrun_ch3;
	output reg txstart;
	output reg nextbyte;
	output reg overrun_next;
	output reg unload_ch0;
	output reg unload_ch1;
	output reg unload_ch2;
	output reg unload_ch3;
	output reg next_scan_channel;
	output reg [3:0] hexnybble;
	output reg [2:0] sys_sm_next;
	output reg [1:0] channel_next;
	output reg [7:0] txdata;
	always @ (*) begin
		// Defaults
		clearoverrun_ch0 <= 0;
		clearoverrun_ch1 <= 0;
		clearoverrun_ch2 <= 0;
		clearoverrun_ch3 <= 0;
		unload_ch0 <= 0;
		unload_ch1 <= 0;
		unload_ch2 <= 0;
		unload_ch3 <= 0;
		channel_next <= channel_cur;
		overrun_next <= overrun_cur;
		txstart <= 0;
		nextbyte <= 0;
		next_scan_channel <= 0;
		txdata <= 8'h3A;
		hexnybble <= 0;
		case(sys_sm_cur)
			`ATTN_CHECK:
				// Check channel attention bits
				if((channel_scan == 0) && (attention_ch0)) begin
					// Save overrun state for later
					overrun_next <= overrun_ch0;
					// Clear channel overrun
					clearoverrun_ch0 <= 1;
					// Next state
					sys_sm_next <= `SEND_HEADER;
					// Set the channel we are going to work with
					channel_next <= 0; // Channel 0
					// Send the header byte
					txstart <= 1;
					// Next scan channel
					next_scan_channel <= 1;
				end else if((channel_scan == 1) && (attention_ch1)) begin
					// Save overrun state for later
					overrun_next <= overrun_ch1;
					// Clear channel overrun
					clearoverrun_ch1 <= 1;
					// Next state
					sys_sm_next <= `SEND_HEADER;
					// Set the channel we are going to work with
					channel_next <= 1; // Channel 1
					// Send the header byte
					txstart <= 1;
					// Next scan channel
					next_scan_channel <= 1;
				end else if((channel_scan == 2) && (attention_ch2)) begin
					// Save overrun state for later
					overrun_next <= overrun_ch2;
					// Clear channel overrun
					clearoverrun_ch2 <= 1;
					// Next state
					sys_sm_next <= `SEND_HEADER;
					// Set the channel we are going to work with
					channel_next <= 2; // Channel 2
					// Send the header byte
					txstart <= 1;
					// Next scan channel
					next_scan_channel <= 1;
				end else if((channel_scan == 3) &&(attention_ch3)) begin
					// Save overrun state for later
					overrun_next <= overrun_ch3;
					// Clear channel overrun
					clearoverrun_ch3 <= 1;
					// Next state
					sys_sm_next <= `SEND_HEADER;
					// Set the channel we are going to work with
					channel_next <= 3; // Channel 3
					// Send the header byte
					txstart <= 1;
					// Next scan channel
					next_scan_channel <= 1;
				end else begin
					// Nothing to send
					// Next scan channel
					next_scan_channel <= 1;
					sys_sm_next <= `ATTN_CHECK;
				end
			`SEND_HEADER:
				if(~utxdone)
					// Still busy
					sys_sm_next <= `SEND_HEADER;
				else begin
					// Send the status byte
					//txdata <= {overrun_cur, 3'b000, channel_cur};
					// Convert high bits of status
					hexnybble <= {overrun_cur, 3'b000};
					txdata <= hexchar;
					txstart <= 1;
					sys_sm_next <= `SEND_STATUS_HIGH;
				end
			`SEND_STATUS_HIGH:
				if(~utxdone)
					// Still busy
					sys_sm_next <= `SEND_STATUS_HIGH;
				else begin
					// Send the low nybble of the status byte
					hexnybble <= channel_cur;
					txdata <= hexchar;
					txstart <= 1;
					sys_sm_next <= `SEND_STATUS_LOW;
				end
			`SEND_STATUS_LOW:
				if(~utxdone)
					// Still busy
					sys_sm_next <= `SEND_STATUS_LOW;
				else begin
					// Send the highest nybble in the long long word
					hexnybble <= channel_data[7:4];
					txdata <= hexchar;
					txstart <= 1;
					sys_sm_next <= `SEND_WORD_HIGH;
				end
			`SEND_WORD_HIGH:
				if(~utxdone)
					// Still busy
					sys_sm_next <= `SEND_WORD_HIGH;
				else begin
					// Low nybble
					hexnybble <= channel_data[3:0];
					txdata <= hexchar;
					nextbyte <= 1;
					txstart <= 1;
					sys_sm_next <= `SEND_WORD_LOW;
				end
			`SEND_WORD_LOW:
				if(~utxdone)
					// Still busy
					sys_sm_next <= `SEND_WORD_LOW;
				else begin
					if(byteaddr == 0) begin
						txdata <= 8'h0D; // CR
						txstart <= 1;
						if(channel_cur == 4'b0000)
							unload_ch0 <= 1;
						else if (channel_cur == 4'b0001)
							unload_ch1 <= 1;
						else if (channel_cur == 4'b0010)
							unload_ch2 <= 1;
						else if (channel_cur == 4'b0011)
							unload_ch3 <= 1;
						sys_sm_next <= `SEND_TRAILER;
					end else begin
						// Next high nybble
						hexnybble <= channel_data[7:4];
						txdata <= hexchar;
						txstart <= 1;
						sys_sm_next <= `SEND_WORD_HIGH;
					end
				end
			`SEND_TRAILER:
				if(~utxdone)
					// Still busy
					sys_sm_next  <= `SEND_TRAILER;
				else begin
					txdata <= 8'h0A;
					txstart <= 1;
					sys_sm_next <= `SEND_TRAILER2;
				end
			`SEND_TRAILER2:
				if(~utxdone)
					// Still busy
					sys_sm_next  <= `SEND_TRAILER2;
				else
					sys_sm_next <= `ATTN_CHECK;
			default:
				begin
					sys_sm_next <= 3'bxxx;
					channel_next <= 2'bxx;
					txdata <= 8'bxxxxxxxx;
					clearoverrun_ch0 <= 1'bx;
					clearoverrun_ch1 <= 1'bx;
					clearoverrun_ch2 <= 1'bx;
					clearoverrun_ch3 <= 1'bx;
					unload_ch0 <= 1'bx;
					unload_ch1 <= 1'bx;
					unload_ch2 <= 1'bx;
					unload_ch3 <= 1'bx;
					txstart <= 1'bx;
					nextbyte <= 1'bx;
					overrun_next <= 1'bx;
				end
		endcase
	end
endmodule