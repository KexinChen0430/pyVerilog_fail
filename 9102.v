module instance
    fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH)
    ) fifo (
        .wr_data(wr_data),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .rd_data(rd_data),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_valid(rd_valid),
        .full(full),
        .empty(empty),
        .reset(reset)
    );
    // Write Clock Generation
    always
        #5 wr_clk = !wr_clk;
    // Write Data Generation
    always
        #10 wr_data = !wr_data;
    // Read Clock Generation
    always
        #3 rd_clk = !rd_clk & !full;
    // Reset Generation
    initial begin
        #2 reset = 1;
        #2 reset = 0;
    end
endmodule