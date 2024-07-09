module eth_phy_10g_rx_watchdog #
(
    parameter HDR_WIDTH = 2,
    parameter COUNT_125US = 125000/6.4
)
(
    input  wire                  clk,
    input  wire                  rst,
    /*
     */
    input  wire [HDR_WIDTH-1:0]  serdes_rx_hdr,
    output wire                  serdes_rx_reset_req,
    /*
     */
    input  wire                  rx_bad_block,
    input  wire                  rx_sequence_error,
    input  wire                  rx_block_lock,
    input  wire                  rx_high_ber
);
// bus width assertions
initial begin
    if (HDR_WIDTH != 2) begin
        $error("Error: HDR_WIDTH must be 2");
        $finish;
    end
end
parameter COUNT_WIDTH = $clog2(COUNT_125US);
localparam [1:0]
    SYNC_DATA = 2'b10,
    SYNC_CTRL = 2'b01;
reg [COUNT_WIDTH-1:0] time_count_reg = 0, time_count_next;
reg [3:0] error_count_reg = 0, error_count_next;
reg saw_ctrl_sh_reg = 1'b0, saw_ctrl_sh_next;
reg [9:0] block_error_count_reg = 0, block_error_count_next;
reg serdes_rx_reset_req_reg = 1'b0, serdes_rx_reset_req_next;
assign serdes_rx_reset_req = serdes_rx_reset_req_reg;
always @* begin
    error_count_next = error_count_reg;
    saw_ctrl_sh_next = saw_ctrl_sh_reg;
    block_error_count_next = block_error_count_reg;
    serdes_rx_reset_req_next = 1'b0;
    if (rx_block_lock) begin
        if (serdes_rx_hdr == SYNC_CTRL) begin
            saw_ctrl_sh_next = 1'b1;
        end
        if ((rx_bad_block || rx_sequence_error) && !(&block_error_count_reg)) begin
            block_error_count_next = block_error_count_reg + 1;
        end
    end
    if (time_count_reg != 0) begin
        time_count_next = time_count_reg-1;
    end else begin
        time_count_next = COUNT_125US;
        if (!saw_ctrl_sh_reg || &block_error_count_reg) begin
            error_count_next = error_count_reg + 1;
        end else begin
            error_count_next = 0;
        end
        if (&error_count_reg) begin
            error_count_next = 0;
            serdes_rx_reset_req_next = 1'b1;
        end
        saw_ctrl_sh_next = 1'b0;
        block_error_count_next = 0;
    end
end
always @(posedge clk) begin
    time_count_reg <= time_count_next;
    error_count_reg <= error_count_next;
    saw_ctrl_sh_reg <= saw_ctrl_sh_next;
    block_error_count_reg <= block_error_count_next;
    if (rst) begin
        time_count_reg <= COUNT_125US;
        error_count_reg <= 0;
        saw_ctrl_sh_reg <= 1'b0;
        block_error_count_reg <= 0;
    end
end
always @(posedge clk or posedge rst) begin
    if (rst) begin
        serdes_rx_reset_req_reg <= 1'b0;
    end else begin
        serdes_rx_reset_req_reg <= serdes_rx_reset_req_next;
    end
end
endmodule