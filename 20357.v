module dmac_response_generator #(
  parameter ID_WIDTH = 3)(
  input clk,
  input resetn,
  input enable,
  output reg enabled,
  input [ID_WIDTH-1:0] request_id,
  output reg [ID_WIDTH-1:0] response_id,
  input eot,
  output resp_valid,
  input resp_ready,
  output resp_eot,
  output [1:0] resp_resp
);
`include "inc_id.vh"
`include "resp.vh"
assign resp_resp = RESP_OKAY;
assign resp_eot = eot;
assign resp_valid = request_id != response_id && enabled;
// We have to wait for all responses before we can disable the response handler
always @(posedge clk) begin
  if (resetn == 1'b0) begin
    enabled <= 1'b0;
  end else if (enable == 1'b1) begin
    enabled <= 1'b1;
  end else if (request_id == response_id) begin
    enabled <= 1'b0;
  end
end
always @(posedge clk) begin
  if (resetn == 1'b0) begin
    response_id <= 'h0;
  end else if (resp_valid == 1'b1 && resp_ready == 1'b1) begin
    response_id <= inc_id(response_id);
  end
end
endmodule