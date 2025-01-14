module x_vector_cache(clk, rst, col, push_col, start_address, req_mem, req_mem_addr, rsp_mem_push, rsp_mem_q, push_x, x_val, stall, almost_full);
//TODO: put x value fifo inside. x fifo small (32) and response fifo big (512) and is_cached_fifo (1024).
parameter SUB_WIDTH = 8; //TODO: use includes
parameter LOG2_SUB_WIDTH = log2(SUB_WIDTH - 1);
parameter ALMOST_FULL_COUNT = 16;
input clk;
input rst;
input [31:0] col;
input push_col;
input [47:0] start_address;
output req_mem;
output [47:0] req_mem_addr;
input rsp_mem_push;
input [63:0] rsp_mem_q;
output push_x;
output [63:0] x_val;
input stall;
output almost_full;
reg [0:SUB_WIDTH - 1] cache_prediction;
reg [31 - LOG2_SUB_WIDTH:0] major_col;
reg col_push_stage_0;
reg col_push_stage_1;
reg [31:0] col_stage_0, col_stage_1;
always @(posedge clk) begin
    col_push_stage_0 <= push_col;
    col_stage_0 <= col;
    col_push_stage_1 <= col_push_stage_0;
    col_stage_1 <= col_stage_0;
end
reg col_push_stage_2;
reg is_cached_stage_2;
reg [31:0] col_stage_2;
always @(posedge clk) begin
    if(col_push_stage_1)
        cache_prediction[col_stage_1[LOG2_SUB_WIDTH-1:0]] <= 1;
    is_cached_stage_2 <= cache_prediction[col_stage_1[LOG2_SUB_WIDTH-1:0]];
    if(col_push_stage_0)
        major_col <= col_stage_0[31:LOG2_SUB_WIDTH];
    if(major_col != col_stage_0[31:LOG2_SUB_WIDTH] && col_push_stage_0 || rst)
        cache_prediction <= 0;
    col_push_stage_2 <= col_push_stage_1;
    col_stage_2 <= col_stage_1;
end
reg [47:0] x_vector_addr;
reg req_x_vector;
//reg [LOG2_SUB_WIDTH - 1:0] x_vector_tag;
always @(posedge clk) begin
    req_x_vector <= col_push_stage_2 && !is_cached_stage_2;
    x_vector_addr <= start_address + col_stage_2 * 8;
//    x_vector_tag <= col_stage_2[LOG2_SUB_WIDTH - 1:0];
end
assign req_mem = req_x_vector;
assign req_mem_addr = x_vector_addr;
//assign req_mem_tag = x_vector_tag;
//is cached fifo
reg is_cached_fifo_pop;
wire [LOG2_SUB_WIDTH:0] is_cached_fifo_q;
wire is_cached_fifo_full;
wire is_cached_fifo_empty;
//TODO: change to 1024
std_fifo #(.WIDTH(1 + LOG2_SUB_WIDTH), .DEPTH(1024), .LATENCY(0)) is_cached_fifo(rst, clk, col_push_stage_2, is_cached_fifo_pop, {col_stage_2[LOG2_SUB_WIDTH - 1:0], is_cached_stage_2}, is_cached_fifo_q, is_cached_fifo_full, is_cached_fifo_empty, , , );
//response fifo
reg response_fifo_pop;
wire [63:0] response_fifo_q;
wire response_fifo_full;
wire response_fifo_empty;
localparam RESPONSE_FIFO_DEPTH=1024;
std_fifo #(.WIDTH(64), .DEPTH(RESPONSE_FIFO_DEPTH), .LATENCY(1)) response_fifo(rst, clk, rsp_mem_push, response_fifo_pop, rsp_mem_q, response_fifo_q, response_fifo_full, response_fifo_empty, , , );
//TODO: keep track of in flight requests
localparam LOG2_RESPONSE_FIFO_DEPTH=log2(RESPONSE_FIFO_DEPTH-1);
reg [LOG2_RESPONSE_FIFO_DEPTH:0] in_flight_counter;
initial in_flight_counter = 0;
always @(posedge clk) begin
    if(response_fifo_pop && req_x_vector) begin
    end else if(response_fifo_pop) begin
        in_flight_counter <= in_flight_counter - 1;
    end else if(req_x_vector) begin
        in_flight_counter <= in_flight_counter + 1;
    end
    if(rst)
        in_flight_counter <= 0;
end
assign almost_full = in_flight_counter > RESPONSE_FIFO_DEPTH - ALMOST_FULL_COUNT;
//cache
reg [63:0] cache [0:SUB_WIDTH - 1];
//TODO: memory response to out
reg x_read_cache_stage_0;
reg x_write_cache_stage_0;
always @* begin
    x_read_cache_stage_0 = !is_cached_fifo_empty && is_cached_fifo_q[0] && !stall;
    x_write_cache_stage_0 = !is_cached_fifo_q[0] && !response_fifo_empty && !stall;
    is_cached_fifo_pop = x_read_cache_stage_0 || x_write_cache_stage_0;
    response_fifo_pop = x_write_cache_stage_0;
end
reg [LOG2_SUB_WIDTH - 1:0] cache_addr_stage_1;
reg x_read_cache_stage_1;
reg x_write_cache_stage_1;
always @(posedge clk) begin
    cache_addr_stage_1 <= is_cached_fifo_q[LOG2_SUB_WIDTH:1];
    x_read_cache_stage_1 <= x_read_cache_stage_0;
    x_write_cache_stage_1 <= x_write_cache_stage_0;
end
reg [LOG2_SUB_WIDTH - 1:0] cache_addr_stage_2;
reg [63:0] x_value_stage_3;
always @(posedge clk) begin
    if(x_write_cache_stage_1)
        cache[cache_addr_stage_1] <= response_fifo_q;
    x_value_stage_3 <= cache[cache_addr_stage_2];
end
reg x_stage_2;
always @(posedge clk) begin
    x_stage_2 <= x_read_cache_stage_1 || x_write_cache_stage_1;
    cache_addr_stage_2 <= cache_addr_stage_1;
end
reg x_stage_3;
always @(posedge clk)
    x_stage_3 <= x_stage_2;
assign push_x = x_stage_3;
assign x_val = x_value_stage_3;
`include "common.vh"
endmodule