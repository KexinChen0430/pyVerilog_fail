module vna_dsp
  (
   output [`NLANES-1:0] pcie_txp,
   output [`NLANES-1:0] pcie_txn,
   input [`NLANES-1:0] 	pcie_rxp,
   input [`NLANES-1:0] 	pcie_rxn,
   input 		pcie_refclk_p,
   input 		pcie_refclk_n,
   input 		pcie_rst_n,
   // SPI configuration flash, sck is to STARTUP_E2
   output 		cflash_sdi,
   output 		cflash_cs,
   input 		cflash_sdo,
   output [1:0] 	cflash_high,
   output reg [3:0] 	led = 4'h5
   );
   wire 	    clock;
   reg [63:0] 	    tpc_data = 0;
   reg 		    tpc_write = 0;
   wire [63:0] 	    fpc_data;
   reg 		    fpc_read = 1'b0;
   wire [7:0] 	    fifo_ready, fifo_reset;
   wire [63:0] 	    seq_fpc_data, seq_tpc_data;
   wire 	    seq_read, seq_write;
   reg [63:0] 	    count = 0;
   reg 		    count_write = 0;
   reg 		    null_read = 0;
   assign cflash_high = 2'b11;
   wire 	    cflash_sck;
`ifdef USE_GT_DRP
   wire [9*`NLANES-1:0] gt_drp_address;
   wire [`NLANES-1:0] 	gt_drp_en, gt_drp_ready, gt_drp_we;
   wire [16*`NLANES-1:0] gt_drp_di, gt_drp_do;
   wire 		 gt_drp_clock;
   wire [16:0] 		 seq_gtdrpdata[`NLANES-1:0];
`endif
   wire 	    seq_rvalid, seq_wvalid;
   wire [15:0] 	    seq_address;
   wire [63:0] 	    seq_wdata;
   reg [63:0] 	    seq_rdata0, seq_rdata1;
   reg [63:0] 	    seq_test;
   wire [7:0] 	    seq_spidata;
   wire [16:0] 	    seq_xadcdata;
   hififo_pcie hififo
     (.pci_exp_txp(pcie_txp),
      .pci_exp_txn(pcie_txn),
      .pci_exp_rxp(pcie_rxp),
      .pci_exp_rxn(pcie_rxn),
      .sys_clk_p(pcie_refclk_p),
      .sys_clk_n(pcie_refclk_n),
      .sys_rst_n(pcie_rst_n),
      .clock(clock),
`ifdef USE_GT_DRP
      .gt_drp_address(gt_drp_address),
      .gt_drp_en(gt_drp_en),
      .gt_drp_di(gt_drp_di),
      .gt_drp_do(gt_drp_do),
      .gt_drp_ready(gt_drp_ready),
      .gt_drp_we(gt_drp_we),
      .gt_drp_clock(gt_drp_clock),
`endif
      .fifo_clock({8{clock}}),
      .fifo_reset(fifo_reset),
      .fifo_ready(fifo_ready),
      .fifo_rw({1'b1,
		count_write,
		seq_write,
		tpc_write,
		fifo_ready[3],
		null_read,
		seq_read,
		fpc_read}),
      .fifo_data_0(fpc_data),
      .fifo_data_1(seq_fpc_data),
      .fifo_data_2(),
      .fifo_data_3(),
      .fifo_data_4(tpc_data),
      .fifo_data_5(seq_tpc_data),
      .fifo_data_6(count),
      .fifo_data_7(64'h0)
      );
   sequencer #(.ABITS(16)) sequencer
     (.clock(clock),
      .reset(fifo_reset[1]),
      .fpc_read(seq_read),
      .fpc_valid(fifo_ready[1]),
      .fpc_data(seq_fpc_data),
      .tpc_ready(fifo_ready[5]),
      .tpc_write(seq_write),
      .tpc_data(seq_tpc_data),
      .rvalid(seq_rvalid),
      .wvalid(seq_wvalid),
      .address(seq_address),
      .wdata(seq_wdata),
      .rdata(seq_rdata1),
      .status(16'h0)
      );
   xadc xadc
     (
      .clock(clock),
      .write(seq_wvalid && (seq_address == 5)),
      .din(seq_wdata),
      .dout(seq_xadcdata)
      );
`ifdef USE_GT_DRP
   genvar 	    i;
   generate
      for (i = 0; i < `NLANES; i = i+1) begin: gtdrp
	 gt_drp gt_drp_n
	       (
		.clock(clock),
		.drp_clock(gt_drp_clock),
		.write(seq_wvalid && (seq_address == 8+i)),
		.din(seq_wdata),
		.dout(seq_gtdrpdata[i]),
		.drp_address(gt_drp_address[8+9*i:9*i]),
		.drp_en(gt_drp_en[i]),
		.drp_di(gt_drp_di[15+16*i:16*i]),
		.drp_do(gt_drp_do[15+16*i:16*i]),
		.drp_ready(gt_drp_ready[i]),
		.drp_we(gt_drp_we[i])
		);
      end
   endgenerate
`endif
   spi_8bit_rw spi_cflash
     (
      .clock(clock),
      .write(seq_wvalid && (seq_address == 4)),
      .din(seq_wdata[8:0]),
      .dout(seq_spidata),
      .cs(cflash_cs),
      .sck(cflash_sck),
      .mosi(cflash_sdi),
      .miso(cflash_sdo));
   `ifndef SIM
   (*keep="TRUE"*) STARTUPE2 STARTUPE2
	  (
	   // outputs
	   .CFGCLK(),             // Configuration main clock output
	   .CFGMCLK(),            // Configuration internal oscillator
	   .EOS(),                // End Of Startup.
	   .PREQ(),               // PROGRAM request to fabric output
	   // inputs
	   .CLK(1'b0),            // user start-up clock input
	   .GSR(1'b0),            // Global Set/Reset input
	   .GTS(1'b0),            // Global 3-state input
	   .KEYCLEARB(1'b0),      // Clear AES Key
	   .PACK(1'b0),           // PROGRAM acknowledge input
	   .USRCCLKO(cflash_sck), // User CCLK input
	   .USRCCLKTS(1'b0),      // User CCLK 3-state enable input
	   .USRDONEO(1'b0),       // User DONE pin output control
	   .USRDONETS(1'b0)       // User DONE 3-state enable output
	   );
   `endif
   always @ (posedge clock)
     begin
	if(seq_wvalid && seq_address == 0)
	  seq_test <= seq_wdata;
	seq_rdata1 <= seq_rdata0;
	if(seq_rvalid)
	  case(seq_address)
	    0: seq_rdata0 <= seq_test;
	    1: seq_rdata0 <= 64'd1;
	    2: seq_rdata0 <= 64'd2;
	    3: seq_rdata0 <= 64'd3;
	    4: seq_rdata0 <= seq_spidata;
	    5: seq_rdata0 <= seq_xadcdata;
   `ifdef USE_GT_DRP
	    8: seq_rdata0 <= seq_gtdrpdata[0];
	    9: seq_rdata0 <= seq_gtdrpdata[1];
	    10: seq_rdata0 <= seq_gtdrpdata[2];
	    11: seq_rdata0 <= seq_gtdrpdata[3];
   `endif
	    default: seq_rdata0 <= seq_address;
	  endcase
	count <= fifo_reset[6] ? 1'b0 : count + fifo_ready[6];
	count_write <= fifo_ready[6];
	if(fifo_ready[0])
	  led[3:0] <= fpc_data[3:0];
	fpc_read <= fifo_ready[4];
	tpc_write <= fifo_ready[0] && fpc_read;
	tpc_data <= fpc_data;
	null_read <= fifo_ready[2];
     end
   initial
     begin
	$dumpfile("dump.vcd");
	$dumpvars(0);
     end
endmodule