module routes these out on the board.
   // So for now just connect directly to the internals here.
   assign spi0_sck_o = dut.spi0_sck_o;
   assign dut.spi0_miso_i = spi0_miso_i;
   // SPI flash memory - M25P16 compatible SPI protocol
   AT26DFxxx
     #(.MEMSIZE(2048*1024)) // 2MB flash on ML501
     spi0_flash
     (// Outputs
      .SO					(spi0_miso_i),
      // Inputs
      .CSB					(spi0_ss_o),
      .SCK					(spi0_sck_o),
      .SI					(spi0_mosi_o),
      .WPB					(1'b1)
      );
`endif //  `ifdef SPI0
`ifdef ETH0
   /* TX/RXes packets and checks them, enabled when ethernet MAC is */
 `include "eth_stim.v"
   eth_phy eth_phy0
     (
      // Outputs
      .mtx_clk_o			(mtx_clk_o),
      .mrx_clk_o			(mrx_clk_o),
      .mrxd_o				(mrxd_o[3:0]),
      .mrxdv_o				(mrxdv_o),
      .mrxerr_o				(mrxerr_o),
      .mcoll_o				(mcoll_o),
      .mcrs_o				(mcrs_o),
      .link_o                           (),
      .speed_o                          (),
      .duplex_o                         (),
      .smii_clk_i                       (1'b0),
      .smii_sync_i                      (1'b0),
      .smii_rx_o                        (),
      // Inouts
      .md_io				(eth0_md_pad_io),
      // Inputs
 `ifndef ETH0_PHY_RST
      // If no reset out from the design, hook up to the board's active low rst
      .m_rst_n_i			(rst_n),
 `else
      .m_rst_n_i			(ethphy_rst_n),
 `endif
      .mtxd_i				(ethphy_mii_tx_d[3:0]),
      .mtxen_i				(ethphy_mii_tx_en),
      .mtxerr_i				(ethphy_mii_tx_err),
      .mdc_i				(eth0_mdc_pad_o));
`endif //  `ifdef ETH0
`ifdef XILINX_SSRAM
   wire [18:0] 		     sram_a;
   wire [3:0] 		     dqp;
   assign sram_a[18:0] = sram_flash_addr[19:1];
   wire 		     sram_ce1b, sram_ce2, sram_ce3b;
   assign sram_ce1b = 1'b0;
   assign sram_ce2 = 1'b1;
   assign sram_ce3b = 1'b0;
   assign sram_clk_fb = sram_clk;
   cy7c1354 ssram0
     (
      // Inouts
      // This model puts each parity bit after each byte, but the ML501's part
      // doesn't, so we wire up the data bus like so.
      .d				({dqp[3],sram_flash_data[31:24],
					  dqp[2],sram_flash_data[23:16],
					  dqp[1],sram_flash_data[15:8],
					  dqp[0],sram_flash_data[7:0]}),
      // Inputs
      .clk				(sram_clk),
      .we_b				(sram_flash_we_n),
      .adv_lb				(sram_adv_ld_n),
      .ce1b				(sram_ce1b),
      .ce2				(sram_ce2),
      .ce3b				(sram_ce3b),
      .oeb				(sram_flash_oe_n),
      .cenb				(sram_cen),
      .mode				(sram_mode),
      .bws				(sram_bw),
      .a				(sram_a));
`endif
`ifdef XILINX_DDR2
 `ifndef GATE_SIM
   defparam dut.xilinx_ddr2_0.xilinx_ddr2_if0.ddr2_mig0.SIM_ONLY = 1;
 `endif
   always @( * ) begin
      ddr2_ck_sdram        <=  #(TPROP_PCB_CTRL) ddr2_ck_fpga;
      ddr2_ck_n_sdram      <=  #(TPROP_PCB_CTRL) ddr2_ck_n_fpga;
      ddr2_a_sdram    <=  #(TPROP_PCB_CTRL) ddr2_a_fpga;
      ddr2_ba_sdram         <=  #(TPROP_PCB_CTRL) ddr2_ba_fpga;
      ddr2_ras_n_sdram      <=  #(TPROP_PCB_CTRL) ddr2_ras_n_fpga;
      ddr2_cas_n_sdram      <=  #(TPROP_PCB_CTRL) ddr2_cas_n_fpga;
      ddr2_we_n_sdram       <=  #(TPROP_PCB_CTRL) ddr2_we_n_fpga;
      ddr2_cs_n_sdram       <=  #(TPROP_PCB_CTRL) ddr2_cs_n_fpga;
      ddr2_cke_sdram        <=  #(TPROP_PCB_CTRL) ddr2_cke_fpga;
      ddr2_odt_sdram        <=  #(TPROP_PCB_CTRL) ddr2_odt_fpga;
      ddr2_dm_sdram_tmp     <=  #(TPROP_PCB_DATA) ddr2_dm_fpga;//DM signal generation
   end // always @ ( * )
   // Model delays on bi-directional BUS
   genvar dqwd;
   generate
      for (dqwd = 0;dqwd < DQ_WIDTH;dqwd = dqwd+1) begin : dq_delay
	 wiredelay #
	   (
            .Delay_g     (TPROP_PCB_DATA),
            .Delay_rd    (TPROP_PCB_DATA_RD)
	    )
	 u_delay_dq
	   (
            .A           (ddr2_dq_fpga[dqwd]),
            .B           (ddr2_dq_sdram[dqwd]),
            .reset       (rst_n)
	    );
      end
   endgenerate
   genvar dqswd;
   generate
      for (dqswd = 0;dqswd < DQS_WIDTH;dqswd = dqswd+1) begin : dqs_delay
	 wiredelay #
	   (
            .Delay_g     (TPROP_DQS),
            .Delay_rd    (TPROP_DQS_RD)
	    )
	 u_delay_dqs
	   (
            .A           (ddr2_dqs_fpga[dqswd]),
            .B           (ddr2_dqs_sdram[dqswd]),
            .reset       (rst_n)
	    );
	 wiredelay #
	   (
            .Delay_g     (TPROP_DQS),
            .Delay_rd    (TPROP_DQS_RD)
	    )
	 u_delay_dqs_n
	   (
            .A           (ddr2_dqs_n_fpga[dqswd]),
            .B           (ddr2_dqs_n_sdram[dqswd]),
            .reset       (rst_n)
	    );
      end
   endgenerate
   assign ddr2_dm_sdram = ddr2_dm_sdram_tmp;
   parameter NUM_PROGRAM_WORDS=67108864;
   integer program_word_ptr, k;
   integer burst_address;
   reg [31:0] program_array [0:NUM_PROGRAM_WORDS-1]; // 1M words = 4MB
   reg [8*16-1:0] ddr2_ram_mem_line; //8*16-bits= 8 shorts (half-words)
   genvar 	  i, j;
   generate
      // if the data width is multiple of 16
      for(j = 0; j < CS_NUM; j = j+1) begin : gen_cs // Loop of 1
         for(i = 0; i < DQS_WIDTH/2; i = i+1) begin : gen // Loop of 4 (DQS_WIDTH=8)
	    initial
	      begin
// `ifdef PRELOAD_RAM
  `include "ddr2_model_preload.v"
 //`endif
	      end
	    ddr2_model u_mem0
	      (
	       .ck        (ddr2_ck_sdram[CLK_WIDTH*i/DQS_WIDTH]),
	       .ck_n      (ddr2_ck_n_sdram[CLK_WIDTH*i/DQS_WIDTH]),
	       .cke       (ddr2_cke_sdram[j]),
	       .cs_n      (ddr2_cs_n_sdram[CS_WIDTH*i/DQS_WIDTH]),
	       .ras_n     (ddr2_ras_n_sdram),
	       .cas_n     (ddr2_cas_n_sdram),
	       .we_n      (ddr2_we_n_sdram),
	       .dm_rdqs   (ddr2_dm_sdram[(2*(i+1))-1 : i*2]),
	       .ba        (ddr2_ba_sdram),
	       .addr      (ddr2_a_sdram),
	       .dq        (ddr2_dq_sdram[(16*(i+1))-1 : i*16]),
	       .dqs       (ddr2_dqs_sdram[(2*(i+1))-1 : i*2]),
	       .dqs_n     (ddr2_dqs_n_sdram[(2*(i+1))-1 : i*2]),
	       .rdqs_n    (),
	       .odt       (ddr2_odt_sdram[ODT_WIDTH*i/DQS_WIDTH])
	       );
         end
      end
   endgenerate
`endif
`ifdef VCD
   reg vcd_go = 0;
   always @(vcd_go)
     begin : fjfk
//	   integer r, t;
// `ifdef VCD_DELAY
//	#(`VCD_DELAY);
/*for(r = 0; r < 1000; r = r + 1)begin
  for(t = 0; t < 10; t = t + 1) begin
    #(331900000);
  end
end*/
// `endif
	// Delay by x insns
 `ifdef VCD_DELAY_INSNS
	#10; // Delay until after the value becomes valid
	while (monitor.insns < `VCD_DELAY_INSNS)
	  @(posedge clk);
 `endif
 `ifdef SIMULATOR_MODELSIM
	// Modelsim can GZip VCDs on the fly if given in the suffix
  `define VCD_SUFFIX   ".vcd.gz"
 `else
  `define VCD_SUFFIX   ".vcd"
 `endif
 `define TEST_NAME_STRING "hwinv"
	$display("* VCD in %s\n", {"",`TEST_NAME_STRING,`VCD_SUFFIX});
	$dumpfile({"",`TEST_NAME_STRING,`VCD_SUFFIX});
 `ifndef VCD_DEPTH
  `define VCD_DEPTH 0
 `endif
	$dumpvars(/*`VCD_DEPTH*/3, orpsoc_testbench.dut.or1200_top0.or1200_cpu);
/*for(r = 0; r < 1000; r = r + 1)begin
  for(t = 0; t < 10; t = t + 1) begin
    #(2000000);
  end
end
	$finish;
*/
     end
`endif //  `ifdef VCD
   initial
     begin
	$display("\n* Starting simulation of design RTL.\n* Test: %s\n",
		 `TEST_NAME_STRING );
`ifdef VCD
	vcd_go = 1;
`endif
     end // initial begin
`ifdef END_TIME
   initial begin
      #(`END_TIME);
      $display("* Finish simulation due to END_TIME being set at %t", $time);
      $finish;
   end
`endif
`ifdef END_INSNS
   initial begin
      #10
	while (monitor.insns < `END_INSNS)
	  @(posedge clk);
      $display("* Finish simulation due to END_INSNS count (%d) reached at %t",
	       `END_INSNS, $time);
      $finish;
   end
`endif
`ifdef UART0
   // UART0 decoder
   uart_decoder
     #(
	.uart_baudrate_period_ns(8680) // 115200 baud = period 8.68uS
	)
   uart0_decoder
     (
      .clk(clk),
      .uart_tx(uart0_stx_pad_o)
      );
   // Loopback UART lines
   assign uart0_srx_pad_i = uart0_stx_pad_o;
`endif //  `ifdef UART0
endmodule