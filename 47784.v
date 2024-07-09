module still needs to be addressed
reg [ABUSWIDTH-1:0]  PREV_BUS_ADD;
always @(posedge BUS_CLK) begin
    if(BUS_RD) begin
        PREV_BUS_ADD <= BUS_ADD;
    end
end
always @(*) begin
    if(PREV_BUS_ADD < MEM_OFFSET)
        BUS_DATA_OUT = BUS_DATA_OUT_REG;
    else if(PREV_BUS_ADD < MEM_OFFSET + MEM_BYTES )
        BUS_DATA_OUT = BUS_IN_MEM;
    else
        BUS_DATA_OUT = 8'hxx;
end
reg [31:0] out_bit_cnt;
wire [ADDR_SIZEB-1:0] memout_addrb;
//assign memout_addrb = out_bit_cnt-1;
assign memout_addrb = out_bit_cnt < CONF_COUNT ? out_bit_cnt-1 : CONF_COUNT-1; //do not change during wait
wire [ADDR_SIZEA-1:0] memout_addra;
wire [ABUSWIDTH-1:0] BUS_ADD_MEM;
assign BUS_ADD_MEM = BUS_ADD - MEM_OFFSET;
assign memout_addra = BUS_ADD_MEM;
wire [OUT_BITS-1:0] SEQ_OUT_MEM;
wire WEA;
assign WEA = BUS_WR && BUS_ADD >=MEM_OFFSET && BUS_ADD < MEM_OFFSET+MEM_BYTES;
ramb_8_to_n #(.SIZE(MEM_BYTES), .WIDTH(OUT_BITS)) mem (
    .clkA(BUS_CLK),
    .clkB(SEQ_CLK),
    .weA(WEA),
    .weB(1'b0),
    .addrA(memout_addra),
    .addrB(memout_addrb),
    .diA(BUS_DATA_IN),
    .doA(BUS_IN_MEM),
    .diB({OUT_BITS{1'b0}}),
    .doB(SEQ_OUT_MEM)
);
wire RST_SYNC;
wire RST_SOFT_SYNC;
cdc_pulse_sync rst_pulse_sync (.clk_in(BUS_CLK), .pulse_in(RST), .clk_out(SEQ_CLK), .pulse_out(RST_SOFT_SYNC));
assign RST_SYNC = RST_SOFT_SYNC || BUS_RST;
wire  START_SYNC_CDC;
wire START_SYNC;
cdc_pulse_sync start_pulse_sync (.clk_in(BUS_CLK), .pulse_in(START), .clk_out(SEQ_CLK), .pulse_out(START_SYNC_CDC));
reg DONE;
wire START_SYNC_PRE;
assign START_SYNC_PRE = (START_SYNC_CDC | (SEQ_EXT_START & CONF_EN_EXT_START));
assign START_SYNC =  START_SYNC_PRE & DONE; //no START if previous not finished
wire [31:0] STOP_BIT;
assign STOP_BIT = CONF_COUNT + CONF_WAIT;
reg [31:0] REPEAT_COUNT;
reg [31:0] REPEAT_NESTED_COUNT;
reg [7:0] dev_cnt;
wire REP_START;
assign REP_START = (out_bit_cnt == STOP_BIT && dev_cnt == CONF_CLK_DIV && (CONF_REPEAT==0 || REPEAT_COUNT < CONF_REPEAT));
wire REP_NESTED_START;
assign REP_NESTED_START = (out_bit_cnt == CONF_NESTED_STOP && dev_cnt == CONF_CLK_DIV && (REPEAT_NESTED_COUNT < CONF_NESTED_REPEAT));
always @(posedge SEQ_CLK)
    if (RST_SYNC)
        out_bit_cnt <= 0;
    else if(START_SYNC)
        out_bit_cnt <= 1;
    else if(REP_START)
        out_bit_cnt <= CONF_REP_START+1;
    else if(REP_NESTED_START)
        out_bit_cnt <= CONF_NESTED_START+1;
    else if(out_bit_cnt == STOP_BIT && dev_cnt == CONF_CLK_DIV)
        out_bit_cnt <= out_bit_cnt;
    else if(out_bit_cnt != 0 && dev_cnt == CONF_CLK_DIV)
        out_bit_cnt <= out_bit_cnt + 1;
always @(posedge SEQ_CLK)
    if (RST_SYNC | START_SYNC | REP_START)
        dev_cnt <= 0;
    else if(out_bit_cnt != 0 && dev_cnt == CONF_CLK_DIV)
        dev_cnt <= 0;
    else if(out_bit_cnt != 0)
        dev_cnt <= dev_cnt + 1;
always @(posedge SEQ_CLK)
    if (RST_SYNC | START_SYNC)
        REPEAT_COUNT <= 1;
    else if(out_bit_cnt == STOP_BIT && dev_cnt == CONF_CLK_DIV && REPEAT_COUNT <= CONF_REPEAT)
        REPEAT_COUNT <= REPEAT_COUNT + 1;
always @(posedge SEQ_CLK)
    if (RST_SYNC | START_SYNC | REP_START)
        REPEAT_NESTED_COUNT <= 1;
    else if(REP_NESTED_START)
        REPEAT_NESTED_COUNT <= REPEAT_NESTED_COUNT + 1;
always @(posedge SEQ_CLK)
    if(RST_SYNC)
        DONE <= 1;
    else if(START_SYNC_PRE)
        DONE <= 0;
    else if(REPEAT_COUNT > CONF_REPEAT & out_bit_cnt == STOP_BIT && dev_cnt == CONF_CLK_DIV)
        DONE <= 1;
always @(posedge SEQ_CLK)
    SEQ_OUT <= SEQ_OUT_MEM;
wire DONE_SYNC;
cdc_pulse_sync done_pulse_sync (.clk_in(SEQ_CLK), .pulse_in(DONE), .clk_out(BUS_CLK), .pulse_out(DONE_SYNC));
wire EXT_START_SYNC;
cdc_pulse_sync ext_start_pulse_sync (.clk_in(SEQ_CLK), .pulse_in(SEQ_EXT_START), .clk_out(BUS_CLK), .pulse_out(EXT_START_SYNC));
always @(posedge BUS_CLK)
    if(RST)
        CONF_DONE <= 1;
    else if(START | (CONF_EN_EXT_START & EXT_START_SYNC))
        CONF_DONE <= 0;
    else if(DONE_SYNC)
        CONF_DONE <= 1;
endmodule