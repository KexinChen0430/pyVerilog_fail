module sdram_init (
    input       sdram_clk,
    input       sdram_rst_,
//    input       CKE_IN,
//    output  reg CKE_OUT,
    output  reg PAA = 0,
    output  reg SET_MODE
);
parameter
    INIT_CNT        = 16'h4000,
    INIT_HALF_CNT   = INIT_CNT >> 1;
reg     [15:0]  init_counter;
wire    init_counter_done;
//wire    init_counter_half_done;
assign init_counter_done = (init_counter == INIT_CNT);
//assign init_counter_half_done = (init_counter > INIT_HALF_CNT);
always @(posedge sdram_clk) begin
    if (!sdram_rst_)
        init_counter <= 'b0;
    else if (!init_counter_done)
        init_counter <= init_counter + 1'b1;
end
//always @(negedge sdram_clk or negedge sdram_rst_) begin
//    if (!sdram_rst_)
//        CKE_OUT <= 1'b0;
//    else
//        CKE_OUT <= CKE_IN && init_counter_half_done;
//end
always @(posedge sdram_clk) begin
        PAA <= init_counter_done;
end
always @(posedge sdram_clk) begin
        SET_MODE <= 1'b1;
end
endmodule