module button_trigger(
	input [1:0] buttons,
	input ready,
	output send,
	output [15:0] stat,
	output led
	);
	reg r_led;
	reg r_send;
	reg [15:0] r_stat;
	initial begin
		r_led = 1;
		r_send = 0;
		r_stat = 0;
	end
	// on any button state change (press/release)
	always @ (posedge buttons[0:0] or negedge buttons[0:0] or posedge buttons[1:1] or negedge buttons[1:1]) begin
		// button 0 pressen - load ON message, start sending
		if(buttons[0:0] == 0) begin
			r_stat[15:0] = 16'b10001000_10001110;
			r_send = 1;
			r_led = 0;
		end
		// button 1 pressen - load OFF message, start sending
		else if(buttons[1:1] == 0) begin
			r_stat[15:0] = 16'b10001110_10001000;
			r_send = 1;
			r_led = 0;
		end
		// buttons released - stop sending
		else begin
			r_stat[15:0] = 0;
			r_send = 0;
			r_led = 1;
		end
	end
	assign send = r_send;
	assign stat = r_stat;
	assign led = r_led;
endmodule