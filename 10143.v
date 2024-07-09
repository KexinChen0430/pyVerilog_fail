module dmac_dest_fifo_inf #(
  parameter ID_WIDTH = 3,
  parameter DATA_WIDTH = 64,
  parameter BEATS_PER_BURST_WIDTH = 4)(
  input clk,
  input resetn,
  input enable,
  output enabled,
  input req_valid,
  output req_ready,
  output [ID_WIDTH-1:0] response_id,
  output reg [ID_WIDTH-1:0] data_id = 'h0,
  input data_eot,
  input response_eot,
  input en,
  output reg [DATA_WIDTH-1:0] dout,
  output reg valid,
  output reg underflow,
  output xfer_req,
  output fifo_ready,
  input fifo_valid,
  input [DATA_WIDTH-1:0] fifo_data,
  input fifo_last,
  output response_valid,
  input response_ready,
  output response_resp_eot,
  output [1:0] response_resp
);
`include "inc_id.vh"
reg active = 1'b0;
/* Last beat of the burst */
wire fifo_last_beat;
/* Last beat of the segment */
wire fifo_eot_beat;
assign enabled = enable;
assign fifo_ready = en & (fifo_valid | ~enable);
/* fifo_last == 1'b1 implies fifo_valid == 1'b1 */
assign fifo_last_beat = fifo_ready & fifo_last;
assign fifo_eot_beat = fifo_last_beat & data_eot;
assign req_ready = fifo_eot_beat | ~active;
assign xfer_req = active;
always @(posedge clk) begin
  if (en) begin
    dout <= fifo_valid ? fifo_data : {DATA_WIDTH{1'b0}};
    valid <= fifo_valid & enable;
    underflow <= ~(fifo_valid & enable);
  end else begin
    valid <= 1'b0;
    underflow <= 1'b0;
  end
end
always @(posedge clk) begin
  if (resetn == 1'b0) begin
    data_id <= 'h00;
  end else if (fifo_last_beat == 1'b1) begin
    data_id <= inc_id(data_id);
  end
end
always @(posedge clk) begin
  if (resetn == 1'b0) begin
    active <= 1'b0;
  end else if (req_valid == 1'b1) begin
    active <= 1'b1;
  end else if (fifo_eot_beat == 1'b1) begin
    active <= 1'b0;
  end
end
dmac_response_generator # (
  .ID_WIDTH(ID_WIDTH)
) i_response_generator (
  .clk(clk),
  .resetn(resetn),
  .enable(enable),
  .enabled(),
  .request_id(data_id),
  .response_id(response_id),
  .eot(response_eot),
  .resp_valid(response_valid),
  .resp_ready(response_ready),
  .resp_eot(response_resp_eot),
  .resp_resp(response_resp)
);
endmodule