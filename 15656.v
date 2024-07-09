module memory(
	input wire mclk,
	input wire epp_astb,
	input wire epp_dstb,
	input wire epp_wr,
	output wire epp_wait,
	inout wire[7:0] epp_data,
	output reg core_stall = 0,
	input wire read,
	input wire write,
	input wire[31:0] address,
	input wire[31:0] din,
	output reg[31:0] dout = 0
);
parameter state_idle = 2'b00;
parameter state_read = 2'b01;
parameter state_write = 2'b10;
reg[1:0] state = state_idle;
reg[7:6] status = 0; // -> EPP
wire complete; // <- EPP
reg complete_clr = 0; // -> EPP
wire[31:0] dout_val; // <- EPP
memory_epp memory_epp_inst (
	.mclk(mclk),
	.epp_astb(epp_astb),
	.epp_dstb(epp_dstb),
	.epp_wr(epp_wr),
	.epp_wait(epp_wait),
	.epp_data(epp_data),
	.status(status),
	.address(address),
	.dout(dout_val),
	.din(din),
	.complete(complete),
	.complete_clr(complete_clr)
);
// Process
always @ (posedge mclk) begin
	case(state)
		state_read:
			if(complete == 1) begin
				dout <= dout_val;
				core_stall <= 0;
				complete_clr <= 1;
				status <= 0;
				state <= state_idle;
			end
		state_write:
			if(complete == 1) begin
				core_stall <= 0;
				complete_clr <= 1;
				status <= 0;
				state <= state_idle;
			end
		default: begin
			if(read == 1) begin
				core_stall <= 1;
				state <= state_read;
				status <= 2'b10; // Status Flag = Read
			end else if(write == 1) begin
				core_stall <= 1;
				state <= state_write;
				status <= 2'b01; // Status Flag = Write
			end
			complete_clr <= 0;
		end
	endcase
end
endmodule