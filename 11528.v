module SPI_Master_v2_40_4 (
    clock,
    reset,
    miso,
    sclk,
    mosi,
    ss,
    rx_interrupt,
    sdat,
    tx_interrupt);
    input       clock;
    input       reset;
    input       miso;
    output      sclk;
    output      mosi;
    output      ss;
    output      rx_interrupt;
    inout       sdat;
    output      tx_interrupt;
    parameter BidirectMode = 0;
    parameter HighSpeedMode = 0;
    parameter NumberOfDataBits = 8;
    parameter ShiftDir = 0;
          wire  Net_257;
          wire  Net_273;
          wire  Net_274;
          wire  Net_244;
          wire  Net_239;
          wire  Net_253;
          wire  Net_161;
          wire  Net_276;
	// VirtualMux_1 (cy_virtualmux_v1_0)
	assign Net_276 = Net_239;
	cy_clock_v1_0
		#(.id("e4da4994-29f1-40ba-bb7d-e88b51dcb21f/426fcbe0-714d-4404-8fa8-581ff40c30f1"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("500000000"),
		  .is_direct(0),
		  .is_digital(1))
		IntClock
		 (.clock_out(Net_239));
    B_SPI_Master_v2_40 BSPIM (
        .sclk(sclk),
        .ss(ss),
        .miso(Net_244),
        .clock(Net_276),
        .reset(Net_273),
        .rx_interpt(rx_interrupt),
        .tx_enable(Net_253),
        .mosi(mosi),
        .tx_interpt(tx_interrupt));
    defparam BSPIM.BidirectMode = 0;
    defparam BSPIM.HighSpeedMode = 0;
    defparam BSPIM.ModeCPHA = 0;
    defparam BSPIM.ModePOL = 0;
    defparam BSPIM.NumberOfDataBits = 8;
    defparam BSPIM.ShiftDir = 0;
	// VirtualMux_2 (cy_virtualmux_v1_0)
	assign Net_244 = miso;
	// VirtualMux_3 (cy_virtualmux_v1_0)
	assign Net_273 = Net_274;
    ZeroTerminal ZeroTerminal_1 (
        .z(Net_274));
endmodule