module dmac_response_generator (
	input clk,
	input resetn,
	input enable,
	output reg enabled,
	input [C_ID_WIDTH-1:0] request_id,
	output reg [C_ID_WIDTH-1:0] response_id,
	input sync_id,
	input eot,
	output resp_valid,
	input resp_ready,
	output resp_eot,
	output [1:0] resp_resp
);
parameter C_ID_WIDTH = 3;
`include "inc_id.h"
`include "resp.h"
assign resp_resp = RESP_OKAY;
assign resp_eot = eot;
assign resp_valid = request_id != response_id && enabled;
// We have to wait for all responses before we can disable the response handler
always @(posedge clk) begin
	if (resetn == 1'b0) begin
		enabled <= 1'b0;
	end else begin
		if (enable)
			enabled <= 1'b1;
		else if (request_id == response_id)
			enabled <= 1'b0;
	end
end
always @(posedge clk) begin
	if (resetn == 1'b0) begin
		response_id <= 'h0;
	end else begin
		if ((resp_valid && resp_ready) ||
			(sync_id && response_id != request_id))
			response_id <= inc_id(response_id);
	end
end
endmodule