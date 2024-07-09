module axi_dmac_burst_memory #(
  parameter DATA_WIDTH_SRC = 64,
  parameter DATA_WIDTH_DEST = 64,
  parameter ID_WIDTH = 3,
  parameter MAX_BYTES_PER_BURST = 128,
  parameter ASYNC_CLK = 1,
  parameter BYTES_PER_BEAT_WIDTH_SRC = $clog2(DATA_WIDTH_SRC/8),
  parameter BYTES_PER_BURST_WIDTH = $clog2(MAX_BYTES_PER_BURST),
  parameter ENABLE_DIAGNOSTICS_IF = 0
) (
  input src_clk,
  input src_reset,
  input src_data_valid,
  input [DATA_WIDTH_SRC-1:0] src_data,
  input src_data_last,
  input [BYTES_PER_BEAT_WIDTH_SRC-1:0] src_data_valid_bytes,
  input src_data_partial_burst,
  output [ID_WIDTH-1:0] src_data_request_id,
  input dest_clk,
  input dest_reset,
  output dest_data_valid,
  input dest_data_ready,
  output [DATA_WIDTH_DEST-1:0] dest_data,
  output dest_data_last,
  output [BYTES_PER_BURST_WIDTH-1:0] dest_burst_info_length,
  output dest_burst_info_partial,
  output [ID_WIDTH-1:0] dest_burst_info_id,
  output reg dest_burst_info_write = 1'b0,
  output [ID_WIDTH-1:0] dest_request_id,
  input [ID_WIDTH-1:0] dest_data_request_id,
  output [ID_WIDTH-1:0] dest_data_response_id,
  // Diagnostics interface
  output  [7:0] dest_diag_level_bursts
);
localparam DATA_WIDTH = DATA_WIDTH_SRC > DATA_WIDTH_DEST ?
  DATA_WIDTH_SRC : DATA_WIDTH_DEST;
/* A burst can have up to 256 beats */
localparam BURST_LEN = MAX_BYTES_PER_BURST / (DATA_WIDTH / 8);
localparam BURST_LEN_WIDTH = BURST_LEN > 128 ? 8 :
  BURST_LEN > 64 ? 7 :
  BURST_LEN > 32 ? 6 :
  BURST_LEN > 16 ? 5 :
  BURST_LEN > 8 ? 4 :
  BURST_LEN > 4 ? 3 :
  BURST_LEN > 2 ? 2 : 1;
localparam ADDRESS_WIDTH = BURST_LEN_WIDTH + ID_WIDTH - 1;
localparam AUX_FIFO_SIZE = 2**(ID_WIDTH-1);
localparam DEST_SRC_RATIO = DATA_WIDTH_DEST/DATA_WIDTH_SRC;
localparam DEST_SRC_RATIO_WIDTH = DEST_SRC_RATIO > 64 ? 7 :
  DEST_SRC_RATIO > 32 ? 6 :
  DEST_SRC_RATIO > 16 ? 5 :
  DEST_SRC_RATIO > 8 ? 4 :
  DEST_SRC_RATIO > 4 ? 3 :
  DEST_SRC_RATIO > 2 ? 2 :
  DEST_SRC_RATIO > 1 ? 1 : 0;
/*
 */
reg [ID_WIDTH-1:0] src_id_next;
reg [ID_WIDTH-1:0] src_id = 'h0;
reg src_id_reduced_msb = 1'b0;
reg [BURST_LEN_WIDTH-1:0] src_beat_counter = 'h00;
reg [ID_WIDTH-1:0] dest_id_next = 'h0;
reg dest_id_reduced_msb_next = 1'b0;
reg dest_id_reduced_msb = 1'b0;
reg [ID_WIDTH-1:0] dest_id = 'h0;
reg [BURST_LEN_WIDTH-1:0] dest_beat_counter = 'h00;
wire [BURST_LEN_WIDTH-1:0] dest_burst_len;
reg dest_valid = 1'b0;
reg dest_mem_data_valid = 1'b0;
reg dest_mem_data_last = 1'b0;
reg [BYTES_PER_BURST_WIDTH+1-1:0] burst_len_mem[0:AUX_FIFO_SIZE-1];
wire [BYTES_PER_BURST_WIDTH+1-1:0] src_burst_len_data;
reg [BYTES_PER_BURST_WIDTH+1-1:0] dest_burst_len_data = 'h00;
wire src_beat;
wire src_last_beat;
wire [ID_WIDTH-1:0] src_dest_id;
wire [ADDRESS_WIDTH-1:0] src_waddr;
wire [ID_WIDTH-2:0] src_id_reduced;
wire src_mem_data_valid;
wire src_mem_data_last;
wire [DATA_WIDTH-1:0] src_mem_data;
wire dest_beat;
wire dest_last_beat;
wire dest_last;
wire [ID_WIDTH-1:0] dest_src_id;
wire [ADDRESS_WIDTH-1:0] dest_raddr;
wire [ID_WIDTH-2:0] dest_id_reduced_next;
wire [ID_WIDTH-1:0] dest_id_next_inc;
wire [ID_WIDTH-2:0] dest_id_reduced;
wire dest_burst_valid;
wire dest_burst_ready;
wire dest_ready;
wire [DATA_WIDTH-1:0] dest_mem_data;
wire dest_mem_data_ready;
`include "inc_id.vh"
generate if (ID_WIDTH >= 3) begin
  assign src_id_reduced = {src_id_reduced_msb,src_id[ID_WIDTH-3:0]};
  assign dest_id_reduced_next = {dest_id_reduced_msb_next,dest_id_next[ID_WIDTH-3:0]};
  assign dest_id_reduced = {dest_id_reduced_msb,dest_id[ID_WIDTH-3:0]};
end else begin
  assign src_id_reduced = src_id_reduced_msb;
  assign dest_id_reduced_next = dest_id_reduced_msb_next;
  assign dest_id_reduced = dest_id_reduced_msb;
end endgenerate
assign src_beat = src_mem_data_valid;
assign src_last_beat = src_beat & src_mem_data_last;
assign src_waddr = {src_id_reduced,src_beat_counter};
assign src_data_request_id = src_dest_id;
always @(*) begin
  if (src_last_beat == 1'b1) begin
    src_id_next <= inc_id(src_id);
  end else begin
    src_id_next <= src_id;
  end
end
always @(posedge src_clk) begin
  if (src_reset == 1'b1) begin
    src_id <= 'h00;
    src_id_reduced_msb <= 1'b0;
  end else begin
    src_id <= src_id_next;
    src_id_reduced_msb <= ^src_id_next[ID_WIDTH-1-:2];
  end
end
always @(posedge src_clk) begin
  if (src_reset == 1'b1) begin
    src_beat_counter <= 'h00;
  end else if (src_beat == 1'b1) begin
    src_beat_counter <= src_beat_counter + 1'b1;
  end
end
always @(posedge src_clk) begin
  if (src_last_beat == 1'b1) begin
    burst_len_mem[src_id_reduced] <= src_burst_len_data;
  end
end
assign dest_ready = ~dest_mem_data_valid | dest_mem_data_ready;
assign dest_last = dest_beat_counter == dest_burst_len;
assign dest_beat = dest_valid & dest_ready;
assign dest_last_beat = dest_last & dest_beat;
assign dest_raddr = {dest_id_reduced,dest_beat_counter};
assign dest_burst_valid = dest_data_request_id != dest_id_next;
assign dest_burst_ready = ~dest_valid | dest_last_beat;
/*
 */
always @(posedge dest_clk) begin
  if (dest_reset == 1'b1) begin
    dest_valid <= 1'b0;
  end else if (dest_burst_valid == 1'b1) begin
    dest_valid <= 1'b1;
  end else if (dest_last_beat == 1'b1) begin
    dest_valid <= 1'b0;
  end
end
/*
 */
always @(posedge dest_clk) begin
  if (dest_reset == 1'b1) begin
    dest_mem_data_valid <= 1'b0;
  end else if (dest_valid == 1'b1) begin
    dest_mem_data_valid <= 1'b1;
  end else if (dest_mem_data_ready == 1'b1) begin
    dest_mem_data_valid <= 1'b0;
  end
end
/*
 */
always @(posedge dest_clk) begin
  if (dest_reset == 1'b1) begin
    dest_mem_data_last <= 1'b0;
  end else if (dest_beat == 1'b1) begin
    dest_mem_data_last <= dest_last;
  end else if (dest_mem_data_ready == 1'b1) begin
    dest_mem_data_last <= 1'b0;
  end
end
assign dest_id_next_inc = inc_id(dest_id_next);
always @(posedge dest_clk) begin
  if (dest_reset == 1'b1) begin
    dest_id_next <= 'h00;
    dest_id_reduced_msb_next <= 1'b0;
  end else if (dest_burst_valid == 1'b1 && dest_burst_ready == 1'b1) begin
    dest_id_next <= dest_id_next_inc;
    dest_id_reduced_msb_next <= ^dest_id_next_inc[ID_WIDTH-1-:2];
  end
end
always @(posedge dest_clk) begin
  if (dest_burst_valid == 1'b1 && dest_burst_ready == 1'b1) begin
    dest_burst_len_data <= burst_len_mem[dest_id_reduced_next];
  end
end
always @(posedge dest_clk) begin
  if (dest_burst_ready == 1'b1) begin
    dest_id <= dest_id_next;
    dest_id_reduced_msb <= dest_id_reduced_msb_next;
  end
end
always @(posedge dest_clk) begin
  if (dest_reset == 1'b1) begin
    dest_beat_counter <= 'h00;
  end else if (dest_beat == 1'b1) begin
    dest_beat_counter <= dest_beat_counter + 1'b1;
  end
end
assign dest_burst_info_length = dest_burst_len_data[BYTES_PER_BURST_WIDTH-1:0];
assign dest_burst_info_partial = dest_burst_len_data[BYTES_PER_BURST_WIDTH];
assign dest_burst_info_id = dest_id;
always @(posedge dest_clk) begin
  dest_burst_info_write <= (dest_burst_valid == 1'b1 && dest_burst_ready == 1'b1);
end
// If destination is wider track the number of source beats in a destination
// beat in case the stream is not destination width aligned.
generate if (DATA_WIDTH_SRC < DATA_WIDTH_DEST) begin
  reg [DEST_SRC_RATIO_WIDTH-1:0] src_num_beats = {DEST_SRC_RATIO_WIDTH{1'b1}};
  reg [BYTES_PER_BEAT_WIDTH_SRC-1:0] src_data_valid_bytes_d = 'h00;
  reg src_data_partial_burst_d = 'h0;
  // This counter will hold the number of source beat in a destination beat
  // minus one
  always @(posedge src_clk) begin
    if (src_mem_data_last == 1'b1 && src_mem_data_valid == 1'b1) begin
      if (src_data_valid) begin
        src_num_beats  <= {DEST_SRC_RATIO_WIDTH{1'b0}};
      end else begin
        src_num_beats  <= {DEST_SRC_RATIO_WIDTH{1'b1}};
      end
    end else if (src_data_valid) begin
      src_num_beats <= src_num_beats + 1'b1;
    end
  end
  // Compensate the delay through the resize block
  always @(posedge src_clk) begin
    if (src_data_valid == 1'b1) begin
      src_data_valid_bytes_d <= src_data_valid_bytes;
      src_data_partial_burst_d <= src_data_partial_burst;
    end
  end
  assign src_burst_len_data = {src_data_partial_burst_d,
                               src_beat_counter,
                               src_num_beats,
                               src_data_valid_bytes_d};
end else begin
  assign src_burst_len_data = {src_data_partial_burst,
                               src_beat_counter,
                               src_data_valid_bytes};
end
endgenerate
assign dest_burst_len = dest_burst_len_data[BYTES_PER_BURST_WIDTH-1 -: BURST_LEN_WIDTH];
axi_dmac_resize_src #(
  .DATA_WIDTH_SRC (DATA_WIDTH_SRC),
  .DATA_WIDTH_MEM (DATA_WIDTH)
) i_resize_src (
  .clk (src_clk),
  .reset (src_reset),
  .src_data_valid (src_data_valid),
  .src_data (src_data),
  .src_data_last (src_data_last),
  .mem_data_valid (src_mem_data_valid),
  .mem_data (src_mem_data),
  .mem_data_last (src_mem_data_last)
);
ad_mem #(
  .DATA_WIDTH (DATA_WIDTH),
  .ADDRESS_WIDTH (ADDRESS_WIDTH)
) i_mem (
  .clka (src_clk),
  .wea (src_beat),
  .addra (src_waddr),
  .dina (src_mem_data),
  .clkb (dest_clk),
  .reb (dest_beat),
  .addrb (dest_raddr),
  .doutb (dest_mem_data)
);
axi_dmac_resize_dest #(
  .DATA_WIDTH_DEST (DATA_WIDTH_DEST),
  .DATA_WIDTH_MEM (DATA_WIDTH)
) i_resize_dest (
  .clk (dest_clk),
  .reset (dest_reset),
  .mem_data_valid (dest_mem_data_valid),
  .mem_data_ready (dest_mem_data_ready),
  .mem_data (dest_mem_data),
  .mem_data_last (dest_mem_data_last),
  .dest_data_valid (dest_data_valid),
  .dest_data_ready (dest_data_ready),
  .dest_data (dest_data),
  .dest_data_last (dest_data_last)
);
sync_bits #(
  .NUM_OF_BITS (ID_WIDTH),
  .ASYNC_CLK (ASYNC_CLK)
) i_dest_sync_id (
  .in (src_id),
  .out_clk (dest_clk),
  .out_resetn (1'b1),
  .out (dest_src_id)
);
sync_bits #(
  .NUM_OF_BITS (ID_WIDTH),
  .ASYNC_CLK (ASYNC_CLK)
) i_src_sync_id (
  .in (dest_id),
  .out_clk (src_clk),
  .out_resetn (1'b1),
  .out (src_dest_id)
);
assign dest_request_id = dest_src_id;
assign dest_data_response_id = dest_id;
generate if (ENABLE_DIAGNOSTICS_IF == 1) begin
  reg [ID_WIDTH-1:0] _dest_diag_level_bursts = 'h0;
  // calculate buffer fullness in bursts
  always @(posedge dest_clk) begin
    if (dest_reset == 1'b1) begin
      _dest_diag_level_bursts <= 'h0;
    end else begin
      _dest_diag_level_bursts <= g2b(dest_src_id) - g2b(dest_id);
    end
  end
  assign dest_diag_level_bursts = {{{8-ID_WIDTH}{1'b0}},_dest_diag_level_bursts};
end else begin
  assign dest_diag_level_bursts = 'h0;
end
endgenerate
endmodule