module  ------- //
    wire I2C_CLK;
    clock_divider #(
    .DIVISOR(1500)
    ) i_clock_divisor_spi (
        .CLK(BUS_CLK),
        .RESET(1'b0),
        .CE(),
        .CLOCK(I2C_CLK)
    );
    i2c
    #(
        .BASEADDR(I2C_BASEADDR),
        .HIGHADDR(I2C_HIGHADDR),
        .ABUSWIDTH(ABUSWIDTH),
        .MEM_BYTES(64)
    )  i_i2c
    (
        .BUS_CLK(BUS_CLK),
        .BUS_RST(BUS_RST),
        .BUS_ADD(BUS_ADD),
        .BUS_DATA(BUS_DATA[7:0]),
        .BUS_RD(BUS_RD),
        .BUS_WR(BUS_WR),
        .I2C_CLK(I2C_CLK),
        .I2C_SDA(SDA),
        .I2C_SCL(SCL)
    );
    wire ARB_READY_OUT,ARB_WRITE_OUT;
    wire [31:0]ARB_DATA_OUT;
    wire FIFO_FULL,FIFO_NEAR_FULL;
    wire [31:0] cdc_data_out;
    wire full_32to8, cdc_fifo_empty;
    cdc_syncfifo #(.DSIZE(32), .ASIZE(3)) cdc_syncfifo_i
    (
        .rdata(cdc_data_out),
        .wfull(FIFO_FULL),
        .rempty(cdc_fifo_empty),
        .wdata(ARB_DATA_OUT),
        .winc(ARB_WRITE_OUT), .wclk(BUS_CLK), .wrst(BUS_RST),
        .rinc(!full_32to8), .rclk(BUS_CLK), .rrst(BUS_RST)
    );
    assign ARB_READY_OUT = !FIFO_FULL;
    wire FIFO_EMPTY, FIFO_FULL;
    fifo_32_to_8 #(.DEPTH(256*1024)) i_data_fifo (
        .RST(BUS_RST),
        .CLK(BUS_CLK),
        .WRITE(!cdc_fifo_empty),
        .READ(TCP_TX_WR),
        .DATA_IN(cdc_data_out),
        .FULL(full_32to8),
        .EMPTY(FIFO_EMPTY),
        .DATA_OUT(TCP_TX_DATA)
    );
    assign TCP_TX_WR = !TCP_TX_FULL && !FIFO_EMPTY;
wire LEMO_RX2;
assign LEMO_RX2 = 1'b0;
assign LED[7]= 1'b0;
assign LED[6]= 1'b1;
assign LED[5]= 1'b0;
monopix_core i_monopix_core(
    //local bus
    .BUS_CLK(BUS_CLK),
    .BUS_DATA(BUS_DATA),
    .BUS_ADD(BUS_ADD),
    .BUS_RD(BUS_RD),
    .BUS_WR(BUS_WR),
    .BUS_RST(BUS_RST),
    //clocks
    .CLK8(CLK8),
    .CLK40(CLK40),
    .CLK16(CLK16),
    .CLK160(CLK160),
    .CLK320(CLK320),
    //fifo
    .ARB_READY_OUT(ARB_READY_OUT),
    .ARB_WRITE_OUT(ARB_WRITE_OUT),
    .ARB_DATA_OUT(ARB_DATA_OUT),
    .FIFO_FULL(FIFO_FULL),
    .FIFO_NEAR_FULL(FIFO_NEAR_FULL),
    //LED
    .LED(LED[4:0]),
    .LEMO_RX({LEMO_RX2,LEMO_RX}),
    .LEMO_TX({INJECTION_OUT,LEMO_TX}), // TX[0] == RJ45 trigger clock output, TX[1] == RJ45 busy output
    .RJ45_RESET(RJ45_RESET),
    .RJ45_TRIGGER(RJ45_TRIGGER),
    .SR_OUT(SR_OUT),   //DIN4
    .SR_IN(SR_IN),     //DOUT11
    .LDPIX(LDPIX),     //DOUT15
    .CKCONF(CKCONF),   //DOUT10
    .LDDAC(LDDAC),     //DOUT12
    .SR_EN(SR_EN),     //DOUT13
    .RESET(RESET),     //DOUT14
    .INJECTION(INJECTION),
    .MONITOR(MONITOR), //DIN1
    .CLK_BX(CLK_BX),   //DOUT1
    .READ(READ),       //DOUT2
    .FREEZE(FREEZE),   //DOUT3
    .nRST(nRST),       //DOUT4
    .EN_TEST_PATTERN(EN_TEST_PATTERN),  //DOUT5
    .RST_GRAY(RST_GRAY),                //DOUT6
    .EN_DRIVER(EN_DRIVER),              //DOUT7
    .EN_DATA_CMOS(EN_DATA_CMOS),        //DOUT8
    .CLK_OUT(CLK_OUT), //DOUT9
    .TOKEN(TOKEN),     //DIN2
    .DATA(DATA),       //DIN0
    .DATA_LVDS(DATA_LVDS),              //DIN8_LVDS0
    .INJECTION_IN(INJECTION_IN),
    .DEBUG(DEBUG)
);
endmodule