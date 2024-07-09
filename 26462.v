module dmac_response_handler (
	input clk,
	input resetn,
	input bvalid,
	output bready,
	input [1:0] bresp,
	output reg [C_ID_WIDTH-1:0] id,
	input [C_ID_WIDTH-1:0] wait_id,
	input sync_id,
	input enable,
	output reg enabled,
	input eot,
	output resp_valid,
	input resp_ready,
	output resp_eot,
	output [1:0] resp_resp
);
parameter C_ID_WIDTH = 3;
`include "resp.v"
`include "inc_id.v"
assign resp_resp = bresp;
assign resp_eot = eot;
wire active = id != wait_id && enabled;
assign bready = active && resp_ready;
assign resp_valid = active && bvalid;
// We have to wait for all responses before we can disable the response handler
always @(posedge clk) begin
	if (resetn == 1'b0) begin
		enabled <= 1'b0;
	end else begin
	if (enable)
	    enabled <= 1'b1;
	else if (wait_id == id)
	    enabled <= 1'b0;
	end
end
always @(posedge clk) begin
	if (resetn == 1'b0) begin
		id <= 'h0;
	end else begin
		if ((bready && bvalid) ||
		    (sync_id && id != wait_id))
			id <= inc_id(id);
	end
end
endmodule