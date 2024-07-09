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
i2c #(
    .BASEADDR(I2C_BASEADDR),
    .HIGHADDR(I2C_HIGHADDR),
    .ABUSWIDTH(ABUSWIDTH),
    .MEM_BYTES(64)
) i_i2c (
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
endmodule