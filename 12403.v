module I2C_v3_30_8 (
    sda_o,
    scl_o,
    sda_i,
    scl_i,
    iclk,
    bclk,
    reset,
    clock,
    scl,
    sda,
    itclk);
    output      sda_o;
    output      scl_o;
    input       sda_i;
    input       scl_i;
    output      iclk;
    output      bclk;
    input       reset;
    input       clock;
    inout       scl;
    inout       sda;
    output      itclk;
          wire  sda_x_wire;
          wire  sda_yfb;
          wire  udb_clk;
          wire  Net_975;
          wire  Net_974;
          wire  Net_973;
          wire  bus_clk;
          wire  Net_972;
          wire  Net_968;
          wire  scl_yfb;
          wire  Net_969;
          wire  Net_971;
          wire  Net_970;
          wire  timeout_clk;
          wire  Net_697;
          wire  Net_1045;
          wire [1:0] Net_1109;
          wire [5:0] Net_643;
          wire  scl_x_wire;
	// Vmux_sda_out (cy_virtualmux_v1_0)
	assign sda_x_wire = Net_643[4];
	cy_isr_v1_0
		#(.int_type(2'b00))
		I2C_IRQ
		 (.int_signal(Net_697));
	// Vmux_interrupt (cy_virtualmux_v1_0)
	assign Net_697 = Net_643[5];
	cy_clock_v1_0
		#(.id("6f2d57bd-b6d0-4115-93da-ded3485bf4ed/be0a0e37-ad17-42ca-b5a1-1a654d736358"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("625000000"),
		  .is_direct(0),
		  .is_digital(1))
		IntClock
		 (.clock_out(Net_970));
    bI2C_v3_30 bI2C_UDB (
        .clock(udb_clk),
        .scl_in(Net_1109[0]),
        .sda_in(Net_1109[1]),
        .sda_out(Net_643[4]),
        .scl_out(Net_643[3]),
        .interrupt(Net_643[5]),
        .reset(reset));
    defparam bI2C_UDB.Mode = 2;
	// Vmux_scl_out (cy_virtualmux_v1_0)
	assign scl_x_wire = Net_643[3];
    OneTerminal OneTerminal_1 (
        .o(Net_969));
    OneTerminal OneTerminal_2 (
        .o(Net_968));
	// Vmux_clock (cy_virtualmux_v1_0)
	assign udb_clk = Net_970;
    assign bclk = bus_clk | Net_973;
    ZeroTerminal ZeroTerminal_1 (
        .z(Net_973));
    assign iclk = udb_clk | Net_974;
    ZeroTerminal ZeroTerminal_2 (
        .z(Net_974));
	// Vmux_scl_in (cy_virtualmux_v1_0)
	assign Net_1109[0] = scl_yfb;
	// Vmux_sda_in (cy_virtualmux_v1_0)
	assign Net_1109[1] = sda_yfb;
	wire [0:0] tmpOE__Bufoe_scl_net;
	cy_bufoe
		Bufoe_scl
		 (.x(scl_x_wire),
		  .y(scl),
		  .oe(tmpOE__Bufoe_scl_net),
		  .yfb(scl_yfb));
	assign tmpOE__Bufoe_scl_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{Net_969} : {Net_969};
	wire [0:0] tmpOE__Bufoe_sda_net;
	cy_bufoe
		Bufoe_sda
		 (.x(sda_x_wire),
		  .y(sda),
		  .oe(tmpOE__Bufoe_sda_net),
		  .yfb(sda_yfb));
	assign tmpOE__Bufoe_sda_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{Net_968} : {Net_968};
	// Vmux_timeout_clock (cy_virtualmux_v1_0)
	assign timeout_clk = udb_clk;
    assign itclk = timeout_clk | Net_975;
    ZeroTerminal ZeroTerminal_3 (
        .z(Net_975));
    assign scl_o = scl_x_wire;
    assign sda_o = sda_x_wire;
endmodule