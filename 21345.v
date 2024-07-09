module generic_dpram(
	// Generic synchronous dual-port RAM interface
	rclk, rrst, rce, oe, raddr, do,
	wclk, wrst, wce, we, waddr, di
);
	// Default address and data buses width
	parameter aw = 5;  // number of bits in address-bus
	parameter dw = 16; // number of bits in data-bus
	// Generic synchronous double-port RAM interface
	// read port
	input           rclk;  // read clock, rising edge trigger
	input           rrst;  // read port reset, active high
	input           rce;   // read port chip enable, active high
	input           oe;	   // output enable, active high
	input  [aw-1:0] raddr; // read address
	output [dw-1:0] do;    // data output
	// write port
	input          wclk;  // write clock, rising edge trigger
	input          wrst;  // write port reset, active high
	input          wce;   // write port chip enable, active high
	input          we;    // write enable, active high
	input [aw-1:0] waddr; // write address
	input [dw-1:0] di;    // data input
	// Module body
`ifdef VENDOR_FPGA
	// Instantiation synthesizeable FPGA memory
	// This code has been tested using LeonardoSpectrum and Synplicity.
	// The code correctly instantiates Altera EABs and Xilinx BlockRAMs.
	reg [dw-1:0] mem [(1<<aw) -1:0]; // instantiate memory
	reg [aw-1:0] ra;                 // register read address
	// read operation
	always @(posedge rclk)
	  if (rce)
	    ra <= #1 raddr;
	assign do = mem[ra];
	// write operation
	always@(posedge wclk)
		if (we && wce)
			mem[waddr] <= #1 di;
`else
`ifdef VENDOR_XILINX
	// Instantiation of FPGA memory:
	// Virtex/Spartan2 BlockRAMs
	xilinx_ram_dp xilinx_ram(
		// read port
		.CLKA(rclk),
		.RSTA(rrst),
		.ENA(rce),
		.ADDRA(raddr),
		.DIA( {dw{1'b0}} ),
		.WEA(1'b0),
		.DOA(do),
		// write port
		.CLKB(wclk),
		.RSTB(wrst),
		.ENB(wce),
		.ADDRB(waddr),
		.DIB(di),
		.WEB(we),
		.DOB()
	);
	defparam
		xilinx_ram.dwidth = dw,
		xilinx_ram.awidth = aw;
`else
`ifdef VENDOR_ALTERA
	// Instantiation of FPGA memory:
	// Altera FLEX/APEX EABs
	altera_ram_dp altera_ram(
		// read port
		.rdclock(rclk),
		.rdclocken(rce),
		.rdaddress(raddr),
		.q(do),
		// write port
		.wrclock(wclk),
		.wrclocken(wce),
		.wren(we),
		.wraddress(waddr),
		.data(di)
	);
	defparam
		altera_ram.dwidth = dw,
		altera_ram.awidth = aw;
`else
`ifdef VENDOR_ARTISAN
	// Instantiation of ASIC memory:
	// Artisan Synchronous Double-Port RAM (ra2sh)
	art_hsdp #(dw, 1<<aw, aw) artisan_sdp(
		// read port
		.qa(do),
		.clka(rclk),
		.cena(~rce),
		.wena(1'b1),
		.aa(raddr),
		.da( {dw{1'b0}} ),
		.oena(~oe),
		// write port
		.qb(),
		.clkb(wclk),
		.cenb(~wce),
		.wenb(~we),
		.ab(waddr),
		.db(di),
		.oenb(1'b1)
	);
`else
`ifdef VENDOR_AVANT
	// Instantiation of ASIC memory:
	// Avant! Asynchronous Two-Port RAM
	avant_atp avant_atp(
		.web(~we),
		.reb(),
		.oeb(~oe),
		.rcsb(),
		.wcsb(),
		.ra(raddr),
		.wa(waddr),
		.di(di),
		.do(do)
	);
`else
`ifdef VENDOR_VIRAGE
	// Instantiation of ASIC memory:
	// Virage Synchronous 2-port R/W RAM
	virage_stp virage_stp(
		// read port
		.CLKA(rclk),
		.MEA(rce_a),
		.ADRA(raddr),
		.DA( {dw{1'b0}} ),
		.WEA(1'b0),
		.OEA(oe),
		.QA(do),
		// write port
		.CLKB(wclk),
		.MEB(wce),
		.ADRB(waddr),
		.DB(di),
		.WEB(we),
		.OEB(1'b1),
		.QB()
	);
`else
	// Generic dual-port synchronous RAM model
	// Generic RAM's registers and wires
	reg	[dw-1:0]	mem [(1<<aw)-1:0]; // RAM content
	reg	[dw-1:0]	do_reg;            // RAM data output register
	// Data output drivers
	assign do = (oe & rce) ? do_reg : {dw{1'bz}};
	// read operation
	always @(posedge rclk)
		if (rce)
          		do_reg <= #1 (we && (waddr==raddr)) ? {dw{1'b x}} : mem[raddr];
	// write operation
	always @(posedge wclk)
		if (wce && we)
			mem[waddr] <= #1 di;
	// Task prints range of memory
	// *** Remember that tasks are non reentrant, don't call this task in parallel for multiple instantiations.
	task print_ram;
	input [aw-1:0] start;
	input [aw-1:0] finish;
	integer rnum;
  	begin
    		for (rnum=start;rnum<=finish;rnum=rnum+1)
      			$display("Addr %h = %h",rnum,mem[rnum]);
  	end
	endtask
`endif // !VENDOR_VIRAGE
`endif // !VENDOR_AVANT
`endif // !VENDOR_ARTISAN
`endif // !VENDOR_ALTERA
`endif // !VENDOR_XILINX
`endif // !VENDOR_FPGA
endmodule