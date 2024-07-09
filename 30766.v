module still needs to be addressed
reg [ABUSWIDTH-1:0]  PREV_BUS_ADD;
always @ (posedge BUS_CLK) begin
    if(BUS_RD) begin
        PREV_BUS_ADD <= BUS_ADD;
    end
end
always @(*) begin
    if(PREV_BUS_ADD < 16)
        BUS_DATA_OUT = BUS_DATA_OUT_REG;
    else if(PREV_BUS_ADD < 16+MEM_BYTES)
        BUS_DATA_OUT = BUS_IN_MEM;
    else if(PREV_BUS_ADD < 16+MEM_BYTES+MEM_BYTES)
        BUS_DATA_OUT = BUS_OUT_MEM;
    else
        BUS_DATA_OUT = 8'hxx;
end
reg [32:0] out_bit_cnt;
wire [13:0] memout_addrb;
assign memout_addrb = out_bit_cnt;
wire [10:0] memout_addra;
assign memout_addra = (BUS_ADD-16);
reg [7:0] BUS_DATA_IN_IB;
wire [7:0] BUS_IN_MEM_IB;
wire [7:0] BUS_OUT_MEM_IB;
integer i;
always @(*) begin
    for(i=0;i<8;i=i+1) begin
        BUS_DATA_IN_IB[i] = BUS_DATA_IN[7-i];
        BUS_IN_MEM[i] = BUS_IN_MEM_IB[7-i];
        BUS_OUT_MEM[i] = BUS_OUT_MEM_IB[7-i];
    end
end
wire SDI_MEM;
blk_mem_gen_8_to_1_2k memout(
    .CLKA(BUS_CLK),
    .CLKB(SPI_CLK),
    .DOUTA(BUS_IN_MEM_IB),
    .DOUTB(SDI_MEM),
    .WEA(BUS_WR && BUS_ADD >=16 && BUS_ADD < 16+MEM_BYTES),
    .WEB(1'b0),
    .ADDRA(memout_addra),
    .ADDRB(memout_addrb),
    .DINA(BUS_DATA_IN_IB),
    .DINB(1'b0)
);
wire [10:0] ADDRA_MIN;
assign ADDRA_MIN = (BUS_ADD-16-MEM_BYTES);
wire [13:0] ADDRB_MIN;
assign ADDRB_MIN = out_bit_cnt-1;
reg SEN_INT;
blk_mem_gen_8_to_1_2k memin(
    .CLKA(BUS_CLK),
    .CLKB(SPI_CLK),
    .DOUTA(BUS_OUT_MEM_IB),
    .DOUTB(),
    .WEA(1'b0),
    .WEB(SEN_INT),
    .ADDRA(ADDRA_MIN),
    .ADDRB(ADDRB_MIN),
    .DINA(BUS_DATA_IN_IB),
    .DINB(SDO)
);
wire RST_SYNC;
wire RST_SOFT_SYNC;
cdc_pulse_sync rst_pulse_sync (.clk_in(BUS_CLK), .pulse_in(RST), .clk_out(SPI_CLK), .pulse_out(RST_SOFT_SYNC));
assign RST_SYNC = RST_SOFT_SYNC || BUS_RST;
wire START_SYNC;
cdc_pulse_sync start_pulse_sync (.clk_in(BUS_CLK), .pulse_in(START), .clk_out(SPI_CLK), .pulse_out(START_SYNC));
wire EXT_START_PULSE;
reg [2:0] EXT_START_FF;
always @(posedge SPI_CLK) // first stage
begin
    EXT_START_FF[0] <= EXT_START;
    EXT_START_FF[1] <= EXT_START_FF[0];
    EXT_START_FF[2] <= EXT_START_FF[1];
end
assign EXT_START_PULSE = !EXT_START_FF[2] & EXT_START_FF[1];
wire [32:0] STOP_BIT;
assign STOP_BIT = CONF_BIT_OUT + CONF_WAIT;
reg [31:0] REPEAT_COUNT;
wire REP_START;
assign REP_START = (out_bit_cnt == STOP_BIT && (CONF_REPEAT==0 || REPEAT_COUNT < CONF_REPEAT));
reg REP_START_DLY;
always @ (posedge SPI_CLK)
    REP_START_DLY <= REP_START;
always @ (posedge SPI_CLK)
    if (RST_SYNC)
        SEN_INT <= 0;
    else if(START_SYNC || (EXT_START_PULSE && CONF_EN) || REP_START_DLY)
        SEN_INT <= 1;
    else if(out_bit_cnt == CONF_BIT_OUT)
        SEN_INT <= 0;
always @ (posedge SPI_CLK)
    if (RST_SYNC)
        out_bit_cnt <= 0;
    else if(START_SYNC || (EXT_START_PULSE && CONF_EN))
        out_bit_cnt <= 1;
    else if(out_bit_cnt == STOP_BIT)
        out_bit_cnt <= 0;
    //else if(out_bit_cnt == CONF_BIT_OUT & REPEAT_COUNT == CONF_REPEAT & CONF_REPEAT!=0)
    //    out_bit_cnt <= 0;
    else if(REP_START_DLY)
        out_bit_cnt <= 1;
    else if(out_bit_cnt != 0)
        out_bit_cnt <= out_bit_cnt + 1;
always @ (posedge SPI_CLK)
    if (RST_SYNC || START_SYNC || (EXT_START_PULSE && CONF_EN))
        REPEAT_COUNT <= 1;
    else if(out_bit_cnt == STOP_BIT)
        REPEAT_COUNT <= REPEAT_COUNT + 1;
reg [1:0] sync_ld;
always @(posedge SPI_CLK) begin
    sync_ld[0] <= SEN_INT;
    sync_ld[1] <= sync_ld[0];
end
always @(posedge SPI_CLK)
    SLD <= (sync_ld[1]==1 && sync_ld[0]==0);
wire DONE = out_bit_cnt == STOP_BIT && REPEAT_COUNT >= CONF_REPEAT;
wire DONE_SYNC, EXT_START_PULSE_SYNC;
cdc_pulse_sync done_pulse_sync (.clk_in(SPI_CLK), .pulse_in(DONE), .clk_out(BUS_CLK), .pulse_out(DONE_SYNC));
cdc_pulse_sync done_pulse_ext_start (.clk_in(SPI_CLK), .pulse_in(EXT_START_PULSE), .clk_out(BUS_CLK), .pulse_out(EXT_START_PULSE_SYNC));
always @(posedge BUS_CLK)
    if(RST)
        CONF_DONE <= 1;
    else if(START || (EXT_START_PULSE_SYNC && CONF_EN))
        CONF_DONE <= 0;
    else if(DONE_SYNC)
        CONF_DONE <= 1;
CG_MOD_pos icg2(.ck_in(SPI_CLK), .enable(SEN), .ck_out(SCLK));
always @(negedge SPI_CLK)
    SDI <= SDI_MEM & SEN_INT;
always @(negedge SPI_CLK)
    SEN <= SEN_INT;
endmodule