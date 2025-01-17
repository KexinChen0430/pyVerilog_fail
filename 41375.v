module FB_BfbSetterResetter
(
		input wire clk,
		//input events
		input wire test_eI,
		input wire set_eI,
		input wire unsafe_eI,
		//output events
		output wire b_change_eO,
		//output variables
		output reg  b_O ,
		input reset
);
//input events
wire test;
assign test = test_eI;
wire set;
assign set = set_eI;
wire unsafe;
assign unsafe = unsafe_eI;
//output events
reg b_change;
assign b_change_eO = b_change;
//output variables
reg  b ;
//BEGIN STATE variables
reg [1:0] state = `STATE_s_init;
reg entered = 1'b0;
//END STATE variables
//BEGIN algorithm triggers
reg s_reset_alg0_alg_en = 1'b0;
reg s_set_alg0_alg_en = 1'b0;
//END algorithm triggers
always@(posedge clk) begin
	if(reset) begin
		//reset state
		state = `STATE_s_init;
		//reset I/O registers
		b_change = 1'b0;
		b = 0;
		//reset internal vars
	end else begin
		//BEGIN clear output events
		b_change = 1'b0;
		//END clear output events
		//BEGIN update internal inputs on relevant events
		//END update internal inputs
		//BEGIN ecc
		entered = 1'b0;
		case(state)
			default: begin
				if(1) begin
					state = `STATE_s_reset;
					entered = 1'b1;
				end
			end
			`STATE_s_reset: begin
				if(set) begin
					state = `STATE_s_set;
					entered = 1'b1;
				end
			end
			`STATE_s_set: begin
				if(test || unsafe) begin
					state = `STATE_s_reset;
					entered = 1'b1;
				end
			end
		endcase
		//END ecc
		//BEGIN triggers
		s_reset_alg0_alg_en = 1'b0;
		s_set_alg0_alg_en = 1'b0;
		if(entered) begin
			case(state)
				default: begin
				end
				`STATE_s_reset: begin
					b_change = 1'b1;
					s_reset_alg0_alg_en = 1'b1;
				end
				`STATE_s_set: begin
					b_change = 1'b1;
					s_set_alg0_alg_en = 1'b1;
				end
			endcase
		end
		//END triggers
		//BEGIN algorithms
		if(s_reset_alg0_alg_en) begin
			b = 0;
		end
		if(s_set_alg0_alg_en) begin
			b = 1;
		end
		//END algorithms
		//BEGIN update external output variables on relevant events
		if(b_change) begin
			b_O = b;
		end
		//END update external output variables
	end
end
endmodule