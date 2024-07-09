module or1200_spram_512x20(
`ifdef OR1200_BIST
	// RAM BIST
	mbist_si_i, mbist_so_o, mbist_ctrl_i,
`endif
	// Generic synchronous single-port RAM interface
	clk, rst, ce, we, oe, addr, di, doq
);
// Default address and data buses width
//aw was set to 9 which is not consistent with other parameters.
parameter aw = `OR1200_DCTAG;
//dw was set to 20 instead of using the globla settings. Not sure why
parameter dw = `OR1200_DCTAG_W;
`ifdef OR1200_BIST
// RAM BIST
input mbist_si_i;
input [`OR1200_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;
output mbist_so_o;
`endif
// Generic synchronous single-port RAM interface
input			clk;	// Clock
input			rst;	// Reset
input			ce;	// Chip enable input
input			we;	// Write enable input
input			oe;	// Output enable input
input 	[aw-1:0]	addr;	// address bus inputs
input	[dw-1:0]	di;	// input data bus
output	[dw-1:0]	doq;	// output data bus
// Internal wires and registers
`ifdef OR1200_XILINX_RAMB4
wire	[3:0]		unconnected;
`else
`ifdef OR1200_XILINX_RAMB16
wire	[11:0]		unconnected;
reg     [dw-1:0] di_reg;
reg     [aw-1:0] addr_reg;
reg [dw-1:0] ram [(2**aw)-1:0];
reg [dw-1:0]	dout;
`endif // !OR1200_XILINX_RAMB16
`endif // !OR1200_XILINX_RAMB4
`ifdef OR1200_ARTISAN_SSP
`else
`ifdef OR1200_VIRTUALSILICON_SSP
`else
`ifdef OR1200_BIST
assign mbist_so_o = mbist_si_i;
`endif
`endif
`endif
`ifdef OR1200_ARTISAN_SSP
// Instantiation of ASIC memory:
// Artisan Synchronous Single-Port RAM (ra1sh)
`ifdef UNUSED
art_hssp_512x20 #(dw, 1<<aw, aw) artisan_ssp(
`else
`ifdef OR1200_BIST
art_hssp_512x20_bist artisan_ssp(
`else
art_hssp_512x20 artisan_ssp(
`endif
`endif
`ifdef OR1200_BIST
	// RAM BIST
	.mbist_si_i(mbist_si_i),
	.mbist_so_o(mbist_so_o),
	.mbist_ctrl_i(mbist_ctrl_i),
`endif
	.CLK(clk),
	.CEN(~ce),
	.WEN(~we),
	.A(addr),
	.D(di),
	.OEN(~oe),
	.Q(doq)
);
`else
`ifdef OR1200_AVANT_ATP
// Instantiation of ASIC memory:
// Avant! Asynchronous Two-Port RAM
avant_atp avant_atp(
	.web(~we),
	.reb(),
	.oeb(~oe),
	.rcsb(),
	.wcsb(),
	.ra(addr),
	.wa(addr),
	.di(di),
	.doq(doq)
);
`else
`ifdef OR1200_VIRAGE_SSP
// Instantiation of ASIC memory:
// Virage Synchronous 1-port R/W RAM
virage_ssp virage_ssp(
	.clk(clk),
	.adr(addr),
	.d(di),
	.we(we),
	.oe(oe),
	.me(ce),
	.q(doq)
);
`else
`ifdef OR1200_VIRTUALSILICON_SSP
// Instantiation of ASIC memory:
// Virtual Silicon Single-Port Synchronous SRAM
`ifdef UNUSED
vs_hdsp_512x20 #(1<<aw, aw-1, dw-1) vs_ssp(
`else
`ifdef OR1200_BIST
vs_hdsp_512x20_bist vs_ssp(
`else
vs_hdsp_512x20 vs_ssp(
`endif
`endif
`ifdef OR1200_BIST
	// RAM BIST
	.mbist_si_i(mbist_si_i),
	.mbist_so_o(mbist_so_o),
	.mbist_ctrl_i(mbist_ctrl_i),
`endif
	.CK(clk),
	.ADR(addr),
	.DI(di),
	.WEN(~we),
	.CEN(~ce),
	.OEN(~oe),
	.DOUT(doq)
);
`else
`ifdef OR1200_XILINX_RAMB4
// Instantiation of FPGA memory:
// Virtex/Spartan2
// Block 0
RAMB4_S8 ramb4_s8_0(
	.CLK(clk),
	.RST(rst),
	.ADDR(addr),
	.DI(di[7:0]),
	.EN(ce),
	.WE(we),
	.DO(doq[7:0])
);
// Block 1
RAMB4_S8 ramb4_s8_1(
	.CLK(clk),
	.RST(rst),
	.ADDR(addr),
	.DI(di[15:8]),
	.EN(ce),
	.WE(we),
	.DO(doq[15:8])
);
// Block 2
RAMB4_S8 ramb4_s8_2(
	.CLK(clk),
	.RST(rst),
	.ADDR(addr),
	.DI({4'b0000, di[19:16]}),
	.EN(ce),
	.WE(we),
	.DO({unconnected, doq[19:16]})
);
`else
`ifdef OR1200_XILINX_RAMB16
// Instantiation of FPGA memory:
// Virtex4/Spartan3E
// Added By Nir Mor
//convert to an inferrend ram
/*
RAMB16_S36 ramb16_s36(
	.CLK(clk),
	.SSR(rst),
	.ADDR(addr),
	.DI({12'h000,di}),
	.DIP(4'h0),
	.EN(ce),
	.WE(we),
	.DO({unconnected,doq}),
	.DOP()
);
*/
 always @(posedge clk)
      if (we)
         di_reg <= di;
always @(posedge clk)
         addr_reg <= addr;
assign doq = dout;
 always @(posedge clk)
      if (we)
         ram[addr_reg] <= di_reg;
   generate
      begin: dist_ram
         reg [dw-1:0] ram_out;
         always @(posedge clk)
               dout <= ram[addr_reg];
//         always @*
//            ram_out = ram[addr_reg];
      end
   endgenerate
`else
`ifdef OR1200_ALTERA_LPM
// Instantiation of FPGA memory:
// Altera LPM
// Added By Jamil Khatib
wire    wr;
assign  wr = ce & we;
initial $display("Using Altera LPM.");
lpm_ram_dq lpm_ram_dq_component (
        .address(addr),
        .inclock(clk),
        .outclock(clk),
        .data(di),
        .we(wr),
        .q(doq)
);
defparam lpm_ram_dq_component.lpm_width = dw,
        lpm_ram_dq_component.lpm_widthad = aw,
        lpm_ram_dq_component.lpm_indata = "REGISTERED",
        lpm_ram_dq_component.lpm_address_control = "REGISTERED",
        lpm_ram_dq_component.lpm_outdata = "UNREGISTERED",
        lpm_ram_dq_component.lpm_hint = "USE_EAB=ON";
        // examplar attribute lpm_ram_dq_component NOOPT TRUE
`else
// Generic single-port synchronous RAM model
// Generic RAM's registers and wires
reg	[dw-1:0]	mem [(1<<aw)-1:0];	// RAM content
reg	[aw-1:0]	addr_reg;		// RAM address register
// Data output drivers
assign doq = (oe) ? mem[addr_reg] : {dw{1'b0}};
// RAM address register
always @(posedge clk or posedge rst)
	if (rst)
		addr_reg <= #1 {aw{1'b0}};
	else if (ce)
		addr_reg <= #1 addr;
// RAM write
always @(posedge clk)
	if (ce && we)
		mem[addr] <= #1 di;
`endif	// !OR1200_ALTERA_LPM
`endif	// !OR1200_XILINX_RAMB16
`endif	// !OR1200_XILINX_RAMB4
`endif	// !OR1200_VIRTUALSILICON_SSP
`endif	// !OR1200_VIRAGE_SSP
`endif	// !OR1200_AVANT_ATP
`endif	// !OR1200_ARTISAN_SSP
endmodule