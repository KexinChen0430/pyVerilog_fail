module axis_async_fifo #
(
    parameter ADDR_WIDTH = 12,
    parameter DATA_WIDTH = 8
)
(
    /*
     */
    input  wire                   input_clk,
    input  wire                   input_rst,
    input  wire [DATA_WIDTH-1:0]  input_axis_tdata,
    input  wire                   input_axis_tvalid,
    output wire                   input_axis_tready,
    input  wire                   input_axis_tlast,
    input  wire                   input_axis_tuser,
    /*
     */
    input  wire                   output_clk,
    input  wire                   output_rst,
    output wire [DATA_WIDTH-1:0]  output_axis_tdata,
    output wire                   output_axis_tvalid,
    input  wire                   output_axis_tready,
    output wire                   output_axis_tlast,
    output wire                   output_axis_tuser
);
reg [ADDR_WIDTH:0] wr_ptr = {ADDR_WIDTH+1{1'b0}}, wr_ptr_next;
reg [ADDR_WIDTH:0] wr_ptr_gray = {ADDR_WIDTH+1{1'b0}};
reg [ADDR_WIDTH:0] rd_ptr = {ADDR_WIDTH+1{1'b0}}, rd_ptr_next;
reg [ADDR_WIDTH:0] rd_ptr_gray = {ADDR_WIDTH+1{1'b0}};
reg [ADDR_WIDTH:0] wr_ptr_gray_sync1 = {ADDR_WIDTH+1{1'b0}};
reg [ADDR_WIDTH:0] wr_ptr_gray_sync2 = {ADDR_WIDTH+1{1'b0}};
reg [ADDR_WIDTH:0] rd_ptr_gray_sync1 = {ADDR_WIDTH+1{1'b0}};
reg [ADDR_WIDTH:0] rd_ptr_gray_sync2 = {ADDR_WIDTH+1{1'b0}};
reg input_rst_sync1 = 1;
reg input_rst_sync2 = 1;
reg output_rst_sync1 = 1;
reg output_rst_sync2 = 1;
reg [DATA_WIDTH+2-1:0] data_out_reg = {1'b0, 1'b0, {DATA_WIDTH{1'b0}}};
//(* RAM_STYLE="BLOCK" *)
reg [DATA_WIDTH+2-1:0] mem[(2**ADDR_WIDTH)-1:0];
reg output_read = 1'b0;
reg output_axis_tvalid_reg = 1'b0;
wire [DATA_WIDTH+2-1:0] data_in = {input_axis_tlast, input_axis_tuser, input_axis_tdata};
// full when first TWO MSBs do NOT match, but rest matches
// (gray code equivalent of first MSB different but rest same)
wire full = ((wr_ptr_gray[ADDR_WIDTH] != rd_ptr_gray_sync2[ADDR_WIDTH]) &&
             (wr_ptr_gray[ADDR_WIDTH-1] != rd_ptr_gray_sync2[ADDR_WIDTH-1]) &&
             (wr_ptr_gray[ADDR_WIDTH-2:0] == rd_ptr_gray_sync2[ADDR_WIDTH-2:0]));
// empty when pointers match exactly
wire empty = rd_ptr_gray == wr_ptr_gray_sync2;
wire write = input_axis_tvalid & ~full;
wire read = (output_axis_tready | ~output_axis_tvalid_reg) & ~empty;
assign {output_axis_tlast, output_axis_tuser, output_axis_tdata} = data_out_reg;
assign input_axis_tready = ~full;
assign output_axis_tvalid = output_axis_tvalid_reg;
// reset synchronization
always @(posedge input_clk or posedge input_rst or posedge output_rst) begin
    if (input_rst | output_rst) begin
        input_rst_sync1 <= 1;
        input_rst_sync2 <= 1;
    end else begin
        input_rst_sync1 <= 0;
        input_rst_sync2 <= input_rst_sync1;
    end
end
always @(posedge output_clk or posedge input_rst or posedge output_rst) begin
    if (input_rst | output_rst) begin
        output_rst_sync1 <= 1;
        output_rst_sync2 <= 1;
    end else begin
        output_rst_sync1 <= 0;
        output_rst_sync2 <= output_rst_sync1;
    end
end
// write
always @(posedge input_clk or posedge input_rst_sync2) begin
    if (input_rst_sync2) begin
        wr_ptr <= 0;
    end else if (write) begin
        mem[wr_ptr[ADDR_WIDTH-1:0]] <= data_in;
        wr_ptr_next = wr_ptr + 1;
        wr_ptr <= wr_ptr_next;
        wr_ptr_gray <= wr_ptr_next ^ (wr_ptr_next >> 1);
    end
end
// pointer synchronization
always @(posedge input_clk or posedge input_rst_sync2) begin
    if (input_rst_sync2) begin
        rd_ptr_gray_sync1 <= 0;
        rd_ptr_gray_sync2 <= 0;
    end else begin
        rd_ptr_gray_sync1 <= rd_ptr_gray;
        rd_ptr_gray_sync2 <= rd_ptr_gray_sync1;
    end
end
// read
always @(posedge output_clk or posedge output_rst_sync2) begin
    if (output_rst_sync2) begin
        rd_ptr <= 0;
    end else if (read) begin
        data_out_reg <= mem[rd_ptr[ADDR_WIDTH-1:0]];
        rd_ptr_next = rd_ptr + 1;
        rd_ptr <= rd_ptr_next;
        rd_ptr_gray <= rd_ptr_next ^ (rd_ptr_next >> 1);
    end
end
// pointer synchronization
always @(posedge output_clk or posedge output_rst_sync2) begin
    if (output_rst_sync2) begin
        wr_ptr_gray_sync1 <= 0;
        wr_ptr_gray_sync2 <= 0;
    end else begin
        wr_ptr_gray_sync1 <= wr_ptr_gray;
        wr_ptr_gray_sync2 <= wr_ptr_gray_sync1;
    end
end
// source ready output
always @(posedge output_clk or posedge output_rst_sync2) begin
    if (output_rst_sync2) begin
        output_axis_tvalid_reg <= 1'b0;
    end else if (output_axis_tready | ~output_axis_tvalid_reg) begin
        output_axis_tvalid_reg <= ~empty;
    end else begin
        output_axis_tvalid_reg <= output_axis_tvalid_reg;
    end
end
endmodule