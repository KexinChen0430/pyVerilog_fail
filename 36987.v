module dmac_address_generator (
	input                        clk,
	input                        resetn,
	input                        req_valid,
	output reg                   req_ready,
	input [31:C_ADDR_ALIGN_BITS] req_address,
	input [3:0]                  req_last_burst_length,
	output reg [C_ID_WIDTH-1:0]  id,
	input [C_ID_WIDTH-1:0]       wait_id,
	input                        sync_id,
	input                        eot,
	input                        enable,
	input                        pause,
	output reg                   enabled,
	input                        addr_ready,
	output reg                   addr_valid,
	output     [31:0]            addr,
	output     [ 7:0]            len,
	output     [ 2:0]            size,
	output     [ 1:0]            burst,
	output     [ 2:0]            prot,
	output     [ 3:0]            cache
);
parameter C_ID_WIDTH = 3;
parameter C_ADDR_ALIGN_BITS = 3;
parameter C_BURST_ALIGN_BITS = 7;
parameter C_DMA_LENGTH_WIDTH = 24;
localparam MAX_BURST_SIZE_BEATS = 2**(C_BURST_ALIGN_BITS-C_ADDR_ALIGN_BITS);
`include "inc_id.v"
assign burst = 2'b01;
assign prot = 3'b000;
assign cache = 4'b0011;
assign len = eot ? req_last_burst_length : MAX_BURST_SIZE_BEATS - 1;
assign size = 3'b011;
reg [31-C_ADDR_ALIGN_BITS:0] address = 'h00;
reg [C_BURST_ALIGN_BITS-C_ADDR_ALIGN_BITS-1:0] last_burst_len = 'h00;
assign addr = {address, {C_ADDR_ALIGN_BITS{1'b0}}};
// If we already asserted addr_valid we have to wait until it is accepted before
// we can disable the address generator.
always @(posedge clk) begin
	if (resetn == 1'b0) begin
		enabled <= 1'b0;
	end else begin
		if (enable)
			enabled <= 1'b1;
		else if (~addr_valid)
			enabled <= 1'b0;
	end
end
always @(posedge clk) begin
	if (resetn == 1'b0) begin
		address <= 'h00;
		last_burst_len <= 'h00;
		req_ready <= 1'b1;
		addr_valid <= 1'b0;
	end else begin
		if (~enabled) begin
			req_ready <= 1'b1;
		end else if (req_ready) begin
			if (req_valid && enable) begin
				address <= req_address;
				req_ready <= 1'b0;
			end
		end else begin
			if (addr_valid && addr_ready) begin
				address <= address + MAX_BURST_SIZE_BEATS;
				addr_valid <= 1'b0;
				if (eot)
					req_ready <= 1'b1;
			end else if (id != wait_id) begin
				addr_valid <= 1'b1;
			end
		end
	end
end
always @(posedge clk) begin
	if (resetn == 1'b0) begin
		id <='h0;
	end else begin
		if ((addr_valid && addr_ready) ||
			(sync_id && id != wait_id))
			id <= inc_id(id);
	end
end
endmodule