module
// Note:
//     Not a complet testbench, could be better
reg wr = 0;
wire fifo_full;
reg [4:0] wptr = 0;
reg fifo_we = 0;
reg clk = 0;
reg rst_n = 0;
reg rd = 0;
wire fifo_empty;
reg [4:0] rptr = 0;
reg fifo_rd = 0;
wire fifo_threshold;
wire fifo_overflow;
wire fifo_underflow;
reg fifoStatus0_0_underflow_set = 0;
reg signed [4:0] fifoStatus0_0_pointer_result = 0;
reg fifoStatus0_0_pointer_equal = 0;
reg fifoStatus0_0_overflow_set = 0;
reg fifoStatus0_0_fifo_underflow_i = 0;
reg fifoStatus0_0_fifo_threshold_i = 0;
reg fifoStatus0_0_fifo_overflow_i = 0;
reg fifoStatus0_0_fifo_full_i = 0;
reg fifoStatus0_0_fifo_empty_i = 0;
reg fifoStatus0_0_fbit_comp = 0;
always @(rd, fifo_rd, wr, fifo_overflow, fifo_underflow, fifo_threshold, fifo_full, fifo_empty, wptr, rptr, fifo_we) begin: FIFOSTATUSTBV_PRINT_DATA
    $write("%h", wr);
    $write(" ");
    $write("%h", rd);
    $write(" ");
    $write("%h", fifo_we);
    $write(" ");
    $write("%h", fifo_rd);
    $write(" ");
    $write("%h", wptr);
    $write(" ");
    $write("%h", rptr);
    $write(" ");
    $write("%h", fifo_full);
    $write(" ");
    $write("%h", fifo_empty);
    $write(" ");
    $write("%h", fifo_threshold);
    $write(" ");
    $write("%h", fifo_overflow);
    $write(" ");
    $write("%h", fifo_underflow);
    $write("\n");
end
always @(rd, wr, fifoStatus0_0_fifo_full_i, rptr, wptr, fifoStatus0_0_fifo_empty_i) begin: FIFOSTATUSTBV_FIFOSTATUS0_0_LOGIC1
    fifoStatus0_0_fbit_comp = (wptr[4] ^ rptr[4]);
    if (($signed({1'b0, wptr[3-1:0]}) - rptr[3-1:0])) begin
        fifoStatus0_0_pointer_equal = 0;
    end
    else begin
        fifoStatus0_0_pointer_equal = 1;
    end
    fifoStatus0_0_pointer_result = (wptr[4-1:0] - rptr[4-1:0]);
    fifoStatus0_0_overflow_set = (fifoStatus0_0_fifo_full_i & wr);
    fifoStatus0_0_underflow_set = (fifoStatus0_0_fifo_empty_i & rd);
end
always @(fifoStatus0_0_fbit_comp, fifoStatus0_0_pointer_equal, fifoStatus0_0_pointer_result) begin: FIFOSTATUSTBV_FIFOSTATUS0_0_LOGIC2
    fifoStatus0_0_fifo_full_i = (fifoStatus0_0_fbit_comp & fifoStatus0_0_pointer_equal);
    fifoStatus0_0_fifo_empty_i = ((!fifoStatus0_0_fbit_comp) & fifoStatus0_0_pointer_equal);
    if ((fifoStatus0_0_pointer_result[4] || fifoStatus0_0_pointer_result[3])) begin
        fifoStatus0_0_fifo_threshold_i = 1;
    end
    else begin
        fifoStatus0_0_fifo_threshold_i = 0;
    end
end
always @(posedge clk, negedge rst_n) begin: FIFOSTATUSTBV_FIFOSTATUS0_0_OVERFLOWCONTROL
    if (rst_n) begin
        fifoStatus0_0_fifo_overflow_i <= 0;
    end
    else if (((fifoStatus0_0_overflow_set == 1) && (fifo_rd == 0))) begin
        fifoStatus0_0_fifo_overflow_i <= 1;
    end
    else if (fifo_rd) begin
        fifoStatus0_0_fifo_overflow_i <= 0;
    end
    else begin
        fifoStatus0_0_fifo_overflow_i <= fifoStatus0_0_fifo_overflow_i;
    end
end
always @(posedge clk, negedge rst_n) begin: FIFOSTATUSTBV_FIFOSTATUS0_0_UNDERFLOWCONTROL
    if (rst_n) begin
        fifoStatus0_0_fifo_underflow_i <= 0;
    end
    else if (((fifoStatus0_0_underflow_set == 1) && (fifo_we == 0))) begin
        fifoStatus0_0_fifo_underflow_i <= 1;
    end
    else if (fifo_we) begin
        fifoStatus0_0_fifo_underflow_i <= 0;
    end
    else begin
        fifoStatus0_0_fifo_underflow_i <= fifoStatus0_0_fifo_underflow_i;
    end
end
assign fifo_full = fifoStatus0_0_fifo_full_i;
assign fifo_empty = fifoStatus0_0_fifo_empty_i;
assign fifo_threshold = fifoStatus0_0_fifo_threshold_i;
assign fifo_overflow = fifoStatus0_0_fifo_overflow_i;
assign fifo_underflow = fifoStatus0_0_fifo_underflow_i;
initial begin: FIFOSTATUSTBV_CLK_SIGNAL
    while (1'b1) begin
        clk <= (!clk);
        # 1;
    end
end
initial begin: FIFOSTATUSTBV_STIMULES
    integer i;
    i = 0;
    while (1'b1) begin
        case (i)
            'h0: begin
                wr <= 1;
                rd <= 1;
                fifo_we <= 0;
                fifo_rd <= 0;
            end
            'h2: begin
                wr <= 0;
                rd <= 0;
                fifo_we <= 1;
                fifo_rd <= 1;
            end
            'h4: begin
                wr <= 1;
                rd <= 1;
                fifo_we <= 1;
                fifo_rd <= 1;
            end
            default: begin
                // pass
            end
        endcase
        if (((i >= 6) && (i <= 20))) begin
            wptr <= (wptr + 1);
        end
        if (((i >= 7) && (i <= 20))) begin
            rptr <= (rptr + 1);
        end
        case (i)
            'h14: begin
                rst_n <= 1;
            end
            'h15: begin
                rst_n <= 0;
            end
            'h17: begin
                $finish;
            end
            default: begin
                // pass
            end
        endcase
        i = i + 1;
        @(posedge clk);
    end
end
endmodule