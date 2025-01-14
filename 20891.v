module
// Note:
//     Not a complet testbench, could be better
reg wr = 0;
wire fifo_full;
reg clk = 0;
reg rst_n = 0;
reg rd = 0;
wire fifo_empty;
reg [7:0] data_in = 0;
wire [7:0] data_out;
wire clear;
wire fifo_threshold;
wire fifo_overflow;
wire fifo_underflow;
wire [4:0] fifo_mem0_0_wptr;
wire fifo_mem0_0_fifo_we;
wire [4:0] fifo_mem0_0_rptr;
wire fifo_mem0_0_fifo_rd;
wire fifo_mem0_0_write_pointer0_0_1_2_fifo_we_i;
reg [4:0] fifo_mem0_0_write_pointer0_0_1_2_wptr_i = 0;
wire fifo_mem0_0_read_pointer0_0_1_2_fifo_rd_i;
reg [4:0] fifo_mem0_0_read_pointer0_0_1_2_rptr_i = 0;
reg fifo_mem0_0_fifoStatus0_0_1_2_underflow_set = 0;
reg signed [4:0] fifo_mem0_0_fifoStatus0_0_1_2_pointer_result = 0;
reg fifo_mem0_0_fifoStatus0_0_1_2_pointer_equal = 0;
reg fifo_mem0_0_fifoStatus0_0_1_2_overflow_set = 0;
reg fifo_mem0_0_fifoStatus0_0_1_2_fifo_underflow_i = 0;
reg fifo_mem0_0_fifoStatus0_0_1_2_fifo_threshold_i = 0;
reg fifo_mem0_0_fifoStatus0_0_1_2_fifo_overflow_i = 0;
reg fifo_mem0_0_fifoStatus0_0_1_2_fifo_full_i = 0;
reg fifo_mem0_0_fifoStatus0_0_1_2_fifo_empty_i = 0;
reg fifo_mem0_0_fifoStatus0_0_1_2_fbit_comp = 0;
wire [7:0] TestData_i [0:16-1];
reg [7:0] fifo_mem0_0_memory_array0_0_1_2_data_out_i [0:16-1];
initial begin: INITIALIZE_FIFO_MEM0_0_MEMORY_ARRAY0_0_1_2_DATA_OUT_I
    integer i;
    for(i=0; i<16; i=i+1) begin
        fifo_mem0_0_memory_array0_0_1_2_data_out_i[i] = 0;
    end
end
assign clear = 1'd0;
always @(data_out, data_in, fifo_overflow, fifo_empty, fifo_underflow, fifo_threshold, clear, rd, clk, wr, fifo_full, rst_n) begin: FIFO_MEMTBV_PRINT_DATA
    $write("%h", wr);
    $write(" ");
    $write("%h", rd);
    $write(" ");
    $write("%h", data_in);
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
    $write(" ");
    $write("%h", data_out);
    $write(" ");
    $write("%h", clk);
    $write(" ");
    $write("%h", rst_n);
    $write(" ");
    $write("%h", clear);
    $write("\n");
end
assign fifo_mem0_0_write_pointer0_0_1_2_fifo_we_i = ((!fifo_full) && wr);
always @(posedge clk, negedge rst_n) begin: FIFO_MEMTBV_FIFO_MEM0_0_WRITE_POINTER0_0_1_2_POINTERUPDATE
    if (rst_n) begin
        fifo_mem0_0_write_pointer0_0_1_2_wptr_i <= 0;
    end
    else if (fifo_mem0_0_write_pointer0_0_1_2_fifo_we_i) begin
        fifo_mem0_0_write_pointer0_0_1_2_wptr_i <= (fifo_mem0_0_write_pointer0_0_1_2_wptr_i + 1);
    end
    else begin
        fifo_mem0_0_write_pointer0_0_1_2_wptr_i <= fifo_mem0_0_write_pointer0_0_1_2_wptr_i;
    end
end
assign fifo_mem0_0_fifo_we = fifo_mem0_0_write_pointer0_0_1_2_fifo_we_i;
assign fifo_mem0_0_wptr = fifo_mem0_0_write_pointer0_0_1_2_wptr_i;
assign fifo_mem0_0_read_pointer0_0_1_2_fifo_rd_i = ((!fifo_empty) && rd);
always @(posedge clk, negedge rst_n) begin: FIFO_MEMTBV_FIFO_MEM0_0_READ_POINTER0_0_1_2_POINTERUPDATE
    if (rst_n) begin
        fifo_mem0_0_read_pointer0_0_1_2_rptr_i <= 0;
    end
    else if (fifo_mem0_0_read_pointer0_0_1_2_fifo_rd_i) begin
        fifo_mem0_0_read_pointer0_0_1_2_rptr_i <= (fifo_mem0_0_read_pointer0_0_1_2_rptr_i + 1);
    end
    else begin
        fifo_mem0_0_read_pointer0_0_1_2_rptr_i <= fifo_mem0_0_read_pointer0_0_1_2_rptr_i;
    end
end
assign fifo_mem0_0_fifo_rd = fifo_mem0_0_read_pointer0_0_1_2_fifo_rd_i;
assign fifo_mem0_0_rptr = fifo_mem0_0_read_pointer0_0_1_2_rptr_i;
always @(posedge clk) begin: FIFO_MEMTBV_FIFO_MEM0_0_MEMORY_ARRAY0_0_1_2_UPTAKE
    if (fifo_mem0_0_fifo_we) begin
        fifo_mem0_0_memory_array0_0_1_2_data_out_i[fifo_mem0_0_wptr[4-1:0]] <= data_in;
    end
end
assign data_out = fifo_mem0_0_memory_array0_0_1_2_data_out_i[fifo_mem0_0_rptr[4-1:0]];
always @(negedge clear) begin: FIFO_MEMTBV_FIFO_MEM0_0_MEMORY_ARRAY0_0_1_2_CLEARMEM
    integer i;
    for (i=0; i<16; i=i+1) begin
        fifo_mem0_0_memory_array0_0_1_2_data_out_i[i] <= 0;
    end
end
always @(fifo_mem0_0_fifoStatus0_0_1_2_fifo_full_i, fifo_mem0_0_fifoStatus0_0_1_2_fifo_empty_i, rd, fifo_mem0_0_wptr, wr, fifo_mem0_0_rptr) begin: FIFO_MEMTBV_FIFO_MEM0_0_FIFOSTATUS0_0_1_2_LOGIC1
    fifo_mem0_0_fifoStatus0_0_1_2_fbit_comp = (fifo_mem0_0_wptr[4] ^ fifo_mem0_0_rptr[4]);
    if (($signed({1'b0, fifo_mem0_0_wptr[3-1:0]}) - fifo_mem0_0_rptr[3-1:0])) begin
        fifo_mem0_0_fifoStatus0_0_1_2_pointer_equal = 0;
    end
    else begin
        fifo_mem0_0_fifoStatus0_0_1_2_pointer_equal = 1;
    end
    fifo_mem0_0_fifoStatus0_0_1_2_pointer_result = (fifo_mem0_0_wptr[4-1:0] - fifo_mem0_0_rptr[4-1:0]);
    fifo_mem0_0_fifoStatus0_0_1_2_overflow_set = (fifo_mem0_0_fifoStatus0_0_1_2_fifo_full_i & wr);
    fifo_mem0_0_fifoStatus0_0_1_2_underflow_set = (fifo_mem0_0_fifoStatus0_0_1_2_fifo_empty_i & rd);
end
always @(fifo_mem0_0_fifoStatus0_0_1_2_fbit_comp, fifo_mem0_0_fifoStatus0_0_1_2_pointer_result, fifo_mem0_0_fifoStatus0_0_1_2_pointer_equal) begin: FIFO_MEMTBV_FIFO_MEM0_0_FIFOSTATUS0_0_1_2_LOGIC2
    fifo_mem0_0_fifoStatus0_0_1_2_fifo_full_i = (fifo_mem0_0_fifoStatus0_0_1_2_fbit_comp & fifo_mem0_0_fifoStatus0_0_1_2_pointer_equal);
    fifo_mem0_0_fifoStatus0_0_1_2_fifo_empty_i = ((!fifo_mem0_0_fifoStatus0_0_1_2_fbit_comp) & fifo_mem0_0_fifoStatus0_0_1_2_pointer_equal);
    if ((fifo_mem0_0_fifoStatus0_0_1_2_pointer_result[4] || fifo_mem0_0_fifoStatus0_0_1_2_pointer_result[3])) begin
        fifo_mem0_0_fifoStatus0_0_1_2_fifo_threshold_i = 1;
    end
    else begin
        fifo_mem0_0_fifoStatus0_0_1_2_fifo_threshold_i = 0;
    end
end
always @(posedge clk, negedge rst_n) begin: FIFO_MEMTBV_FIFO_MEM0_0_FIFOSTATUS0_0_1_2_OVERFLOWCONTROL
    if (rst_n) begin
        fifo_mem0_0_fifoStatus0_0_1_2_fifo_overflow_i <= 0;
    end
    else if (((fifo_mem0_0_fifoStatus0_0_1_2_overflow_set == 1) && (fifo_mem0_0_fifo_rd == 0))) begin
        fifo_mem0_0_fifoStatus0_0_1_2_fifo_overflow_i <= 1;
    end
    else if (fifo_mem0_0_fifo_rd) begin
        fifo_mem0_0_fifoStatus0_0_1_2_fifo_overflow_i <= 0;
    end
    else begin
        fifo_mem0_0_fifoStatus0_0_1_2_fifo_overflow_i <= fifo_mem0_0_fifoStatus0_0_1_2_fifo_overflow_i;
    end
end
always @(posedge clk, negedge rst_n) begin: FIFO_MEMTBV_FIFO_MEM0_0_FIFOSTATUS0_0_1_2_UNDERFLOWCONTROL
    if (rst_n) begin
        fifo_mem0_0_fifoStatus0_0_1_2_fifo_underflow_i <= 0;
    end
    else if (((fifo_mem0_0_fifoStatus0_0_1_2_underflow_set == 1) && (fifo_mem0_0_fifo_we == 0))) begin
        fifo_mem0_0_fifoStatus0_0_1_2_fifo_underflow_i <= 1;
    end
    else if (fifo_mem0_0_fifo_we) begin
        fifo_mem0_0_fifoStatus0_0_1_2_fifo_underflow_i <= 0;
    end
    else begin
        fifo_mem0_0_fifoStatus0_0_1_2_fifo_underflow_i <= fifo_mem0_0_fifoStatus0_0_1_2_fifo_underflow_i;
    end
end
assign fifo_full = fifo_mem0_0_fifoStatus0_0_1_2_fifo_full_i;
assign fifo_empty = fifo_mem0_0_fifoStatus0_0_1_2_fifo_empty_i;
assign fifo_threshold = fifo_mem0_0_fifoStatus0_0_1_2_fifo_threshold_i;
assign fifo_overflow = fifo_mem0_0_fifoStatus0_0_1_2_fifo_overflow_i;
assign fifo_underflow = fifo_mem0_0_fifoStatus0_0_1_2_fifo_underflow_i;
initial begin: FIFO_MEMTBV_CLK_SIGNAL
    while (1'b1) begin
        clk <= (!clk);
        # 1;
    end
end
initial begin: FIFO_MEMTBV_STIMULES
    integer i;
    i = 0;
    while (1'b1) begin
        case (i)
            'h0: begin
                wr <= 1;
                rd <= 1;
            end
            'h10: begin
                wr <= 0;
                rd <= 1;
            end
            'h20: begin
                wr <= 0;
                rd <= 1;
            end
            'h30: begin
                rst_n <= 1;
            end
            'h31: begin
                rst_n <= 0;
            end
            'h32: begin
                wr <= 1;
                rd <= 1;
            end
            default: begin
                // pass
            end
        endcase
        if ((i < 16)) begin
            data_in <= TestData_i[i];
        end
        else if (((i >= 16) && (i < 32))) begin
            data_in <= TestData_i[($signed({1'b0, i}) - 16)];
        end
        else if (((i >= 32) && (i < 48))) begin
            data_in <= TestData_i[($signed({1'b0, i}) - 32)];
        end
        else if (((i == 48) || (i == 49))) begin
            // pass
        end
        else begin
            data_in <= TestData_i[($signed({1'b0, i}) - 51)];
        end
        if ((i == 66)) begin
            $finish;
        end
        i = i + 1;
        @(posedge clk);
    end
end
endmodule