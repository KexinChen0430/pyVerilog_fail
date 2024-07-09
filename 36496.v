module I2C_v3_30_2 (
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
	assign sda_x_wire = Net_643[1];
	cy_isr_v1_0
		#(.int_type(2'b00))
		I2C_IRQ
		 (.int_signal(Net_697));
    cy_psoc3_i2c_v1_0 I2C_FF (
        .clock(bus_clk),
        .scl_in(Net_1109[0]),
        .sda_in(Net_1109[1]),
        .scl_out(Net_643[0]),
        .sda_out(Net_643[1]),
        .interrupt(Net_643[2]));
    defparam I2C_FF.use_wakeup = 0;
	// Vmux_interrupt (cy_virtualmux_v1_0)
	assign Net_697 = Net_643[2];
	// Vmux_scl_out (cy_virtualmux_v1_0)
	assign scl_x_wire = Net_643[0];
    OneTerminal OneTerminal_1 (
        .o(Net_969));
    OneTerminal OneTerminal_2 (
        .o(Net_968));
	// Vmux_clock (cy_virtualmux_v1_0)
	assign udb_clk = clock;
	cy_clock_v1_0
		#(.id("1e002100-3386-4091-bd79-32e3a865aae0/966ec24e-f954-4ab8-95f3-fa8b01a2dc28/5ece924d-20ba-480e-9102-bc082dcdd926"),
		  .source_clock_id("75C2148C-3656-4d8a-846D-0CAE99AB6FF7"),
		  .divisor(0),
		  .period("0"),
		  .is_direct(1),
		  .is_digital(1))
		BusClock
		 (.clock_out(bus_clk));
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
	assign timeout_clk = clock;
    assign itclk = timeout_clk | Net_975;
    ZeroTerminal ZeroTerminal_3 (
        .z(Net_975));
    assign scl_o = scl_x_wire;
    assign sda_o = sda_x_wire;
endmodule